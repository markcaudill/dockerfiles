FROM debian:11-slim

LABEL maintainer="Mark Caudill <mark@mrkc.me>"

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

RUN useradd -m speedtest && \
	apt-get update && \
	apt-get --no-install-recommends -y install ca-certificates=* curl=* && \
	curl -O https://install.speedtest.net/app/cli/install.deb.sh && \
	chmod +x install.deb.sh && \
	./install.deb.sh && \
	rm -f install.deb.sh && \
	apt-get --no-install-recommends -y install speedtest=* && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

USER speedtest

ENTRYPOINT ["speedtest"]
