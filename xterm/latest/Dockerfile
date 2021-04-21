FROM debian:buster-slim

LABEL maintainer="Mark Caudill <mark@mrkc.me>"

ENV USERNAME x11user
ENV HOME /home/$USERNAME

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get -y install xterm=* --no-install-recommends \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& useradd --create-home --home-dir $HOME $USERNAME \
	&& chown -R $USERNAME:$USERNAME $HOME

WORKDIR $HOME
USER $USERNAME

ENTRYPOINT ["xterm"]

