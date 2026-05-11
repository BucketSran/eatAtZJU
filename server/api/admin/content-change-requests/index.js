const { requirePlatformAdmin } = require('../../_shared/auth.cjs')
const { readJsonBody } = require('../../_shared/requestBody.cjs')

const ALLOWED_ACTIONS = new Set(['demote', 'archive', 'edit', 'add'])
const ALLOWED_STATUSES = new Set(['draft', 'queued', 'materialized', 'rejected'])
const ALLOWED_SUBMISSION_TYPES = new Set(['restaurant', 'correction'])
const MANUALLY_MUTABLE_STATUSES = new Set(['rejected'])
const QUEUEABLE_STATUSES = new Set(['draft', 'queued'])
const TERMINAL_STATUSES = new Set(['materialized', 'rejected'])
const MAX_PAYLOAD_BYTES = 20_000
const MAX_BATCH_IDS = 50

function isPlainObject(value) {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

function cleanText(value, fallback = '') {
  return typeof value === 'string' && value.trim() ? value.trim() : fallback
}

function getIds(body) {
  const ids = typeof body.id === 'string' && body.id
    ? [body.id]
    : Array.isArray(body.ids)
      ? body.ids.filter((id) => typeof id === 'string' && id)
      : []
  return [...new Set(ids)]
}

function mapContentChange(row) {
  return {
    id: row.id,
    action: row.action,
    status: row.status,
    targetTable: row.target_table,
    targetId: row.target_id,
    targetName: row.target_name,
    summary: row.summary,
    payload: row.payload || {},
    submissionType: row.submission_type,
    submissionPayload: row.submission_payload || {},
    sourceSubmissionId: row.source_submission_id,
    requesterId: row.requester_id,
    reviewerId: row.reviewer_id,
    reviewedAt: row.reviewed_at,
    materializedAt: row.materialized_at,
    materializedTargetTable: row.materialized_target_table,
    materializedTargetId: row.materialized_target_id,
    queuedAt: row.queued_at,
    reviewNote: row.review_note,
    createdAt: row.created_at,
    updatedAt: row.updated_at
  }
}

function buildStats(rows) {
  const byStatus = {}
  const byAction = {}
  for (const row of rows) {
    byStatus[row.status] = (byStatus[row.status] || 0) + 1
    byAction[row.action] = (byAction[row.action] || 0) + 1
  }
  return { total: rows.length, byStatus, byAction }
}

function validateRequestInput(input) {
  const action = cleanText(input.action)
  const targetName = cleanText(input.targetName || input.target_name)
  const summary = cleanText(input.summary)
  const submissionType = cleanText(input.submissionType || input.submission_type)
  const payload = isPlainObject(input.payload) ? input.payload : null
  const submissionPayload = isPlainObject(input.submissionPayload || input.submission_payload) ? (input.submissionPayload || input.submission_payload) : null

  if (!ALLOWED_ACTIONS.has(action)) return { error: 'Invalid content change action' }
  if (!targetName || targetName.length > 120) return { error: 'Target name is required and must be 120 characters or less' }
  if (!summary || summary.length > 1000) return { error: 'Summary is required and must be 1000 characters or less' }
  if (!ALLOWED_SUBMISSION_TYPES.has(submissionType)) return { error: 'Invalid submission type' }
  if (!payload || !submissionPayload) return { error: 'Payload and submissionPayload must be objects' }
  if (Buffer.byteLength(JSON.stringify(payload), 'utf8') > MAX_PAYLOAD_BYTES) return { error: 'Payload too large', status: 413 }
  if (Buffer.byteLength(JSON.stringify(submissionPayload), 'utf8') > MAX_PAYLOAD_BYTES) return { error: 'Submission payload too large', status: 413 }

  if (['demote', 'archive', 'edit'].includes(action)) {
    if (!cleanText(input.targetId || input.target_id)) return { error: `${action} requires targetId` }
    if (submissionType !== 'correction') return { error: `${action} must create a correction submission` }
    if (submissionPayload.opsAction !== action) return { error: 'submissionPayload.opsAction must match the content change action' }
  }

  if (action === 'edit') {
    const patch = isPlainObject(payload.patch) ? payload.patch : null
    if (!patch || !Object.keys(patch).length) return { error: 'edit requires a non-empty patch object' }
  }

  if (action === 'add') {
    if (submissionType !== 'restaurant') return { error: 'add must create a restaurant submission' }
    if (cleanText(input.targetId || input.target_id)) return { error: 'add cannot target an existing restaurant' }
    if (submissionPayload.opsAction !== 'add') return { error: 'submissionPayload.opsAction must be add' }
    if (!cleanText(submissionPayload.title) || !cleanText(submissionPayload.campus) || !cleanText(submissionPayload.area)) {
      return { error: 'add requires title, campus, and area in submissionPayload' }
    }
  }

  return {
    data: {
      action,
      status: 'draft',
      target_table: 'restaurants',
      target_id: cleanText(input.targetId || input.target_id) || null,
      target_name: targetName,
      summary,
      payload,
      submission_type: submissionType,
      submission_payload: submissionPayload
    }
  }
}

async function insertAuditLog(client, payload) {
  const { error } = await client.from('audit_logs').insert(payload)
  if (error) throw error
}

async function insertSubmissionForRequest(client, requesterId, request) {
  if (request.source_submission_id) return request.source_submission_id

  const { data: existing, error: existingError } = await client
    .from('submissions')
    .select('id')
    .eq('source_content_change_request_id', request.id)
    .maybeSingle()

  if (existingError) throw existingError
  if (existing?.id) return existing.id

  const { data, error } = await client
    .from('submissions')
    .insert({
      type: request.submission_type,
      payload: request.submission_payload,
      submitter_id: requesterId,
      status: 'pending',
      source_content_change_request_id: request.id
    })
    .select('id')
    .single()

  if (error?.code === '23505') {
    const { data: racedExisting, error: racedError } = await client
      .from('submissions')
      .select('id')
      .eq('source_content_change_request_id', request.id)
      .maybeSingle()
    if (racedError) throw racedError
    if (racedExisting?.id) return racedExisting.id
  }
  if (error) throw error
  return data.id
}

async function submitRequestsToQueue(client, userId, ids) {
  const { data: rows, error } = await client
    .from('content_change_requests')
    .select('*')
    .in('id', ids)

  if (error) throw error
  const updated = []

  for (const row of rows || []) {
    if (TERMINAL_STATUSES.has(row.status)) {
      updated.push(row)
      continue
    }
    if (!QUEUEABLE_STATUSES.has(row.status)) continue

    const submissionId = await insertSubmissionForRequest(client, userId, row)
    const now = new Date().toISOString()
    const { data, error: updateError } = await client
      .from('content_change_requests')
      .update({
        status: 'queued',
        source_submission_id: submissionId,
        queued_at: row.queued_at || now
      })
      .eq('id', row.id)
      .in('status', ['draft', 'queued'])
      .select('*')
      .single()

    if (updateError) throw updateError
    if (row.status === 'draft') {
      await insertAuditLog(client, {
        actor_id: userId,
        action: 'content_change_request_queue',
        target_table: 'content_change_requests',
        target_id: row.id,
        before_data: row,
        after_data: data,
        reason: 'Queued published content change request'
      })
    }
    updated.push(data)
  }

  return updated.map(mapContentChange)
}

module.exports = async function handler(req, res) {
  const auth = await requirePlatformAdmin(req)
  if (auth.error) return res.status(auth.status).json({ error: auth.error })

  if (req.method === 'GET') {
    const limit = Math.min(Math.max(Number(req.query?.limit) || 80, 1), 200)
    let query = auth.client
      .from('content_change_requests')
      .select('*')
      .order('created_at', { ascending: false })
      .limit(limit)

    if (ALLOWED_STATUSES.has(req.query?.status)) query = query.eq('status', req.query.status)
    if (ALLOWED_ACTIONS.has(req.query?.action)) query = query.eq('action', req.query.action)

    const { data, error } = await query
    if (error) return res.status(500).json({ error: 'Failed to list content change requests' })
    const rows = data || []
    const normalizedKeyword = cleanText(req.query?.q).toLowerCase()
    const filtered = normalizedKeyword
      ? rows.filter((row) => [row.target_name, row.summary, row.target_id].filter(Boolean).join(' ').toLowerCase().includes(normalizedKeyword))
      : rows

    return res.status(200).json({
      requests: filtered.map(mapContentChange),
      stats: buildStats(filtered)
    })
  }

  if (req.method === 'POST') {
    try {
      const body = await readJsonBody(req)
      const input = body.request && isPlainObject(body.request) ? body.request : body
      const validation = validateRequestInput(input)
      if (validation.error) return res.status(validation.status || 400).json({ error: validation.error })

      const { data: created, error } = await auth.client
        .from('content_change_requests')
        .insert({ ...validation.data, requester_id: auth.user.id })
        .select('*')
        .single()

      if (error) throw error
      await insertAuditLog(auth.client, {
        actor_id: auth.user.id,
        action: 'content_change_request_create',
        target_table: 'content_change_requests',
        target_id: created.id,
        before_data: null,
        after_data: created,
        reason: created.summary
      })
      if (body.submitToQueue) {
        const [queued] = await submitRequestsToQueue(auth.client, auth.user.id, [created.id])
        return res.status(201).json({ request: queued })
      }

      return res.status(201).json({ request: mapContentChange(created) })
    } catch (error) {
      if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
      return res.status(500).json({ error: 'Failed to create content change request' })
    }
  }

  if (req.method === 'PATCH') {
    try {
      const body = await readJsonBody(req)
      const ids = getIds(body)
      if (!ids.length) return res.status(400).json({ error: 'Missing content change request ids' })
      if (ids.length > MAX_BATCH_IDS) return res.status(400).json({ error: `Too many content change requests; max ${MAX_BATCH_IDS} per batch` })

      if (body.submitToQueue) {
        const requests = await submitRequestsToQueue(auth.client, auth.user.id, ids)
        return res.status(200).json({ requests })
      }

      const status = cleanText(body.status)
      if (!ALLOWED_STATUSES.has(status)) return res.status(400).json({ error: 'Invalid content change request status' })
      if (!MANUALLY_MUTABLE_STATUSES.has(status)) return res.status(400).json({ error: 'This status can only be changed by the review workflow' })

      const reviewNote = typeof body.reviewNote === 'string' && body.reviewNote.trim() ? body.reviewNote.slice(0, 500) : null
      const { data: beforeRows, error: readError } = await auth.client
        .from('content_change_requests')
        .select('*')
        .in('id', ids)

      if (readError) throw readError
      const mutableIds = (beforeRows || [])
        .filter((row) => row.status === 'draft' || row.status === 'queued')
        .map((row) => row.id)

      if (!mutableIds.length) return res.status(409).json({ error: 'No mutable content change requests found' })

      const update = { status, review_note: reviewNote }
      if (status === 'rejected') {
        update.reviewer_id = auth.user.id
        update.reviewed_at = new Date().toISOString()
      }

      const { data, error } = await auth.client
        .from('content_change_requests')
        .update(update)
        .in('id', mutableIds)
        .select('*')

      if (error) throw error
      const beforeById = new Map((beforeRows || []).map((row) => [row.id, row]))
      for (const row of data || []) {
        await insertAuditLog(auth.client, {
          actor_id: auth.user.id,
          action: 'content_change_request_status_change',
          target_table: 'content_change_requests',
          target_id: row.id,
          before_data: beforeById.get(row.id) || null,
          after_data: row,
          reason: reviewNote || `Status changed to ${status}`
        })
      }
      return res.status(200).json({ requests: (data || []).map(mapContentChange) })
    } catch (error) {
      if (error instanceof SyntaxError) return res.status(400).json({ error: 'Invalid JSON body' })
      return res.status(500).json({ error: 'Failed to update content change requests' })
    }
  }

  res.setHeader('Allow', 'GET, POST, PATCH')
  return res.status(405).json({ error: 'Method not allowed' })
}
