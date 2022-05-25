FROM golang:1-alpine AS builder
RUN go install github.com/crueber/twitter-pruner@latest

FROM alpine:3
LABEL maintainer="Mark Caudill <mark@mrkc.me>"
ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p $GOPATH
COPY --from=builder $GOPATH/bin $GOPATH/bin
CMD ["twitter-pruner"]
