cfg = {
	_id: "testset",
	members: [{
			_id: 0,
			host: "127.0.0.1:27017",
			priority: 2
		}, {
			_id: 1,
			host: "127.0.0.1:27018",
			priority: 1
		}, {
			_id: 2,
			host: "127.0.0.1:27019",
			priority: 1
		}, {
			_id: 3,
			host: "127.0.0.1:27020",
			arbiterOnly: true
		}
	]
};
#强制刷新配置
rs.reconfig(cfg,{force:true});
#刷新配置
rs.reconfig(cfg);
#初始化配置
rs.initiate(cfg);
#获取配置
rs.config();
#获取状态
rs.status();
#删除节点
rs.remove("127.0.0.1:27017",{force:true});
#增加节点
rs.add("ip:port");
#强制激活主从
rs.slaveOk();