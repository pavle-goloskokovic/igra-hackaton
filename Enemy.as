package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Enemy extends MovieClip
	{
		private var energy:int;
		private var speed:int;
		private var myParent:MovieClip;
		public var enemyFrame:uint = 1;
		public function Enemy(energyOfEnemy:int = 10, speedOfEnemy:int = 5)
		{
			super();
			energy = energyOfEnemy;
			speed = speedOfEnemy;
			addEventListener(Event.ADDED, init);
			
		}
		
		public function init(e:Event):void
		{
			
			this.addEventListener(Event.ENTER_FRAME, move);
			myParent = MovieClip(this.parent);
		}
		
		public function move(event:Event):void
		{
				this.x -= speed;
				
		}
		
		public function shot(bullet:Bullet):void
		{
			trace("bullet demage " + bullet.demage + " my energy " + energy);
			energy -= bullet.demage;
			if(energy <= 0)
			{
				killed();
			}
		}
		
		private function killed():void
		{
			var currentScore:int = parseInt(MovieClip(this.parent.parent).score_txt.text);
			if(enemyFrame == 1)
			{
				currentScore += 10;
			}
			else if(enemyFrame == 2)
			{
				currentScore += 20;
			}
			MovieClip(this.parent.parent).score_txt.text = String(currentScore);
			var removed:Boolean = myParent.enemyManager.removeEnemy(this);
			//this.parent.removeChild(this.parent.getChildByName(this.name));
		}
	}
}