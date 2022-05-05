FROM golang:1-alpine AS builder
RUN go install github.com/zhangjianweibj/prometheus-libvirt-exporter@latest

FROM alpine:3
LABEL maintainer="Mark Caudill <mark@mrkc.me>"
COPY --from=builder /go/bin/prometheus-libvirt-exporter /usr/local/bin
ENTRYPOINT ["prometheus-libvirt-exporter"]
