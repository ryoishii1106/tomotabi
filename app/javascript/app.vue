<!-- <template>
  <div>
    <router-view></router-view>
  </div>
</template> -->
<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>name</th>
        </tr>
        <tr v-for="u in users" :key="u.id">
          <td>{{ u.id }}</td>
          <td>{{ u.name }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<!-- <script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import UserIndexPage from 'UserIndexPagu.vue'
import UserDetailPage from 'UserDetailPagu.vue'
import UserNewPage from 'UserNewPagu.vue'
import UserEditPage from 'UserEditPagu.vue'

const router = new VueRouter({
  routes: [
    { path: '/', component: UserIndexPage },
    { path: '/users/:id(\\d+)', name: 'UserDetailPage', component: UserDetailPage },
    { path: '/users/new', name: 'UserNewPage', component: UserNewPage },
    { path: '/users/:id(\\d+)/edit', name: 'UserEditPage', component: UserEditPage }
  ]
})

// ref. https://jp.vuejs.org/v2/guide/plugins.html#%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%81%AE%E4%BD%BF%E7%94%A8
Vuu.use(VueRouter)

export default {
  router
}
</script> -->
<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<!-- <style scoped>
</style> -->
<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
