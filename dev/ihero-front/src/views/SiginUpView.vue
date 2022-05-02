<template>
  <section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                <form class="mx-1 mx-md-4">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <label class="form-label" for="form3Example1c">Your Name</label>
                      <input type="text" id="name" class="form-control" />
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <label class="form-label" for="form3Example3c">Your Email</label>
                      <input type="email" id="email" class="form-control" />
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <label class="form-label" for="form3Example4c">Password</label>
                      <input type="password" id="password" class="form-control" />
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <label class="form-label" for="form3Example4cd">Repeat your password</label>
                      <input type="password" id="confirmation_password" class="form-control" />
                    </div>
                  </div>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button type="button"  v-on:click="create_user" class="btn btn-primary btn-lg">Register</button>
                  </div>
                </form>
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
    name: 'RegistrationView',
    components: {},
    methods: {
        async create_user() {
          if (validade()) {
            await axios.post('http://localhost:3000/users',
              {
                "name": document.getElementById('name').value,
                "email": document.getElementById('email').value,
                "password": document.getElementById('password').value
              });
            this.$router.push('/')
          }
        }
      }
  }

  function validade() {
    if (
        document.getElementById('password').value !=
        document.getElementById('confirmation_password').value) {
          alert("As senhas estão diferentes.");
          return false;
    }
    if (document.getElementById('name').value == '') {
          alert("Preencha o campo name.");
          return false;
    }
    if (document.getElementById('email').value == '') {
          alert("Preencha o campo email.");
          return false;
    }
    if (document.getElementById('password').value == '') {
          alert("Preencha o campo senha.");
          return false;
    }
    return true;
  }
</script>
