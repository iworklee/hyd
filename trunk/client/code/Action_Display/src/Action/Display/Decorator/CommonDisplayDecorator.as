package Action.Display.Decorator
{
	import mx.core.UIComponent;
	
	public class CommonDisplayDecorator implements IDisplayDecorator
	{
		public function CommonDisplayDecorator()
		{
			
		}
		
		
		public var color:String = null;
		public var fontFamily:String = null;
		public var fontSize:int = 0;
		public var fontWeight:int;
		
		public function decorate(element:UIComponent):void
		{
			if(color != null)
				element.setStyle("color", color);
			if(fontFamily != null)
				element.setStyle("fontFamily", fontFamily);
			if(fontSize > 0)
				element.setStyle("fontSize", fontSize);
			if(fontWeight > 0)
				element.setStyle("fontWeight", fontWeight);
		}
	}
}