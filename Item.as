package
{
	import flash.display.MovieClip;
	
	public class Item extends MovieClip
	{
		public var type:String;
		
		public function Item(type:String)
		{
			super();
			
			this.type = type;
		}
	}
}