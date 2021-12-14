<template>
  <user-form-page :errors="errors" :user="user" @submit="updateUser"></user-form-page>
</template>

<script>
import axios from 'axios';
import UserFormPage from 'UserFormPage.vue';

export default {
  components: {
    UserFormPage
  },
  data() {
    return {
      user: {},
      errors: ''
    }
  },
  mounted () {
    axios
      .get(`/api/v1/users/${this.$route.params.id}.json`)
      .then(response => (this.user = response.data))
  },
  methods: {
    updateUser: function() {
      axios
        .patch(`/api/v1/users/${this.user.id}`, this.user)
        .then(response => {
          this.$router.push({ name: 'UserDetailPage', params: { id: this.user.id } });
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>

<style scoped>
</style>