package  {
	
	import flash.display.*;
	import flash.events.*
	import Button;
	import AboutState;
	import GameState;
	
	public class MenuState extends MovieClip {
		
		var buttonPlay:Button;
		var buttonAbout:Button;
		var buttonSingle:Button;
		var buttonMulti:Button;
		var buttonBack:Button;

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
			buttonPlay.buttonMode = true;
			buttonAbout = new Button("O igri");
			buttonAbout.x = stage.stageWidth / 3 * 2;
			buttonAbout.y = stage.stageHeight / 3 * 2;
			buttonAbout.buttonMode = true;
			
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
			buttonSingle.buttonMode = true;
			buttonMulti = new Button("Multiplayer");
			buttonMulti.x = stage.stageWidth / 3 * 2;
			buttonMulti.y = stage.stageHeight / 3 * 2;
			buttonMulti.buttonMode = true;
			buttonBack = new Button("Nazad");
			buttonBack.x = stage.stageWidth / 2;
			buttonBack.y = stage.stageHeight / 5 * 4;
			buttonBack.buttonMode = true;

			
			addChild(buttonSingle);
			addChild(buttonMulti);
			addChild(buttonBack);
			
			buttonSingle.addEventListener(MouseEvent.CLICK, singlePlayer);
			buttonMulti.addEventListener(MouseEvent.CLICK, multiPlayer);
			buttonBack.addEventListener(MouseEvent.CLICK, menuInit);
			
		}
		
		function singlePlayer(evt:MouseEvent):void{
			
			buttonSingle.removeEventListener(MouseEvent.CLICK, singlePlayer);
			buttonMulti.removeEventListener(MouseEvent.CLICK, multiPlayer);
			buttonBack.removeEventListener(MouseEvent.CLICK, menuInit);
			
			var single:MovieClip = new GameState(false);
			this.parent.addChild(single);
			this.parent.removeChild(this.parent.getChildByName(this.name));

			
		}
		
		function multiPlayer(evt:MouseEvent):void{
			
			buttonSingle.removeEventListener(MouseEvent.CLICK, singlePlayer);
			buttonMulti.removeEventListener(MouseEvent.CLICK, multiPlayer);
			buttonBack.removeEventListener(MouseEvent.CLICK, menuInit);
			
			var multi:MovieClip = new GameState(true);
			this.parent.addChild(multi);
			this.parent.removeChild(this.parent.getChildByName(this.name));

			
		}
		
		function menuInit(evt:MouseEvent):void{
			
			buttonSingle.removeEventListener(MouseEvent.CLICK, singlePlayer);
			buttonMulti.removeEventListener(MouseEvent.CLICK, multiPlayer);
			buttonBack.removeEventListener(MouseEvent.CLICK, menuInit);
			
			removeChild(buttonSingle);
			removeChild(buttonMulti);
			removeChild(buttonBack);
			
			buttonPlay = new Button("Igraj");
			buttonPlay.x = stage.stageWidth / 3;
			buttonPlay.y = stage.stageHeight / 3 * 2;
			buttonPlay.buttonMode = true;
			buttonAbout = new Button("O igri");
			buttonAbout.x = stage.stageWidth / 3 * 2;
			buttonAbout.y = stage.stageHeight / 3 * 2;
			buttonAbout.buttonMode = true;
			
			addChild(buttonAbout);
			addChild(buttonPlay);
			
			buttonAbout.addEventListener(MouseEvent.CLICK, goToAbout);
			buttonPlay.addEventListener(MouseEvent.CLICK, chooseGame);
			
		}

	}
	
}
