package Action.Display.Decorator
{
	import flash.events.Event;
	
	import mx.core.UIComponent;
	
	public class DisplayDecoratorBuilder
	{
		public static function create(buddies:Array=null):DisplayDecoratorBuilder
		{
			return new DisplayDecoratorBuilder(buddies);
		}
		
		private var _elements:Array;
		private var _decorators:Array;
		
		public function DisplayDecoratorBuilder(buddies:Array)
		{
			_elements = buddies != null ? buddies : new Array();
			_decorators = new Array();
		}
		
		public function appendElement(element:UIComponent):DisplayDecoratorBuilder
		{
			_elements.push(element);
			return this;
		}
		
		public function appendDecorator(event:String, decorator:IDisplayDecorator):DisplayDecoratorBuilder
		{
			_decorators[event] = decorator;
			return this;
		}
		
		public function build():void
		{
			for(var event:String in _decorators)
			{
				var decorator:IDisplayDecorator = _decorators[event] as IDisplayDecorator;
				if(decorator != null)		
				{
					for each(var element:UIComponent in _elements)				
						element.addEventListener(event, callback(decorator, element));
				}
			}
		}
		
		private function callback(decorator:IDisplayDecorator, element:UIComponent):Function{
			var func:Function=function(e:Event):void{
				decorator.decorate(element);
			}
			return func;
		}
	}
}