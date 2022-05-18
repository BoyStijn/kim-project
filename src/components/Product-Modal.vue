<template>
  <div class="list-group-item py-3 lh-tight text-white" style="background-color: black;">
    <div class="d-flex w-100 align-items-center justify-content-between">
      <strong class="fs-4 mb-1">{{title}}</strong>
      <div class="input-group mx-3" style="max-width: 50%;">
        <button @click="updatecount(this.ShopCount-1)" type="button" class="btn text-white">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
            <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
          </svg>
        </button>
        <input v-model="ShopCount" type="text" class="form-control rounded" placeholder="Amount..." aria-label="Search">
        <button @click="updatecount(this.ShopCount+1)" type="button" class="btn text-white">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
          </svg>
        </button>
      </div>
    </div>
    <div class="col-10 mb-1">Price: €{{(this.ShopCount * this.price).toFixed(2)}}</div>
  </div>
</template>

<script>
export default {
  name: 'product-modal',
  props: {
    title: String,
    count: Number,
    price: Number,
    prodid: Number
  },
  data() {
    return {
      ShopCount: this.count,
      CountPrev: this.count
    }
  },
  methods: {
   updatecount(c) {
     this.$emit('updatecount', {id: this.prodid, count: c})
     this.ShopCount = c;
    }
  },
  updated() {
    console.log(this.count);
    if (this.ShopCount == this.CountPrev) {
      this.ShopCount = this.count;
      this.CountPrev = this.count;
    } 
  },
  watch: {
    ShopCount(newc) {
      console.log(newc)
      if (!Number.isInteger(parseInt(newc))) return;
      this.updatecount(newc);
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
