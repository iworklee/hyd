package Action.Display.Drawing
{
	public interface IMovieFrameRenderer
	{
		function get description():String;
		function initialize(frame:int):void;
		function bind(player:MoviePlayer):void;
		function enter(graphics:CanvasGraphics):void;
		function render(graphics:CanvasGraphics):void;
		function leave(graphics:CanvasGraphics):void;
		function getFrameLength():int;
	}
}