FROM markcaudill/runitor:alpine AS runitor
LABEL maintainer="Mark Caudill <mark@mrkc.me>"
RUN apk --no-cache add \
	bash=~5 \
	duplicity=~0 \
	gnupg=~2 \
	librsync-dev=~2 \
	openssh-client=~8 \
	py3-paramiko=~2
ENV SSH_PRIVATE_KEY="" \
	SSH_PRIVATE_KEY_FILENAME="" \
	SSH_KNOWN_HOSTS="" \
	GNUPG_PUBLIC_KEY="" \
	RUNITOR_UUID="" \
	RUNITOR_OPTS="" \
	DUPLICITY_OPTS="--gpg-options=\"--trust-model=tofu\""
COPY entrypoint.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
