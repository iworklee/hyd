package Action.Core.Net
{
	import Action.Core.Command.GameCommandFactory;
	import Action.Core.Command.IGameCommand;
	import Action.Core.GamePlayer;
	import Action.Core.Module.GameModuleFactory;
	import Action.Core.Module.IGameModule;
	import Action.Core.ReceiveEvent;
	import Action.Core.Serial.IGameDataSerializer;
	
	import avmplus.getQualifiedClassName;
	
	import com.netease.protobuf.Message;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.Endian;

	public class GameClient
	{		
		private static var _current:GameClient = null;
		public static function get current():GameClient
		{
			return _current;
		}
		
		public static function create():GameClient
		{
			return _current = new GameClient();
		}
		
		private var _socket:Socket;
		private var _dataManager:GameDataManager = new GameDataManager();
		
		public function GameClient()
		{
			resetSocket();
		}
		
		private function resetSocket():void
		{
			_socket = new Socket();
			_socket.endian = Endian.LITTLE_ENDIAN;
		}
		
		public function get connected():Boolean
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
		
		public function close():void
		{
			_socket.close();
			onClose(null);
		}
		
		private function onConnect(e:Event):void
		{
			for each(var module:IGameModule in GameModuleFactory.current.getAllModules())
				module.onConnect(this, e);
		}
		
		private function onClose(e:Event):void 
		{
			resetSocket();
			for each(var module:IGameModule in GameModuleFactory.current.getAllModules())
				module.onClose(this, e);
		}	
		
		private function onReceive(e:ProgressEvent):void 
		{			
			var data:GameReceiveData = _dataManager.fromSocket(_socket);
			if(data == null)
				return;
			
			var command:IGameCommand = GameCommandFactory.current.getCommand(data.key);			
			var evt:ReceiveEvent = new ReceiveEvent("onReceive", e.bubbles, e.cancelable);
			evt.cmdId = data.key;
			
			if(command != null)
			{
				var args:Object = command.serializer != null 
					? command.serializer.deserialize(data.buffer) : null;
				command.execute(this, args);
				
				evt.cmdId = data.key;
				evt.cmdName = getQualifiedClassName(command);
				evt.cmdArgs = args;
			}
			
			for each(var module:IGameModule in GameModuleFactory.current.getAllModules())
				module.onReceive(this, evt);
		}
		
		private function onIOError(e:IOErrorEvent):void 
		{
			for each(var module:IGameModule in GameModuleFactory.current.getAllModules())
				module.onIOError(this, e);
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void
		{
			trace("GameClient.onSecurityError");
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
		
		public function sendNull(cmdId:int):void
		{
			_socket.writeInt(cmdId);
			_socket.writeInt(0);
			_socket.flush();
		}		
		
		public function sendBoolean(cmdId:int, data:Boolean):void
		{
			_socket.writeInt(cmdId);
			_socket.writeInt(1);
			_socket.writeBoolean(data);
			_socket.flush();
		}
		
		public function sendInt(cmdId:int, data:int):void
		{
			_socket.writeInt(cmdId);
			_socket.writeInt(4);
			_socket.writeInt(data);
			_socket.flush();
		}
		
		public function sendFloat(cmdId:int, data:Number):void
		{
			_socket.writeInt(cmdId);
			_socket.writeInt(4);
			_socket.writeFloat(data);
			_socket.flush();
		}
		
		public function sendString(cmdId:int, data:String):void
		{
			var buffer:ByteArray = new ByteArray();
			buffer.writeUTFBytes(data);
			_socket.writeInt(cmdId);			
			_socket.writeInt(buffer.length);
			_socket.writeBytes(buffer);
			_socket.flush();
		}
		
		public function sendMessage(cmdId:int, data:Message):void
		{
			if(data == null)
				return;
			var buffer:ByteArray = _dataManager.toByteArray(data);
			_socket.writeInt(cmdId);
			_socket.writeInt(buffer.length);
			if(buffer.length > 0)
				_socket.writeBytes(buffer);
			_socket.flush();
		}
	}
}