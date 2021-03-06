cd /data/svn/EvoShare/hooks
touch post-commit
vi post-commit

#!/bin/sh
#服务编码
#export LANG=zh_CN.gb2313

#Set variable
REPOS="$1"
REV="$2"

SVN=/usr/bin/svn
WEB=svn://192.168.0.77/EvoShare
LOCAL=/data/wwwroot/EvoShare
LOG=/data/svnlog/share.log

#cd $WEB
#nohup $SVN checkout $WEB $LOCAL --username xyang --password 123456 2>&1 >> $LOG &
$SVN update $LOCAL --username xyang --password 123456 2>&1 >> $LOG

/usr/bin/wget http://operation.evomotion.com/index/sync?project=EvoShare -O /dev/null > $LOG 2>&1

if [ $? == 0 ]
then

	echo  "$REPOS" "$REV" >> $LOG
	echo `date` >> $LOG
	echo "##############################" >> $LOG
fi

