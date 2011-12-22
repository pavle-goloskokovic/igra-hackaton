

package 
{

	import GameState;
	
	import IntroState;
	
	import flash.display.*;
	import flash.geom.ColorTransform;
	import flash.text.*;

	public class Main extends MovieClip
	{

		public var score_txt:TextField = new TextField();
		
		public function Main()
		{
			// constructor code
			var game:GameState = new GameState(true);
			//addChild(new SkyBackground());
			addChild(game);

			var textStyle:TextFormat = new TextFormat("Berlin Sans FB", 36, "0x001F48");
			
			score_txt.type = TextFieldType.DYNAMIC;
			score_txt.border = false;
			score_txt.x = 10;
			score_txt.y = 5;
			score_txt.height = 42;
			score_txt.width = 150;
			score_txt.defaultTextFormat = textStyle;
			score_txt.selectable = false;
			score_txt.multiline = true;
			score_txt.wordWrap = true;
			addChild(score_txt);
			
			score_txt.text = "0";
		}

	}

}