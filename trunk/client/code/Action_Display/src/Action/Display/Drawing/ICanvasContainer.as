package Action.Display.Drawing
{
	import spark.components.BorderContainer;

	public interface ICanvasContainer
	{
		function getCanvas():BorderContainer;
		function bindGraphics(graphics:CanvasGraphics):void;
	}
}