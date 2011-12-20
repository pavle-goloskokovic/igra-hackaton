package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Armor extends MovieClip
	{
		private var hitPoints:Number;
		
		public function Armor(parentPlayer:Player, initialHitPoints:Number)
		{
			super();
			
			parentPlayer.addChild(this);
			this.hitPoints = initialHitPoints;
			
			this.addEventListener(Event.ENTER_FRAME, enterFrameListener);
		}
		
		private function enterFrameListener(event:Event)
		{
			this.x = parent.x - parent.width / 2;
			this.y = parent.y;
		}
		
		public function hit(energy:Number)
		{
			this.hitPoints -= energy;
			if (hitPoints <= 0)
			{
				this.removeEventListener(Event.ENTER_FRAME, enterFrameListener);
				parent.removeChild(this);
			}
		}
	}
}