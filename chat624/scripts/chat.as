// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//chat

package 
{
    import flash.display.Sprite;
    import flash.media.Sound;
    import flash.net.LocalConnection;
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.system.Security;
    import flash.system.Capabilities;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.net.URLRequest;
    import flash.net.ObjectEncoding;
    import flash.net.SharedObjectFlushStatus;
    import flash.net.URLRequestMethod;
    import flash.utils.getTimer;
    import flash.system.System;
    import flash.ui.Keyboard;
    import com.adobe.serialization.json.xJSON;
    import flash.events.StatusEvent;
    import flash.events.*;
    import com.adobe.serialization.json.*;
    import flash.display.*;
    import flash.media.*;
    import flash.text.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.ui.*;

    public class chat extends Sprite 
    {

        public static const cVersion = "14012016";
        public static const sv = 51;
        public static const lv = 2;
        public static var debug = false;
        static var force_xc = undefined;
        static var force_lang = undefined;
        static var gctrick = 0;
        static var framet = 0;
        static var framec = 0;
        static var timesc = 0;
        static var fpsstr = "";
        static var fps = 12;
        static var afps = 12;
        static var fpsa = 0;
        static var fpsc = 0;
        static const period = 120;
        static const times = 36;
        static var timer = new Object();
        static var State = 0;
        static var Timeout = undefined;
        static var sot = null;
        static var keybits:Array = new Array(0x0100);
        static var ctrlTimer;
        public static var mainDlg:main;
        public static var beep:Sound;
        public static var dingdong:Sound;
        public static var tab_sound:Sound;
        public static var sending_lc:LocalConnection;
        public static var receiving_lc:LocalConnection;
        public static var toxat = "toxat";
        public static var fromxat = "fromxat";
        public static var AppTimeout = undefined;
        public static var connectchannel = undefined;
        public static var connectuser = undefined;
        public static var connectmessage = undefined;
        public static var connectmsg = undefined;
        public static var onMsg2;

        public function chat()
        {
            addEventListener(Event.ADDED_TO_STAGE, this.init);
        }

        static function NotAway()
        {
            var _local_1:* = xatlib.FindUser(todo.w_userno);
            if ((todo.Users[_local_1].flag0 & 0x4000))
            {
                network.NetworkSendMsg(todo.w_userno, "/back");
            };
            todo.Away = 1;
        }

        public static function onLang(_arg_1:Event)
        {
            var _local_2:URLLoader = URLLoader(_arg_1.target);
            todo.LangText = _local_2.data;
            xconst.CreateST();
            xconst.MakeBads();
        }

        static function isKeyDown(_arg_1:int):Boolean
        {
            return ((true == Boolean(keybits[_arg_1])));
        }


        function init(_arg_1:Event)
        {
            var _local_2:*;
            var _local_3:*;
            todo.config["WEB"] = true;
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            todo.StageWidth = stage.stageWidth;
            todo.StageHeight = stage.stageHeight;
            stage.addEventListener(Event.RESIZE, this.onResize);
            if (todo.config["WEB"])
            {
                Security.allowDomain("xat.com");
                Security.allowInsecureDomain("xat.com");
            };
            if (todo.config["WEB"])
            {
                if (((parent) && (parent.parent)))
                {
                    _local_3 = parent.parent.root.loaderInfo;
                } else
                {
                    _local_3 = root.loaderInfo;
                };
                _local_2 = _local_3.parameters;
                if (_local_3.url.indexOf("https") === 0)
                {
                    todo.Http = "https:";
                };
                todo.usedomain = (todo.Http + todo.usedomain);
                todo.chatdomain = (todo.Http + todo.chatdomain);
                todo.imagedomain = (todo.Http + todo.imagedomain);
                todo.flashdomain = (todo.Http + todo.flashdomain);
                if (_local_2.id != undefined)
                {
                    todo.w_room = xatlib.xInt(_local_2.id);
                };
                if (_local_2.pass != undefined)
                {
                    todo.pass = (global.pass = xatlib.xInt(_local_2.pass));
                };
                if (_local_2.rf != undefined)
                {
                    global.rf = xatlib.xInt(_local_2.rf);
                };
                if (_local_2.gn != undefined)
                {
                    global.gn = _local_2.gn;
                };
                if (_local_2.um != undefined)
                {
                    global.um = xatlib.xInt(_local_2.um);
                };
                if (_local_2.lg != undefined)
                {
                    global.lg = _local_2.lg;
                };
                if (_local_2.rl != undefined)
                {
                    global.rl = _local_2.rl;
                };
                if (((!((_local_2.pw == undefined))) && (!((_local_2.em == undefined)))))
                {
                    todo.w_password = xatlib.CleanText(_local_2.pw, 1);
                };
                if (_local_2.pw == "##")
                {
                    todo.RefreshLogin = true;
                };
                if (_local_2.em != undefined)
                {
                    todo.w_email = xatlib.CleanText(_local_2.em, 0);
                };
                if (_local_2.cn != undefined)
                {
                    global.cn = xatlib.xInt(_local_2.cn);
                };
                global.gb = _local_2.gb;
                if (_local_2.xn != undefined)
                {
                    global.xn = _local_2.xn;
                };
                if (_local_2.xp != undefined)
                {
                    global.xp = _local_2.xp;
                };
                if (_local_2.xh != undefined)
                {
                    global.xh = _local_2.xh;
                };
                if (_local_2.xb != undefined)
                {
                    global.xb = _local_2.xb;
                };
                if (_local_2.xl != undefined)
                {
                    global.xl = _local_2.xl;
                };
                if (_local_2.xm != undefined)
                {
                    global.xm = _local_2.xm;
                };
                if (_local_2.xt != undefined)
                {
                    global.xt = _local_2.xt;
                };
                if (_local_2.xo != undefined)
                {
                    global.xo = _local_2.xo;
                };
                if (_local_2.xc != undefined)
                {
                    global.xc = xatlib.xInt(_local_2.xc);
                };
                global.sv = sv;
                global.lv = lv;
            };
            if (todo.config["MOBILE"])
            {
                todo.w_room = 5713805;
            };
            todo.w_useroom = todo.w_room;
            xconst.xconstInit();
            beep = new beepsnd();
            tab_sound = new beepsnd();
            dingdong = new dingdongsnd();
            this.SetState(0);
            if (xatlib.xInt(Capabilities.version.split(" ")[1]) < 10)
            {
                gctrick = 60;
            };
            stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onkeyDown);
            stage.addEventListener(KeyboardEvent.KEY_UP, this.onkeyUp);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this.onmouseMove);
            addEventListener(Event.ENTER_FRAME, this.tick);
        }

        function onResize(_arg_1:Event)
        {
        }

        function onmouseMove(_arg_1:Event)
        {
            if ((((todo.OnSuper == false)) && ((todo.lb == "t"))))
            {
                network.NetworkSendMsg(1, "/K2", 0, 0, 1);
                todo.OnSuper = true;
            };
            if (todo.Away)
            {
                NotAway();
            };
        }

        function SetState(_arg_1:*, _arg_2:*=undefined)
        {
            State = _arg_1;
            Timeout = _arg_2;
        }

        function tick(event:Event)
        {
            var flushret:* = undefined;
            var temp_comm:* = undefined;
            var Request:URLRequest;
            var loader:URLLoader;
            var t:* = undefined;
            var str:* = undefined;
            if (State == 0)
            {
                sot = xatlib.getLocal("chat", "/");
                sot.objectEncoding = ObjectEncoding.AMF0;
                sot.data.w_test = Math.random();
                this.SetState(1);
            };
            if (State == 1)
            {
                flushret = sot.flush();
                if (flushret == SharedObjectFlushStatus.FLUSHED)
                {
                    sot = null;
                    this.SetState(2);
                };
            };
            if (State == 2)
            {
                this.CookieStuff();
                if (todo.w_lang == undefined)
                {
                    if (todo.w_roomlang == undefined)
                    {
                        this.SetState(5);
                    } else
                    {
                        todo.w_lang = todo.w_roomlang;
                        this.SetState(3);
                    };
                } else
                {
                    if (todo.w_lang == 0)
                    {
                        this.SetState(5);
                    } else
                    {
                        this.SetState(3);
                    };
                };
            };
            if (State == 3)
            {
                todo.LangText = undefined;
                if (!todo.w_lang)
                {
                    this.SetState(5);
                } else
                {
                    temp_comm = ((((todo.usedomain + "/json/lang/Chat/") + todo.w_lang) + ".php?c=") + global.sv);
                    xatlib.LoadVariables(temp_comm, onLang);
                    this.SetState(4, 20);
                };
            };
            if (State == 4)
            {
                if (todo.LangText != undefined)
                {
                    this.SetState(5);
                };
                if (Timeout != undefined)
                {
                    Timeout--;
                };
                if (Timeout <= 0)
                {
                    this.SetState(5);
                };
            };
            if (State == 5)
            {
                mainDlg = new main();
                addChild(mainDlg);
                mainDlg.StartChat();
                network.NetworkInit();
                network.NetworkStartChat();
                if (!todo.config["nolocalconnection"])
                {
                    this.AppComms();
                };
                if (todo.w_room == 8)
                {
                    xatlib.AddBackground(this, -10, -10, 240, 160, (((((128 << 10) | xatlib.c_tl) | xatlib.c_tr) | xatlib.c_bl) | xatlib.c_br));
                };
                if ((global.xc & 1))
                {
                    if (global.xp != undefined)
                    {
                        xatlib.GeneralMessage(" ", (xconst.ST(249) + global.xp));
                        main.box_layer.GeneralMessageH.Dia.Ok.But.PressFunc = function (_arg_1:*)
                        {
                            main.box_layer.GeneralMessageH.Delete();
                            todo.w_avatar = global.xp;
                            xatlib.MainSolWrite("w_avatar", todo.w_avatar);
                            xatlib.ReLogin();
                        };
                    };
                };
                Request = new URLRequest();
                Request.url = (todo.chatdomain + "pow2.php");
                Request.method = URLRequestMethod.GET;
                loader = new URLLoader();
                loader.load(Request);
                loader.addEventListener(Event.COMPLETE, this.PowHandler);
                this.SetState(6);
            };
            if (State == 6)
            {
                if (AppTimeout != undefined)
                {
                    AppTimeout--;
                    if (AppTimeout <= 0)
                    {
                        if (todo.messageecho == "m")
                        {
                            todo.messageecho = undefined;
                        };
                        AppTimeout = undefined;
                    };
                };
                network.NetworkTick();
                tickcode.DoTick();
                if (mainDlg)
                {
                    mainDlg.tick2(null);
                };
            };
            if (((!((gctrick == 0))) && (((todo.tick % gctrick) == 0))))
            {
                try
                {
                    new LocalConnection().connect("foo");
                    new LocalConnection().connect("foo");
                } catch(e:Error)
                {
                };
            };
            if (((((((debug) || ((((todo.useport == 10025)) && ((todo.sockdomain == "174.36.242.26")))))) && (!(todo.bStrip)))) && (!(todo.bSmilies))))
            {
                framec++;
                if (framec >= period)
                {
                    t = getTimer();
                    fps = (Math.round((((period * 1000) / (t - framet)) * 100)) / 100);
                    fpsa = (fpsa + fps);
                    fpsc++;
                    afps = (Math.round(((fpsa / fpsc) * 100)) / 100);
                    fpsstr = (fpsstr + (fps.toString() + ","));
                    timesc++;
                    if (timesc >= times)
                    {
                        str = (((((((((("lag=" + fpsstr) + Capabilities.version) + ",") + System.totalMemory) + ",") + mainDlg.stage.frameRate) + ",") + afps) + ",") + cVersion);
                        network.NetworkSendMsg(1, ("/KD " + str), 0, 0, 1);
                        fpsstr = "";
                        timesc = 0;
                    };
                    framet = t;
                    framec = 0;
                };
            };
            if (ctrlTimer != undefined)
            {
                ctrlTimer--;
                if (ctrlTimer <= 0)
                {
                    ctrlTimer = undefined;
                    keybits[Keyboard.CONTROL] = false;
                };
            };
        }

        function PowHandler(_arg_1:Event)
        {
            var _local_6:*;
            var _local_7:*;
            var _local_9:*;
            var _local_10:*;
            var _local_2:URLLoader = URLLoader(_arg_1.target);
            var _local_3:* = xJSON.decode(_local_2.data);
            var _local_4:* = false;
            var _local_5:* = false;
            var _local_8:* = 0;
            while (_local_8 < _local_3.length)
            {
                for (_local_9 in _local_3[_local_8][1])
                {
                    switch (_local_3[_local_8][0])
                    {
                        case "backs":
                            _local_4 = true;
                            xconst.backs[_local_9] = _local_3[_local_8][1][_local_9];
                            break;
                        case "hugs":
                            _local_5 = true;
                            xconst.hugs[_local_9] = _local_3[_local_8][1][_local_9];
                            break;
                        case "topsh":
                            xconst.topsh[_local_9] = xatlib.xInt(_local_3[_local_8][1][_local_9]);
                            xconst.smi = (xconst.smi + ("," + _local_9));
                            xconst.smia.push(_local_9);
                            xconst.smih[_local_9] = true;
                            break;
                        case "Puzzle":
                            xconst.Puzzle[_local_9] = _local_3[_local_8][1][_local_9];
                            break;
                        case "pssa":
                            _local_10 = xatlib.xInt(_local_3[_local_8][1][_local_9]);
                            xconst.pssa[(_local_10 + 1)] = _local_9;
                            xconst.smi = (xconst.smi + ("," + _local_9));
                            xconst.smia.push(_local_9);
                            xconst.smih[_local_9] = true;
                            xconst.pssh[_local_9] = _local_10;
                            break;
                        case "pawns":
                            xconst.Pawns = _local_3[_local_8][1];
                            break;
                        case "actions":
                            xconst.BuildActiontable(_local_3[_local_8][1], 0);
                            _local_3[_local_8][1] = null;
                            break;
                        case "isgrp":
                            xconst.IsGroup[_local_9] = _local_3[_local_8][1][_local_9];
                            break;
                    };
                };
                _local_8++;
            };
            if (_local_4)
            {
                xconst.backsR = xconst.ReverseObj(xconst.backs);
            };
            if (_local_5)
            {
                xconst.hugsR = xconst.ReverseObj(xconst.hugs);
            };
        }

        function CookieStuff()
        {
            var _local_4:Date;
            var _local_5:*;
            var _local_6:*;
            if (todo.w_lang == undefined)
            {
                todo.w_lang = global.lg;
            };
            if (todo.w_langv == undefined)
            {
                todo.w_langv = global.lv;
            };
            var _local_1:* = xatlib.getLocal(("chat" + String(todo.w_room)), "/");
            _local_1.objectEncoding = ObjectEncoding.AMF0;
            if (_local_1 != null)
            {
                if (todo.pass != undefined)
                {
                    _local_1.data.pass = todo.pass;
                    _local_1.flush();
                } else
                {
                    todo.pass = _local_1.data.pass;
                    if (todo.pass != undefined)
                    {
                        todo.pass = xatlib.xInt(todo.pass);
                    };
                };
            };
            var _local_2:* = xatlib.getLocal("chat", "/");
            _local_2.objectEncoding = ObjectEncoding.AMF0;
            var _local_3:* = 1;
            if (((1) && (!((_local_2 == null)))))
            {
                _local_4 = new Date();
                _local_5 = _local_4.getTime();
                _local_6 = 0;
                if (_local_2.data.w_lastroom != undefined)
                {
                    _local_3 = _local_2.data.w_lastroom;
                };
                if (_local_2.data.w_lastauto != undefined)
                {
                    _local_6 = _local_2.data.w_lastauto;
                };
                _local_2.data.w_lastauto = _local_5;
                if (todo.w_lang != undefined)
                {
                    if (xatlib.xInt(todo.w_lang) < 10000)
                    {
                        _local_2.data.w_lang = todo.w_lang;
                    };
                } else
                {
                    if (_local_2.data.w_lang != undefined)
                    {
                        todo.w_lang = _local_2.data.w_lang;
                    };
                };
                _local_2.flush();
                if (_local_2.data.w_userno != undefined)
                {
                    if (_local_2.data.w_userno != undefined)
                    {
                        todo.w_userno = xatlib.xInt(_local_2.data.w_userno);
                    };
                    if (_local_2.data.w_userrev != undefined)
                    {
                        todo.w_userrev = xatlib.xInt(_local_2.data.w_userrev);
                    };
                    if (_local_2.data.w_k1b != undefined)
                    {
                        todo.w_k1 = xatlib.xInt(_local_2.data.w_k1b);
                    };
                    if (_local_2.data.w_k1c != undefined)
                    {
                        todo.w_k1 = _local_2.data.w_k1c;
                    };
                    if (_local_2.data.w_k2 != undefined)
                    {
                        todo.w_k2 = xatlib.xInt(_local_2.data.w_k2);
                    };
                    todo.w_cb = xatlib.xInt(_local_2.data.w_cb);
                    if (_local_2.data.w_name != undefined)
                    {
                        todo.w_name = xatlib.CleanTextNoXat(_local_2.data.w_name);
                    };
                    if (_local_2.data.w_avatar != undefined)
                    {
                        todo.w_avatar = xatlib.CleanAv(_local_2.data.w_avatar);
                    };
                    if (_local_2.data.w_homepage != undefined)
                    {
                        todo.w_homepage = _local_2.data.w_homepage;
                    };
                    if (_local_2.data.w_d0 != undefined)
                    {
                        todo.w_d0 = xatlib.xInt(_local_2.data.w_d0);
                    };
                    if (_local_2.data.w_d1 != undefined)
                    {
                        todo.w_d1 = xatlib.xInt(_local_2.data.w_d1);
                    };
                    todo.w_d2 = xatlib.xInt(_local_2.data.w_d2);
                    todo.w_d3 = xatlib.xInt(_local_2.data.w_d3);
                    todo.w_dt = xatlib.xInt(_local_2.data.w_dt);
                    todo.w_Powers = _local_2.data.w_Powers;
                    todo.w_Mask = _local_2.data.w_Mask;
                    todo.w_bride = _local_2.data.w_bride;
                    todo.w_xats = _local_2.data.w_xats;
                    todo.w_PowerO = _local_2.data.w_PowerO;
                    todo.w_sn = _local_2.data.w_sn;
                    if (_local_2.data.w_coins != undefined)
                    {
                        todo.w_coins = xatlib.xInt(_local_2.data.w_coins);
                    };
                    if (_local_2.data.w_k3 != undefined)
                    {
                        todo.w_k3 = _local_2.data.w_k3;
                    };
                    if (_local_2.data.w_registered != undefined)
                    {
                        todo.w_registered = _local_2.data.w_registered;
                    };
                    todo.w_autologin = _local_2.data.w_autologin;
                    todo.w_news = xatlib.xInt(_local_2.data.w_news);
                    todo.w_Vol[1] = _local_2.data.w_Vol1;
                    todo.w_Vol[2] = _local_2.data.w_Vol2;
                    if ((((todo.w_autologin == undefined)) || ((todo.w_autologin == true))))
                    {
                        todo.w_autologin = 0xFFFF;
                    };
                    if (todo.w_autologin == false)
                    {
                        todo.w_autologin = 65534;
                    };
                    todo.autologin = todo.w_autologin;
                    if (!(global.xc & 32))
                    {
                        if ((_local_5 - _local_6) < (((todo.w_room == _local_3)) ? 10000 : 2000))
                        {
                            todo.w_autologin = (todo.w_autologin & ~(1));
                        };
                    };
                    if ((((todo.w_useroom > 100)) && ((((todo.StageWidth < 220)) || ((todo.StageHeight < 140))))))
                    {
                        todo.w_autologin = (todo.w_autologin & ~(1));
                    } else
                    {
                        if ((global.xc & 0x0200))
                        {
                            todo.w_autologin = (todo.w_autologin & ~(1));
                        } else
                        {
                            if ((((todo.w_useroom > 100)) && (!((global.pw == undefined)))))
                            {
                                todo.w_autologin = (todo.w_autologin | 1);
                            };
                        };
                    };
                    if (_local_2.data.w_banlist != undefined)
                    {
                        todo.w_banlist = _local_2.data.w_banlist;
                    };
                    if (_local_2.data.w_friendlist != undefined)
                    {
                        todo.w_friendlist = _local_2.data.w_friendlist;
                    };
                    network.OnFriendList(0);
                    if (_local_2.data.w_friendlist2 != undefined)
                    {
                        todo.w_friendlist2 = _local_2.data.w_friendlist2;
                    };
                    if (_local_2.data.w_ignorelist2 != undefined)
                    {
                        todo.w_ignorelist2 = _local_2.data.w_ignorelist2;
                    };
                    if (_local_2.data.w_userrevlist != undefined)
                    {
                        todo.w_userrevlist = _local_2.data.w_userrevlist;
                    };
                    if (_local_2.data.w_namelist != undefined)
                    {
                        todo.w_namelist = _local_2.data.w_namelist;
                    };
                    if (_local_2.data.w_avatarlist != undefined)
                    {
                        todo.w_avatarlist = _local_2.data.w_avatarlist;
                    };
                    if (_local_2.data.w_homepagelist != undefined)
                    {
                        todo.w_homepagelist = _local_2.data.w_homepagelist;
                    };
                    todo.w_Options = _local_2.data.w_Options;
                    todo.Macros = _local_2.data.Macros;
                    if (!todo.Macros)
                    {
                        todo.Macros = {};
                    };
                    global.sv = _local_2.data.w_sv;
                };
            };
            if (todo.w_Vol[1] == undefined)
            {
                todo.w_Vol[1] = 35;
            };
            if (todo.w_Vol[2] == undefined)
            {
                todo.w_Vol[2] = 35;
            };
            if (((!((_local_2 == null))) && (!((_local_2.data.w_sound == undefined)))))
            {
                todo.w_sound = _local_2.data.w_sound;
            };
            network.TrimIgnoreList();
            if (global.xn != undefined)
            {
                if ((((todo.w_name == "")) || (xatlib.IsDefaultName(todo.w_name))))
                {
                    todo.w_name = global.xn;
                };
            };
            if (global.xp != undefined)
            {
                if (todo.w_avatar == "")
                {
                    todo.w_avatar = global.xp;
                };
            };
            if (global.xh != undefined)
            {
                if (todo.w_homepage == "")
                {
                    todo.w_homepage = global.xh;
                };
            };
            if (global.xl != undefined)
            {
                todo.MainFlagBits = (todo.MainFlagBits | xconst.f_Lobby);
            };
            if (network.OnFriendList(3))
            {
                network.UpdateFriendList(3, 0);
            };
            todo.w_roomlang = global.rl;
            if (force_lang != undefined)
            {
                todo.w_lang = force_lang;
            };
        }

        function onkeyDown(_arg_1:KeyboardEvent):void
        {
            if (_arg_1.keyCode == Keyboard.CONTROL)
            {
                ctrlTimer = 12;
            };
            keybits[_arg_1.keyCode] = true;
        }

        function onkeyUp(_arg_1:KeyboardEvent):void
        {
            if (_arg_1.keyCode == Keyboard.CONTROL)
            {
                ctrlTimer = undefined;
            };
            keybits[_arg_1.keyCode] = false;
        }

        function sending_lc_Status(_arg_1:Event)
        {
        }

        function AppComms()
        {
            onMsg2 = this.onMsg;
            if (force_xc != undefined)
            {
                global.xc = force_xc;
            };
            if (global.cn != undefined)
            {
                toxat = (toxat + global.cn);
                fromxat = (fromxat + global.cn);
            };
            if ((global.xc & 0x0800))
            {
                sending_lc = new LocalConnection();
                sending_lc.addEventListener(StatusEvent.STATUS, this.sending_lc_Status);
                receiving_lc = new LocalConnection();
                receiving_lc.client = this;
                try
                {
                    receiving_lc.connect(toxat);
                } catch(error:ArgumentError)
                {
                };
            };
        }

        public function onMsg(_arg_1:*, _arg_2:*, _arg_3:*)
        {
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            var _local_12:*;
            var _local_13:*;
            var _local_14:*;
            var _local_15:*;
            if (_arg_1 == 1)
            {
                connectchannel = _arg_1;
                connectuser = _arg_2;
                connectmessage = _arg_3;
                if (todo.lb != "n")
                {
                    sending_lc.send(fromxat, "onMsg", _arg_1, _arg_2, _arg_3);
                };
                AppTimeout = 120;
            } else
            {
                if (_arg_1 == 2)
                {
                    _local_4 = main.ctabsmc.TabUser();
                    sending_lc.send(fromxat, "onMsg", 2, (((_local_4 == undefined)) ? 0 : _local_4), "");
                } else
                {
                    if (_arg_1 == 3)
                    {
                        if (_arg_3 == 0)
                        {
                            _arg_3 = todo.w_userno;
                        };
                        _local_5 = xatlib.FindUser(_arg_3);
                        if (_local_5 != -1)
                        {
                            sending_lc.send(fromxat, "onMsg", _arg_1, (((_arg_3)==todo.w_userno) ? 0 : todo.Users[_local_5].u), todo.Users[_local_5].n);
                        };
                    } else
                    {
                        if (_arg_1 == 4)
                        {
                            if (_arg_3 == "m")
                            {
                                if (network.YC)
                                {
                                    _local_6 = (xatlib.xInt(todo.w_d1) - network.YC);
                                    if (_local_6 < 0)
                                    {
                                        _local_6 = 0;
                                    };
                                    _local_6 = xatlib.xInt(((_local_6 / (24 * 3600)) + 0.3));
                                    if (_local_6 > 0)
                                    {
                                        todo.messageecho = _arg_3;
                                    } else
                                    {
                                        todo.helpstr = "You need to be a subscriber to use translator";
                                        todo.helpupdate = 0;
                                    };
                                };
                            } else
                            {
                                todo.messageecho = _arg_3;
                                if (todo.messageecho == "a")
                                {
                                    sending_lc.send(fromxat, "onMsg", 4, 0, "d");
                                    _local_7 = todo.Users.length;
                                    _local_8 = 0;
                                    while (_local_8 < _local_7)
                                    {
                                        if (todo.Users[_local_8].online == true)
                                        {
                                            sending_lc.send(fromxat, "onMsg", 4, todo.Users[_local_8].u, ("u" + todo.Users[_local_8].a));
                                        };
                                        _local_8++;
                                    };
                                };
                            };
                        } else
                        {
                            if ((((_arg_1 >= 10000)) || ((_arg_1 == 0))))
                            {
                                if ((((_arg_1 >= 40000)) && ((_arg_1 <= 50000))))
                                {
                                    if (_arg_3 == "j")
                                    {
                                        network.NetworkSendExtMessage(_arg_3);
                                    } else
                                    {
                                        network.NetworkSendxmlExtMessage(_arg_3);
                                    };
                                } else
                                {
                                    network.NetworkSendExtMessage(_arg_1, _arg_2, _arg_3);
                                };
                            } else
                            {
                                if (_arg_1 == 5)
                                {
                                    stage.focus = main.textfield2;
                                    main.textfield2.appendText(_arg_3);
                                    main.textfield2.setSelection(main.textfield2.text.length, main.textfield2.text.length);
                                } else
                                {
                                    if (_arg_1 == 6)
                                    {
                                        if (_arg_3 == 0)
                                        {
                                            _arg_3 = todo.w_userno;
                                        };
                                        _local_9 = xatlib.FindUser(_arg_3);
                                        if (_local_9 != -1)
                                        {
                                            sending_lc.send(fromxat, "onMsg", _arg_1, todo.Users[_local_9].u, todo.Users[_local_9]);
                                        };
                                    } else
                                    {
                                        if (_arg_1 == 7)
                                        {
                                            if (_arg_3 == "x")
                                            {
                                                chat.mainDlg.GotoProfile(_arg_2);
                                            } else
                                            {
                                                if (_arg_3 == "p")
                                                {
                                                    main.openDialog(2, _arg_2);
                                                } else
                                                {
                                                    if (_arg_3 == "b")
                                                    {
                                                        xatlib.Register_onRelease(1);
                                                    } else
                                                    {
                                                        _local_10 = _arg_3.split(",");
                                                        if (_local_10[0] == "ban")
                                                        {
                                                            network.NetworkGagUser("g", _arg_2, true, xatlib.xInt(_local_10[1]), _local_10[2]);
                                                        };
                                                    };
                                                };
                                            };
                                        } else
                                        {
                                            if (_arg_1 == 8)
                                            {
                                                if (_arg_3)
                                                {
                                                    todo.w_avatar = _arg_3;
                                                };
                                                todo.w_cb++;
                                                _local_11 = xatlib.getLocal("chat", "/");
                                                _local_11.objectEncoding = ObjectEncoding.AMF0;
                                                if (((1) && (!((_local_11 == null)))))
                                                {
                                                    _local_11.data.w_cb = todo.w_cb;
                                                    _local_11.data.w_avatar = todo.w_avatar;
                                                    _local_11.flush();
                                                };
                                                todo.lb = "n";
                                                todo.DoUpdate = true;
                                                network.NetworkClose();
                                                main.logoutbutonPress();
                                            } else
                                            {
                                                if (_arg_1 == 9)
                                                {
                                                    _local_12 = "not set";
                                                    switch (_arg_3)
                                                    {
                                                        case "sv":
                                                            _local_12 = global.sv;
                                                            break;
                                                        case "smi":
                                                            _local_12 = xconst.smi;
                                                            break;
                                                        case "w_xats":
                                                            _local_12 = todo.w_xats;
                                                            break;
                                                        case "YC":
                                                            _local_12 = network.YC;
                                                            break;
                                                        case "w_d1":
                                                            _local_12 = todo.w_d1;
                                                            break;
                                                        case "w_dt":
                                                            _local_12 = todo.w_dt;
                                                            break;
                                                        case "w_Powers":
                                                            _local_12 = todo.w_Powers;
                                                            break;
                                                        case "w_Mask":
                                                            _local_12 = (((((todo.w_Mask == undefined)) || ((todo.w_Mask == 0)))) ? "0,0,0" : todo.w_Mask);
                                                            break;
                                                        case "w_langv":
                                                            _local_12 = todo.w_langv;
                                                            break;
                                                        case "pssa":
                                                            _local_12 = xconst.pssa;
                                                            break;
                                                        case "w_PowerO":
                                                            _local_12 = todo.w_PowerO;
                                                            break;
                                                        case "w_lang":
                                                            _local_12 = todo.w_lang;
                                                            break;
                                                        case "config":
                                                            _local_12 = todo.config;
                                                            break;
                                                        case "gUserNo":
                                                            _local_12 = global.gUserNo;
                                                            break;
                                                        case "w_useroom":
                                                            _local_12 = todo.w_useroom;
                                                            break;
                                                        case "gconfig":
                                                            _local_12 = todo.gconfig;
                                                            break;
                                                        case "w_cb":
                                                            _local_12 = todo.w_cb;
                                                            break;
                                                        case "w_r":
                                                            _local_12 = todo.w_r;
                                                            break;
                                                        case "WY":
                                                            _local_12 = todo.WY;
                                                            break;
                                                        case "w_room_cb":
                                                            _local_12 = todo.w_room_cb;
                                                            break;
                                                        default:
                                                            {
                                                            };
                                                    };
                                                    sending_lc.send(fromxat, "onMsg", _arg_1, _arg_3, _local_12);
                                                } else
                                                {
                                                    if (_arg_1 == 10)
                                                    {
                                                        _local_13 = todo.Message.length;
                                                        _local_14 = 0;
                                                        while (_local_14 < _local_13)
                                                        {
                                                            if (todo.Message[_local_14].i == xatlib.xInt(_arg_2))
                                                            {
                                                                if (_arg_3 != "")
                                                                {
                                                                    if (todo.Message[_local_14].t.indexOf(" [") != -1)
                                                                    {
                                                                        todo.Message[_local_14].t = (((todo.Message[_local_14].t.substr(0, todo.Message[_local_14].t.indexOf(" [")) + " [") + _arg_3) + "]");
                                                                    } else
                                                                    {
                                                                        todo.Message[_local_14].t = (((todo.Message[_local_14].t + " [") + _arg_3) + "]");
                                                                    };
                                                                };
                                                                xmessage.DeleteOneMessageMc(_local_14);
                                                                todo.DoUpdateMessages = true;
                                                                if ((xatlib.xInt(_arg_2) & 1))
                                                                {
                                                                    _local_15 = todo.Message[_local_14].t;
                                                                    todo.DoUpdateMessages = true;
                                                                    todo.ScrollDown = true;
                                                                    todo.LastScrollTime = undefined;
                                                                    if (todo.MessageCount > 0)
                                                                    {
                                                                        todo.MessageCount = 25;
                                                                    };
                                                                    if (_local_15 != todo.LastMessageToSend)
                                                                    {
                                                                        if (todo.MessageToSend.length == 0)
                                                                        {
                                                                            todo.MessageToSend = _local_15;
                                                                        };
                                                                        todo.MessageToSend = todo.MessageToSend.substr(0, 0x0100);
                                                                    } else
                                                                    {
                                                                        todo.MessageCount = 25;
                                                                    };
                                                                };
                                                                break;
                                                            };
                                                            _local_14++;
                                                        };
                                                    } else
                                                    {
                                                        if (_arg_1 == 12)
                                                        {
                                                            if (todo.systemMessages.indexOf(_arg_3) == -1)
                                                            {
                                                                todo.systemMessages = (todo.systemMessages + _arg_3);
                                                            };
                                                            if (_arg_3 == "v")
                                                            {
                                                                sending_lc.send(fromxat, "onMsg", _arg_1, _arg_3, (((todo.w_sound & 1)) ? todo.w_Vol[1] : 0));
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }


    }
}//package 

