<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>email</th>
          <th>name</th>
          <th>deleted_at</th>
          <th>created_at</th>
          <th>updated_at</th>
        </tr>
        <tr v-for="user in users" :key="user.id">
          <td><router-link :to="{ name: 'UserDetailPage', params: { id: user.id } }">{{ user.id }}</router-link></td>
          <td>{{ user.email }}</td>
          <td>{{ user.name }}</td>
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
     .get('/api/v1/users.json')
     .then(response => (this.users = response.data))
  }
}
</script>

<style scoped>
p {
  font-size: em;
  text-align: center;
}
</style>