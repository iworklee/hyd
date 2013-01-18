package  com.svg
{
	import com.svg.font.FontConverter;
	import com.svg.parser.SvgFactory;
	
	import flash.display.BlendMode;
	import flash.display.Sprite;
	
	public class SvgSprite extends Sprite{
		
		protected var svg:XML;
		protected var settings:Settings;
		
		public function SvgSprite( xml:XML = null) 
		{ 
			if(xml)
				parse(xml);
			settings = new Settings();
			this.graphics.beginFill(0xffffff,0);
			this.graphics.drawRect(0, 0, width, height);
			this.graphics.endFill();
			this.graphics.beginFill(0xffffff,0);
			this.graphics.drawRect(0, 0, width, height);
			this.graphics.endFill();
		}
		
		public function parse( xml:XML ):void 
		{
			this.svg = XML( xml );
			new SvgFactory().parse( xml , this, settings );
		}
		
		public function addFontConversion( svgFontName:String , swfFontName:String , fontLookup:String = null ):void {
			settings.addFontConversion( new FontConverter( svgFontName, swfFontName, fontLookup ) );
		}
		
	}
	
}