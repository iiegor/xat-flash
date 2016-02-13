// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//GetStuff2

package 
{
    import flash.display.MovieClip;
    import flash.events.Event;

    public dynamic class GetStuff2 extends MovieClip 
    {

        public var egg:Ball2;
        public var wait;
        public var tk;
        public var Z;
        public var X;
        public var Y;

        public function GetStuff2()
        {
            addFrameScript(0, this.frame1);
        }

        public function Tick(_arg_1:*)
        {
            this.tk++;
            if (this.tk > this.wait)
            {
                if ((this.Z & 1))
                {
                    this.egg.x = (this.X + ((((this.tk & 1) == 0)) ? -1 : 1));
                } else
                {
                    this.egg.y = (this.Y + ((((this.tk & 1) == 0)) ? -1 : 1));
                };
                if (this.tk > (this.wait + 22))
                {
                    this.tk = 0;
                    this.Z++;
                };
            } else
            {
                this.egg.x = this.X;
                this.egg.y = this.Y;
            };
        }

        function frame1()
        {
            this.wait = 90;
            this.tk = 0;
            this.Z = 0;
            this.X = this.egg.x;
            this.Y = this.egg.y;
            addEventListener(Event.ENTER_FRAME, this.Tick);
        }


    }
}//package 

