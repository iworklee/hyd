package animation
{
	import animation.template.UnitAnimationTemplate;

	public class AnimationTemplateManager
	{
		private static var _instance:AnimationTemplateManager;
		public static function getInstance():AnimationTemplateManager
		{
			if(!_instance)
			{
				_instance = new AnimationTemplateManager();
			}
			
			return _instance;
		}
		
		private var _unitTemplateList:Array;
		public function get unitTemplateList():Array
		{
			return this._unitTemplateList;
		}
		
		public function AnimationTemplateManager()
		{
			this._unitTemplateList = new Array();
		}
		
		public function createUnitAnimationTemplate(resId:int, unitAction:String):UnitAnimationTemplate
		{
			if(getUnitAnimationTemplateByResId(resId))
			{
				return getUnitAnimationTemplateByResId(resId);
			}
			
			var unitAnimationTemplate:UnitAnimationTemplate = new UnitAnimationTemplate();
			unitAnimationTemplate.initUnitAnimationTemplate(resId, unitAction);
			
			this._unitTemplateList[resId] = unitAnimationTemplate;
			return unitAnimationTemplate;
		}
		
		public function getUnitAnimationTemplateByResId(resId:int):UnitAnimationTemplate
		{
			if(this._unitTemplateList && this._unitTemplateList[resId])
			{
				return this._unitTemplateList[resId];
			}
			
			return null;
		}
	}
}