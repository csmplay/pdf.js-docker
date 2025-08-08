FROM node:22-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --global gulp-cli
RUN npm install

COPY . .

RUN gulp

EXPOSE 8888

CMD ["gulp", "server"]
