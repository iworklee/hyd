package battle.map
{
	import battle.view.BattleFormationViewVO;

	public class BattleFormation
	{
		public static const BATTLE_FORMATION_DEFAULT_WIDTH:int = 20;
		public static const BATTLE_FORMATION_DEFAULT_HEIGHT:int = 20;
		
		private var _formationViewVO:BattleFormationViewVO;
		public function get formationViewVO():BattleFormationViewVO
		{
			return this._formationViewVO;
		}
		
		private var _formationWidth:int;
		public function get formationWitdh():int
		{
			return this._formationWidth;
		}
		
		private var _formationHeight:int;
		public function get formationHeight():int
		{
			return this._formationHeight;
		}
		
		public function BattleFormation()
		{
		}
		
		public function createBattleFormation(formationWidth:int = BATTLE_FORMATION_DEFAULT_WIDTH, formationHeight:int = BATTLE_FORMATION_DEFAULT_HEIGHT):void
		{
			this._formationWidth = formationWidth;
			this._formationHeight = formationHeight;
		}
	}
}