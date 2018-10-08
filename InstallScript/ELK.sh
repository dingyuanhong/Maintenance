#System: Centos
#ElasticSearch:6.1.3
#Logstash:6.1.3
#Kibana:6.1.3
#Java: openjdk version  "1.8.0_*"以上版本 安装java的jdk (Logstash依赖于java环境)

vim /etc/sysctl.conf
fs.file-max=655350
:wq
sysctl -p

vim /etc/security/limits.conf 
#新增
* soft nofile 655350
* hard nofile 655350

#https://www.elastic.co/cn/products 官网下载地址
#Elasticsearch安装
tar -zxvf elasticsearch-6.1.3.tar.gz
cd elasticsearch-6.1.3
vim config/elasticsearch.yml
cluster.name=server
node.name=node1
network.host=0.0.0.0
network.port=9200
:wq

groupadd es          #增加es组
useradd es -g es -p pwd          #增加es用户并附加到es组
chown -R es:es elasticsearch-6.1.3          #给目录权限
su es
./bin/elasticsearch -d          #后台运行es

#Elasticsearch head插件安装
wget https://nodejs.org/dist/v6.9.2/node-v6.9.2-linux-x64.tar.xz
tar –xvf node-v6.9.2-linux-x64.tar
mv node-v6.9.2-linux-x64 /alidata/app/node

vim /etc/profile
export NODE_HOME=/alidata/app/node
export PATH=$PATH:$NODE_HOME/bin
source /etc/profile
node –v
npm –v
npm install grunt --save-dev
npm install grunt-contrib-clean --registry=https://registry.npm.taobao.org
npm install grunt-contrib-concat --registry=https://registry.npm.taobao.org
npm install grunt-contrib-watch --registry=https://registry.npm.taobao.org
npm install grunt-contrib-connect --registry=https://registry.npm.taobao.org
npm install grunt-contrib-copy --registry=https://registry.npm.taobao.org
npm install grunt-contrib-jasmine --registry=https://registry.npm.taobao.org
#测试
grunt server

#为es设置跨域访问
cd elasticsearch-6.1.3
vim config/elasticsearch.yml
http.cors.enabled: true
http.cors.allow-origin: "*"
:wq

wget  https://github.com/mobz/elasticsearch-head/archive/master.zip
cd elasticsearch-head-master
vi Gruntfile.js
#添加hostname:'0.0.0.0'
connect --> server --> option --> hostname:'0.0.0.0',
#修改连接地址：
vim _site/app.js
#修改 this.base_uri --> localhost:9200 
#启动
grunt server

#logstash
tar -zxvf logstash-6.1.3.tar.gz
cd logstash-6.1.3
./bin/logstash -e 'input {stdin {} } output {elasticsearch {'hosts' => "10.0.2.4:9200"} }'
#运行时候会有内存不足而造成失败的情况，要reduce java运行内存空间-Xms512m 
#logstash output/input plugin kafka
./bin/logstash -f /data/conf/config/producer.conf
./bin/logstash -f /data/conf/config/consumer.conf --path.data /data/logstash

#kibana
#要跟相对应的Elasticsearch版本安装
tar -zxvf kibana-6.1.3-linux-x64.tar.gz
cd kibana-6.1.3-linux-x86
vim config/kibana.yml
#修改以下配置
server.port: 5601
server.host: 10.0.2.4
elasticsearch.url: http://10.0.2.4:9200
kibana.index: “.kibana”
./bin/kibana
