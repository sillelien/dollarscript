FROM sillelien/base-java
COPY dollar/dist/dollar /app
VOLUME /build
WORKDIR /build
ENTRYPOINT ["/app/bin/dollar"]