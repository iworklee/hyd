package res.event
{
	import flash.events.Event;
	
	import res.vo.ResSwfVO;
	
	public class ResSwfLoadEvent extends Event
	{
		private var _resSwfVO:ResSwfVO;
		public function get resSwfVO():ResSwfVO
		{
			return this._resSwfVO;
		}
		
		public static const NAME:String = "ResSwfLoadEvent";
		public function ResSwfLoadEvent(resSwfVO:ResSwfVO)
		{
			super(NAME, true, false);
			this._resSwfVO = resSwfVO;
		}
	}
}