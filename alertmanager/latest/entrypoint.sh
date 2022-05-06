#!/bin/sh

test -n "${ALERTMANAGER_YML}" \
    && echo "${ALERTMANAGER_YML}" > /etc/alertmanager/alertmanager.yml

/bin/alertmanager \
    --config.file=/etc/alertmanager/alertmanager.yml \
    --storage.path=/alertmanager
