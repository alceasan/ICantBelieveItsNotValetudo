ARG BASE_IMAGE_PREFIX
FROM ${BASE_IMAGE_PREFIX}node:14-alpine

ARG ARCH
COPY qemu-${ARCH}-static /usr/bin

VOLUME /app
WORKDIR /app

COPY package.json /app

RUN apk add --no-cache --virtual .build-deps alpine-sdk python pixman
RUN npm install
RUN apk del .build-deps

COPY . /app

CMD ["npm", "start"]
