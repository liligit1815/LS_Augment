package ls.augment.com;

/** One opt-in diagnostic gesture. Fixed primitive buffers; no Android calls or formatting while held. */
public final class BackGestureProbeTrace {
    public static final String ACTION="ls.augment.com.action.BACK_GESTURE_PROBE";
    public static final String KEY="ls_augment_back_gesture_probe";
    public static final long ARM_MILLIS=15_000;
    public static final int EVENTS=16, MOVES=12, DRAWS=96, PARTS=6;
    public final String nonce;
    public final long revision,generation,processStarted,armedAt,expiresAt;
    public final int pid,build,side;
    public final float startX,startY;
    public final long[][] events=new long[EVENTS][10],moves=new long[MOVES][7],draws=new long[DRAWS][13];
    public volatile long downTime;
    public long lastMoveReceived,lastWaveMoveReturned,cancelReceived,cancelReturned;
    public int eventCount,moveCount,drawCount,onDrawCount,waveDownCount,waveDrawCount,iconGetCount,customReturnCount;
    public final int[] selectedIcon=new int[5];
    public int overflow,errors,viewId,controllerId;
    public long lastWaveOffset1000;
    public volatile boolean closed,expired;
    public String phase="armed";

    public BackGestureProbeTrace(String nonce,long revision,long generation,int pid,int build,long processStarted,
            int side,long armedAt,float startX,float startY) {
        if(nonce==null||!nonce.matches("[a-f0-9]{32}")||side<0||side>1||revision<0||generation<0
                ||pid<=0||build<=0||armedAt<=0||!Float.isFinite(startX)||!Float.isFinite(startY))
            throw new IllegalArgumentException("Invalid probe identity");
        this.nonce=nonce;this.revision=revision;this.generation=generation;this.pid=pid;this.build=build;
        this.processStarted=processStarted;this.side=side;this.armedAt=armedAt;expiresAt=armedAt+ARM_MILLIS;
        this.startX=startX;this.startY=startY;
    }

    public static boolean authorized(int sender,int moduleUid,String senderPackage) {
        return moduleUid>=0&&sender==moduleUid&&"ls.augment.com".equals(senderPackage);
    }

    public synchronized boolean begin(int controller,long down,long time,long now,float x,float y) {
        if(closed||downTime!=0||now<armedAt||now>expiresAt||down<armedAt||time<down
                ||Math.abs(x-startX)>1||Math.abs(y-startY)>1)return false;
        downTime=down;controllerId=controller;phase="receiving";return true;
    }
    public synchronized boolean accepts(int controller,long down,long now) {
        return !closed&&downTime!=0&&controllerId==controller&&downTime==down&&now<=expiresAt;
    }
    public synchronized int input(int action,long eventTime,long now,int history,int status,int direction,boolean animation) {
        if(closed||downTime==0)return -1;
        if(action==2)lastMoveReceived=now;
        if(action==3)cancelReceived=now;
        int index=eventCount++;if(index>=EVENTS){overflow++;return -1;}
        long[] r=events[index];r[0]=action;r[1]=eventTime-downTime;r[2]=now-downTime;r[3]=history;
        r[4]=status;r[5]=status;r[6]=direction;r[7]=animation?1:0;
        return index;
    }
    public synchronized void processed(int index,boolean withoutAnimation){
        if(!closed&&index>=0&&index<EVENTS)events[index][withoutAnimation?9:8]++;
    }
    public synchronized void returned(int index,int status,long now,int action){
        if(closed)return;
        if(index>=0&&index<EVENTS)events[index][5]=status;
        if(action==3){cancelReturned=now;closed=true;phase="cancelled";}
        else if(action==1){closed=true;phase="up_not_cancel";}
    }
    public synchronized void waveDown(int id){if(!closed){viewId=id;waveDownCount++;}}
    public synchronized void move(long now,float offset,int before,int after,float scale,int ready){
        if(closed)return;lastWaveMoveReturned=now;lastWaveOffset1000=scaled(offset);int i=moveCount++;
        if(i>=MOVES){overflow++;return;}long[] r=moves[i];r[0]=now-downTime;r[1]=scaled(offset);
        r[2]=before;r[3]=after;r[4]=scaled(scale);r[5]=ready;r[6]=viewId;
    }
    public synchronized void icon(boolean custom){if(!closed){iconGetCount++;if(custom)customReturnCount++;}}
    public synchronized void selection(int alpha,int l,int t,int r,int b){if(!closed){selectedIcon[0]=alpha;selectedIcon[1]=l;selectedIcon[2]=t;selectedIcon[3]=r;selectedIcon[4]=b;}}
    public synchronized void onDraw(){if(!closed)onDrawCount++;}
    public synchronized void wave(){if(!closed)waveDrawCount++;}
    public synchronized void draw(long now,float scale,int ready,int count,int alpha,int l,int t,int r,int b,int w,int h,int flags){
        if(closed)return;int i=drawCount++;if(i>=DRAWS){overflow++;return;}
        long[] row=draws[i];row[0]=now-downTime;row[1]=scaled(scale);row[2]=ready;row[3]=count;
        row[4]=alpha;row[5]=l;row[6]=t;row[7]=r;row[8]=b;row[9]=w;row[10]=h;
        row[11]=flags;row[12]=iconGetCount;
    }
    public synchronized void error(){errors++;}
    /** Timeout discards the session; it must never publish while an unacknowledged finger might remain down. */
    public synchronized void expire(){closed=true;expired=true;phase="expired_unpublished";}
    public synchronized boolean settledBefore(long firstSample,long millis){
        return "cancelled".equals(phase)&&lastMoveReceived>0&&firstSample-Math.max(lastMoveReceived,lastWaveMoveReturned)>=millis;
    }
    public static long scaled(float value){return Float.isFinite(value)?Math.round(value*1000):-2147483648L;}

