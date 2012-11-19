var config = {
	resRoot : "http://res.action.yuuhhe.com/Action/",
	policy : "http://res.action.yuuhhe.com/crossdomain.xml",
	getValue : function(name) { return config[name]; }
};

var heroFactory = {	
	_heros : [
		{id:0, name:"城墙", skill:0, face:0, body:0, unit:0},
		{id:98, name:"关羽", skill:4, face:4, body:4, unit:4},
		{id:225, name:"司马懿", skill:2, face:2, body:2, unit:2},
		{id:343, name:"曹操", skill:1, face:1, body:1, unit:1},
		{id:432, name:"张飞", skill:5, face:5, body:5, unit:5},
		{id:660, name:"吕布", skill:3, face:3, body:3, unit:3},
		{id:801, name:"步兵", skill:0, face:100, body:101, unit:101},
		{id:802, name:"骑兵", skill:0, face:100, body:102, unit:102},
		{id:803, name:"骑弓", skill:0, face:100, body:103, unit:103},
		{id:804, name:"弓兵", skill:0, face:100, body:104, unit:104},
		{id:805, name:"兵器", skill:0, face:100, body:105, unit:105}
	],
	_test:{name:"cctv"},
	getHeros : function() { return this._heros; }
}

var skillFactory = {
	_skills : [
		{id:0, name:"", type:0, resPrevious:0, resCurrent:0, resPost:0},
		{id:1, name:"天下归心", type:2, resPrevious:2, resCurrent:0, resPost:0},
		{id:2, name:"天神守护", type:2, resPrevious:0, resCurrent:1, resPost:0},
		{id:3, name:"无双乱舞", type:3, resPrevious:0, resCurrent:0, resPost:0},
		{id:4, name:"拖刀一击", type:3, resPrevious:0, resCurrent:0, resPost:0},
		{id:5, name:"震天咆哮", type:3, resPrevious:0, resCurrent:0, resPost:0}
	],
	getSkills : function() { return this._skills; }
}