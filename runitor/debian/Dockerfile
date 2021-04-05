FROM golang:1-buster AS builder
ENV RUNITOR_VERSION 0.7.2
ENV RUNITOR_GIT_TAG v$RUNITOR_VERSION
RUN apt-get update && apt-get install -y --no-install-recommends bash=5.* git=1:2.*
WORKDIR /tmp
RUN git clone --depth 1 --branch $RUNITOR_GIT_TAG https://github.com/bdd/runitor.git
WORKDIR /tmp/runitor
RUN go build -o ./ ./cmd/runitor


FROM debian:buster
LABEL maintainer="Mark Caudill <mark@mrkc.me>"
COPY --from=builder /tmp/runitor/runitor /usr/local/bin/runitor
CMD ["runitor"]
