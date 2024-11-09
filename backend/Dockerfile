FROM node:18-alpine
WORKDIR /srv/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

RUN apk add --no-cache wget

EXPOSE 1337
CMD ["npm", "run", "develop"]
