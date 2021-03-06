FROM alpine:edge
LABEL lordmuffin <dorkmeisterx69@gmail.com>

ENV	TIMEZONE="UTC" \
	SYSLOG_OPTION="-O-"

RUN	apk --no-cache --no-progress upgrade -f
	# apk --no-cache --no-progress add setpriv

# default rule for syslog is send to stdout with option "-O-"
# use -e SYSLOG_OPTION="-R 172.17.0.1" to forward the log to another syslog server and mute the log
RUN \
    set -e -u; \
    addgroup -g 1000 -S alpine && \
    adduser -u 1001 -S alpine -G alpine && \
    mkdir /work

WORKDIR /work
ENTRYPOINT ["/bin/ash"]