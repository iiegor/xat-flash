// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//cachedSprite

package 
{
    import flash.display.Sprite;
    import flash.utils.Dictionary;
    import flash.display.BitmapData;
    import flash.events.*;
    import flash.display.*;
    import flash.utils.*;

    public class cachedSprite extends Sprite 
    {

        public static var dic:Dictionary = new Dictionary();
        public static const cs_RollOver = 1;
        private static const TTL:int = (1 * 60);//60

        var bd:BitmapData;
        var Frames:int;
        var Pending:Boolean = true;
        var Timeout:int = 0;
        public var Flags:int = 0;


        public static function Tidy()
        {
            var _local_1:*;
            var _local_2:*;
            for (_local_1 in dic)
            {
                _local_2 = dic[_local_1];
                _local_2.Timeout++;
                if (_local_2.Timeout > TTL)
                {
                    if (_local_2.bd)
                    {
                        _local_2.bd.dispose();
                    };
                    delete dic[_local_1];
                };
            };
        }


    }
}//package 