    /** Called before DOWN for ACK, or only after native CANCEL returned; each provider value stays < 2000 chars. */
    public synchronized String json(int part){
        if(!"armed".equals(phase)&&!closed)throw new IllegalStateException("Formatting a held gesture is forbidden");
        StringBuilder s=new StringBuilder(1800);s.append("{\"schema\":1,\"nonce\":\"").append(nonce)
                .append("\",\"phase\":\"").append(phase).append("\",\"pid\":").append(pid)
                .append(",\"build\":").append(build).append(",\"processStarted\":").append(processStarted)
                .append(",\"revision\":").append(revision).append(",\"generation\":").append(generation)
                .append(",\"side\":").append(side).append(",\"downTime\":").append(downTime).append(",\"part\":").append(part);
        if(part==0)s.append(",\"armedAt\":").append(armedAt).append(",\"expiresAt\":").append(expiresAt)
                .append(",\"lastMoveReceived\":").append(lastMoveReceived).append(",\"cancelReceived\":").append(cancelReceived)
                .append(",\"lastWaveMoveReturned\":").append(lastWaveMoveReturned)
                .append(",\"cancelReturned\":").append(cancelReturned).append(",\"eventCount\":").append(eventCount)
                .append(",\"moveCount\":").append(moveCount).append(",\"drawCount\":").append(drawCount)
                .append(",\"onDrawCount\":").append(onDrawCount)
                .append(",\"waveDownCount\":").append(waveDownCount).append(",\"waveDrawCount\":").append(waveDrawCount)
                .append(",\"iconGetCount\":").append(iconGetCount).append(",\"customReturnCount\":").append(customReturnCount)
                .append(",\"overflow\":").append(overflow).append(",\"errors\":").append(errors)
                .append(",\"controllerId\":").append(controllerId).append(",\"viewId\":").append(viewId)
                .append(",\"selectedIcon\":[").append(selectedIcon[0]).append(',').append(selectedIcon[1]).append(',')
                .append(selectedIcon[2]).append(',').append(selectedIcon[3]).append(',').append(selectedIcon[4]).append(']');
        else {
            long[][] rows=part==1?events:part==2?moves:draws;
            int total=part==1?eventCount:part==2?moveCount:drawCount;
            // Draw rows split across two keys; no silent provider truncation.
            int from=part>=3?(part-3)*24:0,limit=part>=3?Math.min(Math.min(total,rows.length),from+24):Math.min(total,rows.length);
            s.append(",\"from\":").append(from).append(",\"rows\":[");
            for(int i=from;i<limit;i++){if(i>from)s.append(',');s.append('[');
                for(int j=0;j<rows[i].length;j++){if(j>0)s.append(',');s.append(rows[i][j]);}s.append(']');}
            s.append(']');
        }
        s.append('}');if(s.length()>2000)throw new IllegalStateException("Probe payload exceeds provider limit");return s.toString();
    }
}
