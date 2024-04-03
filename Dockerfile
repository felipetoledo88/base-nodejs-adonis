FROM node:18 AS base

RUN npm i node:18.18.0

FROM base AS dependencies

WORKDIR /usr/src/app

COPY package.json package-lock.json ./

RUN npm install

FROM base AS build

WORKDIR /usr/src/app

COPY . .
COPY --from=dependencies /usc/src/app/node_modules ./node_moduiles

RUN npm run build
RUN cd build
RUN npm ci --production 

FROM node:18.18.0-alpine3.18 AS deploy

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/package.json ./package.json

EXPOSE 3333

CMD [ "node", "server.js"]