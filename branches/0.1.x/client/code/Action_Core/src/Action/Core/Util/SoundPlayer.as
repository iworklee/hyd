package Action.Core.Util
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;

	public class SoundPlayer
	{
		private var _request:URLRequest;
		private var _sound:Sound;
		private var _channel:SoundChannel;
		private var _loops:int;
		
		public function SoundPlayer(url:String)
		{
			_request = new URLRequest();  
			_request.url = url;
			_request.method = URLRequestMethod.GET;			
		}
		
		public function play(loops:int=-1):void
		{
			_loops = loops;
			if(_sound != null)
			{
				_sound.removeEventListener(Event.COMPLETE, onSoundLoaded);
				_sound.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			}
			_sound = new Sound();
			_sound.addEventListener(Event.COMPLETE, onSoundLoaded);
			_sound.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			_sound.load(_request);
		}
		
		public function stop():void
		{
			_channel.stop();
		}
		
		private function onSoundLoaded(e:Event):void
		{
			_channel = _sound.play(0, _loops);
		}
		
		private function onIOError(e:Event):void
		{
			
		}
	}
}