FROM debian:bullseye-slim

RUN mkdir -p /usr/local/share/xray/

ARG TMPPATH=./tmp

COPY ${TMPPATH}/xray /usr/bin/xray
COPY ${TMPPATH}/geoip.dat /usr/local/share/xray/geoip.dat
COPY ${TMPPATH}/geosite.dat /usr/local/share/xray/geosite.dat

CMD /usr/bin/xray run -config /etc/xray/config.json
