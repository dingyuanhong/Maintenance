use admin;

#添加root用户
db.createUser({
"user":"root",
"pwd":"ilooyo2014fz",
"roles":[
{role:"root",db:"admin"},
]}
);

#认证
db.auth("root","ilooyo2014fz");

#关闭服务器
#db.shutdownServer();