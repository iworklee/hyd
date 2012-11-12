var config = 
{
	resRoot : "http://res.action.yuuhhe.com/action/",
	getValue : function(name) { return config[name]; }
};

var heros = [];
heros[225] = {id:225, name:"司马懿", skill:101, face:4};
heros[343] = {id:343, name:"曹操", skill:106, face:1};
heros[98] = {id:98, name:"关羽", skill:2, face:2};
heros[432] = {id:432, name:"张飞", skill:1, face:3};
heros[660] = {id:660, name:"吕布", skill:3, face:5};
heros[801] = {id:801, name:"曹操", skill:0, face:0};
heros[801] = {id:801, name:"曹操", skill:0, face:0};

var heroFactory =
{
	getHeros : function() { return heros; },
	getHero : function(id) { return heros[id]; }
}