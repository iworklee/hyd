package Action.War.Skill
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.War.Movie.BattleBoutSkillRenderer;

	public interface ISkillRenderer
	{
		function get type():int;
		function render(graphics:CanvasGraphics, index:int, frameRenderer:BattleBoutSkillRenderer):void;
		function getFrameLength():int;
		function create(skill:BattleSkill):ISkillRenderer;
	}
}