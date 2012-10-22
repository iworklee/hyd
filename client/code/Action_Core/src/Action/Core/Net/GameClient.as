package Action.Core.Net
{
	import Action.Core.Command.GameCommandFactory;
	import Action.Core.Command.IGameCommand;
	import Action.Core.GamePlayer;
	import Action.Core.Module.GameModuleFactory;
	import Action.Core.Module.IGameModule;
	
	import com.netease.protobuf.Message;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;

	public class GameClient
	{
		private var _socket:Socket = new Socket();
		private var _dataManager:GameDataManager = new GameDataManager();
		
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
			for each(var module:IGameModule in GameModuleFactory.current.getAllModules())
				module.onConnect(this, e);
		}
		
		private function onClose(e:Event):void 
		{
			for each(var module:IGameModule in GameModuleFactory.current.getAllModules())
				module.onClose(this, e);
		}	
		
		private function onReceive(e:ProgressEvent):void 
		{
			var data:GameReceiveData = _dataManager.fromSocket(_socket);
			var command:IGameCommand = GameCommandFactory.current.getCommand(data.key);
			if(command != null)
			{
				var message:Message = command.createMessage();
				message.mergeFrom(data.buffer);
				command.execute(this, message);
			}
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
		
		public function send(cmdId:int, msg:Message):void
		{
			var buffer:ByteArray = _dataManager.toByteArray(msg);
			_socket.writeInt(cmdId);
			_socket.writeInt(buffer.length);
			if(buffer.length > 0)
				_socket.writeBytes(buffer);
		}
	}
}