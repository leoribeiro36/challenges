import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    name: 'login',
    component: () => import('../views/LoginView.vue')
  },
  {
    path: '/siginup',
    name: 'siginup',
    component: () => import('../views/SiginUpView.vue')
  },
  {
    path: '/heroeslist',
    name: 'heroeslist',
    component: () => import('../views/HeroesView.vue')
  },
  {
    path: '/createhero',
    name: 'createhero',
    component: () => import('../views/CreateHeroView.vue')
  },
  {
    path: '/edithero/:id',
    name: 'edithero',
    component: () => import('../views/EditHeroView.vue')
  },
  {
    path: '/events',
    name: 'events',
    component: () => import('../views/EventsView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
