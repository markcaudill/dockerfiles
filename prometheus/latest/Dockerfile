# hadolint ignore=DL3007
FROM prom/prometheus:latest

LABEL maintainer="Mark Caudill <mark@mrkc.me>"
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 0755 /usr/local/bin/entrypoint.sh
EXPOSE 9090
ENV PROMETHEUS_YML ""
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
