package Action.Core
{
	public interface IConsole
	{
		function write(text:Object):void;
		function writeLine(text:Object):void;
		function clear():void;
	}
}