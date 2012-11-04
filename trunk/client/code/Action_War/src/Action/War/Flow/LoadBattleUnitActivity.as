package Action.War.Flow
{
	import Action.Core.Flow.ActivityBase;
	import Action.Core.Flow.IActivity;
	import Action.Resource.ResourceManager;
	import Action.War.BattleUnitManager;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import org.osmf.events.LoaderEvent;
	
	public class LoadBattleUnitActivity extends ActivityBase implements IActivity
	{
		private var _battleUnitManager:BattleUnitManager;
		
		public function LoadBattleUnitActivity(buid:int)
		{
			_battleUnitManager = BattleUnitManager(ResourceManager.BUMSection.get(buid.toString()));
		}
		
		public function run():void
		{			
			if(_battleUnitManager.image == null)
			{
				var request:URLRequest = new URLRequest();  
				request.url = _battleUnitManager.getImageUrl();
				request.method = URLRequestMethod.GET;
				
				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
				loader.load(request);
			}
			else
				this.workflow.goon();
		}
		
		private function onImageLoaded(e:Event):void
		{
			_battleUnitManager.image = e.currentTarget.content;
			this.workflow.goon();
		}
	}
}