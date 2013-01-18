package com.hyd.joker.core.factory
{
	import com.hyd.joker.core.facade.IDoc;
	import com.hyd.joker.core.map.BmpDoc;
	import com.hyd.joker.core.map.SvgDoc;

	public class DocumentFactory
	{
		public function DocumentFactory()
		{
			throw new Error("Static");
		}
		
		public static function createDocument(path:String):IDoc
		{
			if(path.indexOf(".svg") > -1)
				return new SvgDoc(path);
			return new BmpDoc(path);
		}
	}
}