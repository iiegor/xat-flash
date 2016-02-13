// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//xatlib

package 
{
    import flash.net.URLRequest;
    import flash.net.navigateToURL;
    import flash.xml.XMLDocument;
    import flash.events.MouseEvent;
    import flash.net.URLVariables;
    import flash.system.System;
    import flash.text.TextFormat;
    import flash.text.TextField;
    import flash.net.SharedObject;
    import flash.net.ObjectEncoding;
    import flash.events.IOErrorEvent;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.net.URLRequestMethod;
    import flash.net.URLLoader;
    import flash.text.TextFieldAutoSize;
    import flash.filters.GlowFilter;
    import com.adobe.serialization.json.xJSON;
    import flash.utils.getTimer;
    import flash.events.*;
    import flash.xml.*;
    import com.adobe.serialization.json.*;
    import flash.display.*;
    import flash.text.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.filters.*;
    import flash.system.*;

    public class xatlib 
    {

        public static const c_tl:Number = (1 << 8);
        public static const c_tr:Number = (2 << 8);
        public static const c_bl:Number = (4 << 8);
        public static const c_br:Number = (8 << 8);
        public static const c_nolt:Number = (16 << 8);
        public static const c_nolb:Number = (32 << 8);
        public static const c_inv:Number = (64 << 8);
        public static const c_solid:Number = (128 << 8);
        public static const c_NoCol:Number = (128 << 9);
        public static const c_Mask:Number = (128 << 10);
        public static const c_Clip:Number = (128 << 11);
        public static const b_mouseChild = (128 << 12);
        public static var FastFind1 = new Object();
        public static var r1:RegExp = /[\x00-\x08\x10\x0B\x0C\x0E-\x19\x7F]|(?<=^|[\x00-\x7F])[\x80-\xBF]+|([\xC0\xC1]|[\xF0-\xFF])[\x80-\xBF]*|[\xC2-\xDF]((?![\x80-\xBF])|[\x80-\xBF]{2,})|[\xE0-\xEF](([\x80-\xBF](?![\x80-\xBF]))|(?![\x80-\xBF]{2})|[\x80-\xBF]{3,})/;
        public static var r2:RegExp = /\xE0[\x80-\x9F][\x80-\xBF]|\xED[\xA0-\xBF][\x80-\xBF]/;


        public static function getURL(_arg_1:*, _arg_2:*)
        {
            var _local_3:URLRequest = new URLRequest(_arg_1);
            try
            {
                navigateToURL(_local_3);
            } catch(e:Error)
            {
            };
        }

        public static function XMLOrder(_arg_1:XMLDocument, _arg_2:Array):String
        {
            var _local_4:*;
            var _local_5:*;
            var _local_3 = (("<" + _arg_1.firstChild.nodeName.toString()) + " ");
            for (_local_4 in _arg_2)
            {
                if (_arg_1.firstChild.attributes[_arg_2[_local_4]] != undefined)
                {
                    _local_5 = _arg_1.firstChild.attributes[_arg_2[_local_4]].toString();
                    if (_arg_2[_local_4] != "sn")
                    {
                        _local_5 = searchreplace("&", "&amp;", _local_5);
                        _local_5 = searchreplace("'", "&apos;", _local_5);
                        _local_5 = searchreplace("<", "&lt;", _local_5);
                        _local_5 = searchreplace(">", "&gt;", _local_5);
                    };
                    _local_5 = searchreplace('"', "&quot;", _local_5);
                    _local_3 = (_local_3 + (((_arg_2[_local_4] + '="') + _local_5) + '" '));
                };
            };
            return ((_local_3 + "/>"));
        }

        public static function GeneralMessage(_arg_1:String="", _arg_2:String="", _arg_3:*=1)
        {
            var _local_4:*;
            if (main.box_layer.GeneralMessageH)
            {
                main.box_layer.GeneralMessageH.Delete();
            };
            main.box_layer.GeneralMessageH = undefined;
            if (((!((_arg_1.length == 0))) || (!((_arg_2.length == 0)))))
            {
                _local_4 = undefined;
                main.box_layer.GeneralMessageH = new xDialog(main.box_layer, _local_4, _local_4, _local_4, _local_4, _arg_1, _arg_2, _arg_3);
            };
        }

        public static function UnfairPopup(_arg_1:*, _arg_2:*)
        {
            UnfairPopupClose();
            var _local_3:* = (main.box_layer.mcPopup = new xDialog(main.box_layer, int(((20 * todo.StageWidth) / 640)), int((((140 - 14) * todo.StageHeight) / 480)), int(((600 * todo.StageWidth) / 640)), int((((((192 + 32) + 24) + 14) * todo.StageHeight) / 480)), _arg_1, _arg_2, 0, UnfairPopupClose));
            var _local_4:* = _local_3.DiaBack.width;
            var _local_5:* = _local_3.DiaBack.height;
            var _local_6:* = _local_3.DiaBack.x;
            var _local_7:* = _local_3.DiaBack.y;
            var _local_8:* = xatlib.NY(32);
            var _local_9:* = (((_local_7 + _local_5) - _local_8) - 22);
            var _local_10:* = ((_local_4 / 3) - 16);
            var _local_11:* = new xBut(_local_3, (_local_6 + 8), _local_9, _local_10, _local_8, xconst.ST(101), xatlib.mccopyurl_onRelease2);
            var _local_12:* = new xBut(_local_3, (((_local_6 + (_local_4 / 2)) - (_local_4 / 6)) + 8), _local_9, _local_10, _local_8, xconst.ST(102), UnfairPopupClose);
            var _local_13:* = new xBut(_local_3, (((_local_6 + _local_4) - (_local_4 / 3)) + 8), _local_9, _local_10, _local_8, xconst.ST(103), UnfairFindAnotherGroup);
        }

        public static function UnfairFindAnotherGroup(_arg_1:MouseEvent=undefined)
        {
            UnfairPopupClose();
            var _local_2:* = (todo.usedomain + "/groups");
            xatlib.UrlPopup(xconst.ST(8), _local_2);
        }

        public static function UnfairPopupClose(_arg_1:MouseEvent=undefined)
        {
            if (((!(main.box_layer.mcPopup)) || (!(main.box_layer.mcPopup.sParent))))
            {
                return;
            };
            main.box_layer.mcPopup.Delete();
            delete main.box_layer.mcPopup;
            main.box_layer.mcPopup = null;
        }

        public static function mccopyurl_onRelease2(_arg_1:MouseEvent=undefined)
        {
            var _local_2:URLVariables = new URLVariables();
            _local_2.d = network.UnfairMessage;
            _local_2.i = network.UnfairFile;
            xatlib.LoadVariables((todo.Http + "//web.xat.com/report/data.php"), undefined, _local_2, 1);
            UnfairPopupClose();
            var _local_3:* = ((((todo.Http + "//web.xat.com/report/report.php?i=") + network.UnfairFile) + "&g=") + network.UnfairGroupName);
            getURL(_local_3, "_blank");
            UrlPopup(xconst.ST(8), _local_3);
        }

        public static function UrlPopup(_arg_1:String, _arg_2:String, _arg_3:String=undefined)
        {
            var _local_16:*;
            if (!todo.config["useconfirmweblink"])
            {
                xatlib.getURL(_arg_2, "_blank");
            };
            UnfairPopupClose();
            var _local_4:* = undefined;
            if (!_arg_3)
            {
                _arg_3 = "";
            } else
            {
                _arg_3 = (_arg_3 + "\n");
            };
            var _local_5:* = (main.box_layer.mcPopup = new xDialog(main.box_layer, _local_4, _local_4, _local_4, _local_4, _arg_1, (_arg_3 + _arg_2), 0, UnfairPopupClose));
            var _local_6:* = _local_5.DiaBack.width;
            var _local_7:* = _local_5.DiaBack.height;
            var _local_8:* = _local_5.DiaBack.x;
            var _local_9:* = _local_5.DiaBack.y;
            var _local_10:* = 8;
            var _local_11:* = int((_local_6 / ((_local_10 * 2) + 3)));
            var _local_12:* = int(((_local_6 * _local_10) / ((_local_10 * 2) + 3)));
            var _local_13:* = _local_12;
            var _local_14:* = 22;
            var _local_15:* = new xBut(_local_5, (((_local_8 + _local_6) - _local_11) - _local_12), (((_local_9 + _local_7) - _local_14) - 20), _local_12, _local_14, xconst.ST(102), UnfairPopupClose);
            if (_arg_2.length > 0)
            {
                _local_16 = new xBut(_local_5, (_local_8 + _local_11), (((_local_9 + _local_7) - _local_14) - 20), _local_13, _local_14, ((todo.config["useconfirmweblink"]) ? "Goto Link" : xconst.ST(104)), mccopyurl_onRelease3);
                _local_16.HomePage = _arg_2;
            };
        }

        public static function mccopyurl_onRelease3(_arg_1:MouseEvent)
        {
            UnfairPopupClose();
            if (todo.config["useconfirmweblink"])
            {
                xatlib.getURL(_arg_1.currentTarget.HomePage, "_blank");
            } else
            {
                System.setClipboard(_arg_1.currentTarget.HomePage);
                GeneralMessage(xconst.ST(105), xconst.ST(106));
            };
        }

        public static function ButtonCurve2(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number=0, _arg_5:Number=1, _arg_6:Number=0xFFFFFF, _arg_7:Number=1, _arg_8:Number=0xFFFFFF, _arg_9:Number=1):xSprite
        {
            var _local_10:* = new xSprite();
            var _local_11:* = _arg_1;
            if (_arg_2 < (_local_11 * 2))
            {
                _local_11 = int((_arg_2 / 2));
            };
            if (_arg_3 < (_local_11 * 2))
            {
                _local_11 = int((_arg_3 / 2));
            };
            var _local_12:* = _local_11;
            var _local_13:* = _local_11;
            var _local_14:* = _local_11;
            var _local_15:* = _local_11;
            if ((_arg_4 & c_tl))
            {
                _local_15 = 0;
            };
            if ((_arg_4 & c_tr))
            {
                _local_12 = 0;
            };
            if ((_arg_4 & c_bl))
            {
                _local_14 = 0;
            };
            if ((_arg_4 & c_br))
            {
                _local_13 = 0;
            };
            var _local_16:uint = 100;
            _local_10.graphics.beginFill(_arg_8, _arg_9);
            _local_10.graphics.lineStyle(_arg_5, _arg_6, _arg_7, true, "none", "none", "round", 1);
            if ((_arg_4 & c_inv))
            {
                _local_10.graphics.moveTo(todo.tpw, 0);
            } else
            {
                _local_10.graphics.moveTo((_local_15 + 0), 0);
            };
            if ((_arg_4 & c_nolt))
            {
                _local_10.graphics.lineStyle(0, 0, 0);
            } else
            {
                _local_10.graphics.lineStyle(_arg_5, _arg_6, _arg_7, true, "none", "none", "round", 1);
            };
            _local_10.graphics.lineTo((_arg_2 - _local_12), 0);
            if (_local_12 > 0)
            {
                _local_10.graphics.curveTo(_arg_2, 0, _arg_2, _local_12);
            };
            _local_10.graphics.lineStyle(_arg_5, _arg_6, _arg_7, true, "none", "none", "round", 1);
            _local_10.graphics.lineTo(_arg_2, ((_arg_3 - _local_13) - 2));
            if ((_arg_4 & c_nolb))
            {
                _local_10.graphics.lineStyle(0, 0, 0);
            } else
            {
                _local_10.graphics.lineStyle(_arg_5, _arg_6, _arg_7, true, "none", "none", "round", 1);
            };
            if (_local_13 > 0)
            {
                _local_10.graphics.curveTo(_arg_2, _arg_3, ((_arg_2 - _local_13) - 2), _arg_3);
            };
            _local_10.graphics.lineTo(_local_14, _arg_3);
            _local_10.graphics.lineStyle(_arg_5, _arg_6, _arg_7, true, "none", "none", "round", 1);
            _local_10.graphics.curveTo(0, _arg_3, 0, (_arg_3 - _local_14));
            _local_10.graphics.lineStyle(_arg_5, _arg_6, _arg_7, true, "none", "none", "round", 1);
            _local_10.graphics.lineTo(0, _local_15);
            _local_10.graphics.curveTo(0, 0, _local_15, 0);
            if ((_arg_4 & c_inv))
            {
                _local_10.graphics.lineTo(-(todo.tpw), 0);
                _local_10.graphics.lineTo(-(todo.tpw), 50);
                _local_10.graphics.lineTo(todo.tpw, 50);
                _local_10.graphics.lineTo(todo.tpw, 0);
            };
            _local_10.graphics.endFill();
            return (_local_10);
        }

        public static function Blend(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*, _arg_5:*)
        {
            if (_arg_1 <= _arg_2)
            {
                return (_arg_4);
            };
            if (_arg_1 >= _arg_3)
            {
                return (_arg_5);
            };
            var _local_6:* = int(((((_arg_1 - _arg_2) / (_arg_3 - _arg_2)) * (_arg_5 - _arg_4)) + _arg_4));
            return (_local_6);
        }

        public static function AddBackground(_arg_1:*, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:*=0):xSprite
        {
            var _local_7:* = todo.ButCol;
            var _local_8:* = 0.4;
            if ((_arg_6 & c_NoCol))
            {
                _local_7 = 0xFFFFFF;
            };
            if ((_arg_6 & c_solid))
            {
                _local_7 = 0xCCCCCC;
                _local_8 = 1;
            };
            var _local_9:* = 0xFFFFFF;
            var _local_10:* = 0.4;
            var _local_11:* = 1;
            if ((_arg_6 & (128 << 10)))
            {
                _local_9 = 0x808080;
                _local_10 = 1;
                _local_11 = undefined;
            };
            var _local_12:* = ButtonCurve2(8, _arg_4, _arg_5, _arg_6, _local_11, _local_7, _local_8, _local_9, _local_10);
            _local_12.x = _arg_2;
            _local_12.y = _arg_3;
            _arg_1.addChild(_local_12);
            return (_local_12);
        }

        public static function createTextNoWrap(_arg_1:*, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:String, _arg_7:Number, _arg_8:Number, _arg_9:Number, _arg_10:Number, _arg_11:Number, _arg_12:String, _arg_13:Number)
        {
            var _local_14:*;
            var _local_15:*;
            var _local_17:Number;
            var _local_18:Number;
            var _local_19:*;
            _arg_2 = int(_arg_2);
            _arg_3 = int(_arg_3);
            _arg_4 = int(_arg_4);
            _arg_5 = int(_arg_5);
            _local_15 = new TextFormat();
            _local_15.align = _arg_12;
            _local_15.bold = true;
            _local_15.color = _arg_7;
            _local_15.font = "_sans";
            _local_15.size = _arg_11;
            var _local_16:* = new TextField();
            _local_16.x = (_arg_2 + 1);
            _local_16.y = (1 + _arg_3);
            _local_16.width = (_arg_4 - (1 * 2));
            _local_16.height = (_arg_5 - (1 * 2));
            _local_16.autoSize = _arg_12;
            _local_16.selectable = true;
            _local_16.defaultTextFormat = _local_15;
            _local_16.text = _arg_6;
            _arg_1.addChild(_local_16);
            if ((_arg_13 & 2))
            {
                _local_16.multiline = true;
                _local_16.wordWrap = true;
            };
            if (_local_16.width > (_arg_4 - (1 * 2)))
            {
                _local_17 = ((_local_15.size * ((_arg_4 - (1 * 2)) / _local_16.width)) - 0.5);
                _local_18 = 4;
                _local_19 = ((_local_15.size - _local_17) / _local_18);
                if (_local_19 < 1)
                {
                    _local_19 = 1;
                };
                while ((((_local_16.width > (_arg_4 - (1 * 2)))) && ((_local_15.size > 1))))
                {
                    _local_15.size = (_local_15.size - _local_19);
                    _local_16.defaultTextFormat = _local_15;
                    _local_16.text = _arg_6;
                };
            };
            _local_16.y = ((_arg_3 + int(((_arg_5 - _local_16.height) / 2))) - 1);
            return (_local_16);
        }

        public static function CleanText(_arg_1:*, _arg_2:*=undefined):String
        {
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:String;
            _arg_1 = String(_arg_1);
            var _local_3 = "";
            _local_4 = 0;
            while (_local_4 < _arg_1.length)
            {
                _local_5 = _arg_1.charCodeAt(_local_4);
                _local_6 = _arg_1.charAt(_local_4);
                if (_local_5 >= 32)
                {
                    if (_local_6 != "<")
                    {
                        if (_local_6 != ">")
                        {
                            if (_local_6 != '"')
                            {
                                if (_local_6 != "'")
                                {
                                    if (_local_6 != ",")
                                    {
                                        if (_local_6 == " ")
                                        {
                                            if (_arg_2 != 1)
                                            {
                                                _local_3 = (_local_3 + "_");
                                            };
                                        } else
                                        {
                                            _local_3 = (_local_3 + _local_6);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                _local_4++;
            };
            return (_local_3);
        }

        public static function GetStatus(_arg_1:*)
        {
            if (!_arg_1)
            {
                return (undefined);
            };
            _arg_1 = _arg_1.split("##")[1];
            if (!_arg_1)
            {
                return (undefined);
            };
            if (_arg_1.substr(0, 1) == " ")
            {
                return (undefined);
            };
            return (searchreplace("_", " ", _arg_1));
        }

        public static function NameNoXat(_arg_1:*, _arg_2:*=undefined)
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_8:*;
            var _local_9:*;
            var _local_12:*;
            var _local_13:Array;
            var _local_14:String;
            var _local_15:*;
            var _local_16:*;
            if (_arg_1 == null)
            {
                return (null);
            };
            if (_arg_1.indexOf("&lt;") != -1)
            {
                return ("nope");
            };
            if (_arg_1.indexOf("<") != -1)
            {
                return ("nope");
            };
            var _local_6:* = _arg_1.length;
            _local_3 = 0;
            for (;_local_3 < _local_6;_local_3++)
            {
                _local_5 = _local_4;
                _local_4 = _arg_1.charAt(_local_3);
                switch (_local_4)
                {
                    case "­":
                    case " ":
                    case "_":
                        continue;
                };
                if (!(((_local_3 > 0)) && ((_local_4 == _local_5)))) break;
            };
            if (_local_3 > 0)
            {
                _arg_1 = _arg_1.substr(_local_3);
            };
            _arg_1 = _arg_1.split("##")[0];
            var _local_7:Array = _arg_1.split("");
            _local_6 = _local_7.length;
            var _local_10:Boolean = true;
            var _local_11:* = false;
            _arg_1 = "";
            _local_3 = 0;
            while (_local_3 < _local_6)
            {
                _local_5 = _local_7[_local_3];
                _local_4 = _local_5.charCodeAt();
                if ((((_local_4 >= 28)) && ((_local_4 <= 31))))
                {
                    _local_5 = "_";
                } else
                {
                    if (_local_5 == "(")
                    {
                        _local_8 = true;
                    } else
                    {
                        if (_local_5 == ")")
                        {
                            _local_8 = false;
                        } else
                        {
                            if ((((_local_4 >= 127)) && ((_local_4 <= 159))))
                            {
                                _local_5 = "_";
                            } else
                            {
                                if ((((_local_5 == " ")) || (((!(_local_8)) && ((_local_5 == "#"))))))
                                {
                                    _local_5 = "_";
                                };
                            };
                        };
                    };
                };
                if (_local_4 > 0xFF)
                {
                    if ((((_local_5 == "Χ")) || ((_local_5 == "Х"))))
                    {
                        _local_5 = "X";
                    } else
                    {
                        if ((((_local_5 == "Α")) || ((_local_5 == "А"))))
                        {
                            _local_5 = "A";
                        } else
                        {
                            if ((((_local_5 == "Τ")) || ((_local_5 == "Т"))))
                            {
                                _local_5 = "T";
                            } else
                            {
                                if (_local_5 == "х")
                                {
                                    _local_5 = "x";
                                } else
                                {
                                    if (_local_5 == "а")
                                    {
                                        _local_5 = "a";
                                    } else
                                    {
                                        if (_local_5 == "α")
                                        {
                                            _local_5 = "a";
                                        } else
                                        {
                                            if ((((_local_5 == "Μ")) || ((_local_5 == "М"))))
                                            {
                                                _local_5 = "M";
                                            } else
                                            {
                                                if (_local_5 == "і")
                                                {
                                                    _local_5 = "i";
                                                } else
                                                {
                                                    if (_local_5 == "Ν")
                                                    {
                                                        _local_5 = "N";
                                                    } else
                                                    {
                                                        if (_local_5 == "ԁ")
                                                        {
                                                            _local_5 = "d";
                                                        } else
                                                        {
                                                            if (_local_5 == "m")
                                                            {
                                                                _local_5 = "m";
                                                            } else
                                                            {
                                                                if (_local_5 == "і")
                                                                {
                                                                    _local_5 = "i";
                                                                } else
                                                                {
                                                                    if ((((_local_5 == "Η")) || ((_local_5 == "Н"))))
                                                                    {
                                                                        _local_5 = "H";
                                                                    } else
                                                                    {
                                                                        if ((((_local_5 == "Ε")) || ((_local_5 == "Е"))))
                                                                        {
                                                                            (_local_5 == "E");
                                                                        } else
                                                                        {
                                                                            if (_local_5 == "һ")
                                                                            {
                                                                                _local_5 = "h";
                                                                            } else
                                                                            {
                                                                                if (_local_5 == "е")
                                                                                {
                                                                                    _local_5 = "e";
                                                                                } else
                                                                                {
                                                                                    if ((((((((((((_local_5 == "Ɩ")) || ((_local_5 == "Ι")))) || ((_local_5 == "І")))) || ((_local_5 == "Ӏ")))) || ((_local_5 == "ӏ")))) || ((_local_5 == "ｌ"))))
                                                                                    {
                                                                                        _local_5 = "I";
                                                                                    } else
                                                                                    {
                                                                                        if (_local_5 == "р")
                                                                                        {
                                                                                            _local_5 = "p";
                                                                                        } else
                                                                                        {
                                                                                            if ((((((_local_5 == " ")) || ((_local_5 == "卐")))) || ((_local_5 == "­"))))
                                                                                            {
                                                                                                _local_5 = "_";
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
                                        };
                                    };
                                };
                            };
                        };
                    };
                    switch (_local_5)
                    {
                        case " ":
                        case " ":
                        case " ":
                        case " ":
                        case " ":
                        case " ":
                        case " ":
                        case " ":
                        case " ":
                        case " ":
                        case " ":
                        case "​":
                        case "‌":
                        case "‍":
                        case "‎":
                        case "‏":
                        case " ":
                        case "⁭":
                        case "‪":
                            _local_5 = "_";
                    };
                };
                _local_7[_local_3] = _local_5;
                _local_5 = _local_5.toLowerCase();
                if ((((_local_5 == "a")) || ((_local_5 == "h"))))
                {
                    _local_9 = true;
                };
                _local_3++;
            };
            if (_local_9)
            {
                _local_13 = new Array();
                _local_14 = "";
                _local_3 = 0;
                while (_local_3 < _local_6)
                {
                    _local_14 = (_local_14 + _local_7[_local_3]);
                    if (_local_7[_local_3].charCodeAt() < 0x0100)
                    {
                        _local_13.push(_local_14);
                        _local_14 = "";
                    };
                    _local_3++;
                };
                _local_13.push(_local_14);
                _local_3 = 0;
                for (;_local_3 < _local_13.length;_local_3++)
                {
                    _local_15 = new Array(5);
                    _local_16 = 0;
                    while (_local_16 < 5)
                    {
                        if ((_local_3 + _local_16) < _local_13.length)
                        {
                            _local_15[_local_16] = _local_13[(_local_3 + _local_16)].charAt((_local_13[(_local_3 + _local_16)].length - 1));
                        };
                        _local_16++;
                    };
                    if (_local_3 < (_local_13.length - 2))
                    {
                        if ((((((((_local_15[0] == "x")) || ((_local_15[0] == "X")))) && ((((_local_15[1] == "a")) || ((_local_15[1] == "A")))))) && ((((_local_15[2] == "t")) || ((_local_15[2] == "T"))))))
                        {
                            _local_12 = 0;
                            while (_local_12 < 3)
                            {
                                _arg_1 = (_arg_1 + (_local_13[(_local_3 + _local_12)].substr(0, (_local_13[(_local_3 + _local_12)].length - 1)) + "Q"));
                                _local_12++;
                            };
                            _local_3 = (_local_3 + 2);
                            continue;
                        };
                    };
                    if (_local_3 < (_local_13.length - 3))
                    {
                        if ((((((((((_local_15[0] == "h")) || ((_local_15[0] == "H")))) && ((((_local_15[1] == "e")) || ((_local_15[1] == "E")))))) && ((((((_local_15[2] == "l")) || ((_local_15[2] == "L")))) || ((_local_15[2] == "I")))))) && ((((_local_15[3] == "p")) || ((_local_15[3] == "P"))))))
                        {
                            _local_12 = 0;
                            while (_local_12 < 4)
                            {
                                _arg_1 = (_arg_1 + (_local_13[(_local_3 + _local_12)].substr(0, (_local_13[(_local_3 + _local_12)].length - 1)) + "Q"));
                                _local_12++;
                            };
                            _local_3 = (_local_3 + 3);
                            continue;
                        };
                    };
                    if (_local_3 < (_local_13.length - 4))
                    {
                        if ((((((((((((_local_15[0] == "a")) || ((_local_15[0] == "A")))) && ((((_local_15[1] == "d")) || ((_local_15[1] == "D")))))) && ((((_local_15[2] == "m")) || ((_local_15[2] == "M")))))) && ((((((_local_15[3] == "i")) || ((_local_15[3] == "I")))) || ((_local_15[3] == "l")))))) && ((((_local_15[4] == "n")) || ((_local_15[4] == "N"))))))
                        {
                            _local_12 = 0;
                            while (_local_12 < 5)
                            {
                                _arg_1 = (_arg_1 + (_local_13[(_local_3 + _local_12)].substr(0, (_local_13[(_local_3 + _local_12)].length - 1)) + "Q"));
                                _local_12++;
                            };
                            _local_3 = (_local_3 + 4);
                            continue;
                        };
                    };
                    _arg_1 = (_arg_1 + _local_13[_local_3]);
                };
            } else
            {
                _arg_1 = _local_7.join("");
            };
            while (_arg_1.substr(0, 1) == "_")
            {
                _arg_1 = _arg_1.substr(1);
            };
            if (_arg_2 == undefined)
            {
                if (_arg_1.charAt(0) == "(")
                {
                    _arg_1 = ("  " + _arg_1);
                };
                _arg_1 = PreProcSmilie(_arg_1);
            };
            return (_arg_1);
        }

        public static function CleanTextNoXat(_arg_1:*):String
        {
            return (CleanText(NameNoXat(_arg_1, 1)));
        }

        public static function CleanMessage(_arg_1:String):String
        {
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:String;
            var _local_2 = "";
            _local_3 = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_4 = _arg_1.charCodeAt(_local_3);
                _local_5 = _arg_1.charAt(_local_3);
                if (_local_5 == "\t")
                {
                    _local_2 = (_local_2 + " ");
                } else
                {
                    if (_local_4 >= 32)
                    {
                        _local_2 = (_local_2 + _local_5);
                    };
                };
                _local_3++;
            };
            return (_local_2);
        }

        public static function CleanCommas(_arg_1:String):String
        {
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:String;
            var _local_2 = "";
            _local_3 = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_4 = _arg_1.charCodeAt(_local_3);
                _local_5 = _arg_1.charAt(_local_3);
                if (_local_5 == ",")
                {
                    _local_2 = (_local_2 + " ");
                } else
                {
                    if (_local_4 >= 32)
                    {
                        _local_2 = (_local_2 + _local_5);
                    };
                };
                _local_3++;
            };
            return (_local_2);
        }

        public static function TimeStamp():String
        {
            var _local_1:Date = new Date();
            var _local_2:Number = Number(_local_1.getTime());
            return (("&t=" + _local_2));
        }

        public static function NX(_arg_1:Number):Number
        {
            return (int(((_arg_1 * todo.StageWidth) / 640)));
        }

        public static function NY(_arg_1:Number):Number
        {
            return (int(((_arg_1 * todo.StageHeight) / 480)));
        }

        public static function SX(_arg_1:*=1):Number
        {
            var _local_2:* = (todo.StageWidth / 640);
            if (_arg_1)
            {
                _local_2 = (_local_2 * _arg_1);
            };
            return (_local_2);
        }

        public static function SY(_arg_1:*=1):Number
        {
            var _local_2:* = (todo.StageHeight / 480);
            if (_arg_1)
            {
                _local_2 = (_local_2 * _arg_1);
            };
            return (_local_2);
        }

        public static function UrlAv(_arg_1:*):String
        {
            var _local_2:Number = xInt(_arg_1);
            if ((((_local_2 > 0)) && ((_local_2 <= 1758))))
            {
                return ((((todo.Http + "//www.xatech.com/web_gear/chat/av/") + _arg_1) + ".png"));
            };
            return (String(_arg_1));
        }

        public static function RandAv(_arg_1:*=undefined)
        {
            var _local_2:Number = (1 + Math.floor((Math.random() * 1758)));
            if (_arg_1 == undefined)
            {
                return (_local_2);
            };
            return (UrlAv(_local_2));
        }

        public static function xRand(_arg_1:*, _arg_2:*)
        {
            return ((xInt(Math.floor((Math.random() * ((_arg_2 - _arg_1) + 1)))) + _arg_1));
        }

        public static function ParseAv(_arg_1:*):String
        {
            if (_arg_1.substr(0, 4) == "http")
            {
                return (_arg_1);
            };
            var _local_2:Number = xInt(_arg_1);
            if ((((_local_2 > 0)) && ((_local_2 <= 1758))))
            {
                return (UrlAv(_local_2));
            };
            return ("_");
        }

        public static function CleanAv(_arg_1:*)
        {
            var _local_6:Number;
            if (_arg_1 == undefined)
            {
                return;
            };
            var _local_2:Number = xInt(_arg_1);
            if ((((_local_2 > 0)) && ((_local_2 <= 1758))))
            {
                return (_local_2);
            };
            if (_local_2 < 0)
            {
                return ("");
            };
            var _local_3:String = _arg_1.toLowerCase();
            var _local_4 = "/web_gear/chat/av/";
            if (_local_3.indexOf(".swf") != -1)
            {
                return ("");
            };
            if (_local_3.indexOf("&lt;") != -1)
            {
                return ("");
            };
            if (_local_3.indexOf("<") != -1)
            {
                return ("");
            };
            var _local_5:* = _local_3.indexOf(_local_4);
            if (_local_5 >= 0)
            {
                _local_6 = parseInt(_local_3.substr((_local_5 + _local_4.length)));
                if (_local_6 > 0)
                {
                    return (_local_6);
                };
            };
            return (_arg_1);
        }

        public static function IsDefaultAvatar(_arg_1:*)
        {
            return ((CleanAv(_arg_1) > 0));
        }

        public static function xInt(_arg_1:*):Number
        {
            var _local_2:Number = parseInt(String(_arg_1));
            if (isNaN(_local_2))
            {
                return (0);
            };
            return (_local_2);
        }

        public static function FindUser(_arg_1:Number):Number
        {
            if (_arg_1 <= 2)
            {
                return (-1);
            };
            var _local_2:* = FastFind1[_arg_1];
            if (((((!((_local_2 == undefined))) && (!((todo.Users[_local_2] == undefined))))) && ((todo.Users[_local_2].u == _arg_1))))
            {
                return (_local_2);
            };
            var _local_3:* = todo.Users.length;
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                if (todo.Users[_local_2].u == _arg_1)
                {
                    FastFind1[_arg_1] = _local_2;
                    return (_local_2);
                };
                _local_2++;
            };
            return (-1);
        }

        public static function GetUserStatus(_arg_1:Number):String
        {
            var _local_3:*;
            var _local_4:*;
            if (_arg_1 == -1)
            {
                return ("");
            };
            var _local_2 = "";
            var _local_5:* = todo.Users[_arg_1];
            _local_3 = (_local_5.online == true);
            if (((!(_local_3)) && (((!((main.utabsmc.tabs[0].Main == true))) || (main.ctabsmc.TabIsPrivate())))))
            {
                _local_3 = (_local_5.onsuper == true);
                if (_local_5.available)
                {
                    _local_4 = true;
                };
            };
            if (_local_5.u == todo.w_userno)
            {
                _local_2 = (xconst.ST(107) + " ");
            };
            if (_local_3)
            {
                if (_local_5.OnXat)
                {
                    _local_2 = (_local_2 + xconst.ST(108));
                } else
                {
                    if (_local_4)
                    {
                        _local_2 = (_local_2 + xconst.ST(275));
                    } else
                    {
                        _local_2 = (_local_2 + xconst.ST(109));
                    };
                };
            } else
            {
                _local_2 = (_local_2 + xconst.ST(110));
            };
            if (main.utabsmc.tabs[0].Main == true)
            {
                if (!_local_5.Stealth)
                {
                    if (_local_5.mainowner == true)
                    {
                        _local_2 = (_local_2 + (" " + xconst.ST(134)));
                    } else
                    {
                        if (_local_5.owner == true)
                        {
                            _local_2 = (_local_2 + (" " + xconst.ST(24)));
                        } else
                        {
                            if (_local_5.moderator == true)
                            {
                                _local_2 = (_local_2 + (" " + xconst.ST(23)));
                            } else
                            {
                                if (_local_5.member == true)
                                {
                                    _local_2 = (_local_2 + (" " + xconst.ST(22)));
                                };
                            };
                        };
                    };
                };
            };
            if ((_local_5.aFlags & (1 << 21)))
            {
                _local_2 = (_local_2 + (" " + xconst.ST(251)));
            };
            if ((_local_5.flag0 & 0x0200))
            {
                _local_2 = (_local_2 + (" " + xconst.ST(195)));
            };
            if (_local_5.friend == 1)
            {
                _local_2 = (_local_2 + (" " + xconst.ST(111)));
            };
            if (_local_5.friend == 3)
            {
                _local_2 = (_local_2 + (" " + xconst.ST(262)));
            };
            if ((((_local_5.banned == true)) && ((main.utabsmc.tabs[0].Main == true))))
            {
                if (_local_5.w)
                {
                    _local_2 = (_local_2 + (" " + xconst.Puzzle[_local_5.w]));
                };
                if ((_local_5.flag0 & 0x1000))
                {
                    _local_2 = (_local_2 + (" " + xconst.ST(236)));
                } else
                {
                    _local_2 = (_local_2 + (" " + xconst.ST(25)));
                };
            } else
            {
                if (_local_5.ignored == true)
                {
                    _local_2 = (_local_2 + (" " + xconst.ST(112)));
                } else
                {
                    if (_local_5.gagged == true)
                    {
                        _local_2 = (_local_2 + (" " + xconst.ST(188)));
                    };
                };
            };
            if (((_local_5.VIP) && (!(todo.HasPower(_arg_1, 2)))))
            {
                _local_2 = (_local_2 + (" " + xconst.ST(158)));
            } else
            {
                if (((_local_5.registered) && (!(todo.HasPower(_arg_1, 9)))))
                {
                    _local_2 = (_local_2 + (" " + xconst.ST(159)));
                };
            };
            if (_local_5.Bride)
            {
                if ((_local_5.aFlags & 1))
                {
                    _local_2 = (_local_2 + (" " + xconst.ST(160)));
                } else
                {
                    _local_2 = (_local_2 + (" " + xconst.ST(161)));
                };
            };
            return (_local_2);
        }

        public static function GetNameNumber(_arg_1:Number)
        {
            var _local_2:* = _arg_1.toString();
            var _local_3:* = FindUser(_arg_1);
            if (_local_3 < 0)
            {
                return ("NotFound");
            };
            if (_local_2.substr(-9, 9) == "000000000")
            {
                _local_2 = (_local_2.substr(0, (_local_2.length - 9)) + "B");
            };
            if (_local_2.substr(-6, 6) == "000000")
            {
                _local_2 = (_local_2.substr(0, (_local_2.length - 6)) + "M");
            };
            _local_2 = (((todo.Users[_local_3].registered)!=undefined) ? (((todo.Users[_local_3].registered + " (") + _local_2) + ")") : _arg_1.toString());
            if (_arg_1 >= (0x77359400 - (100000 * 2)))
            {
                _local_2 = todo.Users[_local_3].registered;
            };
            if (_arg_1 >= (0x77359400 - 100000))
            {
                _local_2 = " ";
            };
            return (FixLI(_local_2));
        }

        public static function GetUsername(_arg_1:Number, _arg_2:*=undefined, _arg_3:*=undefined, _arg_4:*=undefined):String
        {
            var _local_7:*;
            var _local_5:* = "";
            var _local_6:* = FindUser(_arg_1);
            if (_local_6 != -1)
            {
                if (_arg_2)
                {
                    if (todo.Users[_local_6].registered)
                    {
                        _local_5 = todo.Users[_local_6].registered;
                    };
                } else
                {
                    _local_5 = todo.Users[_local_6].n;
                };
            };
            if (_arg_3)
            {
                if (((!((_local_6 == -1))) && (!((todo.Users[_local_6].s == undefined)))))
                {
                    _local_7 = todo.Users[_local_6].s.split("#");
                    _local_5 = (_local_5 + ("\n" + _local_7[0]));
                };
                if (_arg_1 > 101)
                {
                    _local_5 = (_local_5 + "\n(NOT xat staff!)");
                } else
                {
                    _local_5 = (_local_5 + "\n(xat staff)");
                };
                if (_arg_4 != undefined)
                {
                    _local_5 = (_local_5 + " [");
                    _local_6 = FindUser(_arg_4);
                    if (todo.Users[_local_6].registered)
                    {
                        _local_5 = (_local_5 + todo.Users[_local_6].registered);
                    } else
                    {
                        _local_5 = (_local_5 + _arg_4);
                    };
                    _local_5 = (_local_5 + "]");
                };
            };
            return (_local_5);
        }

        public static function StripSmilies(_arg_1:*)
        {
            var _local_3:*;
            var _local_5:*;
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:* = "";
            var _local_4:* = false;
            _local_3 = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_5 = _arg_1.charAt(_local_3);
                if (((!(_local_4)) && (!((_local_5 == "(")))))
                {
                    _local_2 = (_local_2 + _local_5);
                } else
                {
                    if (_local_5 == "(")
                    {
                        _local_4 = true;
                    } else
                    {
                        if (_local_5 == ")")
                        {
                            _local_4 = false;
                        };
                    };
                };
                _local_3++;
            };
            if (_local_2.length == 0)
            {
                return (_arg_1);
            };
            return (_local_2);
        }

        public static function IsDefaultName(_arg_1:String)
        {
            var _local_5:*;
            var _local_2:Boolean;
            var _local_3:Boolean;
            var _local_4:* = 0;
            while (_local_4 < xconst.name1.length)
            {
                if (_arg_1.indexOf(xconst.name1[_local_4]) != -1)
                {
                    _local_2 = true;
                    break;
                };
                _local_4++;
            };
            if (_local_2)
            {
                _local_5 = 0;
                while (_local_5 < xconst.name2.length)
                {
                    if (_arg_1.indexOf(xconst.name2[_local_5]) != -1)
                    {
                        _local_3 = true;
                        break;
                    };
                    _local_5++;
                };
            };
            if (((_local_2) && (_local_3)))
            {
                return (true);
            };
            return (false);
        }

        public static function GetDefaultName(_arg_1:Number)
        {
            var _local_2:* = ((_arg_1 ^ 0x5555) % (42 * 24));
            var _local_3:* = (_local_2 % 42);
            _local_2 = int((_local_2 / 42));
            return ((xconst.name1[_local_3] + xconst.name2[_local_2]));
        }

        public static function GetDefaultAvatar(_arg_1:Number)
        {
            return ((((_arg_1 ^ 0x5555) % 1758) + 1));
        }

        public static function PurgeMessageFromUser(_arg_1:Number)
        {
            var _local_2:* = todo.Message.length;
            var _local_3:* = 0;
            while (_local_3 < _local_2)
            {
                if (todo.Message[_local_3].u == _arg_1)
                {
                    xmessage.DeleteOneMessageMc(_local_3);
                };
                _local_3++;
            };
        }

        public static function CountLinks(_arg_1:String, _arg_2:Number=0)
        {
            var _local_5:*;
            var _local_6:*;
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_3:Array = new Array();
            var _local_4:* = 0;
            _local_3 = _arg_1.split(" ");
            _local_5 = 0;
            while (_local_5 < _local_3.length)
            {
                _local_6 = WordIsLink(_local_3[_local_5]);
                if (_local_6)
                {
                    _local_4++;
                    if (_arg_2)
                    {
                        return (_local_6);
                    };
                };
                _local_5++;
            };
            return (_local_4);
        }

        public static function WordIsLink(_arg_1:String):String
        {
            var _local_6:int;
            if (_arg_1.indexOf(".") < 0)
            {
                return (undefined);
            };
            var _local_2:String = _arg_1.toLowerCase();
            if (_local_2.indexOf("http") >= 0)
            {
                return (_arg_1);
            };
            var _local_3:Boolean;
            var _local_4:Number = 2;
            if (_local_2.indexOf("www.") >= 0)
            {
                _local_3 = true;
            };
            var _local_5:Number = _local_2.indexOf("/");
            if (_local_5 == -1)
            {
                _local_5 = _local_2.length;
            };
            var _local_7:* = 0;
            while (_local_7 < _local_5)
            {
                _local_6 = _local_2.charCodeAt(_local_7);
                if ((((((_local_6 < 48)) || ((_local_6 > 57)))) && (!((_local_6 == 46)))))
                {
                    _local_4 = 0;
                    break;
                };
                _local_7++;
            };
            if (_local_2.charAt((_local_5 - 1)) == ".")
            {
                _local_4 = 2;
            };
            if (_local_2.charAt((_local_5 - 2)) == ".")
            {
                _local_4 = 2;
            };
            if (_local_2.charAt((_local_5 - 3)) == ".")
            {
                _local_4++;
            };
            if (_local_2.charAt((_local_5 - 4)) == ".")
            {
                _local_4++;
            };
            if (_local_2.charAt((_local_5 - 5)) == ".")
            {
                _local_4++;
            };
            if (_local_4 == 1)
            {
                _local_3 = true;
            };
            if (_local_3)
            {
                return (((todo.Http + "//") + CleanText(_arg_1)));
            };
            return (undefined);
        }

        public static function StripSpace_(_arg_1:*)
        {
            _arg_1 = searchreplace(" ", "", _arg_1);
            return (searchreplace("_", "", _arg_1));
        }

        public static function searchreplace(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*=undefined)
        {
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_5:* = 0;
            while (_local_5 < _arg_3.length)
            {
                _local_6 = _arg_3;
                if (_arg_4 != 1)
                {
                    _local_6 = _arg_3.toLowerCase();
                };
                _local_7 = _local_6.indexOf(_arg_1, _local_5);
                if (_local_7 == -1) break;
                _local_8 = _arg_3.substr(0, _local_7);
                _local_9 = _arg_3.substr((_local_7 + _arg_1.length), _arg_3.length);
                _arg_3 = ((_local_8 + _arg_2) + _local_9);
                _local_5 = (_local_8.length + _arg_2.length);
            };
            return (_arg_3);
        }

        public static function Replace(_arg_1:*, _arg_2:*, _arg_3:*)
        {
            var _local_4:* = _arg_1.split(_arg_2);
            return (_local_4.join(_arg_3));
        }

        public static function urlencode(_arg_1:*)
        {
            _arg_1 = searchreplace(" ", "%20", _arg_1);
            return (searchreplace("?", "%3F", _arg_1));
        }

        public static function GotoXat(_arg_1:*)
        {
            var _local_2:* = ((((todo.usedomain + "/chat/room/") + todo.w_useroom) + "/?p=0&ss=") + _arg_1);
            getURL(_local_2, "_blank");
            UrlPopup(xconst.ST(8), _local_2);
        }

        public static function SmilieUrl(_arg_1:*, _arg_2:*, _arg_3:*=false)
        {
            var _local_4:* = xInt(_arg_1);
            if (_local_4 >= 20000)
            {
                _arg_1 = (_local_4 & ~(1));
            } else
            {
                if (_local_4 >= 10000)
                {
                    _arg_1 = _local_4;
                } else
                {
                    if (_arg_2 != "ks")
                    {
                        _arg_1 = _arg_1.toLowerCase();
                    };
                };
            };
            return ((((((todo.imagedomain + _arg_2) + "/") + _arg_1) + ".swf?v=") + global.sv));
        }

        public static function IdToRegName(_arg_1:*)
        {
            var _local_3:*;
            var _local_2:* = FindUser(_arg_1);
            if (_local_2 >= 0)
            {
                _local_3 = todo.Users[_local_2].registered;
            };
            if (_local_3 != undefined)
            {
                return ((((_local_3 + " (") + _arg_1) + ") "));
            };
            return ((_arg_1 + " "));
        }

        public static function FixLI(_arg_1:*)
        {
            _arg_1 = searchreplace("I", "i", _arg_1, 1);
            return (searchreplace("l", "L", _arg_1, 1));
        }

        public static function GroupUrl()
        {
            var _local_1:* = (todo.usedomain + "/");
            if ((((todo.w_useroom == todo.w_room)) && (!((global.gn == null)))))
            {
                _local_1 = (_local_1 + global.gn);
            } else
            {
                if (((!((todo.w_useroom == todo.w_room))) && (!((todo.BackVars[1] == undefined)))))
                {
                    _local_1 = (_local_1 + todo.BackVars[1]);
                } else
                {
                    _local_1 = (_local_1 + (("chat/room/" + todo.w_useroom) + "/"));
                };
            };
            return (_local_1);
        }

        public static function PageUrl(_arg_1:*)
        {
            return (((GroupUrl() + "?p=0&ss=") + _arg_1));
        }

        public static function McSetRGB(_arg_1:*, _arg_2:*)
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_3:* = _arg_1.transform.colorTransform;
            _local_3.color = _arg_2;
            _arg_1.transform.colorTransform = _local_3;
        }

        public static function getLocal(_arg_1:String, _arg_2:String=null, _arg_3:Boolean=false)
        {
            var _local_4:SharedObject = SharedObject.getLocal(_arg_1, _arg_2, _arg_3);
            _local_4.objectEncoding = ObjectEncoding.AMF0;
            return (_local_4);
        }

        public static function MainSolWrite(_arg_1:*, _arg_2:*=undefined, _arg_3:*=undefined)
        {
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            if (_arg_1 == "w_friendlist")
            {
                _local_4 = xatlib.getLocal("chat", "/");
                _local_4.objectEncoding = ObjectEncoding.AMF0;
                if (_local_4 != null)
                {
                    delete _local_4.data.w_friendlist;
                    _local_4.data.w_friendlist = new Array();
                    _local_5 = todo.w_friendlist.length;
                    _local_6 = 0;
                    while (_local_6 < _local_5)
                    {
                        _local_4.data.w_friendlist[_local_6] = todo.w_friendlist[_local_6];
                        if ((_local_6 % 128) == 0)
                        {
                            _local_7 = _local_4.flush();
                        };
                        _local_6++;
                    };
                    _local_7 = _local_4.flush();
                    _local_4.flush();
                    return (1);
                };
                return (0);
            };
            _local_4 = xatlib.getLocal("chat", "/");
            _local_4.objectEncoding = ObjectEncoding.AMF0;
            if (_local_4 != null)
            {
                _local_4.data[_arg_1] = _arg_2;
                if (_arg_3 == undefined)
                {
                    _local_4.flush();
                };
                return (1);
            };
            return (0);
        }

        public static function GotoWeb(_arg_1:*)
        {
            try
            {
                navigateToURL(_arg_1, "_blank");
            } catch(e:Error)
            {
            };
            UrlPopup(xconst.ST(8), _arg_1);
        }

        public static function xatlinks(_arg_1:*):String
        {
            var _local_2:Array = new Array(64);
            var _local_3:* = 0;
            while (_local_3 < 26)
            {
                _local_2[_local_3] = String.fromCharCode((_local_3 + 65));
                _local_3++;
            };
            _local_3 = 26;
            while (_local_3 < 52)
            {
                _local_2[_local_3] = String.fromCharCode((_local_3 + 71));
                _local_3++;
            };
            _local_3 = 52;
            while (_local_3 < 62)
            {
                _local_2[_local_3] = String.fromCharCode((_local_3 - 4));
                _local_3++;
            };
            _local_2[62] = "+";
            _local_2[63] = "/";
            var _local_4:* = new Array();
            var _local_5:* = new Array();
            _local_3 = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_4[_local_3] = _arg_1.charCodeAt(_local_3);
                _local_3++;
            };
            _local_3 = 0;
            while (_local_3 < _local_4.length)
            {
                switch ((_local_3 % 3))
                {
                    case 0:
                        _local_5.push(_local_2[((_local_4[_local_3] & 252) >> 2)]);
                        break;
                    case 1:
                        _local_5.push(_local_2[(((_local_4[(_local_3 - 1)] & 3) << 4) | ((_local_4[_local_3] & 240) >> 4))]);
                        break;
                    case 2:
                        _local_5.push(_local_2[(((_local_4[(_local_3 - 1)] & 15) << 2) | ((_local_4[_local_3] & 192) >> 6))]);
                        _local_5.push(_local_2[(_local_4[_local_3] & 63)]);
                        break;
                };
                _local_3++;
            };
            if ((_local_3 % 3) == 1)
            {
                _local_5.push(_local_2[((_local_4[(_local_3 - 1)] & 3) << 4)]);
            } else
            {
                if ((_local_3 % 3) == 2)
                {
                    _local_5.push(_local_2[((_local_4[(_local_3 - 1)] & 15) << 2)]);
                };
            };
            _local_3 = _local_5.length;
            while ((_local_3 % 4) != 0)
            {
                _local_5.push("=");
                _local_3++;
            };
            var _local_6:String = new String((todo.Http + "//linkvalidator.net/warn.php?p="));
            _local_3 = 0;
            while (_local_3 < _local_5.length)
            {
                _local_6 = (_local_6 + _local_5[_local_3]);
                _local_3++;
            };
            return (_local_6);
        }

        public static function SmOk(_arg_1:*, _arg_2:*=undefined, _arg_3:Boolean=false)
        {
            if (_arg_1 == undefined)
            {
                return (false);
            };
            _arg_1 = _arg_1.toString().toLowerCase();
            if (_arg_1 == "constructor")
            {
                return (false);
            };
            if (!xconst.smih[_arg_1])
            {
                return (false);
            };
            var _local_4:* = xconst.pssh[_arg_1];
            if ((((((_local_4 == -2)) && (_arg_2))) && (_arg_2[0])))
            {
                return (true);
            };
            if ((((((_local_4 == -1)) && (_arg_2))) && ((_arg_2[0] & 1))))
            {
                return (true);
            };
            if (_local_4 != undefined)
            {
                return (todo.HasPowerA(_arg_2, _local_4));
            };
            _local_4 = xconst.topsh[_arg_1];
            if (!_local_4)
            {
                return (true);
            };
            if ((((_arg_3 == false)) && ((_local_4 < 48))))
            {
                return (true);
            };
            if ((((((_local_4 == 78)) || ((_local_4 == 82)))) && (todo.HasPowerA(_arg_2, _local_4))))
            {
                return (true);
            };
            if ((((((((((((((((((((((((((((((_local_4 < 70)) || ((_local_4 & 1)))) || ((_local_4 == 90)))) || ((_local_4 == 92)))) || ((_local_4 == 96)))) || ((_local_4 == 98)))) || ((_local_4 == 102)))) || ((_local_4 == 108)))) || ((_local_4 == 116)))) || (!(xconst.IsGroup[_local_4])))) || ((_local_4 == 134)))) || ((_local_4 == 136)))) || ((_local_4 == 148)))) || ((_local_4 == 156)))) || ((_local_4 >= 180))))
            {
                return (todo.HasPowerA(_arg_2, _local_4));
            };
            return (todo.HasPowerA(todo.w_GroupPowers, _local_4));
        }

        public static function ReversePower(_arg_1:*):String
        {
            var _local_3:*;
            var _local_4:*;
            var _local_2:Array = new Array();
            _local_2 = _arg_1.split(" ");
            _local_2.reverse();
            for (_local_3 in _local_2)
            {
                _local_4 = _local_2[_local_3];
                if ((((_local_4.length > 0)) && (!((_local_4.charAt((_local_4.length - 1)) == ">")))))
                {
                    if (!(((((((_local_4.length > 2)) && ((_local_4.charAt(0) == "(")))) && ((_local_4.charAt((_local_4.length - 1)) == ")")))) && (xconst.smih[_local_4.substr(1, (_local_4.length - 2))])))
                    {
                        _local_2[_local_3] = _local_4.split("").reverse().join("");
                    };
                };
            };
            return (_local_2.join(" "));
        }

        public static function PreProcSmilie(_arg_1:String, _arg_2:*=undefined, _arg_3:*=undefined):String
        {
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:*;
            var _local_9:Number;
            var _local_10:String;
            var _local_11:Number;
            var _local_12:*;
            var _local_13:*;
            var _local_14:*;
            var _local_15:*;
            var _local_16:*;
            var _local_17:*;
            var _local_18:*;
            var _local_4 = "";
            var _local_5:* = _arg_1.toLowerCase();
            _local_6 = 0;
            for (;_local_6 < _arg_1.length;_local_6++)
            {
                _local_9 = _arg_1.charCodeAt(_local_6);
                _local_10 = _arg_1.charAt(_local_6);
                if (_local_10 == "(")
                {
                    _local_4 = (_local_4 + " (");
                    _local_8 = _local_6;
                } else
                {
                    if (_local_10 == ")")
                    {
                        if (_arg_3 != undefined)
                        {
                            if (xconst.smih[_arg_1.substr((_local_8 + 1), ((_local_6 - _local_8) - 1)).toLowerCase()])
                            {
                                _local_4 = (_local_4 + ("#" + _arg_3));
                            };
                        };
                        _local_4 = (_local_4 + ") ");
                    } else
                    {
                        if ((((((((((_local_10 == "|")) || ((_local_10 == ":")))) || ((_local_10 == ";")))) || ((_local_10 == "8")))) || ((_local_10.toLowerCase() == "p"))))
                        {
                            _local_11 = 0;
                            _local_7 = 0;
                            while (_local_7 < xconst.smArray.length)
                            {
                                if (xconst.smArray[_local_7] < 0)
                                {
                                    _local_11 = (_local_7 + 1);
                                } else
                                {
                                    if (xconst.smArray[(_local_7 + 1)] >= 0)
                                    {
                                        if (_local_10 == xconst.smArray[_local_7].charAt(0))
                                        {
                                            if (xconst.smArray[_local_7] == _local_5.substr(_local_6, xconst.smArray[_local_7].length))
                                            {
                                                _local_4 = (_local_4 + ((" " + xconst.smArray[_local_11]) + " "));
                                                _local_6 = (_local_6 + (xconst.smArray[_local_7].length - 1));
                                                _local_11 = -1;
                                                break;
                                            };
                                        };
                                    };
                                };
                                _local_7++;
                            };
                            if (_local_11 < 0) continue;
                        };
                        _local_4 = (_local_4 + _local_10);
                    };
                };
            };
            if (((_arg_2) && ((todo.autologin & 2))))
            {
                _local_12 = _local_4.split(" ");
                _local_15 = "";
                _local_16 = xconst.badwords.length;
                _local_17 = _local_12.length;
                _local_7 = 0;
                while (_local_7 < _local_17)
                {
                    if (_local_12[_local_7].length >= 4)
                    {
                        _local_14 = _local_12[_local_7].toLowerCase();
                        _local_6 = 0;
                        while (_local_6 < _local_16)
                        {
                            if (_local_14.indexOf(xconst.badwords[_local_6]) != -1)
                            {
                                _local_18 = "1";
                                if (((todo.gconfig["g90"]) && (todo.gconfig["g90"][xconst.badwords[_local_6]])))
                                {
                                    _local_18 = "2";
                                };
                                _local_12[_local_7] = ((("<s" + _local_18) + ">") + _local_12[_local_7]);
                                _local_13 = 1;
                                break;
                            };
                            _local_6++;
                        };
                    };
                    _local_7++;
                };
                if (_local_13)
                {
                    return (_local_12.join(" "));
                };
            };
            return (_local_4);
        }

        public static function DecodeColor(str:*, rp:*=true, gp:*=true, bp:*=true, lp:*=true)
        {
            var R:* = undefined;
            var G:* = undefined;
            var B:* = undefined;
            var H:* = undefined;
            var S:* = undefined;
            var L:* = undefined;
            var c:* = undefined;
            var a:* = undefined;
            var ch:* = undefined;
            var hcol:* = undefined;
            var dR:* = undefined;
            var dG:* = undefined;
            var dB:* = undefined;
            var b:* = undefined;
            var Hue:Function = function (_arg_1:*, _arg_2:*, _arg_3:*)
            {
                if (_arg_3 < 0)
                {
                    _arg_3 = (_arg_3 + 1);
                };
                if (_arg_3 > 1)
                {
                    _arg_3--;
                };
                if ((6 * _arg_3) < 1)
                {
                    return ((_arg_1 + (((_arg_2 - _arg_1) * 6) * _arg_3)));
                };
                if ((2 * _arg_3) < 1)
                {
                    return (_arg_2);
                };
                if ((3 * _arg_3) < 2)
                {
                    return ((_arg_1 + (((_arg_2 - _arg_1) * ((2 / 3) - _arg_3)) * 6)));
                };
                return (_arg_1);
            };
            if (str == undefined)
            {
                return (undefined);
            };
            if ((((((((rp == false)) && ((gp == false)))) && ((bp == false)))) && ((lp == false))))
            {
                return (undefined);
            };
            str = str.toLowerCase();
            var rc:* = (str.split("r").length - 1);
            var gc:* = (str.split("g").length - 1);
            var bc:* = (str.split("b").length - 1);
            var lc:* = (str.split("+").length - 1);
            var dc:* = (str.split("-").length - 1);
            var sL:* = 0.5;
            if ((((((((rc == 0)) && ((gc == 0)))) && ((lc == 0)))) && ((dc == 0))))
            {
                c = 0;
                a = 0;
                while (a < str.length)
                {
                    ch = str.charAt(a);
                    c = (((((((ch >= "0")) && ((ch <= "9")))) || ((((ch >= "a")) && ((ch <= "f")))))) ? (c + 1) : 0);
                    if (c == 6)
                    {
                        hcol = parseInt(str.substr(((a - c) + 1), 6), 16);
                        if (((((((!((rp == false))) && (!((gp == false))))) && (!((bp == false))))) && (!((lp == false)))))
                        {
                            return (hcol);
                        };
                        bc = (hcol & 0xFF);
                        gc = ((hcol >> 8) & 0xFF);
                        rc = ((hcol >> 16) & 0xFF);
                        var _local_7:int;
                        dc = _local_7;
                        lc = _local_7;
                        if (lp != false)
                        {
                            sL = ((Math.min(rc, Math.min(gc, bc)) + Math.max(rc, Math.max(gc, bc))) / 0x0200);
                        };
                        break;
                    };
                    a++;
                };
            };
            if ((((((((((rc == 0)) && ((gc == 0)))) && ((bc == 0)))) && ((lc == 0)))) && ((dc == 0))))
            {
                return (undefined);
            };
            if (rp == false)
            {
                rc = 0;
            };
            if (gp == false)
            {
                gc = 0;
            };
            if (bp == false)
            {
                bc = 0;
            };
            if (lp == false)
            {
                _local_7 = 0;
                dc = _local_7;
                lc = _local_7;
            };
            if ((((((rc == 0)) && ((gc == 0)))) && ((bc == 0))))
            {
                _local_7 = 1;
                bc = _local_7;
                gc = _local_7;
                rc = _local_7;
            };
            var Rn:* = (rc / ((rc + gc) + bc));
            var Gn:* = (gc / ((rc + gc) + bc));
            var Bn:* = (bc / ((rc + gc) + bc));
            var min:* = Math.min(Rn, Math.min(Gn, Bn));
            var max:* = Math.max(Rn, Math.max(Gn, Bn));
            var d:* = (max - min);
            L = ((max + min) / 2);
            if (d == 0)
            {
                _local_7 = 0;
                S = _local_7;
                H = _local_7;
            } else
            {
                S = (((L < 0.5)) ? (d / (max + min)) : (d / ((2 - max) - min)));
                dR = ((((max - Rn) / 6) + (d / 2)) / d);
                dG = ((((max - Gn) / 6) + (d / 2)) / d);
                dB = ((((max - Bn) / 6) + (d / 2)) / d);
                if (Rn == max)
                {
                    H = (dB - dG);
                } else
                {
                    if (Gn == max)
                    {
                        H = (((1 / 3) + dR) - dB);
                    } else
                    {
                        if (Bn == max)
                        {
                            H = (((2 / 3) + dG) - dR);
                        };
                    };
                };
                if (H < 0)
                {
                    H = (H + 1);
                };
                if (H > 1)
                {
                    H--;
                };
            };
            L = ((sL + (0.0625 * lc)) - (0.0625 * dc));
            if (L < 0)
            {
                L = 0;
            };
            if (L > 1)
            {
                L = 1;
            };
            if (S == 0)
            {
                _local_7 = L;
                B = _local_7;
                G = _local_7;
                R = _local_7;
            } else
            {
                a = (((L < 0.5)) ? (L * (1 + S)) : ((L + S) - (S * L)));
                b = ((2 * L) - a);
                R = Hue(b, a, (H + (1 / 3)));
                G = Hue(b, a, H);
                B = Hue(b, a, (H - (1 / 3)));
            };
            R = Math.round((0xFF * R));
            G = Math.round((0xFF * G));
            B = Math.round((0xFF * B));
            return ((((R << 16) + (G << 8)) + B));
        }

        public static function Register_Link(_arg_1:*)
        {
            var _local_2:*;
            _local_2 = (todo.usedomain + "/web_gear/chat/register.php");
            if (_arg_1 != undefined)
            {
                _local_2 = (_local_2 + ((((("?UserId=" + todo.w_userno) + "&k2=") + todo.w_k2) + "&mode=") + _arg_1));
            };
            return (_local_2);
        }

        public static function Register_onRelease(_arg_1:*)
        {
            main.closeDialog();
            var _local_2:* = "";
            if (_arg_1 > 0)
            {
                _local_2 = "&b=1";
            };
            var _local_3:* = (Register_Link(1) + _local_2);
            UrlPopup(xconst.ST(8), _local_3, undefined);
        }

        public static function dump(_arg_1:*, _arg_2:*=0)
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            if (_arg_2 == 0)
            {
            };
            for (_local_3 in _arg_1)
            {
                _local_4 = "";
                _local_5 = 0;
                while (_local_5 < _arg_2)
                {
                    _local_4 = (_local_4 + "  ");
                    _local_5++;
                };
                _local_4 = (_local_4 + ((((_local_3 + ":") + typeof(_arg_1[_local_3])) + "=") + _arg_1[_local_3]));
                if (typeof(_arg_1[_local_3]) == "object")
                {
                    dump(_arg_1[_local_3], (_arg_2 + 1));
                };
            };
        }

        public static function catchIOError(_arg_1:IOErrorEvent)
        {
        }

        public static function LoadMovie(_arg_1:*, _arg_2:*, _arg_3:*=undefined)
        {
            var _local_4:* = new Loader();
            var _local_5:URLRequest = new URLRequest(_arg_2);
            _local_4.load(_local_5);
            if (_arg_1)
            {
                _arg_1.addChild(_local_4);
            };
            if (_arg_3)
            {
                _local_4.contentLoaderInfo.addEventListener(Event.COMPLETE, _arg_3);
            };
            _local_4.addEventListener(IOErrorEvent.IO_ERROR, catchIOError);
            return (_local_4);
        }

        public static function xLog(_arg_1:String)
        {
            var _local_2:URLRequest = new URLRequest();
            _local_2.url = ((((todo.Http + "//g.xat.com/images/w.gif?t=") + escape(_arg_1)) + "&r=") + Math.random());
            _local_2.method = URLRequestMethod.GET;
            var _local_3:URLLoader = new URLLoader();
            _local_3.load(_local_2);
            _local_3.addEventListener(Event.COMPLETE, xLogComplete);
        }

        public static function xLogComplete(_arg_1:Event)
        {
        }

        public static function SplitBackground(_arg_1:String)
        {
            if (!_arg_1)
            {
                _arg_1 = "";
            };
            todo.BackVars = _arg_1.split(";=");
            var _local_2:* = todo.BackVars[0].split("#");
            todo.BackVars[0] = _local_2[0];
            if (todo.BackVars[1] == undefined)
            {
                todo.BackVars[1] = "Lobby";
            };
            if (xInt(todo.BackVars[2]) < 1)
            {
                todo.BackVars[2] = 1;
            };
        }

        public static function LoadVariables(_arg_1:*, _arg_2:*=undefined, _arg_3:*=undefined, _arg_4:*=undefined)
        {
            var _local_5:URLRequest = new URLRequest();
            if (_arg_1.substr(0, 2) == "//")
            {
                _arg_1 = (todo.Http + _arg_1);
            };
            _local_5.url = _arg_1;
            if (_arg_4)
            {
                _local_5.method = URLRequestMethod.POST;
            } else
            {
                _local_5.method = URLRequestMethod.GET;
            };
            if (_arg_3)
            {
                _local_5.data = _arg_3;
            };
            var _local_6:URLLoader = new URLLoader();
            _local_6.load(_local_5);
            if (_arg_2)
            {
                _local_6.addEventListener(Event.COMPLETE, _arg_2);
            };
            return (_local_6);
        }

        public static function AttachBut(_arg_1:*, _arg_2:*, _arg_3:*=0.8)
        {
            _arg_1.c = new library(_arg_2);
            _arg_1.addChild(_arg_1.c);
            _arg_1.c.scaleX = SX(_arg_3);
            _arg_1.c.scaleY = SY(_arg_3);
            _arg_1.c.x = NX(10);
            _arg_1.c.y = NY(5);
            return (_arg_1.c);
        }

        public static function AddTextField(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*, _arg_5:*, _arg_6:*="", _arg_7:*=undefined)
        {
            var _local_8:* = new TextField();
            if (_arg_7 == undefined)
            {
                _arg_7 = main.fmt;
            };
            _local_8.x = _arg_2;
            _local_8.y = _arg_3;
            _local_8.width = _arg_4;
            _local_8.height = _arg_5;
            _local_8.autoSize = TextFieldAutoSize.NONE;
            _local_8.selectable = true;
            _local_8.defaultTextFormat = _arg_7;
            _local_8.text = _arg_6;
            _arg_1.addChild(_local_8);
            return (_local_8);
        }

        public static function RemoveCR(_arg_1:Event)
        {
            var _local_4:*;
            var _local_2:* = _arg_1.currentTarget;
            var _local_3:* = 0;
            while (_local_3 < _local_2.text.length)
            {
                _local_4 = _local_2.text.charAt(_local_3);
                if ((((_local_4 == "\r")) || ((_local_4 == ">"))))
                {
                    _local_2.text = (_local_2.text.substr(0, _local_3) + _local_2.text.substr((_local_3 + 1)));
                };
                _local_3++;
            };
        }

        public static function AttachMovie(_arg_1:*, _arg_2:*, _arg_3:*=undefined)
        {
            var _local_4:* = new library(_arg_2);
            if (_arg_3)
            {
                if (_arg_3["x"])
                {
                    _local_4.x = _arg_3["x"];
                };
                if (_arg_3["y"])
                {
                    _local_4.y = _arg_3["y"];
                };
                if (_arg_3["scaleX"])
                {
                    _local_4.scaleX = _arg_3["scaleX"];
                };
                if (_arg_3["scaleY"])
                {
                    _local_4.scaleY = _arg_3["scaleY"];
                };
                if (_arg_3["width"])
                {
                    _local_4.width = _arg_3["width"];
                };
                if (_arg_3["height"])
                {
                    _local_4.height = _arg_3["height"];
                };
            };
            if (_arg_1)
            {
                _arg_1.addChild(_local_4);
            };
            return (_local_4);
        }

        public static function ReLogin()
        {
            todo.lb = "n";
            todo.DoUpdate = true;
            network.NetworkClose();
            main.logoutbutonPress();
        }

        public static function MakeGlow(_arg_1:*, _arg_2:*=3, _arg_3:*=2)
        {
            var _local_4:GlowFilter = new GlowFilter(_arg_1, 0.7, _arg_3, _arg_3, 6, _arg_2, false, false);
            return ([_local_4]);
        }

        public static function NoToRank(_arg_1:*)
        {
            if (_arg_1 >= 14)
            {
                return ("o");
            };
            if (_arg_1 >= 10)
            {
                return ("M");
            };
            if (_arg_1 >= 7)
            {
                return ("m");
            };
            if (_arg_1 >= 3)
            {
                return ("e");
            };
            return ("g");
        }

        public static function GetRank(_arg_1:*)
        {
            var _local_2:* = xatlib.FindUser(_arg_1);
            if (_local_2 < 0)
            {
                return (0);
            };
            if (todo.Users[_local_2].mainowner)
            {
                return (14);
            };
            if (todo.Users[_local_2].owner)
            {
                return (10);
            };
            if (todo.Users[_local_2].moderator)
            {
                return (7);
            };
            if (todo.Users[_local_2].member)
            {
                return (3);
            };
            return (1);
        }

        public static function RankColor(_arg_1:*, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            var _local_5:*;
            var _local_4 = "00C000";
            while (1)
            {
                if ((_arg_1 is String))
                {
                    switch (_arg_1.charAt(0))
                    {
                        case "o":
                        case "M":
                            _local_4 = "FF9900";
                            break;
                        case "e":
                            _local_4 = "6565FF";
                            break;
                        case "m":
                            _local_4 = "FFFFFF";
                            break;
                    };
                } else
                {
                    if (_arg_1 >= 0)
                    {
                        _local_5 = todo.Users[_arg_1];
                        if (_local_5)
                        {
                            if (!_local_5.online)
                            {
                                _local_4 = "FF0000";
                                if (((_arg_3) && (_local_5.onsuper)))
                                {
                                    _local_4 = "00C000";
                                };
                                break;
                            };
                            if (_local_5.banned)
                            {
                                _local_4 = "964B00";
                                break;
                            };
                            if (_local_5.member)
                            {
                                _local_4 = "6565FF";
                            };
                            if (_local_5.moderator)
                            {
                                _local_4 = "FFFFFF";
                            };
                            if (((_local_5.owner) || (_local_5.mainowner)))
                            {
                                _local_4 = "FF9900";
                            };
                            if (todo.Users[_arg_1].VIP)
                            {
                                if (todo.HasPower(_arg_1, 30))
                                {
                                    _local_4 = "FF69B4";
                                };
                                if (todo.HasPower(_arg_1, 64))
                                {
                                    _local_4 = "000080";
                                };
                                if (todo.HasPower(_arg_1, 35))
                                {
                                    _local_4 = "800080";
                                };
                                if (todo.HasPower(_arg_1, 153))
                                {
                                    _local_4 = "F4C75F";
                                };
                                if (todo.HasPower(_arg_1, 95))
                                {
                                    _local_4 = "DC143C";
                                };
                                if (todo.Users[_arg_1].u == 42)
                                {
                                    _local_4 = "000001";
                                };
                                if ((todo.Users[_arg_1].aFlags & (1 << 21)))
                                {
                                    _local_4 = "13E7E5";
                                };
                            };
                        };
                    };
                };
                break;
            };
            if (_arg_2)
            {
                return (_local_4);
            };
            return (parseInt(_local_4, 16));
        }

        public static function xJSONdecode(s:*, Mangle:*=true)
        {
            if (!s)
            {
                return (undefined);
            };
            try
            {
                if (Mangle)
                {
                    s = searchreplace("'", '"', s);
                };
                return (xJSON.decode(s));
            } catch(e:Error)
            {
                return (undefined);
            };
        }

        public static function iMux(_arg_1:*)
        {
            var _local_4:int;
            var _local_2:int;
            var _local_3:int = _arg_1.length;
            _local_4 = 0;
            while (_local_4 < 10)
            {
                _local_2 = (_local_2 + _arg_1.charAt(--_local_3));
                _local_4++;
            };
            _local_2 = 0;
            return (((((todo.Http + "//i") + (_local_2 & 1)) + ".xat.com/web_gear/chat/") + _arg_1));
        }

        public static function OnCheck(_arg_1:MouseEvent)
        {
            _arg_1.currentTarget.xitem.tick.visible = !(_arg_1.currentTarget.xitem.tick.visible);
        }

        public static function SockTime()
        {
            return (int((network.YC + ((getTimer() - network.YC2) / 1000))));
        }

        public static function MakeQuery(_arg_1:*)
        {
            var _local_3:*;
            var _local_2:* = "?";
            for (_local_3 in _arg_1)
            {
                _local_2 = (_local_2 + (((_local_3 + "=") + _arg_1[_local_3]) + "&"));
            };
            return (_local_2);
        }

        public static function ChkSum(_arg_1:*)
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:* = _arg_1.length;
            var _local_5:* = 0;
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                _local_2 = _arg_1.charCodeAt(_local_3);
                if (_local_2 != 32)
                {
                    _local_5 = (_local_5 + _local_2);
                };
                _local_3++;
            };
            return (_local_5);
        }

        public static function GetNick(_arg_1:*, _arg_2:*)
        {
            var _local_3:* = todo.w_friendlist3[_arg_2];
            if (((((_local_3) && (_local_3.k))) && ((_local_3.k.length > 0))))
            {
                if (_local_3.k.charAt((_local_3.k.length - 1)) == ".")
                {
                    _arg_1 = xatlib.PreProcSmilie(_local_3.k.substr(0, (_local_3.k.length - 1)));
                } else
                {
                    _arg_1 = (xatlib.PreProcSmilie(_local_3.k) + _arg_1);
                };
            };
            return (_arg_1);
        }


    }
}//package 

