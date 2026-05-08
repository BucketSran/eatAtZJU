const seedRepository = require('./restaurantService.cjs')
const supabaseRepository = require('./supabaseRestaurantRepository.cjs')

function shouldDisableFallback() {
  return process.env.SUPABASE_DISABLE_FALLBACK === 'true'
}

async function withSupabaseFallback(operationName, supabaseOperation, seedOperation) {
  if (!supabaseRepository.isSupabaseConfigured()) {
    return {
      data: seedOperation(),
      source: 'seed',
      fallbackReason: 'supabase_not_configured'
    }
  }

  try {
    return {
      data: await supabaseOperation(),
      source: 'supabase'
    }
  } catch (error) {
    if (shouldDisableFallback()) throw error
    console.warn(`[api] ${operationName} Supabase fallback: ${error.message}`)
    return {
      data: seedOperation(),
      source: 'seed',
      fallbackReason: 'supabase_error'
    }
  }
}

async function listRestaurants(query = {}) {
  return withSupabaseFallback(
    'listRestaurants',
    () => supabaseRepository.listRestaurants(query),
    () => seedRepository.listRestaurants(query)
  )
}

async function getRestaurantDetail(id, query = {}) {
  return withSupabaseFallback(
    'getRestaurantDetail',
    () => supabaseRepository.getRestaurantDetail(id, query),
    () => seedRepository.getRestaurantDetail(id, query)
  )
}

async function getRecommendedRestaurant(query = {}) {
  return withSupabaseFallback(
    'getRecommendedRestaurant',
    () => supabaseRepository.getRecommendedRestaurant(query),
    () => seedRepository.getRecommendedRestaurant(query)
  )
}

async function getRandomRestaurant(query = {}) {
  return withSupabaseFallback(
    'getRandomRestaurant',
    () => supabaseRepository.getRandomRestaurant(query),
    () => seedRepository.getRandomRestaurant(query)
  )
}

function getMetadata() {
  return seedRepository.getMetadata()
}

module.exports = {
  getMetadata,
  getRandomRestaurant,
  getRecommendedRestaurant,
  getRestaurantDetail,
  listRestaurants
}
