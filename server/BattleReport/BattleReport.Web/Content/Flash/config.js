var config = {
	resRoot : "http://res.action.yuuhhe.com/Action/",
	policy : "http://res.action.yuuhhe.com/crossdomain.xml",
	getValue : function(name) { return config[name]; }
};

var loadingPage = {
	_tips : [
		"移动鼠标到部队可查看详细信息",
		"武将士气达到100可施放战法或策略",
		"【战法·天下归心】：全体增益，恢复120生命和25士气",
		"【战法·天神守护】：全体增益，恢复180生命",
		"【战法·无双乱舞】：九宫攻击，威力中等",
		"【战法·拖刀一击】：单体攻击，威力巨大",
		"【战法·震天咆哮】：单体攻击，威力较大，保留75士气",
		"【战法·一身是胆】：纵向攻击，威力较大",
		"【战法·恸天贯日】：横向攻击，威力中等，降敌士气为0",
		"【策略·奇门遁甲】：九宫攻击，威力较小，降低士气为0",
		"【策略·炼狱火海】：九宫攻击，威力中等",
		"【策略·倾国倾城】：单体增益，恢复400生命"
	],
	getTips : function() { return this._tips; }
}

var heroFactory = {	
	_heros : [
		{id:0, name:"城墙", job:0, skill:0, face:0, body:0, unit:0},
		{id:343, name:"曹操", job:2, skill:1, face:1, body:1, unit:1},
		{id:225, name:"司马懿", job:2, skill:2, face:2, body:2, unit:2},
		{id:660, name:"吕布", job:2, skill:3, face:3, body:3, unit:3},
		{id:98, name:"关羽", job:2, skill:4, face:4, body:4, unit:4},
		{id:432, name:"张飞", job:2, skill:5, face:5, body:5, unit:5},
		{id:395, name:"赵云", job:2, skill:6, face:6, body:6, unit:6},
		{id:370, name:"孙策", job:5, skill:7, face:7, body:7, unit:7},
		{id:289, name:"诸葛亮", job:6, skill:8, face:8, body:8, unit:8},
		{id:245, name:"周瑜", job:6, skill:9, face:9, body:9, unit:9},
		{id:424, name:"貂禅", job:6, skill:10, face:10, body:10, unit:10},
		{id:635, name:"刘备", job:2, skill:1, face:11, body:11, unit:11},
		{id:801, name:"近卫军", job:1, skill:0, face:100, body:100, unit:101},
		{id:802, name:"亲卫队", job:2, skill:0, face:100, body:100, unit:102},
		{id:803, name:"战弓骑", job:3, skill:0, face:100, body:100, unit:103},
		{id:804, name:"弓弩手", job:4, skill:0, face:100, body:100, unit:104},
		{id:805, name:"霹雳车", job:5, skill:0, face:100, body:100, unit:105}
	],
	_test:{name:"cctv"},
	getHeros : function() { return this._heros; }
}

var skillFactory = {
	_skills : [
		{id:0, name:"", type:0, resPrevious:0, resCurrent:0, resPost:0},
		{id:1, name:"天下归心", type:2, resPrevious:2, resCurrent:0, resPost:0},
		{id:2, name:"天神守护", type:2, resPrevious:4, resCurrent:0, resPost:0},
		{id:3, name:"无双乱舞", type:3, resPrevious:0, resCurrent:0, resPost:0},
		{id:4, name:"拖刀一击", type:1, resPrevious:0, resCurrent:0, resPost:0},
		{id:5, name:"震天咆哮", type:1, resPrevious:0, resCurrent:0, resPost:0},
		{id:6, name:"一身是胆", type:3, resPrevious:0, resCurrent:0, resPost:0},
		{id:7, name:"恸天贯日", type:1, resPrevious:0, resCurrent:0, resPost:0},
		{id:8, name:"奇门遁甲", type:2, resPrevious:5, resCurrent:0, resPost:0},
		{id:9, name:"炼狱火海", type:2, resPrevious:0, resCurrent:1, resPost:0},
		{id:10, name:"倾国倾城", type:2, resPrevious:2, resCurrent:0, resPost:0}
	],
	getSkills : function() { return this._skills; }
}