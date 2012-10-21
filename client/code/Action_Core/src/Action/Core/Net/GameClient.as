package Action.Core.Net
{
	import Action.Core.GamePlayer;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;

	public class GameClient
	{
		private var _socket:Socket = new Socket();
		private var _serializer:GameDataSerializer = new GameDataSerializer();
		
		public function GameClient()
		{
		}
		
		private static var _current:GameClient = null;
		public static function get current():GameClient
		{
			return _current;
		}
		
		public static function create():GameClient
		{
			return _current = new GameClient();
		}
		
		public function connected():Boolean
		{
			return _socket.connected;
		}
		
		public function connect(host:String, port:int):void
		{
			_socket.addEventListener(Event.CONNECT, onConnect);
			_socket.addEventListener(Event.CLOSE, onClose);	
			_socket.addEventListener(ProgressEvent.SOCKET_DATA, onReceive);
			_socket.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			_socket.connect(host, port);
		}
		
		private function onConnect(e:Event):void
		{
			
		}
		
		private function onClose(e:Event):void 
		{
			
		}	
		
		private function onReceive(e:ProgressEvent):void 
		{
			
		}
		
		private function onIOError(e:IOErrorEvent):void 
		{
			
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void
		{
			
		}	
		
		private var _player:GamePlayer = null;
		public function get player():GamePlayer
		{
			return _player;
		}
		
		public function bind(player:GamePlayer):void
		{
			_player = player;
		}
		
		public function send(cmdId:int, data:Object):void
		{
			
		}
	}
}