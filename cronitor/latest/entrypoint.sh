#!/bin/bash -x

echo -e "${CRONTAB}" | crontab -
# shellcheck disable=SC2086
crond ${CRONDARGS}
