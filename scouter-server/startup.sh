#!/bin/sh

export SC_SERVER_ID=${SC_SERVER_ID:-SCCOUTER-COLLECTOR}
export NET_HTTP_SERVER_ENABLED=${NET_HTTP_SERVER_ENABLED:-true}
export NET_HTTP_API_SWAGGER_ENABLED=${NET_HTTP_API_SWAGGER_ENABLED:-true}
export NET_HTTP_API_ENABLED=${NET_HTTP_API_ENABLED:-true}

export MGR_PURGE_PROFILE_KEEP_DAYS=${MGR_PURGE_PROFILE_KEEP_DAYS:-2}
export MGR_PURGE_XLOG_KEEP_DAYS=${MGR_PURGE_XLOG_KEEP_DAYS:-5}
export MGR_PURGE_COUNTER_KEEP_DAYS=${MGR_PURGE_COUNTER_KEEP_DAYS:-15}
export JAVA_OPT=${JAVA_OPT:--Xms1024m -Xmx1024m}
sed -i "s/%SC_SERVER_ID%/${SC_SERVER_ID}/g" /home/scouter-server/conf/scouter.conf
sed -i "s/%NET_HTTP_SERVER_ENABLED%/${NET_HTTP_SERVER_ENABLED}/g" /home/scouter-server/conf/scouter.conf
sed -i "s/%NET_HTTP_API_SWAGGER_ENABLED%/${NET_HTTP_API_SWAGGER_ENABLED}/g" /home/scouter-server/conf/scouter.conf
sed -i "s/%NET_HTTP_API_ENABLED%/${NET_HTTP_API_ENABLED}/g" /home/scouter-server/conf/scouter.conf

sed -i "s/%MGR_PURGE_PROFILE_KEEP_DAYS%/${MGR_PURGE_PROFILE_KEEP_DAYS}/g" /home/scouter-server/conf/scouter.conf
sed -i "s/%MGR_PURGE_XLOG_KEEP_DAYS%/${MGR_PURGE_XLOG_KEEP_DAYS}/g" /home/scouter-server/conf/scouter.conf
sed -i "s/%MGR_PURGE_COUNTER_KEEP_DAYS%/${MGR_PURGE_COUNTER_KEEP_DAYS}/g" /home/scouter-server/conf/scouter.conf

java $JAVA_OPT -classpath /home/scouter-server/scouter-server-boot.jar scouter.boot.Boot /home/scouter-server/lib

