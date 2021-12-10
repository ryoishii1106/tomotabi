<template>
  <form @submit.prevent="createUser">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <label>メールアドレス</label>
      <input v-model="user.email" type="text">
    </div>
    <div>
      <label>パスワード</label>
      <input v-model="user.password" type="text">
    </div>
    <div>
      <label>同意</label>
      <input v-model="user.accepted" type="checkbox">
    </div>
    <div>
      <label>名前</label>
      <input v-model="user.name" type="text">
    </div>
    <div>
      <label>自己紹介</label>
      <textarea v-model="user.self_introduction"></textarea>
    </div>
    <div>
      <label>アバター名</label>
      <input v-model="user.avatar" type="text">
    </div>
    <button type="submit">登録</button>
  </form>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      user: {
        email: '',
        password: '',
        accepted: false,
        name: '',
        self_introduction: '',
        avatar: ''
      },
      errors: ''
    }
  },
  methods: {
    createUser: function() {
      axios
        .post('/api/v1/users', this.user)
        .then(response => {
          let e = response.data;
          this.$router.push({ name: 'UserDetailPage', params: { id: e.id } });
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