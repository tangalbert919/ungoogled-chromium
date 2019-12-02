FROM alpine

COPY devutils/entrypoint.sh /entrypoint.sh

RUN apk update && apk add bash git curl

ENTRYPOINT ["/entrypoint.sh"]
