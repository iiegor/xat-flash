// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//main

package 
{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.net.LocalConnection;
    import flash.xml.XMLDocument;
    import flash.net.URLRequest;
    import flash.system.Security;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.net.ObjectEncoding;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;
    import flash.geom.Rectangle;
    import flash.events.*;
    import flash.xml.*;
    import com.adobe.serialization.json.*;
    import flash.display.*;
    import flash.media.*;
    import flash.text.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.ui.*;

    public class main extends Sprite 
    {

        public static var GrpIc:MovieClip;
        private static var GrpIcscale;
        public static var em:Array = new Array();
        public static var textfield2:TextField;
        public static var mcgetachat;
        public static var ButtonLoginMc;
        public static var lockmc;
        public static var retmc;
        public static var retmcBut;
        public static var nudge;
        public static var upw;
        public static var uph;
        public static var upx;
        public static var upy;
        public static var fmt;
        public static var hint:hints;
        public static var ctabsmc;
        public static var mctextbackgroundmask;
        public static var mctextbackground;
        public static var mcuserbackground;
        public static var mcuserbackgroundmask;
        public static var utabsmc;
        public static var mscrollmc;
        public static var uscrollmc;
        public static var textPaneWidth;
        public static var uMessLst:Array = new Array();
        static var mcxLoad;
        public static var mcLoad:MovieClip = null;
        static var mcxMusicPlayer = null;
        static var musiccode = null;
        public static var mcMusicPlayer:MovieClip = null;
        public static var mcscroller;
        public static var mcscrollertext;
        public static var mcscrollermask;
        public static var fmts = new TextFormat();
        public static var back_layer;
        public static var backs = new Array();
        public static var back_no = 0;
        public static var pc_layer;
        public static var pc_pic;
        public static var flix_layer;
        public static var wink_layer;
        public static var chat_layer;
        public static var dialog_layer;
        public static var touchtimeout = 0;
        public static var dialogs;
        public static var box_layer;
        public static var eip_layer;
        public static var puzzle_layer;
        public static var kiss_layer;
        public static var moveable;
        static var RadioSound = new Array();
        static var SndIcnX = 0;
        static var Dragee;
        public static var mcsnd;
        public static var equ:Sprite = new Sprite();
        public static var debugtext:TextField = new TextField();
        public static var dbgstr = "";
        static const un = undefined;
        private static var receiving_profile:LocalConnection = null;
        private static var sending_profile:LocalConnection = null;
        private static var ProfileUserNo = 0;
        private static var flix_opts:Object;
        private static var flix_mc;
        public static const flixs = [92, 96, 98, 102, 108, 148, 156, 278, 296];
        public static var mbs;
        public static var ubs;
        public static var logo;

        const OkPic = {
            "xat":1,
            "xatech":1,
            "photobucket":1,
            "tinypic":1
        };

        var textfield2background;
        var cmessmc;
        var emotes;

        public function main()
        {
            this.emotes = new Sprite();
            super();
        }

        static function SetTyping(_arg_1:int, _arg_2:Boolean)
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_3:int = xatlib.FindUser(_arg_1);
            if (_local_3 < 0)
            {
                return;
            };
            if (!todo.HasPower(_local_3, 172))
            {
                return;
            };
            if (_arg_2)
            {
                todo.Users[_local_3].flag0 = (todo.Users[_local_3].flag0 | 65536);
            } else
            {
                todo.Users[_local_3].flag0 = (todo.Users[_local_3].flag0 & ~(65536));
            };
            xmessage.DeleteOneUserMc(_local_3);
        }

        public static function ProcessMessage()
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            var _local_12:int;
            var _local_13:*;
            var _local_14:*;
            var _local_15:*;
            var _local_16:*;
            var _local_17:*;
            var _local_18:*;
            var _local_19:*;
            var _local_1:Number = xatlib.FindUser(todo.w_userno);
            _local_2 = todo.MessageToProcess;
            todo.MessageToProcess = "";
            if ((((_local_2.charAt(0) == "$")) && (!((_local_2.indexOf("=") == -1)))))
            {
                if (_local_2 == "$=")
                {
                    if (todo.Macros != undefined)
                    {
                        todo.helpstr = "";
                        for (_local_4 in todo.Macros)
                        {
                            todo.helpstr = (todo.helpstr + (((("$" + _local_4) + "=") + todo.Macros[_local_4]) + " "));
                        };
                        todo.helpupdate = 0;
                    };
                    return;
                };
                _local_3 = _local_2.substr(1).split("=");
                if (_local_3[0].indexOf(" ") == -1)
                {
                    if (todo.Macros == undefined)
                    {
                        todo.Macros = new Object();
                    };
                    if ((((_local_3[1] == undefined)) || ((_local_3[1].length == 0))))
                    {
                        delete todo.Macros[_local_3[0]];
                    } else
                    {
                        todo.Macros[_local_3[0]] = _local_3[1];
                    };
                    if (_local_3[0] == "status")
                    {
                        xatlib.ReLogin();
                    };
                    todo.helpstr = ((("$" + _local_3[0]) + "=") + (((_local_3[1] == undefined)) ? "" : _local_3[1]));
                    todo.helpupdate = 0;
                    xatlib.MainSolWrite("Macros", todo.Macros);
                    return;
                };
            };
            if (!(((todo.PrivateChat == 0)) && (((((!((_local_1 == -1))) && (((todo.Users[_local_1].banned) && (!((todo.Users[_local_1].flag0 & 131072))))))) || (((!((_local_1 == -1))) && (todo.Users[_local_1].gagged)))))))
            {
                if (_local_2.charAt(0) == "/")
                {
                    _local_5 = _local_2.substr(1, 1);
                    switch (_local_5)
                    {
                        case "s":
                            SetScroller(_local_2.substr(2, 510));
                            network.NetworkSendMsg(todo.w_userno, _local_2.substr(0, 0x0200));
                            break;
                        case "x":
                        case "m":
                        case "n":
                            network.NetworkSendMsg(todo.w_userno, _local_2, ctabsmc.TabUser());
                            break;
                        case "o":
                            todo.w_Options = _local_2.substr(2, 0x0100);
                            if (todo.w_Options.length == 0)
                            {
                                todo.w_Options = undefined;
                            };
                            xatlib.MainSolWrite("w_Options", todo.w_Options);
                            break;
                        case "f":
                            _local_6 = _local_2.substr(2, (64 + 16)).split(" ");
                            _local_7 = 0;
                            _local_10 = xatlib.xInt(_local_6[0]);
                            _local_11 = ctabsmc.TabUser();
                            if ((((_local_10 == 0)) && (_local_6[0])))
                            {
                                _local_7 = _local_6[0];
                                _local_6.shift();
                            };
                            if (((!(_local_6[0])) && (_local_11)))
                            {
                                _local_6[0] = _local_11;
                            };
                            _local_10 = xatlib.xInt(_local_6[0]);
                            if (_local_10 >= 3)
                            {
                                _local_9 = ((_local_6[1]) ? _local_6[1] : _local_6[0]);
                                network.UpdateFriendList(_local_10, 1, _local_9, _local_7);
                            };
                            _local_12 = xatlib.FindUser(_local_10);
                            xmessage.DeleteOneUserMc(_local_12);
                            break;
                        case "d":
                            if (_local_2.substr(0, 6) == "/debug")
                            {
                            };
                            break;
                        case "t":
                            if (ctabsmc.TabUser())
                            {
                                network.NetworkSendMsg(todo.w_userno, _local_2, 0, ctabsmc.TabUser(), 0);
                                network.NetworkIgnore(ctabsmc.TabUser());
                            } else
                            {
                                xkiss.Kiss({
                                    "t":_local_2.substr(2),
                                    "u":todo.w_userno,
                                    "k":"Ttth"
                                });
                            };
                            break;
                        case "+":
                        case "-":
                            _local_13 = xconst.pssh[_local_2.substr(2).toLowerCase()];
                            if (_local_13)
                            {
                                DialogPowers.PowOnOff(_local_13, (_local_5 == "+"));
                                xatlib.ReLogin();
                            };
                            break;
                        case "h":
                            if (_local_2.substr(1, 2) == "hu")
                            {
                                _local_3 = _local_2.split(" ");
                                _local_3[1] = _local_3[1].toLowerCase();
                                _local_15 = xconst.hugs[_local_3[1]];
                                if (!_local_15)
                                {
                                    _local_14 = xconst.ST(280);
                                } else
                                {
                                    if (!todo.HasPowerA(todo.w_Powers, (_local_15 % 10000), todo.w_Mask))
                                    {
                                        _local_14 = xconst.ST(252);
                                    };
                                };
                                if (_local_14)
                                {
                                    todo.helpstr = _local_14;
                                    todo.helpupdate = 0;
                                } else
                                {
                                    _local_16 = new XMLDocument();
                                    _local_17 = _local_16.createElement("a");
                                    _local_3.splice(0, 2);
                                    _local_3 = _local_3.join(" ");
                                    if (!_local_3)
                                    {
                                        _local_3 = "";
                                    };
                                    _local_17.attributes.m = _local_3;
                                    _local_17.attributes.h = _local_15;
                                    if (ctabsmc.TabIsPrivate())
                                    {
                                        _local_17.attributes.e = 1;
                                        _local_17.attributes.b = ctabsmc.TabUser();
                                    };
                                    _local_16.appendChild(_local_17);
                                    network.socket.send(_local_16);
                                };
                                break;
                            };
                        default:
                            network.NetworkSendMsg(todo.w_userno, _local_2);
                    };
                } else
                {
                    if (_local_2.indexOf("k2=") != -1)
                    {
                        todo.helpstr = xconst.ST(214);
                        todo.helpupdate = 0;
                    } else
                    {
                        if (todo.Macros != undefined)
                        {
                            for (_local_4 in todo.Macros)
                            {
                                _local_2 = xatlib.Replace(_local_2, ("$" + _local_4), todo.Macros[_local_4]);
                            };
                        };
                        ProcessHelp(_local_2);
                        ProcessSounds(_local_2, ((((!((todo.w_Powers == undefined))) && (!((todo.w_Mask == undefined))))) ? !(((todo.w_Powers[0] & (1 << 8)) & ~(todo.w_Mask[0]))) : 1), _local_1);
                        _local_2 = xatlib.PreProcSmilie(_local_2, undefined, todo.w_Options);
                        _local_18 = _local_2;
                        if (todo.PrivateMessage != 0)
                        {
                            _local_18 = ("<priv> " + _local_2);
                        };
                        todo.mi++;
                        if (!(((((((((((xconst.f_Live & todo.FlagBits)) && (!(todo.w_mainowner)))) && (!(todo.w_owner)))) && (!(todo.w_moderator)))) && (!(todo.w_member)))) && (!(ctabsmc.TabIsPrivate()))))
                        {
                            todo.Message.push({
                                "i":((todo.mi * 2) + 1),
                                "n":0,
                                "t":_local_18,
                                "u":todo.w_userno,
                                "s":((ctabsmc.TabIsPrivate()) ? 2 : 0),
                                "d":ctabsmc.TabUser()
                            });
                        };
                        if (todo.messageecho == "m")
                        {
                            if (network.YC)
                            {
                                _local_19 = (xatlib.xInt(todo.w_d1) - network.YC);
                                if (_local_19 < 0)
                                {
                                    _local_19 = 0;
                                };
                                _local_19 = xatlib.xInt(((_local_19 / (24 * 3600)) + 0.3));
                                if (_local_19 > 0)
                                {
                                    chat.sending_lc.send(chat.fromxat, "onMsg", 4, ((todo.mi * 2) + 1), _local_18);
                                };
                            };
                        } else
                        {
                            todo.DoUpdateMessages = true;
                            todo.ScrollDown = true;
                            todo.LastScrollTime = undefined;
                            if (todo.MessageCount > 0)
                            {
                                todo.MessageCount = 25;
                            };
                            if (_local_2 != todo.LastMessageToSend)
                            {
                                if (todo.MessageToSend.length == 0)
                                {
                                    todo.MessageToSend = _local_2;
                                } else
                                {
                                    todo.MessageToSend = (todo.MessageToSend + " ");
                                    todo.MessageToSend = (todo.MessageToSend + _local_2);
                                };
                                todo.MessageToSend = todo.MessageToSend.substr(0, 0x0100);
                            } else
                            {
                                todo.MessageCount = 25;
                            };
                            if ((((todo.MessageToSend == "!bot")) && (!((todo.w_lang == undefined)))))
                            {
                                todo.MessageToSend = ((todo.MessageToSend + " ") + todo.w_lang);
                            };
                        };
                    };
                };
            };
        }

        public static function ProcessHelp(_arg_1:String)
        {
            _arg_1.toLowerCase();
            if (_arg_1.indexOf("change") != -1)
            {
                if (((((((!((_arg_1.indexOf("name") == -1))) || (!((_arg_1.indexOf("picture") == -1))))) || (!((_arg_1.indexOf("pic") == -1))))) || (!((_arg_1.indexOf("avatar") == -1)))))
                {
                    todo.helpstr = xconst.ST(30, (" <o> <l>" + todo.w_name));
                    todo.HelpUpdate = (300 + (todo.helpstr.length * 8));
                };
            };
        }

        public static function PlayMusic(_arg_1:*)
        {
            var _local_2:*;
            var _local_3:URLRequest;
            if (todo.config["WEB"])
            {
                if ((todo.w_sound & 1))
                {
                    _local_2 = _arg_1.split("piano#");
                    musiccode = _local_2[1];
                    if (mcxMusicPlayer == null)
                    {
                        Security.allowDomain("xat.dev");
                        Security.allowDomain("www.xat.dev");
                        mcxMusicPlayer = new Loader();
                        _local_3 = new URLRequest("//xat.dev/web_gear/flash/musicplayer.swf?a7");
                        mcxMusicPlayer.load(_local_3);
                        mcxMusicPlayer.contentLoaderInfo.addEventListener(Event.COMPLETE, chat.mainDlg.onMusicPlayerLoaded);
                        mcxMusicPlayer.visible = false;
                        chat.mainDlg.addChild(mcxMusicPlayer);
                    } else
                    {
                        if (musiccode != null)
                        {
                            mcMusicPlayer.playmusic(musiccode, todo.w_Vol[1]);
                        };
                    };
                };
            };
        }

        public static function ProcessSounds(_arg_1:String, _arg_2:Boolean, _arg_3:*=-1)
        {
            var _local_4:Number;
            var _local_5:Boolean;
            var _local_6:String;
            var _local_7:Array;
            var _local_8:*;
            if ((todo.w_sound & 1))
            {
                _arg_1.toLowerCase();
                if (((!((_arg_3 == -1))) && (todo.HasPower(_arg_3, 117))))
                {
                    _local_4 = _arg_1.indexOf("piano#");
                    if (_local_4 != -1)
                    {
                        PlayMusic(_arg_1);
                        return;
                    };
                };
                _local_5 = false;
                _local_4 = _arg_1.indexOf("#");
                if (((!((_local_4 == -1))) && (_arg_2)))
                {
                    if (!(((_local_4 > 0)) && (!((_arg_1.charAt((_local_4 - 1)) == " ")))))
                    {
                        _local_6 = _arg_1.substr((_local_4 + 1));
                        _local_6 = xatlib.CleanText(_local_6);
                        _local_7 = new Array();
                        _local_7 = _local_6.split("_");
                        _local_8 = _local_7[0];
                        if (_local_8.length > 0)
                        {
                            if (_local_8 != "laserfire3")
                            {
                                todo.CustomSound = _local_8;
                                todo.DoAudieSnd = true;
                                _local_5 = true;
                            };
                        };
                    };
                };
                if (!_local_5)
                {
                    todo.DoMessageSnd = true;
                };
            };
        }

        public static function logoutbutonPress()
        {
            var _local_1:*;
            main.closeDialog();
            xmessage.mspos = undefined;
            while (todo.Pools.length > 0)
            {
                todo.Pools.splice(0);
            };
            todo.PrivateMessage = 0;
            lockmc.visible = false;
            if (todo.lb == "n")
            {
                _local_1 = xatlib.getLocal(("chat" + String(todo.w_useroom)), "/");
                _local_1.objectEncoding = ObjectEncoding.AMF0;
                todo.pass = _local_1.data.pass;
                if (todo.pass != undefined)
                {
                    todo.pass = xatlib.xInt(todo.pass);
                };
                network.attempt = 0;
                network.prevrpool = -1;
                network.NetworkStartChat();
            } else
            {
                todo.lb = "n";
                todo.DoUpdate = true;
                network.NetworkClose();
            };
        }

        private static function flix_Loaded(_arg_1:*)
        {
            var _local_2:* = _arg_1.currentTarget.loader.contentLoaderInfo.content;
            _local_2.Go(flix_opts);
        }

        public static function Private_onRelease(_arg_1:Number)
        {
            main.hint.HintOff();
            main.utabsmc.SetVisitorsTab();
            todo.DoUpdateMessages = true;
            todo.DoBuildUserListScrollUp = true;
            todo.ScrollDown = true;
            todo.LastScrollTime = undefined;
            main.ctabsmc.UpdateTabs(_arg_1);
            main.ctabsmc.ColorTab(_arg_1, 0xFFFFFF);
            var _local_2:* = main.ctabsmc.tabs[_arg_1].User;
            xmessage.OpenGifts(_local_2, 2);
        }

        public static function Private_onDelete(_arg_1:Number)
        {
            main.hint.HintOff();
            main.utabsmc.SetVisitorsTab();
            var _local_2:* = main.ctabsmc.tabs[_arg_1].ImIndex;
            main.ctabsmc.tabs.splice(_arg_1, 1);
            if (todo.w_useroom == todo.w_room)
            {
                main.ctabsmc.UpdateTabs(0);
                main.ctabsmc.ColorTab(0, 0xFFFFFF);
            } else
            {
                main.ctabsmc.UpdateTabs(1);
                main.ctabsmc.ColorTab(1, 0xFFFFFF);
            };
            chat.mainDlg.UpdateBackground(0, 0);
            todo.DoUpdateMessages = true;
            todo.DoBuildUserList = true;
            todo.ScrollDown = true;
        }

        public static function onUserScrollChange()
        {
            var _local_1:* = ((xmessage.useryc3 - uph) + 4);
            var _local_2:* = 0;
            if (_local_1 > 0)
            {
                uscrollmc.Scr_size = _local_1;
                _local_2 = uscrollmc.Scr_position;
            } else
            {
                uscrollmc.Scr_position = 0;
            };
            mcuserbackground.y = -(_local_2);
            tickcode.UserScroll = true;
        }

        public static function LookupPool(_arg_1:*)
        {
            var _local_2:int = todo.Pools.length;
            var _local_3:* = 0;
            while (_local_3 < _local_2)
            {
                if (_arg_1 == todo.Pools[_local_3])
                {
                    return (_local_3);
                };
                _local_3++;
            };
            return (0);
        }

        public static function SetScroller(_arg_1:*)
        {
            fmts.color = 0;
            var _local_2:* = _arg_1.indexOf("#");
            if (_local_2 != -1)
            {
                fmts.color = parseInt(_arg_1.substr((_local_2 + 1), 6), 16);
                _arg_1 = _arg_1.substr(0, _local_2);
            };
            mcscrollertext.text = _arg_1;
            mcscrollertext.x = xatlib.NX(435);
            mcscrollertext.y = (xatlib.NY(469) - 12);
            mcscrollertext.setTextFormat(fmts);
            mcscrollertext.selectable = false;
            mcscrollertext.cacheAsBitmap = true;
        }

        public static function openDialog(_arg_1:*, _arg_2:*=undefined)
        {
            closeDialog();
            var _local_3:* = null;
            switch (_arg_1)
            {
                case 1:
                    _local_3 = new DialogProfile(_arg_2);
                    break;
                case 2:
                    _local_3 = new DialogActions(_arg_2);
                    break;
                case 3:
                    _local_3 = new DialogKiss(_arg_2);
                    break;
                case 4:
                    _local_3 = new DialogEdit(_arg_2);
                    break;
                case 5:
                    _local_3 = new DialogHelp(_arg_2);
                    break;
                case 7:
                    _local_3 = new DialogPowers(_arg_2);
                    break;
                case 11:
                    _local_3 = new DialogReason(_arg_2);
                    break;
            };
            if (_local_3 != null)
            {
                dialog_layer.addChild(_local_3);
            };
        }

        public static function closeDialog()
        {
            while (dialog_layer.numChildren)
            {
                dialog_layer.removeChildAt(0);
            };
            while (dialogs.numChildren)
            {
                dialogs.removeChildAt(0);
            };
        }


        function onLoadLoaded(_arg_1:Event)
        {
            mcLoad = MovieClip(mcxLoad.contentLoaderInfo.content);
            mcLoad.ping();
        }

        function StartChat()
        {
            var t:* = undefined;
            var t2:* = undefined;
            var mRequest:URLRequest;
            fmts.color = 0;
            fmts.align = "left";
            fmts.font = "_sans";
            fmts.size = 10;
            fmts.bold = true;
            back_layer = new xSprite();
            addChild(back_layer);
            flix_layer = new xSprite();
            addChild(flix_layer);
            pc_layer = new xSprite();
            addChild(pc_layer);
            wink_layer = new xSprite();
            addChild(wink_layer);
            hint = new hints();
            addChild(equ);
            todo.tpw = xatlib.NX(460);
            todo.tph = xatlib.NY(320);
            todo.tpx = xatlib.NX(10);
            todo.tpy = xatlib.NY(10);
            textPaneWidth = ((todo.tpw - 15) - 45);
            if (todo.config["WEB"])
            {
                if (!todo.bThin)
                {
                    Security.allowDomain("xat.dev");
                    Security.allowDomain("www.xat.dev");
                    mcxLoad = new Loader();
                    mRequest = new URLRequest("//xat.dev/web_gear/flash/load2.swf?a3");
                    mcxLoad.load(mRequest);
                    mcxLoad.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoadLoaded);
                    mcxLoad.visible = false;
                    addChild(mcxLoad);
                };
            };
            this.cmessmc = new xmessage();
            xmessage.AddGames();
            addChild(this.cmessmc);
            ctabsmc = new ctabs();
            addChild(ctabsmc);
            if (!todo.bMobile)
            {
                mctextbackgroundmask = xatlib.AddBackground(this, (todo.tpx + 1), (todo.tpy + 1), ((todo.tpw - 2) - xatlib.NX(16)), (todo.tph - 2), ((xatlib.c_bl | xatlib.c_Mask) | xatlib.c_Clip));
                mctextbackground = new Sprite();
                mctextbackground.x = todo.tpx;
                mctextbackground.y = todo.tpy;
                mctextbackground.mask = mctextbackgroundmask;
                addChild(mctextbackground);
            };
            utabsmc = new ctabs();
            addChild(utabsmc);
            upw = xatlib.NX(150);
            uph = xatlib.NY(320);
            upx = xatlib.NX(480);
            upy = xatlib.NY(10);
            if (!todo.bMobile)
            {
                mcuserbackgroundmask = xatlib.AddBackground(this, (main.upx + 1), (main.upy + 1), ((main.upw - 2) - xatlib.NX(16)), (main.uph - 2), (xatlib.c_Mask | xatlib.c_Clip));
                mcuserbackground = new Sprite();
                mcuserbackground.x = main.upx;
                mcuserbackground.y = main.upy;
                mcuserbackground.mask = mcuserbackgroundmask;
                addChild(mcuserbackground);
                mscrollmc = new xScroll(this, ((todo.tpx + todo.tpw) - xatlib.NX(16)), todo.tpy, xatlib.NX(16), todo.tph, xatlib.NX(16), xatlib.NX(32), 100, (10 * 100), (10 * 100), this.onMessageScrollChange);
                uscrollmc = new xScroll(this, ((upx + upw) - xatlib.NX(16)), upy, xatlib.NX(16), uph, xatlib.NX(16), xatlib.NX(32), 20, (10 * 100), (0 * 100), onUserScrollChange);
            };
            lockmc = new lock();
            addChild(lockmc);
            lockmc.x = xatlib.NX(17);
            lockmc.y = xatlib.NY(407);
            lockmc.visible = false;
            lockmc.alpha = 0.75;
            lockmc.width = int(((lockmc.width * xatlib.NY(60)) / lockmc.height));
            lockmc.height = xatlib.NY(60);
            t = xatlib.NX(425);
            this.textfield2background = xatlib.AddBackground(this, xatlib.NX(10), xatlib.NY(400), t, xatlib.NY(70));
            fmt = new TextFormat();
            fmt.align = "left";
            fmt.bold = true;
            fmt.color = 0;
            fmt.font = "_sans";
            fmt.size = 14;
            textfield2 = new TextField();
            textfield2.name = "textfield2";
            textfield2.x = xatlib.NX((10 + 4));
            textfield2.y = xatlib.NY(400);
            textfield2.width = xatlib.NX((425 - 4));
            textfield2.height = xatlib.NY(70);
            textfield2.type = "input";
            textfield2.multiline = (((false)=="IPHONE") ? false : true);
            textfield2.wordWrap = true;
            textfield2.defaultTextFormat = fmt;
            textfield2.addEventListener(Event.CHANGE, this.textfield2onChanged);
            addChild(textfield2);
            mcscroller = new xSprite();
            mcscrollertext = new TextField();
            mcscrollertext.x = xatlib.NX(435);
            mcscrollertext.y = xatlib.NY(456);
            mcscrollertext.width = 10000;
            mcscrollertext.height = 20;
            SetScroller("");
            mcscroller.addChild(mcscrollertext);
            mcscrollermask = xatlib.AddBackground(mcscroller, xatlib.NX(10), xatlib.NY(400), t, xatlib.NY(80), xatlib.c_bl);
            mcscroller.mask = mcscrollermask;
            addChild(mcscroller);
            t = xatlib.NX(24);
            t2 = xatlib.NX(446);
            retmc = new xBut(this, t2, xatlib.NY(400), t, xatlib.NY(70), "");
            retmcBut = new library("returnicon");
            retmcBut.x = ((t - 16) / 2);
            retmcBut.y = ((xatlib.NY(70) - 16) / 2);
            if (todo.bThin)
            {
                retmcBut.Col = todo.ButColW;
            } else
            {
                xatlib.McSetRGB(retmcBut.xitem.back, todo.ButColW);
            };
            retmc.SetRoll(xconst.ST(4));
            retmc.addEventListener(MouseEvent.MOUSE_DOWN, this.retmc_onPress);
            retmc.addEventListener(MouseEvent.ROLL_OUT, this.RollOutHintOff);
            retmc.addChild(retmcBut);
            mcgetachat = new xBut(this, xatlib.NX(480), xatlib.NY(400), xatlib.NX(150), xatlib.NY(30), ((todo.config["uselogindialog"]) ? "Login" : xconst.ST(5)), this.GetAChatBox_onRelease);
            mcgetachat.addEventListener(MouseEvent.ROLL_OVER, this.GetAChatBox_onRollOver);
            mcgetachat.SetRoll(this.GetAChatBox_onRollOver);
            ButtonLoginMc = new xBut(this, xatlib.NX(480), xatlib.NY(440), xatlib.NX(150), xatlib.NY(30), xconst.ST(19));
            ButtonLoginMc.addEventListener(MouseEvent.MOUSE_DOWN, this.ButtonLoginMc_onRelease);
            ButtonLoginMc.SetRoll(this.ButtonLoginMc_onRollOver);
            debugtext.x = xatlib.NX(10);
            debugtext.y = (xatlib.NY(456) - 16);
            debugtext.height = 20;
            debugtext.width = xatlib.NX(425);
            debugtext.defaultTextFormat = fmts;
            debugtext.setTextFormat(fmts);
            debugtext.text = "";
            debugtext.visible = false;
            addChild(debugtext);
            chat_layer = new MovieClip();
            addChild(chat_layer);
            this.MkGpBut();
            var ic3:* = new library("HelpIcon");
            ic3.xitem.xinfo.visible = false;
            ic3.x = xatlib.NX((524 - 4));
            ic3.y = xatlib.NY(((395 - 32) + 4));
            ic3.scaleX = (ic3.scaleY = (GrpIcscale * 1.1));
            ic3.buttonMode = true;
            ic3.addEventListener(MouseEvent.MOUSE_DOWN, function ()
            {
                openDialog(5, 0);
            });
            addChild(ic3);
            main.hint.AddEasyHint(ic3, xconst.ST(7));
            var logo:* = (main.logo = new library("xatsat"));
            logo.scaleX = (logo.scaleY = GrpIcscale);
            logo.x = (xatlib.NX((640 - 10)) - logo.width);
            logo.y = xatlib.NY(((395 - 32) + 4));
            logo.buttonMode = true;
            logo.addEventListener(MouseEvent.MOUSE_DOWN, this.onxatLogo);
            logo.visible = false;
            addChild(logo);
            main.hint.AddEasyHint(logo, (todo.Http + "//xat.dev"), {"Pos":0});
            addChild(this.emotes);
            ctabsmc.CreateTabs();
            utabsmc.CreateVisitorsTabs();
            dialog_layer = new MovieClip();
            addChild(dialog_layer);
            dialogs = new MovieClip();
            addChild(dialogs);
            box_layer = new MovieClip();
            addChild(box_layer);
            addChild(hint);
            puzzle_layer = new MovieClip();
            addChild(puzzle_layer);
            kiss_layer = new MovieClip();
            addChild(kiss_layer);
        }

        public function MkGpBut()
        {
            var _local_5:*;
            var _local_1:Array = new Array(5, 0, 0xC000, 0, 2, 5592575, 10, 2, 0xFF0000, 5, 4, 0xFF9900);
            if ((todo.FlagBits & xconst.f_Live))
            {
                _local_1 = new Array(5, 0, 0xC000, 3, 1, 0xC000, 7, 1, 0xC000, 0, 2, 0xC000, 5, 2, 0xC000, 10, 2, 0xC000, 3, 3, 0xC000, 7, 3, 0xC000, 5, 4, 0x800080);
            };
            if (GrpIc)
            {
                chat_layer.removeChild(GrpIc);
            };
            GrpIc = new MovieClip();
            var _local_2:* = (((xatlib.NX(24) < xatlib.NY(24))) ? xatlib.NX(24) : xatlib.NY(24));
            var _local_3:* = 0;
            while (_local_3 < _local_1.length)
            {
                _local_5 = new chatter2();
                _local_5.x = _local_1[_local_3];
                _local_5.y = _local_1[(_local_3 + 1)];
                _local_5.ColP1 = _local_1[(_local_3 + 2)];
                _local_5.Size = _local_2;
                _local_5.Go();
                GrpIc.addChild(_local_5);
                _local_3 = (_local_3 + 3);
            };
            GrpIcscale = (_local_2 / 20);
            GrpIc.x = xatlib.NX(484);
            GrpIc.y = xatlib.NY(((395 - 32) + 4));
            GrpIc.buttonMode = true;
            GrpIc.addEventListener(MouseEvent.MOUSE_DOWN, this.onGrpIcMouseDown);
            chat_layer.addChild(GrpIc);
            var _local_4:* = xconst.ST(6);
            if (((((todo.w_owner) || (todo.w_mainowner))) && ((todo.FlagBits & xconst.f_Live))))
            {
                _local_4 = xconst.ST(216);
            };
            main.hint.AddEasyHint(GrpIc, _local_4);
        }

        function RollOutHintOff(_arg_1:MouseEvent)
        {
            hint.HintOff();
        }

        public function retmc_onPress(_arg_1:MouseEvent)
        {
            var _local_2:* = 0;
            while (_local_2 < textfield2.length)
            {
                if (textfield2.text.charAt(_local_2) == ">")
                {
                    textfield2.text = ((textfield2.text.substr(0, _local_2) + "˃") + textfield2.text.substr((_local_2 + 1)));
                };
                _local_2++;
            };
            this.PostMessage(textfield2.text);
            textfield2.text = "";
        }

        function onSmilieMouseDown(_arg_1:MouseEvent)
        {
            var _local_2:*;
            if (_arg_1.currentTarget.cs != undefined)
            {
                switch (_arg_1.currentTarget.cs)
                {
                    case "GetX":
                        xatlib.Register_onRelease(1);
                        break;
                    case "News":
                        todo.w_news = todo.News;
                        xatlib.MainSolWrite("w_news", todo.News);
                        xatlib.GotoWeb((todo.usedomain + "/news"));
                        break;
                    case "GetStuff":
                        main.hint.HintOff();
                        todo.SmilieUpdate = 0;
                        _local_2 = new Object();
                        _local_2.Marry = 0;
                        openDialog(3, _local_2);
                        break;
                    case "more":
                        mcLoad = MovieClip(mcxLoad.contentLoaderInfo.content);
                        mcLoad.OpenSmilies();
                        main.hint.HintOff();
                        todo.SmilieUpdate = 0;
                        if ((global.xc & 0x0800))
                        {
                            mcLoad.OpenSmilies();
                        } else
                        {
                            xatlib.GotoXat("5");
                        };
                        break;
                    default:
                        stage.focus = textfield2;
                        textfield2.appendText(_arg_1.currentTarget.cs);
                        textfield2.setSelection(textfield2.text.length, textfield2.text.length);
                };
            } else
            {
                stage.focus = textfield2;
                textfield2.appendText(xconst.smArray[_arg_1.currentTarget.s]);
                textfield2.setSelection(textfield2.text.length, textfield2.text.length);
            };
        }

        function onSmilieMouseRollOut(_arg_1:MouseEvent)
        {
            hint.HintOff();
            todo.SmilieUpdate = 1000;
        }

        function onSmilieMouseRollOver(_arg_1:MouseEvent)
        {
            var _local_2:*;
            if (_arg_1.currentTarget.cs != undefined)
            {
                switch (_arg_1.currentTarget.cs)
                {
                    case "GetStuff":
                        hint.Hint(em[_arg_1.currentTarget.n].x, em[_arg_1.currentTarget.n].y, xconst.ST(139), true);
                        todo.SmilieUpdate = -1;
                        break;
                    case "more":
                        hint.Hint(em[_arg_1.currentTarget.n].x, em[_arg_1.currentTarget.n].y, xconst.ST(9), true);
                        todo.SmilieUpdate = -1;
                        break;
                    case "GetX":
                        hint.Hint(em[_arg_1.currentTarget.n].x, em[_arg_1.currentTarget.n].y, xconst.ST(207), true);
                        todo.SmilieUpdate = -1;
                        break;
                    default:
                        hint.Hint(em[_arg_1.currentTarget.n].x, em[_arg_1.currentTarget.n].y, _arg_1.currentTarget.cs, true);
                        todo.SmilieUpdate = -1;
                };
            } else
            {
                hint.Hint(_arg_1.currentTarget.x, _arg_1.currentTarget.y, ((xconst.smArray[_arg_1.currentTarget.t] + " ") + xconst.smArray[_arg_1.currentTarget.s]), true);
                hint.Hint(em[_arg_1.currentTarget.n].x, em[_arg_1.currentTarget.n].y, ((xconst.smArray[_arg_1.currentTarget.t] + " ") + xconst.smArray[_arg_1.currentTarget.s]), true);
                todo.SmilieUpdate = -1;
            };
            if ((xconst.f_NoSmilies & todo.FlagBits))
            {
                _local_2 = 1;
                while (_local_2 < todo.emmax)
                {
                    if (main.em[_local_2] != null)
                    {
                        main.em[_local_2].visible = true;
                    };
                    _local_2++;
                };
            };
        }

        function textfield2onChanged(_arg_1:Event)
        {
            var _local_2:*;
            if (textfield2.text == "\r")
            {
                textfield2.text = "";
                todo.PrivateMessage = 0;
                lockmc.visible = false;
            } else
            {
                if (textfield2.text.indexOf("\r") != -1)
                {
                    _local_2 = 0;
                    while (_local_2 < textfield2.length)
                    {
                        if (textfield2.text.charAt(_local_2) == ">")
                        {
                            textfield2.text = ((textfield2.text.substr(0, _local_2) + "˃") + textfield2.text.substr((_local_2 + 1)));
                        };
                        _local_2++;
                    };
                    this.PostMessage(textfield2.text);
                    textfield2.text = "";
                } else
                {
                    if ((((todo.Typing > 0)) && ((todo.Away <= 1))))
                    {
                        if (todo.Typing == 1)
                        {
                            todo.TypingID = ((ctabsmc.TabIsPrivate()) ? ctabsmc.TabUser() : 0);
                            if (!todo.TypingID)
                            {
                                todo.TypingID = todo.PrivateMessage;
                            };
                            network.NetworkSendMsg(todo.w_userno, "/RTypeOn", 0, todo.TypingID);
                            SetTyping(todo.w_userno, true);
                        };
                        todo.Typing = 10;
                    };
                };
            };
            if (todo.Away)
            {
                chat.NotAway();
            };
        }

        function onGrpIcMouseDown(_arg_1:MouseEvent)
        {
            if (((((todo.w_owner) || (todo.w_mainowner))) && ((todo.FlagBits & xconst.f_Live))))
            {
                if ((global.xc & 0x0800))
                {
                    mcLoad.OpenByN(40000);
                } else
                {
                    xatlib.GotoXat("40000");
                };
                return;
            };
            var _local_2:* = (todo.usedomain + "/groups");
            xatlib.UrlPopup(xconst.ST(8), _local_2);
        }

        public function onxatLogo(_arg_1:MouseEvent)
        {
            var _local_2:* = (todo.Http + "//xat.dev");
            xatlib.UrlPopup(xconst.ST(8), _local_2);
        }

        public function PostMessage(_arg_1:String)
        {
            var _local_4:*;
            if (ctabsmc.TabIsPrivate())
            {
                todo.PrivateChat = ctabsmc.TabUser();
                _local_4 = xatlib.FindUser(todo.w_userno);
                if (todo.HasPower(_local_4, 75))
                {
                    if (_arg_1.indexOf("(bump") != -1)
                    {
                        todo.CustomSound = (todo.BumpSound = "laserfire3");
                        todo.DoAudieSnd = true;
                    };
                };
            } else
            {
                todo.PrivateChat = 0;
            };
            if (todo.PrivateMessage != 0)
            {
                lockmc.visible = false;
            };
            if (_arg_1.length == 0)
            {
                return;
            };
            _arg_1 = xatlib.CleanMessage(_arg_1);
            var _local_2:* = ctabsmc.TabSelected();
            var _local_3:* = xatlib.xInt(ctabsmc.tabs[_local_2].IMtype);
            _arg_1 = _arg_1.substr(0, 0x0100);
            if (todo.w_userrev == undefined)
            {
                todo.w_userrev = 0;
                if (todo.lb == "t")
                {
                    todo.lb = "n";
                    todo.DoUpdate = true;
                    network.NetworkClose();
                };
            };
            if (todo.lb == "n")
            {
                logoutbutonPress();
            };
            todo.ResetSmilies = true;
            todo.MessageToProcess = _arg_1;
            if (todo.Typing > 1)
            {
                todo.Typing = 2;
            };
        }

        function onMusicPlayerLoaded(_arg_1:Event)
        {
            mcMusicPlayer = MovieClip(mcxMusicPlayer.contentLoaderInfo.content);
            if ((todo.w_sound & 1))
            {
                if (musiccode != null)
                {
                    mcMusicPlayer.playmusic(musiccode, todo.w_Vol[1]);
                };
            };
        }

        function ButtonLoginMc_onRelease(_arg_1:MouseEvent)
        {
            todo.LoginPressed = true;
            logoutbutonPress();
        }

        function ButtonLoginMc_onRollOver(_arg_1:MouseEvent)
        {
            if (todo.lb == "n")
            {
                hint.Hint(ButtonLoginMc.But.x, ButtonLoginMc.But.y, xconst.ST(26), true, 0, un, 0);
            } else
            {
                hint.Hint(ButtonLoginMc.But.x, ButtonLoginMc.But.y, xconst.ST(27), true, 0, un, 0);
            };
        }

        function GetAChatBox_onRollOver(_arg_1:MouseEvent)
        {
            if (todo.w_mainowner)
            {
                hint.Hint(mcgetachat.But.x, mcgetachat.But.y, xconst.ST(28), true, 0, un, 100);
            };
        }

        function GetAChatBox_onRelease(_arg_1:MouseEvent)
        {
            var _local_2:*;
            main.hint.HintOff();
            if (todo.w_useroom != todo.w_room)
            {
                this.Home_onRelease();
            };
            if (((((!(todo.w_mainowner)) || (global.xb))) || ((((xatlib.xInt(todo.pass) == 0)) && ((xatlib.xInt(todo.w_dt) == 0))))))
            {
                openDialog(4, 0);
            } else
            {
                if (xatlib.xInt(todo.pass) == 0)
                {
                    _local_2 = ((((((((todo.chatdomain + "../chat.php?id=") + todo.w_room) + "&u=") + todo.w_userno) + "&k2=") + todo.w_k2) + "&dt=") + todo.w_dt);
                    xatlib.UrlPopup(xconst.ST(50), _local_2);
                } else
                {
                    openDialog(4, 1);
                };
            };
        }

        private function GotBackground(_arg_1:*=null)
        {
            if (_arg_1 == null)
            {
                _arg_1 = back_no;
            };
            if (backs[_arg_1])
            {
                back_layer.removeChild(backs[_arg_1]);
            };
            backs[_arg_1] = null;
            _arg_1 = (_arg_1 ^ 1);
            if (backs[_arg_1])
            {
                backs[_arg_1].width = todo.StageWidth;
                backs[_arg_1].height = todo.StageHeight;
            };
        }

        public function SafeBack(_arg_1:String)
        {
            var _local_2:* = _arg_1.toLowerCase().split("/");
            if (!_local_2[2])
            {
                return (false);
            };
            _local_2 = _local_2[2].split(".");
            var _local_3:* = _local_2.length;
            if (_local_2[(_local_3 - 1)] !== "com")
            {
                return (false);
            };
            return (this.OkPic[_local_2[(_local_3 - 2)]]);
        }

        private function ChkVotes(_arg_1:*, _arg_2:*)
        {
            _arg_1 = xatlib.xInt(_arg_1);
            _arg_2 = xatlib.xInt(_arg_2);
            if (_arg_1 <= 1)
            {
                return ("_1");
            };
            var _local_3:int;
            while (_arg_2 > 0)
            {
                _local_3++;
                _arg_2 = (_arg_2 >> 1);
            };
            if (_arg_1 <= _local_3)
            {
                _local_3 = _arg_1;
            };
            return (("_" + _local_3));
        }

        public function GotPcBack()
        {
            if (pc_pic)
            {
                if ((pc_pic.width / pc_pic.height) > 2)
                {
                    pc_layer.removeChild(pc_pic);
                    pc_pic = null;
                } else
                {
                    pc_pic.width = todo.StageWidth;
                    pc_pic.height = todo.StageHeight;
                };
            };
        }

        public function UpdateBackground(_arg_1:*, _arg_2:*=0)
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:int;
            var _local_6:*;
            var _local_7:*;
            if (_arg_1 === 0)
            {
                if (_arg_2 !== todo.lastbackground)
                {
                    if (pc_pic)
                    {
                        pc_layer.removeChild(pc_pic);
                    };
                    pc_pic = null;
                    todo.lastbackground = _arg_2;
                    if (!_arg_2)
                    {
                        return;
                    };
                    if (todo.Macros["pcback"] === "off")
                    {
                        return;
                    };
                    _local_5 = xatlib.FindUser(_arg_2);
                    if (!todo.HasPower(_local_5, 302))
                    {
                        return;
                    };
                    _local_6 = todo.Users[_local_5].a;
                    _local_7 = _local_6;
                    _local_7 = _local_7.split("#http");
                    if (_local_7[1])
                    {
                        _local_6 = ("http" + _local_7[1]);
                    };
                    if (((_local_6) && (!((_arg_2 == todo.w_userno)))))
                    {
                        pc_pic = new loadbitmap(pc_layer, _local_6, todo.StageWidth, todo.StageHeight, this.GotPcBack);
                        if (pc_pic.width)
                        {
                            this.GotPcBack();
                        };
                    };
                };
                return;
            };
            if (flix_mc)
            {
                flix_layer.removeChild(flix_mc);
                flix_mc = null;
            };
            if (!todo.bMobile)
            {
                for (_local_3 in flixs)
                {
                    _local_4 = ("g" + flixs[_local_3]);
                    if (todo.gconfig[_local_4])
                    {
                        flix_opts = todo.gconfig[_local_4];
                        if (flix_opts.bk != 0)
                        {
                            _arg_1 = ((((todo.imagedomain + "flix/") + _local_4) + this.ChkVotes(flix_opts.bk, 32)) + ".jpg");
                        };
                        if (((!((todo.Macros["flix"] == "off"))) && (!((flix_opts.ef == 0)))))
                        {
                            flix_mc = new xSprite();
                            flix_layer.addChild(flix_mc);
                            if (flix_opts.col)
                            {
                                flix_opts.Cols = flix_opts.col.split("#");
                                _local_7 = 0;
                                while (_local_7 < flix_opts.Cols.length)
                                {
                                    flix_opts.Cols[_local_7] = xatlib.DecodeColor(flix_opts.Cols[_local_7]);
                                    _local_7++;
                                };
                            };
                            _local_7 = new xSprite();
                            flix_mc.addChild(_local_7);
                            flix_opts.WW = todo.StageWidth;
                            flix_opts.HH = todo.StageHeight;
                            xatlib.LoadMovie(flix_mc, xatlib.SmilieUrl((_local_4 + this.ChkVotes(flix_opts.ef, flix_opts.v)), "flix"), flix_Loaded);
                        };
                        break;
                    };
                };
            };
            if ((((todo.w_useroom == todo.w_room)) && ((global.xc & 0x0400))))
            {
                _arg_1 = "";
            };
            if (((network.Bootp) && (!(this.SafeBack(_arg_1)))))
            {
                _arg_1 = (todo.imagedomain + "boot.jpg");
            };
            if ((((_arg_1 == undefined)) || ((_arg_1 == ""))))
            {
                return;
            };
            if (xatlib.xInt(_arg_1) > 0)
            {
                _arg_1 = (((todo.chatdomain + "../background/xat") + xatlib.xInt(_arg_1)) + ".jpg");
            };
            if (_arg_1.substr(0, 4) != "http")
            {
                _arg_1 = "";
            };
            if (_arg_1 == "")
            {
                this.GotBackground(0);
                this.GotBackground(1);
                return;
            };
            backs[back_no] = new loadbitmap(back_layer, _arg_1, todo.StageWidth, todo.StageHeight, this.GotBackground);
            back_no = (back_no ^ 1);
        }

        public function Home_onRelease(_arg_1:*=undefined)
        {
            var _local_2:Number = todo.w_room;
            if (((!((todo.w_useroom == _local_2))) || ((todo.lb == "n"))))
            {
                utabsmc.SetVisitorsTab();
                todo.w_useroom = todo.w_room;
                xmessage.ClearLists(true);
                todo.lb = "n";
                todo.DoUpdate = true;
                network.NetworkClose();
                logoutbutonPress();
                todo.ScrollDown = true;
                todo.LastScrollTime = undefined;
                hint.HintOff();
            } else
            {
                todo.DoBuildUserListScrollUp = true;
                todo.DoUpdateMessages = true;
                todo.ScrollDown = true;
                todo.LastScrollTime = undefined;
            };
            if (ctabsmc.tabs[0].Main)
            {
                this.GoGroup();
            };
            ctabsmc.UpdateTabs(0);
            ctabsmc.ColorTab(0, 0xFFFFFF);
            xmessage.OpenGifts(todo.w_userno, 2);
        }

        public function Lobby_onRelease(_arg_1:*=undefined)
        {
            var _local_2:Number;
            _local_2 = todo.group;
            if (((!((todo.w_useroom == _local_2))) || ((todo.lb == "n"))))
            {
                utabsmc.SetVisitorsTab();
                todo.w_useroom = _local_2;
                network.w_redirectport = (network.w_redirectdom = undefined);
                xmessage.ClearLists(true);
                xatlib.ReLogin();
                todo.ScrollDown = true;
                todo.LastScrollTime = undefined;
                hint.HintOff();
            } else
            {
                if (ctabsmc.tabs[1].Main)
                {
                    todo.DoBuildUserListScrollUp = true;
                    todo.DoUpdateMessages = true;
                    todo.ScrollDown = true;
                    todo.LastScrollTime = undefined;
                    this.GoGroup();
                } else
                {
                    todo.DoBuildUserListScrollUp = true;
                    todo.DoUpdateMessages = true;
                    todo.ScrollDown = true;
                    todo.LastScrollTime = undefined;
                };
            };
            ctabsmc.UpdateTabs(1);
            ctabsmc.ColorTab(1, 0xFFFFFF);
        }

        public function GoGroup()
        {
            if ((((global.xc & 0x0800)) && ((todo.w_useroom == todo.w_room))))
            {
                return;
            };
            var _local_1:* = xatlib.GroupUrl();
            xatlib.UrlPopup(xconst.ST(13, _local_1), _local_1);
        }

        public function OnUsers(_arg_1:*=undefined)
        {
            utabsmc.SetVisitorsTab();
            todo.DoBuildUserListScrollUp = true;
            var _local_2:* = todo.Users.length;
            var _local_3:* = 0;
            while (_local_3 < _local_2)
            {
                if (todo.Users[_local_3].friend)
                {
                    xmessage.DeleteOneUserMc(_local_3);
                };
                _local_3++;
            };
        }

        public function OnFriends(_arg_1:*=undefined)
        {
            network.GetFriendStatus();
            utabsmc.SetVisitorsTab(1);
            todo.DoBuildUserListScrollUp = true;
        }

        public function OnTickle(_arg_1:*=undefined)
        {
            network.GetFriendStatus();
            utabsmc.SetVisitorsTab(2);
            todo.DoBuildUserListScrollUp = true;
        }

        function onMessageScrollChange()
        {
            todo.DoUpdateMessages = true;
        }

        public function tick2(_arg_1:Event)
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            if (main.dialog_layer.numChildren > 0)
            {
                touchtimeout = 6;
            } else
            {
                if (touchtimeout > 0)
                {
                    touchtimeout--;
                };
            };
            if (((((!((todo.Macros == undefined))) && (todo.Macros["rapid"]))) && (todo.HasPowerA(todo.w_Powers, 91, todo.w_Mask))))
            {
                if (moveable == undefined)
                {
                    moveable = new xSprite();
                    moveable.mouseEnabled = false;
                    moveable.ta = new TextField();
                    moveable.ta.mouseEnabled = false;
                    moveable.ta.selectable = false;
                    moveable.ta.cacheAsBitmap = true;
                    moveable.addChild(moveable.ta);
                    addChild(moveable);
                };
                if (chat.isKeyDown(Keyboard.CONTROL))
                {
                    if (moveable.visible != true)
                    {
                        moveable.visible = true;
                    };
                    if (moveable.x != (mouseX + 4))
                    {
                        moveable.x = (mouseX + 4);
                    };
                    if (moveable.y != (mouseY + 18))
                    {
                        moveable.y = (mouseY + 18);
                    };
                    if (moveable.ta.text != todo.Macros["rapid"])
                    {
                        moveable.ta.text = todo.Macros["rapid"];
                        fmts.color = 0;
                        moveable.ta.setTextFormat(fmts);
                    };
                } else
                {
                    moveable.visible = false;
                };
            };
            if (nudge > 0)
            {
                _local_2 = nudge;
                _local_3 = Math.round(((Math.random() * _local_2) - (_local_2 / 2)));
                _local_4 = Math.round(((Math.random() * _local_2) - (_local_2 / 2)));
                x = _local_3;
                y = _local_4;
                back_layer.x = -(_local_3);
                back_layer.y = -(_local_4);
                nudge--;
                if (nudge == 0)
                {
                    x = (y = (back_layer.x = (back_layer.y = 0)));
                };
            };
            if ((todo.tick % 12) == 0)
            {
                xAvatar.oatc = xAvatar.atc;
            };
            if ((todo.tick % 10) == 0)
            {
                _local_5 = 0;
                while (_local_5 < main.dialog_layer.numChildren)
                {
                    _local_6 = main.dialog_layer.getChildAt(_local_5);
                    if ((_local_6 is DialogEdit))
                    {
                        _local_6.ImagePaneTick();
                    };
                    _local_5++;
                };
            };
        }

        public function CreateSoundIcon(_arg_1:*, _arg_2:*)
        {
            var _local_3:*;
            var _local_4:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            if (RadioSound[_arg_2])
            {
                chat_layer.removeChild(RadioSound[_arg_2]);
            };
            RadioSound[_arg_2] = null;
            if ((((_arg_2 == 2)) && ((todo.useRadio == undefined))))
            {
                return;
            };
            _local_4 = (RadioSound[_arg_2] = xatlib.AttachMovie(chat_layer, _arg_1));
            _local_3 = _local_4;
            if (_arg_2 == 1)
            {
                SndIcnX = 0;
                mcsnd = _local_3;
                _local_3.xitem.SoundIsOff.visible = ((todo.w_sound & _arg_2) == 0);
                if (!todo.bThin)
                {
                    _local_3.xitem.gotoAndStop(1);
                };
            };
            _local_4.x = (xatlib.NX(446) + SndIcnX);
            _local_4.y = xatlib.NY(((395 - 32) + 4));
            var _local_5:* = (((xatlib.NX(24) < xatlib.NY(24))) ? xatlib.SX() : xatlib.SY());
            _local_3.scaleY = (_local_3.scaleX = _local_5);
            SndIcnX = (SndIcnX - int((_local_3.scaleX * 32)));
            _local_3.bit = _arg_2;
            if ((((_arg_2 == 2)) && (em[(todo.emmax - 1)])))
            {
                this.emotes.removeChild(em[(todo.emmax - 1)]);
                em[(todo.emmax - 1)] = null;
                _local_3.xitem.SoundIsOff.visible = ((todo.w_sound & _arg_2) == 0);
            };
            if (!todo.bMobile)
            {
                _local_6 = (_local_3.vol = new MovieClip());
                _local_4.addChild(_local_6);
                _local_6.bit = _arg_2;
                _local_6.y = -118;
                _local_6.x = 8;
                _local_6.Bk = new xBut(_local_6, -8, -4, 22, 118, "", undefined, ((xBut.b_Panel | xBut.b_Border) | xBut.b_NoPress), 5);
                _local_6.addEventListener(MouseEvent.ROLL_OVER, this.VolRollOver);
                _local_6.addEventListener(MouseEvent.ROLL_OUT, this.VolRollOut);
                _local_7 = new MovieClip();
                _local_6.addChild(_local_7);
                _local_7.y = 5;
                _local_7.addChild(xatlib.ButtonCurve2(2, 4, 100, 0, 1, todo.ButCol, 1, todo.ButColW));
                _local_6.Vol = new xBut(_local_6, -5, (100 - todo.w_Vol[_arg_2]), 15, 10, "", undefined, xBut.b_NoPress, 5);
                _local_6.visible = false;
                _local_8 = _local_6.Vol.But;
                _local_8.addEventListener(MouseEvent.MOUSE_DOWN, this.VolPress);
                _local_8.addEventListener(MouseEvent.MOUSE_UP, this.VolRelease);
            };
            _local_3.addEventListener(MouseEvent.MOUSE_DOWN, this.ButPress);
            _local_3.addEventListener(MouseEvent.ROLL_OVER, this.ButRollOver);
            _local_3.addEventListener(MouseEvent.ROLL_OUT, main.hint.HintOff);
        }

        function VolRollOver(_arg_1:MouseEvent)
        {
            _arg_1.currentTarget.parent.Count = 0x47868C00;
        }

        function VolRollOut(_arg_1:MouseEvent)
        {
            _arg_1.currentTarget.parent.Count = 12;
        }

        function VolPress(_arg_1:MouseEvent)
        {
            _arg_1.currentTarget.startDrag(true, new Rectangle(-5, 2, 0, 100));
            stage.addEventListener(MouseEvent.MOUSE_UP, this.VolRelease);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this.VolDrag);
            Dragee = _arg_1.currentTarget;
        }

        function VolDrag(_arg_1:MouseEvent)
        {
            var _local_2:* = (todo.w_Vol[Dragee.parent.bit] = (102 - Dragee.y));
            Dragee.parent.Count = 12;
            _local_2 = (_local_2 > 2);
            if (!(((todo.w_sound & Dragee.parent.bit) == 0)) != _local_2)
            {
                this.ButPress(null, Dragee);
            };
            if (Dragee.parent.bit != 1)
            {
                tickcode.DoRadio(true);
            };
        }

        function VolRelease(_arg_1:MouseEvent)
        {
            Dragee.stopDrag();
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.VolRelease);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.VolDrag);
            Dragee.parent.visible = false;
            xatlib.MainSolWrite(("w_Vol" + Dragee.parent.bit), todo.w_Vol[Dragee.parent.bit]);
            if (Dragee.parent.bit == 1)
            {
                if (todo.systemMessages.indexOf("v") != -1)
                {
                    if (chat.sending_lc)
                    {
                        chat.sending_lc.send(chat.fromxat, "onMsg", 12, "v", (((todo.w_sound & 1)) ? todo.w_Vol[1] : 0));
                    };
                };
            };
        }

        function ButRollOver(_arg_1:MouseEvent)
        {
            var _local_2:*;
            if (_arg_1.currentTarget.bit == 1)
            {
                if ((todo.w_sound & _arg_1.currentTarget.bit))
                {
                    _local_2 = xconst.ST(11);
                } else
                {
                    _local_2 = xconst.ST(10);
                };
            };
            if (_arg_1.currentTarget.bit == 2)
            {
                if ((todo.w_sound & _arg_1.currentTarget.bit))
                {
                    _local_2 = xconst.ST(179);
                } else
                {
                    _local_2 = xconst.ST(180);
                };
            };
            _arg_1.currentTarget.vol.visible = true;
            _arg_1.currentTarget.Count = 12;
            _arg_1.currentTarget.addEventListener(Event.ENTER_FRAME, this.ButRollTick);
            main.hint.Hint(xatlib.NX(0), -(xatlib.NY(24)), _local_2, true, 1, un, 0, _arg_1.currentTarget);
        }

        function ButRollTick(_arg_1:Event)
        {
            _arg_1.currentTarget.Count--;
            if (_arg_1.currentTarget.Count < 0)
            {
                _arg_1.currentTarget.vol.visible = false;
                _arg_1.currentTarget.removeEventListener(Event.ENTER_FRAME, this.ButRollTick);
            };
        }

        function ButPress(_arg_1:*, _arg_2:*=null)
        {
            var _local_3:*;
            if (_arg_1)
            {
                _local_3 = _arg_1.currentTarget;
            } else
            {
                _local_3 = _arg_2.parent.parent;
            };
            if (((_arg_1) && ((_arg_1.stageY < _local_3.y))))
            {
                return;
            };
            if ((_local_3.bit & 3))
            {
                if ((todo.w_sound & _local_3.bit))
                {
                    todo.w_sound = (todo.w_sound & ~(_local_3.bit));
                    _local_3.xitem.SoundIsOff.visible = true;
                } else
                {
                    todo.w_sound = (todo.w_sound | _local_3.bit);
                    _local_3.xitem.SoundIsOff.visible = false;
                };
                tickcode.SetRadio();
                xatlib.MainSolWrite("w_sound", todo.w_sound);
                if (_local_3.bit == 1)
                {
                    if (todo.systemMessages.indexOf("v") != -1)
                    {
                        if (chat.sending_lc)
                        {
                            chat.sending_lc.send(chat.fromxat, "onMsg", 12, "v", (((todo.w_sound & 1)) ? todo.w_Vol[1] : 0));
                        };
                    };
                };
            };
        }

        public function onMsg()
        {
            var uid:* = undefined;
            if (ProfileUserNo != 0)
            {
                uid = xatlib.FindUser(ProfileUserNo);
                if (uid >= 0)
                {
                    sending_profile.send("sprofile", "onMsg", todo.Users[uid], xatlib.GetUserStatus(uid));
                };
            };
            try
            {
                if (receiving_profile != null)
                {
                    receiving_profile.close();
                };
                if (sending_profile != null)
                {
                    sending_profile.close();
                };
            } catch(error:Error)
            {
            };
            ProfileUserNo = 0;
            receiving_profile = null;
            sending_profile = null;
        }

        public function GotoProfile(Userno:*)
        {
            var url:* = undefined;
            var uid:* = undefined;
            if (todo.config["WEB"])
            {
                try
                {
                    if (receiving_profile != null)
                    {
                        receiving_profile.close();
                    };
                    if (sending_profile != null)
                    {
                        sending_profile.close();
                    };
                } catch(error:Error)
                {
                };
                ProfileUserNo = Userno;
                receiving_profile = new LocalConnection();
                sending_profile = new LocalConnection();
                receiving_profile.client = this;
                try
                {
                    receiving_profile.connect("profile");
                } catch(error:ArgumentError)
                {
                };
                url = "//xat.me/";
                uid = xatlib.FindUser(Userno);
                if (todo.Users[uid].registered != undefined)
                {
                    url = (url + todo.Users[uid].registered);
                } else
                {
                    url = (url + "unregistered");
                };
                xatlib.getURL(url, "_blank");
            };
        }

        public function UpdateEmotes()
        {
            var _local_7:*;
            var _local_11:*;
            var _local_12:Boolean;
            var _local_13:Boolean;
            var _local_14:*;
            var _local_15:*;
            while (this.emotes.numChildren)
            {
                this.emotes.removeChildAt(0);
            };
            em.length = 0;
            var _local_1:* = (xatlib.NY(30) & 1048574);
            var _local_2:* = (xatlib.NX(30) & 1048574);
            if (_local_2 < _local_1)
            {
                _local_1 = _local_2;
            };
            var _local_3:* = xatlib.NX(10);
            var _local_4:* = (xatlib.NY(395) - _local_1);
            var _local_5:* = xatlib.NX(440);
            var _local_6:* = (_local_1 + 3);
            todo.emmax = Math.floor(((_local_5 + 3) / _local_6));
            if (todo.emmax > 16)
            {
                todo.emmax = 16;
            };
            var _local_8:* = 0;
            var _local_9:* = (((todo.gconfig["g74"])!=null) ? todo.gconfig["g74"].split(",") : new Array());
            var _local_10:* = new Array();
            if (!todo.config["nomore"])
            {
                _local_10.push("more");
            };
            if (!todo.config["nokiss"])
            {
                _local_10.push("GetStuff");
            };
            if (!todo.config["nobuy"])
            {
                _local_10.push("GetX");
            };
            _local_7 = 0;
            while (_local_7 < todo.emmax)
            {
                while (!((xconst.smArray[_local_8] < 0)))
                {
                    _local_8++;
                };
                _local_11 = xconst.smArray[(_local_8 - 1)];
                if (_local_7 == (todo.emmax - _local_10.length))
                {
                    _local_11 = _local_10.pop();
                };
                _local_12 = (((((((_local_11 == "GetX")) || ((_local_11 == "News")))) || ((_local_11 == "GetStuff")))) || ((_local_11 == "more")));
                _local_13 = ((_local_12) || ((_local_7 >= _local_9.length)));
                _local_14 = _local_9[_local_7];
                if (!_local_13)
                {
                    _local_13 = !(xatlib.SmOk(_local_14));
                };
                if (_local_13)
                {
                    em[_local_7] = new library(_local_11);
                    this.emotes.addChild(em[_local_7]);
                    em[_local_7].scaleX = (em[_local_7].scaleY = (_local_1 / 20));
                    em[_local_7].visible = false;
                } else
                {
                    em[_local_7] = new MovieClip();
                    em[_local_7].SF = 2;
                    em[_local_7].SA = (("(" + _local_14) + ")");
                    em[_local_7].mc = new smiley(em[_local_7], _local_14, _local_1);
                    em[_local_7].cs = em[_local_7].SA;
                    this.emotes.addChild(em[_local_7]);
                    em[_local_7].visible = false;
                };
                em[_local_7].x = (em[_local_7].startx = (_local_3 + (_local_7 * _local_6)));
                em[_local_7].y = (em[_local_7].starty = _local_4);
                em[_local_7].starts = em[_local_7].scaleX;
                em[_local_7].buttonMode = true;
                em[_local_7].n = _local_7;
                if (_local_12)
                {
                    em[_local_7].cs = _local_11;
                } else
                {
                    em[_local_7].s = (_local_8 - 2);
                    em[_local_7].t = (_local_8 - 1);
                };
                em[_local_7].addEventListener(MouseEvent.MOUSE_DOWN, this.onSmilieMouseDown);
                em[_local_7].addEventListener(MouseEvent.ROLL_OVER, this.onSmilieMouseRollOver);
                em[_local_7].addEventListener(MouseEvent.ROLL_OUT, this.onSmilieMouseRollOut);
                _local_8++;
                _local_7++;
            };
            this.CreateSoundIcon("Speaker", 1);
            if (!todo.bThin)
            {
                this.CreateSoundIcon("Radio", 2);
            };
            if (!(xconst.f_NoSmilies & todo.FlagBits))
            {
                _local_15 = 0;
                while (_local_15 < todo.emmax)
                {
                    if (em[_local_15])
                    {
                        em[_local_15].visible = true;
                    };
                    _local_15++;
                };
            } else
            {
                em[0].visible = true;
            };
        }


    }
}//package 

