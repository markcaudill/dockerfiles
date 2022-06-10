FROM markcaudill/runitor:alpine

# hadolint ignore=DL3018
RUN apk add --no-cache bash curl
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -Ls 'https://github.com/woodpecker-ci/woodpecker/releases/latest/download/woodpecker-cli_linux_amd64.tar.gz' | tar -xzf- -C /usr/local/bin
COPY --chown=root:root runner.sh /usr/local/bin/runner.sh
RUN chmod 0755 /usr/local/bin/runner.sh

ENV UUID="" \
    RU_OPTS="" \
    WOODPECKER_SERVER="" \
    WOODPECKER_TOKEN="" \
    WOODPECKER_REPO="" \
    WOODPECKER_BRANCH=""
CMD ["sh", "-x", "-c", "runitor -uuid $UUID $RU_OPTS -- runner.sh"]
