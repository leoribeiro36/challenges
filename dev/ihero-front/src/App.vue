<template>
  <div class="vue-tempalte">
    <!-- Navigation -->
    <nav class="navbar shadow bg-white rounded justify-content-between flex-nowrap flex-row">
      <a class="navbar-brand" href="/heroeslist">Ihero</a>
      <div class="container">
        <ul class="nav navbar-nav flex-row float-right">
          <li class="nav-item">
            <!-- <router-link class="btn btn-outline-primary" to="/registration">Sign up</router-link> -->
          </li>
        </ul>
      </div>
    </nav>
    <div class="App">
      <div class="vertical-center">
        <div class="inner-block">
          <router-view />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// const { io } = require("socket.io-client");

export default {
  name: 'App',
  data: function() {
    return {
      connection: null
    }
  },
  created: function() {
    var socket = require('socket.io-client')('zrp-challenge-socket.herokuapp.com');
    socket.on('connect', function(){
      console.log("deu bom")
    });
    socket.on('event', function(data){
      console.log(data)
    });
    
  }
}
</script>


<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
