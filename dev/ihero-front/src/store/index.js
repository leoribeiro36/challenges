import { createStore } from 'vuex'
import createPersistedState from "vuex-persistedstate";

export default createStore({
  state: {
    auth: ''
  },
  getters: {
    auth: state => state.auth
  },
  mutations: {
    change(state, auth) {
      state.auth = auth
    }
  },
  actions: {
  },
  modules: {
  },
  plugins: [createPersistedState()],
})
