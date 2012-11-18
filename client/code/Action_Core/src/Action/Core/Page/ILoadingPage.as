package Action.Core.Page
{
	public interface ILoadingPage extends IGamePage
	{
		function setProgress(value:int, total:int):void;
	}
}