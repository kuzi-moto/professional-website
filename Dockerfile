# Build Hugo site
FROM debian:11-slim AS builder
ARG HUGO_VERSION=0.91.2
RUN apt update && apt install -y wget && \
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb && \
    dpkg -i hugo_${HUGO_VERSION}_Linux-64bit.deb

COPY ./src /src
RUN hugo --source="/src" --destination="/output" --verbose

# Build lightweight image
FROM nginx:stable-alpine

RUN rm -r /usr/share/nginx/html/*
COPY --from=builder "/output" "/usr/share/nginx/html"
