package Action.Core
{
	public interface IConsole
	{
		function write(text:String):void;
		function writeLine(text:String):void;
		function clear():void;
	}
}