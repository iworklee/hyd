package Action.Core.Util
{
	public class JsonObject
	{
		public function JsonObject()
		{
		}
		
		public function fromObject(obj:Object):void
		{			
			for(var field:String in obj)
				this[field] = obj[field];
		}
		
		public function toJson():String
		{
			return JSON.stringify(this);
		}
	}
}