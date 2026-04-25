FROM node:18 as build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# 🔥 FIX HERE
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm run build

# Serve with nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
