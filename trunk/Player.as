package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Endian;
	
	public class Player extends MovieClip
	{
		private const GRAVITY_acc:Number = 5;
		private const JET_acc:Number = 10;
		private const SIDE_acc = 2;
		private const MAXY_vel:Number = 10;
		private const TRAMPOLINE_BOUNCE_vel = 15;
		private const TRAMPOLINE_AMORT_acc = 5;
		
		private var velX:Number;
		private var velY:Number;
		private var accX:Number;
		private var accY:Number;
		
		public var jetActive:Boolean;
		public var goLeft:Boolean;
		public var goRight:Boolean;
		
		public var trampolineY:Number;
		
		public function Player()
		{
			super();
			
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
					velY = TRAMPOLINE_BOUNCE_vel;
				}
			}
			
			accX = 0;
			if (goLeft) accX -=  SIDE_acc;
			if (goRight) accX +=  SIDE_acc;
			
			// Adjust velocity
			velX += accX;
			velY += accY;
		}
	}
}