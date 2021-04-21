FROM debian:buster-slim

LABEL maintainer="Mark Caudill <mark@mrkc.me>"

ENV USERNAME spotify
ENV HOME /home/spotify

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get -y install ca-certificates=* curl=* gnupg=* --no-install-recommends \
	&& curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | apt-key add - \
	&& echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list \
	&& apt-get update \
	&& apt-get -y install \
		alsa-utils=* \
		libgl1-mesa-dri=* \
		libgl1-mesa-glx=* \
		libpulse0=* \
		libsm6=* \
		spotify-client=* \
		xdg-utils=* \
		--no-install-recommends \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --home-dir $HOME $USERNAME \
	&& gpasswd -a $USERNAME audio \
	&& chown -R $USERNAME:$USERNAME $HOME

WORKDIR $HOME
USER $USERNAME

ENTRYPOINT ["spotify"]

