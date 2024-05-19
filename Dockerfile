FROM node:latest as build-stage
# install simple http server for serving static content
RUN npm install -g http-server
RUN npm install -g vite

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json'
COPY package*.json .

# install project dependencies
RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# build app for production with minification
RUN npm run build
EXPOSE 8080
ENTRYPOINT ["http-server", "-p", "8080", "<path>"]




RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist", "vue-deployment" ]