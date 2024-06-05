<template>
  <div>
    <button @click="fetchHello">Click me</button>
    <p>{{ message }}</p>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import axios from 'axios';

export default defineComponent({
  data() {
    return {
      message: '',
    };
  },
  methods: {
    async fetchHello() {
      try {
        const response = await axios.get('/api/hello');
        console.log('Response data:', response.data); // 返回資料
        this.message = response.data;
      } catch (error) {
        // if (error.response) {
        //   // 狀態碼不是 2xx
        //   console.error('Error response:', error.response);
        // } else if (error.request) {
        //   // 已發出 request ，但沒有回應
        //   console.error('Error request:', error.request);
        // } else {
        //   // 其他錯誤
        //   console.error('Error:', error.message);
        // }
        // this.message = 'Error fetching the API';
      }
    },
  },
});
</script>

<style scoped>
button {
  padding: 10px 20px;
  font-size: 16px;
}
</style>
