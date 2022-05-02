<template>
  <section class="vh-100" style="background-color: #eee;">
    <div class="home">
      <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-lg-12 col-xl-11">
            <div class="card text-black" style="border-radius: 25px;">
              <div class="card-body p-md-5">
                <h1>List heroes</h1>
                <router-link class="btn btn-success" to="/createhero">Create Hero</router-link>
                <div class="row justify-content-center">
                    <table class="table">
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Name</th>
                          <th scope="col">Rank</th>
                          <th scope="col">Location</th>
                          <th scope="col">Action</th>
                        </tr>
                      </thead>
                      <tbody >
                        <tr v-for="(hero, index) in heroes" v-bind:key="hero">
                        <td>{{ index }}</td>
                        <td>{{ hero.name }}</td>
                        <td>{{ hero.rank }}</td>
                        <td>{{ hero.location.lat + " " + hero.location.lng}}</td>
                        <td>
                          <router-link class="btn btn-warning" v-bind:to="'/edithero/' + hero._id.$oid">Edit user</router-link>
                          <button type="button" v-on:click="delete_hero(hero._id.$oid)" class="btn btn-danger">Delete</button>
                        </td>
                      </tr>
                      </tbody>
                    </table>
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
import store from '@/store/index.js';
import router from '@/router/index.js';
import axios from "axios";

export default {
  name: 'HeroesView',
  components: {},
  data(){
    return {
      heroes: this.getHeroes()
    }
  },
  methods: {
    async getHeroes() {
      let res = await axios.get('http://localhost:3000/heroes',
      {
        headers: 
        {'Authorization': store.getters.auth }
      });
    this.heroes = res.data
    },
    async delete_hero(id) {
      await axios.get('http://localhost:3000/heroes/' + id,
        {
          headers: 
          {'Authorization': store.getters.auth }
        });
      router.push('/heroeslist')
    }
  },
  beforeRouteEnter: async function() {
    if (store.getters.auth == '') {
      router.push('/')
    }
  }
}

</script>
