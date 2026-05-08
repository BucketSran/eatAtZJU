const fs = require('fs')
const path = require('path')
const postgres = require('postgres')

const root = path.resolve(__dirname, '..')
const migrationsDir = path.join(root, 'supabase', 'migrations')
const seedPath = path.join(root, 'supabase', 'seed.sql')

function usage() {
  console.log(`Usage:
  SUPABASE_DB_URL="postgresql://..." npm run supabase:apply
  SUPABASE_DB_URL="postgresql://..." npm run supabase:apply:seed

Options:
  --seed              Apply supabase/seed.sql after migrations.
  --migrations-only   Apply migrations only. This is the default.

Safety:
  The script stores applied migration filenames in app_private.schema_migrations.
  It does not print database credentials.`)
}

function getConnectionString() {
  const value = process.env.SUPABASE_DB_URL
  if (!value || value === 'server_only_for_migrations_optional') {
    throw new Error('SUPABASE_DB_URL is required. Copy the Postgres connection string from Supabase project settings.')
  }
  return value
}

function getMigrationFiles() {
  if (!fs.existsSync(migrationsDir)) throw new Error('Missing supabase/migrations directory')
  return fs
    .readdirSync(migrationsDir)
    .filter((file) => file.endsWith('.sql'))
    .sort()
    .map((file) => path.join(migrationsDir, file))
}

function createSqlClient() {
  const sslMode = process.env.SUPABASE_DB_SSL || 'require'
  return postgres(getConnectionString(), {
    max: 1,
    ssl: sslMode === 'disable' ? false : 'require',
    idle_timeout: 5,
    connect_timeout: 20
  })
}

async function ensureMigrationTable(sql) {
  await sql.unsafe('create schema if not exists app_private')
  await sql.unsafe(`
    create table if not exists app_private.schema_migrations (
      filename text primary key,
      applied_at timestamptz not null default now()
    )
  `)
}

async function isApplied(sql, filename) {
  const rows = await sql`select filename from app_private.schema_migrations where filename = ${filename}`
  return rows.length > 0
}

async function applyMigration(sql, filePath) {
  const filename = path.basename(filePath)
  if (await isApplied(sql, filename)) {
    console.log(`skip ${filename}`)
    return
  }

  const contents = fs.readFileSync(filePath, 'utf8')
  console.log(`apply ${filename}`)
  await sql.begin(async (transaction) => {
    await transaction.unsafe(contents)
    await transaction`insert into app_private.schema_migrations (filename) values (${filename})`
  })
}

async function applySeed(sql) {
  if (!fs.existsSync(seedPath)) throw new Error('Missing supabase/seed.sql. Run npm run seed:sql:write first.')
  console.log('apply seed.sql')
  await sql.unsafe(fs.readFileSync(seedPath, 'utf8'))
}

async function main() {
  const args = new Set(process.argv.slice(2))
  if (args.has('--help') || args.has('-h')) {
    usage()
    return
  }

  const sql = createSqlClient()
  try {
    await ensureMigrationTable(sql)
    for (const filePath of getMigrationFiles()) await applyMigration(sql, filePath)
    if (args.has('--seed')) await applySeed(sql)
    console.log('supabase apply ok')
  } finally {
    await sql.end({ timeout: 5 })
  }
}

main().catch((error) => {
  console.error(error.message)
  process.exit(1)
})
