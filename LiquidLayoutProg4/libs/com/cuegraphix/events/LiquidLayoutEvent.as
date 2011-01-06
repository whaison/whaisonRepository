package com.cuegraphix.events 
{
    import com.cuegraphix.layouts.*;
    import flash.events.*;
    
    public class LiquidLayoutEvent extends flash.events.Event
    {
		public static const RESIZE_START:String="resizeStart";

        public static const RESIZE_PROGRESS:String="resizeProgress";

        public static const RESIZE_ALWAYS:String="resizeAlways";

        public static const RESIZE_COMPLETE:String="resizeComplete";

        private var _layout:LiquidLayout;
		
        public function LiquidLayoutEvent(arg1:String, arg2:Boolean=false, arg3:Boolean=false, arg4:LiquidLayout=null)
        {
            super(arg1, arg2, arg3);
            this._layout = arg4;
            
        }

        public function get layout():com.cuegraphix.layouts.LiquidLayout
        {
            return this._layout;
        }

        public override function clone():flash.events.Event
        {
            return new LiquidLayoutEvent(type, bubbles, cancelable, this.layout);
        }

        public override function toString():String
        {
            return formatToString("LiquidLayoutEvent", "type", "bubbles", "cancelable", "eventPhase");
        }


    }
}
