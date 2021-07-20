#!/bin/bash

set -eou pipefail

# Setup SSH private key using SSH_PRIVATE_KEY and
# SSH_PRIVATE_KEY_FILENAME (it it's set)
if [ -n "${SSH_PRIVATE_KEY}" ]; then
    mkdir ~/.ssh
    touch ~/.ssh/"${SSH_PRIVATE_KEY_FILENAME:-id_rsa}"
    chmod 0600 ~/.ssh/"${SSH_PRIVATE_KEY_FILENAME:-id_rsa}"
    echo "${SSH_PRIVATE_KEY}" > ~/.ssh/"${SSH_PRIVATE_KEY_FILENAME:-id_rsa}"
fi

# Setup ~/.ssh/known_hosts using SSH_KNOWN_HOSTS if set
touch ~/.ssh/known_hosts && chmod 0600 ~/.ssh/known_hosts
if [ -n "${SSH_KNOWN_HOSTS}" ]; then
    echo "${SSH_KNOWN_HOSTS}" > ~/.ssh/known_hosts
fi

# Import GnuPG public key using GNUPG_PUBLIC_KEY if set
if [ -n "${GNUPG_PUBLIC_KEY}" ]; then
    echo "${GNUPG_PUBLIC_KEY}" | gpg --import --trust-model=tofu
fi

# Run
# shellcheck disable=SC2086
runitor -uuid $RUNITOR_UUID $RUNITOR_OPTS -- \
  duplicity $DUPLICITY_OPTS
