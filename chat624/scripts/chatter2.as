// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//chatter2

package 
{
    import flash.display.MovieClip;
    import flash.display.*;

    public dynamic class chatter2 extends MovieClip 
    {

        static const hat = 1;
        static const tmp = 2;
        static const Married = 4;
        static const BFF = 8;
        static const Married2 = 16;
        static const BFF2 = 32;
        static const Star = 64;
        static const Gag = 128;
        static const sinbin = 0x0100;
        static const Behinds = (Married | BFF);
        static const Fronts = (((((Married2 | BFF2) | Star) | Gag) | sinbin) | Single);
        static const Mob = 0x0200;
        static const MBack = 0x0400;
        static const Glow = 0x0800;
        static const Single = 0x1000;
        static const flash = 0x2000;

        var Options:int = 0;
        var flag0:int = 0;
        var flag2:int = 0;
        var Glowing:Boolean;
        var ColP1:int = 0xC000;
        var ColP2;
        var ColF:int;
        var ColB:int;
        var Size:int = 20;
        var Simple = true;
        var Pawn;
        var Effect;
        var mc;


        public function Go()
        {
            var _local_3:*;
            var _local_4:*;
            var _local_1:* = new Array();
            if ((this.Options & Mob))
            {
                _local_1.push("p1mob");
                this.Simple = false;
            } else
            {
                if (this.Pawn)
                {
                    _local_1.push(this.Pawn);
                    if ((this.Options & flash))
                    {
                        _local_1.push("w1");
                    };
                    this.Simple = false;
                } else
                {
                    _local_1.push("p1pwn");
                };
            };
            _local_1.push(this.d2h(this.ColP1));
            if (((!((this.ColP2 == undefined))) && (!((this.ColP1 == this.ColP2)))))
            {
                _local_1.push(this.d2h(this.ColP2));
                this.Simple = false;
            };
            if ((this.flag2 & 1))
            {
                _local_1.push("mirror");
                _local_1.push("shift1");
                _local_1.push("w-11");
                this.Simple = false;
            };
            if ((this.Options & Fronts))
            {
                _local_1.push("frnt1");
                _local_1.push(("w" + (this.Options & Fronts)));
                if (this.ColF)
                {
                    _local_1.push(this.d2h(this.ColF));
                };
                this.Simple = false;
            };
            if ((this.Options & Behinds))
            {
                _local_1.push("bff1");
                _local_1.push(("w" + (this.Options & Behinds)));
                this.Simple = false;
            };
            if ((((this.flag0 & 262144)) && (!((this.Pawn == "p1badge")))))
            {
                _local_1.push("badge1");
                _local_1.push(this.d2h(this.ColP1));
                this.Simple = false;
            };
            if ((((this.flag0 & 524288)) && (!((this.Pawn == "p1naughty")))))
            {
                _local_1.push("naughty1");
                if ((this.flag2 & 1))
                {
                    _local_1.push("shift1");
                };
                this.Simple = false;
            };
            if (((this.Hat) && (!((this.flag0 & 0x8000)))))
            {
                _local_1.push("hat1");
                _local_1.push(("w" + this.Hat));
                this.Simple = false;
            };
            if ((this.flag0 & 0x4000))
            {
                _local_1.push("away");
                this.Simple = false;
            };
            if ((this.flag0 & 0x8000))
            {
                _local_1.push("dunce1");
                this.Simple = false;
            };
            if ((this.flag0 & 0x100000))
            {
                _local_1.push("yellow1");
                this.Simple = false;
            };
            if ((this.flag0 & 0x200000))
            {
                _local_1.push("red1");
                this.Simple = false;
            };
            if ((this.flag0 & 65536))
            {
                _local_1.push("typing");
                this.Simple = false;
            };
            if (this.Effect)
            {
                _local_1.push(this.Effect);
                this.Simple = false;
            };
            var _local_2:* = (("(" + _local_1.join("#")) + ")");
            if (_local_2 == this.SA)
            {
                return;
            };
            this.SA = _local_2;
            if (this.mc)
            {
                removeChild(this.mc);
                this.mc.cleanUp();
                this.mc = null;
            };
            if (!todo.bThin)
            {
                if (!this.Simple)
                {
                    _local_3 = cachedSprite.dic[this.SA];
                    if (_local_3)
                    {
                        _local_3 = !(_local_3.Pending);
                    };
                };
                if (((!(_local_3)) && (!(this.Pawn))))
                {
                    _local_4 = new library("p1pwn");
                    this.addChild(_local_4);
                    if (this.ColP1)
                    {
                        xatlib.McSetRGB(_local_4.xitem.col0, this.ColP1);
                    };
                    if (this.Size != 20)
                    {
                        _local_4.scaleX = (_local_4.scaleY = (this.Size / 20));
                    };
                    if ((this.flag2 & 1))
                    {
                        _local_4.x = 10;
                    };
                };
                if (this.Simple)
                {
                    return;
                };
            };
            this.SF = 2;
            xmessage.PowSm(this, _local_1, 19, todo.ALL_POWERS);
            this.mc = new smiley(this, _local_1[0], this.Size);
        }

        private function d2h(_arg_1:int):String
        {
            var _local_2:*;
            var _local_3 = "";
            var _local_4:* = 0;
            while (_local_4 < 6)
            {
                _local_2 = (_arg_1 & 15);
                _local_2 = String.fromCharCode((((_local_2 > 9)) ? (_local_2 + 87) : (_local_2 + 48)));
                _arg_1 = (_arg_1 >> 4);
                _local_3 = (_local_2 + _local_3);
                _local_4++;
            };
            return (_local_3);
        }


    }
}//package 

