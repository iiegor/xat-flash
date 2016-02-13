// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//todo

package 
{
    import flash.filters.GlowFilter;
    import flash.filters.DropShadowFilter;
    import flash.display.*;
    import flash.text.*;
    import flash.utils.*;
    import flash.filters.*;
    import flash.geom.*;

    public class todo 
    {

        public static var config = new Object();
        public static var gconfig = new Object();
        public static var bMobile = false;
        public static var bThin = false;
        public static var bHeadless = false;
        public static var bStrip = false;
        public static var bSmilies = false;
        public static var debug = false;
        public static var turbo:int = 1;
        public static var avs:int = 7;
        public static var FV:int = 9;
        public static const PWR_MAX_TRADE:int = (((((62 + 32) + 32) + (32 * 2)) + (32 * 3)) + (32 * 4));//414
        public static const MAX_PWR_INDEX:int = (int((PWR_MAX_TRADE / 32)) + 1);
        public static const NO_POWERS = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        public static const ALL_POWERS = [0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF];
        public static var helpupdate;
        public static var mi = 0;
        public static var MessageCount;
        public static var News = 17;
        public static var LastBump = -1;
        public static var WY;
        public static var systemMessages = "";
        public static var w_userno:Number = 0;
        public static var w_k1 = 0;
        public static var w_k2:Number = 0;
        public static var w_ALLP:Number;
        public static var w_userrev = undefined;
        public static var w_d0:Number = 0;
        public static var w_d1:Number = 0;
        public static var w_d2:Number;
        public static var w_d3:Number;
        public static var w_dt:Number;
        public static var w_coins:Number;
        public static var w_email;
        public static var w_password;
        public static var w_bride:Number;
        public static var w_registered = undefined;
        public static var w_VIP;
        public static var w_Powers:Array = todo.NO_POWERS.slice();
        public static var w_GroupPowers:Array = todo.NO_POWERS.slice();
        public static var w_xats:Number;
        public static var w_sn;
        public static var w_PowerO = undefined;
        public static var w_k3:String;
        public static var w_room:Number = 1;
        public static var w_useroom:Number = w_room;
        public static var w_friendlist:Array = new Array();
        public static var w_friendlist2:Object = new Object();
        public static var w_friendlist3;
        public static var w_name:String = "";
        public static var w_avatar:String = "";
        public static var w_homepage:String = "";
        public static var w_Vol:Array = new Array();
        public static var w_sound;
        public static var w_Mask = todo.NO_POWERS.slice();
        public static var w_autologin = 0xFFFF;
        public static var w_pool:Number = 0;
        public static var w_member:Boolean;
        public static var w_moderator:Boolean;
        public static var w_owner:Boolean;
        public static var w_mainowner:Boolean;
        public static var w_lang;
        public static var w_langv;
        public static var w_roomlang;
        public static var w_banlist:Array = new Array();
        public static var w_ignorelist2:Object = new Object();
        public static var w_userrevlist:Array = new Array();
        public static var w_namelist:Array = new Array();
        public static var w_avatarlist:Array = new Array();
        public static var w_homepagelist:Array = new Array();
        public static var w_Options;
        public static var w_news;
        public static var w_hints = true;
        public static var w_room_cb:int = 0;
        public static var w_cb:uint = 0;
        public static var w_r:uint = 0;
        public static var foe;
        public static var Http:String = "http:";
        public static var usedomain:String = "//xat.dev";
        public static var chatdomain:String = (usedomain + "/web_gear/chat/");
        public static var imagedomain:String = "//www.xat.dev/images/";
        public static var flashdomain:String = "//www.xat.dev/web_gear/flash/";
        public static var DoBuildUserListScrollUp:Boolean;
        public static var messageecho:String;
        public static var MessageToSend:String = "";
        public static var Users:Array = new Array();
        public static var Tickled:int = 1;
        public static var forceport;
        public static var forcedom:String;
        public static var sockdomain:String;
        public static var DoBuildUserList:Boolean;
        public static var DoUpdate:Boolean;
        public static var DoUpdateMessages:Boolean;
        public static var MessageToProcess:String = "";
        public static var tick:Number = 0;
        public static var PrivateChat = 0;
        public static var PrivateMessage = 0;
        public static var helpstr = "";
        public static var HelpUpdate = 0;
        public static var ScrollDown:Boolean;
        public static var LastScrollTime;
        public static var DoUserSnd:Boolean;
        public static var ResetSmilies:Boolean;
        public static var LoginPressed:Boolean;
        public static var WV2:Boolean;
        public static var tabs:Array = new Array();
        public static var OnSuper:Boolean;
        public static var lb:String = "n";
        public static var LastMessageToSend:String;
        public static var Message:Array = new Array();
        public static var ButCol = 0xC8C8C8;
        public static var ButColW = 0;
        public static var ButColW2 = 0;
        public static var BackVars = new Array(undefined, undefined, undefined, undefined, new Array(), " ", undefined);
        public static var MainFlagBits;
        public static var FlagBits:Number;
        public static var mcgetachat;
        public static var Pools:Array = new Array();
        public static var Private_onRelease:Number;
        public static var pass;
        public static var useport:Number;
        public static var usebackground;
        public static var lastbackground;
        public static var useRadio;
        public static var pool;
        public static var newpool;
        public static var emmax;
        public static var connectchannel;
        public static var mscrollmc;
        public static var heartbeatduration:Number = 83;
        public static var w_help = true;
        public static var SmilieUpdate = -1;
        public static var w_attract = true;
        public static var TabGlowFlag:Boolean;
        public static var DoMessageSnd:Boolean;
        public static var DoTabSnd:Boolean;
        public static var DoAudieSnd:Boolean = false;
        public static var CustomSound = "";
        public static var BumpSound = "";
        public static var LastTabUser:Number;
        public static var Away:int = 0;
        public static var Typing:int = 0;
        public static var TypingID:int = 0;
        public static var Random:uint = 0;
        public static var TextGlow:GlowFilter = new GlowFilter(0xFF00, 0.7, 4, 4, 6, 3, false, false);
        public static var myDropFilter:DropShadowFilter = new DropShadowFilter(6, 45, 0, 0.6, 5, 5, 1, 1, false, false, false);
        public static var DropFilter:Array = new Array();
        public static var Meezer;
        public static var StageWidth = 640;
        public static var StageHeight = 480;
        public static var Macros = {};
        public static var autologin;
        public static var tpw;
        public static var tph;
        public static var tpx;
        public static var tpy;
        public static var RefreshLogin;
        public static var group;
        public static var UserNo;
        public static var uKiss;
        public static var LastPC;
        public static var LangText = undefined;

        {
            DropFilter.push(myDropFilter);
        }


        public static function ImInviteAll()
        {
        }

        public static function HasPowerA(_arg_1:*, _arg_2:*, _arg_3:*=undefined)
        {
            if (!_arg_1)
            {
                return (false);
            };
            var _local_4:* = (_arg_2 >> 5);
            if (_arg_2 < 0)
            {
                _local_4 = -1;
            };
            if (!_arg_1[_local_4])
            {
                return (false);
            };
            var _local_5:* = (_arg_2 % 32);
            if (_arg_2 < 0)
            {
                _local_5 = ((-(_arg_2) % 32) - 1);
            };
            var _local_6:* = _arg_1[_local_4];
            if (((_arg_3) && (_arg_3[_local_4])))
            {
                _local_6 = (_local_6 & ~(_arg_3[_local_4]));
            };
            return (!(((_local_6 & (1 << _local_5)) == 0)));
        }

        public static function HasPower(_arg_1:*, _arg_2:*)
        {
            if (!Users[_arg_1])
            {
                return (false);
            };
            return (HasPowerA(Users[_arg_1].Powers, _arg_2));
        }

        public static function Debug()
        {
            var _local_1:* = 0;
            _local_1++;
        }


    }
}//package 

