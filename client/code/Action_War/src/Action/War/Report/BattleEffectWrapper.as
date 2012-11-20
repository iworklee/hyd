package Action.War.Report
{
	import Action.Model.BattleEffect;
	
	import Action.Core.Util.NumberWrapper;

	public class BattleEffectWrapper
	{
		private static var _current:BattleEffectWrapper = new BattleEffectWrapper();
		
		public static function wrap(effect:BattleEffect):BattleEffectWrapper
		{
			_current.wrap(effect);
			return _current;
		}
		
		public function BattleEffectWrapper()
		{
		}
		
		private var _effect:BattleEffect;
		public function wrap(effect:BattleEffect):void
		{
			_effect = effect;
		}
		
		private var _typeDescs:Array = ["闪避", "格挡", "", "暴击", "治疗", "士气↑", "士气↓", 
			"攻击↑", "攻击↓", "防御↑", "防御↓", "眩晕", "中毒"];
		public function getTypeDesc():String
		{
			return _typeDescs[_effect.type];
		}
		
		private var _colorDescs:Array = [0x00ff00, 0x00ffff, 0xffffff, 0xff0088, 0xff8800, 0x00ffff, 0x00ffff, 
			0x00ffff, 0x00ffff, 0x00ffff, 0x00ffff, 0x00ffff, 0x00ffff];		
		public function getTypeColor():int
		{
			return _colorDescs[_effect.type];
		}
		
		private var _upSpeeds:Array = [1, 1, 0, 1, 1, 2, -2, 2, -2, 2, -2, 0, 0];
		public function getTypeUpSpeed():int
		{
			return _upSpeeds[_effect.type];
		}
		
		public function getPlusHpDesc():String
		{
			return NumberWrapper.wrap(_effect.plusHP).toText2();
		}
	}
}