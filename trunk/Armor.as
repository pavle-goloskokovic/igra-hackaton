package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Armor extends MovieClip
	{
		private const armorIncrement = 20;
		private const maxArmorLevel = 5;
		public var hitPoints:Number;
		
		public var frameArmor:int = 2;
		
		public function Armor(initialHitPoints:Number)
		{
			super();
			
			this.hitPoints = initialHitPoints;
		}
		
		public function hit(energy:Number) : Boolean
		{
			this.hitPoints -= energy;
			
			var targetFrame:int = Math.max(this.hitPoints % this.armorIncrement, 0);
			this.gotoAndStop(targetFrame);
			
			GameState(this.parent.parent).itemManager.createArmor = true;
			
			return this.hitPoints > 0;
		}
		
		public function upgrade() : void
		{
			this.hitPoints += armorIncrement;
			
			var targetFrame:int = Math.min(this.hitPoints % this.armorIncrement, maxArmorLevel);
			this.gotoAndStop(targetFrame);
			
			if (this.hitPoints >= armorIncrement * maxArmorLevel)
			{
				GameState(this.parent.parent).itemManager.createArmor = false;
			}
		}
		
		public function setFrame(frame:int):void
		{
			frameArmor = frame;
			gotoAndStop(frame);
		}
	}
}