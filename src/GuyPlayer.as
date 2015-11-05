package  
{
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class GuyPlayer extends MovieClip
	{
		public var guy		: GuyAnimations;
		
		private var direction   : Number = 0;
		
		public function GuyPlayer() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			guy = new GuyAnimations();
			guy.y = stage.stageHeight - guy.height / 2;
			guy.x = 200;
			addChild(guy);
			
			guy.gotoAndStop(1)
			
			
			addEventListener(Event.ENTER_FRAME, update)
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == 39)
			{
				direction = 1;
				guy.scaleX = 1;
				guy.gotoAndStop(2);
			}
			if (e.keyCode == 37)
			{
				direction = -1;
				guy.scaleX = -1;
				guy.gotoAndStop(2);
			}
		}
		private function keyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == 39 || e.keyCode == 37)
			{
				direction = 0;
				guy.gotoAndStop(1)
			}
		}
		
		
		private function update(e:Event):void 
		{
			if (direction < 0 && guy.x <= 0 + guy.width / 2) {
				direction = 0;
			}
			if (direction > 0 && guy.x >= 400 - guy.width / 2) {
				direction = 0
			}
			guy.x += 4 * direction;
		}	
	}
}