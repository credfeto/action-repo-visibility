FROM alpine:3.16.0

RUN apk --no-cache add curl

COPY detect /detect

ENTRYPOINT ["/detect"]
