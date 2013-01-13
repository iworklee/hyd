import com.action.engine.GameContext;
import com.action.engine.loading.LoadingPage;
import com.action.module.command.ConnectServerCommand;
import com.haxepunk.Engine;
import com.haxepunk.HXP;
import nme.display.Sprite;
import nme.Lib;

class Main extends Engine
{
	public function new()
	{
		super(GameContext.width, GameContext.height, GameContext.frameRate, GameContext.fixed);
	}

	override public function init()
	{
#if debug
	#if flash
		if (flash.system.Capabilities.isDebugger)
	#end
		{
			HXP.console.enable();
		}
#end
		GameContext.loading = new LoadingPage();
		GameContext.init([new ConnectServerCommand()]);
	}

	public static function main()
	{
		new Main();
		//var sp:Sprite = new Sprite();
		//Lib.current.addChild(sp);
		//sp.graphics.beginFill(0xff00ff);
		//sp.graphics.drawCircle(300, 300, 200);
		//sp.graphics.endFill();
	}

}