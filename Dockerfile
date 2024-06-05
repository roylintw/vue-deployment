FROM node:latest as build-stage
RUN npm install -g http-server
RUN npm install -g vite
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build
EXPOSE 5173
CMD [ "http-server", "dist" ]