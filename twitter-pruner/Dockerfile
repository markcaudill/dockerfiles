FROM alpine:3 AS builder
ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p $GOPATH
RUN apk add --no-cache git=~2 go=~1
RUN go get github.com/crueber/twitter-pruner

FROM alpine:3
LABEL maintainer="Mark Caudill <mark@mrkc.me>"
ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p $GOPATH
COPY --from=builder $GOPATH/bin $GOPATH/bin
CMD ["twitter-pruner"]
