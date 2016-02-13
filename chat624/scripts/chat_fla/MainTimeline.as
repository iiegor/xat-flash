// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//chat_fla.MainTimeline

package chat_fla
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.display.StageScaleMode;
    import flash.display.StageAlign;
    import flash.display.Sprite;
    import flash.display.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.media.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class MainTimeline extends MovieClip 
    {

        public var Logo:xatsat;
        public var StageWidth;
        public var StageHeight;
        public var S1;
        public var S2;
        public var Mask;
        public var Last;
        public var Hold;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1, 2, this.frame3);
        }

        public function tick(_arg_1:*):void
        {
            var _local_2:Number = ((this.loaderInfo.bytesLoaded / this.loaderInfo.bytesTotal) * 100);
            this.Hold++;
            if (this.Hold > 12)
            {
                this.DoMask(this.Mask, _local_2);
            };
            if (this.loaderInfo.bytesLoaded == this.loaderInfo.bytesTotal)
            {
                removeChild(this.Logo);
                this.removeEventListener(Event.ENTER_FRAME, this.tick);
                this.gotoAndStop(3);
            };
        }

        public function DoMask(mc:*, pc:Number)
        {
            this.Logo.visible = true;
            var zx:* = int((200 * this.S1));
            var zy:* = (this.Logo.y + int((90 * this.S1)));
            var max:* = (zy * 2);
            var a1:* = (((2 * 3.14159) / 100) * pc);
            var _local_4 = mc;
            with (_local_4)
            {
                graphics.clear();
                graphics.lineStyle(0, 0, 0);
                graphics.beginFill(0xFFFF, 1);
                graphics.moveTo(zx, zy);
                graphics.lineTo(zx, (zy - max));
                graphics.lineTo((zx + max), (zy - max));
                if (a1 > (Math.PI / 2))
                {
                    graphics.lineTo((zx + max), (zy + max));
                };
                if (a1 > Math.PI)
                {
                    graphics.lineTo((zx - max), (zy + max));
                };
                if (a1 > ((Math.PI * 3) / 2))
                {
                    graphics.lineTo((zx - max), (zy - max));
                };
                graphics.lineTo((zx + (max * Math.sin(a1))), (zy - (max * Math.cos(a1))));
                graphics.moveTo(zx, zy);
                graphics.endFill();
            };
        }

        function frame1()
        {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            stage.showDefaultContextMenu = false;
            this.StageWidth = stage.stageWidth;
            this.StageHeight = stage.stageHeight;
            this.S1 = (this.StageWidth / 640);
            this.S2 = (this.StageHeight / 480);
            if (this.S2 < this.S1)
            {
                this.S1 = this.S2;
            };
            this.Logo.scaleX = (this.Logo.scaleY = (this.S1 * 8));
            this.Logo.y = ((this.StageHeight - this.Logo.height) / 2);
            this.Logo.visible = false;
            this.Mask = new Sprite();
            this.Last = 0;
            this.Hold = 0;
            addChild(this.Mask);
            this.Logo.mask = this.Mask;
            this.addEventListener(Event.ENTER_FRAME, this.tick);
            stop();
        }

        function frame3()
        {
            stop();
        }


    }
}//package chat_fla

