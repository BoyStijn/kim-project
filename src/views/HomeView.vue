<template>
  <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom sticky-top">
    <div class="d-flex align-items-center w-100">
        <div class="d-sm-flex d-none align-items-center mx-3 col-lg-4 mb-2 mb-lg-0 text-white text-decoration-none" >
          <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-box2-heart" viewBox="0 0 16 16">
            <path d="M8 7.982C9.664 6.309 13.825 9.236 8 13 2.175 9.236 6.336 6.31 8 7.982Z"/>
            <path d="M3.75 0a1 1 0 0 0-.8.4L.1 4.2a.5.5 0 0 0-.1.3V15a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1V4.5a.5.5 0 0 0-.1-.3L13.05.4a1 1 0 0 0-.8-.4h-8.5Zm0 1H7.5v3h-6l2.25-3ZM8.5 4V1h3.75l2.25 3h-6ZM15 5v10H1V5h14Z"/>
          </svg>
          <p class="mx-3 fs-4 mb-lg-0 mt-lg-0">Webshop</p>
        </div>

      <div class="d-flex align-items-center w-100">
        <div class="w-100 mx-3 me-3">
          <input v-model="searchQuery" type="search" class="form-control" placeholder="Search..." aria-label="Search">
        </div>

        <button type="button" class="btn d-block text-white text-decoration-none" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
          <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi me-2" viewBox="0 0 20 20">
            <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9H2zM1 7v1h14V7H1zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5z"/>
            <g id="counter">
              <circle style="fill:black;stroke:currentColor;stroke-width:1;stroke-miterlimit:10;" cx="14" cy="14" r="4"></circle>
              <text x="50%" y="50%" text-anchor="middle" stroke="currentColor" stroke-width="0.5px" style="font-size: 4px;" dx="4" dy="5.5">{{Object.keys(this.ShoppingCart).length}}</text>
            </g>
          </svg>
        </button>
      </div>
    </div>
  </header>

  <main>

    <div class="list-group list-group-flush border-bottom scrollarea">
      <Product @addtocart="(id) => addtocart(id)" v-for="(item, index) in resultQuery" :key="index" :title="item.title" :prodid="item.id" :price="item.price" :description="item.description" />
    </div>

  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">© 2022–2026 Webshop</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="mailto:email@example.com">Email</a></li>
    </ul>
  </footer>

  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" >
    <div class="modal-dialog">
      <div class="modal-content" style="background-color: black;">
        <div class="modal-header" style="border-bottom: 1px solid #9f9f9f;">
          <h5 class="modal-title text-white" id="staticBackdropLabel">Shopping Cart</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <ProductModal @updatecount="(id) => updatecart(id)" v-for="(item2, index2) in carttomodal" :key="index2" :title="item2.title" :prodid="parseInt(item2.id)" :price="item2.price" :count="item2.count" />
          <div class="list-group-item py-3 lh-tight text-white" style="background-color: black;">
            <div class="d-flex w-100 align-items-center justify-content-between">
              <strong class="fs-4 mb-1">Totaal: </strong>
              <p class="mb-1 fs-4 mx-1 text-white" style="margin-right: .5rem !important;">€{{compshoptotal.toFixed(2)}}</p>
            </div>
          </div>
        </div>
        <div class="modal-footer d-flex justify-content-between" style="border-top: 1px solid #9f9f9f;">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" data-bs-dismiss="modal" @click="sendtocheck">Checkout</button>
        </div>
      </div>
    </div>
  </div>

</template>

<script>
// @ is an alias to /src
import Product from '@/components/Product';
import ProductModal from '@/components/Product-Modal';


export default {
  name: 'HomeView',
  components: {
    Product,
    ProductModal
  },
  data() {
    return {
      IDtoINDEX: {},
      searchQuery: null,
      ShoppingCart: {},
      ShopData: null
    }
  },
  methods: {
    addtocart(id) {
      console.log("adding: " + id)
      let data = this.ShoppingCart[id];
      if (data) {
        data++;
      } else {
        data = 1;
      }
      this.ShoppingCart[id] = data;
    },
    updatecart(obj) {
      if (obj.count <= 0) {
        delete this.ShoppingCart[obj.id];
      } else {
        this.ShoppingCart[obj.id] = obj.count;
      }

      if (Object.keys(this.ShoppingCart).length > 0) {
        const parsed = JSON.stringify(this.carttomodal);
        localStorage.setItem('shop', parsed);
      } else {
        localStorage.removeItem('shop');
      }
    },
    computeobj(obj) {
      if (obj && this.ShopData) {
        console.log(obj)
        const count = this.ShoppingCart[obj];
        console.log(count)
        const index = this.IDtoINDEX[obj];
        console.log(this.IDtoINDEX);
        console.log(index);
        if (index === null) return null;
        const data = this.ShopData[index];
        console.log(data)
        return {id: obj, count: count, price: data.price, title: data.title};
      }
    },
    mapidtoindex() {
      for (let i = 0; i < this.ShopData.length; i++) {
        let id = this.ShopData[i].id;
        console.log({id: id, index: i})
        this.IDtoINDEX[id] = i;
      }
    },
    sendtocheck() {
      if (Object.keys(this.ShoppingCart).length > 0) {
        const parsed = JSON.stringify(this.carttomodal);
        localStorage.setItem('shop', parsed);
        this.$router.push("/checkout")
      } else {
        localStorage.removeItem('shop');
      }
    },
    checkstorage() {
      let data = null;
      if (localStorage.getItem('shop')) {
        try {
          data = JSON.parse(localStorage.getItem('shop'));
          for (let i = 0; i < data.length; i++) {
            let entry = data[i];
            this.ShoppingCart[entry.id] = entry.count;
          }
        } catch(e) {
          localStorage.removeItem('shop');
        }
      }
    },
    getproducts() {
      let xhr = new XMLHttpRequest();
      let the = this;
      xhr.open('Get', window.location.origin + '/scripts/getprod.php', true);
      xhr.onload = function() {
        console.log(xhr.response);
        the.ShopData = JSON.parse(xhr.response);
        the.mapidtoindex();
      }
      xhr.send();
    }
  },
  computed: {
    resultQuery() {
      if (this.searchQuery) {
        return this.ShopData.filter(item => {
          return this.searchQuery
            .toLowerCase()
            .split(" ")
            .every(v => item.title.toLowerCase().includes(v));
        });
      } else {
        return this.ShopData;
      }
    },
    carttomodal() {
      let arr = []
      console.log("shopping cart: " + this.ShopData)
      if (!this.ShopData) return arr;
      for (const item in this.ShoppingCart) {
        console.log("getting info for: " + item)
        let obj = this.computeobj(item);
        console.log("object info: " + obj)
        if (!obj) continue;
        arr.push(obj);
      }
      return arr;
    },
    compshoptotal() {
      let count = 0;
      if (!this.ShopData) return count;
      for (const item in this.ShoppingCart) {
          let data = this.ShoppingCart[item];
          if (data && data > 0) {
            let price = this.ShopData[this.IDtoINDEX[item]].price;
            count += (data * price);
          }
      }
      return count
    }
  },
  mounted() {
    this.getproducts();
    this.checkstorage();
  }
}
</script>
