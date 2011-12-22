package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Endian;
	
	public class Player extends MovieClip
	{
		private const GRAVITY_acc:Number = 1;
		private const JET_acc:Number = 1.4;
		private const SIDE_acc:Number = 2;
		private const MAXY_vel:Number = 15;
		private const TRAMPOLINE_BOUNCE_vel:Number = 23;
		private const TRAMPOLINE_AMORT_acc:Number = 8;
		
		private var velX:Number;
		private var velY:Number;
		private var accX:Number;
		private var accY:Number;
		
		public var jetActive:Boolean = false;
		public var goLeft:Boolean = false;
		public var goRight:Boolean = false;
		
		public var trampolineY:Number;
		
		public var weapon:Weapon;
		public var armor:Armor;
		var myParent:MovieClip;
		
		public var playerFrame:uint = 1;
		
		public function Player()
		{
			super();
			
			velX = 0;
			velY = 0;
			accX = 0;
			accY = 0;
			
			this.addEventListener(Event.ADDED, initializeEventListener);
			
		}
		
		private function initializeEventListener(event:Event)
		{
			
			this.addEventListener(Event.ENTER_FRAME, enterFrameListener);
			myParent = MovieClip(this.parent);
		}
		
		private function enterFrameListener(event:Event)
		{
			move();
		}
		
		private function move()
		{
			// Move the player with velocity
			if (this.width / 2 > this.x + velX)
			{
				this.x = this.width / 2;
				velX = 0;
			}
			else if (this.x + velX > stage.stageWidth - this.width / 2)
			{
				
				this.x = stage.stageWidth - this.width / 2;
				velX = 0;
			} 
			else 
			{
				this.x += velX;
			}
			
			if (this.y + velY > this.height)
			{
				this.y += velY;
			} else {
				this.y = this.height;
				velY = 0;
			}
			
			// Calculate acceleration
			if (this.y < trampolineY) {
				// If the player is above the tramboline only 
				// gravity and jet can provide acceleration
				
				accY = GRAVITY_acc;
				if (jetActive) accY -= JET_acc;
				
				
			} else {
				// Here the player slows down until he stops and
				// then recieves a constant trampoline bounce velocity
				
				accY = 0;
				
				if (velY > 0) {
					accY -= TRAMPOLINE_AMORT_acc;
				} else {
					velY = -TRAMPOLINE_BOUNCE_vel;
					
				}
			}
			
			accX = 0;
			if (goLeft && -velX < MAXY_vel) accX -=  SIDE_acc;
			if (goRight && velX < MAXY_vel) accX +=  SIDE_acc;
			if (!goLeft && !goRight && Math.abs(velX) > 0) 
			{
				velX /= 1.5;
			}
			
			// Adjust velocity
			velX += accX;
			velY += accY;
			
			hitDetection();
		}
		
		//koordinate u odnosu na MovieClip player a ne u odnosu na stage
		public function setWeapon(newWeapon:Weapon, deltaX:int, deltaY:int):void
		{
			weapon = newWeapon;
			
			weapon.x = deltaX;
			weapon.y = deltaY;
			trace("X: " + x + "weaponx: " + weapon.x);
			//this.addChild(weapon);
			addChild(weapon);
			
		}
		
		public function setArmor(newArmor:Armor, deltaX:int, deltaY:int):void
		{
			armor = newArmor;
			armor.x = deltaX;
			armor.y = deltaY;
			addChild(armor);
		}
		
		private function hitDetection():void
		{
			
			var enemyManager:EnemyManager = myParent.enemyManager;
			for(var i:uint; i < enemyManager.enemies.length; i++)
			{
				var enemy:Enemy = enemyManager.enemies[i];
				if(this.hitTestObject(enemy))
				{
					var paddLeft:Number = 30;
					var paddRight:Number = 3;
					var main:MovieClip = MovieClip(myParent.parent);
					var currentScore:int = parseInt(main.score_txt.text);
					
					if(enemy.x - this.x > -paddRight && enemy.x - this.x < paddLeft){
						//trace("killed");
						this.x = 0;
						main.score_txt.text = "0";
					}else{
						if(this.y - this.height / 3 < enemy.y){
							//trace("remove enemy");
							var retInc:int = getScoreIncrement(enemy);
							currentScore += retInc;
							main.score_txt.text = currentScore;
							var removed:Boolean = myParent.enemyManager.removeEnemy(enemy);
						}else{
							//trace("killed");
							this.x = 0;
							main.score_txt.text = "0";
						}
					}
				}
			}
		}
		
		public function setFrame(frame:uint):void
		{
			playerFrame = frame;
			gotoAndStop(frame);
		}
		
		private function getScoreIncrement(enemy:Enemy):int
		{
			if(enemy.enemyFrame == 1)
			{
				return 10;
			}
			else if(enemy.enemyFrame == 2)
			{
				return 20;
			}
			
			return -1;
		}
		
	}
}