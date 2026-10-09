package ls.augment.com;

import android.os.Bundle;

/** Ephemeral readback, never configuration or evidence from the diagnostic cache. */
public final class AudioGainState {
    public static final String DESCRIPTOR="ls.augment.com.audio.gain.read.v1";
    public static final String REGISTER="audio_gain_state_register", GET="audio_gain_state_get";
    public static final String REDISCOVER="ls.augment.com.AUDIO_GAIN_STATE_REDISCOVER";
    public static final long MAX_AGE_MS=1500;
    public final int version,boot,stream,device,base,nativeLevel,current,total,step,limit;
    public final long sampled,request;
    public final String route,configuration;
    public final boolean enabled,muted;
    public AudioGainState(int version,int boot,long sampled,long request,int stream,int device,String route,
            String configuration,boolean enabled,boolean muted,int base,int nativeLevel,int current,int total,int step,int limit){
        this.version=version;this.boot=boot;this.sampled=sampled;this.request=request;this.stream=stream;this.device=device;
        this.route=route;this.configuration=configuration;this.enabled=enabled;this.muted=muted;this.base=base;
        this.nativeLevel=nativeLevel;this.current=current;this.total=total;this.step=step;this.limit=limit;
    }
    public boolean extended(){return enabled&&!route.isEmpty()&&limit>100;}
    public boolean valid(int version,int boot,long now,int stream,String configuration){
        if(this.version!=version||boot<0||this.boot!=boot||this.stream!=stream||AudioGainPolicy.stream(stream).isEmpty()
                ||!this.configuration.equals(configuration)||sampled<0||now<sampled||now-sampled>MAX_AGE_MS
                ||base<1||base>10000||nativeLevel<0||nativeLevel>base||step<1||step>20||limit<100||limit>300
                ||!(route.isEmpty()||route.equals("speaker")||route.equals("wired")||route.equals("bluetooth")))return false;
        String[] options=configuration.split("\\|",-1);
        if(options.length!=5||enabled!=ConfigSchema.truthy(options[0])||step!=number(options[1],5,1,20))return false;
        int routeIndex=route.equals("speaker")?2:route.equals("wired")?3:route.equals("bluetooth")?4:-1;
        if(limit!=(routeIndex<0?100:number(options[routeIndex],100,100,300)))return false;
        int extra=extended()?AudioGainPolicy.extraSteps(limit,step):0;
        if(total!=base+extra||current<0||current>total||current<nativeLevel)return false;
        if(muted||nativeLevel==0)return current==0;
        return current==nativeLevel||nativeLevel==base&&current>base&&extended();
    }
    public int percent(){return current<=base?(int)(((long)current*100+base/2)/base):AudioGainPolicy.percent(current-base,step,limit);}
    public Bundle bundle(){Bundle b=new Bundle();b.putInt("version",version);b.putInt("boot",boot);b.putLong("sampled",sampled);b.putLong("request",request);
        b.putInt("stream",stream);b.putInt("device",device);b.putString("route",route);b.putString("configuration",configuration);
        b.putBoolean("enabled",enabled);b.putBoolean("muted",muted);b.putInt("base",base);b.putInt("native",nativeLevel);b.putInt("current",current);
        b.putInt("total",total);b.putInt("step",step);b.putInt("limit",limit);return b;}
    public static AudioGainState parse(Bundle b){if(b==null||b.size()!=16)return null;try{return new AudioGainState(b.getInt("version",-1),b.getInt("boot",-1),b.getLong("sampled",-1),b.getLong("request",-1),
        b.getInt("stream",-1),b.getInt("device",-1),b.getString("route","?"),b.getString("configuration",""),b.getBoolean("enabled"),b.getBoolean("muted"),
        b.getInt("base",-1),b.getInt("native",-1),b.getInt("current",-1),b.getInt("total",-1),b.getInt("step",-1),b.getInt("limit",-1));}catch(RuntimeException e){return null;}}
    /** Bind all routes for this stream so a same-total step/route change cannot reuse a reply. */
    public static String configuration(ConfigSnapshot s,int stream){StringBuilder b=new StringBuilder(s.get(ConfigSchema.AUDIO_GAIN_ENABLED)).append('|').append(s.get(ConfigSchema.AUDIO_GAIN_STEP));
        for(String route:new String[]{"speaker","wired","bluetooth"})b.append('|').append(s.get(AudioGainPolicy.key(route,stream)));return b.toString();}
    public static boolean wanted(ConfigSnapshot s,int stream){if(AudioGainPolicy.stream(stream).isEmpty()||!ConfigSchema.truthy(s.get(ConfigSchema.AUDIO_GAIN_ENABLED)))return false;
        for(String r:new String[]{"speaker","wired","bluetooth"})if(number(s.get(AudioGainPolicy.key(r,stream)),100,100,300)>100)return true;return false;}
    public static int number(String s,int fallback,int min,int max){try{return Math.max(min,Math.min(max,Integer.parseInt(s)));}catch(RuntimeException e){return fallback;}}
}
