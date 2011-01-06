package com.cuegraphix.layouts 
{
	import authoring.authObject;
    import com.cuegraphix.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import jp.nium.display.*;
    import jp.nium.events.*;
    import jp.nium.utils.*;
	//prog4
	import jp.progression.casts.*;
	import jp.progression.commands.display.*;
	import jp.progression.commands.lists.*;
	import jp.progression.commands.managers.*;
	import jp.progression.commands.media.*;
	import jp.progression.commands.net.*;
	import jp.progression.commands.tweens.*;
	import jp.progression.commands.*;
	import jp.progression.data.*;
	import jp.progression.events.*;
	import jp.progression.loader.*;
	import jp.progression.*;
	import jp.progression.scenes.*;
	//
    import jp.progression.casts.CastDocument;
	///
    public class LiquidLayout extends EventDispatcher
    {
		public static const SUB_PROPERTY_NAME_SUFFIX:String="PropName";

       //protected var _document:ExDocument;
		//public var _document:ExDocument;
		protected var _document:Object;
		/*
		private  var _manager:Object;
		private var _stage;
        */
		var calcParcentProperties:Object;

        private var _eventHandlerEnabled:Boolean=false;

        private var _initialized:Boolean=false;

        private var _stageMinWidth:int=0;

        protected var _listeners:flash.utils.Dictionary;

        private var _stageMinHeight:int=0;

        private var _stageMaxWidth:int=2880;

        private var _stageMaxHeight:int=2880;

        protected static var _correspondingProperties:Object;

        protected static var _specialProperties:Object;

        protected static var _restrictedWords:Object;

        protected static var _restrictedEvents:Object;
		
        //public function LiquidLayout(document:ExDocument, arg2:int = 0, arg3:int = 0, arg4:int = 2880, arg5:int = 2880, manager:Object= null,stage:Object= null)
        public function LiquidLayout(document:ExDocument, arg2:int = 0, arg3:int = 0, arg4:int = 2880, arg5:int = 2880)
		{
            this.calcParcentProperties = {"left":"width", "center":"width", "right":"width", "top":"height", "middle":"height", "bottom":"height"};
            super();
            this._document = document;
			/*
			this._manager = manager
			this._stage=stage
			trace("_document=" + this._document)
			//trace("_document.manager=" + _document.manager)
			trace("_manager=" + _manager)
			trace("_manager.stage=" + _manager.stage)
			trace("_stage="+_stage)
			*/
            this._stageMinWidth = arg2;
            this._stageMinHeight = arg3;
            this._stageMaxWidth = arg4;
            this._stageMaxHeight = arg5;
            this._listeners = new Dictionary(true);
            if (this._document.loaderInfo != null) 
            {
                this._initialize();
            }
            else 
            {
                this._document.addEventListener(ExEvent.EX_READY, this._init, false, int.MAX_VALUE, true);
            }
            return;
        }

        private function _resizeCompleteHandler(arg1:flash.events.Event):void
        {
			trace("_resizeCompleteHandler")
            this.updateLayouts(LiquidLayoutEvent.RESIZE_COMPLETE);
            return;
        }

        private function _resizeProgressHandler(arg1:flash.events.Event):void
        {
            this.updateLayouts(LiquidLayoutEvent.RESIZE_PROGRESS);
            return;
        }

        private function updateLayouts(arg1:String=null):void
        {
            var loc1:*=null;
            var loc2:*=0;
            var loc3:*=this._listeners;
            for (loc1 in loc3) 
            {
                this.updateLayoutListenerAt(loc1, this._listeners[loc1], arg1);
            }
            return;
        }

        public function get middle():Number
        {
            return this.centerY;
        }

        public function get left():Number
        {
            return ExDocument.left;
        }

        public function updateAll():void
        {
            this.updateLayouts();
            return;
        }

        public function set stageMaxHeight(arg1:int):void
        {
            this._stageMaxHeight = arg1;
            return;
        }

        public function setEnableLayout(arg1:Object, arg2:Boolean):void
        {
            var loc1:*=this.getLayoutListenerByTarget(arg1);
            if (loc1 == null) 
            {
                return;
            }
            var loc2:*;
            loc1.enabled = loc2 = arg2;
            if (loc2) 
            {
                this.updateLayoutListenerAt(arg1, loc1);
            }
            return;
        }

        public function removeLayoutAt(arg1:Object):void
        {
            var loc1:*=this.getLayoutListenerByTarget(arg1);
            if (loc1) 
            {
                loc1.destroy();
            }
            delete this._listeners[arg1];
            loc1 = null;
            return;
        }

        public function set eventHandlerEnabled(arg1:Boolean):void
        {
            var loc1:*;
            this._eventHandlerEnabled = loc1 = arg1;
            if (loc1) 
            {
				
				trace("arg1" + arg1 + "loc1=" + loc1 + "セットされました")
				_document.manager.stage.addEventListener(Event.RESIZE, this._resizeHandler, false, 0, true);
                _document.manager.stage.addEventListener(ExEvent.EX_RESIZE_START, this._resizeStartHandler, false, 0, true);
                _document.manager.stage.addEventListener(ExEvent.EX_RESIZE_PROGRESS, this._resizeProgressHandler, false, 0, true);
				_document.manager.stage.addEventListener(ExEvent.EX_RESIZE_COMPLETE, this._resizeCompleteHandler)
				//addEventListener(ExEvent.EX_RESIZE_COMPLETE, this._resizeCompleteHandler, false, 0, true);
				//_manager.stage.addEventListener(ExEvent.EX_RESIZE_COMPLETE, this._resizeCompleteHandler)

				//_stage.addEventListener(ExEvent.EX_RESIZE_COMPLETE, this._resizeCompleteHandler)
				//ExDocument.stage.addEventListener(ExEvent.EX_RESIZE_COMPLETE, this._resizeCompleteHandler)
            }
            else 
            {
                _document.manager.stage.removeEventListener(Event.RESIZE, this._resizeHandler);
				_document.manager.stage. removeEventListener(ExEvent.EX_RESIZE_START, this._resizeStartHandler);
                _document.manager.stage.removeEventListener(ExEvent.EX_RESIZE_PROGRESS, this._resizeProgressHandler);
				_document.manager.stage.removeEventListener(ExEvent.EX_RESIZE_COMPLETE,this._resizeCompleteHandler)
            }
            return;
        }

        public function get centerX():Number
        {
            return this.right / 2 + this.left / 2;
        }

        public function get height():Number
        {
            return this.stageHeight;
        }

        private function errorHandler(arg1:Error):void
        {
            trace(arg1.message);
            return;
        }

        public function get bottom():Number
        {
            return this.top + this.stageHeight;
        }

        public function get originStageWidth():int
        {
            return this.stage ? this.stage.stageWidth : 0;
        }

        private function _initialize():void
        {
            if (this._document.loaderInfo == null) 
            {
                if (!this._document.hasEventListener(ExEvent.EX_READY)) 
                {
                    this._document.addEventListener(ExEvent.EX_READY, this._init, false, int.MAX_VALUE, true);
                }
                return;
            }
            this._initialized = true;
            this.eventHandlerEnabled = true;
            this._document.removeEventListener(ExEvent.EX_READY, this._init);
            this.stage.addEventListener(Event.RESIZE, dispatchEvent, false, 0, true);
            this._document.addEventListener(ExEvent.EX_RESIZE_START, dispatchEvent, false, 0, true);
            this._document.addEventListener(ExEvent.EX_RESIZE_PROGRESS, dispatchEvent, false, 0, true);
            this._document.addEventListener(ExEvent.EX_RESIZE_COMPLETE, dispatchEvent, false, 0, true);
            return;
        }

        public function addLayout(arg1:Object, arg2:Object):void
        {
            var config:Object;
            var listener:com.cuegraphix.layouts.LiquidLayoutListener;
            var lp:com.cuegraphix.layouts.LiquidLayoutProperty;
            var p:String;
            var propClass:Class;
            var propName:String;
            var target:Object;

            var loc1:*;
            p = null;
            propClass = null;
            lp = null;
            propName = null;
            target = arg1;
            config = arg2;
            listener = this.getLayoutListenerByTarget(target);
            if (listener == null) 
            {
                listener = new LiquidLayoutListener();
            }
            listener.eventType = config.eventType && _restrictedEvents[config.eventType] ? config.eventType : listener.eventType;
            if (config.enabled !== false) 
            {
                if (target is DisplayObject) 
                {
                    if (target.stage != null) 
                    {
                        listener.enabled = true;
                        target.addEventListener(Event.REMOVED_FROM_STAGE, this._targetRemovedToStageHandler);
                    }
                    else 
                    {
                        listener.enabled = false;
                        target.addEventListener(Event.ADDED_TO_STAGE, this._targetAddedToStageHandler);
                    }
                }
                else 
                {
                    listener.enabled = true;
                }
            }
            else 
            {
                listener.enabled = false;
            }
			/**/
            listener.onResize 				= listener.onResize 				|| config.onResize;
            listener.onResizeParams 		= listener.onResizeParams 			|| config.onResizeParams;
            listener.onResizeStart 			= listener.onResizeStart 			|| config.onResizeStart;
            listener.onResizeStartParams 	= listener.onResizeStartParams 		|| config.onResizeStartParams;
            listener.onResizeProgress	 	= listener.onResizeProgress 		|| config.onResizeProgress;
            listener.onResizeProgressParams = listener.onResizeProgressParams 	|| config.onResizeProgressParams;
            listener.onResizeComplete 		= listener.onResizeComplete 		|| config.onResizeComplete;
            listener.onResizeCompleteParams = listener.onResizeCompleteParams 	|| config.onResizeCompleteParams;
            
			/*
			listener.onResize               ||= config.onResize;
			listener.onResizeParams         ||= config.onResizeParams;
			listener.onResizeStart          ||= config.onResizeStart;
			listener.onResizeStartParams    ||= config.onResizeStartParams;
			listener.onResizeProgress       ||= config.onResizeProgress;
			listener.onResizeProgressParams ||= config.onResizeProgressParams;
			listener.onResizeComplete       ||= config.onResizeComplete;
			listener.onResizeCompleteParams ||= config.onResizeCompleteParams;
			*/
			var loc2:*=0;
            var loc3:*=config;
            for (p in loc3) 
            {
                if (_restrictedWords[p]) 
                {
                    continue;
                }
                if (_specialProperties[p]) 
                {
                    propClass = _specialProperties[p] as Class;
                    if (propClass == null) 
                    {
                        continue;
                    }
                    try 
                    {
                        lp = LiquidLayoutProperty(new propClass(p, config[p], p));
                    }
                    catch (e:Error)
                    {
                        continue;
                    }
                    listener.addProperty(lp);
                    continue;
                }
                if (!_correspondingProperties[p]) 
                {
                    continue;
                }
                propName = config[p + SUB_PROPERTY_NAME_SUFFIX] ? config[p + SUB_PROPERTY_NAME_SUFFIX] : _correspondingProperties[p];
                listener.addProperty(new LiquidLayoutProperty(p, config[p], propName));
            }
            this.addLayoutListener(target, listener);
            return;
        }

        public function get right():Number
        {
            return this.left + this.stageWidth;
        }

        public function isEnabled(arg1:Object):Boolean
        {
            var loc1:*=this._listeners[arg1];
            if (loc1 == null) 
            {
                return false;
            }
            return loc1.enabled;
        }

        public function get stageMinWidth():int
        {
            return this._stageMinWidth;
        }

        public function get stageMinHeight():int
        {
            return this._stageMinHeight;
        }

        public function get centerY():Number
        {
            return this.bottom / 2 + this.top / 2;
        }

        private function _targetRemovedToStageHandler(arg1:flash.events.Event):void
        {
            this.setEnableLayout(arg1.target, true);
            return;
        }

        public function get originStageHeight():int
        {
            return this.stage ? this.stage.stageHeight : 0;
        }

        private function updateLayoutListenerAt(arg1:Object, arg2:com.cuegraphix.layouts.LiquidLayoutListener, arg3:String=null):void
        {
            var eventType:String=null;
            var listener:com.cuegraphix.layouts.LiquidLayoutListener;
            var target:Object;

            var loc1:*;
            target = arg1;
            listener = arg2;
            eventType = arg3;
            if (!this._initialized) 
            {
                return;
            }
            if (listener == null) 
            {
                return;
            }
            try 
            {
                listener.update(this, target, eventType);
            }
            catch (e:Error)
            {
                errorHandler(undefined);
            }
            return;
        }

        public function get stageHeight():int
        {
            return Math.max(Math.min(ExDocument.stage.stageHeight, this.stageMaxHeight), this.stageMinHeight);
        }

        public function get width():Number
        {
            return this.stageWidth;
        }

        public function set stageMaxWidth(arg1:int):void
        {
            this._stageMaxWidth = arg1;
            return;
        }

        public function removeAllLayouts():void
        {
            var loc1:*=null;
            var loc2:*=0;
            var loc3:*=this._listeners;
            for (loc1 in loc3) 
            {
                this.removeLayoutAt(loc1);
            }
            return;
        }

        public function get stageMaxHeight():int
        {
            return this._stageMaxHeight;
        }

        public function removeLayout(... rest):void
        {
            var loc1:*=0;
            while (loc1 < rest.length) 
            {
                this.removeLayoutAt(rest[loc1]);
                loc1 = (loc1 + 1);
            }
            return;
        }

        public function get eventHandlerEnabled():Boolean
        {
            return this._eventHandlerEnabled;
        }

        public function get center():Number
        {
            return this.centerX;
        }

        private function _targetAddedToStageHandler(arg1:flash.events.Event):void
        {
            arg1.target.removeEventListener(Event.ADDED_TO_STAGE, this._targetAddedToStageHandler);
            this.setEnableLayout(arg1.target, true);
            arg1.target.addEventListener(Event.REMOVED_FROM_STAGE, this._targetRemovedToStageHandler);
            return;
        }

        public function getLayoutListenerByTarget(arg1:Object):com.cuegraphix.layouts.LiquidLayoutListener
        {
            return this._listeners[arg1] as LiquidLayoutListener;
        }

        public function get stageMaxWidth():int
        {
            return this._stageMaxWidth;
        }

        public function updateAt(... rest):void
        {
            var loc2:*=null;
            var loc1:*=0;
            while (loc1 < rest.length) 
            {
                loc2 = this.getLayoutListenerByTarget(rest[loc1]);
                if (loc2) 
                {
                    this.updateLayoutListenerAt(rest[loc1], loc2);
                }
                loc1 = (loc1 + 1);
            }
            return;
        }

        public function set stageMinWidth(arg1:int):void
        {
            this._stageMinWidth = arg1;
            return;
        }

        public function get stageWidth():int
        {
            return Math.max(Math.min(ExDocument.stage.stageWidth, this.stageMaxWidth), this.stageMinWidth);
        }

        public function get top():Number
        {
            return -getMarginTop(this.stage);
        }

        private function _init(arg1:jp.nium.events.ExEvent):void
        {
            this._document.removeEventListener(ExEvent.EX_READY, this._init);
            this._initialize();
            return;
        }

        public function set stageMinHeight(arg1:int):void
        {
            this._stageMinHeight = arg1;
            return;
        }

        private function _resizeHandler(arg1:flash.events.Event):void
        {
			//trace("LiquidLayout._resizeHandler")
            this.updateLayouts(LiquidLayoutEvent.RESIZE_ALWAYS);
            dispatchEvent(new LiquidLayoutEvent(LiquidLayoutEvent.RESIZE_ALWAYS, false, false, this));
            return;
        }

        public function destroy():void
        {
            this.eventHandlerEnabled = false;
            this._initialized = false;
            this._document.removeEventListener(ExEvent.EX_READY, this._init);
            this.stage.removeEventListener(Event.RESIZE, dispatchEvent);
            this._document.removeEventListener(ExEvent.EX_RESIZE_START, dispatchEvent);
            this._document.removeEventListener(ExEvent.EX_RESIZE_PROGRESS, dispatchEvent);
            this._document.removeEventListener(ExEvent.EX_RESIZE_COMPLETE, dispatchEvent);
            this._document = null;
            this.removeAllLayouts();
            this._listeners = null;
            return;
        }

        private function _resizeStartHandler(arg1:flash.events.Event):void
        {
            this.updateLayouts(LiquidLayoutEvent.RESIZE_START);
            return;
        }

        public function get stage():flash.display.Stage
        {
            return ExDocument.stage;
        }

        public function addLayoutListener(arg1:Object, arg2:com.cuegraphix.layouts.LiquidLayoutListener):void
        {
            this._listeners[arg1] = arg2;
            this.updateLayoutListenerAt(arg1, arg2);
            return;
        }

        public static function getMarginTop(arg1:flash.display.Stage):Number
        {
            var root:flash.display.Sprite;
            var rootHeight:Number;
            var stage:flash.display.Stage;
            var stgHeight:Number;

            var loc1:*;
            rootHeight = NaN;
            stgHeight = NaN;
            stage = arg1;
            root = StageUtil.getDocument(stage);
            try 
            {
                rootHeight = root.loaderInfo.height;
                stgHeight = stage.stageHeight;
            }
            catch (e:Error)
            {
                return -1;
            }
            var loc2:*=stage.scaleMode;
            switch (loc2) 
            {
                case StageScaleMode.NO_SCALE:
                {
                    loc2 = stage.align;
                    switch (loc2) 
                    {
                        case StageAlign.TOP:
                        case StageAlign.TOP_LEFT:
                        case StageAlign.TOP_RIGHT:
                        {
                            return 0;
                        }
                        case StageAlign.BOTTOM:
                        case StageAlign.BOTTOM_LEFT:
                        case StageAlign.BOTTOM_RIGHT:
                        {
                            return stgHeight - rootHeight;
                        }
                        default:
                        {
                            return (stgHeight - rootHeight) / 2;
                        }
                    }
                }
                case StageScaleMode.EXACT_FIT:
                case StageScaleMode.NO_BORDER:
                case StageScaleMode.SHOW_ALL:
                {
                    return 0;
                }
            }
            return 0;
        }

        public static function registSpecialProperties(arg1:String, arg2:Class):void
        {
            _specialProperties[arg1] = arg2;
            return;
        }

        
        {
            _correspondingProperties = {"left":"x", "center":"x", "right":"x", "top":"y", "middle":"y", "bottom":"y", "centerX":"x", "centerY":"y", "width":"width", "height":"height", "stageWidth":"width", "stageHeight":"height", "scaleX":"scaleX", "scaleY":"scaleY"};
            _restrictedWords = {"eventType":true, "transitionType":true, "onResize":true, "onResizeStart":true, "onResizeProgress":true, "onResizeComplete":true, "onResizeParams":true, "onResizeStartParams":true, "onResizeProgressParams":true, "onResizeCompleteParams":true};
            _specialProperties = {};
            _restrictedEvents = {"resizeAlways":true, "resizeStart":true, "resizeProgress":true, "resizeComplete":true};
        }


    }
}
