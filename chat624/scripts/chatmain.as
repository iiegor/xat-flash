// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//chatmain

package 
{
    import flash.display.MovieClip;

    public dynamic class chatmain extends MovieClip 
    {

        public var c;

        public function chatmain()
        {
            addFrameScript(0, this.frame1);
        }

        function frame1()
        {
            this.c = new chat();
            parent.addChild(this.c);
            stop();
        }


    }
}//package 

