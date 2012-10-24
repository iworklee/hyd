package animation.template
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;
	
	import res.ResLoaderManager;
	import res.data.ConfigDataManager;
	import res.data.animation.action.ActionUnitConfig;
	import res.data.animation.bitmap.PartConfigVO;
	import res.enum.ResTypeEnum;
	import res.data.res.ResUrlVO;
	import res.vo.ResSwfVO;

	public class UnitAnimationTemplate extends AnimationTemplate
	{
		private var _unitResId:int;
		public function get unitResId():int
		{
			return this._unitResId;
		}
		
		private var _unitAction:String;
		public function get unitAction():String
		{
			return this._unitAction;
		}
		
		private var _partBitmapDataList:Array;
		public function get partBitmapDataList():Array
		{
			return this._partBitmapDataList;
		}
		
		private var _isInitComplete:Boolean;
		public function get isInitComplete():Boolean
		{
			return this._isInitComplete;
		}
		
		public function UnitAnimationTemplate()
		{
			super();
			this._partBitmapDataList = new Array();
			this._isInitComplete = false;
		}
		
		public function initUnitAnimationTemplate(resId:int, unitAction:String):void
		{
			this._unitResId = resId;
			this._unitAction = unitAction;
			
			var actionUnitConfig:ActionUnitConfig = ConfigDataManager.getInstance().getActionUnitConfigByClass(this._unitAction);
			if(actionUnitConfig)
			{
				this.initActionUnitConfig(actionUnitConfig);
			}
			
			this.initBitmapData();
		}
		
		private function initBitmapData():void
		{
			if(this._unitResId > 0)
			{
				var resUrlVO:ResUrlVO = ConfigDataManager.getInstance().getResUrlVOByResClass(ResTypeEnum.RES_TYPE_UNIT);
				if(resUrlVO)
				{
					var unitBitmapResURL:String = resUrlVO.url + this._unitResId.toString() + "." + resUrlVO.type;
					ResLoaderManager.getInstance().loadSwfByURL(unitBitmapResURL, false, initBitmapDataComplete);
				}
			}
		}
		
		private function initBitmapDataComplete(resSwfVO:ResSwfVO):void
		{
			this._partBitmapDataList = new Array();
			for each(var partConfigVO:PartConfigVO in this._animationConfigVO.partConfigVOList)
			{
				var partClassName:String = "animation_" + this._unitResId.toString() + "_" + partConfigVO.type;
				var partClass:Class = getDefinitionByName(partClassName) as Class;
				
				if(partClass)
				{
					var partBitmapData:BitmapData = new partClass;
					this._partBitmapDataList[partConfigVO.type] = partBitmapData;
				}
			}
			
			this._isInitComplete = true;
		}
	}
}