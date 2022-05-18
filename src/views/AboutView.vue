<template>
  <div class="container">
    <main>
      <div class="py-5 text-center text-white">
        <h2>Checkout</h2>
      </div>

      <div class="row g-5">
        <div class="col-md-5 col-lg-4 order-md-last">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-primary">Your cart</span>
            <span class="badge bg-primary rounded-pill">{{(this.ShopData) ? this.ShopData.length : 0}}</span>
          </h4>
          <ul class="list-group mb-3">
            <Checkout v-for="(item, index) of ShopData" :key="index" :title="item.title" :price="item.price" :count="item.count"/>
            <li class="list-group-item d-flex justify-content-between">
              <span>Total (EUR)</span>
              <strong>€{{ShopTotal.toFixed(2)}}</strong>
            </li>
          </ul>

        </div>
        <div class="col-md-7 col-lg-8 text-white">
          <h4 class="mb-3">Shipping address</h4>
          <form class="needs-validation" novalidate="true" @submit.prevent="processorder">
            <div class="row g-3">
              <div class="col-sm-6">
                <label for="firstName" class="form-label">First name</label>
                <input v-model="fname" type="text" class="form-control" id="firstName" required>
                <div v-if="this.ErrorCode.includes(1)" class="form-error">
                  Valid first name is required.
                </div>
              </div>

              <div class="col-sm-6">
                <label for="lastName" class="form-label">Last name</label>
                <input v-model="lname" type="text" class="form-control" id="lastName" required>
                <div v-if="this.ErrorCode.includes(2)" class="form-error">
                  Valid last name is required.
                </div>
              </div>

              <div class="col-12">
                <label for="email" class="form-label">Email</label>
                <input v-model="email" type="email" class="form-control" id="email" required>
                <div v-if="this.ErrorCode.includes(3)" class="form-error">
                  Please enter a valid email address for shipping updates.
                </div>
              </div>

              <div class="col-12">
                <label for="address" class="form-label">Address</label>
                <input v-model="adres" type="text" class="form-control" id="address" required>
                <div v-if="this.ErrorCode.includes(4)" class="form-error">
                  Please enter your shipping address.
                </div>
              </div>

              <div class="col-sm-6">
                <label for="state" class="form-label">City</label>
                <input v-model="city" type="state" class="form-control" id="state" required>
                <div v-if="this.ErrorCode.includes(5)" class="form-error">
                  Please provide a valid state.
                </div>
              </div>

              <div class="col-sm-6">
                <label for="zip" class="form-label">Zip</label>
                <input v-model="zip" type="text" class="form-control" id="zip" required>
                <div v-if="this.ErrorCode.includes(6)" class="form-error">
                  Zip code required.
                </div>
              </div>
            </div>

            <hr class="my-4">

            <button ref="checkbutton" class="w-100 btn btn-primary btn-lg" type="submit">Continue...</button>
          </form>
        </div>
      </div>
    </main>

    <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">© 2022–2026 Webshop</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="mailto:email@example.com">Email</a></li>
    </ul>
  </footer>

  </div>
</template>

<script>
// @ is an alias to /src
import Checkout from '@/components/Checkout';

export default {
  name: 'HomeView',
  components: {
    Checkout
  },
  data() {
    return {
      ShopData: null,
      ShopTotal: 0,
      ErrorCode: [],
      fname: null,
      lname: null,
      email: null,
      adres: null,
      city: null,
      zip: null
    }
  },
  methods: {
    checkstorage() {
      let data = null;
      if (localStorage.getItem('shop')) {
        try {
          data = JSON.parse(localStorage.getItem('shop'));
          this.ShopData = data;
          this.calctotal();
        } catch(e) {
          localStorage.removeItem('shop');
        }
      }
    },
    calctotal() {
      let count = 0;
      for (let i = 0; i < this.ShopData.length; i++) {
        let data = this.ShopData[i];
        count += data.price * data.count;
      }
      this.ShopTotal = count;
    },
    calcshopdata() {
      let arr = []
      for (let i = 0; i < this.ShopData.length; i++) {
        let data = this.ShopData[i];
        arr.push({id: data.id, count: data.count})
      }
      return arr;
    },
    processorder() {
      this.ErrorCode = []
      if (!this.fname || this.fname == "") this.ErrorCode.push(1);
      if (!this.lname || this.lname == "") this.ErrorCode.push(2);
      if (!this.email || this.email == "") this.ErrorCode.push(3);
      if (!this.adres || this.adres == "") this.ErrorCode.push(4);
      if (!this.city || this.city == "") this.ErrorCode.push(5);
      if (!this.zip || this.zip == "") this.ErrorCode.push(6);
      if (this.ErrorCode.length > 0) return;
      var xhr = new XMLHttpRequest();
      var data = new FormData();
      data.append('order', JSON.stringify(this.calcshopdata()));
      data.append('fname', this.fname);
      data.append('lname', this.lname);
      data.append('email', this.email);
      data.append('adres', this.adres);
      data.append('city', this.city);
      data.append('zip', this.zip);

      this.$refs.checkbutton.disabled = true;
      this.$refs.checkbutton.innerHTML = "Processing..."

      try {
        let the = this;
        xhr.open("POST", window.location.origin + '/scripts/addorder.php', true);
        xhr.send(data);
        xhr.onload = function() {
          console.log(xhr.response);
          let data = JSON.parse(xhr.response);
          if (data.errored) {
            the.$refs.checkbutton.disabled = false;
            the.$refs.checkbutton.innerHTML = "An error occurred!"
          } else {
            localStorage.removeItem('shop');
            the.$refs.checkbutton.disabled = false;
            the.$refs.checkbutton.innerHTML = "Continue..."
            the.$router.push("/")
          }
        }
      } catch {
        this.$refs.checkbutton.disabled = false;
        this.$refs.checkbutton.innerHTML = "An error occurred!"
      }
    }
  },
  mounted() {
    this.checkstorage();
  }
}
</script>