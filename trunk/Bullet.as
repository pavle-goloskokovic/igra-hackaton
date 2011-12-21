package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Bullet extends MovieClip
	{
		private var myParent:MovieClip;
		public var demage:uint;
		public var step:uint;
		
		public var bulletFrame:uint;
		
		public function Bullet(startX:Number, startY:Number,  demageToEnemy:uint, stepForward:uint)
		{
			super();
			step = stepForward;
			demage = demageToEnemy;
			this.x = startX;
			this.y = startY;
			this.addEventListener(Event.ADDED, init);
			trace("Bulet constructed: " + demage);
			
			
			
		}
		
		public function init(e:Event):void
		{
			myParent = MovieClip(this.parent);
		}
		
		public function fireBullet():void
		{
			this.addEventListener(Event.ENTER_FRAME, moveBullet);
		}
		
		public function moveBullet(event:Event):void
		{
			this.x += step;
			if(this.x > parent.parent.stage.stageWidth )
			//if(this.x > 500)
			{
				this.visible = false;
				disconnectFrameEnterListener();
				this.parent.removeChild(myParent.getChildByName(this.name));
				return;
				
			}
			else
			{
				for(var i:uint = 0; i < myParent.enemyManager.enemies.length; i++){
					
					if(this.hitTestObject(myParent.enemyManager.enemies[i]))
					{
						var enem:Enemy = myParent.enemyManager.enemies[i];
						enem.shot(this);
						//var removed:Boolean = myParent.enemyManager.removeEnemy(enem);
						//trace(removed);
						disconnectFrameEnterListener();
						this.parent.removeChild(this.parent.getChildByName(this.name));
						break;
					}
				}
			}
		}
		
		public function disconnectFrameEnterListener():void
		{
			this.removeEventListener(Event.ENTER_FRAME, moveBullet);
		}
		
		public function setFrame(frame:uint):void
		{
			bulletFrame = frame;
			if(frame == 1)
			{
				demage = 10;
			}
			if(frame == 2) 
			{
				demage = 20;
			}
			this.gotoAndStop(frame);
		}
	}
}