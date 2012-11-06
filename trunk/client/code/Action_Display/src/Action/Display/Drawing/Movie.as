package Action.Display.Drawing
{
	public class Movie
	{
		private var _frameRenderers:Array = new Array();
		
		private var _maxFrame:int = 0;
		public function get maxFrame():int
		{
			return _maxFrame;
		}
		
		public function Movie()
		{
		}
		
		public function getFrameRenderer(frame:int):IMovieFrameRenderer
		{
			return _frameRenderers[frame];
		}
		
		public function setFrameRenderer(frame:int, renderer:IMovieFrameRenderer):void
		{
			_frameRenderers[frame] = renderer;
			if(frame > _maxFrame)
				_maxFrame = frame;
		}
	}
}