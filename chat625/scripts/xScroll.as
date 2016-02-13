// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//xScroll

package 
{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    import flash.events.Event;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;

    class xScroll extends Sprite 
    {

        var Scr_x:Number;
        var Scr_y:Number;
        var Scr_width:Number;
        var Scr_height:Number;
        var Scr_buttonheight:Number;
        var Scr_thumbheight:Number;
        var Scr_step:Number;
        public var Scr_size;
        var Scr_position;
        var scrollbackground:MovieClip;
        var mcScrollUp:xBut;
        var mcScrollDown:xBut;
        var mcThumb:xBut;
        var ChangeFunc;
        var Scrolling;
        var ScrollPressed;

        public function xScroll(_arg_1:*, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:Number, _arg_9:Number, _arg_10:Number, _arg_11:*)
        {
            if (_arg_1 != undefined)
            {
                _arg_1.addChild(this);
            };
            this.Scr_x = _arg_2;
            this.Scr_y = _arg_3;
            this.Scr_width = _arg_4;
            this.Scr_height = _arg_5;
            this.Scr_buttonheight = _arg_6;
            this.Scr_thumbheight = _arg_7;
            this.Scr_step = _arg_8;
            this.Scr_size = _arg_9;
            this.Scr_position = _arg_10;
            this.ChangeFunc = _arg_11;
            this.Scrolling = false;
            this.ScrollPressed = false;
            var _local_12:* = xatlib.AddBackground(this, (this.Scr_x - 1), this.Scr_y, (this.Scr_width + 1), this.Scr_height, true);
            _local_12.alpha = 0.4;
            this.mcScrollUp = new xBut(this, this.Scr_x, this.Scr_y, this.Scr_width, this.Scr_buttonheight, "", this.onScrollUp, 0, 6);
            this.mcScrollUp.gfx = new library("sc_up");
            this.mcScrollUp.gfx.x = int(((this.Scr_width - 6) / 2));
            this.mcScrollUp.gfx.y = int(((this.Scr_buttonheight - 3) / 2));
            this.mcScrollUp.addChild(this.mcScrollUp.gfx);
            this.mcScrollDown = new xBut(this, this.Scr_x, ((this.Scr_y + this.Scr_height) - this.Scr_buttonheight), this.Scr_width, this.Scr_buttonheight, "", this.onScrollDown, 0, 6);
            this.mcScrollDown.gfx = new library("sc_dn");
            this.mcScrollDown.gfx.x = int(((this.Scr_width - 6) / 2));
            this.mcScrollDown.gfx.y = int(((this.Scr_buttonheight - 3) / 2));
            this.mcScrollDown.addChild(this.mcScrollDown.gfx);
            this.mcThumb = new xBut(this, this.Scr_x, (((this.Scr_y + this.Scr_height) - this.Scr_buttonheight) - this.Scr_thumbheight), this.Scr_width, this.Scr_thumbheight, "", null, xBut.b_NoPress, 6);
            this.mcThumb.gfx = new library("sc_dr");
            this.mcThumb.buttonMode = true;
            this.mcThumb.gfx.x = int(((this.Scr_width - 6) / 2));
            this.mcThumb.gfx.y = int(((this.Scr_thumbheight - 7) / 2));
            this.mcThumb.addChild(this.mcThumb.gfx);
            this.mcThumb.addEventListener(MouseEvent.MOUSE_DOWN, this.onThumb);
            this.mcThumb.addEventListener(MouseEvent.MOUSE_UP, this.onThumbRelease);
            this.Update();
            this.RefreshColor();
        }

        function onScrollUp(_arg_1:*)
        {
            this.ScrollPressed = true;
            this.Scr_position = (this.Scr_position - this.Scr_step);
            if (this.Scr_position < 0)
            {
                this.Scr_position = 0;
            };
            this.ChangeFunc();
            this.Update();
        }

        function onScrollDown(_arg_1:*)
        {
            this.ScrollPressed = true;
            this.Scr_position = (this.Scr_position + this.Scr_step);
            if (this.Scr_position > this.Scr_size)
            {
                this.Scr_position = this.Scr_size;
            };
            this.ChangeFunc();
            this.Update();
        }

        public function RefreshColor()
        {
            this.mcScrollUp.RefreshColor();
            this.mcScrollDown.RefreshColor();
            this.mcThumb.RefreshColor();
            xatlib.McSetRGB(this.mcScrollUp.gfx.xitem.back, todo.ButColW);
            xatlib.McSetRGB(this.mcScrollDown.gfx.xitem.back, todo.ButColW);
        }

        function onThumb(_arg_1:Event)
        {
            this.Scrolling = true;
            this.mcThumb.startDrag(false, new Rectangle(this.Scr_x, (this.Scr_y + this.Scr_buttonheight), 0, ((this.Scr_height - this.Scr_thumbheight) - (this.Scr_buttonheight * 2))));
            stage.addEventListener(MouseEvent.MOUSE_UP, this.onThumbRelease);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this.onThumbMouseMove);
        }

        function onThumbRelease(_arg_1:Event)
        {
            this.Scrolling = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.onThumbRelease);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.onThumbMouseMove);
            this.mcThumb.stopDrag();
        }

        function onThumbMouseMove(_arg_1:Event)
        {
            var _local_2:* = ((this.mcThumb.y - this.Scr_y) - this.Scr_buttonheight);
            var _local_3:* = (((this.Scr_height - this.Scr_buttonheight) - this.Scr_buttonheight) - this.Scr_thumbheight);
            this.Scr_position = ((this.Scr_size * _local_2) / _local_3);
            this.ChangeFunc();
        }

        function set position(_arg_1:Number)
        {
            this.Scr_position = _arg_1;
            this.Update();
        }

        function set ssize(_arg_1:Number)
        {
            this.Scr_size = _arg_1;
            this.Update();
        }

        function Update()
        {
            if (this.Scr_position < 0)
            {
                this.Scr_position = 0;
            };
            this.mcThumb.y = ((this.Scr_y + this.Scr_buttonheight) + (((((this.Scr_height - this.Scr_buttonheight) - this.Scr_buttonheight) - this.Scr_thumbheight) * this.Scr_position) / this.Scr_size));
        }

        function Delete()
        {
        }


    }
}//package 

