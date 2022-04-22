FROM alpine:3

LABEL maintainer="Mark Caudill <mark@mrkc.me>"

ARG NZBGET_VERSION=21.1
ARG NZBGET_USER=nzbget

# hadolint ignore=DL3018
RUN apk add --no-cache bash ca-certificates && \
    adduser -D ${NZBGET_USER}

USER ${NZBGET_USER}
WORKDIR /home/${NZBGET_USER}
RUN wget -q https://github.com/nzbget/nzbget/releases/download/v${NZBGET_VERSION}/nzbget-${NZBGET_VERSION}-bin-linux.run && \
    sh nzbget-${NZBGET_VERSION}-bin-linux.run --destdir ~/nzbget && \
    rm -f nzbget-${NZBGET_VERSION}-bin-linux.run

ENV NZBGET_OPTS \
    -o MainDir=~/downloads \
    -o CertCheck=yes \
    -o CertStore=\${AppDir}/cacert.pem \
    -o ConfigTemplate=\${AppDir}/webui/nzbget.conf.template \
    -o ControlIP=0.0.0.0 \
    -o ControlPassword=tegbzn6789 \
    -o ControlPort=6789 \
    -o ControlUsername=nzbget \
    -o DebugTarget=screen \
    -o DestDir=\${MainDir}/dst \
    -o DetailTarget=screen \
    -o ErrorTarget=screen \
    -o InfoTarget=screen \
    -o InterDir=\${MainDir}/inter \
    -o LockFile=\${MainDir}/nzbget.lock \
    -o LogBuffer=1000 \
    -o NzbDir=\${MainDir}/nzb \
    -o NzbLog=no \
    -o OutputMode=log \
    -o QueueDir=\${MainDir}/queue \
    -o ScriptDir=\${MainDir}/scripts \
    -o TempDir=\${MainDir}/tmp \
    -o WarningTarget=screen \
    -o WebDir=\${AppDir}/webui \
    -o WriteBuffer=1024 \
    -o WriteLog=none
ENV NZBGET_SERVER_OPTS \
    -o Server1.Active=yes \
    -o Server1.Connections=4 \
    -o Server1.Encryption=yes \
    -o Server1.Group=0 \
    -o Server1.Host=my.newsserver.com \
    -o Server1.IpVersion=auto \
    -o Server1.JoinGroup=no \
    -o Server1.Level=0 \
    -o Server1.Optional=no \
    -o Server1.Password=pass \
    -o Server1.Port=119 \
    -o Server1.Retention=0 \
    -o Server1.Username=user
ENV PATH="/home/nzbget/nzbget:${PATH}"

EXPOSE 6789

RUN mkdir -p ~/downloads
VOLUME ["~/downloads"]

CMD ["bash", "-x", "-c", "nzbget -s -n ${NZBGET_OPTS} ${NZBGET_SERVER_OPTS}"]
