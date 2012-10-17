package animation.vo
{
	import animation.template.UnitAnimationTemplate;

	public class UnitAnimationVO extends AnimationVO
	{
		private var _unitAnimationTemplate:UnitAnimationTemplate
		public function get unitAnimationTemplate():UnitAnimationTemplate
		{
			return this._unitAnimationTemplate;
		}
		
		public function UnitAnimationVO()
		{
			super();
		}
	}
}