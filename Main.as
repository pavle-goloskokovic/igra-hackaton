

package  {
	
	import flash.display.*;
	//import IntroState;
	import GameState;
	
	public class Main extends MovieClip {

		public function Main() {
			// constructor code
			var game:GameState = new GameState(true);
			addChild(game);
			
		}

	}
	
}
