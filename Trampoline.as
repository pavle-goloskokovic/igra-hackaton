package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Trampoline extends MovieClip
	{
		private var player:Player;
		public var easing:int;
		
		
		public function Trampoline(playerToFollow:Player, step:int = 7)
		{
			super();
			player = playerToFollow;
			easing = step;
			this.addEventListener(Event.ENTER_FRAME, followPlayer);
		}
		
		private function followPlayer(event:Event):void
		{
			var playerXCoordinate:Number = player.x;
			if(this.x != player.x)
			{
				var diff:int = playerXCoordinate - this.x;
				if(Math.abs(diff) < 1)
				{
					this.x += player.x;
				}
				else
				{
					var moveStep:int = Math.abs(diff) / easing;
					if(diff > 0)
					{
						this.x += moveStep;
					}
					else
					{
						this.x -= moveStep;
					}
				}
			}
		}
		
		public function unregisterEnterFrameEvent():void
		{
			this.removeEventListener(Event.ENTER_FRAME, followPlayer);
		}
	}
}