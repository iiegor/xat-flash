// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//DialogReason

package 
{
    import flash.display.Sprite;
    import flash.text.TextFieldType;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
    import flash.net.*;

    public class DialogReason extends Sprite 
    {

        const TO = 5;

        public var mcreasonbackground;
        var tf;
        var tf2;
        var UserNo;
        var bBan;
        var bDunce;
        var bNaughty;
        var bYellow;

        public function DialogReason(_arg_1:*)
        {
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_12:*;
            var _local_13:Number;
            this.tf2 = {"text":""};
            super();
            this.UserNo = _arg_1.UserNo;
            this.bBan = _arg_1.bBan;
            this.bDunce = _arg_1.bDunce;
            this.bNaughty = _arg_1.bNaughty;
            var _local_2:* = new Array();
            var _local_3:int = xatlib.FindUser(todo.w_userno);
            _local_7 = xatlib.FindUser(this.UserNo);
            if (((((this.bBan) || (this.bDunce))) || (this.bNaughty)))
            {
                if (this.bBan)
                {
                    if (todo.HasPower(_local_3, 41))
                    {
                        _local_2.push(xconst.ST(197), this.ReasonGag);
                    };
                    if (((todo.HasPower(_local_3, 46)) && (todo.w_owner)))
                    {
                        _local_2.push(xconst.ST(198), this.ReasonMute);
                    };
                };
                if (this.bBan)
                {
                    for (_local_4 in xconst.Puzzle)
                    {
                        if (todo.HasPower(_local_3, _local_4))
                        {
                            _local_2.push(((xconst.Puzzle[_local_4] + "Ban;=") + _local_4), this.ReasonOK);
                        };
                    };
                };
                if (todo.HasPower(_local_3, 339))
                {
                    if ((todo.Users[_local_7].flag0 & 0x200000))
                    {
                        _local_2.push(xconst.ST(279), this.ReasonRed);
                    } else
                    {
                        _local_2.push(xconst.ST(278), this.ReasonRed);
                    };
                };
            } else
            {
                if (todo.HasPower(_local_3, 25))
                {
                    _local_2.push("Boot", this.ReasonBoot);
                };
                if (todo.HasPower(_local_3, 121))
                {
                    _local_2.push("Zap", this.ReasonZap);
                };
                if (todo.HasPower(_local_3, 158))
                {
                    if ((todo.Users[_local_7].flag0 & 0x8000))
                    {
                        _local_2.push(xconst.ST(246), this.ReasonDunce);
                    } else
                    {
                        _local_2.push(xconst.ST(245), this.ReasonDunce);
                    };
                };
                if (todo.HasPower(_local_3, 284))
                {
                    _local_7 = xatlib.FindUser(this.UserNo);
                    if ((todo.Users[_local_7].flag0 & 524288))
                    {
                        _local_2.push(xconst.ST(267), this.ReasonNaughty);
                    } else
                    {
                        _local_2.push(xconst.ST(266), this.ReasonNaughty);
                    };
                };
                if (todo.HasPower(_local_3, 292))
                {
                    if ((todo.Users[_local_7].flag0 & 0x100000))
                    {
                        _local_2.push(xconst.ST(271), this.ReasonYellow);
                    } else
                    {
                        _local_2.push(xconst.ST(270), this.ReasonYellow);
                    };
                };
            };
            if (this.bBan)
            {
                _local_2.push(xconst.ST(81), this.ReasonKickBan);
            } else
            {
                if (!this.bDunce)
                {
                    _local_2.push(xconst.ST(79), this.ReasonKickBan);
                };
            };
            _local_2.push(xconst.ST(66), this.CloseReason);
            var _local_8:* = (((main.upx - 270) - 15) - 50);
            if (_local_8 < 5)
            {
                _local_8 = 5;
            };
            var _local_9:* = xatlib.NY(30);
            this.mcreasonbackground = new xDialog(this, _local_8, _local_9, (270 + 60), (160 + (40 * ((_local_2.length + 2) >> 2))), (" " + ((((this.bBan) || (this.bDunce))) ? xconst.ST(81) : xconst.ST(79))), undefined, 0);
            var _local_10:* = this.mcreasonbackground.Dia;
            _local_10.txt1 = xatlib.createTextNoWrap(_local_10, (_local_8 + 10), (_local_9 + 30), 310, 22, ((((this.bBan) || (this.bDunce))) ? xconst.ST(113) : xconst.ST(114)), 0, 0, 100, 0, 14, "left", 1);
            var _local_11:* = xatlib.AddBackground(_local_10, (_local_8 + 10), (_local_9 + 55), 310, 32);
            this.tf = xatlib.AddTextField(_local_11, 0, this.TO, 310, 32, "", main.fmt);
            this.tf.type = TextFieldType.INPUT;
            this.tf.addEventListener(Event.CHANGE, xatlib.RemoveCR);
            if (((this.bBan) || (this.bDunce)))
            {
                _local_10.txt2 = xatlib.createTextNoWrap(_local_10, (_local_8 + 10), (_local_9 + 95), 310, 22, xconst.ST(115), 0, 0, 100, 0, 14, "left", 1);
                _local_12 = xatlib.AddBackground(_local_10, (_local_8 + 10), (_local_9 + 120), 155, 32);
                this.tf2 = xatlib.AddTextField(_local_12, 0, this.TO, 310, 32, "1", main.fmt);
                this.tf2.type = TextFieldType.INPUT;
                _local_10.txt3 = xatlib.createTextNoWrap(_local_10, (_local_8 + 165), (_local_9 + 120), 155, 32, ((xconst.ST(116) + "  ") + ((todo.w_owner) ? xconst.ST(117) : xconst.ST(118))), 0, 0, 100, 0, 14, "left", 1);
            } else
            {
                _local_13 = xatlib.FindUser(todo.w_userno);
                if (todo.HasPower(_local_13, 25))
                {
                    _local_10.txt2 = xatlib.createTextNoWrap(_local_10, (_local_8 + 10), (_local_9 + 95), 310, 22, xconst.ST(248), 0, 0, 100, 0, 14, "left", 1);
                    _local_12 = xatlib.AddBackground(_local_10, (_local_8 + 10), (_local_9 + 120), 310, 32);
                    this.tf2 = xatlib.AddTextField(_local_12, 0, this.TO, 310, 32, "", main.fmt);
                    this.tf2.type = TextFieldType.INPUT;
                };
            };
            _local_4 = 0;
            while (_local_4 < _local_2.length)
            {
                _local_6 = _local_2[_local_4].split(";=");
                _local_5 = ("b" + _local_4);
                _local_10[_local_5] = new xBut(_local_10, (_local_8 + (((_local_4 & 2)) ? 170 : 10)), (_local_9 + 160), 150, 30, _local_6[0], _local_2[(_local_4 + 1)]);
                _local_10[_local_5].But.UserNo = this.UserNo;
                if (_local_6[1])
                {
                    _local_10[_local_5].But.Power = xatlib.xInt(_local_6[1]);
                };
                if ((_local_4 & 2))
                {
                    _local_9 = (_local_9 + 40);
                };
                _local_4 = (_local_4 + 2);
            };
        }

        function Delete()
        {
            main.closeDialog();
        }

        function ReasonBoot(_arg_1:MouseEvent=undefined)
        {
            if (this.tf.text.indexOf("#") != -1)
            {
                this.tf.text = this.tf.text.substr(0, this.tf.text.indexOf("#"));
            };
            if (this.tf2.text == "")
            {
                return;
            };
            this.ReasonOK(_arg_1);
        }

        function ReasonZap(_arg_1:MouseEvent=undefined)
        {
            if (this.tf.text.indexOf("#") == -1)
            {
                this.tf.text = (this.tf.text + "#raspberry");
            };
            this.ReasonOK(_arg_1);
        }

        function ReasonKickBan(_arg_1:MouseEvent=undefined)
        {
            if (((!(this.bBan)) && (!(this.bDunce))))
            {
                this.tf2.text = "";
            };
            this.ReasonOK(_arg_1);
        }

        function ReasonOK(_arg_1:MouseEvent=undefined)
        {
            var _local_2:*;
            if (((this.bBan) || (this.bDunce)))
            {
                this.DoBan("g", _arg_1.currentTarget.Power);
            } else
            {
                if (this.tf.text.length > 0)
                {
                    if (this.tf2.text.length > 0)
                    {
                        this.tf.text = (this.tf.text + ("#" + this.tf2.text));
                    } else
                    {
                        if (this.tf.text.indexOf("#") != -1)
                        {
                            _local_2 = this.tf.text.split("#");
                            this.tf.text = (((_local_2[0] + " #") + _local_2[1]) + "#bump");
                        };
                    };
                    network.NetworkKickUser(this.UserNo, this.tf.text);
                } else
                {
                    todo.helpstr = xconst.ST(124);
                    todo.HelpUpdate = 0;
                };
            };
            this.CloseReason();
        }

        function ReasonGag(_arg_1:MouseEvent=undefined)
        {
            this.DoBan("gg");
            this.CloseReason();
        }

        function ReasonMute(_arg_1:MouseEvent=undefined)
        {
            this.DoBan("gm");
            this.CloseReason();
        }

        function ReasonDunce(_arg_1:MouseEvent=undefined)
        {
            this.DoBan("gd");
            this.CloseReason();
        }

        function ReasonNaughty(_arg_1:MouseEvent=undefined)
        {
            this.DoBan("gn");
            this.CloseReason();
        }

        function ReasonYellow(_arg_1:MouseEvent=undefined)
        {
            this.DoBan("gy");
            this.CloseReason();
        }

        function ReasonRed(_arg_1:MouseEvent=undefined)
        {
            this.DoBan("gr");
            this.CloseReason();
        }

        function DoBan(_arg_1:*, _arg_2:*=undefined)
        {
            var _local_3:Number = 1;
            if (!isNaN(this.tf2.text))
            {
                _local_3 = Math.abs(Number(this.tf2.text));
            };
            if (_local_3 > 8760)
            {
                _local_3 = 0;
            };
            network.NetworkGagUser(_arg_1, this.UserNo, true, xatlib.xInt((_local_3 * 3600)), this.tf.text, _arg_2);
        }

        function CloseReason(_arg_1:MouseEvent=undefined)
        {
            this.Delete();
        }


    }
}//package 

