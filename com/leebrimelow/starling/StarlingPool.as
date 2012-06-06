package com.leebrimelow.starling
{
	import starling.display.DisplayObject;

	public class StarlingPool
	{
		private var pool:Array;
		private var counter:int;
		
		public function StarlingPool(type:Class, len:int)
		{
			pool = new Array();
			counter = len;
			
			var i:int = len;
			while(--i > -1)
				pool[i] = new type();
		}
		
		public function getSprite():DisplayObject
		{
			if(counter > 0)
				return pool[--counter];
			else
				throw new Error("You exhausted the pool!");
		}
		
		public function returnSprite(s:DisplayObject):void
		{
			pool[counter++] = s;
		}
	}
}