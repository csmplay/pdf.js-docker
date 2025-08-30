FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --global gulp-cli
RUN npm install
COPY . .
RUN npx gulp generic

FROM nginx:alpine
WORKDIR /app
COPY --from=builder /app/build/generic /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8888
CMD ["nginx", "-g", "daemon off;"]