<template>
  <section class="h-100 gradient-form" style="background-color: #eee;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-10">
        <div class="card rounded-3 text-black">
          <div class="row g-0">
            <div class="col-lg-6">
              <div class="card-body p-md-5 mx-md-4">

                <div class="text-center">
                  <img src="https://ih1.redbubble.net/image.951488911.9307/st,small,507x507-pad,600x600,f8f8f8.jpg"
                    style="width: 185px;" alt="logo">
                  <h4 class="mt-1 mb-5 pb-1">Hero association</h4>
                </div>

                <form onsubmit="return login()">
                  <p>Please login to your account</p>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example11">Username</label>
                    <input type="email" id="email" class="form-control"
                      placeholder="Phone number or email address" />
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example22">Password</label>
                    <input type="password" id="password" class="form-control" />
                  </div>

                  <div class="text-center pt-1 mb-5 pb-1">
                    <button type="button" v-on:click="login" class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3">Log
                      in</button>
                  </div>

                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">Don't have an account?</p>
                    <router-link class="btn btn-outline-danger" to="/siginup">Sign up</router-link>
                  </div>

                </form>

              </div>
            </div>
            <div class="bimg col-lg-6 d-flex align-items-center gradient-custom-2">
              <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                <h2 class="mb-4">You always can count on</h2>
                <h1 class="mb-4 text-danger">HEROES!</h1>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</template>

<script>
  import axios from "axios";

  export default {
    name: 'LoginView',
    components: {},
    methods: {
      async login() {
        let res = await axios.post('http://localhost:3000/authenticate',
        {
          "email": document.getElementById('email').value,
          "password": document.getElementById('password').value
        });
        
        if(res.status == 200) {
          let data = res.data;
          this.$store.commit('change', data.auth_token)
          this.$router.push('/heroeslist')
        } else {
          alert("Algo deu errado, tente novamente mais tarde.");
        }
      }
    }
  }

</script>

<style scoped>
.bimg {
  background-image: url("https://img.freepik.com/free-photo/data-exchange-global-network-world-earth-night-city-lights-from-orbit_112293-8.jpg");
  background-size: cover;
}
</style>