FROM alpine:3
LABEL maintainer="Mark Caudill <mark@mrkc.me>"
RUN apk --no-cache add bitlbee=~3.6 && \
	adduser \
	-s /sbin/nologin \
	-D -H \
	bitlbee
EXPOSE 6667
VOLUME ["/etc/bitlbee", "/var/lib/bitlbee"]
CMD ["bitlbee", "-u", "bitlbee", "-D", "-n", "-v"]
