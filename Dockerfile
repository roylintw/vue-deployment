FROM node:latest as build-stage
# 使用官方的 Nginx 基础镜像
FROM nginx:latest
# 复制自定义的 Nginx 配置文件到容器中
COPY nginx.conf /etc/nginx/nginx.conf

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