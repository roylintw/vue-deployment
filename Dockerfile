FROM node:latest as build-stage
# 使用官方的 Nginx 基础镜像
FROM nginx:latest

RUN rm -rf node_modules
RUN npm install -g http-server
RUN npm install -g vite
RUN npm install -g @rollup/plugin-alias
RUN npm install -g @fortawesome/fontawesome-svg-core
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 8080
CMD [ "http-server", "dist" ]