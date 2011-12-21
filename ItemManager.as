package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.sampler.NewObjectSample;
	import flash.utils.Timer;
	
	public class ItemManager
	{
		private var timer:Timer;
		private var targetParent:MovieClip;
		
		public var averageDelay:Number = 10;
		public var averageDeviation:Number = 7;
		
		public var createArmor:Boolean = true;
		public var createWeapons:Boolean = true;
		public var createJetPack:Boolean = true;
		public var createCatArmor:Boolean = true;
		public var createBonusItems:Boolean = true;
		
		public function ItemManager(targetParent:MovieClip)
		{
			timer = new Timer(averageDelay);
			timer.addEventListener(TimerEvent.TIMER, timerEvent);
			
			this.targetParent = targetParent;
		}
		
		private function generateItem() : Item
		{
			
		}
		
		private function timerEvent(event:Event) : void
		{
			var nextDelay:Number = (Math.random() * averageDeviation * 2 - averageDeviation) + averageDelay;
			timer.delay = nextDelay * 1000;
			
			item = generateItem();
			MovieClip(item).x = targetParent.width + MovieClip(item).width;
			MovieClip(item).y = Math.random() * targetParent.height * 0.8 + targetParent.height * 0.1;
			
			targetParent.addChild(Item);
		}
		
		public function start() : void
		{
			timer.start();
		}
		
		public function stop() : void
		{
			timer.stop();
		}
	}
}