﻿package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Endian;
	
	public class Player extends MovieClip
	{
		private const GRAVITY_acc:Number = 1;
		private const JET_acc:Number = 3;
		private const SIDE_acc:Number = 2;
		private const MAXY_vel:Number = 15;
		private const TRAMPOLINE_BOUNCE_vel:Number = 20;
		private const TRAMPOLINE_AMORT_acc:Number = 5;
		
		private var velX:Number;
		private var velY:Number;
		private var accX:Number;
		private var accY:Number;
		
		public var jetActive:Boolean = false;
		public var goLeft:Boolean = false;
		public var goRight:Boolean = false;
		
		public var trampolineY:Number;
		
		public var weapon:Weapon;
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
			this.x += velX;
			this.y += velY;
			
			
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
					
					if(enemy.x - this.x > -paddRight && enemy.x - this.x < paddLeft){
						trace("killed");
						this.x = 0;
					}else{
						if(this.y - this.height / 3 < enemy.y){
							trace("remove enemy");
							var removed:Boolean = myParent.enemyManager.removeEnemy(enemy);
						}else{
							trace("killed");
							this.x = 0;
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
	}
}