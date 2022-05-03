<template>
  <section class="vh-100" style="background-color: #eee;">
    <div class="home">
      <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-lg-12 col-xl-11">
            <div class="card text-black" style="border-radius: 25px;">
              <div class="card-body p-md-5">
                <h1>List events</h1>
                <div class="row justify-content-center">
                    <table class="table">
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Monster name</th>
                          <th scope="col">Danger level</th>
                          <th scope="col">Location</th>
                        </tr>
                      </thead>
                      <tbody >
                        <tr v-for="(event, index) in events" v-bind:key="event">
                        <td>{{ index }}</td>
                        <td>{{ event.monsterName }}</td>
                        <td>{{ event.dangerLevel }}</td>
                        <td>{{ event.location.lat + " " + event.location.lng}}</td>
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
  name: 'EventsView',
  components: {},
  data(){
    return {
      events: this.getEvents()
    }
  },
  methods: {
    async getEvents() {
      let res = await axios.get('http://localhost:3000/events',
      {
        headers: 
        {'Authorization': store.getters.auth }
      });
    this.events = res.data
    }
  },
  beforeRouteEnter: async function() {
    if (store.getters.auth == '') {
      router.push('/')
    }
  }
}

</script>
