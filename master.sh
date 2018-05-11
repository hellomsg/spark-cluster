#!/bin/bash

export SPARK_MASTER_HOST='0.0.0.0'

. "/spark/sbin/spark-config.sh"

. "/spark/bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG

export SPARK_HOME=/spark

find etc/hadoop/ -type f | xargs sed -i "s/\$HOST/$(hostname)/g"

/hadoop/bin/hdfs namenode -format
/hadoop/bin/start-dfs.sh

cd /spark/bin && /spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT 
