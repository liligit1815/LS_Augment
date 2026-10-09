package ls.augment.com;

/** Activity precedence and expiration without Android state or side effects. */
public final class IslandActivityPolicy {
    public static final int NONE=0, MUSIC=1, NOTICE=2, CHARGING=3;
    public static final long CHARGE_MILLIS=5000, PAUSE_MILLIS=4000, TRANSITION_MILLIS=12000;
    private IslandActivityPolicy() { }
    public static int choose(boolean enabled, boolean visible, boolean locked, long now,
            boolean music, boolean notice, long noticeUntil, boolean charging, long chargeUntil) {
        if (!enabled || !visible || locked) return NONE;
        if (notice && now < noticeUntil) return NOTICE;
        if (charging && now < chargeUntil) return CHARGING;
        if (music) return MUSIC;
        return NONE;
    }
    public static boolean mediaActive(int state) {
        // PlaybackState constants: playing, fast-forwarding, rewinding,
        // buffering, connecting, skipping previous/next/queue item.
        return state==3 || state==4 || state==5 || state==6 || state==8
                || state==9 || state==10 || state==11;
    }
    public static boolean mediaPlaying(int state) {
        return state==3 || state==4 || state==5;
    }

    /** One session's lifetime. Metadata changes and repeated states never renew a timeout. */
    public static final class MediaActivity {
        private int phase;
        private boolean played;
        private long until;
        public boolean update(int state,long now) {
            int next=mediaPlaying(state)?1:state==2?2:mediaActive(state)?3:0;
            if(next==1){played=true;until=0;}
            else if(next!=phase){
                until=next==2&&played?now+PAUSE_MILLIS:next==3?now+TRANSITION_MILLIS:0;
                if(next==0)played=false;
            }
            phase=next;
            return next==1 || until>now;
        }
        public long expiresAt(){return until;}
    }

    /** Sticky battery state is a baseline, never a new plug-in event. */
    public static final class ChargingActivity {
        private boolean initialized,connected;
        private long until;
        public void update(boolean plugged,boolean charging,long now) {
            if(initialized&&!connected&&plugged&&charging)until=now+CHARGE_MILLIS;
            if(!plugged||!charging)until=0;
            initialized=true;connected=plugged;
        }
        public long expiresAt(){return until;}
        public void clear(){until=0;}
        public void reset(){initialized=false;connected=false;until=0;}
    }
}
