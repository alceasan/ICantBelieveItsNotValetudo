ARG BASE_IMAGE_PREFIX
FROM ${BASE_IMAGE_PREFIX}node:14

ARG ARCH
COPY qemu-${ARCH}-static /usr/bin

VOLUME /app
WORKDIR /app

COPY package.json /app

RUN apt-get update && apt-get -y install build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev
RUN npm install

COPY . /app

CMD ["npm", "start"]
