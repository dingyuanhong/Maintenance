#download java
#yum list java*
#yum -y install java-1.7.0-openjdk*

#set java path
#/etc/profile.d/java.sh
touch /etc/profile.d/java.sh
echo 'export JAVA_HOME=/usr/local/java' >> /etc/profile.d/java.sh
echo 'export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar' >> /etc/profile.d/java.sh
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile.d/java.sh
source /etc/profile

#look https://www.cnblogs.com/luotianshuai/p/5206662.html
#configure zookeeper
tar -xzvf zookeeper-3.4.11.tar.gz
ZOOKEEPER=/data/source/zookeeper-3.4.11
cp ${ZOOKEEPER}/conf/zoo_sample.cfg ${ZOOKEEPER}/conf/zoo.cfg
	#change it look  http://blog.csdn.net/lihao21/article/details/51778255
echo "1" > ${ZOOKEEPER}/data/myid

${ZOOKEEPER}/bin/zkServer.sh start
${ZOOKEEPER}/bin/zkServer.sh status
${ZOOKEEPER}/bin/zkServer.sh stop

#configure kafka
tar -xzvf kafka_2.12-1.0.0.tgz
	#change /config/server.properties
	#host.name=127.0.0.1
	#listeners=PLAINTEXT://:19092  #for producer
	#zookeeper.connect=127.0.0.1:12181  #for ZOOKEEPER configure
	
KAFKA=/data/source/kafka_2.12-1.0.0
${KAFKA}/bin/kafka-server-start.sh -daemon ${KAFKA}/config/server.properties
${KAFKA}/bin/kafka-server-stop.sh



#Test
#创建topic
${KAFKA}/bin/kafka-topics.sh --create --zookeeper 127.0.0.1:12181 --replication-factor 1 --partitions 1 --topic shuaige

#创建一个broker发布者
${KAFKA}/bin/kafka-console-producer.sh --broker-list 127.0.0.1:19092 --topic shuaige

#创建一个订阅者
${KAFKA}/bin/kafka-console-consumer.sh --zookeeper localhost:12181 --topic shuaige --from-beginning

#查看topic
${KAFKA}/bin/kafka-topics.sh --list --zookeeper localhost:12181
${KAFKA}/bin/kafka-topics.sh --describe --zookeeper localhost:12181 --topic shuaige

#通过zk查看zk目录情况
${ZOOKEEPER}/bin/zkCli.sh -server 127.0.0.1:12181