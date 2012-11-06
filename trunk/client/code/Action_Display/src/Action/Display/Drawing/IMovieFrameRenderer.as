package Action.Display.Drawing
{
	public interface IMovieFrameRenderer
	{
		function renderOnEnter(graphics:CanvasGraphics, player:MoviePlayer):void;
		function renderOnTick(graphics:CanvasGraphics, player:MoviePlayer):void;
	}
}