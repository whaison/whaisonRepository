package com.cuegraphix.layouts 
{
    import com.cuegraphix.events.*;
    import flash.errors.*;
    import flash.utils.*;
    
    public class LiquidLayoutListener extends Object
    {
        public function LiquidLayoutListener()
        {
            this.eventType = LiquidLayoutEvent.RESIZE_ALWAYS;
            super();
            this._properties = new Dictionary(true);
            return;
        }

        public function removeProperty(arg1:com.cuegraphix.layouts.LiquidLayoutProperty):void
        {
            delete this._properties[arg1];
            return;
        }

        public function update(arg1:com.cuegraphix.layouts.LiquidLayout, arg2:Object, arg3:String=null):void
        {
            var layout:com.cuegraphix.layouts.LiquidLayout;
            var nowEventType:String=null;
            var prop:com.cuegraphix.layouts.LiquidLayoutProperty;
            var target:Object;

            var loc1:*;
            prop = null;
            layout = arg1;
            target = arg2;
            nowEventType = arg3;
            if (!this.enabled) 
            {
                return;
            }
            if (nowEventType == null || this.eventType == nowEventType) 
            {
                var loc2:*=0;
                var loc3:*=this._properties;
                for each (prop in loc3) 
                {
                    prop.transform(layout, target);
                }
            }
            if ((nowEventType == null || nowEventType == LiquidLayoutEvent.RESIZE_START) && !(this.onResizeStart == null)) 
            {
                try 
                {
                    this.onResizeStart.apply(target, this.onResizeStartParams);
                }
                catch (e:Error)
                {
                    throw new IllegalOperationError(formatErrorMessage(eventType));
                }
            }
            else if ((nowEventType == null || nowEventType == LiquidLayoutEvent.RESIZE_PROGRESS) && !(this.onResizeProgress == null)) 
            {
                try 
                {
                    this.onResizeProgress.apply(target, this.onResizeProgressParams);
                }
                catch (e:Error)
                {
                    throw new IllegalOperationError(formatErrorMessage(eventType));
                }
            }
            else if ((nowEventType == null || nowEventType == LiquidLayoutEvent.RESIZE_COMPLETE) && !(this.onResizeComplete == null)) 
            {
                try 
                {
                    this.onResizeComplete.apply(target, this.onResizeCompleteParams);
                }
                catch (e:Error)
                {
                    throw new IllegalOperationError(formatErrorMessage(eventType));
                }
            }
            if (this.onResize != null) 
            {
                try 
                {
                    this.onResize.apply(target, this.onResizeParams);
                }
                catch (e:Error)
                {
                    throw new IllegalOperationError(formatErrorMessage(eventType));
                }
            }
            return;
        }

        public function removePropertyByPropertyName(arg1:String):void
        {
            this.removeProperty(this.getPropertyByPropertyName(arg1));
            return;
        }

        public function addProperty(arg1:com.cuegraphix.layouts.LiquidLayoutProperty):void
        {
            this._properties[arg1.property] = arg1;
            return;
        }

        public function removeAllProperties():void
        {
            var loc1:*=null;
            var loc2:*=0;
            var loc3:*=this._properties;
            for each (loc1 in loc3) 
            {
                this.removeProperty(loc1);
            }
            return;
        }

        public function destroy():void
        {
            this.removeAllProperties();
            this._properties = null;
            this.eventType = null;
            this.enabled = false;
            this.onResize = null;
            this.onResizeStart = null;
            this.onResizeProgress = null;
            this.onResizeComplete = null;
            this.onResizeParams = null;
            this.onResizeStartParams = null;
            this.onResizeProgressParams = null;
            this.onResizeCompleteParams = null;
            return;
        }

        public function getPropertyByPropertyName(arg1:String):com.cuegraphix.layouts.LiquidLayoutProperty
        {
            var loc1:*=null;
            var loc2:*=0;
            var loc3:*=this._properties;
            for each (loc1 in loc3) 
            {
                if (loc1.property != arg1) 
                {
                    continue;
                }
                return loc1;
            }
            return null;
        }

        public function getPropertyByAlign(arg1:String):com.cuegraphix.layouts.LiquidLayoutProperty
        {
            var loc1:*=null;
            var loc2:*=0;
            var loc3:*=this._properties;
            for each (loc1 in loc3) 
            {
                if (loc1.align != arg1) 
                {
                    continue;
                }
                return loc1;
            }
            return null;
        }

        public function removePropertyByAlign(arg1:String):void
        {
            this.removeProperty(this.getPropertyByAlign(arg1));
            return;
        }

        protected function formatErrorMessage(arg1:String):String
        {
            return arg1 + " メソッド実行中にエラーが発生しました。";
        }

        public var onResizeProgress:Function;

        public var enabled:Boolean;

        public var onResizeComplete:Function;

        private var _properties:flash.utils.Dictionary;

        public var onResizeStartParams:Array;

        public var onResizeParams:Array;

        public var onResizeProgressParams:Array;

        public var onResizeStart:Function;

        public var onResize:Function;

        public var eventType:String;

        public var onResizeCompleteParams:Array;
    }
}
