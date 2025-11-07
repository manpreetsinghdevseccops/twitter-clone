FROM node:16.20.2-alpine

RUN apk add --no-cache git

WORKDIR /app

COPY package*.json ./

RUN npm install --legacy-peer-deps

COPY . .

RUN npm run build

EXPOSE 8080

ENTRYPOINT ["sh", "deploy.sh"]