package Action.Core
{
	import mx.messaging.channels.StreamingAMFChannel;

	public class GamePlayer
	{
		public function GamePlayer(acc:String, pname:String)
		{
			_account = acc;
			_name = pname;
		}
		
		private var _account:String;
		public function get account():String
		{
			return _account;
		}
		
		private var _name:String;
		public function get name():String
		{
			return _name;
		}
	}
}