package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
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
		
		private function initializeEventListener(event:Event):void
		{
			
			//this.addEventListener(Event.ENTER_FRAME, enterFrameListener);
		}
		
		/*private function enterFrameListener(event:Event):void
		{
			this.x = myPlayer.x + deltaX;
			this.y = myPlayer.y + deltaY;
		}*/
		
		public function fire():void
		{
			trace("fire x: " + this.x + " y: " + y);
			var bullet:Bullet = new Bullet(this.x, this.y, 10, 3);
			trace(parent.parent.parent.toString());
			parent.parent.addChild(bullet);
		}
	}
}