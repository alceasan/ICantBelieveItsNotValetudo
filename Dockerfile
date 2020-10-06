ARG BASE_IMAGE_PREFIX
FROM ${BASE_IMAGE_PREFIX}node:14

ARG ARCH
COPY qemu-${ARCH}-static /usr/bin

VOLUME /app
WORKDIR /app

COPY package.json /app
RUN npm install
COPY . /app

CMD ["npm", "start"]
