FROM golang:1-alpine AS builder
ARG RUNITOR_VERSION=v0.9.2
RUN go install bdd.fi/x/runitor/cmd/runitor@${RUNITOR_VERSION:-latest}

FROM alpine:3
LABEL maintainer="Mark Caudill <mark@mrkc.me>"
COPY --from=builder /go/bin/runitor /usr/local/bin
CMD ["runitor"]
