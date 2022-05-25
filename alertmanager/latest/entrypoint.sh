#!/bin/sh

test -n "${ALERTMANAGER_YML}" \
    && echo "${ALERTMANAGER_YML}" > /etc/alertmanager/alertmanager.yml

"${ALERTMANAGER_COMMAND}" "${ALERTMANAGER_COMMAND_ARGS}"
