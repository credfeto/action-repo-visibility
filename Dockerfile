FROM alpine:3.15.4

RUN apk --no-cache add curl

COPY detect /detect

ENTRYPOINT ["/detect"]
