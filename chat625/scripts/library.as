// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//library

package 
{
    import flash.display.Sprite;
    import flash.utils.getDefinitionByName;
    import flash.display.*;
    import flash.utils.*;

    public dynamic class library extends Sprite 
    {

        public var type:String = null;
        public var ww = 0;
        public var hh = 0;
        public var xitem;

        public function library(_arg_1:String)
        {
            var _local_2:Class;
            super();
            this.type = _arg_1;
            if (this.ww == 0)
            {
                _local_2 = (getDefinitionByName(_arg_1) as Class);
                this.xitem = new (_local_2)();
                this.ww = this.xitem.width;
                this.hh = this.xitem.height;
                addChild(this.xitem);
            } else
            {
                this.xitem = this;
            };
        }

    }
}//package 

