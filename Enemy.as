package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Enemy extends MovieClip
	{
		private var energy:int;
		private var speed:int;
		public function Enemy(energyOfEnemy:int = 10, speedOfEnemy:int = 5)
		{
			super();
			energy = energyOfEnemy;
			speed = speedOfEnemy;
			this.addEventListener(Event.ENTER_FRAME, move);
		}
		
		public function move(event:Event):void
		{
				this.x -= speed;
				
		}
		
		public function shot(bullet:Bullet):void
		{
			energy -= bullet.demage;
			if(energy <= 0)
			{
				killed();
			}
		}
		
		private function killed():void
		{
			this.parent.removeChild(this.parent.getChildByName(this.name));
		}
	}
}