// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//xAvatar

package 
{
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.geom.Rectangle;
    import flash.events.*;
    import flash.display.*;
    import flash.net.*;
    import flash.geom.*;

    public dynamic class xAvatar extends MovieClip 
    {

        static var MovieHash = new Object();
        static var Bin = new recycle();
        public static var atc = 0;
        public static var oatc = 0;

        var mLoader:Loader;
        public var Av;
        var Count;
        var Parent;

        public function xAvatar(_arg_1:MovieClip, _arg_2:String, _arg_3:String="", _arg_4:*=undefined, _arg_5:*=undefined, _arg_6:*=undefined)
        {
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            var _local_12:Number;
            var _local_17:*;
            var _local_18:*;
            var _local_19:*;
            var _local_20:*;
            var _local_21:*;
            var _local_22:*;
            var _local_25:*;
            var _local_26:*;
            super();
            this.Parent = _arg_1;
            this.Av = this;
            if (!_arg_2)
            {
                return;
            };
            if (todo.Users[_arg_5])
            {
                _local_7 = todo.Users[_arg_5].VIP;
                _local_8 = todo.Users[_arg_5].aFlags;
                _local_9 = todo.Users[_arg_5].Powers;
                _local_10 = todo.Users[_arg_5].u;
                _local_11 = todo.Users[_arg_5].cb;
            };
            var _local_13:Boolean;
            var _local_14:* = 0;
            var _local_15:* = xatlib.xInt(_arg_2);
            if ((((((_arg_2.charAt(0) === "(")) && ((_arg_2.indexOf("random") >= 0)))) && (todo.HasPower(_arg_5, 272))))
            {
                _arg_2 = xmessage.DoRandom(_arg_2, _arg_5);
            };
            var _local_16:* = _arg_2;
            _arg_1.addChild(this);
            if (todo.config["noavatars"])
            {
                return;
            };
            if (todo.Macros["avatars"] === "off")
            {
                return;
            };
            if ((_local_8 & 32) != 0)
            {
                this.Av.filters = todo.DropFilter;
            };
            if (_arg_4 != undefined)
            {
                this.Av.addEventListener(MouseEvent.MOUSE_DOWN, _arg_4);
                this.Av.buttonMode = true;
            };
            if (_local_15 > 0)
            {
                _arg_2 = xatlib.UrlAv(_local_15);
            };
            this.Av.b = new MovieClip();
            this.Av.addChild(this.Av.b);
            _local_22 = _arg_2.split(")");
            _local_18 = 0;
            if (_local_22[1] != undefined)
            {
                _local_18++;
            };
            _local_20 = _local_22[_local_18].split("#");
            _local_22 = _local_22[0].split("#");
            _arg_2 = _local_22[0];
            if (_local_20[1])
            {
                if (((((_local_7) && (!(todo.bMobile)))) && (!((todo.Macros["glitter"] == "off")))))
                {
                    _local_17 = _local_20[1].toLowerCase();
                    _local_21 = xconst.Glitters[_local_17];
                    if ((((_local_17 == "snowy")) && (!(todo.HasPowerA(_local_9, 56)))))
                    {
                        _local_21 = false;
                    };
                    if (_local_21)
                    {
                        this.Av.Glitter = _local_20[1];
                        if (((!((_local_21 == 2))) || (xatlib.SmOk(_local_20[2], _local_9))))
                        {
                            this.Av.Glitter2 = _local_20.slice(2).join("#");
                        };
                    };
                };
            };
            var _local_23:* = 0;
            var _local_24:int;
            if (_local_9 != undefined)
            {
                _local_23 = xatlib.xInt(((_local_9[0] >> 18) & 3));
                _local_24 = xatlib.xInt((_local_9[6] & 131072));
            };
            if (todo.Macros["animate"] === "off")
            {
                _local_23 = 0;
            };
            if (_local_23 == 0)
            {
                if ((((_arg_2.indexOf("photobucket.com/") > 1)) && ((_arg_2.indexOf("th_") < 0))))
                {
                    this.Av.U2 = _arg_2;
                    _local_18 = (_arg_2.lastIndexOf("/") + 1);
                    _arg_2 = ((_arg_2.substr(0, _local_18) + "th_") + _arg_2.substr(_local_18));
                };
                if ((((_arg_2.indexOf("tinypic.com/") > 1)) && ((_arg_2.indexOf("_th") < 0))))
                {
                    this.Av.U2 = _arg_2;
                    _local_18 = _arg_2.lastIndexOf(".");
                    _arg_2 = ((_arg_2.substr(0, _local_18) + "_th") + _arg_2.substr(_local_18));
                };
            };
            if (_local_24)
            {
                _arg_2 = todo.flashdomain;
                _local_19 = (this.Av.xavi = _local_10);
                if (!_arg_6)
                {
                    _local_17 = xatlib.xRand(1, 6);
                    if (_local_17 <= 4)
                    {
                        _arg_6 = ("idle" + _local_17);
                    };
                };
                this.Av.action = _arg_6;
                this.Av.cb = _local_11;
            } else
            {
                if (((_local_7) && ((_arg_2.substr(0, 1) == "("))))
                {
                    _local_25 = _arg_2.substr(1);
                    if (!xatlib.SmOk(_local_25, _local_9))
                    {
                        _local_25 = "smile";
                    };
                    this.Av.b.SF = (2 | smiley.f_NoCache);
                    this.Av.b.SA = _local_16;
                    _local_22[0] = _local_22[0].substr(1);
                    xmessage.PowSm(this.Av.b, _local_22, 30, _local_9);
                    this.Av.b.x = (this.Av.b.x + xatlib.xInt(this.Av.b.xx));
                    _arg_2 = (xatlib.SmilieUrl(_local_25, "sm") + "&r=2");
                    _local_19 = _local_25;
                } else
                {
                    if (_local_15 < 0)
                    {
                        if ((((((_arg_2.toLowerCase().indexOf(".jpg") == -1)) && ((_arg_2.toLowerCase().indexOf(".jpeg") == -1)))) && ((_arg_2.toLowerCase().indexOf(".png") == -1))))
                        {
                            _arg_2 = "";
                        };
                        if (_arg_2.toLowerCase().indexOf("xat") != -1)
                        {
                            _arg_2 = "";
                        };
                    };
                };
            };
            if (_local_15 == -1)
            {
                _local_26 = new library("HelpIcon");
                this.Av.addChild(_local_26);
                _local_26.width = (_local_26.height = 30);
                _local_26.xitem.xinfo.visible = false;
                _local_26 = new library("glint");
                this.Av.addChild(_local_26);
                _local_26.width = (_local_26.height = 25);
                _local_26.x = 3;
                _local_26.y = -5;
            } else
            {
                if ((((_arg_2.substr(0, 4) == "http")) || ((_arg_2.substr(0, 2) == "//"))))
                {
                    this.Av.b.c = this.Av.b;
                    this.Av.b.c.visible = false;
                    this.Av.U1 = _arg_2;
                    this.Av.St = 1;
                    this.Av.An = -(_local_23);
                };
                _local_14 = 1;
            };
            this.Av.sm = _local_19;
            this.Count = 18;
            if (_local_14 > 0)
            {
                this.Av.Gray = xatlib.ButtonCurve2(0, 30, 30, 0, 0, 0, 0, 0x808080);
                this.Av.addChild(this.Av.Gray);
                this.Av.Gray.visible = (_local_14 > 18);
                this.Av.Gray.alpha = 0.55;
            };
            addEventListener(Event.ENTER_FRAME, this.Tick);
            this.Parent.addEventListener(Event.REMOVED_FROM_STAGE, this.cleanUp);
        }

        function cleanUp(_arg_1:Event)
        {
            var _local_2:*;
            if (this.Av.Gt)
            {
                if (this.Av.g)
                {
                    this.Av.removeChild(this.Av.g);
                    this.Av.g.unloadAndStop(true);
                    this.Av.g = null;
                };
            };
            if (!this.Av.sm)
            {
                _local_2 = this.Av.b.c;
                if (((_local_2) && (_local_2.ns)))
                {
                    _local_2.removeChild(_local_2.ns);
                    Bin.put(this.Av.U1, _local_2.ns);
                    _local_2.ns = null;
                    _local_2 = null;
                    this.Av = null;
                };
            };
            try
            {
                this.Parent.removeEventListener(Event.REMOVED_FROM_STAGE, this.cleanUp);
                this.removeEventListener(Event.ENTER_FRAME, this.Tick);
            } catch(e)
            {
            };
            this.Parent = undefined;
        }

        function Delete()
        {
        }

        function Tick(_arg_1:Event)
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:MovieClip;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            atc++;
            if (!this.Av)
            {
                return;
            };
            var _local_5:Array = new Array();
            _local_4 = this.Av.b.c;
            if (_local_4 != undefined)
            {
                if (this.Count <= 0)
                {
                    this.Av.Gray.visible = true;
                };
                this.Count--;
                if (this.Av.St == 1)
                {
                    _local_7 = MovieHash[this.Av.U1];
                    if ((((_local_7 == 1)) && ((this.Count > (-12 * 10)))))
                    {
                        return;
                    };
                    if ((((_local_7 == 3)) || ((_local_7 == 1))))
                    {
                        removeEventListener(Event.ENTER_FRAME, this.Tick);
                        this.Av.Gray.visible = true;
                        return;
                    };
                    if (_local_7 == undefined)
                    {
                        MovieHash[this.Av.U1] = 1;
                    };
                    if (this.Av.xavi)
                    {
                        _local_4.ns = new basicxavi(30, 30, 1, this.Av.xavi, this.Av.cb, this.Av.action);
                        _local_4.addChild(_local_4.ns);
                    } else
                    {
                        if (this.Av.sm)
                        {
                            _local_4.SP = (_local_4.SP | smiley.b_glow);
                            _local_4.ns = new smiley(_local_4, this.Av.sm);
                        } else
                        {
                            if (!(_local_4.ns = Bin.grab(this.Av.U1)))
                            {
                                _local_4.ns = new loadbitmap(_local_4, this.Av.U1);
                            } else
                            {
                                _local_4.addChild(_local_4.ns);
                            };
                        };
                    };
                    this.Av.St = 2;
                };
                _local_6 = false;
                if (_local_4.width > 0)
                {
                    MovieHash[this.Av.U1] = 2;
                    if (this.Av.An > 0)
                    {
                        this.Av.Ac = ((this.Av.Ac + 1) % this.Av.Rat);
                        this.Av.scrollRect = new Rectangle((_local_4.height * this.Av.Ac), 0, _local_4.height, _local_4.height);
                    } else
                    {
                        if (((((_local_4.width * _local_4.height) > (0x0400 * 0x0300))) || (((!(this.Av.sm)) && ((_local_4.swfVersion >= 0))))))
                        {
                            MovieHash[this.Av.U1] = 3;
                            _local_4.parent.removeChild(_local_4);
                            this.Count = 0;
                        } else
                        {
                            if (this.Av.xavi)
                            {
                                _local_4.scaleX = (_local_4.scaleX * 0.55);
                                _local_4.scaleY = (_local_4.scaleY * 0.55);
                            } else
                            {
                                if (this.Av.sm)
                                {
                                    _local_4.scaleX = (_local_4.scaleX * 1.58);
                                    _local_4.scaleY = (_local_4.scaleY * 1.58);
                                } else
                                {
                                    this.Av.Rat = xatlib.xInt((_local_4.width / _local_4.height));
                                    if (this.Av.Rat >= 3)
                                    {
                                        if (this.Av.U2 != undefined)
                                        {
                                            _local_4.parent.removeChild(_local_4);
                                            this.Av.U1 = this.Av.U2;
                                            this.Av.U2 = undefined;
                                            this.Av.St = 1;
                                            return;
                                        };
                                        this.Av.Ac = 0;
                                        this.Av.An = -(this.Av.An);
                                        _local_4.scaleX = (_local_4.scaleY = (30 / _local_4.height));
                                        if ((this.Av.An & 2))
                                        {
                                            _local_6 = true;
                                        } else
                                        {
                                            if ((this.Av.An & 1))
                                            {
                                                this.Av.Ac = xatlib.xInt((Math.random() * this.Av.Rat));
                                            };
                                        };
                                        this.Av.scrollRect = new Rectangle((_local_4.height * this.Av.Ac), 0, _local_4.height, _local_4.height);
                                    } else
                                    {
                                        _local_4.scaleX = (30 / _local_4.width);
                                        _local_4.scaleY = (30 / _local_4.height);
                                    };
                                };
                            };
                            _local_4.visible = true;
                            this.Av.removeChild(this.Av.Gray);
                            if (this.Av.Glitter != undefined)
                            {
                                _local_8 = xatlib.SmilieUrl(this.Av.Glitter, "gt2");
                                if (this.Av.Glitter2)
                                {
                                    _local_8 = (_local_8 + ("&s=" + this.Av.Glitter2));
                                };
                                this.Av.Gt = _local_8;
                                if (!(this.Av.g = Bin.grab(_local_8)))
                                {
                                    this.Av.g = xatlib.LoadMovie(this.Av, _local_8);
                                } else
                                {
                                    this.Av.addChild(this.Av.g);
                                };
                            };
                        };
                        if (_local_6 == false)
                        {
                            removeEventListener(Event.ENTER_FRAME, this.Tick);
                        };
                    };
                };
            };
        }


    }
}//package 

