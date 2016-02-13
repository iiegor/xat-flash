// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//DialogEdit

package 
{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.events.MouseEvent;
    import flash.text.TextFieldType;
    import flash.events.FocusEvent;
    import flash.events.Event;
    import flash.xml.XMLDocument;
    import flash.net.ObjectEncoding;
    import flash.events.*;
    import flash.xml.*;
    import flash.display.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;

    public class DialogEdit extends Sprite 
    {

        static var mcWF:MovieClip = null;
        static var ldr:Loader = null;

        const ud;

        var eip_back;
        var eip_pw;
        var eip_id;
        var eip_oldback;
        var eip_i:Array;
        var eip_w:Array;
        var eip_h:Array;
        var EIPrunning;
        var eip_xml;
        var xurltextbox;
        var eip_busy;
        var mcbackbackgroundb;
        var backgroup;
        var ImagePaneVars;
        var mcbackbackground;
        var urltextbox_text;
        var Dia;
        var gnode;
        var bpw;
        var bph;
        var bpx;
        var bpy;
        var bscrollmc;
        var NewLobbySet;
        var group;
        var mceditbackground;
        var mcbackbackgroundmask;
        var ImagePaneData = null;
        var sMode;
        var mcgetbackground;
        var mcgetchat;
        var mcgetagroup;
        var mcmakeagroup;
        var mcgetgroup;

        public function DialogEdit(_arg_1:*)
        {
            this.eip_i = new Array();
            this.eip_w = new Array();
            this.eip_h = new Array();
            this.ImagePaneVars = new Object();
            super();
            this.sMode = _arg_1;
            if (_arg_1)
            {
                this.Dia = (this.mceditbackground = new xDialog(this, xatlib.NX(20), xatlib.NY(20), xatlib.NX(600), xatlib.NY(440), (" " + xconst.ST(44)), undefined, 0, this.mceditbackground_close));
                this.Dia.mcreturn2 = new xBut(this.Dia, xatlib.NX(220), xatlib.NY(420), xatlib.NX(200), xatlib.NY(30), xconst.ST(45), this.EditClose);
                this.Dia.ChangeBack = new xBut(this.Dia, xatlib.NX(30), xatlib.NY(60), xatlib.NX(185), xatlib.NY(30), xconst.ST(46), this.SwitchToBackMode);
                this.Dia.ChangeGroups = new xBut(this.Dia, xatlib.NX(227), xatlib.NY(60), xatlib.NX(185), xatlib.NY(30), xconst.ST(47), this.SwitchToGroupMode);
                this.Dia.mcadvanced = new xBut(this.Dia, xatlib.NX(424), xatlib.NY(60), xatlib.NX(185), xatlib.NY(30), xconst.ST(49), this.mcadvanced_onRelease);
                this.Dia.mcadvanced.hint = {
                    "mc":this.Dia.mcadvanced,
                    "Hint":xconst.ST(48)
                };
                this.Dia.mcadvanced.addEventListener(MouseEvent.ROLL_OVER, main.hint.EasyHint);
                this.Dia = new MovieClip();
                this.mceditbackground.addChild(this.Dia);
                this.NewLobbySet = undefined;
                this.CreateChangeGroup();
                this.eip(8);
            } else
            {
                this.mcgetbackground = new xDialog(this, xatlib.NX(20), xatlib.NY(20), xatlib.NX(600), xatlib.NY(440), (" " + xconst.ST(92)), undefined, 0, this.mcgetbackground_close);
                this.Dia = this.mcgetbackground.Dia;
                this.mcgetbackground.Dia.mcreturn = new xBut(this.Dia, xatlib.NX(240), xatlib.NY(420), xatlib.NX(160), xatlib.NY(30), xconst.ST(45), this.mcreturn_onRelease);
                this.mcgetchat = new xBut(this.Dia, xatlib.NX((0 + 22)), xatlib.NY(24), xatlib.NX(160), xatlib.NY(24), xconst.ST(5), this.mcgetchat_onRelease);
                if (((!((global.gn == undefined))) && (!((global.gn == xconst.ST(0))))))
                {
                    this.mcgetgroup = new xBut(this.Dia, xatlib.NX((160 + 42)), xatlib.NY(24), xatlib.NX(160), xatlib.NY(24), xconst.ST(212, global.gn), this.mcgetgroup_onRelease);
                } else
                {
                    this.mcgetchat.TextCol = ~(todo.ButCol);
                };
                this.mcmakeagroup = new xBut(this.Dia, xatlib.NX((320 + 62)), xatlib.NY(24), xatlib.NX(160), xatlib.NY(24), xconst.ST(213), this.mcmakeagroup_onRelease);
                this.eip(2);
            };
        }

        public function CreateChangeBackground()
        {
            this.Dia.mcget = new xBut(this.Dia, xatlib.NX(486), xatlib.NY((60 + 50)), xatlib.NX(120), xatlib.NY(30), xconst.ST(39), this.mclget_onRelease);
            this.Dia.mcget.SetHint(xconst.ST(38));
            this.Dia.bkgtext = this.Dia;
            xatlib.createTextNoWrap(this.Dia.bkgtext, xatlib.NX(24), xatlib.NY((60 + 50)), xatlib.NX(120), xatlib.NY(30), xconst.ST(40), 0x202020, 0, 100, 0, 24, "left", 1);
            var _local_1:* = xatlib.AddBackground(this.Dia, xatlib.NX(140), xatlib.NY((60 + 50)), xatlib.NX(338), xatlib.NY(30));
            this.xurltextbox = xatlib.AddTextField(this.Dia, xatlib.NX(140), xatlib.NY((60 + 50)), xatlib.NX(338), xatlib.NY(30));
            this.xurltextbox.type = TextFieldType.INPUT;
            this.xurltextbox.defaultTextFormat = main.fmt;
            this.xurltextbox.multiline = true;
            this.xurltextbox.addEventListener(FocusEvent.FOCUS_IN, this.OnFocus);
            this.xurltextbox.addEventListener(Event.CHANGE, this.OnCR);
            this.CreateBackPane();
        }

        function OnFocus(_arg_1:*)
        {
            if (this.xurltextbox.text == ((" <" + xconst.ST(38)) + ">"))
            {
                this.xurltextbox.text = "";
            };
        }

        function OnCR(_arg_1:Event)
        {
            var _local_2:*;
            _local_2 = 0;
            while (_local_2 < this.xurltextbox.text.length)
            {
                if (this.xurltextbox.text.charAt(_local_2) == "\r")
                {
                    this.xurltextbox.text = this.xurltextbox.text.substr(0, _local_2);
                    if (_local_2 != 0)
                    {
                        this.mclget_onRelease(undefined);
                    };
                    return;
                };
                _local_2++;
            };
        }

        function CreateChangeGroup()
        {
            this.Dia.bkgtext = this.Dia;
            xatlib.createTextNoWrap(this.Dia.bkgtext, xatlib.NX(28), xatlib.NY((60 + 50)), xatlib.NX(215), xatlib.NY(30), xconst.ST(41), 0, 0, 100, 0, 18, "left", 1);
            xatlib.createTextNoWrap(this.Dia.bkgtext, xatlib.NX(28), xatlib.NY(360), xatlib.NX(315), xatlib.NY(60), xconst.ST(42), 0, 0, 100, 0, xatlib.NY(12), "left", 2);
            var _local_1:* = xatlib.AddBackground(this.Dia, xatlib.NX(250), xatlib.NY((60 + 50)), xatlib.NX(270), xatlib.NY(30));
            this.xurltextbox = xatlib.AddTextField(this.Dia, xatlib.NX(250), xatlib.NY(((60 + 50) + 5)), xatlib.NX(270), xatlib.NY(30));
            this.xurltextbox.type = TextFieldType.INPUT;
            this.xurltextbox.defaultTextFormat = main.fmt;
            this.Dia.getgroup = new xBut(this.Dia, xatlib.NX(((640 - 30) - 80)), xatlib.NY((60 + 50)), xatlib.NX(80), xatlib.NY(30), xconst.ST(131), this.GetTextGroup);
            this.bpw = xatlib.NX(580);
            this.bph = xatlib.NY(((300 - 50) - 50));
            this.bpx = xatlib.NX(30);
            this.bpy = xatlib.NY((100 + 50));
            var _local_2:* = xatlib.AddBackground(this.Dia, this.bpx, this.bpy, this.bpw, this.bph);
            this.backgroup = new MovieClip();
            _local_2.addChild(this.backgroup);
            this.backgroup.Width = this.bpw;
            var _local_3:* = xatlib.AddBackground(this.Dia, (this.bpx + 1), (this.bpy + 1), ((this.bpw - 2) - xatlib.NX(16)), (this.bph - 2), 0);
            this.backgroup.mask = _local_3;
            this.bscrollmc = new xScroll(this.Dia, ((this.bpx + this.bpw) - xatlib.NX(16)), this.bpy, xatlib.NX(16), this.bph, xatlib.NX(16), xatlib.NX(32), 30, (10 * 100), (0 * 100), this.onBackScrollChange);
            this.Dia.makegroup = new xBut(this.Dia, (xatlib.NX(((640 - 30) - 80)) - 100), xatlib.NY(359), (xatlib.NX(80) + 100), xatlib.NY(30), xconst.ST(43), this.CreateGrpRel);
        }

        function onBackScrollChange()
        {
            var _local_1:* = (this.ImagePaneVars.Height - this.bph);
            if (_local_1 < 0)
            {
                _local_1 = 0;
            };
            this.bscrollmc.Scr_size = _local_1;
            var _local_2:* = this.bscrollmc.Scr_position;
            this.backgroup.y = -(_local_2);
        }

        function CreateGrpRel(_arg_1:*)
        {
            var _local_2:* = (todo.chatdomain + "creategroup.php");
            xatlib.UrlPopup(xconst.ST(43), _local_2);
        }

        function SetGrpChks()
        {
            var _local_1:* = 0;
            while (_local_1 < this.gnode.length)
            {
                if (this.gnode[_local_1].chk)
                {
                    this.gnode[_local_1].chk.xitem.tick.visible = (this.gnode[_local_1].sel == true);
                };
                _local_1++;
            };
        }

        function EditClose(_arg_1:*)
        {
            var _local_2:*;
            if (this.NewLobbySet != undefined)
            {
                todo.MainFlagBits = (todo.MainFlagBits & ~(xconst.f_Lobby));
                _local_2 = 0;
                while (_local_2 < this.gnode.length)
                {
                    if (this.gnode[_local_2].sel)
                    {
                        todo.MainFlagBits = (todo.MainFlagBits | xconst.f_Lobby);
                        todo.BackVars[1] = this.gnode[_local_2].n;
                        todo.BackVars[2] = xatlib.xInt(this.gnode[_local_2].r);
                        break;
                    };
                    _local_2++;
                };
                this.eip(16);
                main.ctabsmc.tabs[1].t = todo.BackVars[1];
                main.ctabsmc.tabs[1].h = (main.ctabsmc.tabs[1].t + " ");
                this.group = todo.BackVars[2];
                if ((xconst.f_Lobby & todo.MainFlagBits))
                {
                    main.ctabsmc.tabs[0].Skip = undefined;
                    main.ctabsmc.tabs[1].Skip = undefined;
                } else
                {
                    main.ctabsmc.tabs[0].Skip = true;
                    main.ctabsmc.tabs[1].Skip = true;
                };
                main.ctabsmc.UpdateTabs(0);
            };
            main.closeDialog();
        }

        function GetTextGroup(_arg_1:*)
        {
            this.eip((32 + 8));
            this.CloseStuff();
            this.CreateChangeGroup();
        }

        function SwitchToGroupMode(_arg_1:*)
        {
            this.CloseStuff();
            this.CreateChangeGroup();
            this.eip(8);
        }

        function SwitchToBackMode(_arg_1:*)
        {
            this.CloseStuff();
            this.CreateChangeBackground();
            this.eip(2);
        }

        function CloseStuff()
        {
            if (this.mcbackbackgroundb)
            {
                this.Dia.removeChild(this.mcbackbackgroundb);
            };
            this.mcbackbackgroundb = null;
            if (this.mcbackbackgroundmask)
            {
                this.Dia.removeChild(this.mcbackbackgroundmask);
            };
            this.mcbackbackgroundmask = null;
            if (this.bscrollmc)
            {
                this.bscrollmc.Delete();
            };
            this.bscrollmc = null;
            if (this.Dia)
            {
                this.mceditbackground.removeChild(this.Dia);
            };
            this.Dia = new MovieClip();
            this.mceditbackground.addChild(this.Dia);
        }

        function mceditbackground_close()
        {
            if (this.sMode == 0)
            {
                this.mcgetbackground_close();
                return;
            };
            this.CloseStuff();
            if (this.mceditbackground)
            {
                this.mceditbackground.Delete();
                this.Dia = (this.mceditbackground = null);
            };
            this.ImagePaneData = null;
            todo.DoUpdate = true;
            main.closeDialog();
        }

        function mclget_onRelease(_arg_1:*)
        {
            this.eip_back = this.xurltextbox.text;
            this.eip(2);
        }

        function mcadvanced_onRelease(_arg_1:*)
        {
            var _local_4:String;
            var _local_2 = (todo.usedomain + "/web_gear/chat.php");
            var _local_3:String = _local_2;
            if (this.eip_id != undefined)
            {
                _local_2 = (_local_2 + ((("?id=" + this.eip_id) + "&pw=") + this.eip_pw));
                if (global.xb != undefined)
                {
                    _local_2 = (_local_2 + ("&xb=" + global.xb));
                };
                _local_3 = _local_2;
                _local_4 = ((" " + xconst.ST(50)) + " ");
            } else
            {
                _local_3 = " xat.com/c ";
                _local_4 = ((" " + xconst.ST(51)) + " ");
            };
            xatlib.UrlPopup(_local_4, _local_3);
        }

        public function eip(_arg_1:Number)
        {
            if (this.EIPrunning)
            {
                return;
            };
            this.EIPrunning = true;
            this.ClearBackPane();
            if (this.eip_back == undefined)
            {
                this.eip_back = "";
                if (((todo.pass) && (todo.w_mainowner)))
                {
                    this.eip_back = todo.BackVars[0];
                };
            };
            if ((((((this.eip_pw == undefined)) && (todo.w_mainowner))) && (todo.pass)))
            {
                this.eip_pw = todo.pass;
            };
            if (this.eip_id == undefined)
            {
                this.eip_id = 0;
                if (((todo.pass) && (todo.w_mainowner)))
                {
                    this.eip_id = todo.w_room;
                };
            };
            todo.BackVars[0] = this.eip_back;
            var _local_2:* = this.JoinBackground();
            var _local_3:String = (((((((((((todo.chatdomain + "eip.php?id=") + this.eip_id) + "&pw=") + this.eip_pw) + "&md=") + _arg_1) + "&back=") + _local_2) + "&fg=") + todo.MainFlagBits) + xatlib.TimeStamp());
            if ((_arg_1 & 32))
            {
                _local_3 = (_local_3 + ("&s=" + this.xurltextbox.text));
            };
            _local_3 = xatlib.searchreplace("#", "%23", _local_3);
            var _local_4:* = xatlib.LoadVariables(_local_3, this.eip_xml_onLoad);
            this.ShowBusyMessage();
        }

        function ShowBusyMessage()
        {
            if (!this.mcbackbackgroundb)
            {
                return;
            };
            if (this.eip_busy)
            {
                main.box_layer.removeChild(this.eip_busy);
            };
            this.eip_busy = new MovieClip();
            main.box_layer.addChild(this.eip_busy);
            xatlib.createTextNoWrap(this.eip_busy, (this.mcbackbackgroundb.x + (this.mcbackbackgroundb.width * 0.15)), this.mcbackbackgroundb.y, (this.mcbackbackgroundb.width * 0.7), this.mcbackbackgroundb.height, xconst.ST(52), 0x202020, 0, 100, 0, 24, "left", 1);
        }

        function eip_busy_box(_arg_1:String)
        {
            if (this.eip_busy)
            {
                main.box_layer.removeChild(this.eip_busy);
            };
            this.eip_busy = new MovieClip();
            main.box_layer.addChild(this.eip_busy);
            xatlib.createTextNoWrap(this.eip_busy, (this.mcbackbackgroundb.x + (this.mcbackbackgroundb.width * 0.15)), this.mcbackbackgroundb.y, (this.mcbackbackgroundb.width * 0.7), this.mcbackbackgroundb.height, _arg_1, 0xF00000, 0, 100, 0, 24, "left", 1);
        }

        function PreviewF(_arg_1:*)
        {
            xatlib.UrlPopup(xconst.ST(53), _arg_1.currentTarget.u);
        }

        function eip_xml_onLoad(_arg_1:Event)
        {
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            var _local_12:*;
            var _local_13:*;
            var _local_14:*;
            var _local_15:*;
            var _local_16:*;
            this.EIPrunning = false;
            if (this.eip_busy)
            {
                main.box_layer.removeChild(this.eip_busy);
            };
            this.eip_busy = null;
            this.eip_xml = new XMLDocument();
            this.eip_xml.ignoreWhite = true;
            this.eip_xml.parseXML(_arg_1.currentTarget.data);
            if (!this.eip_xml.firstChild)
            {
                this.eip_busy_box(xconst.ST(54));
                return;
            };
            var _local_2:* = new XMLDocument();
            var _local_3:* = _local_2.createElement("r");
            _local_2.appendChild(_local_3);
            network.socket.send(_local_2);
            this.ClearBackPane();
            var _local_4:* = this.eip_xml.firstChild.childNodes;
            this.gnode = undefined;
            var _local_5:* = 0;
            while (_local_5 < _local_4.length)
            {
                if (_local_4[_local_5].nodeName == "sdown")
                {
                    this.eip_busy_box(xconst.ST(55));
                    return;
                };
                if (_local_4[_local_5].nodeName == "group")
                {
                    this.gnode = new Array();
                    _local_7 = _local_4[_local_5].childNodes.length;
                    _local_8 = 0;
                    while (_local_8 < _local_7)
                    {
                        this.gnode[_local_8] = new Object();
                        _local_9 = _local_4[_local_5].childNodes[_local_8].attributes;
                        for (_local_10 in _local_9)
                        {
                            this.gnode[_local_8][_local_10] = _local_9[_local_10];
                        };
                        _local_8++;
                    };
                };
                if (_local_4[_local_5].nodeName == "oldback")
                {
                    this.eip_oldback = xatlib.xInt(_local_4[_local_5].attributes.v);
                };
                if (_local_4[_local_5].nodeName == "back")
                {
                    xatlib.SplitBackground(_local_4[_local_5].attributes.v);
                    this.eip_back = todo.BackVars[0];
                } else
                {
                    if (_local_4[_local_5].nodeName == "pw")
                    {
                        this.eip_pw = xatlib.xInt(_local_4[_local_5].attributes.v);
                    } else
                    {
                        if (_local_4[_local_5].nodeName == "id")
                        {
                            this.eip_id = xatlib.xInt(_local_4[_local_5].attributes.v);
                        } else
                        {
                            if (_local_4[_local_5].nodeName.charAt(0) == "i")
                            {
                                this.eip_i[xatlib.xInt(_local_4[_local_5].nodeName.substr(1))] = _local_4[_local_5].attributes.v;
                            } else
                            {
                                if (_local_4[_local_5].nodeName.charAt(0) == "w")
                                {
                                    this.eip_w[xatlib.xInt(_local_4[_local_5].nodeName.substr(1))] = _local_4[_local_5].attributes.v;
                                } else
                                {
                                    if (_local_4[_local_5].nodeName.charAt(0) == "h")
                                    {
                                        this.eip_h[xatlib.xInt(_local_4[_local_5].nodeName.substr(1))] = _local_4[_local_5].attributes.v;
                                    };
                                };
                            };
                        };
                    };
                };
                _local_5++;
            };
            if (this.gnode)
            {
                if (this.gnode[0].nodeName != "g0")
                {
                    this.gnode.unshift(new Object());
                    this.gnode[0] = new Object();
                    this.gnode[0].n = todo.BackVars[1];
                    this.gnode[0].r = todo.BackVars[2];
                    this.gnode[0].d = "";
                    _local_8 = 1;
                    while (_local_8 < this.gnode.length)
                    {
                        if (xatlib.xInt(this.gnode[_local_8].r) == todo.BackVars[2])
                        {
                            this.gnode[0].d = this.gnode[_local_8].d;
                        };
                        _local_8++;
                    };
                } else
                {
                    this.NewLobbySet = true;
                };
                _local_11 = 0;
                _local_8 = 0;
                while (_local_8 < this.gnode.length)
                {
                    _local_12 = (xatlib.xInt(this.gnode[_local_8].r) == todo.BackVars[2]);
                    if (!((((!((_local_8 == 0))) && (_local_12))) && (!(this.NewLobbySet))))
                    {
                        if (((!((todo.MainFlagBits & xconst.f_Lobby))) || (this.NewLobbySet)))
                        {
                            _local_12 = false;
                        };
                        if (((this.NewLobbySet) && ((_local_8 == 0))))
                        {
                            _local_12 = true;
                        };
                        _local_13 = new MovieClip();
                        this.backgroup.addChild(_local_13);
                        _local_13.y = (_local_11++ * 20);
                        _local_14 = (this.gnode[_local_8].chk = xatlib.AttachMovie(_local_13, "checkbox"));
                        _local_14.x = 2;
                        _local_14.y = 3;
                        _local_14.xitem.tick.visible = (this.gnode[_local_8].sel = _local_12);
                        _local_14.z = _local_8;
                        _local_14.addEventListener(MouseEvent.MOUSE_DOWN, this.OnCheck);
                        this.ImagePaneVars.Height = (_local_13.y + 20);
                        _local_15 = new MovieClip();
                        _local_13.addChild(_local_15);
                        xatlib.createTextNoWrap(_local_15, 20, 1, 100, 20, this.gnode[_local_8].n, 0x101010, 0, 100, 0, 16, "left", 1);
                        xatlib.createTextNoWrap(_local_15, (20 + 101), 1, ((xatlib.NX((480 - 1)) - 101) - 20), 20, this.gnode[_local_8].d, 0x404040, 0, 100, 0, 14, "left", 1);
                        _local_15.hint = {
                            "Hint":((this.gnode[_local_8].n + ": ") + this.gnode[_local_8].d),
                            "mc":_local_15
                        };
                        _local_15.addEventListener(MouseEvent.ROLL_OVER, main.hint.EasyHint);
                        _local_15.addEventListener(MouseEvent.ROLL_OUT, main.hint.HintOff);
                        _local_16 = new xBut(_local_13, xatlib.NX(480), 2, xatlib.NX(80), 18, xconst.ST(56), this.PreviewF);
                        _local_16.But.u = ((todo.usedomain + "/") + this.gnode[_local_8].n);
                    };
                    _local_8++;
                };
                this.SetGrpChks();
                return;
            };
            if (global.xb != undefined)
            {
                this.eip_i.unshift(global.xb);
                this.eip_h.unshift(todo.StageHeight);
                this.eip_w.unshift(todo.StageWidth);
            };
            if (this.xurltextbox)
            {
                if (this.urltextbox_text == undefined)
                {
                    this.urltextbox_text = 1;
                    this.xurltextbox.text = ((" <" + xconst.ST(38)) + ">");
                };
                if (this.xurltextbox.text.indexOf("web_gear/background") >= 0)
                {
                    this.xurltextbox.text = "";
                };
            };
            var _local_6:* = ("id=" + this.eip_id);
            if (this.eip_id != todo.w_useroom)
            {
                this.SetEmbedCode(this.eip_id);
            };
            this.CreateImagePane(this.mcbackbackground, this.eip_i, 100, 75);
            this.SaveEipInCookie();
        }

        function OnCheck(_arg_1:MouseEvent)
        {
            var _local_2:* = _arg_1.currentTarget.z;
            var _local_3:* = (this.gnode[_local_2].sel == true);
            var _local_4:* = 0;
            while (_local_4 < this.gnode.length)
            {
                this.gnode[_local_4].sel = false;
                _local_4++;
            };
            this.gnode[_local_2].sel = !(_local_3);
            this.SetGrpChks();
            this.NewLobbySet = true;
        }

        function SaveEipInCookie()
        {
            if (this.eip_id == undefined)
            {
                return;
            };
            if (this.eip_id < 1)
            {
                return;
            };
            if (this.eip_pw == undefined)
            {
                return;
            };
            var _local_1:* = xatlib.getLocal(("chat" + String(this.eip_id)), "/");
            _local_1.objectEncoding = ObjectEncoding.AMF0;
            if (_local_1 != null)
            {
                _local_1.data.pass = this.eip_pw;
                _local_1.flush();
            };
        }

        function CreateImagePane(_arg_1:*, _arg_2:Array, _arg_3:Number, _arg_4:Number)
        {
            var _local_6:String;
            var _local_7:String;
            var _local_10:*;
            var _local_11:*;
            if (!_arg_1)
            {
                return;
            };
            var _local_5 = (todo.usedomain + "/web_gear/background/");
            this.ImagePaneVars.gap = 5;
            this.ImagePaneVars.pWidth = (_arg_1.Width - 19);
            var _local_8:* = int(((this.ImagePaneVars.pWidth / (_arg_3 + this.ImagePaneVars.gap)) + 0.5));
            this.ImagePaneVars.tw = int(((this.ImagePaneVars.pWidth - (this.ImagePaneVars.gap * (_local_8 - 1))) / _local_8));
            _arg_4 = int(((this.ImagePaneVars.tw * _arg_4) / _arg_3));
            this.ImagePaneVars.th = _arg_4;
            _arg_3 = this.ImagePaneVars.tw;
            this.ImagePaneVars.xofst = int((((this.ImagePaneVars.pWidth - (_local_8 * _arg_3)) - ((_local_8 - 1) * this.ImagePaneVars.gap)) / 2));
            this.ImagePaneVars.mcPane = _arg_1;
            this.ImagePaneData = new Array();
            var _local_9:* = 0;
            while (_local_9 < _arg_2.length)
            {
                _local_10 = new MovieClip();
                _arg_1.addChild(_local_10);
                if (_arg_2[_local_9].substr(0, 4) == "http")
                {
                    _local_6 = _arg_2[_local_9];
                    _local_7 = _local_6;
                } else
                {
                    _local_6 = (((_local_5 + "xat_") + _arg_2[_local_9]) + ".jpg");
                    _local_7 = (((_local_5 + "jdothumb/xat_") + _arg_2[_local_9]) + ".jpg");
                };
                _local_10.back = _local_6;
                if ((((this.eip_w[_local_9] > 0)) && ((this.eip_h[_local_9] > 0))))
                {
                    _local_10.Aspect = (this.eip_w[_local_9] / this.eip_h[_local_9]);
                };
                this.ImagePaneData[_local_9] = _local_10;
                _local_11 = new MovieClip();
                _local_10.addChild(_local_11);
                _local_10.pic = _local_10;
                xatlib.LoadMovie(_local_11, _local_7);
                _local_10.visible = false;
                _local_9++;
            };
        }

        function ImagePaneTick()
        {
            var _local_1:Number;
            var _local_3:*;
            var _local_4:*;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:*;
            if (!this.ImagePaneData)
            {
                return;
            };
            var _local_2:Boolean;
            _local_1 = 0;
            while (_local_1 < this.ImagePaneData.length)
            {
                _local_3 = this.ImagePaneData[_local_1];
                _local_4 = _local_3.pic;
                if (((!(_local_3.Done)) && ((_local_4.width > 0))))
                {
                    _local_3.Done = true;
                    _local_2 = true;
                    _local_4.width = this.ImagePaneVars.tw;
                    _local_4.height = this.ImagePaneVars.th;
                    if (_local_3.Aspect != undefined)
                    {
                        _local_4.width = int((this.ImagePaneVars.th * _local_3.Aspect));
                        if (_local_4.width > (this.ImagePaneVars.tw * 2))
                        {
                            _local_4.width = (this.ImagePaneVars.tw * 2);
                        };
                    };
                    _local_3.visible = true;
                    _local_3.addEventListener(MouseEvent.MOUSE_DOWN, this.PicPress);
                    _local_3.hint = {
                        "mc":_local_3,
                        "Hint":xconst.ST(57)
                    };
                    _local_3.addEventListener(MouseEvent.ROLL_OVER, main.hint.EasyHint);
                    _local_3.addEventListener(MouseEvent.ROLL_OUT, main.hint.HintOff);
                };
                _local_1++;
            };
            if (_local_2)
            {
                _local_5 = this.ImagePaneVars.xofst;
                _local_6 = 0;
                _local_1 = 0;
                while (_local_1 < this.ImagePaneData.length)
                {
                    _local_3 = this.ImagePaneData[_local_1];
                    if (_local_3.Done)
                    {
                        if ((_local_5 + _local_3.pic.width) > this.ImagePaneVars.pWidth)
                        {
                            _local_5 = this.ImagePaneVars.xofst;
                            _local_6 = (_local_6 + (this.ImagePaneVars.th + this.ImagePaneVars.gap));
                        };
                        _local_3.y = _local_6;
                        _local_3.x = _local_5;
                        _local_5 = (_local_5 + (_local_3.pic.width + this.ImagePaneVars.gap));
                    };
                    _local_1++;
                };
                this.ImagePaneVars.Height = _local_6;
                _local_7 = (this.ImagePaneVars.Height - this.bph);
                if (_local_7 < 0)
                {
                    _local_7 = 0;
                };
                this.bscrollmc.ssize = _local_7;
            };
        }

        function PicPress(_arg_1:*)
        {
            this.eip_back = _arg_1.currentTarget.back;
            chat.mainDlg.UpdateBackground(this.eip_back);
            this.eip(4);
            this.ClearBackPane();
            this.mceditbackground_close();
        }

        function ClearBackPane(_arg_1:*=undefined)
        {
            var _local_2:*;
            if (this.eip_busy)
            {
                main.box_layer.removeChild(this.eip_busy);
            };
            this.eip_busy = null;
            if (this.ImagePaneData)
            {
                _local_2 = 0;
                while (_local_2 < this.ImagePaneData.length)
                {
                    this.mcbackbackground.removeChild(this.ImagePaneData[_local_2]);
                    _local_2++;
                };
            };
            this.ImagePaneData = new Array();
            this.eip_w = new Array();
            this.eip_h = new Array();
            this.eip_i = new Array();
            if (((((!((_arg_1 == undefined))) && (this.mcbackbackground))) && (this.mcbackbackgroundb)))
            {
                this.mcbackbackgroundb.removeChild(this.mcbackbackground);
                this.mcbackbackground = null;
            };
        }

        function CreateBackPane()
        {
            this.ClearBackPane(1);
            this.bpw = xatlib.NX(580);
            this.bph = xatlib.NY((300 - 50));
            this.bpx = xatlib.NX(30);
            this.bpy = xatlib.NY((100 + 50));
            this.mcbackbackgroundb = xatlib.AddBackground(this.Dia, this.bpx, this.bpy, this.bpw, this.bph);
            this.mcbackbackground = new MovieClip();
            this.mcbackbackgroundb.addChild(this.mcbackbackground);
            this.mcbackbackground.Width = this.bpw;
            this.mcbackbackgroundmask = xatlib.AddBackground(this.Dia, (this.bpx + 1), (this.bpy + 1), ((this.bpw - 2) - xatlib.NX(16)), (this.bph - 2), 0);
            this.mcbackbackground.mask = this.mcbackbackgroundmask;
            this.bscrollmc = new xScroll(this.Dia, ((this.bpx + this.bpw) - xatlib.NX(16)), this.bpy, xatlib.NX(16), this.bph, xatlib.NX(16), xatlib.NX(32), 30, (10 * 100), (0 * 100), this.onBackScrollChange2);
        }

        function onBackScrollChange2()
        {
            var _local_1:* = (this.ImagePaneVars.Height - this.bph);
            if (_local_1 < 0)
            {
                _local_1 = 0;
            };
            this.bscrollmc.Scr_size = _local_1;
            var _local_2:* = this.bscrollmc.Scr_position;
            this.mcbackbackground.y = -(_local_2);
        }

        function JoinBackground():String
        {
            var _local_1:String;
            _local_1 = todo.BackVars[0];
            var _local_2:* = 1;
            while (_local_2 < 12)
            {
                if (todo.BackVars[_local_2] == undefined) break;
                _local_1 = (_local_1 + (";=" + todo.BackVars[_local_2]));
                _local_2++;
            };
            return (_local_1);
        }

        function mcgetchat_onRelease(_arg_1:MouseEvent)
        {
            this.mcreturn_onRelease(_arg_1);
            var _local_2:* = (todo.Http + "//xat.com/web_gear/chat.php");
            xatlib.UrlPopup(xconst.ST(29), _local_2);
        }

        function mcgetgroup_onRelease(_arg_1:MouseEvent)
        {
            this.mcreturn_onRelease(_arg_1);
            var _local_2:* = ((((todo.Http + "//xat.com/web_gear/chat/embed.php?id=") + todo.w_room) + "&GroupName=") + global.gn);
            xatlib.UrlPopup(xconst.ST(269), _local_2);
        }

        function mcmakeagroup_onRelease(_arg_1:MouseEvent)
        {
            this.mcreturn_onRelease(_arg_1);
            var _local_2:* = (todo.Http + "//xat.com/web_gear/chat/creategroup.php");
            xatlib.UrlPopup(xconst.ST(92), _local_2);
        }

        function mcgetbackground_close()
        {
            main.hint.HintOff();
            this.mcgetbackground.Delete();
        }

        function mcreturn_onRelease(_arg_1:MouseEvent)
        {
            this.eip_i.length = 0;
            todo.DoUpdate = true;
            this.mcgetbackground_close();
        }

        function SetEmbedCode(_arg_1:Number, _arg_2:String=null, _arg_3:Boolean=false)
        {
            var _local_5:*;
            if (_arg_3 != true)
            {
                _local_5 = (((((todo.Http + "//xat.com/web_gear/chat.php?id=") + this.eip_id) + "&pw=") + this.eip_pw) + "&f=1");
            } else
            {
                _local_5 = ((((todo.Http + "//xat.com/web_gear/chat/embed.php?id=") + _arg_1) + "&GroupName=") + _arg_2);
            };
            var _local_4 = ((('<embed src="//www.xatech.com/web_gear/chat/chat.swf" quality="high" bgcolor="#000000" width="540" height="405" name="chat" FlashVars="id=' + _arg_1) + (((_arg_3 == true)) ? ("&gn=" + _arg_2) : "")) + '" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="//xat.com/update_flash.shtml" /><br><small><a target="_BLANK" href="//xat.com/web_gear/');
            if (_arg_3)
            {
                _local_4 = (_local_4 + (((((((((("chat/embed.php?id=" + _arg_1) + "&GroupName=") + _arg_2) + '">Get ') + _arg_2) + ' chat group</a> | <a target="_BLANK" href="//xat.com/') + _arg_2) + '"> Goto ') + _arg_2) + " website</a></small><br>"));
            } else
            {
                _local_4 = (_local_4 + (('?cb">Get your own Chat Box!</a> <a target="_BLANK" href="//xat.com/web_gear/chat/go_large.php?id=' + _arg_1) + '">Go Large!</a></small><br>'));
            };
        }


    }
}//package 

