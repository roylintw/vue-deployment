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