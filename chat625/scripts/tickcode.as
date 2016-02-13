// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//tickcode

package 
{
    import flash.display.Sprite;
    import flash.utils.getTimer;
    import flash.media.SoundTransform;
    import flash.events.Event;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.net.URLRequest;
    import flash.media.SoundLoaderContext;
    import flash.events.*;
    import flash.display.*;
    import flash.media.*;
    import flash.net.*;
    import flash.utils.*;

    public class tickcode extends Sprite 
    {

        public static var UserScroll:Boolean = false;
        public static var GlowFlag:Boolean;
        public static var s1;
        public static var s2 = 0;
        public static var s3;
        public static var BB;
        public static var BB2;
        public static var overrunt = 0;
        public static var boverrun = false;
        public static var Lag = false;
        static var radio = new Array(undefined, undefined);
        static var channel = new Array(undefined, undefined);
        static var radio_load = undefined;
        static var radio_state = undefined;
        static var ff = true;
        static var fade = 6;
        static var media = undefined;


        public static function DoTick()
        {
            var t:* = undefined;
            var scr:* = undefined;
            var UsersLength:* = undefined;
            var ww:* = undefined;
            var w:* = undefined;
            var ou:* = undefined;
            var r:* = undefined;
            var emi:* = undefined;
            var rr:* = undefined;
            var Wave:Array;
            var Amplitude:Number;
            var A:Number;
            var sfx_sound:* = undefined;
            var channel:* = undefined;
            var sfx_sound_complete_nudge:Function;
            var PlaySound:* = undefined;
            var sfx_sound_complete:Function;
            var OneSec:Boolean = ((todo.tick % 12) == 0);
            t = getTimer();
            var doverrunt:* = (t - overrunt);
            Lag = (doverrunt > 92);
            overrunt = t;
            boverrun = false;
            if (doverrunt > 130)
            {
                if (boverrun)
                {
                    boverrun = false;
                } else
                {
                    boverrun = true;
                };
            };
            todo.tick++;
            if (!todo.bMobile)
            {
                if (!boverrun)
                {
                    if (((todo.DoUpdateMessages) || (todo.ScrollDown)))
                    {
                        if ((((main.mscrollmc.Scrolling == true)) || ((main.mscrollmc.ScrollPressed == true))))
                        {
                            todo.LastScrollTime = getTimer();
                            main.mscrollmc.ScrollPressed = false;
                            xmessage.UpdateMessages(true, true);
                        } else
                        {
                            if (main.mscrollmc.Scr_position == main.mscrollmc.Scr_size)
                            {
                                todo.LastScrollTime = undefined;
                            };
                            scr = false;
                            if (todo.LastScrollTime != undefined)
                            {
                                if ((getTimer() - todo.LastScrollTime) < 10000)
                                {
                                    scr = true;
                                } else
                                {
                                    todo.LastScrollTime = undefined;
                                };
                            };
                            if (todo.LastScrollTime == undefined)
                            {
                                xmessage.UpdateMessages(true, scr);
                            };
                        };
                    };
                };
            };
            if (!boverrun)
            {
                if ((((todo.DoBuildUserList == true)) || ((todo.DoBuildUserListScrollUp == true))))
                {
                    xmessage.BuildUserList();
                    todo.DoBuildUserList = false;
                    todo.DoBuildUserListScrollUp = false;
                } else
                {
                    if (UserScroll)
                    {
                        xmessage.useryc = xmessage.useryc2;
                        UsersLength = todo.Users.length;
                        ww = 0;
                        while (ww < UsersLength)
                        {
                            if (todo.Users[xmessage.poin[ww].index].Vis)
                            {
                                xmessage.AddUserToList(xmessage.poin[ww].index);
                            };
                            ww++;
                        };
                    };
                };
            };
            UserScroll = false;
            if (GlowFlag)
            {
                GlowFlag = false;
                UsersLength = todo.Users.length;
                w = 0;
                while (w < UsersLength)
                {
                    t = todo.Users[w];
                    if (((((!((t.mc == null))) && ((t.glowc is Number)))) && ((t.glowc >= 0))))
                    {
                        if (t.glowc > 0)
                        {
                            t.glowc--;
                            GlowFlag = true;
                        } else
                        {
                            t = t.mc.av1;
                            t.filters = null;
                        };
                    };
                    w++;
                };
            };
            if (todo.TabGlowFlag)
            {
                todo.TabGlowFlag = false;
                w = -1;
                while (w < main.ctabsmc.tabs.length)
                {
                    t = main.ctabsmc.tabs[w];
                    if (w == -1)
                    {
                        t = main.utabsmc.tabs[2];
                    };
                    if (((((t) && (t.mc))) && (t.mc.bub)))
                    {
                        if (t.glowc > 0)
                        {
                            t.glowc--;
                            todo.TabGlowFlag = true;
                        } else
                        {
                            t.mc.bub.filters = null;
                        };
                    };
                    w++;
                };
            };
            todo.HelpUpdate = (todo.HelpUpdate - todo.heartbeatduration);
            if (todo.HelpUpdate < 0)
            {
                todo.HelpUpdate = 0;
            };
            if (((!((todo.helpstr == ""))) && ((todo.HelpUpdate <= 0))))
            {
                if (todo.w_help)
                {
                    todo.DoMessageSnd = true;
                    todo.Message.push({
                        "n":0,
                        "t":todo.helpstr,
                        "u":0
                    });
                    todo.DoUpdateMessages = true;
                    todo.ScrollDown = true;
                };
                todo.helpstr = "";
            };
            swfsmiley.MasterTick();
            smiley.MasterTick();
            loadbitmap.MasterTick();
            if (OneSec)
            {
                if (todo.Away)
                {
                    todo.Away++;
                    t = xatlib.xInt(todo.Macros["away"]);
                    if (t < 60)
                    {
                        t = 300;
                    };
                    if (todo.Away > t)
                    {
                        todo.Away = 1;
                        network.NetworkSendMsg(todo.w_userno, "/away");
                    };
                };
                if (todo.Typing > 1)
                {
                    todo.Typing--;
                    if (todo.Typing == 1)
                    {
                        network.NetworkSendMsg(todo.w_userno, "/RTypeOff", 0, todo.TypingID);
                        main.SetTyping(todo.w_userno, false);
                    };
                };
                cachedSprite.Tidy();
                if (xkiss.Wink)
                {
                    xkiss.WinkTO--;
                    if (xkiss.WinkTO < 0)
                    {
                        xkiss.WinkDone();
                    };
                };
            };
            if (((((todo.tick % 16) == 0)) && (!(todo.bStrip))))
            {
                ou = 0;
                UsersLength = todo.Users.length;
                r = 0;
                while (r < UsersLength)
                {
                    if (todo.Users[r].online)
                    {
                        ou++;
                    };
                    if (ou >= 2) break;
                    r++;
                };
                if (ou == 1)
                {
                    main.GrpIc.filters = [todo.TextGlow];
                    main.GrpIc.glowc = 6;
                };
            };
            if (((((!(todo.bHeadless)) && (main))) && (main.GrpIc)))
            {
                if (main.GrpIc.glowc > 1)
                {
                    main.GrpIc.glowc--;
                } else
                {
                    main.GrpIc.filters = null;
                };
            };
            if ((((xconst.f_NoSmilies & todo.FlagBits)) && ((todo.SmilieUpdate >= 0))))
            {
                if (todo.SmilieUpdate > todo.heartbeatduration)
                {
                    todo.SmilieUpdate = (todo.SmilieUpdate - todo.heartbeatduration);
                } else
                {
                    todo.SmilieUpdate = 0;
                };
                if (todo.SmilieUpdate == 0)
                {
                    emi = 1;
                    while (emi < todo.emmax)
                    {
                        if (main.em[emi] != null)
                        {
                            main.em[emi].visible = false;
                        };
                        emi++;
                    };
                    todo.SmilieUpdate = -1;
                };
            };
            if ((((((todo.lb == "n")) && (((todo.tick % 64) == 63)))) || (todo.ResetSmilies)))
            {
                rr = 0;
                while (rr < main.em.length)
                {
                    if (main.em[rr] != null)
                    {
                        main.em[rr].scaleX = (main.em[rr].scaleY = main.em[rr].starts);
                        main.em[rr].x = main.em[rr].startx;
                        main.em[rr].y = main.em[rr].starty;
                    };
                    rr++;
                };
                todo.ResetSmilies = false;
            } else
            {
                if (((((todo.w_attract) && ((todo.lb == "n")))) && (((todo.tick % 64) > 47))))
                {
                    Wave = new Array(1, 2, 1);
                    Amplitude = ((todo.StageHeight * 12) / 480);
                    rr = 0;
                    while (rr < main.em.length)
                    {
                        A = ((-(rr) - Wave.length) + (todo.tick % 16));
                        if ((((A < 0)) || ((A >= Wave.length))))
                        {
                            A = 0;
                        } else
                        {
                            A = Wave[A];
                        };
                        if (main.em[rr] != null)
                        {
                            main.em[rr].scaleX = (main.em[rr].scaleY = (main.em[rr].starts * (1 + (A / 19))));
                            main.em[rr].x = main.em[rr].startx;
                            main.em[rr].y = (main.em[rr].starty - (A * Amplitude));
                        };
                        rr++;
                    };
                };
            };
            if (!todo.bHeadless)
            {
                if (((todo.DoAudieSnd) && ((todo.CustomSound == todo.BumpSound))))
                {
                    var sfx_sound_loaded_nudge:Function = function (_arg_1:Event):void
                    {
                        main.nudge = 20;
                        channel = sfx_sound.play(0, 0, new SoundTransform((todo.w_Vol[1] / 100)));
                        channel.addEventListener(Event.SOUND_COMPLETE, sfx_sound_complete_nudge);
                    };
                    sfx_sound_complete_nudge = function (_arg_1:Event):void
                    {
                    };
                    todo.BumpSound = "";
                    todo.DoAudieSnd = false;
                    sfx_sound = new Sound();
                    channel = new SoundChannel();
                    sfx_sound.load(new URLRequest((((todo.chatdomain + "snd/") + todo.CustomSound) + ".mp3")));
                    sfx_sound.addEventListener(Event.COMPLETE, sfx_sound_loaded_nudge);
                };
                if ((todo.w_sound & 1))
                {
                    PlaySound = null;
                    if (todo.DoMessageSnd)
                    {
                        todo.DoMessageSnd = false;
                        if (((((((!((global.xc & 0x2000))) && (todo.gconfig))) && (todo.gconfig["g180"]))) && (todo.gconfig["g180"]["m"])))
                        {
                            PlaySound = todo.gconfig["g180"]["m"];
                        } else
                        {
                            chat.beep.play(0, 0, new SoundTransform((todo.w_Vol[1] / 100)));
                        };
                    } else
                    {
                        if (todo.DoUserSnd)
                        {
                            todo.DoUserSnd = false;
                            if (((((((!((global.xc & 0x2000))) && (todo.gconfig))) && (todo.gconfig["g180"]))) && (todo.gconfig["g180"]["d"])))
                            {
                                PlaySound = todo.gconfig["g180"]["d"];
                            } else
                            {
                                chat.dingdong.play(0, 0, new SoundTransform((todo.w_Vol[1] / 100)));
                            };
                        } else
                        {
                            if (todo.DoTabSnd)
                            {
                                todo.DoTabSnd = false;
                                if (((((((!((global.xc & 0x2000))) && (todo.gconfig))) && (todo.gconfig["g180"]))) && (todo.gconfig["g180"]["t"])))
                                {
                                    PlaySound = todo.gconfig["g180"]["t"];
                                } else
                                {
                                    chat.tab_sound.play(0, 0, new SoundTransform((todo.w_Vol[1] / 100)));
                                };
                            };
                        };
                    };
                    if (todo.DoAudieSnd)
                    {
                        todo.DoAudieSnd = false;
                        PlaySound = todo.CustomSound;
                    };
                    if (PlaySound)
                    {
                        var sfx_sound_loaded:Function = function (_arg_1:Event):void
                        {
                            channel = sfx_sound.play(0, 0, new SoundTransform((todo.w_Vol[1] / 100)));
                            channel.addEventListener(Event.SOUND_COMPLETE, sfx_sound_complete);
                        };
                        sfx_sound_complete = function (_arg_1:Event):void
                        {
                        };
                        sfx_sound = new Sound();
                        channel = new SoundChannel();
                        sfx_sound.load(new URLRequest((((todo.chatdomain + "snd/") + PlaySound) + ".mp3")));
                        sfx_sound.addEventListener(Event.COMPLETE, sfx_sound_loaded);
                    };
                };
            };
            DoRadio();
            if (((((main) && (main.mcscrollertext))) && (!((main.mcscrollertext.text == "")))))
            {
                if (main.mcscrollertext.textWidth > xatlib.NX(430))
                {
                    main.mcscrollertext.x--;
                    if (main.mcscrollertext.x < (xatlib.NX(10) - main.mcscrollertext.textWidth))
                    {
                        main.mcscrollertext.x = xatlib.NX(430);
                    };
                } else
                {
                    if (main.mcscrollertext.x > ((xatlib.NX(430) - main.mcscrollertext.textWidth) / 2))
                    {
                        main.mcscrollertext.x--;
                    };
                };
            };
        }

        public static function SetRadio()
        {
            var _local_1:* = (todo.w_sound & 2);
            if (_local_1 != 0)
            {
                if (radio_state == -1)
                {
                    radio_load = undefined;
                    radio_state = 0;
                };
            } else
            {
                fade = 6;
                if (channel[0] != undefined)
                {
                    channel[0].stop();
                };
                if (radio[0] != undefined)
                {
                    radio[0].close();
                };
                radio[0] = undefined;
                channel[0] = undefined;
                if (channel[1] != undefined)
                {
                    channel[1].stop();
                };
                if (radio[1] != undefined)
                {
                    radio[1].close();
                };
                radio[1] = undefined;
                channel[1] = undefined;
                radio_state = -1;
            };
        }

        static function DoRadio(_arg_1:*=false)
        {
            var _local_4:*;
            var _local_2:* = false;
            if (media == undefined)
            {
                media = todo.useRadio;
            } else
            {
                if (media != todo.useRadio)
                {
                    media = todo.useRadio;
                    _local_2 = true;
                };
            };
            if (radio_state == undefined)
            {
                if ((todo.w_sound & 2))
                {
                    radio_state = 0;
                } else
                {
                    radio_state = -1;
                };
            };
            if (!(todo.w_sound & 2))
            {
                return;
            };
            if (todo.useRadio == undefined)
            {
                return;
            };
            if (radio_state == -1)
            {
                return;
            };
            if (todo.w_sound == undefined)
            {
                return;
            };
            var _local_3:* = "";
            switch (radio_state)
            {
                case 0:
                    ff = !(ff);
                    radio[((ff) ? 0 : 1)] = new Sound();
                    channel[((ff) ? 0 : 1)] = new SoundChannel();
                    radio[((ff) ? 0 : 1)].load(new URLRequest((todo.useRadio + _local_3)), new SoundLoaderContext(3000));
                    radio_state = 1;
                    break;
                case 1:
                    if (!radio[((ff) ? 0 : 1)].isBuffering)
                    {
                        radio_load = getTimer();
                        channel[((ff) ? 0 : 1)] = radio[((ff) ? 0 : 1)].play(0, 0, new SoundTransform(0));
                        radio_state = 2;
                    };
                    break;
                case 2:
                    _local_4 = (todo.w_Vol[2] / 100);
                    if (channel[((ff) ? 0 : 1)] != undefined)
                    {
                        channel[((ff) ? 0 : 1)].soundTransform = new SoundTransform((_local_4 / fade));
                    };
                    if (channel[((ff) ? 1 : 0)] != undefined)
                    {
                        channel[((ff) ? 1 : 0)].soundTransform = new SoundTransform((_local_4 - (_local_4 / fade)));
                    };
                    fade--;
                    if (fade == 0)
                    {
                        fade = 6;
                        if (channel[((ff) ? 1 : 0)] != undefined)
                        {
                            channel[((ff) ? 1 : 0)].stop();
                        };
                        if (radio[((ff) ? 1 : 0)] != undefined)
                        {
                            radio[((ff) ? 1 : 0)].close();
                        };
                        radio[((ff) ? 1 : 0)] = undefined;
                        channel[((ff) ? 1 : 0)] = undefined;
                        radio_state = 3;
                    };
                    break;
                case 3:
                    if ((getTimer() - radio_load) > (60 * 1000))
                    {
                        radio_state = 0;
                    };
                    if (_arg_1)
                    {
                        _local_4 = (todo.w_Vol[2] / 100);
                        if (channel[((ff) ? 0 : 1)] != undefined)
                        {
                            channel[((ff) ? 0 : 1)].soundTransform = new SoundTransform((todo.w_Vol[2] / 100));
                        };
                    };
                    break;
            };
            if (_local_2)
            {
                radio_state = 0;
                _local_2 = false;
            };
        }


    }
}//package 

