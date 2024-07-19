<script setup lang="ts">
import { authClient } from '@/clients/auth/client'
import { userSession } from '@/state/UserSession'
import { computed, reactive, ref } from 'vue'

const state = reactive({
  email: '',
  password: ''
})

const badRequest = ref(false)

const buttonEnabled = computed(() => {
  return Boolean(state.email.length && state.password.length)
})

const logInUser = async () => {
  const res = await authClient.logIn(state)
  if (res.status === 400) {
    badRequest.value = true
    return
  }

  badRequest.value = false
  userSession.postLogin(res.token)
}
</script>

<template>
  <main>
    <div class="form-container">
      <h1 class="mb-4">Sign In</h1>
      <div class="card">
        <div class="card-body">
          <div v-if="badRequest" class="mb3">
            <div class="alert alert-danger" role="alert">Wrong Credentials...</div>
          </div>
          <div class="mb-3">
            <label for="user-email" class="form-label">Email address</label>
            <input
              v-model="state.email"
              type="email"
              class="form-control"
              id="user-email"
              placeholder="name@example.com"
            />
          </div>
          <div class="mb-3">
            <label for="user-password" class="form-label">Password</label>
            <input
              v-model="state.password"
              type="password"
              class="form-control"
              id="user-password"
              placeholder="Password"
            />
          </div>
          <div class="d-flex justify-content-end">
            <button
              type="button"
              class="btn btn-primary pull-right"
              @click="logInUser"
              :disabled="!buttonEnabled"
            >
              Log In
            </button>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>

<style scoped lang="scss">
main {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;

  .form-container {
    width: 100%;
    max-width: 25rem;
  }
}
</style>
