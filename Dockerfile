FROM sillelien/base-java
RUN apk add bash
COPY dollar/dist/dollar /app
VOLUME /build
WORKDIR /build
ENTRYPOINT ["/app/bin/dollar"]