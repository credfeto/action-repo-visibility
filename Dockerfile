FROM alpine:3.15.4

COPY detect /detect

ENTRYPOINT ["/detect"]
