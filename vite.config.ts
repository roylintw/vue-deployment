import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import alias from '@rollup/plugin-alias'

// https://vitejs.dev/config/
export default defineConfig({
  base: './',
  appType: 'spa',
  plugins: [
    vue(),
    alias(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  server: {
    port: 8080,
    host: '0.0.0.0',
    proxy: {
      // 將所有以 /api 開頭的請求轉發到後端服務器
      '/api': {
        // before
        // target: 'http://localhost:8080',

        // after
        target: 'https://spring-boot-deployment-1-xpf6zdjama-de.a.run.app',
        changeOrigin: true,
        secure: true,
        // rewrite: (path) => path.replace(/^\/api/, ''),
      },
    },
  }
})
