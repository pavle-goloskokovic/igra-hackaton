package
{
	import flash.display.MovieClip;
	
	public class Weapon extends MovieClip
	{
		private var myPlayer:Player;
		
		public var deltaX:Number = 0;
		public var deltaY:Number = 0;
		
		public function Weapon(myPlayer:Player)
		{
			super();
			
			this.myPlayer = myPlayer;
			
			this.addEventListener(Event.ADDED, initializeEventListener);
		}
		
		private function initializeEventListener(event:Event)
		{
			
			this.addEventListener(Event.ENTER_FRAME, enterFrameListener);
		}
		
		private function enterFrameListener(event:Event)
		{
			this.x = myPlayer.x + deltaX;
			this.y = myPlayer.y + deltaY;
		}
		
		public function fire()
		{
			
		}
	}
}