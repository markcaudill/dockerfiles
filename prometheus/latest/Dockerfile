# hadolint ignore=DL3007
FROM prom/prometheus:latest

LABEL maintainer="Mark Caudill <mark@mrkc.me>"
USER root
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 0755 /usr/local/bin/entrypoint.sh
USER nobody

EXPOSE 9090
VOLUME /prometheus
WORKDIR /prometheus
ENV PROMETHEUS_YML ""
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
