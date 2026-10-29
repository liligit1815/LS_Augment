package ls.augment.com;

public final class TestIslandActivityPolicy {
    static int checks;
    static void check(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
    static void expect(int expected,boolean enabled,boolean visible,boolean locked,long now,
            boolean music,boolean notice,long noticeUntil,boolean charge,long chargeUntil){
        checks++;int result=IslandActivityPolicy.choose(enabled,visible,locked,now,music,notice,noticeUntil,charge,chargeUntil);
        if(result!=expected)throw new AssertionError("Expected "+expected+", got "+result);
    }
    public static void main(String[] args){
        for(boolean e:new boolean[]{false,true})for(boolean v:new boolean[]{false,true})for(boolean l:new boolean[]{false,true})
            if(!e||!v||l)expect(0,e,v,l,0,true,true,100,true,100);
        expect(2,true,true,false,50,true,true,100,true,100);
        expect(3,true,true,false,100,true,true,100,true,101);
        expect(1,true,true,false,101,true,true,100,true,101);
        expect(0,true,true,false,200,false,false,0,true,0);
        expect(0,true,true,false,200,false,false,0,false,0);
        expect(1,true,true,false,100,true,false,0,false,0);
        for(int state=0;state<=12;state++){
            boolean active=state==3||state==4||state==5||state==6||state==8||state==9||state==10||state==11;
            checks++;if(active!=IslandActivityPolicy.mediaActive(state))throw new AssertionError("State "+state);
            checks++;if((state==3||state==4||state==5)!=IslandActivityPolicy.mediaPlaying(state))throw new AssertionError("Animation state "+state);
        }
        IslandActivityPolicy.MediaActivity media=new IslandActivityPolicy.MediaActivity();
        check(!media.update(2,0),"a pre-existing paused session must not appear when enabled");
        check(!media.update(2,60000),"repeated paused session remains hidden");
        check(media.update(3,60001),"playing starts an activity");
        check(media.update(2,61000),"pause briefly preserves playback controls");
        check(media.expiresAt()==65000,"pause has a four-second deadline");
        check(media.update(2,64999),"pause remains until its deadline");
        check(!media.update(2,65000),"paused media disappears at the deadline");
        check(!media.update(2,90000)&&media.expiresAt()==65000,"callbacks do not renew a paused activity");
        check(media.update(3,90001),"real resumed playback reappears");
        check(media.update(1,90002),"track handoff retains the existing session");
        check(media.expiresAt()==90652,"stopped grace is bounded");
        check(media.update(0,90651)&&media.expiresAt()==90652,"NONE/STOPPED callbacks do not renew grace");
        check(!media.update(1,90652),"real stop expires at grace boundary");
        check(!media.update(2,90653),"stopped-to-paused does not resurrect stale playback");
        for(int temporary:new int[]{0,1,7}){
            media=new IslandActivityPolicy.MediaActivity();check(!media.update(temporary,1),"idle sessions never appear");
            check(media.update(3,2)&&media.update(temporary,3)&&media.update(3,200),"track replacement stays continuous");
        }
        media=new IslandActivityPolicy.MediaActivity();media.update(3,1);media.update(2,2);
        check(!media.update(2,4002)&&!media.update(1,4003),"expired paused playback cannot reappear on stop");
        check(!media.update(2,4004),"expired handoff cannot renew paused playback");
        for(int initial:new int[]{6,8,9,10,11}){
            media=new IslandActivityPolicy.MediaActivity();check(media.update(initial,100),"transitions get a bounded initial window");
            check(media.update(8,12099),"transition category changes do not reset its timer");
            check(!media.update(6,12100),"stalled buffering cannot pin the island");
            check(media.expiresAt()==12100,"transition deadline remains unchanged");
            check(media.update(3,12101),"playing can recover after a stale transition");
        }
        IslandActivityPolicy.ChargingActivity charge=new IslandActivityPolicy.ChargingActivity();
        charge.update(true,true,100);check(charge.expiresAt()==0,"already-plugged sticky baseline is hidden");
        charge.update(true,true,200);check(charge.expiresAt()==0,"battery percentage updates do not start charging activity");
        charge.update(false,false,300);charge.update(true,true,400);
        check(charge.expiresAt()==5400,"a new plug-in is visible for exactly five seconds");
        charge.update(true,true,2000);check(charge.expiresAt()==5400,"plugged battery updates never extend activity");
        expect(3,true,true,false,5399,false,false,0,true,charge.expiresAt());
        expect(0,true,true,false,5400,false,false,0,true,charge.expiresAt());
        expect(1,true,true,false,5400,true,false,0,true,charge.expiresAt());
        charge.clear();charge.update(true,true,5500);check(charge.expiresAt()==0,"sleep/lock clearing cannot replay the same cable connection");
        charge.update(false,false,6000);charge.update(true,true,6001);charge.update(false,false,6002);
        check(charge.expiresAt()==0,"disconnect cancels immediately");
        charge.reset();charge.update(true,true,7000);check(charge.expiresAt()==0,"re-enabling establishes a fresh baseline");
        System.out.println("Island activity policy: "+checks+" checks passed");
    }
}
