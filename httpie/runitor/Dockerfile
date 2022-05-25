FROM markcaudill/runitor:alpine AS runitor
LABEL maintainer="Mark Caudill <mark@mrkc.me>"
RUN apk --no-cache add httpie=~3
ENV UUID="" \
	RU_OPTS="" \
	HTTPIE_CMD="https" \
	HTTPIE_OPTS=""
CMD ["sh", "-x", "-c", "runitor -uuid $UUID $RU_OPTS -- $HTTPIE_CMD $HTTPIE_OPTS"]
