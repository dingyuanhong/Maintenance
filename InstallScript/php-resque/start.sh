# 把任务入队
/usr/local/php/bin/php -c /data/conf/php/php.ini demo/queue.php PHP_Job

# 取队列任务并执行
QUEUE=default /usr/local/php/bin/php -c /data/conf/php/php.ini demo/resque.php

# 查询队列中的任务情况
/usr/local/php/bin/php -c /data/conf/php/php.ini demo/check_status.php [id]