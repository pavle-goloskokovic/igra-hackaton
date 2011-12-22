package  {
	
	import flash.display.*;
	import Button;
	import MenuState;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class EndState extends MovieClip {
		
		var buttonSubmit:Button;
		var buttonBack:Button;
		var score:Number;

		public function EndState(score:Number) {
			
			this.score = score;
			score_txt.text = String(score);
			username_txt.text = "";
			this.addEventListener(Event.ADDED, initialise);
		}
		
		function initialise(evt:Event){
			
			this.removeEventListener(Event.ADDED, initialise);

			msg_txt.text = "EndState";
			
			buttonSubmit = new Button("Sacuvaj skor");
			buttonSubmit.x = this.parent.stage.stageWidth / 3 * 2;
			buttonSubmit.y = this.parent.stage.stageHeight/4*3;
			buttonSubmit.buttonMode = true;
			
			buttonBack = new Button("Nazad");
			buttonBack.x = this.parent.stage.stageWidth / 3;
			buttonBack.y = this.parent.stage.stageHeight/4*3;
			buttonBack.buttonMode = true;
			
			addChild(buttonSubmit);
			addChild(buttonBack);
			
			buttonBack.addEventListener(MouseEvent.CLICK, backToMenu);
			buttonSubmit.addEventListener(MouseEvent.CLICK, submit);
		}
		
		function backToMenu(evt:MouseEvent):void{
			
			buttonBack.removeEventListener(MouseEvent.CLICK, backToMenu);
			
			var menu:MovieClip = new MenuState();
			this.parent.addChild(menu);
			this.parent.removeChild(this.parent.getChildByName(this.name));

		}
		
		function submit(evt:MouseEvent):void{
			
			if(username_txt.text == "" || username_txt.text == "Morate uneti ime!"){
			
				username_txt.text = "Morate uneti ime!"
				
			}else{
			
				buttonSubmit.removeEventListener(MouseEvent.CLICK, submit);
				
				trace("Username: " + username_txt.text + "\nScore: " + score);
				
				removeChild(buttonSubmit);
			}
			
		}

	}
	
}
