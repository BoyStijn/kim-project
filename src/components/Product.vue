<template>
  <div class="list-group-item py-3 lh-tight text-white" style="background-color: black;">
    <div class="d-flex w-100 align-items-center justify-content-between">
      <strong class="fs-4 mb-1">{{title}}</strong>
      <button @click="addToCart" class="btn btn btn-outline-light text-muted small d-flex align-items-center justify-content-between">
        <p class="mb-1 fs-4 mx-1 text-white" style="margin-right: .5rem !important;">€{{this.price.toFixed(2)}}</p>
        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#0356fc" class="bi bi-plus-square" viewBox="0 0 16 16">
          <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
          <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
        </svg>
      </button>
    </div>
    <div class="col-10 mb-1 small">{{description}}</div>
  </div>
</template>

<script>
export default {
  name: 'product-entry',
  props: {
    title: String,
    description: String,
    price: Number,
    prodid: Number
  },
  methods: {
   addToCart() {
     this.$emit('addtocart', this.prodid)
   }
 }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
