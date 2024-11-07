FROM node:18-alpine
WORKDIR /srv/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

EXPOSE 1337
CMD ["npm", "run", "develop"]
