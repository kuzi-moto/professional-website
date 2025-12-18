# Build Hugo site
FROM debian:11-slim AS builder
ARG HUGO_VERSION=0.152.2
RUN apt update && apt install -y wget && \
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-amd64.deb && \
    dpkg -i hugo_${HUGO_VERSION}_Linux-amd64.deb && \
    rm hugo_${HUGO_VERSION}_Linux-amd64.deb && \
    rm -rf /var/lib/apt/lists/*

COPY ./src /src
RUN hugo --source="/src" --destination="/output" --cacheDir="/tmp/hugo_cache"

# Build lightweight image
FROM nginx:stable-alpine

RUN rm -r /usr/share/nginx/html/*
COPY --from=builder "/output" "/usr/share/nginx/html"
