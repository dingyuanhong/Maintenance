#参照网页
#http://blog.csdn.net/u012371450/article/details/51776505
#http://blog.csdn.net/sinat_28224453/article/details/51134978
#http://blog.csdn.net/mlx212/article/details/54909609

echo "fs.file-max=655350" >> /etc/sysctl.conf
echo "vm.max_map_count=262144" >> /etc/sysctl.conf
sysctl -p

#https://www.elastic.co/cn/products 官网下载地址
#Elasticsearch安装
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.1.3.tar.gz
tar -zxvf elasticsearch-6.1.3.tar.gz
cd elasticsearch-6.1.3

echo 'cluster.name: server'>>config/elasticsearch.yml
echo 'node.name: node1'>>config/elasticsearch.yml
echo 'network.host: 0.0.0.0'>>config/elasticsearch.yml
echo 'http.port: 9200'>>config/elasticsearch.yml
echo 'http.cors.enabled: true'>>config/elasticsearch.yml
echo 'http.cors.allow-origin: "*"'>>config/elasticsearch.yml

cd ..
#用户组
groupadd es
useradd es -g es -p pwd
chown -R es:es elasticsearch-6.1.3
su es
/data/source/elasticsearch-6.1.3/bin/elasticsearch -d




#nodejs模块
wget https://nodejs.org/dist/v6.9.2/node-v6.9.2-linux-x64.tar.xz
xz -d node-v6.9.2-linux-x64.tar.xz
tar -xvf node-v6.9.2-linux-x64.tar
mv node-v6.9.2-linux-x64 /usr/local/nodejs
echo 'export NODE_HOME=/usr/local/nodejs' >> /etc/profile
echo 'export PATH=$PATH:$NODE_HOME/bin' >> /etc/profile
npm install grunt --save-dev -g




#elasticsearch-head模块
wget  https://github.com/mobz/elasticsearch-head/archive/master.zip
unzip master.zip
rm -f master.zip
cd elasticsearch-head-master

npm install grunt-contrib-clean --registry=https://registry.npm.taobao.org
npm install grunt-contrib-concat --registry=https://registry.npm.taobao.org
npm install grunt-contrib-watch --registry=https://registry.npm.taobao.org
npm install grunt-contrib-connect --registry=https://registry.npm.taobao.org
npm install grunt-contrib-copy --registry=https://registry.npm.taobao.org
npm install grunt-contrib-jasmine --registry=https://registry.npm.taobao.org

#vi Gruntfile.js
#添加hostname:'0.0.0.0'
#connect --> server --> option --> hostname:'0.0.0.0',
#修改连接地址：
#vi _site/app.js
#修改 this.base_uri --> localhost:9200 
#启动
grunt server