package
{
	public class MyConvert
	{
		public function MyConvert()
		{
		}
		
		public static function toBool(text:String, dft:Boolean=false):Boolean
		{
			try{return Boolean(parseInt(text));}
			catch(e:Error){}
			return dft;
		}
		
		public static function toInt(text:String, dft:int=0):int
		{
			try{return parseInt(text);}
			catch(e:Error){}
			return dft;
		}
		
		public static function toFloat(text:String, dft:Number=0):Number
		{
			try{return parseFloat(text);}
			catch(e:Error){}
			return dft;
		}
	}
}