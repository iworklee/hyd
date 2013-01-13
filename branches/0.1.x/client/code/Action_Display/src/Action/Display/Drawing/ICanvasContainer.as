package Action.Display.Drawing
{
	import spark.components.BorderContainer;

	public interface ICanvasContainer
	{
		function get title():String;
		function set title(value:String):void;
		function bindPlayers(player1:String, player2:String):void;
		function showMessage(text:String):void;
		function getCanvas():BorderContainer;
	}
}