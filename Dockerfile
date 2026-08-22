ARG alpine_version=3.24.1
FROM alpine:${alpine_version}
WORKDIR /build
ARG drogon_version=1.9.13
ARG trantor_version=1.5.28
COPY Logger_cc.patch ./Logger_cc.patch
COPY Logger_h.patch ./Logger_h.patch
RUN apk add --no-cache cmake build-base git nlohmann-json jsoncpp-dev \
    ossp-uuid-dev zlib-dev hiredis-dev postgresql-dev && \
    git clone https://github.com/jupp0r/prometheus-cpp.git && cd prometheus-cpp && git submodule init && \
    git submodule update && mkdir build && cd build && \
    cmake .. DCMAKE_BUILD_TYPE=Release -DENABLE_PULL=ON -DENABLE_PUSH=OFF -DENABLE_COMPRESSION=OFF -DENABLE_TESTING=OFF && \
    make -j 4 && make install && cd ../.. && \
    wget https://github.com/drogonframework/drogon/archive/refs/tags/v${drogon_version}.tar.gz && \
    tar -xzvf v${drogon_version}.tar.gz && rm -rf v${drogon_version}.tar.gz && cd drogon-${drogon_version} && \
    wget https://github.com/an-tao/trantor/archive/refs/tags/v${trantor_version}.tar.gz && \
    tar -xzvf v${trantor_version}.tar.gz && rm -rf v${trantor_version}.tar.gz && rm -rf trantor && \
    mv trantor-${trantor_version} trantor && patch trantor/trantor/utils/Logger.cc ../Logger_cc.patch && \
    adduser -h /home/drogon -s sh -D drogon && patch trantor/trantor/utils/Logger.h ../Logger_h.patch && \
    sh ./build.sh && cd .. && rm -rf drogon-${drogon_version} && cd .. && rm -rf build
CMD ["/bin/sh"]

USER drogon
