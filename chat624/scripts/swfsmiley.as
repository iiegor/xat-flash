// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//swfsmiley

package 
{
    import flash.display.Sprite;
    import flash.utils.Dictionary;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.display.MovieClip;
    import flash.geom.Matrix;
    import flash.display.DisplayObjectContainer;
    import flash.display.DisplayObject;
    import flash.geom.ColorTransform;
    import flash.events.*;
    import flash.display.*;
    import flash.utils.*;
    import flash.filters.*;
    import flash.geom.*;

    public class swfsmiley extends Sprite 
    {

        static const LayerNames = new Array("Base", "Behind", "Bkg", "Face", "Hair", "Hands");
        static const LayerTypes = new Array(0, 1, 0, 0, 1, 1);
        static const NumLayers = LayerNames.length;
        static const a = new Array(1, 1, 1, 1, 1, 1, 1, 0.878611111111111, 0.734444444444444, 0.605, 0.490555555555556, 0.353611111111111, 0.223333333333333, 0.1275, 0.0577777777777777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0611111111111113, 0.189444444444444, 0.356666666666667, 0.485555555555555, 0.645555555555556, 0.7775, 0.902222222222222, 1);
        static const al = a.length;
        static const hcolor = {
            "col0":0,
            "col1":1,
            "col2":2,
            "col3":3,
            "Back":0,
            "Col":0
        };
        static const yt = 36;
        static const lut36 = new Array(128, 150, 171, 192, 210, 225, 238, 247, 253, 0xFF, 253, 247, 238, 225, 210, 192, 171, 150, 128, 106, 85, 64, 46, 31, 18, 9, 3, 1, 3, 9, 18, 31, 46, 65, 85, 106);
        static var SmileyGlow = xatlib.MakeGlow(0xFF, 1, 3);
        private static var TickDict = new Dictionary(true);
        private static const AFrames = {
            "forehead":36,
            "twist":18,
            "updown":18,
            "inout":18
        };
        private static const sInfo = "tomb,0,40,balloon,40,24,egg,0,28,magic8ball,0,22,paint,0,50,fireworks,16,42,bomb,16,40,shark,0,46,bugs,0,44,globe,0,22,dood,0,50,lb,0,24,shiver,0,24,pie,0,24,ttth,0,22,bye,36,36,sball,140,28,grin,0,22,anime,0,32,purple,0,38,costumes,0,46,pty,0,50,party,0,50,blood,0,20,confetti,0,42,hearts,57,50,champagne,40,50,snows,0,26,stickman2,37,50,stickman3,82,50,stickymca,66,50,stickairguitar,82,50,stickangry,42,50,stickkungfu,31,50,hush,0,24,count,1,22,stick,12,50,sman,1,20,eatleg,36,38,crazy,24,32,pole,72,48,lhand,72,44,mangekyou,72,20,sleep,36,36,pilgrimm,36,42,awe,72,20,toast,72,50,bio,18,24,confused,72,20,redface,72,20,smile,72,20,biggrin,72,20,cool,36,22,eek,72,20,frown,72,20,wink,72,20,tongue,72,20,mad,72,20,crying,6,22,rolleyes,72,20,star,1,20,kiss,36,20,a,1,30,vampire,72,20,sry,1,20,crs,1,20,sleepy,36,20,pirate2,1,20,d,36,20,un,1,20,nod,24,20,scn,1,20,love,72,20,gagged,8,20,nme,24,20,roll,24,20,chkl,24,20,swt,18,20,blk,72,20,eyes,1,20,ill,1,20,smirk,36,20,dead,12,20,xp,1,20,hello,12,20,think,24,20,mischief,1,20,yum,24,20,goo,72,20,zip,1,22,yawn,36,20,smirk2,72,20,swear,1,20,cry2,72,22,omg,36,20,puke,24,20,what,72,28,o_o,12,20,shock,36,20,beye,1,20,cyc,6,20,wary,72,20,wt,36,20,xd,1,20,contempt,72,20,fedup,72,20,chew,12,20,horror,72,20,ashamed,72,20,tipsy,36,20,look,72,20,shifty,24,20,twitch,36,20,spin,12,20,frk,1,20,wh,1,22,mmy,36,38,hypno,36,42,grim,72,44,6,1,22,dizzy,18,20,cdn,18,28,fs,72,28,bat,72,50,rage,4,20,ghost,72,26,headband,2,40,fan,9,28,tear,36,26,comeon,9,28,apple,1,28,lemon,1,22,grump,72,20,doh,72,20,pouty,72,20,pear,1,30,maniac,3,20,3d,72,24,plum,1,28,ahhh,72,20,haira1,72,26,orange,1,20,squint,72,20,shirt,1,26,quiver,36,20,banana,8,38,haira2,72,32,soccer,1,20,haira5,72,34,haira3,72,34,haira4,72,38,pkn,1,24,astro,1,24,football,1,26,pilgrimf,36,36,stock,36,32,indian2,36,40,indian,36,46,bulb,1,42,tree,6,42,chef,36,32,dining,8,30,indian3,36,44,feast,1,26,bell,72,42,beard,36,30,ches,18,50,noface,1,20,cane,9,34,elf,36,36,loser,36,40,give,72,40,rockon,18,38,sack,1,40,thumbsup,18,32,palms,18,32,scarf,72,32,sdeer,1,28,clap,8,22,shh,36,30,thumbsdown,18,32,sfeet,36,28,flip,18,32,hug,72,44,sledge,12,30,slist,12,34,hmm,24,22,smound,36,34,backoff,72,24,hairm2,72,24,hehe,4,24,spull,9,32,wreath,1,34,ono,1,20,xb4,1,32,xb1,1,50,sgift,72,50,skiss,24,28,beat,4,18,hairm3,72,22,bheart,72,34,nrd,1,22,punk,1,20,emo,1,20,cupid,1,44,card,72,50,hairf2,72,26,hug2,36,26,hairf3,72,26,ilu,36,36,hug3,18,28,hairf4,72,26,ring,36,36,rose,1,16,goth,36,30,rose2,24,30,g1,1,20,ninja,1,20,cd,3,28,cb,1,26,police,72,24,pce,36,38,clink,18,32,bride,1,30,jester,72,30,phat,1,38,nurse,72,22,cake,72,44,dhat,36,28,sphinx,72,28,dance2,18,30,dance,18,36,dance3,18,38,groom,1,26,crown,72,28,facemask,72,20,partyhat,72,26,photo,72,30,sherlock,18,36,popper,72,48,straw,36,22,clover2,36,40,prop,4,30,halo,72,32,grad,36,30,dunce,9,38,drink,6,34,pot,72,42,ribbon,1,24,igirl,36,36,iman,1,20,pray,72,24,rainbow,36,38,cloud,72,28,shirts,1,26,trophy,72,40,tap,72,34,shi,36,40,bb,72,30,ball,1,20,helmet,1,20,x,1,38,chest,72,20,foam,18,40,weight,72,36,gst,1,20,eye,1,22,8ball,36,16,pm,1,24,kirb,24,24,tox,1,20,alien,1,20,bby,36,26,bot,4,22,pmg,1,20,inv,18,20,inv3,18,18,sonic,36,22,shadow,36,22,luigi,36,22,mario,36,22,inv2,18,20,mushroom,36,24,yoshi,1,24,countb,1,34,smashball,1,24,ness,36,28,tri,1,30,mephiles,36,30,lucario,36,30,xj9,72,28,mewtwo,36,28,link,36,26,arbiter,1,22,nights,36,26,kermit,1,20,lolwut,1,24,hk,36,20,beaker,1,28,dv,1,22,beast,1,22,homer,1,28,3tomoe,72,20,pikachu,36,30,sm,1,24,pball,1,20,wwe,1,26,a1,1,20,x3,1,24,dog,1,20,pig,1,20,nko,1,28,mk,1,24,cat,1,18,panda,1,20,penguin,1,20,cc,1,22,b,1,20,ccc,1,20,cotton,1,24,bear,36,22,c,1,20,o,1,20,t,1,18,i,36,20,mo,1,26,so,1,22,oo,1,20,sb,1,20,ph,1,22,yt,1,18,dmd,72,22,p,1,22,ush,1,20,ipod,1,18,ip,1,20,bin,36,30,sun,36,20,r,1,20,li,1,20,rain,6,22,l,1,22,f,36,22,n,24,24,pgm,1,50,rad,1,20,u,1,20,mgp,1,50,y,1,18,boy,1,22,grl,1,22,scb,1,20,star,1,20,yy,36,22,moon,1,26,note,1,20,ao,1,16,hex,1,22,rubik,1,22,cir,18,26,cdy,1,22,deer,6,28,snta,1,24,xday,18,30,xtre,6,34,g,1,22,xstk,1,22,mtoe,1,24,hly,1,26,ghat,1,24,stickman,18,50,turkey,1,18,clover,1,24,danny,72,30,qbone,36,24,ss,2,36,mc,1,24,mario8,4,20,sad,36,20,no,72,20,okp,1,24,nop,1,20,rolling,12,20,mate,1,32,jolly,8,20,amy,1,32,argue,6,20,cry,3,22,hippo,1,30,lips,1,24,airplane,4,22,dynamite,18,20,surprise,1,24,parachute,1,26,pull,1,20,grumpy,1,24,allpowers,24,40,topman,18,22,powers,18,22,snow,1,24,subhide,18,24,mirror,18,22,mod8,18,22,nofollow,18,22,invert,18,22,reghide,18,28,zoom,18,22,nopc,18,22,tempmod,18,22,noaudies,18,24,hat,18,32,red,72,22,green,72,22,light,72,22,heart,18,28,blue,72,22,shuffle,18,28,square,18,22,animate,18,26,cycle,72,22,nameglow,18,22,show,18,26,clear,18,16,pink,18,22,boot,18,24,superkick,36,42,hexagon,18,26,invisible,36,22,octogram,18,28,guestself,72,40,diamond,18,28,sinbin,72,40,hands,18,34,fade,72,22,gag,18,22,hairm,72,32,hairf,72,30,six,72,50,angel,72,48,mute,18,24,radio,36,42,fruit,18,36,sport,18,24,num,18,22,halloween,72,48,status,18,24,snowy,18,26,christmas,18,32,thanksgiving,9,34,dx,72,50,tempmem,18,22,valentine,18,34,flashrank,36,22,blueman,18,22,irish,72,34,";
        private static var fInfo;
        private static var wInfo;
        private static const NiceFrames = new Array(1, 2, 3, 4, 6, 8, 9, 12, 18, 24, 36, 72);
        private static const NiceFramesL = NiceFrames.length;

        var Data;
        var OurMc;
        var Base;
        var NoOfSmilies;
        public var NumToLoad;
        public var Parent;
        var cc = 0;
        public var tc = 0;
        var NeedRoll = 0;
        var Frames = 1;
        var MaxW = 0;
        private var DidColor:Boolean;
        var ar;
        var rs;
        private var GlowCol;
        public var Loading = 0;
        private var g130;
        private var Flags:int = 0;
        private var mDelAll:Boolean = true;
        public var xd;
        var ani_Frames = 72;
        var ani_col;
        var ani_colt;
        var ani_ha;
        var ani_sa;
        var ani_va;
        var cola;

        public function swfsmiley(_arg_1:*, _arg_2:String)
        {
            var _local_3:*;
            var _local_4:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            this.ar = int((Math.random() * al));
            this.rs = int((Math.random() * yt));
            this.ani_col = {
                "0":174546,
                "35":16369969,
                "71":174546
            };
            this.ani_colt = {"0":this.easeInOutQuad};
            this.ani_ha = {};
            this.ani_sa = {};
            this.ani_va = {};
            this.cola = [];
            super();
            var _local_5:* = ((_arg_1.SF & 2) == 0);
            if (!fInfo)
            {
                _local_7 = sInfo.split(",");
                _local_8 = _local_7.length;
                fInfo = new Object();
                wInfo = new Object();
                _local_4 = 0;
                while (_local_4 < _local_8)
                {
                    fInfo[_local_7[_local_4]] = int(_local_7[(_local_4 + 1)]);
                    wInfo[_local_7[_local_4]] = int(_local_7[(_local_4 + 2)]);
                    _local_4 = (_local_4 + 3);
                };
            };
            this.Parent = _arg_1;
            if (_arg_1.SCC)
            {
                this.Frames = 72;
            };
            if (_arg_1.SC)
            {
                _arg_1.SC = String(_arg_1.SC);
            };
            var _local_6:* = "";
            if (_arg_1.SE)
            {
                _local_6 = _arg_1.SE.split(",");
            };
            if (_arg_2 == "fade")
            {
                _arg_1.SP = (_arg_1.SP | smiley.b_fade);
            };
            if (_arg_1.SA.indexOf("#") < 0)
            {
                if ((this.g130 = todo.gconfig["g130"]))
                {
                    _arg_1.ST = this.g130;
                } else
                {
                    _arg_1.SF = (_arg_1.SF | smiley.f_Simple);
                };
            };
            if (((!(xconst.pssh[_arg_2])) || (!((_arg_1.SF & smiley.f_Simple)))))
            {
                _arg_1.SP = (_arg_1.SP & ~(smiley.b_glow));
            };
            this.OurMc = new Array();
            this.OurMc.push({
                "Name":_arg_2,
                "Type":0,
                "SC":_arg_1.SC,
                "SP":_arg_1.SP
            });
            if (_arg_1.ST)
            {
                this.OurMc.push({
                    "Name":_arg_1.ST,
                    "Type":1,
                    "SC":_arg_1.SC,
                    "SP":_arg_1.SP
                });
            };
            if (_local_6.length > 0)
            {
                _local_5 = false;
                _local_3 = 0;
                while (_local_3 < _local_6.length)
                {
                    this.OurMc.push({
                        "Name":_local_6[_local_3],
                        "Type":2,
                        "SC":_local_6[(_local_3 + 1)],
                        "SP":_local_6[(_local_3 + 2)]
                    });
                    _local_3 = (_local_3 + 3);
                };
            };
            if ((((_arg_2.charAt(0) == "p")) && ((_arg_2.charAt(1) == "1"))))
            {
                if (_arg_2 == "p1pwn")
                {
                    this.OurMc[0].SP = (this.OurMc[0].SP | smiley.b_internal);
                };
                if (this.OurMc[(this.OurMc.length - 1)].Name == "glow1")
                {
                    _local_7 = this.OurMc.pop();
                    this.OurMc[0].SP = (this.OurMc[0].SP | smiley.b_glow);
                    _arg_1.SP = (_arg_1.SP | smiley.b_glow);
                    this.GlowCol = 0xFF00;
                } else
                {
                    _local_7 = _arg_1.SC.indexOf("#");
                    if ((((_local_7 > 0)) && ((_local_7 < (_arg_1.SC.length - 2)))))
                    {
                        _arg_1.SP = (_arg_1.SP | smiley.f_FlashRank);
                        this.Frames = 36;
                    };
                };
            };
            if (!(_arg_1.SF & smiley.f_Simple))
            {
                _local_7 = this.Parent.SA.substr(1, (this.Parent.SA.length - 2)).toLowerCase().split("#");
                _local_9 = _local_7.length;
                _local_10 = 0;
                while (_local_10 < _local_9)
                {
                    if (AFrames[_local_7[_local_10]])
                    {
                        this.Frames = this.framesrequired(new Array(this.Frames, AFrames[_local_7[_local_10]]));
                    };
                    _local_10++;
                };
            };
            this.NoOfSmilies = this.OurMc.length;
            this.NumToLoad = 0;
            _local_4 = 0;
            while (_local_4 < this.NoOfSmilies)
            {
                if (this.OurMc[_local_4].Name === "topspin")
                {
                    this.mDelAll = false;
                };
                if ((this.OurMc[_local_4].SP & smiley.b_internal))
                {
                    this.OurMc[_local_4].mc = xatlib.AttachMovie(null, this.OurMc[_local_4].Name);
                } else
                {
                    _local_11 = "sm2";
                    if (_arg_1.xd)
                    {
                        _local_11 = "xa";
                    };
                    this.OurMc[_local_4].mc = xatlib.LoadMovie(undefined, xatlib.SmilieUrl(this.OurMc[_local_4].Name, _local_11, _local_5), this.SmileyLoaded);
                    this.NumToLoad++;
                };
                _local_4++;
            };
            this.Parent.addEventListener(Event.REMOVED_FROM_STAGE, this.cleanUp, false, 0, true);
            if (this.NumToLoad == 0)
            {
                this.SmileyLoaded();
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


        public function cleanUp(_arg_1:*=0)
        {
            if (!this.Parent)
            {
                return;
            };
            try
            {
                this.Parent.removeEventListener(Event.REMOVED_FROM_STAGE, this.cleanUp);
            } catch(e)
            {
            };
            try
            {
                this.removeEventListener(MouseEvent.ROLL_OVER, this.RolloverHandler);
            } catch(e)
            {
            };
            var _local_2:* = 0;
            while (_local_2 < this.NoOfSmilies)
            {
                if (this.OurMc[_local_2].mc.parent)
                {
                    this.removeChild(this.OurMc[_local_2].mc);
                };
                if (!(this.OurMc[_local_2].SP & smiley.b_internal))
                {
                    this.OurMc[_local_2].mc.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.SmileyLoaded);
                    this.OurMc[_local_2].mc.unloadAndStop(true);
                };
                this.OurMc[_local_2].mc = null;
                _local_2++;
            };
            delete TickDict[this];
            this.Parent = undefined;
        }

        function SmileyLoaded(e:Event=null)
        {
            var k:* = undefined;
            var n:* = undefined;
            var i:* = undefined;
            var Simple:Boolean;
            var OurMc_n:* = undefined;
            var Del:* = undefined;
            var mc:* = undefined;
            var j:* = undefined;
            var c:Class;
            var OurMc_n_Layers_k:* = undefined;
            this.NumToLoad--;
            if (this.NumToLoad > 0)
            {
                return;
            };
            var GotTop:* = false;
            var Wiggle:int;
            n = 0;
            while (n < this.NoOfSmilies)
            {
                OurMc_n = this.OurMc[n];
                if (OurMc_n.mc)
                {
                    OurMc_n.Uses++;
                    OurMc_n.Layers = {};
                    this.addChild(OurMc_n.mc);
                    if ((((OurMc_n.SP & smiley.b_fade)) || ((OurMc_n.SC == "y"))))
                    {
                        this.Frames = this.framesrequired(new Array(this.Frames, 36));
                    };
                    i = 0;
                    while (i < NumLayers)
                    {
                        k = LayerNames[i];
                        Del = true;
                        while (1)
                        {
                            if (k == "Base")
                            {
                                try
                                {
                                    if ((OurMc_n.SP & smiley.b_internal))
                                    {
                                        mc = (OurMc_n.Layers[k] = OurMc_n.mc);
                                    } else
                                    {
                                        mc = (OurMc_n.Layers[k] = MovieClip(OurMc_n.mc.contentLoaderInfo.content));
                                    };
                                    if (((((!(mc.Frames)) && (!(mc.MaxW)))) && (wInfo[OurMc_n.Name])))
                                    {
                                        mc.Frames = fInfo[OurMc_n.Name];
                                        if (mc.Frames == 0)
                                        {
                                            mc.Frames = 36;
                                        };
                                        j = 0;
                                        while (j < NiceFramesL)
                                        {
                                            if (mc.Frames == NiceFrames[j]) break;
                                            if (mc.Frames <= NiceFrames[j])
                                            {
                                                mc.Frames = NiceFrames[j];
                                                break;
                                            };
                                            j++;
                                        };
                                        mc.MaxW = wInfo[OurMc_n.Name];
                                        if (mc.MaxW == 40)
                                        {
                                            mc.MaxW = 50;
                                        };
                                    };
                                    if (((mc.MaxW) && ((mc.MaxW > this.MaxW))))
                                    {
                                        this.MaxW = mc.MaxW;
                                    };
                                    if (mc.Frames)
                                    {
                                        this.Frames = this.framesrequired(new Array(this.Frames, mc.Frames));
                                    };
                                    if (mc.NoCache)
                                    {
                                        this.Parent.SF = (this.Parent.SF | smiley.f_NoCache);
                                    };
                                    if (((mc.Wiggle) && ((mc.Wiggle > Wiggle))))
                                    {
                                        Wiggle = mc.Wiggle;
                                    };
                                    if (mc.Simple)
                                    {
                                        Simple = true;
                                    };
                                    if (mc.xd)
                                    {
                                        this.xd = mc.xd;
                                        mc.Flags = (mc.Flags | 3);
                                    };
                                    if (mc.Flags)
                                    {
                                        this.Flags = mc.Flags;
                                    };
                                } catch(e:Error)
                                {
                                };
                            } else
                            {
                                if ((OurMc_n.SP & smiley.b_internal)) break;
                                if (!OurMc_n.mc.contentLoaderInfo.applicationDomain.hasDefinition(k)) break;
                                c = (OurMc_n.mc.contentLoaderInfo.applicationDomain.getDefinition(k) as Class);
                                if (!c) break;
                                mc = (new (c)() as MovieClip);
                                OurMc_n.Layers[k] = mc;
                            };
                            if (!mc) break;
                            if (!mc.width) break;
                            if ((((OurMc_n.Type == 1)) && (!((k == "Bkg"))))) break;
                            if ((((((n > 0)) && ((LayerTypes[i] == 0)))) && (!((OurMc_n.Type == 1))))) break;
                            if (((((((!((n == 0))) && (LayerTypes[i]))) && (this.OurMc[0].Layers[k]))) && (this.OurMc[0].Layers[k])))
                            {
                                delete this.OurMc[0].Layers[k];
                            };
                            if (((((((this.g130) && ((n == 1)))) && ((((this.Flags & 2)) || (!(this.OurMc[0].Layers.Bkg)))))) && (this.OurMc[n].Layers.Bkg)))
                            {
                                this.OurMc[n].Layers.Bkg.visible = false;
                            } else
                            {
                                if ((((OurMc_n.Type == 1)) && (this.OurMc[0].Layers.Bkg)))
                                {
                                    delete this.OurMc[0].Layers.Bkg;
                                };
                            };
                            Del = false;
                            if ((((n > 0)) && (!((OurMc_n.Type == 1)))))
                            {
                                GotTop = true;
                            };
                            break;
                        };
                        if (Del)
                        {
                            delete OurMc_n.Layers[k];
                        };
                        i++;
                    };
                    if (GotTop)
                    {
                        i = 0;
                        while (i < NumLayers)
                        {
                            if (LayerTypes[i])
                            {
                                delete this.OurMc[0].Layers[LayerNames[i]];
                            };
                            i++;
                        };
                    };
                };
                n++;
            };
            if ((this.Parent.SP & smiley.b_glow))
            {
                Wiggle = (Wiggle + 4);
            };
            if (this.MaxW == 0)
            {
                this.MaxW = 22;
            };
            this.MaxW = (this.MaxW + Wiggle);
            if (this.MaxW > 50)
            {
                this.MaxW = 50;
            };
            if (this.Frames > 72)
            {
                this.Frames = 72;
            };
            if (((Simple) && ((this.Parent.SF & smiley.f_Simple))))
            {
                this.Parent.SF = (this.Parent.SF | smiley.f_NoCache);
            };
            if ((((((todo.FV < 10)) && ((this.Frames > 36)))) && ((this.MaxW >= 40))))
            {
                this.Frames = 36;
            };
            if ((this.Parent.SF & smiley.f_OneFrame))
            {
                this.Frames = 1;
            };
            if (todo.Macros["sanimate"] === "off")
            {
                this.Frames = 1;
            };
            i = 0;
            while (i < NumLayers)
            {
                k = LayerNames[i];
                n = 0;
                while (n < this.NoOfSmilies)
                {
                    OurMc_n = this.OurMc[n];
                    if (OurMc_n.Layers)
                    {
                        OurMc_n_Layers_k = OurMc_n.Layers[k];
                        if (OurMc_n_Layers_k)
                        {
                            this.addChild(OurMc_n_Layers_k);
                            if (((OurMc_n_Layers_k.RollOver) && (!(this.NeedRoll))))
                            {
                                this.NeedRoll = 1;
                            };
                        };
                    };
                    n++;
                };
                i++;
            };
            if (todo.gconfig["g106"])
            {
                OurMc_n = this.OurMc[((this.g130) ? 1 : 0)];
                if (((((OurMc_n.Layers["Bkg"]) && (!(OurMc_n.SC)))) && (!((this.Flags & 1)))))
                {
                    OurMc_n.SC = todo.gconfig["g106"];
                };
            };
            TickDict[this] = 1;
            if (this.NeedRoll)
            {
                addEventListener(MouseEvent.ROLL_OVER, this.RolloverHandler, false, 0, true);
            };
        }

        function tick()
        {
            var k:* = undefined;
            var i:* = undefined;
            var DelAll:* = undefined;
            var Del0:* = undefined;
            var r:* = undefined;
            var g:* = undefined;
            var b:* = undefined;
            var OurMc_n:* = undefined;
            var Del:* = undefined;
            var OurMc_n_Layers_k:* = undefined;
            var Del2:* = undefined;
            var tickret:* = undefined;
            var zOurMc_n:* = undefined;
            var n:* = 0;
            try
            {
                this.tc++;
                DelAll = ((this.mDelAll) && ((this.tc > 1)));
                if (this.xd)
                {
                    DelAll = false;
                };
                Del0 = DelAll;
                this.Loading = 0;
                if (this.Parent.SCC)
                {
                    this.SuperCycle();
                } else
                {
                    r = lut36[((this.tc + this.rs) % yt)];
                    g = lut36[(((this.tc + this.rs) + 24) % yt)];
                    b = lut36[(((this.tc + this.rs) + 12) % yt)];
                    this.cc = (((r << 16) + (g << 8)) + b);
                };
                n = 0;
                while (n < this.NoOfSmilies)
                {
                    OurMc_n = this.OurMc[n];
                    if (OurMc_n.mc)
                    {
                        if (OurMc_n.Layers)
                        {
                            Del = Del0;
                            for (k in OurMc_n.Layers)
                            {
                                OurMc_n_Layers_k = OurMc_n.Layers[k];
                                Del2 = Del0;
                                tickret = undefined;
                                if (OurMc_n_Layers_k)
                                {
                                    if (((OurMc_n_Layers_k.RollOver) && (this.RollOverLayer(OurMc_n_Layers_k))))
                                    {
                                        Del2 = false;
                                    };
                                    if ((((((this.tc == 2)) && (OurMc_n_Layers_k.Go))) && (OurMc_n_Layers_k.Go([this.Parent.SA, OurMc_n.SC, (this.Parent.SF | ((n) ? 0 : 32))]))))
                                    {
                                        Del2 = false;
                                    };
                                    if ((((((((n == 0)) && ((this.OurMc[0].SP & smiley.b_glow)))) && ((((k == "Bkg")) || ((k == "Base")))))) && (this.GlowLayer(OurMc_n.mc))))
                                    {
                                        Del2 = false;
                                    };
                                    if ((((k == "Hands")) && (this.HandsLayer(OurMc_n_Layers_k, OurMc_n))))
                                    {
                                        Del2 = false;
                                    };
                                    if (((((!((OurMc_n.SC == undefined))) && (((((!((n == 0))) || ((k == "Bkg")))) || ((k == "Base")))))) && (this.ColorLayer(OurMc_n_Layers_k, OurMc_n.SC, k))))
                                    {
                                        Del2 = false;
                                    };
                                    if ((((OurMc_n.SP & smiley.b_fade)) && (this.FadeLayer(OurMc_n_Layers_k))))
                                    {
                                        Del2 = false;
                                    };
									var _local_4 = OurMc_n_Layers_k.Tick(this.tc);

                                    if ((((((this.tc > 1)) && (OurMc_n_Layers_k.Tick))) && ((_local_4), (tickret = OurMc_n_Layers_k.Tick(this.tc)), _local_4)))
                                    {
                                        Del2 = false;
                                    };
                                    if (OurMc_n_Layers_k.Loading)
                                    {
                                        this.Loading = (this.Loading | OurMc_n_Layers_k.Loading());
                                    };
                                    if (Del2)
                                    {
                                        delete OurMc_n.Layers[k];
                                    } else
                                    {
                                        _local_4 = false;
                                        Del = _local_4;
                                        DelAll = _local_4;
                                    };
                                    if ((tickret is Array))
                                    {
                                        if (this.x)
                                        {
                                            this.x = 0;
                                        };
                                        if (this.y)
                                        {
                                            this.y = 0;
                                        };
                                        if (this.rotation)
                                        {
                                            this.rotation = 0;
                                        };
                                        if (this.scaleX != 1)
                                        {
                                            this.scaleX = 1;
                                        };
                                        if (this.scaleY != 1)
                                        {
                                            this.scaleY = 1;
                                        };
                                        if (tickret[0])
                                        {
                                            this.x = (this.x + tickret[0]);
                                        };
                                        if (tickret[1])
                                        {
                                            this.y = (this.y + tickret[1]);
                                        };
                                        if (tickret[2])
                                        {
                                            this.rotation = (this.rotation + tickret[2]);
                                        };
                                        if (tickret[3])
                                        {
                                            this.scaleX = (this.scaleY = tickret[3]);
                                        };
                                        if (tickret[4] != undefined)
                                        {
                                            this.alpha = tickret[4];
                                        };
                                    } else
                                    {
                                        if ((tickret is Matrix))
                                        {
                                            if (OurMc_n.Name === "topspin")
                                            {
                                                zOurMc_n = this.OurMc[(n - 1)];
                                                if (((zOurMc_n) && (zOurMc_n.Layers)))
                                                {
                                                    i = 0;
                                                    while (i < NumLayers)
                                                    {
                                                        if (LayerTypes[i])
                                                        {
                                                            if (zOurMc_n.Layers[LayerNames[i]])
                                                            {
                                                                zOurMc_n.Layers[LayerNames[i]].transform.matrix = tickret;
                                                            };
                                                        };
                                                        i++;
                                                    };
                                                };
                                            } else
                                            {
                                                this.transform.matrix = tickret;
                                            };
                                        };
                                    };
                                };
                            };
                            if (Del)
                            {
                                delete OurMc_n.Layers;
                            };
                        };
                    };
                    n++;
                };
                if ((((this.tc > 2)) && (this.NeedRoll)))
                {
                    this.NeedRoll = 1;
                };
                if (((DelAll) && ((this.Parent.SF & smiley.f_NoCache))))
                {
                    delete TickDict[this];
                    return;
                };
            } catch(e:Error)
            {
            };
        }

        function RollOverLayer(_arg_1:*)
        {
            if (this.tc <= 2)
            {
                return (true);
            };
            if (this.NeedRoll == 2)
            {
                return (_arg_1.RollOver(1));
            };
            return (true);
        }

        function RolloverHandler(_arg_1:MouseEvent)
        {
            if (this.tc > 2)
            {
                this.NeedRoll = 2;
            };
        }

        function GlowLayer(_arg_1:*)
        {
            var _local_3:*;
            var _local_2:* = MovieClip(_arg_1.contentLoaderInfo.content);
            if (_local_2.GlowCol == 1)
            {
                return (false);
            };
            if (_local_2.GlowFil == undefined)
            {
                _local_3 = _local_2.GlowCol;
                if (_local_3 == undefined)
                {
                    _local_3 = this.GlowCol;
                };
                if (_local_3 == undefined)
                {
                    _local_2.GlowFil = SmileyGlow;
                } else
                {
                    _local_2.GlowFil = xatlib.MakeGlow(_local_3, 1, 3);
                };
            };
            if (!((this.tc % 18) >= 4))
            {
                this.filters = _local_2.GlowFil;
            } else
            {
                this.filters = null;
            };
            return (true);
        }

        function ColorLayer(_arg_1:*, _arg_2:*, _arg_3:*)
        {
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            if (_arg_3 == "Face")
            {
                return (false);
            };
            this.DidColor = _arg_1.Coloring;
            var _local_4:* = (((this.tc < 2)) || (_arg_1.Coloring));
            if (!_arg_1.Cols)
            {
                _local_7 = String(_arg_2).split("#");
                _arg_1.Cols = new Array();
                _local_8 = 0;
                _local_9 = 0;
                while (_local_8 < 4)
                {
                    _local_6 = _local_7[_local_9];
                    if ((((_local_6 == undefined)) && ((_local_8 == 0))))
                    {
                        return (false);
                    };
                    if (_local_6 == undefined)
                    {
                        _local_9 = 0;
                        _local_6 = _local_7[0];
                    };
                    if (_local_6 != "y")
                    {
                        _local_6 = xatlib.xInt(_local_6);
                    };
                    if (_local_6 !== 0)
                    {
                        var _local_11 = _local_8++;
                        _arg_1.Cols[_local_11] = _local_6;
                    };
                    _local_9++;
                };
                if ((this.Parent.SP & smiley.f_FlashRank))
                {
                    _arg_1.Cols.unshift(_arg_1.Cols[0]);
                };
            };
            if ((((_arg_1.Cols[0] === 0)) || ((_arg_1.Cols[0] === undefined))))
            {
                return (false);
            };
            if ((this.Parent.SP & smiley.f_FlashRank))
            {
                this.DidColor = true;
                _local_10 = (this.tc % 36);
                if (_local_10 < 14)
                {
                    _arg_1.Cols[0] = _arg_1.Cols[1];
                } else
                {
                    if ((((_local_10 >= 22)) && ((_local_10 < 30))))
                    {
                        _arg_1.Cols[0] = _arg_1.Cols[2];
                    } else
                    {
                        if (_local_10 >= 30)
                        {
                            _local_10 = ((_local_10 - 30) / 6);
                        } else
                        {
                            _local_10 = (1 - ((_local_10 - 14) / 8));
                        };
                        _arg_1.Cols[0] = (((int(((_arg_1.Cols[1] & 0xFF0000) * _local_10)) & 0xFF0000) | (int(((_arg_1.Cols[1] & 0xFF00) * _local_10)) & 0xFF00)) | (int(((_arg_1.Cols[1] & 0xFF) * _local_10)) & 0xFF));
                        _local_10 = (1 - _local_10);
                        _arg_1.Cols[0] = (_arg_1.Cols[0] + (((int(((_arg_1.Cols[2] & 0xFF0000) * _local_10)) & 0xFF0000) | (int(((_arg_1.Cols[2] & 0xFF00) * _local_10)) & 0xFF00)) | (int(((_arg_1.Cols[2] & 0xFF) * _local_10)) & 0xFF)));
                    };
                };
            };
            var _local_5:* = ((_arg_1.Coloring) || (this.ColorList(_arg_1, DisplayObjectContainer(_arg_1))));
            if (((this.DidColor) || ((this.tc < 2))))
            {
                return (((_local_5) || (this.DidColor)));
            };
            _local_5 = _arg_1.Cols[0];
            if (((!(_local_5)) || ((_local_5 == ""))))
            {
                return (false);
            };
            _local_6 = _local_5;
            if (_local_5 == "y")
            {
                _local_6 = this.cc;
            };
            xatlib.McSetRGB(_arg_1, _local_6);
            if (_local_5 == "y")
            {
                return (true);
            };
            return (false);
        }

        private function ColorList(_arg_1:*, _arg_2:DisplayObjectContainer, _arg_3:String=""):Boolean
        {
            var _local_4:DisplayObject;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_5:Boolean;
            var _local_6:uint;
            while (_local_6 < _arg_2.numChildren)
            {
                _local_4 = _arg_2.getChildAt(_local_6);
                if (_local_4 != null)
                {
                    _local_7 = hcolor[_local_4.name];
                    if (_local_7 != undefined)
                    {
                        _local_7 = _arg_1.Cols[_local_7];
                        if (_local_7 == "y")
                        {
                            _local_7 = this.cc;
                            _local_5 = true;
                        };
                        if (_local_7 == 0)
                        {
                            _local_7 = 1;
                        };
                        _local_8 = new ColorTransform();
                        _local_8.color = _local_7;
                        _local_4.transform.colorTransform = _local_8;
                        this.DidColor = true;
                    } else
                    {
                        if ((_arg_2.getChildAt(_local_6) is DisplayObjectContainer))
                        {
                            _local_9 = this.ColorList(_arg_1, DisplayObjectContainer(_local_4), (_arg_3 + "    "));
                            _local_5 = ((_local_5) || (_local_9));
                        };
                    };
                };
                _local_6++;
            };
            return (_local_5);
        }

        function FadeLayer(_arg_1:*)
        {
            _arg_1.alpha = a[((this.tc + this.ar) % al)];
            return (true);
        }

        function HandsLayer(mc:*, Parent:*)
        {
            var Args:* = undefined;
            var n:* = undefined;
            var c:Class;
            var i:* = undefined;
            var o:* = undefined;
            if (this.tc < 2)
            {
                return (true);
            };
            if (mc.action == undefined)
            {
                return (false);
            };
            if (mc.mc == undefined)
            {
                mc.mc = new Array();
                if (mc.bleft == undefined)
                {
                    mc.bleft = false;
                };
                if (mc.bright == undefined)
                {
                    mc.bright = false;
                };
                if (mc.bsame == undefined)
                {
                    mc.bsame = false;
                };
                if (mc.action == undefined)
                {
                    mc.action = 0;
                };
                if (Parent.SC)
                {
                    Args = Parent.SC.split("#");
                } else
                {
                    Args = [];
                };
                for (n in Args)
                {
                    switch (Args[n])
                    {
                        case "right":
                            mc.bright = true;
                            mc.bleft = false;
                            break;
                        case "left":
                            mc.bleft = true;
                            mc.bright = false;
                            break;
                        case "both":
                            mc.bright = (mc.bleft = false);
                            break;
                        case "same":
                            mc.bsame = true;
                            break;
                        case "diff":
                            mc.bsame = false;
                            break;
                        case "still":
                            mc.action = 0;
                            break;
                        case "inout":
                            mc.action = 1;
                            break;
                        case "forehead":
                            mc.action = 2;
                            break;
                        case "wrist":
                            mc.action = 3;
                            break;
                        case "updown":
                            mc.action = 4;
                            break;
                        case "together":
                            mc.action = 5;
                            break;
                        case "bat":
                            mc.action = 6;
                            break;
                    };
                };
                c = (Parent.mc.contentLoaderInfo.applicationDomain.getDefinition("hand") as Class);
                if (!c)
                {
                    return (false);
                };
                if (!mc.bleft)
                {
                    try
                    {
                        mc.mc[0] = (new (c)() as MovieClip);
                        mc.addChild(mc.mc[0]);
                        mc.mc[0].x = 0;
                        mc.mc[0].y = 10;
                    } catch(e:Error)
                    {
                        return (false);
                    };
                };
                if (!mc.bright)
                {
                    try
                    {
                        mc.mc[1] = (new (c)() as MovieClip);
                        mc.addChild(mc.mc[1]);
                        mc.mc[1].x = 19;
                        mc.mc[1].y = 10;
                    } catch(e:Error)
                    {
                        return (false);
                    };
                };
                try
                {
                    switch (mc.action)
                    {
                        case 0:
                            break;
                        case 1:
                            mc.az = new Array(100, 103, 107, 111, 116, 121, 126, 132, 137, 137, 130, 125, 120, 114, 110, 106, 102, 100);
                            mc.d = mc.az.length;
                            break;
                        case 2:
                            mc.ax = new Array(0, 0, 1, 2, 3, 4, 5, 6, 6, 6, 6, 6, 5, 4, 3, 2, 1, 0, 0, 0, -1, -2, -3, -4, -5, -5, -5, -5, -5, -5, -5, -4, -3, -2, -1, -1);
                            mc.ay = new Array(0, 0, -1, -2, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -2, -1, 0, 0, 0, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 1, 1);
                            mc.az = new Array();
                            i = 0;
                            while (i < mc.ay.length)
                            {
                                mc.az.push((112 - (mc.ay[i] * 4)));
                                i++;
                            };
                            mc.d = mc.ax.length;
                            break;
                        case 3:
                            mc.ar = new Array(0, 9, 18, 27, 36, 36, 27, 18, 9, 0, -9, -18, -27, -36, -36, -27, -18, -9);
                            mc.d = mc.ar.length;
                            break;
                        case 4:
                            mc.ay = new Array(0, 0, 1, 2, 3, 3, 3, 2, 1, 0, 0, -1, -2, -3, -3, -3, -2, -1);
                            mc.az = new Array();
                            i = 0;
                            while (i < mc.ay.length)
                            {
                                mc.az.push((112 - (mc.ay[i] * 4)));
                                i++;
                            };
                            mc.d = mc.ay.length;
                            break;
                        case 5:
                            mc.ax = new Array(10, 10);
                            mc.ay = new Array(5, 5);
                            mc.az = new Array();
                            i = 0;
                            while (i < mc.ay.length)
                            {
                                mc.az.push((112 - (mc.ay[i] * 4)));
                                i++;
                            };
                            mc.d = mc.ay.length;
                            break;
                        case 6:
                            mc.ay = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                            mc.ar = new Array(0, -10, -20, -30, -30, -30, -30, -30, -30, 20, 40, 60, 60, 50, 40, 30, 20, 10, 0);
                            mc.az = new Array();
                            i = 0;
                            while (i < mc.ay.length)
                            {
                                mc.az.push((112 - (mc.ay[i] * 4)));
                                i++;
                            };
                            mc.d = mc.ay.length;
                            break;
                        case 7:
                            mc.ax = new Array(-3, -3, -2, -1, 0, 0, 0, 0, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 0, 0, 0, 0, -1, -2, -3, -3, -3, -3);
                            mc.ay = new Array(6, 6, 6, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 3, 4, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 6);
                            mc.ar = new Array(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 90, 90, 85, 90, 85, 90, 85, 90, 85, 90, 85, 90, 90, 90, 90, 70, 50, 30, 10, 0, 0, 0, 0, 0, 0);
                            mc.az = new Array();
                            i = 0;
                            while (i < mc.ay.length)
                            {
                                mc.az.push((100 + (mc.ay[i] * 4)));
                                i++;
                            };
                            mc.d = mc.ax.length;
                            break;
                    };
                } catch(e:Error)
                {
                    return (false);
                };
            };
            if (!mc.bleft)
            {
                try
                {
                    mc.mc[0].x = (((mc.ax == undefined)) ? 0 : (0 + mc.ax[(this.tc % mc.d)]));
                    mc.mc[0].y = (((mc.ay == undefined)) ? 10 : (10 + mc.ay[(this.tc % mc.d)]));
                    mc.mc[0].scaleX = (mc.mc[0].scaleY = (((mc.az == undefined)) ? 1 : (mc.az[(this.tc % mc.d)] / 100)));
                    mc.mc[0].rotation = (((mc.ar == undefined)) ? 0 : mc.ar[(this.tc % mc.d)]);
                } catch(e:Error)
                {
                    return (false);
                };
            };
            if (!mc.bright)
            {
                try
                {
                    o = ((mc.bsame) ? 0 : (mc.d >> 1));
                    mc.mc[1].x = (((mc.ax == undefined)) ? 19 : (19 - mc.ax[((this.tc + o) % mc.d)]));
                    mc.mc[1].y = (((mc.ay == undefined)) ? 10 : (10 + mc.ay[((this.tc + o) % mc.d)]));
                    mc.mc[1].scaleX = (mc.mc[1].scaleY = (((mc.az == undefined)) ? 1 : (mc.az[((this.tc + o) % mc.d)] / 100)));
                    mc.mc[1].scaleX = (mc.mc[1].scaleX * -1);
                    if (mc.ar != undefined)
                    {
                        mc.mc[1].rotation = mc.ar[((this.tc + o) % mc.d)];
                    };
                } catch(e:Error)
                {
                    return (false);
                };
            };
            return (true);
        }

        private function framesrequired(_arg_1:Array):int
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            _arg_1.sort((Array.NUMERIC | Array.DESCENDING));
            var _local_2:int;
            while (_local_2 < (_arg_1.length - 1))
            {
                if (_arg_1[_local_2] == _arg_1[(_local_2 + 1)])
                {
                    _arg_1.splice(_local_2, 1);
                    _local_2 = 0;
                };
                _local_2++;
            };
            var _local_3:* = _arg_1.length;
            var _local_4:int = 1;
            while (_local_4 < _local_3)
            {
                _local_5 = _arg_1[0];
                _local_6 = _arg_1[_local_4];
                while (_local_6 != 0)
                {
                    _local_7 = (_local_5 % _local_6);
                    _local_5 = _local_6;
                    _local_6 = _local_7;
                };
                _local_8 = ((_arg_1[0] / _local_5) * _arg_1[_local_4]);
                if (_local_8 > _arg_1[0])
                {
                    _arg_1.unshift(_local_8);
                    if (_local_8 >= 72) break;
                    _local_3 = _arg_1.length;
                    _local_4 = 1;
                };
                _local_4++;
            };
            return (_arg_1[0]);
        }

        function SuperCycle()
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            if (this.Parent.SCC !== 1)
            {
                _local_1 = 0;
                _local_2 = 1;
                _local_3 = [];
                _local_5 = 0;
                _local_6 = 0;
                _local_7 = {};
                _local_8 = {};
                while (1)
                {
                    _local_4 = parseInt(this.Parent.SCC.substr(_local_2, 6), 16);
                    if (!_local_4) break;
                    _local_2 = (_local_2 + 6);
                    _local_7[_local_1] = _local_4;
                    _local_5++;
                    _local_4 = 0;
                    switch (this.Parent.SCC.charAt(_local_2++))
                    {
                        case "b":
                            if ((((_local_5 > 1)) && ((_local_1 <= 35))))
                            {
                                _local_6 = 1;
                            };
                            break;
                        case "n":
                            _local_4 = this.noTween;
                            break;
                        case "l":
                            _local_4 = this.linearTween;
                            break;
                        case "i":
                            _local_4 = this.easeInQuad;
                            break;
                        case "o":
                            _local_4 = this.easeOutQuad;
                            break;
                        default:
                            _local_4 = this.easeInOutQuad;
                    };
                    if (!_local_4) break;
                    _local_8[_local_1] = _local_4;
                    if (_local_5 >= 4) break;
                    _local_4 = xatlib.xInt(this.Parent.SCC.substr(_local_2, 2));
                    if (!_local_4) break;
                    _local_1 = _local_4;
                    _local_2 = (_local_2 + 2);
                };
                if ((((_local_5 > 1)) && ((_local_1 <= 71))))
                {
                    this.ani_col = _local_7;
                    this.ani_colt = _local_8;
                    this.ani_Frames = (_local_1 + 1);
                } else
                {
                    _local_6 = 0;
                };
                for (_local_9 in this.ani_col)
                {
                    _local_4 = this.rgbtohsv(this.ani_col[_local_9]);
                    this.ani_ha[_local_9] = _local_4[0];
                    this.ani_sa[_local_9] = _local_4[1];
                    this.ani_va[_local_9] = _local_4[2];
                };
                _local_10 = 0;
                while (_local_10 < this.ani_Frames)
                {
                    this.cola[_local_10] = this.hsvtorgb(this.Animate(_local_10, this.ani_ha, this.ani_colt, 360), this.Animate(_local_10, this.ani_sa, this.ani_colt), this.Animate(_local_10, this.ani_va, this.ani_colt));
                    _local_10++;
                };
                if (_local_6)
                {
                    _local_4 = ((this.ani_Frames * 2) - 1);
                    _local_10 = 0;
                    while (_local_10 < this.ani_Frames)
                    {
                        var _local_11 = _local_4--;
                        this.cola[_local_11] = this.cola[_local_10];
                        _local_10++;
                    };
                    this.ani_Frames = (this.ani_Frames * 2);
                };
                this.Parent.SCC = 1;
                this.Frames = this.framesrequired(new Array(this.ani_Frames, this.Frames));
            };
            this.cc = this.cola[(this.tc % this.ani_Frames)];
        }

        function easeInQuad(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*)
        {
            _arg_1 = (_arg_1 / _arg_4);
            return ((((_arg_3 * _arg_1) * _arg_1) + _arg_2));
        }

        function easeOutQuad(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*)
        {
            _arg_1 = (_arg_1 / _arg_4);
            return ((((-(_arg_3) * _arg_1) * (_arg_1 - 2)) + _arg_2));
        }

        function easeInOutQuad(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*)
        {
            _arg_1 = (_arg_1 / (_arg_4 / 2));
            if (_arg_1 < 1)
            {
                return (((((_arg_3 / 2) * _arg_1) * _arg_1) + _arg_2));
            };
            _arg_1--;
            return ((((-(_arg_3) / 2) * ((_arg_1 * (_arg_1 - 2)) - 1)) + _arg_2));
        }

        function linearTween(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*)
        {
            return ((((_arg_3 * _arg_1) / _arg_4) + _arg_2));
        }

        function noTween(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*)
        {
            return (_arg_2);
        }

        function Animate(_arg_1:*, _arg_2:*, _arg_3:*=false, _arg_4:*=false)
        {
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            if (_arg_1 == 0)
            {
                return (_arg_2[0]);
            };
            _local_6 = 0;
            while (_local_6 < this.Frames)
            {
                _local_5 = _arg_2[_local_6];
                if (_local_5 !== undefined)
                {
                    if (_local_6 <= _arg_1)
                    {
                        _local_7 = _local_6;
                    };
                    if (_local_6 >= _arg_1)
                    {
                        _local_8 = _local_6;
                        break;
                    };
                };
                _local_6++;
            };
            if ((((_local_7 === undefined)) || ((_local_8 === undefined))))
            {
                return (_arg_2[0]);
            };
            if (_local_8 == _local_7)
            {
                return (_arg_2[_arg_1]);
            };
            var _local_10:* = _arg_2[_local_8];
            var _local_11:* = _arg_2[_local_7];
            if (_arg_3)
            {
                _arg_3 = _arg_3[_local_7];
            };
            if (!_arg_3)
            {
                _arg_3 = this.noTween;
            };
            if (_arg_4)
            {
                if ((_local_10 - _local_11) >= 180)
                {
                    _local_10 = (_local_10 - 360);
                } else
                {
                    if ((_local_10 - _local_11) < -180)
                    {
                        _local_11 = (_local_11 - 360);
                    };
                };
            };
            var _local_12:* = _arg_3((_arg_1 - _local_7), _local_11, (_local_10 - _local_11), (_local_8 - _local_7));
            if (((_arg_4) && ((_local_12 < 0))))
            {
                _local_12 = (_local_12 + 360);
            };
            return (_local_12);
        }

        function rgbtohsv(_arg_1:Number)
        {
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_2:* = ((_arg_1 >> 16) & 0xFF);
            var _local_3:* = ((_arg_1 >> 8) & 0xFF);
            var _local_4:* = (_arg_1 & 0xFF);
            var _local_8:Number = (_local_2 / 0xFF);
            var _local_9:Number = (_local_3 / 0xFF);
            var _local_10:Number = (_local_4 / 0xFF);
            var _local_11:Number = Math.min(_local_8, _local_9, _local_10);
            var _local_12:Number = Math.max(_local_8, _local_9, _local_10);
            if (_local_11 == _local_12)
            {
                _local_5 = 0;
            } else
            {
                if (_local_12 == _local_8)
                {
                    _local_5 = ((((60 * (_local_9 - _local_10)) / (_local_12 - _local_11)) + 360) % 360);
                } else
                {
                    if (_local_12 == _local_9)
                    {
                        _local_5 = (((60 * (_local_10 - _local_8)) / (_local_12 - _local_11)) + 120);
                    } else
                    {
                        _local_5 = (((60 * (_local_8 - _local_9)) / (_local_12 - _local_11)) + 240);
                    };
                };
            };
            if (_local_12 == 0)
            {
                _local_6 = 0;
            } else
            {
                _local_6 = ((_local_12 - _local_11) / _local_12);
            };
            _local_7 = _local_12;
            return (new Array(_local_5, _local_6, _local_7));
        }

        function hsvtorgb(_arg_1:Number, _arg_2:Number, _arg_3:Number):uint
        {
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:Number;
            _arg_1 = (_arg_1 % 360);
            if (_arg_3 == 0)
            {
                return (0);
            };
            _arg_1 = (_arg_1 / 60);
            _local_7 = Math.floor(_arg_1);
            _local_8 = (_arg_1 - _local_7);
            _local_9 = (_arg_3 * (1 - _arg_2));
            _local_10 = (_arg_3 * (1 - (_arg_2 * _local_8)));
            _local_11 = (_arg_3 * (1 - (_arg_2 * (1 - _local_8))));
            switch (_local_7)
            {
                case 0:
                    _local_4 = _arg_3;
                    _local_5 = _local_11;
                    _local_6 = _local_9;
                    break;
                case 1:
                    _local_4 = _local_10;
                    _local_5 = _arg_3;
                    _local_6 = _local_9;
                    break;
                case 2:
                    _local_4 = _local_9;
                    _local_5 = _arg_3;
                    _local_6 = _local_11;
                    break;
                case 3:
                    _local_4 = _local_9;
                    _local_5 = _local_10;
                    _local_6 = _arg_3;
                    break;
                case 4:
                    _local_4 = _local_11;
                    _local_5 = _local_9;
                    _local_6 = _arg_3;
                    break;
                case 5:
                    _local_4 = _arg_3;
                    _local_5 = _local_9;
                    _local_6 = _local_10;
                    break;
            };
            return ((((Math.floor((_local_4 * 0xFF)) << 16) | (Math.floor((_local_5 * 0xFF)) << 8)) | Math.floor((_local_6 * 0xFF))));
        }


    }
}//package 

