package Action.War.Skill
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.War.Movie.BattleBoutSkillRenderer;
	import Action.War.Config.BattleSkill;

	public interface ISkillRenderer
	{
		function get type():int;
		function get description():String;
		function render(graphics:CanvasGraphics, index:int, frameRenderer:BattleBoutSkillRenderer):void;
		function getFrameLength():int;
		function create(skill:BattleSkill):ISkillRenderer;
	}
}