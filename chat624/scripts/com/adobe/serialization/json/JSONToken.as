// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.adobe.serialization.json.JSONToken

package com.adobe.serialization.json
{
    public class JSONToken 
    {

        private var _type:int;
        private var _value:Object;

        public function JSONToken(_arg_1:int=-1, _arg_2:Object=null)
        {
            this._type = _arg_1;
            this._value = _arg_2;
        }

        public function get type():int
        {
            return (this._type);
        }

        public function set type(_arg_1:int):void
        {
            this._type = _arg_1;
        }

        public function get value():Object
        {
            return (this._value);
        }

        public function set value(_arg_1:Object):void
        {
            this._value = _arg_1;
        }


    }
}//package com.adobe.serialization.json

