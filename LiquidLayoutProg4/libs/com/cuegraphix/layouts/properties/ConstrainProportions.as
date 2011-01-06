package com.cuegraphix.layouts.properties 
{
    import com.cuegraphix.layouts.*;
    import flash.display.*;
    
    public class ConstrainProportions extends com.cuegraphix.layouts.LiquidLayoutProperty
    {
        public function ConstrainProportions(arg1:String, arg2:Object, arg3:String, arg4:Object=null)
        {
            super(arg1, arg2, arg3, arg4);
            return;
        }

        private function getOutsideSize(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Number):*
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            if (arg1 < arg2) 
            {
                loc1 = arg4;
                loc2 = Math.round(arg4 / arg3);
            }
            else if (arg1 > arg2) 
            {
                loc1 = Math.round(arg5 * arg3);
                loc2 = arg5;
            }
            else 
            {
                loc1 = arg4;
                loc2 = arg5;
            }
            return {"width":loc1, "height":loc2};
        }

        private function getInsideSize(arg1:Number, arg2:Number, arg3:Number, arg4:Number, arg5:Number):*
        {
            var loc1:*=NaN;
            var loc2:*=NaN;
            if (arg1 > arg2) 
            {
                loc1 = arg4;
                loc2 = Math.round(arg4 / arg3);
            }
            else if (arg1 < arg2) 
            {
                loc1 = Math.round(arg5 * arg3);
                loc2 = arg5;
            }
            else 
            {
                loc1 = arg4;
                loc2 = arg5;
            }
            return {"width":loc1, "height":loc2};
        }

        public override function transform(arg1:com.cuegraphix.layouts.LiquidLayout, arg2:Object):void
        {
            var loc9:*=null;
            var loc1:*=arg2 as DisplayObject;
            if (loc1 == null) 
            {
                return;
            }
            var loc2:*=loc1.width / loc1.scaleX;
            var loc3:*=loc1.height / loc1.scaleY;
            var loc4:*=arg1.width;
            var loc5:*=arg1.height;
            if (value is Array) 
            {
                if (!isNaN(value[0])) 
                {
                    loc4 = loc4 + value[0];
                }
                if (!isNaN(value[1])) 
                {
                    loc5 = loc5 + value[1];
                }
            }
            else if (value is Number) 
            {
                loc4 = loc4 + value;
                loc5 = loc5 + value;
            }
            else if (value is Object) 
            {
                if (!isNaN(value.width)) 
                {
                    loc4 = loc4 + value.width;
                }
                if (!isNaN(value.height)) 
                {
                    loc5 = loc5 + value.height;
                }
            }
            var loc6:*=loc2 / loc4;
            var loc7:*=loc3 / loc5;
            var loc8:*=loc2 / loc3;
            if (align != FIX_INSIDE) 
            {
                if (align != FIX_OUTSIDE) 
                {
                    return;
                }
                else 
                {
                    loc9 = this.getOutsideSize(loc6, loc7, loc8, loc4, loc5);
                }
            }
            else 
            {
                loc9 = this.getInsideSize(loc6, loc7, loc8, loc4, loc5);
            }
            loc1.width = loc9.width;
            loc1.height = loc9.height;
            loc1.x = Math.round(arg1.center - loc9.width / 2);
            loc1.y = Math.round(arg1.middle - loc9.height / 2);
            return;
        }

        public static function init():void
        {
            LiquidLayout.registSpecialProperties("inside", ConstrainProportions);
            LiquidLayout.registSpecialProperties("outside", ConstrainProportions);
            return;
        }

        public static const FIX_OUTSIDE:String="outside";

        public static const FIX_INSIDE:String="inside";
    }
}
