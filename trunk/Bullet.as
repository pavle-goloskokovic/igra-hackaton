package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Bullet extends MovieClip
	{
		
		public var demage:uint;
		public var step:uint;
		
		public function Bullet(startX:Number, startY:Number,  demageToEnemy:uint, stepForward:uint)
		{
			super();
			step = stepForward;
			demage = demageToEnemy;
			this.x = startX;
			this.y = startY;
			//parent.addChild(this);
			
			this.addEventListener(Event.ENTER_FRAME, moveBullet);
			trace("Bullet created");
			
		}
		
		public function moveBullet(event:Event):void
		{
			this.x += step;
			if(this.x > parent.parent.width)
			{
				this.visible = false;
				disconnectFrameEnterListener();
				this.parent.removeChild(this.parent.getChildByName(this.name));
			}
			for(var i:uint = 0; i < EnemyManager.enemies.length; i++)
			{
				if(this.hitTestObject(EnemyManager.enemies[i]))
				{
					var enem:Enemy = EnemyManager.enemies[i];
					enem.shot(this);
					disconnectFrameEnterListener();
					this.parent.removeChild(this.parent.getChildByName(this.name));
					trace("SSS");
				}
			}
		}
		
		public function disconnectFrameEnterListener():void
		{
			this.removeEventListener(Event.ENTER_FRAME, moveBullet);
		}
	}
}