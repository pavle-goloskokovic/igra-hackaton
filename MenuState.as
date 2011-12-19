package  {
	
	import flash.display.*;
	import flash.events.*
	import Button;
	import AboutState;
	
	public class MenuState extends MovieClip {
		
		var buttonPlay:Button;
		var buttonAbout:Button;
		var buttonSingle:Button;
		var buttonMulti:Button;

		public function MenuState() {
			// constructor code
			this.addEventListener(Event.ADDED, initialise);
		}
		
		function initialise(evt:Event){
			
			this.removeEventListener(Event.ADDED, initialise);
			
			msg_txt.text = "MenuState";
			
			buttonPlay = new Button("Igraj");
			buttonPlay.x = stage.stageWidth / 3;
			buttonPlay.y = stage.stageHeight / 3 * 2;
			buttonAbout = new Button("O igri");
			buttonAbout.x = stage.stageWidth / 3 * 2;
			buttonAbout.y = stage.stageHeight / 3 * 2;
			
			addChild(buttonAbout);
			addChild(buttonPlay);
			
			buttonAbout.addEventListener(MouseEvent.CLICK, goToAbout);
			buttonPlay.addEventListener(MouseEvent.CLICK, chooseGame);
		}
		
		function goToAbout(evt:MouseEvent):void{
			
			buttonAbout.removeEventListener(MouseEvent.CLICK, goToAbout);
			buttonPlay.removeEventListener(MouseEvent.CLICK, chooseGame);
			
			var about:MovieClip = new AboutState();
			this.parent.addChild(about);
			this.parent.removeChild(this.parent.getChildByName(this.name));

		}
		
		function chooseGame(evt:MouseEvent):void{
			
			buttonAbout.removeEventListener(MouseEvent.CLICK, goToAbout);
			buttonPlay.removeEventListener(MouseEvent.CLICK, chooseGame);
			
			removeChild(buttonAbout);
			removeChild(buttonPlay);
			
			buttonSingle = new Button("Singleplayer");
			buttonSingle.x = stage.stageWidth / 3;
			buttonSingle.y = stage.stageHeight / 3 * 2;
			buttonMulti = new Button("Multiplayer");
			buttonMulti.x = stage.stageWidth / 3 * 2;
			buttonMulti.y = stage.stageHeight / 3 * 2;
			
			addChild(buttonSingle);
			addChild(buttonMulti);
			
			
		}

	}
	
}
