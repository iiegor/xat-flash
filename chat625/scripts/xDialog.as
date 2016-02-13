// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//xDialog

package 
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import flash.ui.*;

    public dynamic class xDialog extends MovieClip 
    {

        var Dia;
        public var sParent;
        var Background;
        var DiaBack;
        var DiaBar;

        public function xDialog(_arg_1:*, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:String, _arg_7:String, _arg_8:Number=0, _arg_9:*=undefined)
        {
            var _local_11:*;
            var _local_12:*;
            this.Dia = this;
            super();
            if (chat.mainDlg)
            {
                main.hint.HintOff();
            };
            this.sParent = _arg_1;
            var _local_10:Number = 0;
            this.Background = xatlib.ButtonCurve2(0, todo.StageWidth, todo.StageHeight, 0, 0, 0, 0, 0);
            this.Background.alpha = 0.3;
            this.Background.addEventListener(MouseEvent.MOUSE_DOWN, this.DoDelete);
            this.Background.buttonMode = true;
            _arg_1.addChild(this.Background);
            _arg_1.addChild(this);
            if (isNaN(_arg_2))
            {
                _arg_4 = 300;
                if (_arg_4 > (todo.StageWidth - 10))
                {
                    _arg_4 = (todo.StageWidth - 10);
                };
                _arg_5 = 170;
                if (_arg_5 > (todo.StageHeight - 10))
                {
                    _arg_5 = (todo.StageHeight - 10);
                };
                _arg_2 = ((todo.StageWidth / 2) - (_arg_4 / 2));
                _arg_3 = ((todo.StageHeight / 2) - (_arg_5 / 2));
            };
            this.DiaBack = new xBut(this, _arg_2, _arg_3, _arg_4, _arg_5, "", undefined, ((xBut.b_Panel | xBut.b_Border) | xBut.b_NoPress));
            if (((_arg_6) && ((_arg_6.length > 0))))
            {
                _local_10 = xatlib.NY(30);
                if (_local_10 < 23)
                {
                    _local_10 = 23;
                };
                if (_local_10 > 30)
                {
                    _local_10 = 30;
                };
                this.DiaBar = new xBut(this, _arg_2, _arg_3, _arg_4, _local_10, (" " + _arg_6), undefined, (((((xatlib.c_bl | xatlib.c_br) | xBut.b_LeftText) | xBut.b_Border) | xBut.b_NoPress) | xatlib.b_mouseChild));
                _local_11 = new library("close");
                addChild(_local_11);
                _local_12 = int(((_local_10 - _local_11.height) / 2));
                _local_11.y = (_arg_3 + _local_12);
                _local_11.x = (((_arg_2 + _arg_4) - _local_11.width) - _local_12);
                _local_11.buttonMode = true;
                _local_11.addEventListener(MouseEvent.MOUSE_DOWN, this.DoDelete);
            };
            if (((_arg_7) && ((_arg_7.length > 0))))
            {
                xatlib.createTextNoWrap(this.DiaBack.But, 5, _local_10, (_arg_4 - 10), ((_arg_5 - _local_10) - 30), _arg_7, 0, 16777185, 100, 0, 18, "left", 2);
            };
            if ((_arg_8 & 1))
            {
                this.Dia.Ok = new xBut(this, (_arg_2 + int(((_arg_4 - 100) / 2))), ((_arg_3 + _arg_5) - 30), 100, 25, xconst.ST(45), this.Delete);
            };
        }

        public function DoDelete(_arg_1:MouseEvent=undefined)
        {
            if (((this.sParent) && (!((this.sParent.Delete == null)))))
            {
                this.sParent.Delete();
            } else
            {
                this.Delete();
            };
        }

        public function Delete(_arg_1:MouseEvent=undefined)
        {
            if (!this.sParent)
            {
                return;
            };
            this.sParent.removeChild(this.Background);
            this.sParent.removeChild(this);
            this.sParent = null;
        }


    }
}//package 

