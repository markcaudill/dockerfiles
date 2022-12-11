FROM alpine:3
LABEL maintainer="Mark Caudill <mark@mrkc.me>"

RUN apk --no-cache add \
	duplicity=~1 \
	gnupg=~2

ENTRYPOINT ["duplicity"]
CMD ["-h"]
