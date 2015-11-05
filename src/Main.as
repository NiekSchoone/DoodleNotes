package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.StageDisplayState;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Niek Schoone
	 */
	
	public class Main extends Sprite 
	{
		private var harp : HarpPlayer;
		private var guy  : GuyPlayer;
		private var countdown : Countdown;
		
		private var background : Background;
		private var restartButton : RestartButtonAnim;
		private var gameOverWord : GameoverButton;
		private var whoWon		: WhoWon;
		private var behindBackground : Background2;
		
		private var winTimer		: Timer;
		
		private var stickmanWon		: Boolean = false;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//stage.displayState = StageDisplayState.FULL_SCREEN;
			
			addEventListener(Event.ENTER_FRAME, update);
			
			behindBackground = new Background2();
			addChild(behindBackground);
			behindBackground.y = stage.stageHeight / 2;
			behindBackground.x = stage.stageWidth / 2;
			
			background = new Background();
			addChild(background);
			
			countdown = new Countdown();
			addChild(countdown);
			
			harp = new HarpPlayer();
			addChild(harp);
			
			guy = new GuyPlayer();
			addChild(guy);
			
			winTimer = new Timer(60000, 1);
			winTimer.addEventListener(TimerEvent.TIMER, guyWinEvent);
			winTimer.start();
		}
		
		
		private function update(e:Event):void
		{
			if (guy)
			{
				for (var i:int = harp.harpsArray.length - 1; i >= 0 ; i--) 
				{
					if (guy.hitTestObject(harp.harpsArray[i]))
					{
						harp.removeChild(harp.harpsArray[i]);
						harp.harpsArray.splice(i, 1);
						removeChild(guy);
						winTimer.stop();
						stickmanWon = false;
						guy = null;
						break;
					}
				}	
			}
			
			if (guy == null)
			{
				endGame();
			}
		}
		
		private function guyWinEvent(e:TimerEvent):void 
		{
			if (winTimer.currentCount == 1)
			{
				stickmanWon = true;
				removeChild(guy);
				guy = null;
			}
		}
		
		private function endGame():void
		{
			for (var i:int = harp.harpsArray.length - 1; i >= 0; i--) 
			{
				harp.removeChild(harp.harpsArray[i]);
				harp.harpsArray.splice(i, 1);
			}
			
			removeChild(countdown);
			countdown = null;
			
			removeEventListener(Event.ENTER_FRAME, update);
			removeEventListener(TimerEvent.TIMER, guyWinEvent);
			
			
			restartFunction();
		}
		
		private function restartFunction():void
		{
			restartButton 	= new RestartButtonAnim();
			gameOverWord 	= new GameoverButton();
			whoWon 			= new WhoWon();
			
			restartButton.x = 65;
			restartButton.y = 400;
			
			addChild(restartButton);
			restartButton.gotoAndStop(2);
			
			gameOverWord.x = 40;
			gameOverWord.y = 100;
			
			addChild(gameOverWord);
			
			addChild(whoWon);
			whoWon.x = stage.stageWidth / 2;
			whoWon.y = 250;
			
			if (stickmanWon == true)
			{
				whoWon.gotoAndStop(1)
			}
			else if(stickmanWon == false)
			{    
				whoWon.gotoAndStop(2)
			}
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onRestartClick);
			
		}
		
		private function onRestartClick(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32)
			{
				removeChild(gameOverWord);
				removeChild(restartButton);
				removeChild(whoWon);
				
				removeEventListener(KeyboardEvent.KEY_DOWN, onRestartClick);
				
				addEventListener(Event.ENTER_FRAME, update);
				addEventListener(TimerEvent.TIMER, guyWinEvent);
				
				winTimer.reset();
				winTimer.start();
				
				guy = new GuyPlayer();
				addChild(guy);
				
				countdown = new Countdown();
				addChild(countdown);
				
			}
			
		}
		
	}
}