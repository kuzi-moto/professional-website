# Build Hugo site
FROM kuzimoto/hugo-build-docker AS builder
COPY ./src /src
RUN /run.sh

# Build lightweight image
FROM nginx:stable-alpine

RUN rm -r /usr/share/nginx/html/*
COPY --from=builder "/output" "/usr/share/nginx/html"
