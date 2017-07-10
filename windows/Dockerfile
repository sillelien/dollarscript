FROM java:8-jdk-windowsservercore
COPY ../dollar/dist/dollar /app
VOLUME /build
WORKDIR /build
ENTRYPOINT ["/app/bin/dollar"]
