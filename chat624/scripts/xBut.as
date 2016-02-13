// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//xBut

package 
{
    import flash.display.Sprite;
    import flash.text.TextFormat;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.system.System;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
    import flash.geom.*;
    import flash.system.*;

    public dynamic class xBut extends Sprite 
    {

        public static const b_LeftText:Number = 2;
        public static const b_Panel:Number = 8;
        public static const b_Border:Number = 16;
        public static const b_NoPress:Number = 32;
        public static const b_Grayed:Number = 64;
        public static const b_Gray:Number = 128;

        var mcFmt:TextFormat;
        var mcTxt:TextField;
        var but_back;
        var but_metal;
        private var but_holder;
        var sx:Number;
        var sy:Number;
        var sw:Number;
        var sh:Number;
        var TextColor;
        public var ButColor;
        var But;
        var PressFunc;
        var RollOver;
        var RollOut;
        public var ww:int;
        public var hh:int;

        public function xBut(_arg_1:*, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:String, _arg_7:*=undefined, _arg_8:Number=0, _arg_9:Number=8, _arg_10:*=undefined)
        {
            var _local_13:*;
            var _local_14:*;
            this.But = this;
            super();
            this.ww = _arg_4;
            this.hh = _arg_5;
            this.x = (this.sx = _arg_2);
            this.y = (this.sy = _arg_3);
            this.sw = int(_arg_4);
            this.sh = int(_arg_5);
            mouseChildren = (_arg_8 & xatlib.b_mouseChild);
            this.PressFunc = _arg_7;
            if (_arg_1 != undefined)
            {
                _arg_1.addChild(this);
            };
            this.TextColor = todo.ButColW;
            this.ButColor = (((_arg_10)!==undefined) ? _arg_10 : todo.ButCol);
            if ((_arg_8 & (b_Panel | b_Gray)))
            {
                this.TextColor = 0;
            };
            if ((_arg_8 & b_Panel))
            {
                _local_13 = 0;
                while (_local_13 < 2)
                {
                    if ((this.ButColor & 0x808080) == 0)
                    {
                        this.ButColor = (this.ButColor << 1);
                    };
                    _local_13++;
                };
            };
            if ((_arg_8 & b_Gray))
            {
                this.ButColor = 0xC8C8C8;
            };
            if ((_arg_8 & b_Grayed))
            {
                this.alpha = 0.4;
                this.TextColor = 0x808080;
            };
            this.mcFmt = new TextFormat();
            this.mcFmt.align = "center";
            if ((_arg_8 & b_LeftText))
            {
                this.mcFmt.align = "left";
            };
            this.mcFmt.bold = true;
            this.mcFmt.color = this.TextColor;
            this.mcFmt.font = "_sans";
            var _local_11:* = xatlib.Blend(this.sw, 70, 150, 8, 20);
            var _local_12:* = xatlib.Blend(this.sh, 15, 40, 10, 20);
            this.mcFmt.size = _local_11;
            if (_local_12 < _local_11)
            {
                this.mcFmt.size = _local_12;
            };
            if (_arg_8 > 0xFFFFFF)
            {
                this.mcFmt.size = (this.mcFmt.size + (_arg_8 >> 24));
            };
            if (!todo.bHeadless)
            {
                this.but_holder = new Sprite();
                addChild(this.but_holder);
                this.but_back = new Metal();
                this.but_back.width = this.sw;
                this.but_back.height = this.sh;
                this.but_holder.addChild(this.but_back);
                xatlib.McSetRGB(this.but_back, this.ButColor);
            };
            if (!todo.bHeadless)
            {
                if ((_arg_8 & b_Panel))
                {
                    this.but_metal = new panelmetal();
                } else
                {
                    this.but_metal = new buttonmetal();
                };
                this.but_metal.width = this.sw;
                this.but_metal.height = this.sh;
                this.but_holder.addChild(this.but_metal);
            };
            if (!todo.bHeadless)
            {
                _local_14 = xatlib.ButtonCurve2(_arg_9, (this.sw + 1), (this.sh + 1), _arg_8, 0, 0, 0);
                this.but_holder.addChild(_local_14);
                this.but_holder.mask = _local_14;
                this.but_holder.addChild(xatlib.ButtonCurve2(_arg_9, this.sw, this.sh, _arg_8, 1, 0, 0.2, 0, 0));
            };
            this.mcTxt = new TextField();
            this.mcTxt.x = 0;
            this.mcTxt.y = 0;
            this.mcTxt.width = this.sw;
            this.mcTxt.height = this.sh;
            this.mcTxt.autoSize = TextFieldAutoSize.NONE;
            this.mcTxt.defaultTextFormat = this.mcFmt;
            this.mcTxt.text = _arg_6;
            this.mcTxt.y = xatlib.Blend((this.sh - this.mcTxt.textHeight), 5, 25, 0, 10);
            this.mcTxt.selectable = true;
            addChild(this.mcTxt);
            if (!(_arg_8 & b_NoPress))
            {
                addEventListener(MouseEvent.ROLL_OVER, this.rollOverHandler, false, 0, true);
                addEventListener(MouseEvent.ROLL_OUT, this.rollOutHandler, false, 0, true);
                addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler, false, 0, true);
                buttonMode = true;
            } else
            {
                if (_arg_6.length > 0)
                {
                    addEventListener(MouseEvent.MOUSE_DOWN, this.TextToClip);
                };
            };
            addEventListener(Event.REMOVED_FROM_STAGE, this.cleanUp, false, 0, true);
        }

        private function cleanUp(_arg_1:Event)
        {
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler);
            removeEventListener(MouseEvent.ROLL_OVER, this.rollOverHandler);
            removeEventListener(MouseEvent.ROLL_OUT, this.rollOutHandler);
            removeEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler);
        }

        private function TextToClip(_arg_1:*)
        {
            System.setClipboard(this.mcTxt.text);
        }

        public function RefreshColor()
        {
            this.TextColor = todo.ButColW;
            this.ButColor = todo.ButCol;
            if (!todo.bHeadless)
            {
                xatlib.McSetRGB(this.but_back, this.ButColor);
            };
            this.mcFmt.color = this.TextColor;
            this.mcTxt.setTextFormat(this.mcFmt);
        }

        public function rollOverHandler(_arg_1:MouseEvent):void
        {
            if (this.RollOver)
            {
                if ((this.RollOver is String))
                {
                    main.hint.Hint(0, 0, this.RollOver, true, 0, undefined, 0, _arg_1.currentTarget);
                } else
                {
                    this.RollOver(_arg_1);
                };
            };
            this.mcFmt.color = ~(this.TextColor);
            if ((((todo.ButColW2 < 192)) || ((todo.ButColW2 > 576))))
            {
                this.mcFmt.color = 0x808080;
            };
            this.mcTxt.setTextFormat(this.mcFmt);
        }

        public function rollOutHandler(_arg_1:MouseEvent):void
        {
            if (this.RollOut)
            {
                this.RollOut();
            };
            if (((main) && (main.hint)))
            {
                main.hint.HintOff();
            };
            this.mcFmt.color = this.TextColor;
            this.mcTxt.setTextFormat(this.mcFmt);
        }

        public function mouseDownHandler(_arg_1:MouseEvent):void
        {
            stage.addEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler);
            if (this.PressFunc)
            {
                this.PressFunc(_arg_1);
            };
            this.x++;
            this.y++;
            this.mcFmt.color = this.TextColor;
            this.mcTxt.setTextFormat(this.mcFmt);
        }

        public function mouseUpHandler(_arg_1:*):void
        {
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler);
            this.x = this.sx;
            this.y = this.sy;
            this.mcFmt.color = this.TextColor;
            this.mcTxt.setTextFormat(this.mcFmt);
        }

        public function set TextCol(_arg_1:Number)
        {
        }

        public function SetTextCol(_arg_1:Number)
        {
            this.TextColor = _arg_1;
            this.mcFmt.color = _arg_1;
            this.mcTxt.setTextFormat(this.mcFmt);
        }

        public function set Col(_arg_1:Number)
        {
        }

        public function SetColor(_arg_1:Number)
        {
        }

        public function Text(_arg_1:String)
        {
        }

        public function SetText(_arg_1:String)
        {
            this.mcTxt.text = _arg_1;
            this.mcFmt.color = this.TextColor;
            this.mcTxt.setTextFormat(this.mcFmt);
        }

        public function SetRoll(_arg_1:*, _arg_2:*=undefined)
        {
            this.RollOver = _arg_1;
            this.RollOut = _arg_2;
        }

        public function SetHint(_arg_1:*)
        {
            main.hint.AddEasyHint(this, _arg_1, {"MaxWidth":xatlib.NX(300)});
        }


    }
}//package 

