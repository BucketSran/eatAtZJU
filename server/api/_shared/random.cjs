const crypto = require('crypto')

function getRandomIndex(length) {
  if (!Number.isFinite(length) || length <= 0) return 0
  const max = Math.floor(length)
  if (typeof crypto.randomInt === 'function') return crypto.randomInt(max)
  return Math.floor(Math.random() * max)
}

module.exports = {
  getRandomIndex
}
