#!/bin/bash

#
# Local installation of the Drogon framework (https://github.com/drogonframework/drogon) for development.
# It is assumed that Drogon dependencies are already installed (packages are distribution specific).
#
# Usage: sudo ./local_build.sh drogon_version trantor_version
# Example: sudo ./local_build.sh 1.9.11 1.5.24
#

mkdir build
cd build
wget https://github.com/drogonframework/drogon/archive/refs/tags/v$1.tar.gz
tar -xzvf v$1.tar.gz
rm -rf v$1.tar.gz
cd drogon-$1
wget https://github.com/an-tao/trantor/archive/refs/tags/v$2.tar.gz
tar -xzvf v$2.tar.gz
rm -rf v$2.tar.gz
rm -rf trantor
mv trantor-$2 trantor
cp ../../Logger_cc.patch Logger_cc.patch
cp ../../Logger_h.patch Logger_h.patch
patch trantor/trantor/utils/Logger.cc Logger_cc.patch
patch trantor/trantor/utils/Logger.h Logger_h.patch
./build.sh
cd ../..
rm -rf ./build

#-- Installed files...
#-- Install configuration: "release"
#-- Installing: /usr/local/lib/libtrantor.a
#-- Installing: /usr/local/include/trantor/exports.h
#-- Installing: /usr/local/include/trantor/net/EventLoop.h
#-- Installing: /usr/local/include/trantor/net/EventLoopThread.h
#-- Installing: /usr/local/include/trantor/net/EventLoopThreadPool.h
#-- Installing: /usr/local/include/trantor/net/InetAddress.h
#-- Installing: /usr/local/include/trantor/net/TcpClient.h
#-- Installing: /usr/local/include/trantor/net/TcpConnection.h
#-- Installing: /usr/local/include/trantor/net/TcpServer.h
#-- Installing: /usr/local/include/trantor/net/AsyncStream.h
#-- Installing: /usr/local/include/trantor/net/callbacks.h
#-- Installing: /usr/local/include/trantor/net/Resolver.h
#-- Installing: /usr/local/include/trantor/net/Channel.h
#-- Installing: /usr/local/include/trantor/net/Certificate.h
#-- Installing: /usr/local/include/trantor/net/TLSPolicy.h
#-- Installing: /usr/local/include/trantor/utils/AsyncFileLogger.h
#-- Installing: /usr/local/include/trantor/utils/ConcurrentTaskQueue.h
#-- Installing: /usr/local/include/trantor/utils/Date.h
#-- Installing: /usr/local/include/trantor/utils/Funcs.h
#-- Installing: /usr/local/include/trantor/utils/LockFreeQueue.h
#-- Installing: /usr/local/include/trantor/utils/LogStream.h
#-- Installing: /usr/local/include/trantor/utils/Logger.h
#-- Installing: /usr/local/include/trantor/utils/MsgBuffer.h
#-- Installing: /usr/local/include/trantor/utils/NonCopyable.h
#-- Installing: /usr/local/include/trantor/utils/ObjectPool.h
#-- Installing: /usr/local/include/trantor/utils/SerialTaskQueue.h
#-- Installing: /usr/local/include/trantor/utils/TaskQueue.h
#-- Installing: /usr/local/include/trantor/utils/TimingWheel.h
#-- Installing: /usr/local/include/trantor/utils/Utilities.h
#-- Installing: /usr/local/lib/cmake/Trantor/TrantorConfig.cmake
#-- Installing: /usr/local/lib/cmake/Trantor/TrantorConfigVersion.cmake
#-- Installing: /usr/local/lib/cmake/Trantor/Findc-ares.cmake
#-- Installing: /usr/local/lib/cmake/Trantor/FindBotan.cmake
#-- Installing: /usr/local/lib/cmake/Trantor/TrantorTargets.cmake
#-- Installing: /usr/local/lib/cmake/Trantor/TrantorTargets-release.cmake
#-- Installing: /usr/local/bin/benchmark
#-- Installing: /usr/local/bin/client
#-- Installing: /usr/local/bin/websocket_client
#-- Installing: /usr/local/bin/websocket_server
#-- Installing: /usr/local/bin/helloworld
#-- Installing: /usr/local/bin/file_upload
#-- Installing: /usr/local/bin/login_session
#-- Installing: /usr/local/bin/jsonstore
#-- Installing: /usr/local/bin/redis_simple
#-- Installing: /usr/local/bin/redis_chat
#-- Installing: /usr/local/bin/async_stream
#-- Installing: /usr/local/bin/cors
#-- Installing: /usr/local/bin/_drogon_ctl
#-- Installing: /usr/local/bin/drogon_ctl
#-- Installing: /usr/local/bin/dg_ctl
#-- Installing: /usr/local/lib/libdrogon.a
#-- Installing: /usr/local/include/drogon/Attribute.h
#-- Installing: /usr/local/include/drogon/CacheMap.h
#-- Installing: /usr/local/include/drogon/Cookie.h
#-- Installing: /usr/local/include/drogon/DrClassMap.h
#-- Installing: /usr/local/include/drogon/DrObject.h
#-- Installing: /usr/local/include/drogon/DrTemplate.h
#-- Installing: /usr/local/include/drogon/DrTemplateBase.h
#-- Installing: /usr/local/include/drogon/HttpAppFramework.h
#-- Installing: /usr/local/include/drogon/HttpBinder.h
#-- Installing: /usr/local/include/drogon/HttpClient.h
#-- Installing: /usr/local/include/drogon/HttpController.h
#-- Installing: /usr/local/include/drogon/HttpFilter.h
#-- Installing: /usr/local/include/drogon/HttpMiddleware.h
#-- Installing: /usr/local/include/drogon/HttpRequest.h
#-- Installing: /usr/local/include/drogon/RequestStream.h
#-- Installing: /usr/local/include/drogon/HttpResponse.h
#-- Installing: /usr/local/include/drogon/HttpSimpleController.h
#-- Installing: /usr/local/include/drogon/HttpTypes.h
#-- Installing: /usr/local/include/drogon/HttpViewData.h
#-- Installing: /usr/local/include/drogon/IntranetIpFilter.h
#-- Installing: /usr/local/include/drogon/IOThreadStorage.h
#-- Installing: /usr/local/include/drogon/LocalHostFilter.h
#-- Installing: /usr/local/include/drogon/MultiPart.h
#-- Installing: /usr/local/include/drogon/NotFound.h
#-- Installing: /usr/local/include/drogon/Session.h
#-- Installing: /usr/local/include/drogon/UploadFile.h
#-- Installing: /usr/local/include/drogon/WebSocketClient.h
#-- Installing: /usr/local/include/drogon/WebSocketConnection.h
#-- Installing: /usr/local/include/drogon/WebSocketController.h
#-- Installing: /usr/local/include/drogon/drogon.h
#-- Installing: /usr/local/include/drogon/version.h
#-- Installing: /usr/local/include/drogon/drogon_callbacks.h
#-- Installing: /usr/local/include/drogon/PubSubService.h
#-- Installing: /usr/local/include/drogon/drogon_test.h
#-- Installing: /usr/local/include/drogon/RateLimiter.h
#-- Installing: /usr/local/include/drogon/exports.h
#-- Installing: /usr/local/include/drogon/orm/ArrayParser.h
#-- Installing: /usr/local/include/drogon/orm/BaseBuilder.h
#-- Installing: /usr/local/include/drogon/orm/Criteria.h
#-- Installing: /usr/local/include/drogon/orm/DbClient.h
#-- Installing: /usr/local/include/drogon/orm/DbConfig.h
#-- Installing: /usr/local/include/drogon/orm/DbListener.h
#-- Installing: /usr/local/include/drogon/orm/DbTypes.h
#-- Installing: /usr/local/include/drogon/orm/Exception.h
#-- Installing: /usr/local/include/drogon/orm/Field.h
#-- Installing: /usr/local/include/drogon/orm/FunctionTraits.h
#-- Installing: /usr/local/include/drogon/orm/Mapper.h
#-- Installing: /usr/local/include/drogon/orm/CoroMapper.h
#-- Installing: /usr/local/include/drogon/orm/Result.h
#-- Installing: /usr/local/include/drogon/orm/ResultIterator.h
#-- Installing: /usr/local/include/drogon/orm/Row.h
#-- Installing: /usr/local/include/drogon/orm/RowIterator.h
#-- Installing: /usr/local/include/drogon/orm/SqlBinder.h
#-- Installing: /usr/local/include/drogon/orm/RestfulController.h
#-- Installing: /usr/local/include/drogon/nosql/RedisClient.h
#-- Installing: /usr/local/include/drogon/nosql/RedisResult.h
#-- Installing: /usr/local/include/drogon/nosql/RedisSubscriber.h
#-- Installing: /usr/local/include/drogon/nosql/RedisException.h
#-- Installing: /usr/local/include/drogon/utils/coroutine.h
#-- Installing: /usr/local/include/drogon/utils/FunctionTraits.h
#-- Installing: /usr/local/include/drogon/utils/HttpConstraint.h
#-- Installing: /usr/local/include/drogon/utils/OStringStream.h
#-- Installing: /usr/local/include/drogon/utils/Utilities.h
#-- Installing: /usr/local/include/drogon/utils/monitoring.h
#-- Installing: /usr/local/include/drogon/utils/monitoring/Counter.h
#-- Installing: /usr/local/include/drogon/utils/monitoring/Metric.h
#-- Installing: /usr/local/include/drogon/utils/monitoring/Registry.h
#-- Installing: /usr/local/include/drogon/utils/monitoring/Collector.h
#-- Installing: /usr/local/include/drogon/utils/monitoring/Sample.h
#-- Installing: /usr/local/include/drogon/utils/monitoring/Gauge.h
#-- Installing: /usr/local/include/drogon/utils/monitoring/Histogram.h
#-- Installing: /usr/local/include/drogon/plugins/Plugin.h
#-- Installing: /usr/local/include/drogon/plugins/Redirector.h
#-- Installing: /usr/local/include/drogon/plugins/SecureSSLRedirector.h
#-- Installing: /usr/local/include/drogon/plugins/AccessLogger.h
#-- Installing: /usr/local/include/drogon/plugins/RealIpResolver.h
#-- Installing: /usr/local/include/drogon/plugins/Hodor.h
#-- Installing: /usr/local/include/drogon/plugins/SlashRemover.h
#-- Installing: /usr/local/include/drogon/plugins/GlobalFilters.h
#-- Installing: /usr/local/include/drogon/plugins/PromExporter.h
#-- Installing: /usr/local/lib/cmake/Drogon/DrogonConfig.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/DrogonConfigVersion.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/FindUUID.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/FindJsoncpp.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/FindSQLite3.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/FindMySQL.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/Findpg.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/FindBrotli.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/Findcoz-profiler.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/FindHiredis.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/FindFilesystem.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/DrogonUtilities.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/ParseAndAddDrogonTests.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/DrogonTargets.cmake
#-- Installing: /usr/local/lib/cmake/Drogon/DrogonTargets-release.cmake
