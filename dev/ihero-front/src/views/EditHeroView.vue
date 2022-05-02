<template>
  <section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Create Hero</p>

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
                      <label class="form-label" for="form3Example3c">Rank</label>
                      <select id="rank">
                        <option value="S">S</option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                      </select>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <label class="form-label" for="form3Example4c">latitude</label>
                      <input type="number" step="0.01" id="lat" class="form-control" />
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <label class="form-label" for="form3Example4cd">longitude</label>
                      <input type="number" step="0.01" id="lng" class="form-control" />
                    </div>
                  </div>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button type="button"  v-on:click="create_hero" class="btn btn-primary btn-lg">Edit Hero</button>
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
  import {useRoute} from "vue-router";

  export default {
    components: {},
    mounted:function(){
      this.getHero()
    },
    data(){
      const route = useRoute();

      return {
        id: route.params.id
      }
    },
    methods: {
        async create_hero() {
          if (validade()) {
            await axios.put('http://localhost:3000/heroes/' + this.id,
              {
                "name": document.getElementById('name').value,
                "rank": document.getElementById('rank').value,
                  "location": {
                    "lat": document.getElementById('lat').value.toString(),
                    "lng": document.getElementById('lng').value.toString()
                  }
              },
              {
                headers: {'Authorization': this.$store.getters.auth }
              }
              );
            this.$router.push('/heroeslist')
          }
        },
        async getHero() {
          let res = await axios.get('http://localhost:3000/heroes/' + this.id,
          {
            headers: 
            {'Authorization': this.$store.getters.auth }
          });
          (res.data)
          document.getElementById("name").value = res.data.name;
          document.getElementById("rank").value = res.data.rank;
          document.getElementById("lat").value = parseFloat(res.data.location.lat);
          document.getElementById("lng").value = res.data.location.lng;
          this.heroes = res.data
        }
      }
  }

  function validade() {
    if (document.getElementById('name').value == '') {
          alert("Preencha o campo name.");
          return false;
    }
    if (document.getElementById('rank').value == '') {
          alert("Preencha o campo email.");
          return false;
    }
    if (document.getElementById('lat').value == '') {
          alert("Preencha o campo latitude.");
          return false;
    }
    if (document.getElementById('lng').value == '') {
          alert("Preencha o campo longitude.");
          return false;
    }
    return true;
  }
</script>
