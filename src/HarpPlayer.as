package  
{
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.media.SoundChannel;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class HarpPlayer extends MovieClip
	{
		public var harp : Note;
		public var harpsArray : Vector.<Note>;
		
		private var harpSound1 : HarpSound1 = new HarpSound1();
		private var harpSound2 : HarpSound2 = new HarpSound2();
		private var harpSound3 : HarpSound3 = new HarpSound3();
		private var harpSound4 : HarpSound4 = new HarpSound4();
		private var harpSound5 : HarpSound5 = new HarpSound5();
		private var harpSound6 : HarpSound6 = new HarpSound6();
		private var harpSound7 : HarpSound7 = new HarpSound7();
		private var harpSound8 : HarpSound8 = new HarpSound8();
		
		private var soundChannel : SoundChannel = new SoundChannel();
		
		private var waitTimer : Timer;
		
		public var canPlay : Boolean = true;
		
		public function HarpPlayer() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			harpsArray = new Vector.<Note>;
			
			waitTimer = new Timer(425, 1);
			waitTimer.addEventListener(TimerEvent.TIMER, waitForAttack);
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		}
		
		private function waitForAttack(e:TimerEvent):void 
		{
			if (waitTimer.currentCount < 2)
			{
				canPlay = true;
				waitTimer.reset();
			}
		}
		
		private function playNote():void
		{
			canPlay = false;
			waitTimer.start();
			addChild(harp);
			harpsArray.push(harp);
			soundChannel.stop();
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == 87)
			{
				if (canShoot)
				{
					harp = new Note(0, 1);
					playNote();
					soundChannel = harpSound1.play();
				}
				
			}
			if (e.keyCode == 65)
			{
				if (canShoot)
				{
					harp = new Note(50, 2);
					playNote();
					soundChannel = harpSound2.play();
				}
			}
			if (e.keyCode == 83)
			{
				if (canShoot)
				{
					harp = new Note(100, 1);
					playNote();
					soundChannel = harpSound3.play();
				}
			}
			if (e.keyCode == 68)
			{
				if (canShoot)
				{
					harp = new Note(150, 2);
					playNote();
					soundChannel = harpSound4.play();
				}
			}
			if (e.keyCode == 70)
			{
				if (canShoot)
				{
					harp = new Note(200, 1);
					playNote();
					soundChannel = harpSound5.play();
				}
			}
			if (e.keyCode == 71)
			{
				if (canShoot)
				{
					harp = new Note(250, 2);
					playNote();
					soundChannel = harpSound6.play();
				}
			}
			if (e.keyCode == 38)
			{
				if (canShoot)
				{
					harp = new Note(300,1);
					playNote();
					soundChannel = harpSound7.play();
				}
			}
			if (e.keyCode == 40)
			{
				if (canShoot)
				{
					harp = new Note(350,2);
					playNote();
					soundChannel = harpSound8.play();
				}
			}
			
		}
		
		
		
	}

}