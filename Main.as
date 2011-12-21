

package 
{

	import flash.display.*;
	import flash.text.*;
	//import IntroState;
	import GameState;

	public class Main extends MovieClip
	{

		public function Main()
		{
			// constructor code
			var game:GameState = new GameState(true);
			addChild(new SkyBackground());
			addChild(game);

			var score_txt:TextField = new TextField();
			score_txt.type = TextFieldType.DYNAMIC;
			score_txt.border = true;
			score_txt.x = 10;
			score_txt.y = 10;
			score_txt.height = 30;
			score_txt.width = 150;
			score_txt.selectable = false;
			score_txt.multiline = true;
			score_txt.wordWrap = true;
			addChild(score_txt);
			
			score_txt.text = "0909";
		}

	}

}