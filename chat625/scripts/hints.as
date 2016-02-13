// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//hints

package 
{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextFormat;
    import flash.geom.Point;
    import flash.text.TextField;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;

    public class hints extends Sprite 
    {

        var HintHldMc:MovieClip;
        var HintDisplayed:Boolean = false;
        var HintBoxx:Number;
        var HintBoxy:Number;
        var Hinttxt:String;
        var Hintvis:Boolean = false;
        var HintPos:Number;
        var Hintsize:Number;
        var HintMaxWidth:Number;
        var HintUpdate:Number = -1;
        var HintMc;
        var heartbeatduration:Number = 83;

        public function hints()
        {
            if (todo.config["nohints"])
            {
                return;
            };
            addEventListener(Event.ENTER_FRAME, this.tick);
        }

        public function EasyHint(_arg_1:MouseEvent)
        {
            var _local_2:* = _arg_1.currentTarget;
            this.Hint(xatlib.xInt(_local_2.hint["Boxx"]), xatlib.xInt(_local_2.hint["Boxy"]), _local_2.hint["Hint"], true, xatlib.xInt(_local_2.hint["Pos"]), xatlib.xInt(_local_2.hint["size"]), xatlib.xInt(_local_2.hint["MaxWidth"]), _local_2.hint["mc"]);
        }

        public function AddEasyHint(_arg_1:*, _arg_2:*, _arg_3:*=undefined)
        {
            if (!_arg_3)
            {
                _arg_3 = {};
            };
            _arg_3.Hint = _arg_2;
            _arg_3.mc = _arg_1;
            _arg_1.hint = _arg_3;
            _arg_1.addEventListener(MouseEvent.ROLL_OVER, this.EasyHint);
            _arg_1.addEventListener(MouseEvent.ROLL_OUT, this.HintOff);
            _arg_1.buttonMode = true;
        }

        public function Hint(_arg_1:Number, _arg_2:Number, _arg_3:String, _arg_4:Boolean=true, _arg_5:Number=0, _arg_6:Number=0, _arg_7:Number=0, _arg_8:*=undefined)
        {
            if (this.HintDisplayed == true)
            {
                if (_arg_4 == true)
                {
                    this.HintUpdate = 0;
                } else
                {
                    this.HintUpdate = 500;
                };
            } else
            {
                this.HintUpdate = 1000;
            };
            this.HintBoxx = _arg_1;
            this.HintBoxy = _arg_2;
            this.Hinttxt = _arg_3;
            this.Hintvis = _arg_4;
            this.HintPos = _arg_5;
            this.Hintsize = _arg_6;
            this.HintMaxWidth = _arg_7;
            this.HintMc = _arg_8;
        }

        public function HintOff(_arg_1:*=0)
        {
            this.Hint(0, 0, "", false);
        }

        public function DoHint(_arg_1:Number, _arg_2:Number, _arg_3:String, _arg_4:Boolean, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:*)
        {
            var _local_10:TextFormat;
            var _local_16:Point;
            var _local_9 = (_arg_7 > 0);
            if ((((_arg_7 < 2)) || ((_arg_7 == undefined))))
            {
                _arg_7 = 200;
            };
            if (this.HintHldMc != undefined)
            {
                this.HintHldMc.parent.removeChild(this.HintHldMc);
                this.HintHldMc = undefined;
            };
            _local_10 = new TextFormat();
            _local_10.align = "left";
            _local_10.color = todo.ButColW;
            _local_10.font = "_sans";
            _local_10.size = _arg_6;
            if ((((_local_10.size == undefined)) || ((_local_10.size <= 1))))
            {
                _local_10.size = 12;
            };
            var _local_11:* = new TextField();
            _local_11.text = _arg_3;
            if (_local_9)
            {
                _local_11.autoSize = "left";
                _local_11.multiline = true;
                _local_11.wordWrap = true;
            };
            _local_11.setTextFormat(_local_10);
            var _local_12:* = (_local_11.textWidth + 4);
            _local_11.width = _local_12;
            var _local_13:* = (_local_11.textHeight + 2);
            if (_local_9)
            {
                _local_13 = _local_11.height;
            };
            _local_11.height = _local_13;
            if (!_local_9)
            {
                _local_11.height = (_local_11.height + 2);
            };
            if (_arg_8 != undefined)
            {
                _local_16 = new Point();
                _local_16 = _arg_8.localToGlobal(_local_16);
                _arg_1 = (_arg_1 + _local_16.x);
                _arg_2 = (_arg_2 + _local_16.y);
            };
            this.HintHldMc = new MovieClip();
            this.HintHldMc.x = _arg_1;
            this.HintHldMc.y = ((_arg_2 - _local_13) - 6);
            if (_arg_5 == 1)
            {
                this.HintHldMc.y = _arg_2;
                this.HintHldMc.x = ((_arg_1 - _local_12) - 4);
            };
            if (_arg_5 == 2)
            {
                this.HintHldMc.y = _arg_2;
                this.HintHldMc.x = _arg_1;
            };
            if (_arg_5 == 3)
            {
                this.HintHldMc.x = ((_arg_1 - _local_12) - 4);
            };
            if (this.HintHldMc.x < 0)
            {
                this.HintHldMc.x = 0;
            };
            var _local_14:* = 0;
            var _local_15:* = 2;
            this.HintHldMc.graphics.beginFill(todo.ButCol, 90);
            this.HintHldMc.graphics.lineStyle(1, todo.ButColW, 100);
            this.HintHldMc.graphics.drawRect(_local_14, _local_15, _local_12, _local_13);
            this.HintHldMc.graphics.endFill();
            this.HintHldMc.addChild(_local_11);
            addChild(this.HintHldMc);
        }

        public function tick(_arg_1:Event)
        {
            if (this.HintUpdate >= 0)
            {
                if (this.HintUpdate > this.heartbeatduration)
                {
                    this.HintUpdate = (this.HintUpdate - this.heartbeatduration);
                } else
                {
                    this.HintUpdate = 0;
                };
                if (this.HintUpdate == 0)
                {
                    this.HintDisplayed = this.Hintvis;
                    if (todo.w_hints)
                    {
                        this.DoHint(this.HintBoxx, this.HintBoxy, this.Hinttxt, this.Hintvis, this.HintPos, this.Hintsize, this.HintMaxWidth, this.HintMc);
                        this.HintUpdate = -1;
                    };
                };
            };
        }


    }
}//package 

