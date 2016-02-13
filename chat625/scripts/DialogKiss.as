// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//DialogKiss

package 
{
    import flash.display.Sprite;
    import flash.display.*;

    public class DialogKiss extends Sprite 
    {

        public function DialogKiss(_arg_1:*)
        {
            if (_arg_1.Mode == null)
            {
                _arg_1.Mode = 0;
            };
            if (_arg_1.SubMode == null)
            {
                _arg_1.SubMode = 0;
            };
            if (_arg_1.Front == null)
            {
                _arg_1.Front = "";
            };
            if (_arg_1.Message == null)
            {
                _arg_1.Message = "";
            };
            xkiss.CreateBuystuff(_arg_1.Marry, _arg_1.Mode, _arg_1.SubMode, _arg_1.Front, _arg_1.Message);
        }

        function Delete()
        {
            main.closeDialog();
        }


    }
}//package 

