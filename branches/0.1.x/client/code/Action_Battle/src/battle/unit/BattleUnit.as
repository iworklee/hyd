package battle.unit
{
	import battle.interfaces.IBattleUnit;
	import battle.view.BattleUnitViewVO;
	
	import flash.display.Sprite;
	
	import res.data.unit.UnitConfigVO;

	public class BattleUnit implements IBattleUnit
	{
		protected var _unitConfigVO:UnitConfigVO;
		public function get unitConfigVO():UnitConfigVO
		{
			return this._unitConfigVO;
		}
		
		protected var _unitViewVO:BattleUnitViewVO;
		public function get unitViewVO():BattleUnitViewVO
		{
			return this._unitViewVO;
		}
		
		public function BattleUnit()
		{
		}
		
		public function initBattleUnit(unitConfigVO:UnitConfigVO):void
		{
			this._unitConfigVO = unitConfigVO;
			
			this._unitViewVO = new BattleUnitViewVO();
			this._unitViewVO.initBattleUnitViewVO(this._unitConfigVO);
		}
		
		public function placeUnitViewVO(placeStage:Sprite):void
		{
			if(this._unitViewVO)
			{
				this._unitViewVO.placeUnitViewVO(placeStage);
			}
		}
		
		public function enterFrameProcess(passTime:Number = 0):void
		{
			if(this._unitViewVO)
			{
				this._unitViewVO.enterFrameProcess(passTime);
			}
		}
	}
}