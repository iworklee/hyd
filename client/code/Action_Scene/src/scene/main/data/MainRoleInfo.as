package scene.main.data
{
	import scene.base.data.BaseRoleInfo;
	
	public class MainRoleInfo extends BaseRoleInfo
	{
		public function MainRoleInfo()
		{
			super();
		}
		
		public function initMainRoleInfo(roleType:String, rolePosX:Number = -1, rolePosY:Number = -1):void
		{
			super.initRoleInfo(roleType, rolePosX, rolePosY);
		}
	}
}