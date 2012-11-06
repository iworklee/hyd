package Action.Display.Drawing
{
	public interface IMovieFrameRenderer
	{
		function get name():String;
		function initialize(frame:int):void;
		function render(graphics:CanvasGraphics, player:MoviePlayer):void;
		function getFrameLength():int;
	}
}