package Action.Display.Drawing
{
	import Action.Core.GamePlugins;
	import Action.Core.Util.NumberWrapper;
	
	import avmplus.getQualifiedClassName;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class MoviePlayer extends EventDispatcher
	{		
		public static const Event_Stop:String = "Stop";
		public static const Event_Goto:String = "Goto";
		
		private const _delay:int = 25;
		private var _graphics:CanvasGraphics;
		private var _movie:Movie;
		private var _timer:Timer;
		private var _index:int = 0;
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
		
		public function get currentRenderer():IMovieFrameRenderer
		{
			return _curRenderer;
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
				_index = 0;
				_timer.start();
				onTimerTicked(null);
			}
		}
		
		public function stop():void
		{
			check();
			if(_timer.running)
			{
				_index = 0;
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
		
		private var _speed:int = 1;
		public function get speed():int
		{
			return _speed;
		}
		public function speedUp():void
		{
			_speed *= 2;
			if(_speed > 4)
				_speed = 1;
		}
		
		public function goto(frame:int):void
		{
			try
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
					_graphics.clear();
					if(_curRenderer != null)
						_curRenderer.leave(_graphics, this);
					_curRenderer = renderer;
					//test("OnEnter");
					_curRenderer.enter(_graphics, this);
					renderer.render(_graphics, this);
				}
				else if(_curRenderer != null)
				{
					_graphics.clear();
					//test("OnTick");
					_curRenderer.render(_graphics, this);
				}
				this.dispatchEvent(new Event(Event_Goto));
			}
			catch(e:Error)
			{
				stop();
				throw e;
			}
		}
		
		private function check():void
		{
			if(_movie == null || _movie.isEmpty())
				throw new Error("Empty movie or empty frames");
		}
		
		private function onTimerTicked(e:TimerEvent):void
		{
			if(_index % (4 / _speed) == 0)
				goto(_curFrame + 1);
			_index ++;
			if(_index == 10000)
				_index = 0;
		}
		
		private function test(tag:String):void
		{		
			GamePlugins.console.writeLine(NumberWrapper.wrap(_curFrame).toText(3)
				+ " : " + _curRenderer.description + "." + tag);
			//GamePlugins.console.writeLine(_graphics.canvas.gete
			//var date:Date = new Date();
			//GamePlugins.console.writeLine(date.hours + ":" + date.minutes + ":" + date.seconds + "." + date.milliseconds);
		}
	}
}