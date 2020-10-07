ARG BASE_IMAGE_PREFIX
FROM ${BASE_IMAGE_PREFIX}node:slim

ARG ARCH
COPY qemu-${ARCH}-static /usr/bin

WORKDIR /app

COPY package.json /app

RUN apt-get -q update && apt-get -y -q install \
    build-essential \ 
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN npm install

COPY assets /app/assets
COPY js-modules /app/js-modules
COPY lib /app/lib
COPY tools /app/tools
COPY app.js /app

CMD ["npm", "start"]
