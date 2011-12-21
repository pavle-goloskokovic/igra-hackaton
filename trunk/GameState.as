package 
{

	import flash.display.*;
	import flash.events.*;
	import MenuState;
	import flash.ui.Keyboard;

	public class GameState extends MovieClip
	{
		
		var buttonBack:Button;
		var mode:Boolean;
		public var player:Player = new Player();
		var trampoline:Trampoline = new Trampoline(player,4);
		var weapon:Weapon = new Weapon(player);
		public var enemyManager:EnemyManager = new EnemyManager();
	
	
		
		
		public function GameState(multiPlayerMode:Boolean)
		{
			//MonsterDebugger.initialize(this);
            //MonsterDebugger.trace(this, "Roditelj GameState je " + parent);
			// constructor code
			mode = multiPlayerMode;
			this.addEventListener(Event.ADDED, initialise);
			
			
			
		}

		function initialise(evt:Event)
		{

			this.removeEventListener(Event.ADDED, initialise);
			this.parent.stage.addEventListener(KeyboardEvent.KEY_DOWN, pressed);
			this.parent.stage.addEventListener(KeyboardEvent.KEY_UP, released);

			//msg_txt.text = "GameState\nMode: " + (mode?"Multiplayer":"Singleplayer");

			//buttonBack = new Button("Nazad");
			//buttonBack.x = stage.stageWidth / 2;
			//buttonBack.y = stage.stageHeight / 3 * 2;
			//buttonBack.buttonMode = true;

			//addChild(buttonBack);
			//buttonBack.addEventListener(MouseEvent.CLICK, backToMenu);


			player.x = 50;
			player.y = 50;
			trampoline.x = 50;
			trampoline.y = 370;
			player.trampolineY = 370;
			weapon.setFrame(2);
			player.setWeapon(weapon, 0, -55);
			addChild(trampoline);
			addChild(player);
			addChild(enemyManager);
			//enemyManager.createEnemies();
			
			player.weapon.fire();
			//this.addEventListener(KeyboardEvent.KEY_DOWN, pressed);
			//this.addEventListener(KeyboardEvent.UP, relised);


		}

		function pressed(e:KeyboardEvent):void
		{
			
			var code:uint = e.keyCode;
			trace("pressed ", code);
			if (code == Keyboard.RIGHT)
			{
				player.goRight = true;
			}
			else if ( code == Keyboard.LEFT)
			{
				player.goLeft = true;
			}
			else if (code == Keyboard.UP)
			{
				player.jetActive = true;
			}
			else if (code == Keyboard.Z)
			{
				player.weapon.fire();
			}
		}

		function released(e:KeyboardEvent):void
		{
			trace("REL");
			var code:uint = e.keyCode;
			if (code == Keyboard.RIGHT)
			{
				player.goRight = false;
			}
			else if ( code == Keyboard.LEFT)
			{
				player.goLeft = false;
			}

			if (code == Keyboard.UP)
			{
				player.jetActive = false;
			}
		}

		function backToMenu(evt:MouseEvent):void
		{

			//buttonBack.removeEventListener(MouseEvent.CLICK, backToMenu);

			//var menu:MovieClip = new MenuState();
			//this.parent.addChild(menu);
			//this.parent.removeChild(this.parent.getChildByName(this.name));

		}

	}

}