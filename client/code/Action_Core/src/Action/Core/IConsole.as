package Action.Core
{
	import flash.display.BitmapData;

	public interface IConsole
	{
		function write(text:Object):void;
		function writeLine(text:Object):void;
		function drawBitmap(bitmap:BitmapData):void;
		function clear():void;
	}
}