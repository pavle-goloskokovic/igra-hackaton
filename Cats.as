package 
{

	import flash.display.*;
	import flash.events.*;

	public class Cats extends MovieClip
	{

		var energy:Number;
		var catsArmorMaxAlpha:Number;
		var catsArmor:CatsArmor;

		public function Cats()
		{
			// constructor code
			energy = 1;
			catsArmorMaxAlpha = 0.8;
			catsArmor = new CatsArmor();
			catsArmor.alpha = catsArmorMaxAlpha;
			addChild(catsArmor);
		}

		public function decreaseArmor(percent:Number)
		{
			
			energy -=  percent / 100;
			
			if ( energy <= 0)
			{
				energy = 0;
				trace("Cats destroyed!!!");
			} 
			else if ( energy + percent/100 == 1)
			{
				trace("Send cat armor again!");
			}
			
			catsArmor.alpha = energy * catsArmorMaxAlpha;

		}
		
		public function increaseArmor(percent:Number)
		{
			energy +=  percent / 100;
			
			if ( energy >= 1)
			{
				energy = 1;
				trace("Stop sending cats armor!!!");
			}
			catsArmor.alpha = energy * catsArmorMaxAlpha;

		}

	}

}