package com.cuegraphix.layouts 
{
    public class LiquidLayoutProperty extends Object
    {
        public function LiquidLayoutProperty(arg1:String, arg2:Object, arg3:String, arg4:Object=null)
        {
            super();
            this.align = arg1;
            this.value = arg2;
            this.property = arg3;
            this.extra = arg4;
            return;
        }

        public function toString():String
        {
            return "[LiquidLayoutProperty align:" + this.align + " property:" + this.property + "]";
        }

        public function transform(arg1:com.cuegraphix.layouts.LiquidLayout, arg2:Object):void
        {
            var loc1:*=null;
            var loc2:*=NaN;
            if (this.value is String) 
            {
                loc2 = parseInt(String(this.value));
                if (!isNaN(loc2)) 
                {
                    if (arg1.calcParcentProperties[this.align]) 
                    {
                        loc1 = arg1[this.align] + arg1[arg1.calcParcentProperties[this.align]] * loc2 / 100;
                    }
                    else 
                    {
                        loc1 = arg1[this.align] * loc2 / 100;
                    }
                }
            }
            else if (this.value is Function) 
            {
                loc1 = this.value.apply(arg2, [arg1[this.align]]);
            }
            else if (this.value is Number) 
            {
                loc1 = arg1[this.align] + this.value;
            }
            arg2[this.property] = loc1;
            return;
        }

        public var extra:Object;

        public var value:Object;

        public var align:String;

        public var property:String;
    }
}
