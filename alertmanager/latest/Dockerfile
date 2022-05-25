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
ENV ALERTMANAGER_COMMAND "/bin/alertmanager"
ENV ALERTMANAGER_COMMAND_ARGS "--config.file=/etc/alertmanager/alertmanager.yml --storage.path=/alertmanager"
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
