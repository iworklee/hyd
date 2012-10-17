package animation.template
{
	import res.data.ConfigDataManager;
	import res.data.animation.action.ActionUnitConfig;
	import res.data.animation.bitmap.AnimationConfigVO;

	public class AnimationTemplate
	{
		protected var _animationConfigVO:AnimationConfigVO;
		public function get animationConfigVO():AnimationConfigVO
		{
			return this._animationConfigVO;
		}
		
		protected var _actionUnitConfig:ActionUnitConfig;
		public function get actionUnitConfig():ActionUnitConfig
		{
			return this._actionUnitConfig;
		}
		
		public function AnimationTemplate()
		{
		}
		
		protected function initActionUnitConfig(actionUnitConfig:ActionUnitConfig):void
		{
			var initAnimationConfigVO:AnimationConfigVO = ConfigDataManager.getInstance().getAnimationConfigVOByType(actionUnitConfig.animationType);
			if(initAnimationConfigVO)
			{
				this._animationConfigVO = initAnimationConfigVO;
			}
		}
	}
}