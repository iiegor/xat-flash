// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//DialogHelp

package 
{
    import flash.display.Sprite;
    import flash.net.URLRequest;
    import flash.net.URLLoader;
    import flash.net.URLRequestMethod;
    import flash.events.Event;
    import flash.display.MovieClip;
    import flash.events.*;
    import com.adobe.serialization.json.*;
    import flash.display.*;
    import flash.net.*;

    public class DialogHelp extends Sprite 
    {

        public var HelpText;
        public var mchelpbackb;
        public var mchelpbackground;
        public var mchelpback;
        public var mchelpbackmask;
        public var bhelpscrollmc;
        public var helpinc = 0;
        public var bpw;
        public var bph;
        public var bpx;
        public var bpy;

        public function DialogHelp(_arg_1:*=0)
        {
            var _local_7:URLRequest;
            var _local_8:URLLoader;
            super();
            this.HelpText = undefined;
            if (_arg_1 == 1)
            {
                _local_7 = new URLRequest();
                _local_7.url = (todo.usedomain + "/terms.php?z4");
                _local_7.method = URLRequestMethod.GET;
                _local_8 = new URLLoader();
                _local_8.load(_local_7);
                _local_8.addEventListener(Event.COMPLETE, this.Handler);
            };
            this.mchelpbackground = new xDialog(this, xatlib.NX(20), xatlib.NY(20), xatlib.NX(600), xatlib.NY(440), (" " + xconst.ST(14)), undefined, 0);
            var _local_2:* = this.mchelpbackground.Dia;
            var _local_3:* = 36;
            var _local_4:* = 137;
            var _local_5:* = new xBut(this.mchelpbackground, xatlib.NX(_local_3), xatlib.NY(60), xatlib.NX(135), xatlib.NY(26), "FAQ", this.FAQPress, (xatlib.c_bl + xatlib.c_br));
            _local_3 = (_local_3 + _local_4);
            var _local_6:* = new xBut(this.mchelpbackground, xatlib.NX(_local_3), xatlib.NY(60), xatlib.NX(135), xatlib.NY(26), "Terms", this.TermsPress, (xatlib.c_bl + xatlib.c_br));
            _local_3 = (_local_3 + _local_4);
            _local_2.mcreturn2 = new xBut(this.mchelpbackground, xatlib.NX(240), xatlib.NY(420), xatlib.NX(160), xatlib.NY(30), xconst.ST(45), this.Delete);
            this.bpw = xatlib.NX(580);
            this.bph = (xatlib.NY((390 - 30)) - 40);
            this.bpx = xatlib.NX(30);
            this.bpy = (xatlib.NY((20 + 25)) + 40);
            this.mchelpbackb = xatlib.AddBackground(this.mchelpbackground, this.bpx, this.bpy, this.bpw, this.bph);
            this.mchelpback = new MovieClip();
            this.mchelpbackb.addChild(this.mchelpback);
            this.mchelpback.Width = this.bpw;
            this.mchelpbackmask = xatlib.AddBackground(this.mchelpbackground, (this.bpx + 1), (this.bpy + 1), ((this.bpw - 2) - xatlib.NX(16)), (this.bph - 2), xatlib.c_Mask);
            this.mchelpback.mask = this.mchelpbackmask;
            this.bhelpscrollmc = new xScroll(this.mchelpbackground, ((this.bpx + this.bpw) - xatlib.NX(16)), this.bpy, xatlib.NX(16), this.bph, xatlib.NX(16), xatlib.NX(32), 30, (10 * 100), (0 * 100), this.onHelpScrollChange);
            if (_arg_1 == 0)
            {
                this.Displayhelp();
            };
        }

        function Delete(_arg_1:Event)
        {
            this.mchelpbackground.Delete();
            main.closeDialog();
        }

        function Displayhelp()
        {
            var _local_1:*;
            var _local_2:*;
            this.helpinc = 0;
            this.AddHelpLine("xat.dev/wiki for detailed help.");
            this.AddHelpLine("");
            for (_local_1 in xconst.HelpTable)
            {
                _local_2 = xconst.HelpTable[_local_1];
                if (_local_2.substr(0, 3) == "BB ")
                {
                    _local_2 = (("<b> " + _local_2.substr(3)) + " </b>");
                };
                this.AddHelpLine(_local_2);
            };
            this.AddHelpLine("");
            this.AddHelpLine((chat.cVersion + ((chat.debug) ? " debug" : "")));
            this.onHelpScrollChange();
        }

        function Handler(_arg_1:Event)
        {
            var _local_2:*;
            this.helpinc = 0;
            var _local_3:URLLoader = URLLoader(_arg_1.target);
            var _local_4:* = _local_3.data;
            var _local_5:* = _local_4.split("<");
            if (_local_5.length > 500)
            {
                _local_5.length = 500;
            };
            var _local_6:* = 0;
            while (_local_6 < _local_5.length)
            {
                _local_2 = _local_5[_local_6].charAt(0);
                if (_local_2 == "/")
                {
                    this.AddHelpLine("");
                } else
                {
                    if (_local_2 == "p")
                    {
                        _local_2 = _local_5[_local_6].split(">");
                        if (_local_2[1])
                        {
                            this.AddHelpLine(_local_2[1]);
                        };
                    } else
                    {
                        if (_local_2 == "b")
                        {
                            this.AddHelpLine(_local_5[_local_6].substr(4));
                        };
                    };
                };
                _local_6++;
            };
            this.onHelpScrollChange();
        }

        function AddHelpLine(_arg_1:String)
        {
            var _local_2:* = new MovieClip();
            this.mchelpback.addChild(_local_2);
            _local_2.x = 5;
            this.helpinc = (this.helpinc + (4 + xmessage.AddMessageToMc(_local_2, 4, _arg_1, 0, (this.mchelpback.Width - 30), this.helpinc)));
        }

        function onHelpScrollChange()
        {
            var _local_1:* = ((this.helpinc - this.bph) + 4);
            if (_local_1 < 0)
            {
                _local_1 = 0;
            };
            this.bhelpscrollmc.Scr_size = _local_1;
            var _local_2:* = this.bhelpscrollmc.Scr_position;
            this.mchelpback.y = -(_local_2);
        }

        function FAQPress(_arg_1:Event)
        {
            main.openDialog(5, 0);
        }

        function TermsPress(_arg_1:Event)
        {
            main.openDialog(5, 1);
        }

        function tick(_arg_1:Event)
        {
        }


    }
}//package 

