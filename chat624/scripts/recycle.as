// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//recycle

package 
{
    import flash.display.MovieClip;
    import flash.utils.Dictionary;
    import flash.events.Event;
    import flash.events.*;
    import flash.display.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.geom.*;
    import flash.system.*;

    public class recycle extends MovieClip 
    {

        var tc = 0;
        var bin;
        var subd;
        var cput = 0;
        var cget = 0;
        public var total;

        public function recycle()
        {
            this.bin = new Dictionary(true);
            this.subd = new Dictionary();
            super();
            addEventListener(Event.ENTER_FRAME, this.tick);
        }

        public function put(_arg_1:*, _arg_2:*)
        {
            this.cput++;
            if ((this.bin[_arg_1] is Dictionary))
            {
                this.bin[_arg_1][_arg_2] = true;
            } else
            {
                if (this.subd[_arg_1])
                {
                    delete this.subd[_arg_1];
                };
                this.subd[_arg_1] = new Dictionary(true);
                this.subd[_arg_1][_arg_2] = true;
                this.bin[_arg_1] = this.subd[_arg_1];
            };
        }

        function grab(_arg_1:*)
        {
            var _local_2:*;
            var _local_3:*;
            this.cget++;
            if (!this.bin[_arg_1])
            {
                return (null);
            };
            if ((this.bin[_arg_1] is Dictionary))
            {
                _local_2 = null;
                for (_local_3 in this.bin[_arg_1])
                {
                    if (_local_2)
                    {
                        return (_local_2);
                    };
                    _local_2 = _local_3;
                    delete this.bin[_arg_1][_local_3];
                };
                delete this.subd[_arg_1];
                delete this.bin[_arg_1];
                return (_local_2);
            };
            return (null);
        }

        function dump(_arg_1:*=undefined)
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_2:* = "";
            this.total = 0;
            if (_arg_1 == undefined)
            {
                _arg_1 = this.bin;
            };
            for (_local_3 in _arg_1)
            {
                if ((_arg_1[_local_3] is Dictionary))
                {
                    _local_4 = 0;
                    for (_local_5 in _arg_1[_local_3])
                    {
                        _local_4++;
                    };
                    _local_2 = (_local_2 + (((("(" + _local_4) + ") ") + _local_3) + ", "));
                    this.total = (this.total + _local_4);
                } else
                {
                    _local_2 = (_local_2 + (("(1) " + _local_3) + ", "));
                    this.total++;
                };
            };
            _local_4 = 0;
            for (_local_3 in this.subd)
            {
                _local_4++;
            };
            _local_2 = (_local_2 + ((" (subd=" + _local_4) + ")"));
            _local_2 = (_local_2 + (((((" Recycle Size: " + this.total) + " cput=") + this.cput) + " cget=") + this.cget));
            this.cget = (this.cput = 0);
            if (this.total == 0)
            {
                _local_2 = "";
            };
            return (_local_2);
        }

        function tick(_arg_1:Event)
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            this.tc++;
            if ((this.tc % 12) == 0)
            {
                for (_local_2 in this.subd)
                {
                    _local_3 = 0;
                    for (_local_4 in this.subd[_local_2])
                    {
                        _local_3 = 1;
                        break;
                    };
                    if (_local_3 == 0)
                    {
                        delete this.subd[_local_2];
                        delete this.bin[_local_2];
                    };
                };
            };
        }


    }
}//package 

