package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.Event;

	public class EnemyManager extends MovieClip
	{
		private const TRAMPOLINE_HEIGHT:int = 40;
		
		public var enemies:Array = new Array();
		
		private var thisStageWith:int; 
		private var thisStageHeight:int; 
		
		private var enemiesTimer:Timer = new Timer(1000, 0);
		private var levelTimer:Timer = new Timer(1000 * 30, 0);
		private var enemyBorder:uint = 40;
		
		public function EnemyManager()
		{
			this.addEventListener(Event.ADDED, init);
			
		}
		
		public function init(e:Event):void
		{
			enemiesTimer.addEventListener(TimerEvent.TIMER, createEnemies);
			enemiesTimer.start();
			levelTimer.addEventListener(TimerEvent.TIMER, increaseSlider);
			levelTimer.start();
			thisStageWith = parent.parent.stage.stageWidth;
			thisStageHeight = parent.parent.stage.stageHeight;;
		}
		
		public function createEnemies(event:TimerEvent):void
		{
			var enemy:Enemy = getEnemy();
			enemy.x = thisStageWith;
			var randomY:Number = Math.random() * thisStageHeight;
			enemy.y = randomY;
			enemies.push(enemy);
			parent.addChild(enemy);	
		}
		
		private function getEnemy():Enemy
		{
			var enemyNumber:uint = Math.random() * enemyBorder;
			var returnEnemy:Enemy;
			
			//bira se koji se neprijatelj postavlja na stejdz
			if(enemyNumber >= 0 && enemyNumber <= 40)
			{
				returnEnemy = new Enemy(10, 5);
				//returnEnemy.enemyFrame = 1;
				//returnEnemy.gotoAndStop(1);
			}
			else if(enemyNumber > 40 && enemyNumber <= 70)
			{
				returnEnemy = new Enemy(15, 8);
				//returnEnemy.enemyFrame = 2;
				//returnEnemy.gotoAndStop(2);
			}
			else if (enemyNumber > 70 && enemyNumber <= 90)
			{
				returnEnemy = new Enemy(20, 10);
				//returnEnemy.enemyFrame = 2;
				//returnEnemy.gotoAndStop(2);
			}
			else if (enemyNumber > 90 && enemyNumber <= 98)
			{
				returnEnemy = new Enemy(25, 10);
				//returnEnemy.enemyFrame = 2;
				//returnEnemy.gotoAndStop(2);
			}
			else if (enemyNumber > 98)
			{
				returnEnemy = new Enemy(30, 10);
				//returnEnemy.enemyFrame = 2;
				//returnEnemy.gotoAndStop(2);
			}
			
			return returnEnemy;
		}
		
		private function increaseSlider(event:TimerEvent):void
		{
			enemyBorder += 10;
		}
		
		public function removeEnemy(enemy:Enemy):Boolean 
		{
			for(var i:uint = 0; i < enemies.length; i++)
			{
				if(enemies[i] == enemy)
				{
					enemies.splice(i, 1);
					parent.removeChild(enemy);
					return true;
				}
			}
			
			return false;
		}
	}
}