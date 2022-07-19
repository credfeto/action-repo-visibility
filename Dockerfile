FROM alpine:3.16.1

RUN apk --no-cache add curl jq

COPY detect /detect

ENTRYPOINT ["/detect"]
