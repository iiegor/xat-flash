// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//loadbitmap

package 
{
    import flash.display.MovieClip;
    import flash.utils.Dictionary;
    import flash.utils.ByteArray;
    import flash.display.Bitmap;
    import flash.net.URLRequest;
    import flash.net.URLStream;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.HTTPStatusEvent;
    import flash.display.Loader;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.display.DisplayObject;
    import flash.geom.Matrix;
    import flash.events.*;
    import flash.display.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.geom.*;

    public class loadbitmap extends MovieClip 
    {

        private static var ccnt = 0;
        private static var cdic = new Dictionary();
        private static const doms = {
            "imgur":"com",
            "imageshack":"us",
            "tinypic":"com"
        };
        private static const doms_cd = {
			"xat":"dev",
            "xat":"com",
            "xatech":"com",
            "photobucket":"com"
        };
        public static var TickDict = new Dictionary(true);

        private var m_urlStream;
        private var m_Loader;
        private var m_data:ByteArray;
        private var m_read;
        private var m_width;
        private var m_height;
        public var Url;
        private var pass = 0;
        private var m_Handler;
        private var dom1:String;
        private var dom2:String;
        public var bitmap;
        private var Retry:int = 0;
        private var RetryCnt:int = 0;

        public function loadbitmap(_arg_1:*, _arg_2:*, _arg_3:*=80, _arg_4:*=80, _arg_5:*=null)
        {
            var _local_6:Bitmap;
            super();
            if (_arg_1)
            {
                _arg_1.addChild(this);
            };
            this.Url = _arg_2.split("#");
            this.Url = this.Url[0];
            if (this.Url)
            {
                this.Url = xatlib.UrlAv(this.Url);
            };
            this.SetDom();
            if (((!(this.dom1)) || ((this.Url.toLowerCase().indexOf(".swf") >= 0))))
            {
                this.DoHandler();
                return;
            };
            this.m_width = _arg_3;
            this.m_height = _arg_4;
            ccnt++;
            this.m_Handler = _arg_5;
            if (cdic[this.Url])
            {
                _local_6 = new Bitmap(cdic[this.Url].bmp.bitmapData.clone());
                cdic[this.Url].cnt = ccnt;
                cdic[this.Url].bmp = _local_6;
                addChild(_local_6);
                this.DoHandler();
                return;
            };
            this.LoadIt();
        }

        public static function MasterTick()
        {
            var _local_1:*;
            for (_local_1 in TickDict)
            {
                _local_1.tick();
            };
        }


        private function LoadIt()
        {
            var _local_1:URLRequest;
            if (((todo.bMobile) || ((doms_cd[this.dom1] === this.dom2))))
            {
                this.m_data = new ByteArray();
                this.m_read = 0;
                _local_1 = new URLRequest(this.Url);
                this.m_urlStream = new URLStream();
                this.m_urlStream.addEventListener(Event.COMPLETE, this.streamComplete, false, 0, true);
                this.m_urlStream.addEventListener(ProgressEvent.PROGRESS, this.streamProgress, false, 0, true);
                this.m_urlStream.addEventListener(IOErrorEvent.IO_ERROR, this.binevent, false, 0, true);
                this.m_urlStream.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.secErr, false, 0, true);
                this.m_urlStream.addEventListener(HTTPStatusEvent.HTTP_STATUS, this.httpStatusHandler, false, 0, true);
                this.m_urlStream.load(_local_1);
            } else
            {
                this.secErr();
            };
        }

        private function DoHandler(_arg_1:*=null)
        {
            if (TickDict[this])
            {
                delete TickDict[this];
            };
            if (this.m_Handler)
            {
                this.m_Handler();
            };
            this.m_Handler = null;
        }

        private function streamProgress(_arg_1:ProgressEvent):void
        {
            var _local_2:*;
            this.pass++;
            if (this.m_urlStream.bytesAvailable >= 2)
            {
                _local_2 = this.m_urlStream.bytesAvailable;
                this.m_urlStream.readBytes(this.m_data, this.m_read, _local_2);
                this.m_read = (this.m_read + _local_2);
                if (!((((((!((this.pass == 1))) || ((((this.m_data[0] == 0xFF)) && ((this.m_data[1] == 216)))))) || ((((this.m_data[0] == 71)) && ((this.m_data[1] == 73)))))) || ((((this.m_data[0] == 137)) && ((this.m_data[1] == 80))))))
                {
                    this.m_urlStream.close();
                    this.m_urlStream = null;
                    this.DoHandler();
                };
            };
        }

        private function streamComplete(_arg_1:Event):void
        {
            this.m_urlStream.readBytes(this.m_data, this.m_read, this.m_urlStream.bytesAvailable);
            this.m_urlStream.close();
            this.m_urlStream = null;
            this.m_Loader = new Loader();
            this.m_Loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.loaderComplete, false, 0, true);
            this.m_Loader.addEventListener(IOErrorEvent.IO_ERROR, this.passevent, false, 0, true);
            this.m_Loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.passevent, false, 0, true);
            this.m_Loader.loadBytes(this.m_data);
        }

        private function loaderComplete(e:Event):void
        {
            var outputBitmapData:BitmapData;
            var old:* = undefined;
            var key:* = undefined;
            var tt:* = this;
            var src:* = this.m_Loader.contentLoaderInfo.content;
            var srcRect:Rectangle = DisplayObject(src).getBounds(DisplayObject(src));
            if ((((srcRect.width == 1)) && ((srcRect.height == 1))))
            {
                this.httpStatusHandler({"status":503});
                return;
            };
            var srcBitmapData:BitmapData = new BitmapData(srcRect.width, srcRect.height, true, 0);
            srcBitmapData.draw(src);
            this.m_Loader.unloadAndStop(true);
            this.m_Loader = null;
            if (this.m_height == 0)
            {
                this.bitmap = srcBitmapData;
                this.DoHandler();
                return;
            };
            var zwidth:* = srcRect.width;
            var zheight:* = srcRect.height;
            if ((((this.m_height == 80)) && (((srcBitmapData.width / srcBitmapData.height) >= 2))))
            {
                if (zheight > 80)
                {
                    zheight = 80;
                };
                zwidth = int(((zheight * srcBitmapData.width) / srcBitmapData.height));
            } else
            {
                if (zheight > this.m_height)
                {
                    zheight = this.m_height;
                };
                if (zwidth > this.m_width)
                {
                    zwidth = this.m_width;
                };
            };
            var matrix:* = new Matrix();
            matrix.scale((zwidth / srcBitmapData.width), (zheight / srcBitmapData.height));
            try
            {
                outputBitmapData = new BitmapData(zwidth, zheight, true, 0);
            } catch(e:Error)
            {
                DoHandler();
                return;
            };
            var smoothing:* = true;
            if ((((zheight == srcRect.width)) && ((zwidth == srcRect.height))))
            {
                matrix = null;
                smoothing = false;
            };
            outputBitmapData.draw(srcBitmapData, matrix, null, null, null, smoothing);
            if ((src is DisplayObject))
            {
                srcBitmapData.dispose();
            };
            var bmp:Bitmap = new Bitmap(outputBitmapData);
            bmp.smoothing = true;
            addChild(bmp);
            if ((((((this.m_height == 80)) || ((this.m_height == 30)))) || ((this.m_height == 0))))
            {
                cdic[this.Url] = new Object();
                cdic[this.Url].cnt = ccnt;
                cdic[this.Url].bmp = bmp;
                old = (ccnt - 50);
                for (key in cdic)
                {
                    if (cdic[key].cnt < old)
                    {
                        delete cdic[key];
                    };
                };
            };
            this.DoHandler();
        }

        private function httpStatusHandler(_arg_1:*):void
        {
            if ((((_arg_1.status == 503)) || ((_arg_1.status == 599))))
            {
                TickDict[this] = 1;
                if (this.Retry < 4)
                {
                    this.Retry++;
                    this.RetryCnt = (this.Retry * 12);
                    return;
                };
                this.DoHandler();
            };
        }

        private function tick()
        {
            this.RetryCnt--;
            if (this.RetryCnt == 0)
            {
                this.LoadIt();
                return;
            };
        }

        private function passevent(_arg_1:Event):void
        {
            dispatchEvent(_arg_1);
        }

        private function binevent(_arg_1:Event):void
        {
        }

        private function SetDom():void
        {
            var _local_1:* = this.Url.split("//");
            _local_1[0] = _local_1[0].toLowerCase();
            if (((!((_local_1[0] === "http:"))) && (!((_local_1[0] === "https:")))))
            {
                return;
            };
            if (!_local_1[1])
            {
                return;
            };
            _local_1 = _local_1[1].split("/");
            _local_1 = _local_1[0].toLowerCase();
            _local_1 = _local_1.split(".");
            var _local_2:* = _local_1.length;
            this.dom1 = _local_1[(_local_2 - 2)];
            this.dom2 = _local_1[(_local_2 - 1)];
        }

        private function secErr(_arg_1:*=0):void
        {
            var _local_2:*;
            if (this.m_urlStream)
            {
                this.m_urlStream.close();
                this.m_urlStream = null;
            };
            this.m_Loader = new Loader();
            this.Url = this.Url.replace(/;'"`#&\./g, "");
            if (doms[this.dom1] === this.dom2)
            {
                _local_2 = this.Url;
            } else
            {
                _local_2 = xatlib.iMux(((((("GetImage5.php?W=" + this.m_width) + "&H=") + this.m_height) + "&U=") + xatlib.urlencode(this.Url)));
            };
            var _local_3:URLRequest = new URLRequest(_local_2);
            this.m_Loader.load(_local_3);
            addChild(this.m_Loader);
            this.m_Loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.DoHandler);
            this.m_Loader.addEventListener(IOErrorEvent.IO_ERROR, this.passevent);
        }


    }
}//package 

