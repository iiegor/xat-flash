// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//DialogPowers

package 
{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
    import flash.net.*;

    public class DialogPowers extends Sprite 
    {

        var mcpowersbackground;
        var mcpowersbackb;
        var mcpowersback;
        var mcpowersbackmask;
        var bpowersscrollmc;
        var powersinc;
        var powersincc;
        var userid;
        var boutin;
        var sM;
        var bph;

        public function DialogPowers(_arg_1:*)
        {
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_12:*;
            var _local_13:*;
            var _local_14:*;
            var _local_15:*;
            super();
            if (todo.w_Mask == undefined)
            {
                todo.w_Mask = todo.NO_POWERS.slice();
            };
            this.sM = todo.w_Mask.slice();
            this.powersinc = 0;
            this.powersincc = 0;
            this.userid = _arg_1.muserid;
            this.boutin = false;
            this.mcpowersbackground = new xDialog(this, xatlib.NX(120), xatlib.NY(30), xatlib.NX(400), xatlib.NY(380), ((" " + _arg_1.strid) + " Powers"), undefined, 0, this.Delete);
            var _local_2:* = this.mcpowersbackground.Dia;
            _local_2.mcclose = new xBut(_local_2, xatlib.NX(240), xatlib.NY(370), xatlib.NX(160), xatlib.NY(30), xconst.ST(45), this.PowersClose);
            _local_2.mcgetpowers = new xBut(_local_2, xatlib.NX(345), xatlib.NY(320), xatlib.NX(160), xatlib.NY(30), "Get Powers", this.GetPowers);
            xatlib.AttachBut(_local_2.mcgetpowers, "pwr");
            var _local_3:* = xatlib.NX(380);
            this.bph = (xatlib.NY(240) - 40);
            var _local_4:* = xatlib.NX(130);
            var _local_5:* = (xatlib.NY(30) + 40);
            this.mcpowersbackb = xatlib.AddBackground(_local_2, _local_4, _local_5, _local_3, this.bph);
            this.mcpowersback = new MovieClip();
            this.mcpowersbackb.addChild(this.mcpowersback);
            this.mcpowersback.Width = _local_3;
            this.mcpowersbackmask = xatlib.AddBackground(_local_2, (_local_4 + 1), (_local_5 + 1), ((_local_3 - 2) - xatlib.NX(16)), (this.bph - 2), 0);
            this.mcpowersback.mask = this.mcpowersbackmask;
            this.bpowersscrollmc = new xScroll(_local_2, ((_local_4 + _local_3) - xatlib.NX(16)), _local_5, xatlib.NX(16), this.bph, xatlib.NX(16), xatlib.NX(32), 30, (10 * 100), (0 * 100), this.onPowersScrollChange);
            if (todo.w_userno == this.userid)
            {
                _local_6 = true;
                _local_7 = todo.w_Powers;
                _local_8 = this.PowDecode(todo.w_PowerO);
                _local_9 = (((todo.w_Mask[0])!=undefined) ? todo.w_Mask : undefined);
            } else
            {
                _local_7 = todo.Users[xatlib.FindUser(this.userid)].UnmaskedPowers;
                _local_8 = this.PowDecode(todo.Users[xatlib.FindUser(this.userid)].PowerO);
                _local_9 = todo.Users[xatlib.FindUser(this.userid)].Powers;
            };
            if (_local_7)
            {
                if ((_local_7[2] & (1 << 31)))
                {
                    this.AddPower(95, ((~(_local_9[2]) >> 31) & 1), _local_6, _local_8[95]);
                };
                _local_13 = 0;
                while (_local_13 < _local_7.length)
                {
                    _local_14 = 0;
                    while (_local_14 < 32)
                    {
                        if ((((((((((_local_14 == 0)) && ((_local_13 == 0)))) && (_local_6))) && (todo.w_ALLP))) || (((((!((((_local_14 == 0)) && ((_local_13 == 0))))) && (((_local_7[_local_13] >> _local_14) & 1)))) && ((_local_14 < (xconst.pssa.length - 1)))))))
                        {
                            _local_12 = ((_local_13 * 32) + _local_14);
                            if (_local_12 != 95)
                            {
                                this.AddPower(_local_12, ((~(_local_9[_local_13]) >> _local_14) & 1), _local_6, _local_8[_local_12]);
                            };
                        };
                        _local_14++;
                    };
                    _local_13++;
                };
            };
            var _local_10:* = xatlib.FindUser(this.userid);
            if (((!((todo.Users[_local_10].coins == undefined))) && (!((todo.Users[_local_10].days == undefined)))))
            {
                _local_2.days = xatlib.AttachMovie(_local_2, "star", {
                    "x":xatlib.NX(140),
                    "y":xatlib.NY(280),
                    "scaleX":xatlib.SX(),
                    "scaleY":xatlib.SY()
                });
                xatlib.createTextNoWrap(_local_2.days, 30, -10, 130, 50, xconst.ST(204, todo.Users[_local_10].days), 0x202020, 0, 100, 0, 26, "center", 1);
                _local_2.coins = xatlib.AttachMovie(_local_2, "coins", {
                    "x":xatlib.NX(340),
                    "y":xatlib.NY(280),
                    "scaleX":xatlib.SX(),
                    "scaleY":xatlib.SY()
                });
                xatlib.createTextNoWrap(_local_2.coins, 30, -10, 130, 50, (todo.Users[xatlib.FindUser(this.userid)].coins + " xats"), 0x202020, 0, 100, 0, 26, "center", 1);
            };
            var _local_11:* = undefined;
            if (todo.w_userno == this.userid)
            {
                if (network.YC)
                {
                    _local_15 = (xatlib.xInt(todo.w_d1) - network.YC);
                    if (_local_15 < 0)
                    {
                        _local_15 = 0;
                    };
                    _local_15 = xatlib.xInt(((_local_15 / (24 * 3600)) + 0.3));
                    if (_local_15 == 0)
                    {
                        _local_11 = "If you had powers they will return when you have days";
                    };
                };
            };
            if (todo.Users[_local_10].debug != undefined)
            {
                _local_11 = todo.Users[_local_10].debug;
            };
            if (_local_11 != undefined)
            {
                _local_2.txt1 = new MovieClip();
                _local_2.addChild(_local_2.txt1);
                xatlib.createTextNoWrap(_local_2.txt1, xatlib.NX(120), xatlib.NY(336), xatlib.NX(400), 50, _local_11, 0x202020, 0, 100, 0, 26, "center", 1);
            };
        }

        static function PowOnOff(_arg_1:*, _arg_2:*)
        {
            if (todo.w_Mask[0] == undefined)
            {
                todo.w_Mask = todo.NO_POWERS.slice();
            };
            var _local_3:* = xatlib.xInt((_arg_1 / 32));
            var _local_4:* = (1 << (_arg_1 % 32));
            if (_arg_2)
            {
                todo.w_Mask[_local_3] = (todo.w_Mask[_local_3] & ~(_local_4));
            } else
            {
                todo.w_Mask[_local_3] = (todo.w_Mask[_local_3] | _local_4);
            };
            if (todo.w_Mask[_local_3] < 0)
            {
                todo.w_Mask[_local_3] = (todo.w_Mask[_local_3] + 4294967296);
            };
            xatlib.MainSolWrite("w_Mask", todo.w_Mask);
        }


        function Delete()
        {
            main.hint.HintOff();
            if (!this.mcpowersbackground)
            {
                return;
            };
            this.mcpowersbackground.Delete();
            this.mcpowersbackb.removeChild(this.mcpowersback);
            this.mcpowersback = null;
            this.mcpowersbackground = null;
            main.closeDialog();
        }

        function AddPower(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*)
        {
            var _local_5:*;
            if (_arg_3)
            {
                _local_5 = xatlib.AttachMovie(this.mcpowersback, "checkbox");
                this.mcpowersback.addChild(_local_5);
                _local_5.x = (10 - 9);
                _local_5.y = (this.powersinc + 8);
                _local_5.addEventListener(MouseEvent.MOUSE_DOWN, this.OnPowerCheck);
                _local_5.Bit = _arg_1;
                _local_5.xitem.tick.visible = _arg_2;
            };
            var _local_6:* = new MovieClip();
            this.mcpowersback.addChild(_local_6);
            _local_6.x = 5;
            xmessage.SmB = true;
            var _local_7:* = "";
            if (((((!((_arg_1 == 0))) && (!((_arg_4 == undefined))))) && (!((_arg_4 == 0)))))
            {
                _local_7 = ((" [" + _arg_4) + "]");
            };
            var _local_8:* = xatlib.LoadMovie(_local_6, (((todo.imagedomain + "smw/") + xconst.pssa[(_arg_1 + 1)].toString()) + ".png"));
            _local_8.x = (((15 + 3) - 15) + 2);
            _local_8.y = this.powersinc;
            var _local_9:* = (8 + xmessage.AddMessageToMc(_local_6, 1, (("   <b> " + xconst.pssa[(_arg_1 + 1)]) + _local_7), 30, (this.mcpowersback.Width - 30), this.powersinc, this.userid));
            xmessage.SmB = undefined;
            if ((this.powersincc % 2) == 1)
            {
                _local_6.x = (_local_6.x + (xatlib.NX(360) / 2));
                if (_local_5)
                {
                    _local_5.x = (_local_5.x + (xatlib.NX(360) / 2));
                };
                this.powersinc = (this.powersinc + _local_9);
            };
            this.powersincc++;
        }

        function onPowersScrollChange()
        {
            var _local_1:* = (((this.powersinc - this.bph) + 4) + ((((this.powersincc % 2) == 1)) ? 30 : 0));
            if (_local_1 < 0)
            {
                _local_1 = 0;
            };
            this.bpowersscrollmc.Scr_size = _local_1;
            var _local_2:* = this.bpowersscrollmc.Scr_position;
            this.mcpowersback.y = -(_local_2);
        }

        function OnPowerCheck(_arg_1:MouseEvent)
        {
            var _local_2:* = _arg_1.currentTarget;
            this.boutin = true;
            _local_2.xitem.tick.visible = !(_local_2.xitem.tick.visible);
            PowOnOff(_local_2.Bit, _local_2.xitem.tick.visible);
        }

        function PowersClose(_arg_1:MouseEvent=undefined)
        {
            var _local_2:*;
            if (this.boutin)
            {
                _local_2 = xatlib.FindUser(todo.w_userno);
                if (_local_2 != -1)
                {
                    todo.Users[_local_2].n = todo.w_name;
                    todo.Users[_local_2].a = todo.w_avatar;
                    todo.Users[_local_2].h = todo.w_homepage;
                    todo.Users[_local_2].s = (((todo.Macros)!=undefined) ? todo.Macros["status"] : undefined);
                };
                network.UpdateFriendList(todo.w_userno, 1);
                todo.w_friendlist2[todo.w_userno] = undefined;
                xatlib.ReLogin();
            };
            this.Delete();
            if (this.sM[0] != todo.w_Mask[0])
            {
                todo.w_friendlist2[todo.w_userno] = undefined;
            };
        }

        function GetPowers(_arg_1:MouseEvent=undefined)
        {
            this.PowersClose();
            var _local_2:* = (todo.usedomain + "/getpowers");
            xatlib.UrlPopup(xconst.ST(8), _local_2);
        }

        function PowDecode(_arg_1:*)
        {
            var _local_5:*;
            var _local_6:*;
            var _local_2:* = new Array();
            if ((((_arg_1 == undefined)) || ((_arg_1.length == 0))))
            {
                return (_local_2);
            };
            var _local_3:* = _arg_1.split("|");
            var _local_4:* = 0;
            while (_local_4 < _local_3.length)
            {
                _local_5 = _local_3[_local_4].split("=");
                _local_6 = xatlib.xInt(_local_5[1]);
                if (_local_6 == 0)
                {
                    _local_6 = 1;
                };
                _local_2[_local_5[0]] = (_local_6 + 1);
                _local_4++;
            };
            return (_local_2);
        }


    }
}//package 

