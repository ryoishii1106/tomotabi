<template>
  <dl>
    <dt>ID</dt>
    <dd>{{ user.id }}</dd>
    <dt>Email</dt>
    <dd>{{ user.email }}</dd>
    <dt>Password</dt>
    <dd>{{ user.password }}</dd>
    <dt>Accepted</dt>
    <dd>{{ user.accepted }}</dd>
    <dt>Name</dt>
    <dd>{{ user.name }}</dd>
    <dt>Self Introduction</dt>
    <dd>{{ user.self_introduction }}</dd>
    <dt>Avatar Name</dt>
    <dd>{{ user.avatar }}</dd>
  </dl>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      user: {}
    }
  },
  mounted () {
    axios
      .get(`/api/v1/users/${this.$route.params.id}.json`)
      .then(response => (this.user = response.data))
  }
}
</script>