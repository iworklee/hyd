package assets
{
	public class IconAssects
	{
		public function IconAssects()
		{
			throw new Error("Static");
		}
		
		
		[Embed(source="assets/icon/Add.png")]
		public static var HelloCommand:Class;
		
		[Embed(source="assets/icon/Pan.png")]
		public static var MapPanTool:Class;
		
		[Embed(source="assets/icon/ZoomIn.png")]
		public static var MapZoomInTool:Class;
		
		[Embed(source="assets/icon/ZoomOut.png")]
		public static var MapZoomOutTool:Class;
		
		[Embed(source="assets/icon/Distance.png")]
		public static var DistanceTool:Class;
	}	
}