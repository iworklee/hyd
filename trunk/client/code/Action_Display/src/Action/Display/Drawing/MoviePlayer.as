package Action.Display.Drawing
{
	import Action.Core.GamePlugins;
	
	import Util.NumberWrapper;
	
	import avmplus.getQualifiedClassName;
	
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
			if(_movie == null || _movie.isEmpty())
				throw new Error("Empty movie or empty frames");
		}
		
		private function onTimerTicked(e:TimerEvent):void
		{
			_curFrame ++;
			if(_movie.isEnd(_curFrame))
			{
				this.stop();
				return;
			}
			var renderer:IMovieFrameRenderer = _movie.getFrameRenderer(_curFrame);
			if(renderer != null)
			{
				_curRenderer = renderer;
				test("OnEnter");
				_graphics.clear();
				renderer.render(_graphics, this);
			}
			else if(_curRenderer != null)
			{
				test("OnTick");
				_graphics.clear();
				_curRenderer.render(_graphics, this);
			}
		}
		
		private function test(tag:String):void
		{		
			GamePlugins.console.writeLine(NumberWrapper.wrap(_curFrame).toText(3)
				+ " : " + _curRenderer.name + "." + tag);
			//GamePlugins.console.writeLine(_graphics.canvas.gete
			//var date:Date = new Date();
			//GamePlugins.console.writeLine(date.hours + ":" + date.minutes + ":" + date.seconds + "." + date.milliseconds);
		}
	}
}