package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Harp extends Sprite
	{
		public var notes : NootAnimations;
		
		private var gravity : Number = 6;
		
		public function Harp(PosX : int, noteType : int)
		{
			notes = new NootAnimations();
			addChild(notes);
			notes.x = PosX;
			notes.gotoAndStop(noteType);
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			notes.y += gravity;
			
		}
		
		
	}

}