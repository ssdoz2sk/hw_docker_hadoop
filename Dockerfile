FROM sequenceiq/hadoop-docker

COPY hadoop /usr/local/hadoop/etc/hadoop
COPY bootstrap.sh /etc/bootstrap.sh
COPY bootstrap-slave.sh /etc/bootstrap-slave.sh

RUN yum install vim -y \
    && chmod 700 /etc/bootstrap.sh \
    && chmod 700 /etc/bootstrap-slave.sh


# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 10020 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122 1099

CMD ["/etc/bootstrap.sh", "-d"]


