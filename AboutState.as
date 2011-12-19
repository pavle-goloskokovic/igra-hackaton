package  {
	
	import flash.display.*;
	import Button;
	import MenuState;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class AboutState extends MovieClip {
		
		var button:Button;

		public function AboutState() {
			this.addEventListener(Event.ADDED, initialise);
		}
		
		function initialise(evt:Event){
			
			this.removeEventListener(Event.ADDED, initialise);

			msg_txt.text = "AboutState";
			
			button = new Button("Nazad u meni");
			button.x = this.parent.stage.stageWidth / 2;
			button.y = this.parent.stage.stageHeight/3*2;
			button.buttonMode = true;
			
			addChild(button);
			
			button.addEventListener(MouseEvent.CLICK, backToMenu);
		}
		
		function backToMenu(evt:MouseEvent):void{
			
			button.removeEventListener(MouseEvent.CLICK, backToMenu);
			
			var menu:MovieClip = new MenuState();
			this.parent.addChild(menu);
			this.parent.removeChild(this.parent.getChildByName(this.name));

		}

	}
	
}
