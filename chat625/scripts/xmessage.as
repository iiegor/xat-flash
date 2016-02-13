// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//xmessage

package 
{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.ui.Keyboard;
    import flash.events.MouseEvent;
    import flash.text.TextFormat;
    import flash.filters.GlowFilter;
    import flash.text.TextField;
    import flash.utils.getDefinitionByName;
    import flash.xml.XMLDocument;
    import flash.events.Event;
    import flash.utils.getTimer;
    import flash.xml.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.ui.*;

    public class xmessage extends Sprite 
    {

        static var mspos = undefined;
        static var SkipSmilies;
        static var yc2;
        public static var xPos;
        public static var ImInit;
        public static var SmB;
        static var Ronce;
        static var useryc:Number = 0;
        static var DeleteNumber:Number;
        public static var useryc2 = 0;
        public static var useryc3 = 0;
        public static var poin = new Array();
        public static var McCnt = 0;
        public static var McTot = 0;
        public static var p;
        public static var NoOfM:int;
        private static var LastUserTab:int;
        public static var Social = {"tc":0};
        private static var keywords = {
            "xavi":"xavi",
            "wiki":"wiki",
            "twitter":"twitter",
            "search":"search",
            "power":"power",
            "powers":"power",
            "doodle":1,
            "trade":2,
            "smilie":3,
            "smilies":3,
            "smiley":3,
            "register":5,
            "login":6,
            "buy":7,
            "coin":7,
            "coins":7,
            "xats":7,
            "subscriber":7,
            "gift":8
        };
        private static var FirstC;


        public static function AddGames()
        {
            var _local_1:*;
            for (_local_1 in xconst.Game)
            {
                keywords[xconst.Game[_local_1]] = (60001 + _local_1);
            };
        }

        public static function UpdateMessages(All:Boolean, Scrolling:Boolean)
        {
            var Avatar:* = undefined;
            var UserName:String;
            var DeleteOk:Number;
            var MessageLength:* = undefined;
            var TabIsPrivate:* = undefined;
            var TabUser:* = undefined;
            var HasNick:Boolean;
            var MaxInView:* = undefined;
            var t:* = undefined;
            var Bot:* = undefined;
            var BotMargF:* = undefined;
            var Bot2:* = undefined;
            var v:* = undefined;
            var Cnt:* = undefined;
            var HitTop:* = undefined;
            var n:* = undefined;
            var M:* = undefined;
            var V:* = undefined;
            var v2:* = undefined;
            var userid:* = undefined;
            var yinc:* = undefined;
            var s:* = undefined;
            var yc3:* = undefined;
            try
            {
                if (Scrolling == undefined)
                {
                    Scrolling = false;
                };
                MessageLength = todo.Message.length;
                TabIsPrivate = main.ctabsmc.TabIsPrivate();
                TabUser = main.ctabsmc.TabUser();
                HasNick = todo.HasPowerA(todo.w_Powers, 344, todo.w_Mask);
                if (((!(Scrolling)) || (!(p))))
                {
                    p = new Array();
                    NoOfM = 0;
                    v = 0;
                    while (v < MessageLength)
                    {
                        M = todo.Message[v];
                        if (Scrolling == false)
                        {
                            M.New = false;
                        };
                        if ((((M.New == false)) && (!((M.ignored == true)))))
                        {
                            if (TabIsPrivate)
                            {
                                if ((((((TabUser == M.u)) || ((todo.w_userno == M.u)))) && ((M.d == TabUser))))
                                {
                                    NoOfM++;
                                    p.push(v);
                                };
                            } else
                            {
                                if ((M.s & 2) == 0)
                                {
                                    NoOfM++;
                                    p.push(v);
                                };
                            };
                        };
                        if (M.mc)
                        {
                            M.mc.visible = false;
                        };
                        v++;
                    };
                } else
                {
                    t = p.length;
                    v = 0;
                    while (v < t)
                    {
                        if (todo.Message[p[v]].mc)
                        {
                            todo.Message[p[v]].mc.visible = false;
                        };
                        v++;
                    };
                };
                MaxInView = (Math.round((todo.tph / 35)) - 2);
                if (MaxInView < 0)
                {
                    MaxInView = 0;
                };
                t = ((NoOfM - MaxInView) * 100);
                if (t <= 0)
                {
                    t = 100;
                };
                main.mscrollmc.Scr_size = t;
                if (((todo.ScrollDown) && ((Scrolling == false))))
                {
                    main.mscrollmc.position = main.mscrollmc.Scr_size;
                    todo.ScrollDown = false;
                };
                if ((((mspos == undefined)) || (!(Scrolling))))
                {
                    mspos = main.mscrollmc.Scr_position;
                    todo.DoUpdateMessages = false;
                } else
                {
                    mspos = ((mspos + main.mscrollmc.Scr_position) / 2);
                    V = Math.abs((mspos - main.mscrollmc.Scr_position));
                    if (V < 10)
                    {
                        mspos = main.mscrollmc.Scr_position;
                        todo.DoUpdateMessages = false;
                    };
                    SkipSmilies = Scrolling;
                };
                Bot = ((MaxInView - 0.001) + ((NoOfM - MaxInView) * (mspos / main.mscrollmc.Scr_size)));
                if (Bot < 0)
                {
                    Bot = 0;
                };
                if (Bot >= (NoOfM - 0.001))
                {
                    Bot = (NoOfM - 0.001);
                };
                BotMargF = (Bot - int(Bot));
                Bot2 = int(Bot);
                v = Bot2;
                yc2 = 0;
                Cnt = NoOfM;
                HitTop = 99;
                while (Cnt > 0)
                {
                    Cnt--;
                    v2 = v;
                    v--;
                    if (v2 < 0)
                    {
                        v2 = (int(Bot) - v2);
                    };
                    if (p[v2] != undefined)
                    {
                        M = todo.Message[p[v2]];
                        if (M)
                        {
                            userid = xatlib.FindUser(M.u);
                            if ((((userid == -1)) && (!((M.u == 0)))))
                            {
                                DeleteOneMessageMc(p[v2]);
                                p[v2] = undefined;
                            } else
                            {
                                DeleteNumber = xatlib.xInt(M.n);
                                if (v < -1)
                                {
                                    Bot2++;
                                };
                                if (M.mc != undefined)
                                {
                                    yinc = M.mc.mch;
                                    yc2 = (yc2 + yinc);
                                } else
                                {
                                    if (M.u == 0)
                                    {
                                        Avatar = -1;
                                        UserName = xconst.ST(14);
                                        DeleteOk = 0;
                                    } else
                                    {
                                        Avatar = xatlib.CleanAv(todo.Users[userid].a);
                                        UserName = todo.Users[userid].n;
                                        if (UserName.substr(0, 1) == "$")
                                        {
                                            UserName = UserName.substr(1);
                                        };
                                        if (HasNick)
                                        {
                                            UserName = xatlib.GetNick(UserName, M.u);
                                        };
                                        s = "";
                                        if (todo.Users[userid].u != 0)
                                        {
                                            s = "<l>";
                                        };
                                        UserName = (((s + "<c> ") + s) + UserName);
                                        if (((todo.Users[userid].h) && ((todo.Users[userid].h.length > 6))))
                                        {
                                            UserName = (UserName + " <ho>");
                                        };
                                        if (((((((((todo.w_owner) || (todo.w_moderator))) && (!((M.n == 0))))) && (!((M.n == 1))))) && (!(M.p))))
                                        {
                                            UserName = (UserName + " <del>");
                                        };
                                        DeleteOk = 0;
                                    };
                                    AddMessageToList(Avatar, UserName, DeleteOk, p[v2], userid);
                                    M.mc.visible = false;
                                };
                                if (((todo.Message[p[Bot2]].mc) && (((yc2 - (todo.Message[p[Bot2]].mc.mch * (1 - BotMargF))) > todo.tph))))
                                {
                                    HitTop = 0;
                                    break;
                                };
                            };
                        };
                    };
                };
                if (yc2 >= todo.tph)
                {
                    yc3 = (todo.tph - ((BotMargF - 1) * todo.Message[p[int(Bot)]].mc.mch));
                    yc3 = (yc3 - 4);
                    n = int(Bot);
                    while (n >= 0)
                    {
                        if (p[n] != undefined)
                        {
                            M = todo.Message[p[n]];
                            if (M.mc)
                            {
                                if (M.mc.mch != undefined)
                                {
                                    yc3 = (yc3 - M.mc.mch);
                                };
                                if ((((M.mc.mch == undefined)) || ((yc3 < -(M.mc.mch))))) break;
                                M.mc.y = yc3;
                                M.mc.visible = true;
                            };
                        };
                        n--;
                    };
                } else
                {
                    yc3 = 0;
                    n = 0;
                    while (n < NoOfM)
                    {
                        if (p[n] != undefined)
                        {
                            M = todo.Message[p[n]].mc;
                            if ((((((yc3 > todo.tph)) || ((yc3 == undefined)))) || (!(M)))) break;
                            M.y = yc3;
                            M.visible = true;
                            yc3 = (yc3 + M.mch);
                        };
                        n++;
                    };
                };
                n = 0;
                while (n < MessageLength)
                {
                    if (((!((todo.Message[n].mc == undefined))) && ((todo.Message[n].mc.visible == false))))
                    {
                        DeleteOneMessageMc(n);
                    };
                    n++;
                };
                SkipSmilies = false;
            } catch(e:Error)
            {
            };
        }

        public static function DeleteOneMessageMc(_arg_1:*)
        {
            var _local_2:* = todo.Message[_arg_1].mc;
            if (!_local_2)
            {
                return;
            };
            McCnt--;
            if (((_local_2.avc) && (_local_2.avc.parent)))
            {
                _local_2.avc.parent.removeChild(_local_2.avc);
                _local_2.avc = undefined;
            };
            if (_local_2.parent)
            {
                _local_2.parent.removeChild(_local_2);
            };
            todo.Message[_arg_1].mc = undefined;
        }

        public static function NameCol(_arg_1:int, _arg_2:*=103)
        {
            var _local_3:*;
            var _local_6:int;
            if (_arg_1 == -1)
            {
                return ([undefined, undefined]);
            };
            if (_arg_2 == 103)
            {
                _local_3 = todo.Users[_arg_1].n.split("(glow");
                _local_3 = _local_3[1];
                if (_local_3)
                {
                    _local_3 = _local_3.split(")");
                    _local_3 = _local_3[0].split("#");
                };
            } else
            {
                _local_3 = todo.Users[_arg_1].s.split("#");
            };
            var _local_4:* = undefined;
            var _local_5:* = undefined;
            if ((_local_3 is Array))
            {
                _local_6 = ((todo.Users[_arg_1].Powers) ? todo.Users[_arg_1].Powers[0] : 0);
                if (_local_3[1] !== "0")
                {
                    if (_local_3[1])
                    {
                        _local_5 = xatlib.DecodeColor(_local_3[1], (((_local_6 & (1 << 13))) ? true : false), (((_local_6 & (1 << 14))) ? true : false), (((_local_6 & (1 << 15))) ? true : false), (((_local_6 & (1 << 16))) ? true : false));
                    } else
                    {
                        _local_5 = 0xFF00;
                    };
                };
                if (todo.HasPower(_arg_1, _arg_2))
                {
                    if (_local_3[2])
                    {
                        _local_4 = xatlib.DecodeColor(_local_3[2], (((_local_6 & (1 << 13))) ? true : false), (((_local_6 & (1 << 14))) ? true : false), (((_local_6 & (1 << 15))) ? true : false), (((_local_6 & (1 << 16))) ? true : false));
                    } else
                    {
                        _local_4 = 128;
                    };
                };
            };
            return ([_local_4, _local_5]);
        }

        private static function HugName(_arg_1:*)
        {
            _arg_1 = _arg_1.toString();
            if (_arg_1.substr(0, 1) == "$")
            {
                _arg_1 = _arg_1.substr(1);
            };
            return (("<c> " + _arg_1));
        }

        private static function HugAv(_arg_1:*, _arg_2:*, _arg_3:*)
        {
            var _local_6:*;
            if (!_arg_1)
            {
                return;
            };
            if (_arg_2 < 0)
            {
                return;
            };
            var _local_4:* = todo.Users[_arg_2].a;
            var _local_5:* = new xAvatar(_arg_1, _local_4, "", undefined, _arg_2);
            if (((_arg_3) && ((_local_4.charAt(0) == "h"))))
            {
                _local_6 = new Sprite();
                _local_6.graphics.beginFill(0xFF);
                _local_6.graphics.drawCircle(15, 15, 15);
                _local_6.graphics.endFill();
                _arg_1.addChild(_local_6);
                _arg_1.mask = _local_6;
            };
        }

        private static function HugLoaded(_arg_1:*)
        {
            var _local_2:*;
            var _local_9:*;
            var _local_10:*;
            var _local_3:* = _arg_1.currentTarget.loader.contentLoaderInfo.content;
            _local_3.visible = true;
            var _local_4:* = ((todo.tpw - xatlib.NX(16)) / 2);
            _local_3.x = -(((750 / 2) - _local_4));
            _local_3.y = 2;
            var _local_5:* = _arg_1.currentTarget.loader.parent;
            var _local_6:* = _local_5.opts;
            _local_6.XO = _local_3.x;
            _local_3.Go(_local_6);
            var _local_7:* = todo.Message[_local_6.v].u;
            var _local_8:* = xatlib.FindUser(_local_7);
            AddMessageToMc(_local_3, 0, HugName(todo.Users[_local_8].n), -(_local_3.Info.namex), 999, _local_3.Info.namey, _local_7);
            HugAv(_local_3.Info.av, _local_8, _local_3.Info.RoundAvs);
            if (((_local_3.Info.namex2) && (_local_6.b)))
            {
                _local_8 = xatlib.FindUser(_local_6.b);
                if (_local_8 >= 0)
                {
                    _local_9 = new MovieClip();
                    _local_3.addChild(_local_9);
                    AddMessageToMc(_local_9, 0, HugName(todo.Users[_local_8].n), 0, 999, _local_3.Info.namey2, _local_6.b);
                    _local_10 = _local_9.width;
                    if (_local_10 > _local_4)
                    {
                        _local_10 = _local_4;
                    };
                    _local_9.x = (_local_3.Info.namex2 - _local_10);
                    HugAv(_local_3.Info.av2, _local_8, _local_3.Info.RoundAvs);
                };
            };
        }

        public static function AddHug(_arg_1:*, _arg_2:*)
        {
            var _local_3:* = todo.Message[_arg_2].t;
            var _local_4:* = todo.Message[_arg_2].u;
            var _local_5:* = _local_3.split(";=");
            var _local_6:* = xconst.hugsR[_local_5[1]];
            if (!_local_6)
            {
                return;
            };
            _arg_1.opts = {};
            _arg_1.opts.Message = _local_5[2];
            _arg_1.opts.v = _arg_2;
            _arg_1.opts.b = xatlib.xInt(_local_5[3]);
            xatlib.LoadMovie(_arg_1, xatlib.SmilieUrl(_local_6, "hug"), HugLoaded);
        }

        public static function AddMessageToList(Avatar:*, UserName:String, DeleteOk:Number, v:Number, userid:Number)
        {
            var u:* = undefined;
            var h:String;
            var Press:* = undefined;
            var t:* = undefined;
            var z:* = undefined;
            var t2:* = undefined;
            var w:* = undefined;
            var m:* = undefined;
            var WordsLength:* = undefined;
            var M:* = todo.Message[v].t;
            u = todo.Message[v].u;
            var yinc:* = 0;
            var Avw:* = new MovieClip();
            todo.Message[v].mc = Avw;
            main.mctextbackground.addChild(Avw);
            if ((((((M.charAt(0) == "<")) && ((M.charAt(1) == "h")))) && ((M.charAt(2) == ">"))))
            {
                AddHug(Avw, v);
                Avw.mch = 74;
                yc2 = (yc2 + Avw.mch);
                return;
            };
            Avw.x = 5;
            if (todo.w_userno == u)
            {
                h = xconst.ST(140);
                Press = function ()
                {
                    main.hint.HintOff();
                    chat.mainDlg.GotoProfile(todo.w_userno);
                };
            } else
            {
                if (u == 0)
                {
                    h = xconst.ST(14);
                    Press = function ()
                    {
                        main.hint.HintOff();
                        main.openDialog(5, 0);
                    };
                } else
                {
                    h = xconst.ST(140);
                    Press = function ()
                    {
                        if (chat.isKeyDown(Keyboard.SHIFT))
                        {
                            PressUserName(u);
                        } else
                        {
                            chat.mainDlg.GotoProfile(u);
                        };
                    };
                };
            };
            var uid:* = xatlib.FindUser(u);
            var myuid:* = xatlib.FindUser(todo.w_userno);
            var a:* = Avw;
            a.x = 40;
            var namec:* = [];
            if (todo.HasPower(uid, 21))
            {
                namec = NameCol(uid);
            };
            if ((((todo.w_userno == u)) && ((todo.Users[uid].w == 176))))
            {
                M = xatlib.ReversePower(M);
            };
            todo.Random = (((u + todo.w_useroom) & 0xFFFF) + xatlib.ChkSum(M));
            yinc = AddMessageToMc(a, 0, UserName, 0, main.textPaneWidth, 0, u, userid, namec[0], namec[1], todo.Message[v].pb);
            todo.Random = (todo.Random ^ 0x5555);
            yinc = (yinc + AddMessageToMc(a, 1, M, 0, main.textPaneWidth, yinc, u));
            if (yinc < 35)
            {
                yinc = 35;
            };
            if (((todo.HasPower(uid, 209)) && (!(todo.Message[v].action))))
            {
                M = M.toLowerCase();
                M = M.split(" ");
                WordsLength = M.length;
                m = 0;
                while (m < WordsLength)
                {
                    w = M[m];
                    if (w.charAt(0) == "(")
                    {
                        w = w.substr(1).split(")");
                        w = w[0];
                        w = w.split("#");
                        w = w[0];
                    };
                    if (xconst.ActionTable[w])
                    {
                        todo.Message[v].action = xconst.ActionNames[xconst.ActionTable[w]];
                        break;
                    };
                    m++;
                };
            };
            if (uid >= 0)
            {
                Avw.avc = new xAvatar(Avw, Avatar, h, Press, uid, todo.Message[v].action);
            } else
            {
                Avw.avc = new xAvatar(Avw, Avatar, h, Press);
            };
            Avw.avc.Av.x = -35;
            Avw.avc.Av.y = 5;
            Avw.avc.Av.h = h;
            Avw.avc.Av.Zm = ((((todo.HasPower(uid, 4)) || (todo.HasPowerA(todo.w_Powers, 4)))) && (!(todo.bThin)));
            Avw.avc.Av.addEventListener(MouseEvent.ROLL_OVER, Av_onRollOver);
            Avw.avc.Av.addEventListener(MouseEvent.ROLL_OUT, Av_onRollOut);
            Avw.avc.Av.addEventListener(MouseEvent.MOUSE_UP, Av_onRollOut);
            todo.Message[v].mc.mch = (yinc + 4);
            yc2 = (yc2 + (yinc + 4));
        }

        static function Av_onRollOver(_arg_1:MouseEvent)
        {
            var _local_2:* = _arg_1.currentTarget;
            main.hint.Hint(0, 0, _local_2.h, true, 0, undefined, 0, _local_2);
            if (!_local_2.Zm)
            {
                return;
            };
            _local_2.scaleX = 2.67;
            _local_2.scaleY = 2.67;
            _local_2.y = -20;
            _local_2.parent.parent.setChildIndex(_local_2.parent, (_local_2.parent.parent.numChildren - 1));
            if (_local_2.g)
            {
                _local_2.g.visible = false;
            };
            _local_2.addEventListener(MouseEvent.MOUSE_MOVE, Av_tick);
        }

        static function Av_onRollOut(_arg_1:*)
        {
            var _local_2:* = _arg_1.currentTarget;
            _local_2.scaleX = 1;
            _local_2.scaleY = 1;
            _local_2.y = 5;
            if (_local_2.g)
            {
                _local_2.g.visible = true;
            };
            main.hint.HintOff();
            _local_2.removeEventListener(MouseEvent.MOUSE_MOVE, Av_tick);
        }

        static function Av_tick(_arg_1:*)
        {
            if ((((_arg_1.stageX > 99)) || ((_arg_1.stageX < 6))))
            {
                Av_onRollOut(_arg_1);
            };
        }

        static function DoRandom(_arg_1:*, _arg_2:*)
        {
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:int;
            var _local_11:*;
            var _local_12:*;
            var _local_13:*;
            var _local_14:*;
            if (_arg_1.charAt((_arg_1.length - 1)) !== ")")
            {
                return (_arg_1);
            };
            var _local_3:* = _arg_1.split("random");
            var _local_4:* = _local_3[0];
            if (!todo.Users[_arg_2].RandomA)
            {
                _local_14 = (todo.Users[_arg_2].RandomA = new Object());
                _local_6 = (_local_14[1] = new Array());
                _local_5 = todo.Users[_arg_2].Powers;
                _local_10 = xconst.smia.length;
                _local_8 = 0;
                while (_local_8 < _local_10)
                {
                    _local_7 = xconst.smia[_local_8];
                    if (xatlib.SmOk(_local_7, _local_5))
                    {
                        if (_local_7 !== "127")
                        {
                            _local_6.push(_local_7);
                        };
                    };
                    _local_8++;
                };
                _local_14[1].sort();
            };
            _local_14 = todo.Users[_arg_2].RandomA;
            _local_9 = 1;
            while (_local_9 < _local_3.length)
            {
                _local_11 = 0;
                _local_7 = _local_3[_local_9].charAt(0);
                if (((!((_local_7 === ")"))) && (!((_local_7 === "#")))))
                {
                    _local_7 = _local_3[_local_9].split("#", 2);
                    if (_local_7[1] == undefined)
                    {
                        _local_7 = _local_3[_local_9].split(")", 2);
                        _local_8 = _local_7[0];
                        _local_3[_local_9] = ")";
                    } else
                    {
                        _local_8 = _local_7[0];
                        _local_3[_local_9] = ("#" + _local_7[1]);
                    };
                    _local_13 = xconst.pssh[_local_8];
                    if (((_local_13) && (xatlib.SmOk(_local_8, todo.Users[_arg_2].Powers))))
                    {
                        _local_12 = _local_14[_local_8];
                        if (!_local_12)
                        {
                            _local_12 = new Array();
                            _local_10 = _local_14[1].length;
                            _local_7 = 0;
                            while (_local_7 < _local_10)
                            {
                                if (xconst.topsh[_local_14[1][_local_7]] == _local_13)
                                {
                                    _local_12.push(_local_14[1][_local_7]);
                                };
                                _local_7++;
                            };
                            _local_14[_local_8] = _local_12;
                        };
                        _local_11 = _local_12[(todo.Random % _local_12.length)];
                    };
                };
                _local_8 = _local_14[1].length;
                if (!_local_11)
                {
                    _local_11 = _local_14[1][(todo.Random % _local_8)];
                };
                _local_4 = (_local_4 + (_local_11 + _local_3[_local_9]));
                todo.Random = (todo.Random + ((_local_4.length % 10) + (_local_8 >> 1)));
                _local_9++;
            };
            return (_local_4);
        }

        public static function AddMessageToMc(mcin:*, id:Number, str:String, Left:Number, Right:Number, yOfst:Number, UserNo:Number=NaN, userid:*=undefined, color:*=undefined, glowc:*=undefined, NameHint:*=undefined):Number
        {
            var SwearWord:* = undefined;
            var HasRandom:* = undefined;
            var BigSmiley:Boolean;
            var mcFmt:TextFormat;
            var SmilieBan:* = undefined;
            var mc:* = undefined;
            var Chatter:MovieClip;
            var LocData:* = undefined;
            var LocFunc:* = undefined;
            var HotLink:* = undefined;
            var HotLink2:* = undefined;
            var HotLink3:* = undefined;
            var s:String;
            var c0:String;
            var Sm:* = undefined;
            var ts:* = undefined;
            var key:* = undefined;
            var mcTxt:* = undefined;
            var t:* = undefined;
            var WordWidth:* = undefined;
            var c3:* = undefined;
            var f:Number;
            var mc2:* = undefined;
            var mcTxt2:* = undefined;
            var schrs:* = undefined;
            var n2:* = undefined;
            var m2:* = undefined;
            if (color == undefined)
            {
                color = 0;
            };
            var Width:Number = (Right - Left);
            xPos = Left;
            var yPos:Number = 0;
            var LineH:Number = 16;
            var LinkNextWord:* = false;
            var sLinkNextWord:* = false;
            mcFmt = new TextFormat();
            mcFmt.align = "left";
            mcFmt.bold = !(((id & 1) == 0));
            if (id == 4)
            {
                id = 1;
            };
            if ((((id == 1)) && ((UserNo == 0))))
            {
                mcFmt.italic = true;
            };
            var uid:* = xatlib.FindUser(UserNo);
            if (uid >= 0)
            {
                HasRandom = todo.HasPower(uid, 272);
            };
            if ((((((id == 1)) && ((uid >= 0)))) && ((todo.Users[uid].w == 184))))
            {
                SmilieBan = true;
            };
            mcFmt.font = "_sans";
            var mcFmtSize:* = 14;
            mcFmt.size = mcFmtSize;
            var Space:Number = int((mcFmtSize * 0.4));
            var SCnt:* = 0;
            var HomeX:int;
            var Words:Array = new Array();
            Words = str.split(" ");
            while (Words[0] == "")
            {
                Words.shift();
            };
            var WordsLen:int = Words.length;
            while (Words[(WordsLen - 1)] == "")
            {
                Words.pop();
                WordsLen = (WordsLen - 1);
            };
            if (xconst.ST(85) == "RTL")
            {
                Words.reverse();
            };
            mcin.mouseEnabled = false;
            mcin.t = "";
            mcin.u = UserNo;
            if (glowc != undefined)
            {
                if (todo.bThin)
                {
                    mcin.Glow = glowc;
                } else
                {
                    mcin.glowa = new Array();
                    mcin.glowf = new GlowFilter(glowc, 0.7, 3, 3, 3, 3, false, false);
                    mcin.glowa.push(mcin.glowf);
                };
            };
            var n:* = 0;
            for (;n < WordsLen;n++)
            {
                if ((((Right == 1999)) && ((xPos > (main.upw - 20))))) break;
                LocData = undefined;
                LocFunc = undefined;
                HotLink = undefined;
                HotLink2 = undefined;
                HotLink3 = undefined;
                mcFmt.color = color;
                s = Words[n].toLowerCase();
                c0 = s.charAt(0);
                Sm = undefined;
                mc = mcin;
                mcFmt.url = "";
                if (!(id & 2))
                {
                    mcFmt.underline = false;
                };
                SwearWord = 0;
                if (c0 == "<")
                {
                    c3 = s.charAt(1);
                    if (c3 == "l")
                    {
                        sLinkNextWord = true;
                        Words[n] = Words[n].substr(3);
                        s = Words[n].toLowerCase();
                        c0 = s.charAt(0);
                    };
                    if (c3 == "s")
                    {
                        SwearWord = s.charAt(2);
                        Words[n] = Words[n].substr(4);
                        s = Words[n].toLowerCase();
                        c0 = s.charAt(0);
                    };
                    if ((((s == "<b>")) || ((s == "</b>"))))
                    {
                        mcFmt.bold = true;
                        continue;
                    };
                };
                LinkNextWord = sLinkNextWord;
                if (SmilieBan)
                {
                };
                if (((!(Sm)) && ((((xPos < Right)) || (!((c0 == "(")))))))
                {
                    if (((HasRandom) && (s.indexOf("random"))))
                    {
                        Words[n] = DoRandom(Words[n], uid);
                        s = Words[n].toLowerCase();
                    };
                    if ((((((WordsLen == 1)) && (todo.HasPower(uid, 355)))) && (!((s.charAt(0) == "#")))))
                    {
                        BigSmiley = true;
                        mc.size = 40;
                        mc.SF = smiley.f_NoCache;
                    };
                    Sm = Smilie(mc, s, UserNo, userid, id, Words[n]);
                };
                if (SmilieBan)
                {
                };
                if (c0 == "_")
                {
                    Words[n] = Words[n].substr(1);
                };
                if (Sm)
                {
                    if (BigSmiley)
                    {
                        LineH = 40;
                        yPos = (yPos + 3);
                    };
                    SCnt++;
                    Chatter = undefined;
                    if (((((!((Sm.Flags == 1))) && ((SCnt > 10)))) && ((UserNo > 101))))
                    {
                        mc.removeChild(Sm);
                        continue;
                    };
                    Sm.x = (xPos + xatlib.xInt(Sm.x));
                    Sm.y = (Sm.y + ((yPos + yOfst) + 3));
                    xPos = (xPos + 20);
                    if (Sm.Flags == 1)
                    {
                        xPos = (xPos - 5);
                        if (xPos > (Right - 10))
                        {
                            if (HomeX)
                            {
                                HomeX = (HomeX - 14);
                                Sm.x = HomeX;
                            } else
                            {
                                Sm.x = (Sm.x - (xPos - Right));
                                Sm.x = (Sm.x - 14);
                                HomeX = Sm.x;
                            };
                        } else
                        {
                            if (HomeX == 0)
                            {
                                HomeX = xPos;
                            };
                        };
                    };
                    if (Sm.Flags == 2)
                    {
                        Chatter = Sm;
                        xPos = (xPos - 8);
                    };
                    if (Sm.Flags == 4)
                    {
                        xPos = (xPos - 10);
                        Sm.y = (Sm.y + 3);
                    };
                    if ((((((((n == 0)) && ((uid >= 0)))) && ((Words[n].charAt(1) == ">")))) && (todo.Users[uid].s)))
                    {
                        Sm.y = (Sm.y + 4);
                    };
                } else
                {
                    if (!(((c0 == "<")) && ((s == "<c>"))))
                    {
                        if (!SmilieBan)
                        {
                            mcin.t = (mcin.t + (" " + Words[n]));
                            ts = undefined;
                            if (Words[n].indexOf(".") >= 0)
                            {
                                ts = xatlib.WordIsLink(Words[n]);
                            };
                            if (ts)
                            {
                                if ((((((((((((((s.indexOf("youtube.com") >= 0)) || ((s.indexOf("photobucket.com") >= 0)))) || ((s.indexOf("veoh.com") >= 0)))) || ((s.indexOf("vids.myspace.com") >= 0)))) || ((s.indexOf("mogulus.com") >= 0)))) || ((s.indexOf("video.google.") >= 0)))) || ((s.indexOf("live.yahoo.com") >= 0))))
                                {
                                    LocData = xatlib.urlencode(ts.substr(7));
                                    HotLink = ((xatlib.PageUrl(4) + "&m=") + LocData);
                                    LocFunc = function (_arg_1:*)
                                    {
                                        return (main.mcLoad.OpenMedia(_arg_1.currentTarget.LocData));
                                    };
                                    HotLink2 = ts;
                                } else
                                {
                                    s = ts;
                                    HotLink = 1;
                                };
                            };
                            key = keywords[s];
                            if (key)
                            {
                                switch (key)
                                {
                                    case 1:
                                        HotLink = xatlib.PageUrl(2);
                                        LocFunc = function (_arg_1:*)
                                        {
                                            return (main.mcLoad.OpenDoodle());
                                        };
                                        break;
                                    case 2:
                                        HotLink = xatlib.PageUrl(30008);
                                        LocFunc = function (_arg_1:*)
                                        {
                                            return (main.mcLoad.OpenByN(30008));
                                        };
                                        break;
                                    case 3:
                                        HotLink = xatlib.PageUrl(5);
                                        LocFunc = function (_arg_1:*)
                                        {
                                            return (main.mcLoad.OpenSmilies());
                                        };
                                        break;
                                    case 4:
                                        if (!ImInit)
                                        {
                                            HotLink = xatlib.PageUrl(6);
                                        };
                                        break;
                                    case 5:
                                        HotLink = xatlib.Register_Link(1);
                                        LocFunc = 2;
                                        break;
                                    case 6:
                                        HotLink = xatlib.Register_Link(0);
                                        LocFunc = 2;
                                        break;
                                    case 7:
                                        HotLink = (xatlib.Register_Link(0) + "&b=1");
                                        break;
                                    case 8:
                                        HotLink = xatlib.PageUrl(20044);
                                        LocFunc = function (_arg_1:*)
                                        {
                                            return (main.mcLoad.OpenByN(20044));
                                        };
                                        break;
                                    default:
                                        if (key >= 10000)
                                        {
                                            HotLink = xatlib.PageUrl(key);
                                            LocFunc = function (_arg_1:*)
                                            {
                                                return (main.mcLoad.OpenByN(key));
                                            };
                                        } else
                                        {
                                            HotLink = ("//xat.dev/" + key);
                                        };
                                };
                            };
                            if (LocFunc == 2)
                            {
                                LocFunc = function (_arg_1:*)
                                {
                                    return (main.mcLoad.StartMedia(("L" + this.Url)));
                                };
                            };
                            if (!HotLink)
                            {
                                key = todo.gconfig["g100"];
                                if (key)
                                {
                                    var _local_13 = key[s];
                                    key = _local_13;
                                    if (_local_13)
                                    {
                                        _local_13 = ("//bit.ly/" + key);
                                        HotLink3 = _local_13;
                                        HotLink = _local_13;
                                    };
                                };
                            };
                            if (((HotLink) && ((id & 1))))
                            {
                                if (HotLink == 1)
                                {
                                    HotLink = s;
                                };
                                mcFmt.underline = true;
                                if (HotLink3)
                                {
                                    mcFmt.color = 80;
                                };
                                mc = new xSprite();
                                mcin.addChild(mc);
                                mc.Url = HotLink;
                                mc.Url2 = HotLink2;
                                mc.LocFunc = LocFunc;
                                mc.LocData = LocData;
                                mc.useHandCursor = true;
                                mc.buttonMode = true;
                                mc.mouseChildren = false;
                                mc.addEventListener(MouseEvent.MOUSE_DOWN, DoHotLink);
                            };
                            if (LinkNextWord)
                            {
                                mc = new xSprite();
                                mcin.addChild(mc);
                                mc.UserNo = xatlib.xInt(UserNo);
                                if (UserNo == 0)
                                {
                                    mc.UserNo = todo.w_userno;
                                };
                                mc.addEventListener(MouseEvent.MOUSE_DOWN, PressUserNameEvent);
                                mc.nh = NameHint;
                                mc.id = id;
                                mc.addEventListener(MouseEvent.ROLL_OVER, HintUserName);
                                mc.addEventListener(MouseEvent.ROLL_OUT, main.hint.HintOff);
                                mc.buttonMode = true;
                                mc.mouseChildren = false;
                                if (id != 0)
                                {
                                    LinkNextWord = false;
                                };
                            };
                            mcTxt = new TextField();
                            mcTxt.x = xPos;
                            mcTxt.y = ((yPos + yOfst) + 3);
                            mcTxt.width = Width;
                            mcTxt.height = (LineH * 1.3);
                            mcTxt.selectable = true;
                            mcTxt.defaultTextFormat = mcFmt;
                            mcTxt.text = Words[n];
                            t = mc.addChild(mcTxt);
                            if (glowc != undefined)
                            {
                                if (todo.bThin)
                                {
                                    mc.Glow = glowc;
                                } else
                                {
                                    mc.filters = mcin.glowa;
                                };
                            };
                            WordWidth = mcTxt.textWidth;
                            mcTxt.width = (WordWidth + 5);
                            if ((((((((xPos > 0)) && ((WordWidth > (Width - xPos))))) && ((userid == undefined)))) && (!(((id & 2) == 2)))))
                            {
                                f = 0;
                                if (Chatter != undefined)
                                {
                                    Chatter.x = Left;
                                    Chatter.y = (Chatter.y + LineH);
                                    f = 12;
                                };
                                mcTxt.x = (Left + f);
                                mcTxt.y = (mcTxt.y + LineH);
                                yPos = (yPos + LineH);
                                xPos = (((Left + Space) + WordWidth) + f);
                            } else
                            {
                                Chatter = undefined;
                                xPos = (xPos + (Space + WordWidth));
                            };
                            if (SwearWord)
                            {
                                mc2 = new xSprite();
                                mcin.addChild(mc2);
                                mcTxt2 = new TextField();
                                mcTxt2.x = mcTxt.x;
                                mcTxt2.y = mcTxt.y;
                                mcTxt2.width = Width;
                                mcTxt2.height = (LineH * 1.3);
                                t = mc2.addChild(mcTxt2);
                                schrs = "!#%£!@?*";
                                m2 = 0;
                                mcTxt2.defaultTextFormat = mcFmt;
                                mcTxt2.text = "";
                                n2 = 0;
                                while (n2 < s.length)
                                {
                                    mcTxt2.text = (mcTxt2.text + schrs.charAt(m2++));
                                    if (m2 >= schrs.length)
                                    {
                                        m2 = 0;
                                    };
                                    n2++;
                                };
                                mcTxt2.width = (WordWidth + 5);
                                mcTxt2.backgroundColor = 0x909090;
                                if (SwearWord == "2")
                                {
                                    mcTxt2.backgroundColor = 9474303;
                                };
                                mcTxt2.background = true;
                                mc2.addEventListener(MouseEvent.MOUSE_DOWN, RemoveMe);
                            };
                        };
                    };
                };
            };
            return ((yPos + LineH));
        }

        public static function RemoveMe(_arg_1:MouseEvent)
        {
            _arg_1.currentTarget.parent.removeChild(_arg_1.currentTarget);
        }

        public static function DoHotLink(_arg_1:MouseEvent)
        {
            var _local_3:*;
            var _local_2:* = ((chat.isKeyDown(Keyboard.SHIFT)) || (((!(((todo.FlagBits & xconst.f_NoList) == 0))) && (!((global.xc & 0x0800))))));
            if (((!(_local_2)) && (_arg_1.currentTarget.LocFunc)))
            {
                _arg_1.currentTarget.LocFunc(_arg_1);
            };
            if (((((_local_2) || (!(_arg_1.currentTarget.LocFunc)))) || (!((global.xc & 0x0800)))))
            {
                _local_3 = _arg_1.currentTarget.Url;
                if (((_local_2) && (_arg_1.currentTarget.Url2)))
                {
                    _local_3 = _arg_1.currentTarget.Url2;
                };
                _local_3 = xatlib.xatlinks(_local_3);
                if (chat.isKeyDown(Keyboard.SHIFT))
                {
                    _local_3 = (_local_3 + "&f=1");
                };
                xatlib.UrlPopup(xconst.ST(8), _local_3, xconst.ST(17));
            };
        }

        public static function PressUserNameEvent(_arg_1:MouseEvent)
        {
            PressUserName(_arg_1.currentTarget.UserNo, _arg_1.ctrlKey);
        }

        public static function PressUserName(_arg_1:*, _arg_2:*=false)
        {
            if (_arg_1 == undefined)
            {
                return;
            };
            main.hint.HintOff();
            if (_arg_1 == 3)
            {
                return;
            };
            if (_arg_1 == todo.w_userno)
            {
                main.openDialog(1);
            } else
            {
                if (_arg_1 != 0xFFFFFFFF)
                {
                    if (((((((_arg_2) && (todo.Macros))) && (todo.Macros["rapid"]))) && (todo.HasPowerA(todo.w_Powers, 91, todo.w_Mask))))
                    {
                        DoRapid(_arg_1);
                    } else
                    {
                        main.openDialog(2, _arg_1);
                    };
                };
            };
        }

        public static function HintUserName(_arg_1:MouseEvent)
        {
            var _local_4:*;
            var _local_2:* = 0;
            var _local_3:* = 8;
            if (_arg_1.currentTarget.id == 2)
            {
                _local_2 = 1;
                _local_3 = 3;
            };
            if (todo.w_userno == _arg_1.currentTarget.UserNo)
            {
                _local_4 = xconst.ST(18);
            } else
            {
                if (_arg_1.currentTarget.UserNo == 3)
                {
                    if (ImInit)
                    {
                        _local_4 = xconst.ST(141);
                    } else
                    {
                        _local_4 = xconst.ST(142);
                    };
                } else
                {
                    _local_4 = xconst.ST(16, xatlib.FixLI(xatlib.GetUsername(_arg_1.currentTarget.UserNo, 1, 1, _arg_1.currentTarget.nh)));
                };
            };
            if (_local_4)
            {
                main.hint.Hint(0, _local_3, _local_4, true, _local_2, 0, 0, _arg_1.currentTarget);
            };
        }

        public static function GotPower(_arg_1:*, _arg_2:*)
        {
            return (xatlib.SmOk(_arg_1, _arg_2, true));
        }

        public static function PowSm(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*)
        {
            var _local_7:*;
            var _local_8:*;
            var _local_10:*;
            var _local_12:*;
            var _local_14:*;
            var _local_16:*;
            var _local_19:*;
            var _local_20:*;
            var _local_21:*;
            var _local_22:*;
            var _local_23:*;
            if (_arg_2[1] == undefined)
            {
                return (true);
            };
            if (!(_arg_1.SF & 2))
            {
                return (false);
            };
            if (((_arg_4) && ((_arg_4[0] & 1))))
            {
                _arg_1.SF = (_arg_1.SF | smiley.f_AllPowers);
            };
            var _local_5:* = _arg_2.length;
            var _local_6:* = true;
            var _local_9:* = new Object();
            var _local_11:* = "";
            var _local_13:* = "";
            var _local_15:* = 0;
            var _local_17:* = true;
            var _local_18:Boolean;
            _local_16 = 1;
            for (;_local_16 <= _local_5;_local_16++)
            {
                _local_19 = undefined;
                if (_arg_2[_local_16] != undefined)
                {
                    _local_19 = _arg_2[_local_16].toLowerCase();
                };
                if (_arg_2[(_local_16 - 1)] === "piano")
                {
                    _arg_1.SF = (_arg_1.SF | 128);
                };
                if (((((_local_19) && ((_local_19.charAt(0) == "y")))) && ((_local_19.length > 14))))
                {
                    if (todo.HasPowerA(_arg_4, 328))
                    {
                        _arg_1.SCC = _local_19;
                    };
                    _local_19 = "y";
                };
                _local_7 = xconst.effectsR[_local_19];
                if (_local_7 != undefined)
                {
                    _local_9[_local_7] = true;
                } else
                {
                    _local_7 = xconst.effects[_local_19];
                    if (_local_7 != undefined)
                    {
                        _local_9[_local_19] = true;
                        if (((_local_6) || (!((_local_19 == "y"))))) continue;
                    };
                    _local_7 = xconst.backsR[_local_19];
                    if (_local_7 != undefined)
                    {
                        _local_10 = _local_7;
                    } else
                    {
                        if (((!((_local_19 == undefined))) && ((_local_19.length == 1))))
                        {
                            _local_7 = xconst.backs[_local_19];
                        };
                        if (_local_7 != undefined)
                        {
                            _local_10 = _local_19;
                        } else
                        {
                            if (((((((xconst.smih[_local_19]) && (!((_local_19.length == 1))))) || ((_local_19 == undefined)))) || ((_local_19 == "6"))))
                            {
                                if (_local_18) break;
                                if (_local_19 == "hole")
                                {
                                    _local_18 = true;
                                };
                                for (_local_21 in _local_9)
                                {
                                    _local_7 = xconst.effects[_local_21];
                                    if (!GotPower(_local_7, _arg_4))
                                    {
                                        _local_9[_local_21] = false;
                                        _local_17 = false;
                                    };
                                };
                                if (_local_6)
                                {
                                    _local_14 = _local_9;
                                    if (GotPower(xconst.backs[_local_10], _arg_4))
                                    {
                                        _arg_1.ST = xconst.backs[_local_10];
                                    } else
                                    {
                                        _local_17 = false;
                                    };
                                    _arg_1.SC = _local_13;
                                    if (_local_14["f"])
                                    {
                                        _arg_1.SP = 4;
                                    };
                                    if (_local_14["y"])
                                    {
                                        _arg_1.SC = "y";
                                    };
                                } else
                                {
                                    _local_11 = (_local_11 + ",");
                                    _local_7 = 1;
                                    if (_local_9["f"])
                                    {
                                        _local_7 = (_local_7 | 4);
                                    };
                                    _local_11 = (_local_11 + _local_7);
                                };
                                if ((((_local_19 == "6")) && ((_arg_1.SC == undefined))))
                                {
                                    _arg_1.SC = 0xF00000;
                                };
                                _local_13 = undefined;
                                _local_9 = new Object();
                                _local_12 = false;
                                if (++_local_15 >= 6) break;
                                if (((!(todo.HasPowerA(_arg_4, 0))) || (!((_local_19 == "allpowers")))))
                                {
                                    if (!xatlib.SmOk(_local_19, _arg_4, true))
                                    {
                                        if (_local_19)
                                        {
                                            _arg_2[_local_16] = "none";
                                            _local_17 = false;
                                        };
                                        break;
                                    };
                                };
                                if (!_local_6)
                                {
                                    _local_11 = (_local_11 + ",");
                                };
                                _local_11 = (_local_11 + (_local_19 + ","));
                                _local_6 = false;
                            } else
                            {
                                _local_20 = false;
                                if (_local_19.length == 6)
                                {
                                    _local_7 = parseInt(_local_19, 16);
                                    _local_7 = _local_7.toString(16);
                                    _local_7 = ("000000" + _local_7);
                                    _local_7 = _local_7.substr(-6, 6);
                                } else
                                {
                                    _local_7 = "";
                                };
                                if (_local_19 == "y")
                                {
                                    if (!todo.HasPowerA(_arg_4, 22))
                                    {
                                        _local_19 = "";
                                        _local_7 = _local_19;
                                    };
                                    _local_20 = true;
                                };
                                if (_local_7 != _local_19)
                                {
                                    _local_22 = _local_19.length;
                                    _local_23 = 0;
                                    while (_local_23 < _local_22)
                                    {
                                        _local_7 = _local_19.charAt(_local_23);
                                        if ((((xconst.effects[_local_7] == undefined)) && (!(xconst.colorc[_local_7]))))
                                        {
                                            _local_20 = true;
                                            break;
                                        };
                                        _local_23++;
                                    };
                                    if (!_local_20)
                                    {
                                        _local_23 = 0;
                                        while (_local_23 < _local_22)
                                        {
                                            _local_7 = _local_19.charAt(_local_23);
                                            _local_9[_local_7] = true;
                                            _local_23++;
                                        };
                                    };
                                };
                                if (!_local_20)
                                {
                                    _local_7 = xatlib.DecodeColor(_local_19, todo.HasPowerA(_arg_4, 13), todo.HasPowerA(_arg_4, 14), todo.HasPowerA(_arg_4, 15), todo.HasPowerA(_arg_4, 16));
                                    if (_local_7 != undefined)
                                    {
                                        if (!_local_6)
                                        {
                                            if (_local_12)
                                            {
                                                _local_11 = (_local_11 + "#");
                                            };
                                            _local_12 = true;
                                            _local_11 = (_local_11 + _local_7);
                                        } else
                                        {
                                            _local_13 = (_local_13 + (_local_7 + "#"));
                                        };
                                    };
                                };
                                if (((_local_20) && (!(_local_6))))
                                {
                                    if (_local_12)
                                    {
                                        _local_11 = (_local_11 + "#");
                                    };
                                    _local_12 = true;
                                    _local_11 = (_local_11 + _local_19);
                                };
                            };
                        };
                    };
                };
            };
            if (_local_11 != "")
            {
                _arg_1.SE = _local_11;
            };
            if (((_local_14["i"]) && ((_arg_4[0] & (1 << 6)))))
            {
                _arg_1.scaleY = -1;
                _arg_1.y = (_arg_1.y + _arg_3);
            };
            if (((_local_14["m"]) && ((_arg_4[0] & (1 << 7)))))
            {
                _arg_1.scaleX = -1;
                _arg_1.xx = _arg_3;
            };
            _arg_1.SA = (("(" + _arg_2.join("#")) + ")");
            return (_local_17);
        }

        public static function Smilie(mc:*, s:String, u:Number, userid:Number, Pos:*, Code:String)
        {
            var smc:* = undefined;
            var HTxt:* = undefined;
            var t:* = undefined;
            var key:* = undefined;
            var smc2:* = undefined;
            var m:* = undefined;
            var classRef:Class;
            var Args:* = undefined;
            var G:* = undefined;
            var e:* = undefined;
            var t2:* = undefined;
            var Col:* = undefined;
            var s2:* = undefined;
            if (!userid)
            {
                userid = xatlib.FindUser(u);
            };
            if (userid == -1)
            {
                userid = 0;
            };
            var uid:* = userid;
            var c0:* = s.charAt(0).toLowerCase();
            if (!FirstC)
            {
                t = ":,;,<,#,8,(";
                t = t.split(",");
                FirstC = {};
                for (key in t)
                {
                    FirstC[t[key]] = true;
                };
            };
            if (FirstC[c0])
            {
                if (c0 == "#")
                {
                    var _local_8 = new library("Speaker");
                    smc = _local_8;
                    smc2 = _local_8;
                    smc2.scaleX = (smc2.scaleY = (19 / 23));
                    if (!todo.bThin)
                    {
                        smc2.xitem.gotoAndStop(1);
                    };
                    smc2.xitem.SoundIsOff.visible = false;
                    HTxt = s;
                    if (!todo.bMobile)
                    {
                        smc.addEventListener(MouseEvent.MOUSE_DOWN, DoSound);
                    };
                    smc.Snd = s;
                };
                if ((((((c0 == ":")) || ((c0 == ";")))) || ((c0 == "8"))))
                {
                    m = 0;
                    while (m < xconst.smArray.length)
                    {
                        if (xconst.smArray[m] == s)
                        {
                            while (!((xconst.smArray[m] < 0)))
                            {
                                m++;
                                if (m >= xconst.smArray.length) break;
                            };
                            HTxt = s.toUpperCase();
                            if (((todo.bThin) || ((xconst.smArray[m] < -1))))
                            {
                                _local_8 = (("(" + xconst.smArray[(m - 1)]) + ")");
                                s = _local_8;
                                Code = _local_8;
                                break;
                            };
                            classRef = (getDefinitionByName(xconst.smArray[(m - 1)]) as Class);
                            smc = new (classRef)();
                            if (mc.size)
                            {
                                smc.scaleX = (smc.scaleY = (mc.size / 19));
                            };
                            smc.UserNo = u;
                            break;
                        };
                        while (!((xconst.smArray[m] < 0)))
                        {
                            m++;
                            if (m >= xconst.smArray.length) break;
                        };
                        m++;
                    };
                };
                if ((((((smc == undefined)) && ((c0 == "(")))) && ((s.charAt((s.length - 1)) == ")"))))
                {
                    Args = new Array();
                    t = s.substr(1, (s.length - 2));
                    G = (t.charAt(0) == ">");
                    if (G)
                    {
                        t = xatlib.xInt(t.substr(1));
                    } else
                    {
                        if (xatlib.xInt(t) >= 10000)
                        {
                            t = "";
                        };
                        Args = t.split("#");
                        t = Args[0];
                        if ((((SmB == undefined)) && (!(xatlib.SmOk(t, todo.Users[uid].Powers)))))
                        {
                            t = -1;
                        };
                    };
                    if ((((((Args[0] == "hat")) && (!((Args[1] == undefined))))) || ((Args[0] == "glow"))))
                    {
                        _local_8 = "none";
                        var _temp_1 = Args;
                        t = _local_8;
                        _temp_1[0] = _local_8;
                    };
                    if (((!((t == -1))) || (G)))
                    {
                        if (todo.bMobile)
                        {
                            smc = {};
                        } else
                        {
                            smc = new MovieClip();
                        };
                        e = "";
                        if (todo.Users[uid].registered != undefined)
                        {
                            smc.SF = 1;
                        };
                        if (todo.Users[uid].VIP)
                        {
                            e = "&r=2";
                            smc.SF = 2;
                        };
                        smc.UserNo = u;
                        if (xconst.topsh[t] == -3)
                        {
                            smc.Gifts = u;
                        };
                        if ((((t >= 10128)) && ((t < 20000))))
                        {
                            classRef = (getDefinitionByName(t) as Class);
                            t2 = new (classRef)();
                            smc.addChild(t2);
                        } else
                        {
                            if (t > 50000)
                            {
                                if (todo.bMobile)
                                {
                                    return (false);
                                };
                                Args = new Array();
                                if (t >= 60000)
                                {
                                    t2 = ((t - 60000) & ~(1));
                                    if (!xconst.Game[t2])
                                    {
                                        return;
                                    };
                                    Args.push(xconst.Game[t2]);
                                } else
                                {
                                    Args.push((xconst.Puzzle[(t - 50000)] + "ban"));
                                };
                                Args.push("wb1");
                                if (todo.Users[userid].w)
                                {
                                    Args.push("964B00");
                                };
                                smc.SF = 2;
                                PowSm(smc, Args, 19, todo.ALL_POWERS);
                                smc.ns = new smiley(smc, Args[0]);
                            } else
                            {
                                if (!PowSm(smc, Args, 19, todo.Users[uid].Powers))
                                {
                                    smc.u = u;
                                    if (todo.bMobile)
                                    {
                                        return (false);
                                    };
                                };
                                smc.SA = Code;
                                if (!SmB)
                                {
                                    smc.SP = (smc.SP | smiley.b_glow);
                                };
                                if (!todo.bMobile)
                                {
                                    smc.ns = new smiley(smc, t, ((mc.size) ? mc.size : 20));
                                };
                                if (todo.bMobile)
                                {
                                    smc = Code;
                                };
                            };
                            if (!(smc is String))
                            {
                                smc.x = (smc.x + xatlib.xInt(smc.xx));
                            };
                        };
                        if (!HTxt)
                        {
                            HTxt = s.toUpperCase();
                        };
                        if (G)
                        {
                            HTxt = 0;
                            if (t == 10200)
                            {
                                HTxt = " ";
                            } else
                            {
                                HTxt = xconst.ST(143);
                                if ((((((t > 50000)) && ((t < 60000)))) && (!(todo.HasPowerA(todo.w_GroupPowers, (t % 50000))))))
                                {
                                    t = undefined;
                                };
                                smc.xNum = t;
                            };
                        };
                        if (((!(todo.bMobile)) && ((smc.SF & 128))))
                        {
                            smc.addEventListener(MouseEvent.MOUSE_DOWN, DoSound);
                        };
                    };
                };
                if (c0 == "<")
                {
                    if (s == "<del>")
                    {
                        smc = new library("xdelete");
                        smc.y = 6;
                        smc.DeleteNumber = DeleteNumber;
                        if (!todo.bMobile)
                        {
                            smc.addEventListener(MouseEvent.MOUSE_DOWN, DeleteMess);
                        };
                        smc.Flags = 1;
                        HTxt = xconst.ST(1);
                    };
                    if (s == "<o>")
                    {
                        smc = new chatter2();
                        smc.Go();
                        if (!todo.bMobile)
                        {
                            smc.addEventListener(MouseEvent.MOUSE_DOWN, function ()
                            {
                                main.openDialog(1);
                            });
                        };
                        smc.Flags = 2;
                    };
                    if (s == "<priv>")
                    {
                        smc = new lock();
                        smc.hint = {
                            "Hint":xconst.ST(20),
                            "mc":smc
                        };
                        if (!todo.bMobile)
                        {
                            smc.addEventListener(MouseEvent.ROLL_OVER, main.hint.EasyHint);
                        };
                        smc.Flags = 4;
                    };
                    if (s == "<i>")
                    {
                        smc = new library("HelpIcon");
                        smc.xitem.ques.visible = false;
                    };
                    if (s == "<inf8>")
                    {
                        smc = new library("HelpIcon");
                        smc.xitem.ques.visible = false;
                        xatlib.McSetRGB(smc.xitem.infob, 0x9900);
                    };
                    if (s == "<ho>")
                    {
                        if (todo.Users[uid].h.length > 0)
                        {
                            smc = new library("ho");
                            smc.scaleX = (smc.scaleY = 0.4);
                            smc.y = 5;
                            HTxt = (smc.HomePage = todo.Users[uid].h);
                            if (!todo.bMobile)
                            {
                                smc.addEventListener(MouseEvent.MOUSE_DOWN, OnHomePage);
                            };
                            smc.Flags = 1;
                        };
                    };
                    if (s == "<c>")
                    {
                        Col = -1;
                        if (todo.Users[userid].member)
                        {
                            Col = 6645247;
                            HTxt = xconst.ST(22);
                            if (todo.HasPower(userid, 30))
                            {
                                Col = 16716947;
                            };
                            if (todo.HasPower(userid, 64))
                            {
                                Col = 128;
                            };
                        };
                        if (todo.Users[userid].moderator)
                        {
                            Col = 0xFFFFFF;
                            HTxt = xconst.ST(23);
                        };
                        if (todo.Users[userid].owner)
                        {
                            Col = 0xFF9900;
                            HTxt = xconst.ST(24);
                        };
                        if (todo.Users[userid].mainowner)
                        {
                            Col = 0xFF9900;
                            HTxt = xconst.ST(134);
                        };
                        if (todo.Users[userid].Stealth)
                        {
                            Col = -1;
                        } else
                        {
                            if ((todo.Users[userid].aFlags & (1 << 21)))
                            {
                                Col = 1304549;
                                HTxt = xconst.ST(251);
                            } else
                            {
                                if (todo.Users[userid].u == 42)
                                {
                                    Col = 1;
                                    HTxt = "xat staff";
                                } else
                                {
                                    if (todo.HasPower(userid, 95))
                                    {
                                        Col = 14423100;
                                    } else
                                    {
                                        if (todo.HasPower(userid, 153))
                                        {
                                            Col = 16041823;
                                        } else
                                        {
                                            if (todo.HasPower(userid, 35))
                                            {
                                                Col = 0x800080;
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        if (todo.Users[userid].ignored)
                        {
                            Col = 0x606060;
                        };
                        if (Col >= 0)
                        {
                            smc = new chatter2();
                            smc.ColP1 = Col;
                            smc.Size = 16;
                            if (Col == 16041823)
                            {
                                smc.Pawn = "p1gold";
                            };
                            if (Col == 14423100)
                            {
                                smc.Pawn = "p1ruby";
                            };
                            if (todo.Users[userid].friend == 3)
                            {
                                smc.Pawn = "p1foe";
                            };
                            smc.Go();
                            smc.y = 4;
                            smc.Flags = 2;
                        };
                    };
                };
            };
            if (((mc) && (smc)))
            {
                mc.addChild(smc);
            };
            var Clicker:* = smc;
            if (((((!(todo.bMobile)) && (HTxt))) && (smc)))
            {
                smc.Hint = HTxt;
                if (((smc.ns) && (smc.ns.Clicker)))
                {
                    smc.mouseEnabled = false;
                    Clicker = smc.ns.Clicker;
                    Clicker.Par = smc;
                };
                Clicker.addEventListener(MouseEvent.ROLL_OVER, smc_onRollOver);
                Clicker.addEventListener(MouseEvent.ROLL_OUT, smc_onRollOut);
                if (((!(todo.bThin)) && ((HTxt.substr(0, 14) == "(RADIO#HTTP://"))))
                {
                    s2 = HTxt.split("#");
                    s2 = s2[1].split(")");
                    smc.Radio = s2[0];
                    if (((((!(Ronce)) && ((Pos == 2)))) && ((u == todo.w_userno))))
                    {
                        Ronce = 1;
                        if (todo.useRadio == undefined)
                        {
                            todo.useRadio = smc.Radio;
                            chat.mainDlg.CreateSoundIcon("Radio", 2);
                        };
                        todo.useRadio = smc.Radio;
                    };
                };
                t = HTxt.substr(1);
                t = t.split(")");
                t = t[0].split("#");
                t = t[0].toLowerCase();
                t = xconst.pssh[t];
                if (xconst.IsGroup[t])
                {
                    smc.Power = t;
                };
                Clicker.addEventListener(MouseEvent.MOUSE_DOWN, smc_onPress);
            };
            if ((((Pos & 1)) && (!((smc == undefined)))))
            {
                smc.UserNo = undefined;
            };
            if (((!(todo.bMobile)) && (Clicker)))
            {
                Clicker.buttonMode = true;
            };
            return (smc);
        }

        static function smc_onRollOver(_arg_1:MouseEvent)
        {
            var _local_2:* = _arg_1.currentTarget;
            if (_local_2.Par)
            {
                _local_2 = _local_2.Par;
            };
            main.hint.Hint(0, 0, _local_2.Hint, true, 0, undefined, 0, _local_2);
        }

        static function smc_onRollOut(_arg_1:MouseEvent)
        {
            main.hint.HintOff();
        }

        public static function OnHomePage(_arg_1:MouseEvent)
        {
            var _local_2:String = _arg_1.currentTarget.HomePage;
            if (!_local_2)
            {
                return;
            };
            if (_local_2.substr(0, 4).toLowerCase() != "http")
            {
                _local_2 = ("//" + _local_2);
            };
            _local_2 = xatlib.xatlinks(_local_2);
            if (chat.isKeyDown(Keyboard.SHIFT))
            {
                _local_2 = (_local_2 + "&f=1");
            };
            xatlib.UrlPopup(xconst.ST(21), _local_2);
        }

        public static function DeleteMess(_arg_1:MouseEvent)
        {
            main.hint.HintOff();
            var _local_2:* = todo.Message.length;
            var _local_3:* = 0;
            while (_local_3 < _local_2)
            {
                if (todo.Message[_local_3].n == _arg_1.currentTarget.DeleteNumber)
                {
                    todo.Message[_local_3].ignored = true;
                };
                _local_3++;
            };
            network.RemoveUsersWithNoMessages();
            network.NetworkDeleteMessage(_arg_1.currentTarget.DeleteNumber);
            todo.DoUpdateMessages = true;
            todo.DoBuildUserList = true;
        }

        public static function smc_onPress(e:MouseEvent)
        {
            var t:* = undefined;
            var self:* = undefined;
            var Dia:* = undefined;
            var w:* = undefined;
            var h:* = undefined;
            var x:* = undefined;
            var y:* = undefined;
            var f:* = undefined;
            var d:* = undefined;
            var w1:* = undefined;
            var w2:* = undefined;
            var buth:* = undefined;
            t = e.currentTarget;
            if (t.Par)
            {
                t = t.Par;
            };
            main.hint.HintOff();
            if (t.t)
            {
                t.t.Press();
            };
            if (t.Radio != undefined)
            {
                if (todo.useRadio == undefined)
                {
                    todo.useRadio = t.Radio;
                    chat.mainDlg.CreateSoundIcon("Radio", 2);
                };
                todo.useRadio = t.Radio;
                return;
            };
            if (t.Gifts)
            {
                OpenGifts(t.Gifts);
            } else
            {
                if (t.xNum)
                {
                    if ((global.xc & 0x0800))
                    {
                        global.gUserNo = t.UserNo;
                        main.mcLoad.OpenByN(t.xNum);
                    } else
                    {
                        xatlib.GotoXat(t.xNum);
                    };
                } else
                {
                    if (t.UserNo)
                    {
                        PressUserName(t.UserNo, e.ctrlKey);
                    } else
                    {
                        if (t.Power != undefined)
                        {
                            self = xatlib.FindUser(todo.w_userno);
                            if (todo.HasPower(self, t.Power))
                            {
                                xatlib.GeneralMessage(xconst.ST(237), xconst.ST(238, xconst.pssa[(t.Power + 1)]), 0);
                                Dia = main.box_layer.GeneralMessageH.Dia;
                                w = Dia.DiaBack.width;
                                h = Dia.DiaBack.height;
                                x = Dia.DiaBack.x;
                                y = Dia.DiaBack.y;
                                f = 8;
                                d = int((w / ((f * 2) + 3)));
                                w1 = int(((w * f) / ((f * 2) + 3)));
                                w2 = w1;
                                buth = 22;
                                new xBut(Dia, (((x + w) - d) - w1), (((y + h) - buth) - 20), w1, buth, "UnAssign", function (_arg_1:*)
                                {
                                    AssignRel(0, t);
                                });
                                new xBut(Dia, (x + d), (((y + h) - buth) - 20), w2, buth, "Assign", function (_arg_1:*)
                                {
                                    AssignRel(1, t);
                                });
                            };
                        };
                    };
                };
            };
        }

        public static function OpenGifts(_arg_1:*, _arg_2:int=1)
        {
            var _local_3:* = xatlib.FindUser(_arg_1);
            if (_local_3 < 0)
            {
                return;
            };
            chat.mainDlg.UpdateBackground(0, _arg_1);
            todo.config["giftid"] = (((_arg_1 + ",") + ((todo.Users[_local_3].registered) ? todo.Users[_local_3].registered : "")) + (((_arg_1)==todo.w_userno) ? ((("," + todo.w_d3) + ",") + todo.w_dt) : ""));
            if (_arg_2 == 0)
            {
                return;
            };
            if (_arg_2 == 2)
            {
                if (chat.sending_lc)
                {
                    chat.sending_lc.send(chat.fromxat, "onMsg", 9, "config", todo.config);
                };
                return;
            };
            if ((global.xc & 0x0800))
            {
                main.mcLoad.OpenByN(20044);
            } else
            {
            };
        }

        private static function AssignRel(_arg_1:*, _arg_2:*)
        {
            main.box_layer.GeneralMessageH.Delete();
            var _local_3:* = new XMLDocument();
            var _local_4:* = _local_3.createElement("ap");
            _local_4.attributes.p = xatlib.xInt(_arg_2.Power).toString();
            _local_4.attributes.a = _arg_1;
            _local_3.appendChild(_local_4);
            var _local_5:String = xatlib.XMLOrder(_local_3, new Array("p", "a"));
            network.socket.send(_local_5);
        }

        public static function SmilieLoad(_arg_1:Event)
        {
            _arg_1.currentTarget.del--;
            if (_arg_1.currentTarget.del < 0)
            {
                _arg_1.currentTarget.ns = new smiley(_arg_1.currentTarget, _arg_1.currentTarget.t);
                _arg_1.currentTarget.removeEventListener(Event.ENTER_FRAME, SmilieLoad);
            };
        }

        public static function DoSound(_arg_1:MouseEvent)
        {
            if (_arg_1.currentTarget.SF)
            {
                main.PlayMusic(_arg_1.currentTarget.SA);
                return;
            };
            main.ProcessSounds(_arg_1.currentTarget.Snd, true);
        }

        public static function BuildUserList()
        {
            var _local_7:*;
            var _local_8:*;
            var _local_12:*;
            var _local_13:*;
            var _local_14:*;
            var _local_15:*;
            var _local_16:*;
            var _local_17:*;
            var _local_18:Boolean;
            var _local_19:*;
            var _local_20:*;
            var _local_21:*;
            var _local_1:* = getTimer();
            var _local_2:* = -1;
            var _local_3:Boolean = ((((!(main.ctabsmc.TabIsPrivate())) && ((todo.Pools.length > 1)))) && (main.utabsmc.tabs[0].Main));
            DeleteUserList();
            var _local_4:* = getTimer();
            var _local_5:* = new Object();
            var _local_6:* = todo.Users.length;
            poin = new Array();
            if (((main.utabsmc.tabs[0].Main) || (main.utabsmc.tabs[1].Main)))
            {
                _local_7 = 0;
                while (_local_7 < _local_6)
                {
                    _local_12 = 0;
                    if (todo.Users[_local_7].u == todo.w_userno)
                    {
                        _local_12 = 40000;
                    };
                    if (todo.Users[_local_7].online == true)
                    {
                        _local_12 = (_local_12 + 20000);
                    } else
                    {
                        if ((((main.utabsmc.tabs[1].Main == true)) && ((todo.Users[_local_7].onsuper == true))))
                        {
                            _local_12 = (_local_12 + 20000);
                        };
                    };
                    if (!((todo.Users[_local_7].banned) && (!((todo.Users[_local_7].flag0 & 131072)))))
                    {
                        _local_12 = (_local_12 + 10000);
                    };
                    if (!todo.Users[_local_7].Stealth)
                    {
                        if (todo.Users[_local_7].mainowner)
                        {
                            _local_12 = (_local_12 + 4800);
                        };
                        if (todo.Users[_local_7].owner)
                        {
                            _local_12 = (_local_12 + 3600);
                        };
                        if (todo.Users[_local_7].moderator)
                        {
                            _local_12 = (_local_12 + 2400);
                        };
                        if (todo.Users[_local_7].member)
                        {
                            _local_12 = (_local_12 + 1200);
                        };
                    };
                    if (todo.Users[_local_7].friend)
                    {
                        _local_12 = (_local_12 + 600);
                    };
                    if (todo.HasPower(_local_7, 35))
                    {
                        _local_12 = (_local_12 + 400);
                    } else
                    {
                        if (todo.HasPower(_local_7, 1))
                        {
                            _local_12 = (_local_12 + 300);
                        };
                    };
                    if (todo.Users[_local_7].registered != undefined)
                    {
                        _local_14 = todo.Users[_local_7].registered.length;
                        if (_local_14 <= 9)
                        {
                            _local_12 = (_local_12 + (150 - _local_14));
                        };
                    };
                    if (todo.Users[_local_7].OnXat)
                    {
                        _local_12 = (_local_12 + 75);
                    };
                    _local_13 = todo.HasPower(_local_7, 9);
                    if (!_local_13)
                    {
                        if (todo.Users[_local_7].registered)
                        {
                            _local_12 = (_local_12 + 38);
                        };
                    };
                    _local_12 = (_local_12 + 16);
                    _local_12 = (_local_12 * 50000000000);
                    _local_12 = (_local_12 - (todo.Users[_local_7].u * 2));
                    _local_12 = (_local_12 * 2);
                    poin.push({
                        "points":_local_12,
                        "index":_local_7
                    });
                    if (todo.Users[_local_7].Bride)
                    {
                        _local_5[todo.Users[_local_7].u] = {
                            "b":todo.Users[_local_7].Bride,
                            "index":(poin.length - 1)
                        };
                    };
                    _local_7++;
                };
                for (_local_7 in _local_5)
                {
                    _local_8 = _local_5[_local_7].b;
                    if (((_local_5[_local_8]) && ((_local_7 == _local_5[_local_8].b))))
                    {
                        _local_15 = poin[_local_5[_local_7].index].points;
                        _local_16 = poin[_local_5[_local_8].index].points;
                        if (_local_15 > _local_16)
                        {
                            poin[_local_5[_local_8].index].points = (_local_15 - 1);
                        } else
                        {
                            poin[_local_5[_local_7].index].points = (_local_16 - 1);
                        };
                    };
                };
            } else
            {
                _local_7 = 0;
                while (_local_7 < _local_6)
                {
                    poin.push({
                        "points":todo.Users[_local_7].TickCnt,
                        "index":_local_7
                    });
                    _local_7++;
                };
            };
            poin.sortOn("points", (Array.DESCENDING | Array.NUMERIC));
            if (todo.DoBuildUserListScrollUp)
            {
                if (((!(todo.bMobile)) && (!((main.uscrollmc.Scrolling == true)))))
                {
                    main.uscrollmc.position = 0;
                    main.onUserScrollChange();
                };
            };
            var _local_9:* = 0;
            if (_local_3)
            {
                _local_9 = main.LookupPool(todo.w_pool);
                AddPoolToList(_local_9);
            };
            useryc2 = useryc;
            var _local_10:* = todo.Users.length;
            var _local_11:* = 0;
            while (_local_11 < _local_10)
            {
                _local_17 = poin[_local_11].index;
                todo.Users[_local_17].Vis = false;
                todo.Users[_local_17].ignored = network.OnIgnoreList(todo.Users[_local_17].u);
                if (todo.Users[_local_17].u != -1)
                {
                    _local_18 = false;
                    if (main.utabsmc.tabs[1].Main)
                    {
                        _local_18 = ((todo.Users[_local_17].friend) || ((xatlib.xInt(todo.Users[_local_17].Location) >= 128)));
                        if (todo.Users[_local_17].u == todo.w_userno)
                        {
                            _local_18 = false;
                        };
                    } else
                    {
                        if (main.utabsmc.tabs[0].Main)
                        {
                            if (main.ctabsmc.TabIsPrivate())
                            {
                                if (main.ctabsmc.TabUser() == todo.Users[_local_17].u)
                                {
                                    _local_18 = true;
                                };
                            } else
                            {
                                _local_18 = !((todo.Users[_local_17].online == undefined));
                                _local_19 = todo.Message.length;
                                if ((((todo.Users[_local_17].online == false)) && ((_local_19 < 40))))
                                {
                                    _local_18 = false;
                                    _local_20 = 0;
                                    while (_local_20 < _local_19)
                                    {
                                        if ((todo.Message[_local_20].u == todo.Users[_local_17].u))
                                        {
                                            _local_18 = true;
                                            break;
                                        };
                                        _local_20++;
                                    };
                                };
                            };
                            if (todo.w_userno == todo.Users[_local_17].u)
                            {
                                _local_18 = true;
                            };
                        } else
                        {
                            _local_18 = todo.Users[_local_17].TickCnt;
                        };
                    };
                    if (_local_18)
                    {
                        todo.Users[_local_17].Vis = true;
                        DoBride(_local_17);
                        if ((((((_local_2 >= 0)) && ((todo.Users[_local_17].Bride == todo.Users[_local_2].u)))) && ((todo.Users[_local_2].Bride == todo.Users[_local_17].u))))
                        {
                            DoBride(_local_17, 1);
                            DoBride(_local_2, 1);
                            if ((todo.Users[_local_17].aFlags & 1))
                            {
                                todo.Users[_local_2].M_St = (todo.Users[_local_2].M_St | 16);
                            } else
                            {
                                todo.Users[_local_2].M_St = (todo.Users[_local_2].M_St | 32);
                            };
                        };
                        AddUserToList(_local_2);
                        _local_2 = _local_17;
                    };
                };
                _local_11++;
            };
            AddUserToList(_local_2);
            if (_local_3)
            {
                _local_21 = 0;
                while (_local_21 < todo.Pools.length)
                {
                    if (_local_21 != _local_9)
                    {
                        AddPoolToList(_local_21);
                    };
                    _local_21++;
                };
            };
            useryc3 = useryc;
        }

        public static function DoBride(_arg_1:*, _arg_2:*=0)
        {
            todo.Users[_arg_1].M_St = 0;
            if (todo.Users[_arg_1].registered == undefined)
            {
                return;
            };
            if (todo.HasPower(_arg_1, 9))
            {
                return;
            };
            if (((todo.Users[_arg_1].Bride) && (!(_arg_2))))
            {
                if ((todo.Users[_arg_1].aFlags & 1))
                {
                    todo.Users[_arg_1].M_St = 4;
                } else
                {
                    todo.Users[_arg_1].M_St = 2;
                };
            } else
            {
                todo.Users[_arg_1].M_St = 1;
            };
            if (((!(todo.Users[_arg_1].VIP)) || (todo.HasPower(_arg_1, 2))))
            {
                todo.Users[_arg_1].M_St = (todo.Users[_arg_1].M_St | 8);
            };
            todo.Users[_arg_1].M_St = (todo.Users[_arg_1].M_St | 128);
        }

        public static function ClearLists(_arg_1:Boolean)
        {
            var _local_4:*;
            var _local_5:*;
            var _local_2:* = 0;
            var _local_3:* = todo.Message.length;
            p = null;
            _local_5 = 0;
            while (_local_5 < _local_3)
            {
                if ((todo.Message[_local_2].s & 2))
                {
                    _local_2++;
                } else
                {
                    xmessage.DeleteOneMessageMc(_local_2);
                    todo.Message.splice(_local_2, 1);
                };
                _local_5++;
            };
            DeleteUserList(1);
            _local_4 = 0;
            while (_local_4 < todo.Users.length)
            {
                if (((((_arg_1) || (!((todo.Users[_local_4].u == todo.w_userno))))) && ((xatlib.xInt(todo.Users[_local_4].Location) < 128))))
                {
                    todo.Users.splice(_local_4, 1);
                } else
                {
                    _local_4++;
                };
            };
        }

        public static function DeleteOneUserMc(_arg_1:Number)
        {
            if (_arg_1 < 0)
            {
                return;
            };
            var _local_2:* = todo.Users[_arg_1];
            if (!_local_2)
            {
                return;
            };
            if (!_local_2.mc)
            {
                return;
            };
            if (((_local_2.mc.av1) && (_local_2.mc.parent)))
            {
                _local_2.mc.parent.removeChild(_local_2.mc.av1);
            };
            _local_2.mc.av1 = undefined;
            if (_local_2.mc.parent)
            {
                _local_2.mc.parent.removeChild(_local_2.mc);
            };
            _local_2.mc = undefined;
            todo.DoBuildUserList = true;
        }

        public static function DeleteUserList(_arg_1:*=false)
        {
            var _local_4:*;
            useryc = 9;
            while (1)
            {
                _local_4 = main.uMessLst.pop();
                if (!_local_4) break;
                if (_local_4.av1 != undefined)
                {
                    _local_4.removeChild(_local_4.av1);
                };
                if (_local_4.parent)
                {
                    _local_4.parent.removeChild(_local_4);
                };
            };
            var _local_2:* = todo.Users.length;
            var _local_3:* = 0;
            while (_local_3 < _local_2)
            {
                if (_arg_1)
                {
                    DeleteOneUserMc(_local_3);
                } else
                {
                    if (todo.Users[_local_3] != undefined)
                    {
                        if (todo.Users[_local_3].mc != undefined)
                        {
                            todo.Users[_local_3].mc.visible = false;
                            if (todo.Users[_local_3].mc.av1 != undefined)
                            {
                                todo.Users[_local_3].mc.av1.visible = false;
                                if (todo.Users[_local_3].mc.av1.Gag)
                                {
                                    todo.Users[_local_3].mc.av1.HatsOff();
                                };
                            };
                        };
                    };
                };
                _local_3++;
            };
        }

        public static function AddPoolToList(_arg_1:Number)
        {
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            if (main.utabsmc.tabs[0].Main == false)
            {
                return;
            };
            var _local_2:int = xatlib.xInt(todo.Pools[_arg_1]);
            var _local_3:* = xatlib.xInt(((xatlib.xInt(todo.w_useroom) + _local_2) % xconst.pool1.length));
            var _local_4:* = xatlib.xInt((xatlib.xInt(todo.w_useroom) - _local_2));
            if (_local_4 < 0)
            {
                _local_4 = (2147483647 - _local_4);
            };
            _local_4 = (_local_4 % xconst.pool2.length);
            var _local_5:* = ((xconst.pool1[_local_3] + " ") + xconst.pool2[_local_4]);
            if ((((_local_2 < 3)) && (((_local_6 = todo.gconfig["g114"]) is Object))))
            {
                switch (_local_2)
                {
                    case 0:
                        _local_7 = _local_6["m"];
                        break;
                    case 1:
                        _local_7 = _local_6["t"];
                        break;
                    case 2:
                        if (todo.HasPowerA(todo.w_GroupPowers, 126))
                        {
                            _local_7 = _local_6["b"];
                        };
                        break;
                };
                if (((_local_7) && ((_local_7.length > 2))))
                {
                    _local_5 = _local_7;
                    if (_local_2 >= 1)
                    {
                        _local_8 = (((_local_2 == 1)) ? xatlib.RankColor(xatlib.NoToRank(_local_6["rnk"])) : 0x964B00);
                    };
                };
            };
            var _local_9:* = new xBut(main.mcuserbackground, 4, (useryc + 3), (main.upw - xatlib.NX(24)), 20, _local_5, PoolPressed, 0, 5);
            if (_local_8)
            {
                xatlib.McSetRGB(_local_9.but_back, _local_8);
                _local_9.SetTextCol(0);
            };
            _local_9.But.w = _arg_1;
            main.uMessLst.push(_local_9);
            useryc = (useryc + 23);
        }

        public static function PoolPressed(_arg_1:MouseEvent)
        {
            if (todo.Pools[_arg_1.currentTarget.w] != todo.w_pool)
            {
                network.NetworkSetPool(todo.Pools[_arg_1.currentTarget.w]);
            };
        }

        public static function AddUserToList(_arg_1:Number)
        {
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            var _local_12:*;
            var _local_13:*;
            var _local_14:*;
            var _local_15:*;
            var _local_16:*;
            var _local_17:*;
            var _local_18:*;
            var _local_19:*;
            var _local_20:*;
            var _local_21:*;
            var _local_22:*;
            var _local_23:*;
            if (_arg_1 < 0)
            {
                return;
            };
            var _local_2:Number = todo.Users[_arg_1].u;
            var _local_3:String = todo.Users[_arg_1].n;
            if (todo.HasPowerA(todo.w_Powers, 344, todo.w_Mask))
            {
                _local_3 = xatlib.GetNick(_local_3, _local_2);
            };
            var _local_4:* = 0;
            var _local_5:* = ((((((todo.Users[_arg_1].s) && (todo.HasPower(_arg_1, 54)))) && ((((todo.Macros == undefined)) || ((todo.Macros["SetStatus"] == undefined)))))) && (!(todo.Users[_arg_1].banned)));
            if (!_local_5)
            {
                delete todo.Users[_arg_1].s;
            };
            var _local_6:* = undefined;
            if (((main.utabsmc.tabs[2]) && (main.utabsmc.tabs[2].Main)))
            {
                _local_6 = "tickle";
            };
            if (((((((((((((((((main.utabsmc.tabs[0].Main) && ((xconst.f_Live & todo.FlagBits)))) && (!(todo.Users[_arg_1].mainowner)))) && (!(todo.Users[_arg_1].owner)))) && (!(todo.Users[_arg_1].moderator)))) && (!(todo.Users[_arg_1].member)))) && (!((todo.Users[_arg_1].u == 0xFFFFFFFF))))) && (!((todo.Users[_arg_1].u == todo.w_userno))))) && (!((todo.Users[_arg_1].u == 0)))))
            {
                return;
            };
            _local_3 = ("<l>" + _local_3);
            var _local_7:* = (((useryc < ((main.uph + main.uscrollmc.Scr_position) + 16))) && ((useryc > (main.uscrollmc.Scr_position - 16))));
            if (((!(_local_7)) && (!((todo.Users[_arg_1].mc == undefined)))))
            {
                DeleteOneUserMc(_arg_1);
            };
            if ((((todo.Users[_arg_1].mc == undefined)) && (_local_7)))
            {
                if (_local_6)
                {
                    _local_8 = new xSprite();
                    new smiley(_local_8, _local_6);
                } else
                {
                    _local_8 = new chatter2();
                    _local_8.Options = 0x80000000;
                    if ((((_local_2 == todo.w_userno)) && ((todo.Users[_arg_1].flag0 & 0x0400))))
                    {
                        _local_8.alpha = 0.2;
                    };
                    _local_12 = undefined;
                    _local_13 = 0xC000;
                    if ((todo.Users[_arg_1].flag0 & 0x0800))
                    {
                        _local_8.Options = (_local_8.Options | chatter2.Mob);
                    };
                    _local_14 = true;
                    if (main.utabsmc.tabs[0].Main == true)
                    {
                        if (todo.Users[_arg_1].online)
                        {
                            if (todo.HasPower(_arg_1, 30))
                            {
                                _local_12 = 16738740;
                            };
                            if (todo.HasPower(_arg_1, 64))
                            {
                                _local_12 = 128;
                            };
                            if (todo.Users[_arg_1].member)
                            {
                                _local_13 = 6645247;
                            };
                            if (todo.Users[_arg_1].moderator)
                            {
                                _local_14 = false;
                                _local_13 = 0xFFFFFF;
                            };
                            if (!todo.Users[_arg_1].Stealth)
                            {
                                if (((todo.Users[_arg_1].owner) || (todo.Users[_arg_1].mainowner)))
                                {
                                    _local_14 = false;
                                    _local_13 = 0xFF9900;
                                };
                            };
                            if (todo.HasPower(_arg_1, 35))
                            {
                                _local_14 = true;
                                _local_12 = 0x800080;
                            };
                            if (todo.HasPower(_arg_1, 153))
                            {
                                _local_14 = true;
                                _local_12 = 16041823;
                            };
                            if (todo.HasPower(_arg_1, 95))
                            {
                                _local_14 = true;
                                _local_12 = 14423100;
                            };
                            if (todo.Users[_arg_1].u == 42)
                            {
                                _local_14 = true;
                                _local_12 = 1;
                            };
                            if ((todo.Users[_arg_1].aFlags & (1 << 21)))
                            {
                                _local_14 = true;
                                _local_12 = 1304549;
                            };
                            if (((!(todo.HasPower(_arg_1, 67))) || (todo.bThin)))
                            {
                                if (((!(_local_14)) || ((_local_12 == undefined))))
                                {
                                    _local_12 = _local_13;
                                };
                                _local_13 = undefined;
                            };
                        } else
                        {
                            if (((!(main.ctabsmc.TabIsPrivate())) || (!((todo.Users[_arg_1].onsuper == true)))))
                            {
                                _local_13 = 0xFF0000;
                            };
                        };
                        if (_local_13 != 0xFF0000)
                        {
                            if (todo.Users[_arg_1].ignored)
                            {
                                _local_13 = 0x606060;
                                _local_12 = undefined;
                            };
                            if (((todo.Users[_arg_1].banned) && (!((todo.Users[_arg_1].flag0 & 131072)))))
                            {
                                _local_13 = 0x964B00;
                                _local_12 = undefined;
                            };
                        };
                    } else
                    {
                        if (todo.Users[_arg_1].ignored)
                        {
                            _local_13 = 0x606060;
                        };
                        if (todo.Users[_arg_1].onsuper != true)
                        {
                            _local_13 = 0xFF0000;
                        } else
                        {
                            if (todo.Users[_arg_1].available)
                            {
                                _local_13 = 0xFF5800;
                            };
                        };
                    };
                    if (_local_12 == undefined)
                    {
                        _local_12 = _local_13;
                        _local_13 = undefined;
                    };
                    _local_8.ColP1 = _local_12;
                    _local_8.ColP2 = _local_13;
                };
                _local_8.UserNo = _local_2;
                main.mcuserbackground.addChild(_local_8);
                _local_8.x = 5;
                _local_8.addEventListener(MouseEvent.ROLL_OVER, ChatterRollover);
                _local_8.addEventListener(MouseEvent.ROLL_OUT, main.hint.HintOff);
                _local_8.addEventListener(MouseEvent.MOUSE_DOWN, ChatterOnPress);
                _local_8.buttonMode = true;
                if (todo.HasPower(_arg_1, 12))
                {
                    while (1)
                    {
                        _local_15 = todo.Users[_arg_1].n.split("(hat");
                        if (_local_15[1] != undefined)
                        {
                            _local_15 = _local_15[1].split(")");
                            _local_16 = _local_15[0].split("#");
                            if (!_local_16[1]) break;
                            _local_17 = _local_16[1].charAt(0);
                            if (((xconst.Pawns) && ((network.YC < xconst.Pawns["time"]))))
                            {
                                _local_19 = _local_16[1].charAt(1);
                                if (((xconst.Pawns[_local_19]) && (todo.HasPower(_arg_1, xconst.Pawns[_local_19][0]))))
                                {
                                    _local_8.Pawn = xconst.Pawns[_local_19][1];
                                };
                                if (_local_17 == "h") break;
                                _local_16[1] = _local_17;
                            };
                            _local_18 = (todo.Users[_arg_1].Powers[0] & 1);
                            if ((((_local_17 == "g")) && (todo.HasPower(_arg_1, -3))))
                            {
                                _local_18 = (_local_18 | 2);
                            };
                            if (((((!((_local_16[1] == "z"))) || (!(todo.HasPower(_arg_1, 99))))) || (todo.Users[_arg_1].Bride)))
                            {
                                _local_8.Hat = ((((_local_18 + ";") + xatlib.DecodeColor(_local_16[2])) + ";") + _local_16[1]);
                            } else
                            {
                                _local_8.Options = (_local_8.Options | chatter2.Single);
                            };
                        };
                        break;
                    };
                };
                if (((todo.foe) && ((todo.Users[_arg_1].friend == 3))))
                {
                    _local_8.Pawn = "p1foe";
                } else
                {
                    if ((todo.Users[_arg_1].flag0 & 0x2000))
                    {
                        _local_8.Pawn = "p1bot";
                        if (todo.HasPower(_arg_1, 95))
                        {
                            _local_8.Pawn = (_local_8.Pawn + "ruby");
                        };
                    };
                    if (!_local_8.Pawn)
                    {
                        if (_local_12 == 16041823)
                        {
                            _local_8.Pawn = "p1gold";
                        };
                        if (_local_12 == 14423100)
                        {
                            _local_8.Pawn = "p1ruby";
                        };
                        if ((todo.Users[_arg_1].flag0 & 262144))
                        {
                            _local_8.Pawn = "p1badge";
                        };
                    };
                };
                if (todo.Users[_arg_1].w == 184)
                {
                    _local_8.Pawn = "p1zip";
                };
                if (todo.Users[_arg_1].w == 176)
                {
                    _local_8.flag2 = 1;
                };
                _local_9 = new MovieClip();
                main.mcuserbackground.addChild(_local_9);
                _local_9.x = _local_8.x;
                todo.Users[_arg_1].mc = _local_9;
                todo.Users[_arg_1].mc.av1 = _local_8;
                _local_10 = [];
                if (todo.HasPower(_arg_1, 21))
                {
                    _local_10 = NameCol(_arg_1);
                };
                if ((((_local_2 == todo.w_userno)) || (todo.Users[_arg_1].friend)))
                {
                    _local_3 = (("<b> " + _local_3) + " <b>");
                };
                if (((((((todo.Users[_arg_1].banned) && (!(todo.Users[_arg_1].friend)))) && (!(todo.Users[_arg_1].w)))) || (todo.Users[_arg_1].forever)))
                {
                    if ((todo.Users[_arg_1].flag0 & 0x1000))
                    {
                        _local_3 = ("<l>" + xconst.ST(236));
                    } else
                    {
                        _local_3 = ("<l>" + xconst.ST(25));
                    };
                };
                _local_11 = xatlib.xInt(todo.Users[_arg_1].xNum);
                if (xatlib.xInt(todo.Users[_arg_1].Location) >= 128)
                {
                    _local_11 = (10000 + todo.Users[_arg_1].Location);
                };
                if (_local_11)
                {
                    _local_3 = (((((((_local_10[1] == undefined)) ? " " : "") + "(>") + _local_11) + ") ") + _local_3);
                };
                todo.Random = xatlib.xRand(1, 9999);
                _local_4 = AddMessageToMc(_local_9, 2, _local_3, ((0 + 17) - 5), 1999, ((_local_5) ? -10 : -5), _local_2, undefined, _local_10[0], _local_10[1]);
                if (_local_5)
                {
                    if (todo.HasPower(_arg_1, 231))
                    {
                        _local_10 = NameCol(_arg_1, 297);
                        _local_20 = _local_10[0];
                        _local_21 = _local_10[1];
                    };
                    if (_local_20 == undefined)
                    {
                        _local_20 = 0;
                    };
                    _local_23 = new TextField();
                    _local_23.x = (4 + 12);
                    if (_local_11)
                    {
                        _local_23.x = (_local_23.x + 19);
                    };
                    _local_23.y = (16 - 10);
                    _local_23.width = 200;
                    _local_23.height = 20;
                    main.fmts.color = _local_20;
                    _local_23.defaultTextFormat = main.fmts;
                    _local_22 = todo.Users[_arg_1].s.split("#");
                    _local_23.text = _local_22[0];
                    if (_local_21 != undefined)
                    {
                        _local_23.filters = [new GlowFilter(_local_21, 0.7, 1.5, 1.5, 3, 3, false, false)];
                    };
                    _local_9.addChild(_local_23);
                };
            };
            if (((!((todo.Users[_arg_1].mc == undefined))) && (!((todo.Users[_arg_1].mc.av1 == undefined)))))
            {
                _local_8 = todo.Users[_arg_1].mc.av1;
                _local_8.Options = (_local_8.Options & ((chatter2.Mob | chatter2.Single) | chatter2.flash));
                if (todo.Users[_arg_1].gagged)
                {
                    _local_8.Options = (_local_8.Options | chatter2.Gag);
                };
                if ((todo.Users[_arg_1].flag0 & 0x0200))
                {
                    _local_8.Options = (_local_8.Options | chatter2.sinbin);
                };
                todo.Users[_arg_1].mc.visible = true;
                todo.Users[_arg_1].mc.av1.visible = true;
                _local_8.flag0 = todo.Users[_arg_1].flag0;
                _local_22 = (useryc + 5);
                if (_local_5)
                {
                    _local_22 = (_local_22 + 6);
                };
                _local_8.y = _local_22;
                todo.Users[_arg_1].mc.y = (_local_22 + 1);
                todo.Users[_arg_1].M_St = (todo.Users[_arg_1].M_St & ~(128));
                if ((todo.Users[_arg_1].M_St & 4))
                {
                    _local_8.Options = (_local_8.Options | chatter2.BFF2);
                } else
                {
                    if ((todo.Users[_arg_1].M_St & 2))
                    {
                        _local_8.Options = (_local_8.Options | chatter2.Married2);
                    } else
                    {
                        if ((todo.Users[_arg_1].M_St & 1))
                        {
                            _local_8.Options = (_local_8.Options | chatter2.Star);
                        };
                    };
                };
                if ((todo.Users[_arg_1].M_St & 8))
                {
                    _local_8.ColF = 65793;
                };
                if ((todo.Users[_arg_1].M_St & 16))
                {
                    _local_8.Options = (_local_8.Options | chatter2.BFF);
                };
                if ((todo.Users[_arg_1].M_St & 32))
                {
                    _local_8.Options = (_local_8.Options | chatter2.Married);
                };
                if ((_local_8 is chatter2))
                {
                    _local_8.Go();
                };
            };
            if (_local_4 < 16)
            {
                _local_4 = 16;
            };
            if (_local_5)
            {
                _local_4 = 22;
            };
            useryc = (useryc + (_local_4 + 4));
        }

        static function HatLoaded(_arg_1:*)
        {
            var _local_2:* = _arg_1.currentTarget.loader.contentLoaderInfo.content;
            _local_2.Go(_local_2.parent.parent.HAT);
        }

        static function HatUnLoaded(_arg_1:*)
        {
            _arg_1.currentTarget.unloadAndStop(true);
        }

        public static function ChatterRollover(_arg_1:MouseEvent)
        {
            main.hint.Hint(0, 0, xatlib.GetUserStatus(xatlib.FindUser(_arg_1.currentTarget.UserNo)), true, 1, undefined, 0, _arg_1.currentTarget);
        }

        public static function ChatterOnPress(_arg_1:MouseEvent)
        {
            main.hint.HintOff();
            if ((((_arg_1.currentTarget.UserNo == 0)) || ((_arg_1.currentTarget.UserNo == todo.w_userno))))
            {
                main.openDialog(1);
            } else
            {
                if (_arg_1.currentTarget.UserNo != 0xFFFFFFFF)
                {
                    if (((((((_arg_1.ctrlKey) && (todo.Macros))) && (todo.Macros["rapid"]))) && (todo.HasPowerA(todo.w_Powers, 91, todo.w_Mask))))
                    {
                        DoRapid(_arg_1.currentTarget.UserNo);
                    } else
                    {
                        main.openDialog(2, _arg_1.currentTarget.UserNo);
                    };
                };
            };
        }

        static function DoRapid(_arg_1:*)
        {
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_2:* = xatlib.FindUser(_arg_1);
            if (_local_2 == -1)
            {
                return;
            };
            var _local_3:* = todo.Macros["rapid"].split(",");
            var _local_7:* = 0;
            _local_3[1] = Number(_local_3[1]);
            if (isNaN(_local_3[1]))
            {
                _local_3[1] = 1;
            };
            switch (_local_3[0])
            {
                case "ignore":
                    network.NetworkIgnore(_arg_1);
                    break;
                case "unban":
                    if (todo.Users[_local_2].banned)
                    {
                        _local_4 = "u";
                    };
                    break;
                case "ban":
                    if (!todo.Users[_local_2].banned)
                    {
                        _local_4 = "g";
                    };
                    break;
                case "gag":
                    if (!todo.Users[_local_2].gagged)
                    {
                        _local_4 = "gg";
                    };
                    break;
                case "mute":
                    if (!todo.Users[_local_2].banned)
                    {
                        _local_4 = "gm";
                    };
                    break;
                case "member":
                    if (!todo.Users[_local_2].member)
                    {
                        _local_5 = "e";
                    };
                    break;
                case "guest":
                    if (((((todo.Users[_local_2].member) || (todo.Users[_local_2].moderator))) || (todo.Users[_local_2].owner)))
                    {
                        _local_5 = "r";
                    };
                    break;
                default:
                    if (!todo.Users[_local_2].banned)
                    {
                        for (_local_6 in xconst.Puzzle)
                        {
                            if (_local_3[0].substr(0, xconst.Puzzle[_local_6].length) == xconst.Puzzle[_local_6])
                            {
                                _local_4 = "g";
                                _local_7 = _local_6;
                                break;
                            };
                        };
                    };
            };
            if (_local_4)
            {
                network.NetworkGagUser(_local_4, _arg_1, !((_local_4 == "u")), xatlib.xInt((_local_3[1] * 3600)), "rapid", _local_7);
            };
            if (_local_5)
            {
                network.NetworkMakeUser(_arg_1, _local_5);
            };
        }


    }
}//package 

