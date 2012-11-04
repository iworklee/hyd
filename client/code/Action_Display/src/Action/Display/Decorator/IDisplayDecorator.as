package Action.Display.Decorator
{
	import mx.core.IVisualElement;
	import mx.core.UIComponent;

	public interface IDisplayDecorator
	{
		function decorate(element:UIComponent):void;
	}
}