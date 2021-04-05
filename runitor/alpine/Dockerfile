FROM golang:1-alpine AS builder
ENV RUNITOR_VERSION 0.7.2
ENV RUNITOR_GIT_TAG v$RUNITOR_VERSION
RUN apk add --no-cache bash=~5 git=~2
WORKDIR /tmp
RUN git clone --depth 1 --branch $RUNITOR_GIT_TAG https://github.com/bdd/runitor.git
WORKDIR /tmp/runitor
RUN go build -o ./ ./cmd/runitor


FROM alpine:3
LABEL maintainer="Mark Caudill <mark@mrkc.me>"
COPY --from=builder /tmp/runitor/runitor /usr/local/bin/runitor
CMD ["runitor"]
