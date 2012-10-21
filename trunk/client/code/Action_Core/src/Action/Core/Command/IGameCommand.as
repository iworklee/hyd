package Action.Core.Command
{
	import Action.Core.Net.GameClient;

	public interface IGameCommand
	{
		function get id():int;
		function execute(session:GameClient, args:GameCommandArgs):void;
	}
}