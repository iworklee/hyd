package Action.Display.Drawing
{
	import Action.Core.GamePlugins;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class MoviePlayer
	{		
		private const _delay:int = 100;
		private var _graphics:CanvasGraphics;
		private var _movie:Movie;
		private var _timer:Timer;
		private var _curRenderer:IMovieFrameRenderer;
		
		private var _curFrame:int = 0;
		public function get currentFrame():int
		{
			return _curFrame;
		}
		
		public function gotoFrame(frame:int):void
		{
			_curFrame = frame;
		}
		
		public function MoviePlayer(graphics:CanvasGraphics)
		{
			_graphics = graphics;
			_timer = new Timer(_delay);
			_timer.addEventListener(TimerEvent.TIMER, onTimerTicked);
		}
		
		public function load(movie:Movie):void
		{
			_movie = movie;
		}
		
		public function start():void
		{
			check();
			if(!_timer.running)
			{
				_timer.start();
				onTimerTicked(null);
			}
		}
		
		public function stop():void
		{
			check();
			if(_timer.running)
			{
				_timer.stop();
				_curFrame = 0;
			}
		}
		
		private function check():void
		{
			if(_movie == null || _movie.maxFrame == 0)
				throw new Error("Empty movie or empty frames");
		}
		
		private function onTimerTicked(e:TimerEvent):void
		{
			_curFrame ++;
			test();
			if(_curFrame > _movie.maxFrame)
			{
				this.stop();
				return;
			}
			var renderer:IMovieFrameRenderer = _movie.getFrameRenderer(_curFrame);
			if(renderer != null)
			{
				_graphics.clear();
				renderer.renderOnEnter(_graphics, this);
				_curRenderer = renderer;
			}
			else if(_curRenderer != null)
			{
				_graphics.clear();
				_curRenderer.renderOnTick(_graphics, this);
			}
		}
		
		private function test():void
		{		
			//GamePlugins.console.writeLine(_graphics.canvas.gete
			//var date:Date = new Date();
			//GamePlugins.console.writeLine(date.hours + ":" + date.minutes + ":" + date.seconds + "." + date.milliseconds);
		}
	}
}