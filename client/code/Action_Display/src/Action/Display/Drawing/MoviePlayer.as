package Action.Display.Drawing
{
	import Action.Core.GamePlugins;
	
	import Util.NumberWrapper;
	
	import avmplus.getQualifiedClassName;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class MoviePlayer extends EventDispatcher
	{		
		public static const Event_Stop:String = "Stop";
		public static const Event_Goto:String = "Goto";
		
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
		
		public function get movie():Movie
		{
			return _movie;
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
				this.dispatchEvent(new Event(Event_Stop));
			}
		}
		
		public function get running():Boolean
		{
			return _timer.running;
		}
		
		public function pause(p:Boolean):void
		{
			if(p)
				_timer.stop();
			else
				_timer.start();
		}
		
		public function goto(frame:int):void
		{
			_curFrame = frame;
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
			this.dispatchEvent(new Event(Event_Goto));
		}
		
		private function check():void
		{
			if(_movie == null || _movie.isEmpty())
				throw new Error("Empty movie or empty frames");
		}
		
		private function onTimerTicked(e:TimerEvent):void
		{
			goto(_curFrame + 1);			
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