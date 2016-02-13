// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//DialogProfile

package 
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.text.TextFieldType;
    import flash.events.Event;
    import flash.display.MovieClip;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
    import flash.net.*;

    public class DialogProfile extends Sprite 
    {

        public var mcprofilebackground;
        var tf3:TextField;
        var tf3b;
        var tf4:TextField;
        var tf4b;
        var tf5:TextField;
        var tf5b;
        var Dia;
        var changed = false;

        public function DialogProfile(e:*=0)
        {
            var YY:* = undefined;
            var i:* = undefined;
            var s:* = undefined;
            var vt:* = undefined;
            super();
            var AddCheck:Function = function (_arg_1:*, _arg_2:*, _arg_3:*)
            {
                xatlib.createTextNoWrap(Dia.txt1, (_arg_1 + xatlib.NX(22)), xatlib.NY(YY), xatlib.NX(280), xatlib.NY(32), _arg_2, 0x202020, 0, 100, 0, 20, "left", 1);
                var _local_4:* = xatlib.AttachMovie(Dia.txt1, "checkbox");
                _local_4.x = _arg_1;
                _local_4.y = xatlib.NY((YY + 8));
                _local_4.xitem.tick.visible = !(((todo.autologin & _arg_3) == 0));
                _local_4.Bit = _arg_3;
                _local_4.addEventListener(MouseEvent.MOUSE_DOWN, OnCheck);
            };
            this.changed = false;
            var Married:* = ((todo.w_registered) && (todo.w_d2));
            if (todo.w_userrev == undefined)
            {
                todo.w_userrev = 0;
                if (todo.lb == "t")
                {
                    todo.lb = "n";
                    todo.DoUpdate = true;
                    network.NetworkClose();
                };
                if (todo.lb == "n")
                {
                    main.logoutbutonPress();
                };
                return;
            };
            YY = (407 + 5);
            if (Married)
            {
                YY = (YY + 38);
            };
            var strUserNo:* = xatlib.xInt(todo.w_userno).toString();
            if (strUserNo.substr(-9, 9) == "000000000")
            {
                strUserNo = (strUserNo.substr(0, (strUserNo.length - 9)) + "B");
            };
            if (strUserNo.substr(-6, 6) == "000000")
            {
                strUserNo = (strUserNo.substr(0, (strUserNo.length - 6)) + "M");
            };
            this.mcprofilebackground = new xDialog(this, xatlib.NX(20), xatlib.NY(((480 - YY) / 2)), xatlib.NX(600), xatlib.NY(YY), (((todo.w_registered == undefined)) ? (" " + todo.w_userno) : ((((" " + todo.w_registered) + " (") + strUserNo) + ")")), undefined, 0, this.Delete);
            YY = ((480 - YY) / 2);
            YY = (YY + 4);
            this.Dia = this.mcprofilebackground.Dia;
            if (!todo.bMobile)
            {
                this.Dia.mcuser = new Array();
                i = 0;
                while (i < 4)
                {
                    this.Dia.mcuser[i] = new xBut(this.Dia, xatlib.NX((510 - (i * 85))), xatlib.NY(YY), xatlib.NX(80), xatlib.NY(22), (((todo.w_namelist[i])!=undefined) ? todo.w_namelist[i] : xconst.ST(59)), this.onUser);
                    this.Dia.mcuser[i].But.Num = i;
                    if (todo.w_namelist[i] == undefined) break;
                    i++;
                };
            };
            this.Dia.txt1 = this.Dia;
            YY = (YY + (((((385 - 200) - 24) - 37) + 6) - (130 - 37)));
            xatlib.createTextNoWrap(this.Dia.txt1, xatlib.NX((12 + 24)), xatlib.NY(YY), xatlib.NX(100), xatlib.NY(32), xconst.ST(60), 0x202020, 0, 100, 0, 24, "left", 1);
            this.tf3b = xatlib.AddBackground(this.Dia, xatlib.NX((120 + 24)), xatlib.NY(YY), xatlib.NX(460), xatlib.NY(32));
            this.tf3 = xatlib.AddTextField(this.Dia, xatlib.NX((120 + 24)), xatlib.NY(YY), xatlib.NX(460), xatlib.NY(32), "", main.fmt);
            this.tf3.type = TextFieldType.INPUT;
            YY = (YY + (429 - 385));
            this.Dia.txt1.YY = ((YY + 18) + 24);
            xatlib.createTextNoWrap(this.Dia.txt1, xatlib.NX((12 + 24)), xatlib.NY(YY), xatlib.NX(100), xatlib.NY(32), xconst.ST(61), 0x202020, 0, 100, 0, 24, "left", 1);
            this.tf4b = xatlib.AddBackground(this.Dia, xatlib.NX((120 + 24)), xatlib.NY(YY), xatlib.NX(460), xatlib.NY(32));
            this.tf4 = xatlib.AddTextField(this.Dia, xatlib.NX((120 + 24)), xatlib.NY(YY), xatlib.NX(460), xatlib.NY(32), "", main.fmt);
            this.tf4.type = TextFieldType.INPUT;
            YY = (YY + (42 + xatlib.NY(30)));
            if (!todo.config["noeffects"])
            {
                this.Dia.mcmore = new xBut(this.Dia, xatlib.NX(445), xatlib.NY((YY + 10)), xatlib.NX(160), xatlib.NY(30), xconst.ST(64), this.More_onRelease);
                this.Dia.mcmore.SetHint(xconst.ST(63));
                this.Dia.mceffect = new xBut(this.Dia, xatlib.NX(240), xatlib.NY((YY + 10)), xatlib.NX(160), xatlib.NY(30), xconst.ST(190), this.Effect_onRelease);
                this.Dia.mceffect.SetHint(xconst.ST(191));
            };
            YY = (YY + xatlib.NY(40));
            var XX:* = 40;
            var smc:* = new library("ho");
            smc.scaleX = (smc.scaleY = xatlib.SY(1));
            smc.x = xatlib.NX(XX);
            smc.y = (xatlib.NY(YY) + 15);
            this.Dia.addChild(smc);
            XX = (XX + 40);
            this.tf5b = xatlib.AddBackground(this.Dia, xatlib.NX(XX), (xatlib.NY(YY) + 15), xatlib.NX((605 - XX)), xatlib.NY(32));
            this.tf5 = xatlib.AddTextField(this.Dia, xatlib.NX(XX), (xatlib.NY(YY) + 15), xatlib.NX((605 - XX)), xatlib.NY(32), "", main.fmt);
            this.tf5.type = TextFieldType.INPUT;
            this.tf3.text = (todo.w_name = xatlib.CleanTextNoXat(todo.w_name));
            this.tf4.text = todo.w_avatar;
            this.tf5.text = todo.w_homepage;
            this.tf3.addEventListener(Event.CHANGE, xatlib.RemoveCR);
            this.tf4.addEventListener(Event.CHANGE, xatlib.RemoveCR);
            this.tf5.addEventListener(Event.CHANGE, xatlib.RemoveCR);
            YY = (YY + 58);
            if (Married)
            {
                s = xconst.ST(152);
                if ((todo.w_d0 & 1))
                {
                    s = xconst.ST(153);
                };
                s = (s + ": ");
                if (todo.w_bride)
                {
                    s = (s + (((todo.w_bride + " (") + todo.w_d2) + ")"));
                } else
                {
                    s = (s + todo.w_d2);
                };
                xatlib.createTextNoWrap(this.Dia.txt1, xatlib.NX((12 + 24)), xatlib.NY(YY), xatlib.NX(460), xatlib.NY(32), s, 0x202020, 0, 100, 0, 18, "left", 1);
                this.Dia.dv = new xBut(this.Dia, xatlib.NX(445), xatlib.NY(YY), xatlib.NX(160), xatlib.NY(30), xconst.ST(150), this.onDivorce, 0);
                this.Dia.dv.But.UserNo = 1;
                this.Dia.dv.But.Mode = 2;
                YY = (YY + 38);
            };
            if (!todo.bMobile)
            {
                this.Dia.mcpowers = new xBut(this.Dia, xatlib.NX(240), xatlib.NY(YY), xatlib.NX(160), xatlib.NY(30), xconst.ST(189), this.onPowers);
                xatlib.AttachBut(this.Dia.mcpowers, "pwr");
                this.Dia.mcgifts = new xBut(this.Dia, xatlib.NX(445), xatlib.NY(YY), xatlib.NX(160), xatlib.NY(30), "Gifts", this.onGifts);
                xatlib.AttachBut(this.Dia.mcgifts, "giftb");
                YY = (YY + 30);
            };
            (AddCheck(xatlib.NX(40), xconst.ST(65), 1));
            (AddCheck(xatlib.NX(320), xconst.ST(220), 2));
            YY = (YY + 30);
            YY = (YY + 5);
            if (!todo.bMobile)
            {
                if (todo.w_userno < (0x77359400 - (100000 * 2)))
                {
                    this.Dia.mcregister = new xBut(this.Dia, xatlib.NX(35), xatlib.NY(YY), xatlib.NX(160), xatlib.NY(30), xconst.ST(154), xatlib.Register_onRelease);
                    this.Dia.mcregister.SetRoll(xconst.ST(155));
                };
                this.Dia.mclang = new xBut(this.Dia, xatlib.NX(445), xatlib.NY(YY), xatlib.NX(160), xatlib.NY(30), "Language...", this.OK_onLang);
                if (global.xm != undefined)
                {
                    this.Dia.UseX = new xBut(this.Dia, xatlib.NX(240), xatlib.NY(YY), xatlib.NX(160), xatlib.NY(30), global.xm, this.UseX_onRelease);
                    this.Dia.UseX.But.Obj = this.Dia.UseX;
                } else
                {
                    this.Dia.CoinB = new xBut(this.Dia, xatlib.NX(240), xatlib.NY(YY), xatlib.NX(160), xatlib.NY(30), ("  " + xconst.ST(206)), xkiss.BuyRelease);
                    xatlib.AttachBut(this.Dia.CoinB, "coins");
                };
            };
            YY = (YY + 50);
            this.Dia.coins = xatlib.AttachMovie(this.Dia, "coins", {
                "x":xatlib.NX(440),
                "y":xatlib.NY((YY + 4)),
                "scaleX":xatlib.SX(),
                "scaleY":xatlib.SY()
            });
            xatlib.createTextNoWrap(this.Dia.coins, 30, -10, 130, 50, (((isNaN(todo.w_coins)) ? 0 : todo.w_coins) + " xats"), 0x202020, 0, 100, 0, 26, "center", 1);
            this.Dia.coins.addEventListener(MouseEvent.MOUSE_DOWN, xkiss.CreateBuystuff);
            if (network.YC)
            {
                vt = (xatlib.xInt(todo.w_d1) - network.YC);
                if (vt < 0)
                {
                    vt = 0;
                };
                vt = xatlib.xInt(((vt / (24 * 3600)) + 0.3));
                xatlib.createTextNoWrap(this.Dia.txt1, xatlib.NX((12 + 24)), xatlib.NY(YY), xatlib.NX(160), xatlib.NY(33), ((xconst.ST(203) + "\n") + xconst.ST(204, vt)), 0x202020, 0, 100, 0, 24, "left", 1);
            };
            this.Dia.mcok = new xBut(this.Dia, xatlib.NX(240), xatlib.NY(YY), xatlib.NX(160), xatlib.NY(30), xconst.ST(45), this.OK_onRelease);
            this.ChangeProfileAvs();
        }

        public function Delete()
        {
            main.hint.HintOff();
            if (this.mcprofilebackground)
            {
                this.mcprofilebackground.Delete();
            };
            main.closeDialog();
        }

        function OnCheck(_arg_1:MouseEvent)
        {
            _arg_1.currentTarget.xitem.tick.visible = !(_arg_1.currentTarget.xitem.tick.visible);
            if (_arg_1.currentTarget.xitem.tick.visible)
            {
                todo.autologin = (todo.autologin | _arg_1.currentTarget.Bit);
            } else
            {
                todo.autologin = (todo.autologin & ~(_arg_1.currentTarget.Bit));
            };
            xatlib.MainSolWrite("w_autologin", todo.autologin);
        }

        function onUser(_arg_1:MouseEvent)
        {
            var _local_2:* = _arg_1.currentTarget;
            var _local_3:* = (((todo.w_userrevlist[_local_2.Num])!=undefined) ? todo.w_userrevlist[_local_2.Num] : 0);
            var _local_4:* = (((todo.w_namelist[_local_2.Num])!=undefined) ? todo.w_namelist[_local_2.Num] : " ");
            var _local_5:* = (((todo.w_avatarlist[_local_2.Num])!=undefined) ? todo.w_avatarlist[_local_2.Num] : "");
            var _local_6:* = (((todo.w_homepagelist[_local_2.Num])!=undefined) ? todo.w_homepagelist[_local_2.Num] : "");
            todo.w_userrevlist[_local_2.Num] = todo.w_userrev;
            todo.w_namelist[_local_2.Num] = xatlib.CleanTextNoXat(todo.w_name);
            todo.w_avatarlist[_local_2.Num] = todo.w_avatar;
            todo.w_homepagelist[_local_2.Num] = todo.w_homepage;
            todo.w_name = xatlib.CleanTextNoXat(_local_4);
            todo.w_avatar = _local_5;
            todo.w_homepage = _local_6;
            xatlib.MainSolWrite("w_userrevlist", todo.w_userrevlist);
            xatlib.MainSolWrite("w_namelist", todo.w_namelist);
            xatlib.MainSolWrite("w_avatarlist", todo.w_avatarlist);
            xatlib.MainSolWrite("w_homepagelist", todo.w_homepagelist);
            this.Delete();
            xatlib.ReLogin();
        }

        function UseX_onRelease(_arg_1:MouseEvent)
        {
            var _local_2:* = _arg_1.currentTarget;
            if (_local_2.Done)
            {
                this.Delete();
                return;
            };
            if (global.xn != undefined)
            {
                this.tf3.text = xatlib.CleanText(global.xn);
            };
            if (global.xh != undefined)
            {
                this.tf5.text = xatlib.CleanText(global.xh);
            };
            if (global.xp != undefined)
            {
                this.tf4.text = xatlib.CleanText(global.xp);
                this.ChangeProfileAvs();
            };
            _local_2.Obj.SetText(xconst.ST(66));
            _local_2.Done = true;
        }

        function DeleteProfileAvs()
        {
            var _local_1:MovieClip = this.mcprofilebackground.Dia;
            if (_local_1.avc == undefined)
            {
                return;
            };
            _local_1.removeChild(_local_1.avc);
            var _local_2:* = 0;
            while (_local_2 < _local_1.acnt)
            {
                _local_1.removeChild(_local_1.xmc[_local_2]);
                _local_2++;
            };
        }

        function ChangeProfileAvs()
        {
            var r:* = undefined;
            var mc2:MovieClip;
            this.Dia = this.mcprofilebackground.Dia;
            var YY:* = xatlib.NY(this.Dia.txt1.YY);
            this.DeleteProfileAvs();
            var Press:* = function ()
            {
                chat.mainDlg.GotoProfile(todo.w_userno);
            };
            this.Dia.avc = new xAvatar(this.Dia, this.tf4.text, undefined, Press, xatlib.FindUser(todo.w_userno));
            var mc:MovieClip = this.Dia.avc.Av;
            mc.x = xatlib.NX((144 - 77));
            mc.y = YY;
            this.Dia.acnt = int((xatlib.NX(470) / 33));
            this.Dia.xmc = new Array();
            var e:* = 0;
            while (e < this.Dia.acnt)
            {
                r = xatlib.RandAv();
                this.Dia.xmc[e] = new xAvatar(this.Dia, r);
                mc2 = this.Dia.xmc[e].Av;
                mc2.x = (xatlib.NX(144) + (33 * e));
                mc2.y = YY;
                mc2.txt = r;
                mc2.addEventListener(MouseEvent.MOUSE_DOWN, this.AvPress);
                e++;
            };
        }

        function AvPress(_arg_1:MouseEvent)
        {
            var _local_2:* = _arg_1.currentTarget;
            var _local_3:* = this.mcprofilebackground.Dia;
            this.tf4.text = _local_2.txt;
            this.ChangeProfileAvs();
        }

        function OK_onRelease(_arg_1:MouseEvent=undefined)
        {
            var _local_2:*;
            if ((((todo.messageecho == "p")) && (!((todo.w_avatar == xatlib.CleanAv(this.tf4.text))))))
            {
                chat.sending_lc.send(chat.fromxat, "onMsg", 4, 0, "p");
            };
            if (((((((!((todo.w_name == this.tf3.text))) || (!((todo.w_avatar == xatlib.CleanAv(this.tf4.text)))))) || (!((todo.w_homepage == this.tf5.text))))) || (this.changed)))
            {
                todo.w_name = xatlib.NameNoXat(xatlib.CleanText(this.tf3.text), 1);
                todo.w_avatar = xatlib.CleanAv(this.tf4.text);
                this.tf4.text = xatlib.UrlAv(todo.w_avatar);
                todo.w_homepage = this.tf5.text;
                todo.w_userrev++;
                xatlib.PurgeMessageFromUser(todo.w_userno);
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
            xatlib.MainSolWrite("w_name", todo.w_name);
            xatlib.MainSolWrite("w_avatar", todo.w_avatar);
            xatlib.MainSolWrite("w_homepage", todo.w_homepage);
            xatlib.MainSolWrite("w_userrev", todo.w_userrev);
            todo.DoUpdate = true;
            this.Delete();
        }

        function More_onRelease(_arg_1:MouseEvent=undefined)
        {
            var _local_2:String;
            _local_2 = ((todo.chatdomain + "avatar.php?id=") + todo.w_userno);
            xatlib.UrlPopup(xconst.ST(63), _local_2);
        }

        function Effect_onRelease(_arg_1:MouseEvent)
        {
            var _local_2:*;
            if ((global.xc & 0x0800))
            {
                main.mcLoad.OpenByN(20032);
            } else
            {
                _local_2 = xatlib.xatlinks(xatlib.PageUrl(20032));
                xatlib.UrlPopup(xconst.ST(8), _local_2, xconst.ST(17));
            };
        }

        function OK_onLang(_arg_1:MouseEvent=undefined)
        {
            var _local_2:String = ((todo.chatdomain + "changelanguage.php?id=") + todo.w_useroom);
            xatlib.UrlPopup(xconst.ST(8), _local_2);
        }

        function onPowers(_arg_1:MouseEvent=undefined)
        {
            this.changed = true;
            var _local_2:* = new Object();
            _local_2.muserid = todo.w_userno;
            _local_2.strid = (((todo.w_registered == undefined)) ? (" " + todo.w_userno) : ((((" " + todo.w_registered) + " (") + todo.w_userno) + ")"));
            main.openDialog(7, _local_2);
        }

        function onGifts(_arg_1:MouseEvent=undefined)
        {
            xmessage.OpenGifts(todo.w_userno);
        }

        function Login_onRelease()
        {
            this.Delete();
        }

        function Register_Link(_arg_1:*)
        {
            var _local_2:*;
            _local_2 = (todo.usedomain + "/web_gear/chat/register.php");
            if (_arg_1 != undefined)
            {
                _local_2 = (_local_2 + ((((("?UserId=" + todo.w_userno) + "&k2=") + todo.w_k2) + "&mode=") + _arg_1));
            };
            return (_local_2);
        }

        function onDivorce(_arg_1:*)
        {
            xkiss.CreateBuystuff(todo.w_d2, 2);
        }


    }
}//package 

