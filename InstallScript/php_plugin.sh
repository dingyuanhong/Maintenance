
mkdir plugin

#国外
#/usr/local/php/bin/php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#/usr/local/php/bin/php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
#/usr/local/php/bin/php composer-setup.php

cd plugin

#国内
/usr/local/php/bin/php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
/usr/local/php/bin/php composer-setup.php

#写脚本
#安装elasticsearch搜索引擎
echo '{'> composer.json
echo '"require":{"elasticsearch/elasticsearch" : "~2.0"}' >> composer.json
echo ',"repositories": {"packagist": {"type": "composer","url": "https://packagist.phpcomposer.com"}}' >> composer.json
echo '}'>> composer.json

#安装
/usr/local/php/bin/php composer.phar install --no-dev

rm -f composer.json
rm -f composer.phar
rm -f composer-setup.php