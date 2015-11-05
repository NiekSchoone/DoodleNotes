package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Countdown extends Sprite
	{
		
		private var myCountdown 		: 	int;
		private var myCountdownTimer 	: 	Timer;
		private var myCountdownText 	: 	TextField;
		
		public function Countdown() 
		{
			myCountdownText = new TextField();
			addChild(myCountdownText);
			
			myCountdown = 60;
			
			myCountdownTimer = new Timer(1000, 60);
			myCountdownTimer.addEventListener(TimerEvent.TIMER, countdownEvent);
			myCountdownTimer.start();
		}
		
		private function countdownEvent(e:TimerEvent):void 
		{
			trace(myCountdownTimer.currentCount);
			trace(myCountdownText.text);
			if (myCountdownTimer.currentCount < 60)
			{
				myCountdown -= 1;
				displayCountdown(myCountdown);
			}
		}
		
		private function displayCountdown(myCountdown:uint):void 
		{
			myCountdownText.text = " " + String(myCountdown);
			
			var sTF:TextFormat = new TextFormat("daniel", 20, 0x000000, true);
			
			
			myCountdownText.x = 10;
			myCountdownText.y = 20;
			
			myCountdownText.setTextFormat(sTF);
			myCountdownText.width = 100;
		}
		
	}

}