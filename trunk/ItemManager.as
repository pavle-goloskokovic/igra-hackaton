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
		public var targetParent:MovieClip;
		
		public var averageDelay:Number = 50;
		public var averageDeviation:Number = 7;
		
		public var createArmor:Boolean = true;
		public var createWeapons:Boolean = true;
		public var createJetPack:Boolean = true;
		public var createCatArmor:Boolean = true;
		public var createBonusItems:Boolean = true;
		
		//public var needToGenerate:Boolean = true;
		private var possibleItems:Array = new Array();
		// 0 - armor | 1 - weapon | 2 - jet pack | 3 - cat armor | 4 - bonus
		
		public function ItemManager(targetParent:MovieClip)
		{
			trace("Created Item manager");
			timer = new Timer(averageDelay, 0);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, timerEvent);
			for(var i:uint; i < 5; i++) possibleItems[i] = true;
			
			this.targetParent = targetParent;
		}
		
		private function generateItem() : Item
		{
			trace("generate item");
			while(true)
			{
				var index:int = Math.floor(Math.random() * 5);
				trace("Random je " + index + "|" + possibleItems[index]);
				if(possibleItems[index] == true)
				{
					break;
				}
			}
			
			var item:Item = new Item("lab");
			if(index == 0)
			{
				item.setFrame(0);
			}
			else if(index == 1)
			{
				item.setFrame(1);
			}
			else if (index == 2)
			{
				item.setFrame(2);
			}
			else if (index == 3)
			{
				item.setFrame(3);
			}
			else if (index == 4)
			{
				item.setFrame(4);
			}
			
			
			return item;
		}
		
		private function timerEvent(event:Event) : void
		{
			//if(needToGenerate == false) return;
			var nextDelay:Number = (Math.random() * averageDeviation * 2 - averageDeviation) + averageDelay;
			timer.delay = nextDelay * 1000;
			
			var item:Item = generateItem();
			MovieClip(item).x = targetParent.width + MovieClip(item).width;
			MovieClip(item).y = Math.random() * targetParent.height * 0.8 + targetParent.height * 0.1;
			trace("Generisani x: " + item.x + "|" + item.y);
			targetParent.addChild(item);
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