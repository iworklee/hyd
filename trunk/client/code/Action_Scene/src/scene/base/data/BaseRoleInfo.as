package scene.base.data
{
	public class BaseRoleInfo
	{
		private var _roleType:String;
		public function get roleType():String
		{
			return this._roleType;
		}
		
		private var _rolePosX:Number;
		public function get rolePosX():Number
		{
			return this._rolePosX;
		}
		
		private var _rolePosY:Number;
		public function get rolePosY():Number
		{
			return this._rolePosY;
		}
		
		public function BaseRoleInfo()
		{
			this._rolePosX = -1;
			this._rolePosY = -1;
		}
		
		public function initRoleInfo(roleType:String, rolePosX:Number = -1, rolePosY:Number = -1):void
		{
			this._roleType;
			this._rolePosX = rolePosX;
			this._rolePosY = rolePosY;
		}
	}
}