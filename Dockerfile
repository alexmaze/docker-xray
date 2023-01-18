FROM debian:bullseye-slim

RUN mkdir -p /usr/local/share/xray/

COPY ./tmp/xray /usr/bin/xray
COPY ./tmp/geoip.dat /usr/local/share/xray/geoip.dat
COPY ./tmp/geosite.dat /usr/local/share/xray/geosite.dat

CMD /usr/bin/xray run -config /etc/xray/config.json
