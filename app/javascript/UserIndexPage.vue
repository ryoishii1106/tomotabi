<template>
  <div id="app">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
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
          <td><button @click="deleteTarget = user.id; showModal = true">Delete</button></td>
        </tr>
      </tbody>
    </table>
    <modal v-if="showModal" @cancel="showModal = false" @ok="deleteUser(); showModal = false;">
      <template #body>Are you sure?</template>
    </modal>
  </div>
</template>

<script>
import axios from 'axios';
import Modal from 'Modal.vue'

export default {
  components: {
    Modal
  },
  data: function () {
    return {
      users: [],
      showModal: false,
      deleteTarget: -1,
      errors: ''
    }
  },
  mounted () {
    this.updateUsers();
  },
  methods: {
    deleteUser: function() {
      if (this.deleteTarget <= 0) {
        console.warn('deleteTarget should be grater than zero.');
        return;
      }

      axios
        .delete(`/api/v1/users/${this.deleteTarget}`)
        .then(response => {
          this.deleteTarget = -1;
          this.updateUsers();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
    updateUsers: function() {
      axios
        .get('/api/v1/users.json')
        .then(response => (this.users = response.data))
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>