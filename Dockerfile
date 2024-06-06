# # 使用官方的 Nginx 基础镜像
# FROM nginx:latest

# # 复制自定义的 Nginx 配置文件到容器中的 /etc/nginx/nginx.conf
# COPY nginx.conf /etc/nginx/nginx.conf

# # 如果有静态文件需要提供服务，复制到适当的位置
# COPY index.html /usr/share/nginx/index.html

# EXPOSE 80

FROM node:latest as build-stage
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