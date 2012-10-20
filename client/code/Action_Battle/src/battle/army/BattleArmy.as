package battle.army
{
	import battle.interfaces.IBattleUnit;
	
	import res.data.unit.UnitConfigVO;

	public class BattleArmy
	{
		private var _armyMaxSize:int;
		public function get armyMaxsize():int
		{
			return this._armyMaxSize;
		}
		
		private var _currentArmySize:int;
		public function get currentArmySize():int
		{
			return this._currentArmySize;
		}
		
		public function BattleArmy()
		{
		}
		
		public function createBattleArmy(armySize:int):void
		{
			if(armySize > 0)
			{
				this._armyMaxSize = armySize;
			}
		}
		
		public function createNewUnit(unitConfigVO:UnitConfigVO, unitType:String):void
		{
			
		}
	}
}