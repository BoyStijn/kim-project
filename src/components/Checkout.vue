<template>
  <li class="list-group-item d-flex justify-content-between lh-sm">
    <div>
      <h6 class="my-0">{{title}}</h6>
      <small class="text-muted">Amount: {{count}}</small>
    </div>
    <span class="text-muted">€{{(this.price * this.count).toFixed(2)}}</span>
  </li>
</template>

<script>
export default {
  name: 'checkout-entry',
  props: {
    title: String,
    price: Number,
    count: Number
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
