package com.action.engine.control;
import com.action.engine.GameContext;
import com.haxepunk.utils.Key;
import nme.text.TextField;
import nme.text.TextFormat;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.events.MouseEvent;
import nme.text.TextFieldAutoSize;
import nme.text.TextFieldType;

/**
 * ...
 * @author east
 */

class Console extends Control
{
	private var _tfOutput:TextField;
	private var _tfInput:TextField;
	public function new() 
	{
		super();
	}
	
	public override function init():Void 
	{
		if (_tfOutput == null)
		{
			addChild(_tfOutput = new TextField());			
			_tfOutput.textColor = 0xffffff;
			_tfOutput.border = true;
			_tfOutput.borderColor = 0x88ff88;
			_tfOutput.autoSize = TextFieldAutoSize.NONE;
			_tfOutput.multiline = true;
			_tfOutput.wordWrap = true;
			_tfOutput.x = 90;
			_tfOutput.y = 450;
			_tfOutput.width = GameContext.width - _tfOutput.x - 5;
			_tfOutput.height = GameContext.height - _tfOutput.y - 50;
		}
		if (_tfInput == null)
		{
			addChild(_tfInput = new TextField());
			_tfInput.addEventListener(KeyboardEvent.KEY_UP, _tfInput_keyup);
			_tfInput.type = TextFieldType.INPUT;
			_tfInput.textColor = 0xffffff;
			_tfInput.border = true;
			_tfInput.borderColor = 0xffff88;
			_tfInput.autoSize = TextFieldAutoSize.NONE;
			_tfInput.x = 90;
			_tfInput.y = 555;
			_tfInput.width = GameContext.width - _tfInput.x - 5;
			_tfInput.height = GameContext.height - _tfInput.y - 22;
		}
	}
	
	private function _tfInput_keyup(e:KeyboardEvent):Void
	{
		if (e.keyCode == Key.ENTER)
		{
			write(">>");
			writeLine(_tfInput.text);
			write("<<");
			writeLine(GameContext.runScript(_tfInput.text));		
			_tfInput.text = "";
		}
	}
	
	public function write(obj:Dynamic):Void
	{
		var text:String = obj != null ? obj.toString() : "";
		_tfOutput.appendText(text);
	}
	
	public function writeLine(obj:Dynamic):Void
	{
		write(obj);
		_tfOutput.appendText("\n");
		_tfOutput.scrollV = _tfOutput.maxScrollV;
	}
	
	public function clear():Void
	{
		_tfOutput.text = "";
	}
}