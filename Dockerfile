# Step 1: Build stage
FROM node:16 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Step 2: Nginx serve
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
