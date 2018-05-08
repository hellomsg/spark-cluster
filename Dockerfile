FROM registry.cn-hangzhou.aliyuncs.com/flipboardchina/spark-cluster-base

ADD . /
ENTRYPOINT ["/bin/bash/"]
