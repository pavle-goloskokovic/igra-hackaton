package  {
	
	import flash.display.*;
	import flash.events.*
	import MenuState;
	
	public class GameState extends MovieClip {
		
		var buttonBack:Button;
		var mode:Boolean;

		public function GameState(multiPlayerMode:Boolean) {
			// constructor code
			mode = multiPlayerMode;
			this.addEventListener(Event.ADDED, initialise);
		
		}
		
		function initialise(evt:Event){
			
			this.removeEventListener(Event.ADDED, initialise);
			
			msg_txt.text = "GameState\nMode: " + (mode?"Multiplayer":"Singleplayer");
			
			buttonBack = new Button("Nazad");
			buttonBack.x = stage.stageWidth / 2;
			buttonBack.y = stage.stageHeight / 3 * 2;
			buttonBack.buttonMode = true;
			
			addChild(buttonBack);
			buttonBack.addEventListener(MouseEvent.CLICK, backToMenu);
			
		}
		
		function backToMenu(evt:MouseEvent):void{
			
			buttonBack.removeEventListener(MouseEvent.CLICK, backToMenu);
			
			var menu:MovieClip = new MenuState();
			this.parent.addChild(menu);
			this.parent.removeChild(this.parent.getChildByName(this.name));

		}

	}
	
}
