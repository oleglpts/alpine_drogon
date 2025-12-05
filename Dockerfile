ARG alpine_version=3.23.0
FROM alpine:${alpine_version}
WORKDIR /build
ARG drogon_version=1.9.11
ARG trantor_version=1.5.24
COPY Logger_cc.patch ./Logger_cc.patch
COPY Logger_h.patch ./Logger_h.patch
RUN apk add --no-cache cmake build-base git nlohmann-json jsoncpp-dev ossp-uuid-dev zlib-dev && \
    wget https://github.com/drogonframework/drogon/archive/refs/tags/v${drogon_version}.tar.gz && \
    tar -xzvf v${drogon_version}.tar.gz && rm -rf v${drogon_version}.tar.gz && cd drogon-${drogon_version} && \
    wget https://github.com/an-tao/trantor/archive/refs/tags/v${trantor_version}.tar.gz && \
    tar -xzvf v${trantor_version}.tar.gz && rm -rf v${trantor_version}.tar.gz && rm -rf trantor && \
    mv trantor-${trantor_version} trantor && patch trantor/trantor/utils/Logger.cc ../Logger_cc.patch && \
    adduser -h /home/drogon -s sh -D drogon && patch trantor/trantor/utils/Logger.h ../Logger_h.patch && \
    sh ./build.sh && cd .. && rm -rf drogon-${drogon_version} && cd .. && rm -rf build
CMD ["/bin/sh"]

USER drogon
