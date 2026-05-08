Component({
  properties: {
    item: {
      type: Object,
      value: {}
    },
    compact: {
      type: Boolean,
      value: false
    }
  },

  methods: {
    handleTap() {
      this.triggerEvent('open', { id: this.properties.item.id })
    },

    handleFavorite() {
      this.triggerEvent('favorite', { id: this.properties.item.id })
    }
  }
})
