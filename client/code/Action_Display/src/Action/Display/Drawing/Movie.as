package Action.Display.Drawing
{
	public class Movie
	{
		private var _frameRenderers:Array = new Array();
		
		private var _maxFrame:int = 0;
		private var _curFrame:int = 1;
		
		public function Movie()
		{
		}
		
		public function isEmpty():Boolean
		{
			return _maxFrame <= 0;
		}
		
		public function isEnd(frame:int):Boolean
		{
			return frame > _maxFrame;
		}
		
		public function getFrameRenderer(frame:int):IMovieFrameRenderer
		{
			return _frameRenderers[frame];
		}
		
		public function setFrameRenderer(frame:int, renderer:IMovieFrameRenderer):void
		{
			_frameRenderers[frame] = renderer;
			renderer.initialize(frame);
			if(frame > _maxFrame)
				_maxFrame = frame;
		}
		
		public function appendFrameRenderer(renderer:IMovieFrameRenderer):void
		{
			setFrameRenderer(_curFrame, renderer);
			_curFrame += renderer.getFrameLength();
		}
	}
}