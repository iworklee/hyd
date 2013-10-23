var config = {
	resRoot : "http://localhost:1024/caocao/",
	policy : "http://res.action.yuuhhe.com/crossdomain.xml",
	getValue : function(name) { return config[name]; }
};

var factory = {
	_commands : [
		{name:"MapPanTool", text:"平移"},
		{name:"MapZoomInTool", text:"放大"},
		{name:"MapZoomOutTool", text:"缩小"},
		{name:"DistanceTool", text:"测距"}
	],
	commands : function() { return this._commands; },
	
	_catalog : {
		name : "top", 
		text : "所有资源",
		children : [
			{
				name : "Hero",
				text : "英雄",
				children : [
					{name:"e001", text:"曹操", type:"image", label:"【曹操】", data:"Action/wait/w001.png", checked:true},
					{name:"e002", text:"司马懿", type:"image", label:"【司马懿】", data:"Action/wait/w002.png"},
					{name:"e003", text:"吕布", type:"image", label:"【吕布】", data:"Action/wait/w003.png"}
				]
			},
			{
				name : "Building",
				text : "建筑",
				children : []
			}
		]
	},
	catalog : function() { return this._catalog; }
};

var url = {
	getParam : function(param) {
		param += "=";
		var p = location.href.indexOf(param);
		if(p < 0)
			return "";
		var result = location.href.substring(p + param.length);
		var q = result.indexOf("&");
		if(q < 0)
			return result;
		return result.substring(0, q);
	}
}