// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//smiley

package 
{
    import flash.display.Sprite;
    import flash.utils.Dictionary;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import flash.display.Bitmap;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
    import flash.utils.*;
    import flash.geom.*;

    public dynamic class smiley extends Sprite 
    {

        public static const b_fade = 4;
        public static const b_glow = 16;
        public static const b_internal = 32;
        public static const f_Reg = 1;
        public static const f_Sub = 2;
        public static const f_Hat = 8;
        public static const f_AllPowers = 16;
        public static const f_TopDog = 32;
        public static const f_NoCache = 64;
        public static const f_Simple = 128;
        public static const f_FlashRank = 0x0100;
        public static const f_OneFrame = 0x0200;
        public static const f_Strip = 0x0400;
        public static var TickDict = new Dictionary(true);

        private var sm;
        private var tik = 0;
        private var Master:Boolean = false;
        public var FrameStore;
        private var bs:int = 20;
        private var bf:int = 12;
        private var sc;
        private var Frame;
        private var mcFrame;
        private var Index;
        private var Parent;
        private var mBaseSmiley;
        public var Clicker;
        private var StripTries:int = 0;
        private var Reload:int = 0;

        public function smiley(_arg_1:*, _arg_2:*, _arg_3:*=20)
        {
            var _local_4:*;
            var _local_5:*;
            super();
            if (todo.config["nosmilies"])
            {
                return;
            };
            if (_arg_2 == "none")
            {
                return;
            };
            _arg_1.addChild(this);
            if (!_arg_1.SA)
            {
                _arg_1.SA = (("(" + _arg_2) + "#)");
                _arg_1.SF = 2;
            };
            this.sc = (_arg_3 / 20);
            if (!todo.turbo)
            {
                _arg_1.SF = (_arg_1.SF | f_NoCache);
            };
            this.Clicker = this;
            if ((((_arg_1.SF & f_Strip)) || ((todo.Macros["seffect"] === "off"))))
            {
                _arg_1.SF = (_arg_1.SF & ~(f_NoCache));
            };
            if (!(_arg_1.SF & f_NoCache))
            {
                TickDict[this] = 1;
                this.Index = _arg_1.SA.toLowerCase();
                if (_arg_3 != 20)
                {
                    this.Index = (this.Index + ("_" + _arg_3));
                };
                if (_arg_1.u)
                {
                    this.Index = (this.Index + ("_" + _arg_1.u));
                };
                if ((_arg_1.SF & f_OneFrame))
                {
                    this.Index = (this.Index + "_S");
                };
                this.Parent = _arg_1;
                addEventListener(Event.REMOVED_FROM_STAGE, this.cleanUp, false, 0, true);
                this.mBaseSmiley = _arg_2;
                mouseEnabled = false;
                this.mcFrame = new Sprite();
                this.mcFrame.mouseChildren = false;
                this.mcFrame.mouseEnabled = false;
                addChild(this.mcFrame);
                this.Clicker = new xSprite();
                this.Clicker.buttonMode = true;
                addChild(this.Clicker);
                this.Clicker.graphics.beginFill(0xFF0000, 0);
                this.Clicker.graphics.drawRect(-1, -1, 22, 22);
                this.Clicker.graphics.endFill();
                _local_4 = cachedSprite.dic[this.Index];
                if (_local_4)
                {
                    _local_4.Timeout = 0;
                    if (_local_4.Pending)
                    {
                        return;
                    };
                    this.FrameStore = _local_4.bd;
                    this.bs = this.FrameStore.height;
                    this.bf = (this.FrameStore.width / this.bs);
                    if ((_local_4.Flags & cachedSprite.cs_RollOver))
                    {
                        this.Clicker.addEventListener(MouseEvent.ROLL_OVER, this.RolloverHandler, false, 0, true);
                    };
                    this.tick();
                    return;
                };
                cachedSprite.dic[this.Index] = new cachedSprite();
                this.Master = true;
            };
            if ((_arg_1.SF & f_Strip))
            {
                _local_5 = _arg_1.SA;
                _local_5 = xatlib.searchreplace("#", "%23", _local_5);
                _local_5 = xatlib.searchreplace("+", "%2B", _local_5);
                this.sm = new loadbitmap(_arg_1, xatlib.iMux(((("GetStrip5.php?c=s_" + _local_5) + "_") + _arg_3)), 0, 0, this.GotStrip);
                return;
            };
            this.sm = new swfsmiley(_arg_1, _arg_2);
            if ((_arg_1.SF & f_NoCache))
            {
                this.sm.scaleX = (this.sm.scaleY = this.sc);
                addChild(this.sm);
            };
        }

        public static function MasterTick()
        {
            var _local_1:*;
            for (_local_1 in TickDict)
            {
                _local_1.tick();
            };
        }


        function GotStrip()
        {
            var _local_1:*;
            if ((((this.sm.bitmap == 503)) || (((this.sm.bitmap) && ((this.sm.bitmap.height == 1))))))
            {
                this.StripTries++;
                if (this.StripTries < 4)
                {
                    this.Reload = (this.StripTries * 37);
                };
            } else
            {
                if (this.sm.bitmap)
                {
                    _local_1 = cachedSprite.dic[this.Index];
                    _local_1.bd = this.sm.bitmap;
                    this.sm.bitmap = null;
                    this.sm = null;
                    _local_1.Pending = false;
                    this.Master = false;
                };
            };
        }

        function cleanUp(e:*=0, RemoveClicker:Boolean=true)
        {
            try
            {
                if (this.sm)
                {
                    this.sm.cleanUp();
                    this.sm = undefined;
                };
                delete TickDict[this];
                if (RemoveClicker)
                {
                    try
                    {
                        this.Clicker.removeEventListener(MouseEvent.ROLL_OVER, this.RolloverHandler);
                    } catch(e)
                    {
                    };
                };
                if (!this.Parent)
                {
                    return;
                };
                if (((this.Frame) && (this.mcFrame)))
                {
                    this.Frame.bitmapData.dispose();
                };
                removeEventListener(Event.REMOVED_FROM_STAGE, this.cleanUp);
                this.Parent = undefined;
                if (((this.Master) && ((this.tik < this.bf))))
                {
                    delete cachedSprite.dic[this.Index];
                };
            } catch(e)
            {
            };
        }

        private function tick()
        {
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_1:* = cachedSprite.dic[this.Index];
            if ((this.Parent.SF & f_Strip))
            {
                if (this.Reload)
                {
                    this.Reload--;
                    if (this.Reload == 0)
                    {
                        this.sm = new loadbitmap(this.Parent, this.sm.Url, 0, 0, this.GotStrip);
                    };
                    return;
                };
                if (!_local_1)
                {
                    return;
                };
                if (_local_1.Pending)
                {
                    return;
                };
            };
            if (!_local_1)
            {
                cachedSprite.dic[this.Index] = new cachedSprite();
                this.Master = true;
                this.sm = new swfsmiley(this.Parent, this.mBaseSmiley);
                this.tik = 0;
                return;
            };
            var _local_2:int = ((this.bs - (20 * this.sc)) / 2);
            this.tik++;
            _local_1.Timeout = 0;
            if (!this.Master)
            {
                if (_local_1.Pending)
                {
                    return;
                };
                if (!this.FrameStore)
                {
                    this.tik = 0;
                    this.FrameStore = _local_1.bd;
                    this.bs = this.FrameStore.height;
                    this.bf = (this.FrameStore.width / this.bs);
                    _local_2 = ((this.bs - (20 * this.sc)) / 2);
                };
            } else
            {
                if (((this.sm) && (!((this.sm.tc == undefined)))))
                {
                    if (this.sm.tc <= 2)
                    {
                        this.tik = (this.sm.tc - 2);
                    };
                    if ((this.sm.Loading & 1))
                    {
                        this.tik = -1;
                    };
                };
                if (this.tik < 0)
                {
                    return;
                };
                if (this.tik == 0)
                {
                    if (todo.Macros["seffect"] === "off")
                    {
                        this.Parent.SF = (this.Parent.SF & ~(f_NoCache));
                    };
                    if ((this.Parent.SF & f_NoCache))
                    {
                        delete cachedSprite.dic[this.Index];
                        delete TickDict[this];
                        addChild(this.sm);
                        return;
                    };
                    this.bs = ((this.sm.MaxW * this.sc) & 1048574);
                    this.bf = this.sm.Frames;
                    if (todo.FV < 10)
                    {
                        if (((((this.bs * this.bf) > 2880)) && ((this.bf == 72))))
                        {
                            this.bf = 36;
                        };
                        while ((this.bs * this.bf) > 2880)
                        {
                            this.bs = (this.bs - 6);
                        };
                    };
                    _local_2 = ((this.bs - (20 * this.sc)) / 2);
                    this.FrameStore = new BitmapData((this.bs * this.bf), this.bs, true, 0xFFFFFF);
                    _local_1.bd = this.FrameStore;
                    _local_1.Pending = false;
                    if (this.sm.NeedRoll)
                    {
                        this.Clicker.addEventListener(MouseEvent.ROLL_OVER, this.RolloverHandler, false, 0, true);
                        _local_1.Flags = (_local_1.Flags | cachedSprite.cs_RollOver);
                    };
                };
                if (this.tik < this.bf)
                {
                    _local_4 = new Matrix();
                    if (((((!((this.sm.scaleX == 1))) || (!((this.sm.scaleY == 1))))) || (!((this.sc == 1)))))
                    {
                        _local_4.scale((this.sm.scaleX * this.sc), (this.sm.scaleY * this.sc));
                    };
                    if (this.sm.rotation)
                    {
                        _local_4.rotate((this.sm.rotation * (Math.PI / 180)));
                    };
                    _local_4.translate((_local_2 + this.sm.x), (_local_2 + this.sm.y));
                    _local_5 = new BitmapData(this.bs, this.bs, true, 0xFFFFFF);
                    _local_5.draw(this.sm, _local_4);
                    _local_6 = null;
                    if (this.sm.alpha != 1)
                    {
                        _local_6 = new BitmapData(this.bs, this.bs, true, (0xFFFFFF | (int((this.sm.alpha * 0xFF)) << 24)));
                    };
                    this.FrameStore.copyPixels(_local_5, new Rectangle(0, 0, this.bs, this.bs), new Point((this.tik * this.bs), 0), _local_6, new Point(0, 0), true);
                    if (_local_6)
                    {
                        _local_6.dispose;
                    };
                    _local_5.dispose();
                    if (this.tik == (this.bf - 1))
                    {
                        this.sm.cleanUp();
                        this.sm = undefined;
                        this.Master = false;
                    };
                };
            };
            if (!this.Frame)
            {
                this.Frame = new Bitmap(new BitmapData(this.bs, this.bs, true, 0xFFFFFF));
                this.mcFrame.addChild(this.Frame);
                this.mcFrame.x = (this.mcFrame.y = -(_local_2));
                this.mcFrame.mouseEnabled = false;
                this.mcFrame.mouseChildren = false;
            };
            if ((((this.Parent.SP & smiley.f_FlashRank)) && ((this.tik == 36))))
            {
                if ((todo.tick % 36) != 0)
                {
                    this.tik = 35;
                };
            };
            var _local_3:* = (this.tik % this.bf);
            this.Frame.bitmapData.fillRect(new Rectangle(0, 0, this.bs, this.bs), 0xFFFFFF);
            this.Frame.bitmapData.copyPixels(this.FrameStore, new Rectangle((_local_3 * this.bs), 0, this.bs, this.bs), new Point(0, 0), null, null, true);
            if (this.bf == 1)
            {
                delete TickDict[this];
            };
        }

        function RolloverHandler(_arg_1:MouseEvent)
        {
            if (((this.sm) && ((this.tik < this.bf))))
            {
                return;
            };
            if (this.sm)
            {
                this.sm.NeedRoll = 2;
                return;
            };
            var _local_2:* = this.Parent;
            this.cleanUp(0, false);
            _local_2.SF = (_local_2.SF | f_NoCache);
            this.sm = new swfsmiley(_local_2, this.mBaseSmiley);
            this.sm.mouseEnabled = false;
            this.sm.mouseChildren = false;
            this.sm.NeedRoll = 2;
            this.mcFrame.x = (this.mcFrame.y = 0);
            this.mcFrame.addChild(this.sm);
        }


    }
}//package 

