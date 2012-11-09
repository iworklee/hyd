package Action.War.Report
{
	import Action.Model.BattleEffect;
	
	import Util.NumberWrapper;

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
		
		private var _typeDescs:Array = ["闪避", "格挡", "", "暴击", "士气↑"];
		public function getTypeDesc():String
		{
			return _typeDescs[_effect.type];
		}
		
		private var _colorDescs:Array = [0x00ff00, 0x00ffff, 0xffffff, 0xff8800, 0x00ffff];		
		public function getTypeColor():int
		{
			return _colorDescs[_effect.type];
		}
		
		private var _upSpeeds:Array = [0, 0, 0, 0, 3];
		public function getTypeUpSpeed():int
		{
			return _upSpeeds[_effect.type];
		}
		
		public function getPlusHpDesc():String
		{
			return _effect.type > 0 && _effect.type < 4 ? NumberWrapper.wrap(_effect.plusHP).toText2() : "";
		}
	}
}