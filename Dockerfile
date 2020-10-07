ARG BASE_IMAGE_PREFIX
FROM ${BASE_IMAGE_PREFIX}node:slim

ARG ARCH
COPY qemu-${ARCH}-static /usr/bin

WORKDIR /app

COPY package.json /app

RUN apt-get update && apt-get -y install \
    build-essential \ 
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN npm install

COPY assets /app
COPY js-modules /app
COPY lib /app
COPY lib /app
COPY node-modules /app
COPY tools /app
COPY app.js /app
COPY config.json /app
COPY package-lock.json /app

CMD ["npm", "start"]
