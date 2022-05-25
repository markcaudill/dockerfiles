FROM golang:1-alpine AS builder
ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
RUN go install github.com/crueber/twitter-pruner@latest

FROM markcaudill/runitor:alpine AS runitor
LABEL maintainer="Mark Caudill <mark@mrkc.me>"
ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p $GOPATH
COPY --from=builder $GOPATH/bin $GOPATH/bin
ENV UUID="" \
	RU_OPTS="" \
	TWITTER_CONSUMER_KEY="" \
	TWITTER_CONSUMER_SECRET="" \
	TWITTER_ACCESS_TOKEN="" \
	TWITTER_ACCESS_TOKEN_SECRET="" \
	TP_OPTS=""
CMD ["sh", "-x", "-c", "runitor -uuid $UUID $RU_OPTS -- twitter-pruner --key $TWITTER_CONSUMER_KEY --secret $TWITTER_CONSUMER_SECRET --token $TWITTER_ACCESS_TOKEN --tsecret $TWITTER_ACCESS_TOKEN_SECRET $TP_OPTS"]
