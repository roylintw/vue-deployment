<template>
  <div class="container">
    <div class="register-wrapper">
      <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
      <div class="header">註冊</div>
      <form @submit.prevent="register">
        <div class="form-wrapper">
          <label for="account">帳號:</label>
          <input type="text" class="input-item" v-model="account" placeholder="請輸入帳號/信箱/用戶名" required />
        </div>
        <div>
          <label for="password">密碼:</label>
          <input id="inputPassword" type="password" class="input-item" v-model="password" placeholder="請輸入密碼"
            required />
          <i id="pinUpEye" :class="[isActive ? 'fa-eye' : 'fa-eye-slash', 'fas']" @click="isActive = !isActive"></i>
        </div>
        <div>
          <label for="password">再次輸入密碼:</label>
          <input id="inputPassword1" type="password" class="input-item" v-model="password1" placeholder="請輸入密碼"
            required />
          <i id="pinUpEye1" :class="[isActive1 ? 'fa-eye' : 'fa-eye-slash', 'fas']" @click="isActive1 = !isActive1"></i>
        </div>
        <div>
          <label for="memberName">會員名稱:</label>
          <input type="text" class="input-item" v-model="memberName" placeholder="請輸入會員名稱" required />
        </div>
        <div>
          <label for="email">Email:</label>
          <input type="text" class="input-item" v-model="email" placeholder="請輸入Email" required />
        </div>
        <button class="btn" type="submit">註冊</button>
      </form>
      <div v-if="errorMessage" class="error-message">{{ errorMessage }}</div>
    </div>
  </div>
</template>

<!-- 組合式API -->
<script lang="ts" setup>
import { ref, watch } from 'vue'
import axios, { AxiosError } from 'axios';
import { useRouter } from 'vue-router';
let account: ''
let password: ''
let password1: ''
let memberName: ''
let email: ''
const errorMessage = ref('');
const router = useRouter()
const isActive = ref(false);
const isActive1 = ref(false);

async function register() {
  try {
    const response = await axios.post('/api/register', {
      account: account,
      password: password,
      memberName: memberName,
      email: email,
    });
    console.log('register successful', response);
    // 跳轉到首頁
    router.push('/');
  } catch (error) {
    console.error('Error register', error);
    if (error instanceof AxiosError) {
      console.error('status', Object(error).response.status);
    }

  }
}

// Watch
watch(isActive, () => {
  const inputPassword = document.getElementById("inputPassword");
  if (isActive.value === true) {
    inputPassword?.setAttribute('type', 'text'); // 顯示密碼
  } else {
    inputPassword?.setAttribute('type', 'password'); // 隱藏密碼
  }
})
watch(isActive1, () => {
  const inputPassword = document.getElementById("inputPassword1");
  if (isActive1.value === true) {
    inputPassword?.setAttribute('type', 'text'); // 顯示密碼
  } else {
    inputPassword?.setAttribute('type', 'password'); // 隱藏密碼
  }
})
</script>

<style scoped>
/* Add your styles here */
.register-wrapper {
  background-color: #fff;
  width: 358px;
  height: 588px;
  border-radius: 15px;
  padding: 0 50px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}

.header {
  font-size: 38px;
  font-weight: bold;
  text-align: center;
  line-height: 200px;
}

.input-item {
  display: block;
  width: 100%;
  margin-bottom: 20px;
  border: 0;
  padding: 10px;
  border-bottom: 1px solid rgb(128, 125, 125);
  font-size: 15px;
  outline: none;
}

.input-item:placeholder {
  text-transform: uppercase;
}

.btn {
  text-align: center;
  padding: 10px;
  margin: 0 auto;
  width: 100%;
  margin-top: 40px;
  background-image: linear-gradient(to right, #a6c1ee, #fbc2eb);
  color: #fff;
}

.msg {
  text-align: center;
  line-height: 88px;
}

a {
  text-decoration-line: none;
  color: #abc1ee;
}

/*固定眼睛 icon 位置*/
#pinUpEye {
  position: absolute;
  top: 55%;
  right: 20px;
  transform: translateY(-50%);
}

/*固定眼睛 icon 位置*/
#pinUpEye1 {
  position: absolute;
  top: 68%;
  right: 20px;
  transform: translateY(-50%);
}
</style>
