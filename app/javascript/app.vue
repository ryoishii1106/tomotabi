<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>email</th>
          <th>password</th>
          <th>accepted</th>
          <th>name</th>
          <th>self_introduction</th>
          <th>avatar</th>
          <th>current_sign_in_at</th>
          <th>deleted_at</th>
          <th>created_at</th>
          <th>updated_at</th>
        </tr>
        <tr v-for="user in users" :key="user.id">
          <td>{{ user.id }}</td>
          <td>{{ user.email }}</td>
          <td>{{ user.password }}</td>
          <td>{{ user.accepted }}</td>
          <td>{{ user.name }}</td>
          <td>{{ user.self_introduction }}</td>
          <td>{{ user.avatar }}</td>
          <td>{{ user.current_sign_in_at }}</td>
          <td>{{ user.deleted_at }}</td>
          <td>{{ user.created_at }}</td>
          <td>{{ user.updated_at }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      users: []
    }
  },
  mounted () {
    axios
     .get('/apivi/users.json')
     .then(response => (this.users = response.data))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
