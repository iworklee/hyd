package Action.Display.Drawing
{
	import spark.components.BorderContainer;

	public interface ICanvasContainer
	{
		function get title():String;
		function set title(value:String):void;
		function getCanvas():BorderContainer;
	}
}