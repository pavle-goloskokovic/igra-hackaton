package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Item extends MovieClip
	{
		public var type:String;
		public var itemFrame:int = 1;
		public var speed:int = 3;
		
		public function Item(type:String)
		{
			super();
			this.addEventListener(Event.ADDED, init);
			this.type = type;
		}
		
		public function init(e:Event):void
		{
			this.addEventListener(Event.ENTER_FRAME, move);
		}
		
		public function setFrame(frame:int):void
		{
			itemFrame = frame;
			gotoAndStop(frame);
		}
		
		public function move(e:Event):void
		{
			this.x -= speed;
			var gameState:MovieClip = MovieClip(parent);
			var player:Player = gameState.player;
			
			if(this.hitTestObject(player))
			{
				//dodaj sad nesto playeru
				if(itemFrame == 0)
				{
					var armState:int = player.armor.frameArmor;
					armState++;
					player.armor.setFrame(armState);
					
					if(armState == 5)
					{
						
					}
				}
				gameState.removeChild(this);
				disconnectListener();
			}
			if(x < 0)
			{
				gameState.removeChild(this);
				disconnectListener();
			}
		}
		
		private function disconnectListener():void
		{
			this.removeEventListener(Event.ENTER_FRAME, move);
		}
	}
}