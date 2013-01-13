package com.action.engine;
import com.action.engine.command.ICommand;
import com.action.engine.config.GameConfig;
import com.action.engine.control.Console;
import com.action.engine.control.Layer;
import com.action.engine.framework.Player;
import com.action.engine.framework.Scene;
import com.action.engine.loading.LoadingPage;
import com.action.engine.network.HttpClient;
import com.action.engine.network.LocalResource;
import com.action.engine.network.RemoteResource;
import com.action.engine.workflow.LoadBitmapActivity;
import com.action.engine.workflow.Workflow;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.utils.Key;
import com.haxepunk.World;
import nme.display.Sprite;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.events.KeyboardEvent;

/**
 * ...
 * @author east
 */

class GameContext
{	
	public static inline var width:Int = 760;
	public static inline var height:Int = 600;
	public static inline var frameRate:Int = 30;
	public static inline var fixed:Bool = true;
	
	public static var player:Player;
	public static var client:HttpClient;
	public static var loading:LoadingPage;
	
	private static var _localResource:LocalResource;
	private static var _remoteResource:RemoteResource;	
	private static var _config:GameConfig;
	private static var _commands:IntHash<ICommand>;
	
	private static var _scenes:IntHash<Scene>;
	private static var _currentScene:Scene;
	
	private static var _pannelLayer:Layer;
	private static var _consoleLayer:Layer;
	private static var _console:Console;
	
	private static var _currentPannel:Sprite;
	
	public static function init(cmds:Array<ICommand>):Void
	{	//init resource
		_localResource = new LocalResource();
		_remoteResource = new RemoteResource();
		
		//init layers
		HXP.engine.addChild(_pannelLayer = new Layer());
		HXP.engine.addChild(_consoleLayer = new Layer());
		
		//init events
		HXP.stage.addEventListener(KeyboardEvent.KEY_UP, HXP_engine_keyup);
		
		//init console
		_consoleLayer.addControl(_console = new Console());
		
		//init config
		_config = new GameConfig();
		
		//init commands
		_commands = new IntHash<ICommand>();
		for (cmd in cmds)
		{
			_commands.set(cmd.id, cmd);
		}
		
		//init hxp		
		HXP.defaultFont = "font/arial.ttf";
		HXP.stage.scaleMode = StageScaleMode.NO_SCALE;
		HXP.stage.align = StageAlign.TOP_LEFT;
		HXP.screen.color = 0x333333;
		HXP.screen.scale = 1;
		
		onInit();
		
		/*var workFlow:Workflow = Workflow.create(loading, [new LoadBitmapActivity("battle/001.JPG")]);
		workFlow.onComplete = onInit;
		workFlow.goon();*/
	}
	
	private static function HXP_engine_keyup(e:KeyboardEvent):Void
	{
		if (e.keyCode == Key.ESCAPE)
		{
			_console.visible = !_console.visible;
		}
	}
	
	private static function onInit():Void
	{
		switchScene(120);
		//switchScene(101);
		//GameContext.output.writeLine("cctv123,101");
	}
	
	private static inline function get_localResource():LocalResource 
	{
		return _localResource;
	}	
	public static var localResource(get_localResource, null):LocalResource;
	
	private static inline function get_remoteResource():RemoteResource 
	{
		return _remoteResource;
	}	
	public static var remoteResource(get_remoteResource, null):RemoteResource;	
	
	private static inline function get_console():Console
	{
		return _console;
	}
	public static var console(get_console, null):Console;
	
	private static inline function get_config():GameConfig 
	{
		return _config;
	}	
	public static var config(get_config, null):GameConfig;
	
	public static function getCommand(id:Int):ICommand
	{
		return _commands.get(id);
	}
	
	public static function getCommands():Array<ICommand>
	{
		var array = new Array<ICommand>();
		for (cmd in _commands)
		{
			array.push(cmd);
		}
		return array;
	}
	
	private static inline function get_currentScene():Scene 
	{
		return _currentScene;
	}	
	public static var currentScene(get_currentScene, null):Scene;
	
	public static function createScenes(sids:Array<Int>):Void
	{
		_scenes = new IntHash();
		for (sid in sids)
		{
			_scenes.set(sid, new Scene(sid));
		}
	}
	
	public static function switchScene(sid:Int):Void
	{
		beginSwitchScene(_scenes.get(sid));
	}
	
	public static function beginSwitchScene(scene:Scene):Void
	{
		if (scene != null)
		{
			if (_currentScene == null || _currentScene.id != scene.id)
			{
				if (_currentScene != null)
					_currentScene.end();
				HXP.world = cast(loading, World);
				scene.preload();
			}
		}
	}
	
	public static function endSwitchScene(scene:Scene):Void
	{
		HXP.world = _currentScene = scene;
	}
	
	public static function changePanel(panel:Sprite):Void
	{
		if (panel != null)
		{
			if (_currentPannel != null)
				_pannelLayer.removeChild(_currentPannel);
			_pannelLayer.addChild(_currentPannel = panel);				
			panel.width = GameContext.width;
			panel.height = GameContext.height;
		}
	}
	
	public static function runScript(script:String):Dynamic
	{
		return "Script engine is not prepared.";
	}
}