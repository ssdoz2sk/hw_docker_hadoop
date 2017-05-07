if [ $# -eq 0 ]; then
	echo "Usage: start-slave <hostname>"
	echo "Run a hadoop container which name is hadoop-slave"
	exit 255
fi

docker rm -f hadoop-slave

docker run --name hadoop-slave \
	-p 50010:50010 \
	-p 50020:50020 \
	-p 50070:50070 \
	-p 50075:50075 \
	-p 50090:50090 \
	-p 8020:8020 \
	-p 9000:9000 \
	-p 10020:10020 \
	-p 19888:19888 \
	-p 8030:8030 \
	-p 8031:8031 \
	-p 8032:8032 \
	-p 8033:3033 \
	-p 8040:8040 \
	-p 8042:8042 \
	-p 8088:8088 \
	-p 34551:34551 \
	-p 49707:49707 \
	-p 44827:44827 \
	-p 38627:38627 \
	-p 2122:2122 \
	-p 1099:1099 \
	-h $1 \
	--add-host="master:10.16.173.171" \
	--add-host="slave-eric:10.16.173.161" \
	--add-host="slave-jimmy:10.16.173.171" \
	--add-host="slave-iris:10.16.173.173" \
	--add-host="slave-ysy:10.16.173.175" \
	-v /docker/hadoop:/opt/hadoop \
	-d \
	-it ssdoz2sk/hadoop-docker-homework:0.1.2 /etc/bootstrap-slave.sh -d
