var config = {
	resRoot : "http://hyd.googlecode.com/svn/trunk/client/raw/Action/",
	policy : "http://res.action.yuuhhe.com/crossdomain.xml",
	getValue : function(name) { return config[name]; }
};

var commands = {
	_commands : [
		{name:"MapPanTool", type:"tool", text:"平移"},
		{name:"MapZoomInCommand", type:"command", text:"放大"},
		{name:"MapZoomOutCommand", type:"command", text:"缩小"},
		{name:"DistanceTool", type:"tool", text:"测距"}
	],
	all : function() { return this._commands; }
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