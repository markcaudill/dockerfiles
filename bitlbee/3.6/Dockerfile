FROM alpine:3
LABEL maintainer="Mark Caudill <mark@mrkc.me>"
ENV BITLBEE_USER bitlbee
ENV BITLBEE_UID 1000
RUN apk --no-cache add bitlbee=~3.6 && \
	adduser -s /sbin/nologin -D -H -u $BITLBEE_UID $BITLBEE_USER && \
	mkdir -p /etc/bitlbee /var/lib/bitlbee && \
	chown -R $BITLBEE_USER /etc/bitlbee /var/lib/bitlbee
EXPOSE 6667
VOLUME ["/etc/bitlbee", "/var/lib/bitlbee"]
CMD ["bitlbee", "-D", "-n", "-v"]
USER $BITLBEE_USER
