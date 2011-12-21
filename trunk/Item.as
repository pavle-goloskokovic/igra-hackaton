package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Item extends MovieClip
	{
		public var type:String;
		public var speed:int = 3;
		
		public function Item(type:String)
		{
			super();
			this.addEventListener(Event.ADDED, init);
			this.type = type;
			gotoAndStop(type);
		}
		
		public function init(e:Event):void
		{
			this.addEventListener(Event.ENTER_FRAME, move);
		}
		
		public function move(e:Event):void
		{
			this.x -= speed;
			var gameState:MovieClip = MovieClip(parent);
			var player:Player = gameState.player;
			
			if(this.hitTestObject(player))
			{
				//dodaj sad nesto playeru
				if(type == "Armor")
				{
					player.armor.upgrade();
				}
				else if(type == "Weapon")
				{
					var currentWeapon = player.weapon.weaponFrame;
					player.weapon.setFrame(2);
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