package
{
	import flash.display.MovieClip;
	import flash.display.Stage;

	public class EnemyManager extends MovieClip
	{
		public static var enemies:Array = new Array();
		public function EnemyManager()
		{
		}
		
		public function createEnemies():void
		{
			var enemy:Enemy = new Enemy();
			enemy.x = 530;
			enemy.y = 250;
			enemies.push(enemy);
			parent.addChild(enemy);	
		}
	}
}