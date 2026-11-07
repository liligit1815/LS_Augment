"""Execute production keyboard geometry, physical fingerprint scope, level read/write and layout."""
import os,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
def method(file,signature):
    text=(STEP/file).read_text(encoding='utf8');start=text.index(signature);a=text.index('{',start);n=1;b=a+1
    while n:n+=(text[b]=='{')-(text[b]=='}');b+=1
    return text[start:b]
read=method('LevelControl.java','boolean read(')
release=method('LevelControl.java','void releasePreview(')
fingerprint=method('PhysicalFingerprint.java','static boolean matches(')
measure=method('StepControlFace.java','protected void onMeasure(')
harness=r'''
package ls.augment.com.step;
import java.lang.reflect.*;
public class InteractionCases {
    static int checks;
    static void check(boolean x,String m){checks++;if(!x)throw new AssertionError(m);}
    static class WindowManager {static class LayoutParams {static int FIRST_SYSTEM_WINDOW=2000;}}
    FINGERPRINT
    public static class Converter {
        public static float convertGammaToLinearFloat(int p,float min,float max){return min+(max-min)*(p/65535f)*(p/65535f);}
        public static int convertLinearToGammaFloat(float value,float min,float max){return Math.round((float)Math.sqrt((value-min)/(max-min))*65535);}
    }
    public static class Adapter {
        public int getMax(int fallback){return 100;}
        public float convertToBrightVal(float p,float min,float max,float fallback){return p/100;}
        public int convertToSliderVal(float v,float min,float max,int fallback){return Math.round(v*100);}
    }
    static class NativeBrightnessBinding {static Object adapter;static boolean required;}
    public static class Info {public float brightness=.5f,brightnessMinimum=0,brightnessMaximum=1;}
    public static class Panel {Info state=new Info();public Info getBrightnessInfo(){return state;}}
    public static class Display {Panel panel=new Panel();float cap=1,preview=Float.NaN;boolean failRelease;int writes,temporaryWrites;public Panel getDisplay(int id){check(id==0,"physical display");return panel;}
        public void setTemporaryBrightness(int id,float value){check(id==0,"preview targets physical display");if(failRelease && Float.isNaN(value))throw new IllegalStateException("release blocked");preview=value;temporaryWrites++;}
        public void setBrightness(int id,float value){check(id==0,"writes display zero");panel.state.brightness=Math.min(cap,Float.isNaN(preview)?value:preview);writes++;}}
    static class AudioManager {
        static final int STREAM_MUSIC=3;int min,max=15,value=5,writes;boolean mute,fixed;
        int getStreamMinVolume(int stream){check(stream==3,"reads media minimum");return min;}
        int getStreamMaxVolume(int stream){check(stream==3,"reads media maximum");return max;}
        int getStreamVolume(int stream){check(stream==3,"reads media level");return value;}
        boolean isStreamMute(int stream){check(stream==3,"reads media mute");return mute;}
        boolean isVolumeFixed(){return fixed;}
        void setStreamVolume(int stream,int level,int flags){check(stream==3,"writes media only");value=level;mute=false;writes++;}
    }
    static class Updates {void postDelayed(Runnable r,int ms){}}
    static class Level {
        boolean light,previewOwned;AudioManager audio=new AudioManager();Display display=new Display();
        Method info,set,temporary;Field lo,hi,level;NativeBrightnessScale scale;Class<?> converter=Converter.class;
        float fraction;Updates updates=new Updates();Runnable sync=()->{};String diagnostic;
        Level(boolean light)throws Exception{this.light=light;info=Panel.class.getMethod("getBrightnessInfo");set=Display.class.getMethod("setBrightness",int.class,float.class);
            lo=Info.class.getField("brightnessMinimum");hi=Info.class.getField("brightnessMaximum");level=Info.class.getField("brightness");}
        void capability(String s){diagnostic=s;}void scheduleRefresh(){}
        READ
        RELEASE
    }
    static class View {int minimum=60,x,y,w,h;int getMinimumWidth(){return minimum;}}
    static class Base {protected void onMeasure(int w,int h){}Object getContext(){return this;}}
    static class MeasureSpec {static int getSize(int v){return v;}}
    static class StepMaterial {static float density=1;static int dp(Object c,int v){return Math.round(v*density);}}
    static class Face extends Base {
        View network=new View(),device=new View(),volume=new View(),brightness=new View();View[] codes={new View(),new View(),new View()};
        void place(View v,int x,int y,int w,int h){v.x=x;v.y=y;v.w=w;v.h=h;}
        MEASURE
    }
    public static void main(String[] args)throws Exception {
        for(boolean left:new boolean[]{false,true})for(int[] size:new int[][]{{1080,2400},{1220,2712},{2400,1080}}){
            WorkspaceLayout l=new WorkspaceLayout(size[0],size[1],2.5f,left);
            for(float ratio:new float[]{.45f,.6f,.75f}){
                int edge=(int)(size[1]*ratio);int gap=12;
                float top=WorkspaceImeGeometry.top(l,true,edge,edge,gap);
                check(top<=l.top,"keyboard only raises main");check(top+l.mainScale*edge<=edge-gap+.01f,"native resized editor above physical keyboard");
                top=WorkspaceImeGeometry.top(l,true,edge,size[1],gap);
                check(top+l.mainScale*size[1]<=edge-gap+.01f,"adjustNothing full page bottom above keyboard");
            }
            check(WorkspaceImeGeometry.top(l,false,600,600,12)==l.top,"floating or hidden keyboard preserves layout");
            check(WorkspaceImeGeometry.top(l,true,-1,600,12)==l.top,"unknown source preserves layout");
        }
        check(matches("com.fingerprint.sensorservice",2038,"SensorView",true,false),"OEM physical sensor window");
        check(matches("com.zte.fingerprints",2015,"Animation",true,false),"OEM fingerprint animation window");
        check(matches("com.android.systemui",2009,"UdfpsView",true,false),"standard physical sensor overlay");
        check(!matches("com.fingerprint.sensorservice",2038,"SensorView",false,false),"spoofed owner rejected");
        check(!matches("com.zte.fingerprints",1,"Settings",true,true),"theme settings activity still follows app");
        check(!matches("com.android.systemui",2017,"Shade",true,false),"ordinary system UI unaffected");
        check(!matches("some.app",2038,"UdfpsView",true,false),"title alone does not identify fingerprint");
        Level media=new Level(false);check(media.read(false,0) && Math.abs(media.fraction-1f/3)<.001,"media service readback");
        check(media.read(true,.8f) && media.audio.value==12 && media.fraction==.8f,"media write and actual readback");
        media.audio.mute=true;check(media.read(false,0) && media.fraction==0,"muted media displays zero");
        media.audio.fixed=true;check(media.read(false,0),"fixed stream remains readable");check(!media.read(true,.5f) && media.audio.writes==1,"fixed stream cannot write");
        media.audio.fixed=false;media.audio.max=30;media.audio.value=21;media.audio.mute=false;
        check(media.read(false,0) && media.fraction==.7f,"audio route change refreshes current range");
        Level light=new Level(true);check(light.read(false,0) && light.fraction>.7f,"legacy calibrated gamma retained");
        NativeBrightnessBinding.required=true;check(!light.read(false,0),"unknown OEM controller does not guess percentage");
        NativeBrightnessBinding.adapter=new Adapter();check(light.read(false,0) && light.fraction==.5f,"actual OEM conversion selected");
        light.temporary=Display.class.getMethod("setTemporaryBrightness",int.class,float.class);
        light.display.preview=.05f;
        check(light.read(true,.8f) && light.fraction==.8f && light.display.temporaryWrites==1,"Step replaces Settings temporary override before saving");
        light.releasePreview();check(!light.previewOwned && Float.isNaN(light.display.preview),"finish releases only the preview owned by Step");
        light.display.setBrightness(0,.3f);check(light.read(false,0) && light.fraction==.3f,"later native Settings write is not pinned by Step preview");
        light.display.preview=.2f;int writes=light.display.temporaryWrites;light.releasePreview();
        check(light.display.preview==.2f && light.display.temporaryWrites==writes,"read-only Step does not clear another controller preview");
        light.read(true,.4f);light.display.failRelease=true;light.releasePreview();
        check(light.previewOwned && light.diagnostic.startsWith("preview_release_failed"),"failed release stays owned for retry and is diagnosed");
        light.display.failRelease=false;light.releasePreview();check(!light.previewOwned,"retry clears owned preview");
        light.display.cap=.6f;check(light.read(true,.9f) && light.fraction==.6f,"caption follows service clamp, not request");
        light.display.panel.state.brightness=.23f;check(light.read(false,0) && light.fraction==.23f,"external brightness changes read back");
        light.display.panel.state.brightness=Float.NaN;check(!light.read(false,0),"invalid display reading rejected");
        for(float density:new float[]{1,2.5f,3.5f})for(int widthDp:new int[]{360,412,800}){
            StepMaterial.density=density;Face f=new Face();for(View c:f.codes)c.minimum=Math.round(62*density);
            f.onMeasure(Math.round(widthDp*density),Math.round(116*density));
            check(f.brightness.x==f.volume.x && f.brightness.w==f.volume.w,"level bars share horizontal span");
            check(f.brightness.y+f.brightness.h<f.volume.y,"brightness above media volume");
            check(f.brightness.h>=44*density && f.volume.h>=44*density,"both controls keep usable touch height");
        }
        for(float density:new float[]{1,2.5f,3.25f})for(int widthDp:new int[]{360,800}){
            StepMaterial.density=density;Face f=new Face();for(View c:f.codes)c.minimum=Math.round(62*density);
            f.brightness.minimum=Math.round(120*density);f.volume.minimum=Math.round(144*density);
            int width=Math.round(widthDp*density);f.onMeasure(width,Math.round(73*density));
            check(f.brightness.w==f.volume.w && f.brightness.x+f.brightness.w==width,"scaled level captions retain equal aligned bounds");
            check(f.device.x+f.device.w<f.brightness.x,"wider level controls never overlap center actions");
            check(f.device.w>=Math.min(width/2,3*Math.round(62*density)),"center actions retain their allocation under the existing half-width cap");
            if(widthDp==800)check(f.volume.w>=f.volume.minimum,"wide short deck uses available width for enlarged caption");
        }
        for(boolean left:new boolean[]{false,true}){
            check(WorkspaceMotion.targetLeft(left,1,2)!=left,"occupied exchange changes sides");
            check(WorkspaceMotion.targetLeft(left,-1,2)==left,"desktop promotion stays in main region");
            check(WorkspaceMotion.targetLeft(left,1,-1)==left,"empty side collection retains direction");
        }
        System.out.println("PASS "+checks+" Step interaction checks: keyboard, fingerprint identity, media readback, OEM brightness and stacked controls");
    }
}
'''.replace('FINGERPRINT',fingerprint).replace('READ',read).replace('RELEASE',release).replace('MEASURE',measure)
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-interactions-') as temp:
    folder=Path(temp);file=folder/'InteractionCases.java';file.write_text(harness,encoding='utf8')
    sources=[STEP/(n+'.java') for n in ['NativeBrightnessScale','WorkspaceLayout','WorkspaceMotion','WorkspaceImeGeometry','PreviewGeometry']]
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,file,*sources],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.InteractionCases'],check=True)
