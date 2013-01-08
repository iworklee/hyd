package com.action.engine.framework;
import com.action.engine.GameContext;
import com.action.engine.workflow.LoadBitmapActivity;
import com.action.engine.workflow.Workflow;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;
import com.haxepunk.World;
import flash.text.TextField;
import nme.Assets;
import nme.display.SimpleButton;
import nme.display.Sprite;
import nme.text.TextFieldAutoSize;

/**
 * ...
 * @author east
 */

class Scene extends World
{
	private var _id:Int;
	private var _workflow:Workflow;
	private var _panel:Sprite;
	
	public function new(id:Int) 
	{
		super();
		_id = id;
	}
		
	private inline function get_id():Int
	{
		return _id;
	}
	public var id(get_id, null):Int;
	
	override public function begin():Dynamic 
	{
		super.begin();
		//loadPanel();
		
		addGraphic(new Image(GameContext.remoteResource.getBitmap("battle/001.JPG")));
		
		//var sprite = cast(HXP.engine.getChildAt(1), Sprite);
		//new SVG(Assets.getText("svg/nme.svg")).render(sprite.graphics, 100, 100, 100, 100);
		
		//add(GameContext.output);
		for(i in 0...13)
			GameContext.console.writeLine("Console.writeLine_" + i);
	}
	
	override public function end():Dynamic 
	{
		super.end();
		trace(id);
	}
	
	public function beginAdd(entity:EntityEx):Void
	{
		entity.preload();
	}
	
	public function endAdd(entity:EntityEx):Void
	{
		add(entity);
	}
	
	private function createLoadingFlow():Workflow
	{
		//return null;
		return Workflow.create(GameContext.loading, [new LoadBitmapActivity("battle/001.JPG")]);
	}
	
	public function preload():Void
	{
		_workflow = createLoadingFlow();
		if (_workflow != null)
		{
			_workflow.onComplete = onload;
			_workflow.goon();
		}
		else
			onload();
	}
	
	private function onload():Void
	{
		GameContext.endSwitchScene(this);
	}	
	
	private function loadPanel():Void
	{
		if (_panel == null)
		{
			_panel = new Sprite();
			var txt:TextField = new TextField();
			txt.autoSize = TextFieldAutoSize.NONE;//这边要设置成none才行
			txt.wordWrap = true; //设置自动换行
			txt.multiline = true; //允许多行
			txt.text = "abcdefghijklmnopzrstuvwxyz";
			txt.width = 300;
			_panel.addChild(txt);
			/*_panel.graphics.beginFill(0x0000ff);
			_panel.graphics.drawCircle(200, 200, 100);
			_panel.graphics.endFill();*/
		}		
		GameContext.changePanel(_panel);
	}
}