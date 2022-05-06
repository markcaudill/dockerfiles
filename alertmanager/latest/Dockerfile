# hadolint ignore=DL3007
FROM prom/alertmanager:latest

LABEL maintainer="Mark Caudill <mark@mrkc.me>"
USER root
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 0755 /usr/local/bin/entrypoint.sh
USER nobody

EXPOSE 9093
VOLUME /alertmanager
WORKDIR /alertmanager
ENV ALERTMANAGER_YML ""
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
