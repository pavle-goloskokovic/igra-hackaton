package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Armor extends MovieClip
	{
		private const armorIncrement = 20;
		public var hitPoints:Number;
		
		public function Armor(initialHitPoints:Number)
		{
			super();
			
			this.hitPoints = initialHitPoints;
		}
		
		public function hit(energy:Number) : Boolean
		{
			this.hitPoints -= energy;
			this.gotoAndStop(this.hitPoints % this.armorIncrement);
			
			return this.hitPoints > 0;
		}
		
		public function upgrade() : void
		{
			this.hitPoints += armorIncrement;
			
			this.gotoAndStop(this.hitPoints % this.armorIncrement);
		}
	}
}