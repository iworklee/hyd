package battle.view
{
	import animation.vo.UnitAnimationVO;
	
	import flash.display.Sprite;
	
	import res.data.unit.UnitConfigVO;
	
	public class BattleUnitViewVO extends Sprite
	{
		private var _unitAnimationVO:UnitAnimationVO;
		public function get unitAnimationVO():UnitAnimationVO
		{
			return this._unitAnimationVO;
		}
		
		private var _placeStage:Sprite;
		public function get placeStage():Sprite
		{
			return this._placeStage;
		}
		
		public function BattleUnitViewVO()
		{
			super();
		}
		
		public function initBattleUnitViewVO(unitConfigVO:UnitConfigVO):void
		{
			if(unitConfigVO)
			{
				this._unitAnimationVO = new UnitAnimationVO(unitConfigVO);
				this.addChild(this._unitAnimationVO);
			}
		}
		
		public function placeUnitViewVO(placeStage:Sprite):void
		{
			this._placeStage = placeStage;
			if(this._placeStage && this._unitAnimationVO)
			{
				this._placeStage.addChild(this._unitAnimationVO);
			}
		}
		
		public function enterFrameProcess(passTime:Number = 0):void
		{
			if(this._unitAnimationVO)
			{
				this._unitAnimationVO.enterFrameProcess(passTime);
			}
		}
	}
}