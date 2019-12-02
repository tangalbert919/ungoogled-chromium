FROM alpine

COPY devutils/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
