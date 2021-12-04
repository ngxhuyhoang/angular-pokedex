# Stage 1

FROM node:16-alpine as build-production

WORKDIR /app

COPY / ./

COPY package*.json ./

RUN npm install

RUN npm run build --prod

# Stage 2
FROM nginx:1.21.4-alpine

COPY --from=build-production /app/dist/angular-pokedex /usr/share/nginx/html

