import Vue from 'vue'
import Vuex from 'vuex'
import getters from './getters'
// import app from './modules/app'
// import settings from './modules/settings'
import user from './modules/user'
import plan from './modules/plan'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    user,
    plan
  },
  getters
})

export default store
