FROM golang:1-buster AS builder
ARG RUNITOR_VERSION=v0.9.2
RUN go install bdd.fi/x/runitor/cmd/runitor@${RUNITOR_VERSION:-latest}

FROM debian:buster
LABEL maintainer="Mark Caudill <mark@mrkc.me>"
COPY --from=builder /go/bin/runitor /usr/local/bin
CMD ["runitor"]
