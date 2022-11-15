FROM golang:1-alpine AS builder
ARG RUNITOR_VERSION
RUN go install bdd.fi/x/runitor/cmd/runitor@${RUNITOR_VERSION:-latest}


FROM alpine:3
LABEL maintainer="Mark Caudill <mark@mrkc.me>"

RUN apk --no-cache add bash=~5
COPY --from=builder /go/bin/runitor /usr/local/bin

COPY --chown=root:root entrypoint.sh /usr/local/bin
RUN chmod 0755 /usr/local/bin/entrypoint.sh

ENV CRONDARGS "-f -d4"
ENV CRONTAB "* * * * *  echo placeholder\n* * * * *  echo another placeholder"

CMD ["entrypoint.sh"]
