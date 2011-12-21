package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Weapon extends MovieClip
	{
		private var myPlayer:Player;
		
		public var deltaX:Number = 0;
		public var deltaY:Number = 0;
		
		public var weaponFrame:int = 1;
		
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
			var bullet:Bullet;
			
			if(weaponFrame == 1)
			{
				bullet = new Bullet(this.x + parent.x, this.y + parent.y, 11, 20);
				bullet.setFrame(1);
				parent.parent.addChild(bullet);
				bullet.fireBullet();
			}
			else if(weaponFrame == 2)
			{
				bullet = new Bullet(this.x + parent.x, this.y + parent.y, 21, 20);
				bullet.setFrame(2);
				parent.parent.addChild(bullet);
				bullet.fireBullet();
			}
			
		}
		
		public function setFrame(frame:uint):void
		{
			weaponFrame = frame;
			this.gotoAndStop(frame);
		}
	}
}