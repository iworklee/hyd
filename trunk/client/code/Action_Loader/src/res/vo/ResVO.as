package res.vo
{
	import res.interfaces.IResVO;

	public class ResVO implements IResVO
	{
		private var _urlName:String;
		public function get urlName():String
		{
			return this._urlName;
		}
		
		private var _isSave:Boolean;
		public function get isSave():Boolean
		{
			return this._isSave;
		}
		
		private var _byteTotal:Number;
		public function get byteTotal():Number
		{
			return this._byteTotal;
		}
		
		public function ResVO()
		{
		}
		
		protected function initVO(urlName:String, isSave:Boolean, byteTotal:Number):void
		{
			this._urlName = urlName;
			this._isSave = isSave;
			this._byteTotal = byteTotal;
		}
	}
}