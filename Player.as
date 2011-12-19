package
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
		}
		
		private function enterFrameListener(event:Event)
		{
			move();
		}
		
		private function move()
		{
			trace("x: " + this.x);
			trace("y: " + this.y);
			trace("velX: " + velX);
			trace("velY: " + velY);
			// Move the player with velocity
			this.x += velX;
			this.y += velY;
			
			
			// Calculate acceleration
			if (this.y < trampolineY) {
				// If the player is above the tramboline only 
				// gravity and jet can provide acceleration
				
				accY = GRAVITY_acc;
				if (jetActive) accY -= JET_acc;
				
				trace("Trampoline up");
				
			} else {
				// Here the player slows down until he stops and
				// then recieves a constant trampoline bounce velocity
				
				accY = 0;
				
				if (velY > 0) {
					accY -= TRAMPOLINE_AMORT_acc;
					
					trace("Player slowing");
				} else {
					velY = -TRAMPOLINE_BOUNCE_vel;
					
					trace("Player const speed");
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
		}
		
		public function sgn(b:Number):Number
		{
			return b / Math.abs(b); 
		}
	}
}