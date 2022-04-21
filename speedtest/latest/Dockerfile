FROM debian:11-slim

LABEL maintainer="Mark Caudill <mark@mrkc.me>"

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]
RUN apt-get update && \
	apt-get --no-install-recommends -y install ca-certificates=* curl=* && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN	apt-get update && \
	curl -O https://install.speedtest.net/app/cli/install.deb.sh && \
	chmod +x install.deb.sh && \
	./install.deb.sh && \
	rm -f install.deb.sh && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN apt-get update && \
	apt-get --no-install-recommends -y install speedtest=* && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

CMD yes | speedtest
