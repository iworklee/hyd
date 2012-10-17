package res.event
{
	import flash.events.Event;
	
	import res.vo.ResXmlVO;
	
	public class ResXmlLoadEvent extends Event
	{
		private var _resXmlVO:ResXmlVO;
		public function get resXmlVO():ResXmlVO
		{
			return this._resXmlVO;
		}
		
		public static const NAME:String = "ResXmlLoadEvent";
		public function ResXmlLoadEvent(resXmlVO:ResXmlVO)
		{
			super(NAME, true, false);
			this._resXmlVO = resXmlVO;
		}
	}
}