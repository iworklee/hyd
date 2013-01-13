package
{
	import Action.Model.BackdoorLoginArgs;
	
	import mx.collections.ArrayCollection;

	public class ModelCollection
	{
		private static var _current:ModelCollection = null;
		public static function get current():ModelCollection
		{
			if(_current == null)
				_current = new ModelCollection();
			return _current;
		}
		
		private var _models:Array = new Array();		
		public function ModelCollection()
		{
			_models["BackdoorLoginArgs"] = new BackdoorLoginArgs();
		}
		
		public function getModel(cls:String):Object
		{
			return _models[cls];
		}
		
		public function toArrayCollection():ArrayCollection
		{
			var ar:ArrayCollection = new ArrayCollection(["null", "bool", "int", "float", "string"]);
			for(var key:String in _models)
				ar.addItem(key);
			return ar;
		}
	}
}