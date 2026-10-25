"""Exercise the Activity's real radius UI transitions without Android/device I/O.

Extract production build/reset, render, start/stop, cache load/apply and listeners.
Only widgets, preferences, execution queues, cache storage and save boundaries
are doubles; persistent-range validation has its own pure-model coverage.
"""
from pathlib import Path
import os
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'


def block(source, marker):
    start = source.index('{', source.index(marker))
    # Ignore comments and literals so braces in help text do not end extraction.
    tokens = re.finditer(r'//[^\n]*|/\*[\s\S]*?\*/|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|[{}]', source[start:])
    depth = 0
    for token in tokens:
        if token.group() == '{':
            depth += 1
        elif token.group() == '}':
            depth -= 1
            if depth == 0:
                return source[start + 1:start + token.start()]
    raise AssertionError('Unclosed production block: ' + marker)


def harness(source):
    # The unrelated launcher runtime field was retired; the next live field still
    # delimits exactly the radius controls, range state and preference listener.
    declarations = source[source.index('    private SeekBar recentsRadiusSlider;'):source.index('    private LinearLayout updateLinksContent;')]
    methods = '\n'.join(signature + '{' + block(source, signature) + '}' for signature in (
        'private static String signedRadius(int value)',
        'private void renderRecentsRadiusValue()',
        'private void startRecentsRadiusRange()',
        'private void stopRecentsRadiusRange()',
        'private void applyRecentsRadiusRange(RecentsCardRadiusUiRange range)',
        'private void loadRecentsRadiusRange()',
    ))
    reset = block(source, 'private void render(int previousY)').split('if(liftArcEditor', 1)[0]
    inputs = source[source.index('if(CollabOptions.THEME_VARIANT.equals(option.key))'):]
    build = block(inputs, 'if(RecentsCardRadiusOptions.OFFSET.equals(option.key))')
    return TEMPLATE.replace('/*FIELDS*/', declarations).replace('/*METHODS*/', methods).replace('/*RESET*/', reset).replace('/*BUILD*/', build)


TEMPLATE = r'''package ls.augment.com;
import java.util.*;
public class TestRecentsRadiusLoadingUi {
    /*FIELDS*/
    /*METHODS*/
    final Queue main=new Queue(false),worker=new Queue(true); final Ui ui=new Ui();
    final SharedPreferences preferences=new SharedPreferences();
    final Resources resources=new Resources(); Display display=new Display();
    final Map<String,View> controls=new HashMap<>();
    static final int MODE_PRIVATE=0;
    static boolean onWorker;
    int saved=-6,writes,flushes,cacheReads; boolean destroyed,finishing;
    RecentsCardRadiusUiRange storedRange;
    String value(String key){return String.valueOf(saved);}
    boolean isDestroyed(){return destroyed;} boolean isFinishing(){return finishing;}
    void change(String key,String next,View source){saved=Integer.parseInt(next);writes++;}
    void flush(){flushes++;}
    SharedPreferences getSharedPreferences(String name,int mode){return preferences;}
    TestRecentsRadiusLoadingUi getApplicationContext(){return this;}
    Display getDisplay(){return display;} Resources getResources(){return resources;}
    void build(){
        /*RESET*/
        recentsRadiusValue=new TextView();
        EnhancementOption option=RecentsCardRadiusOptions.options().get(1);
        LinearLayout row=new LinearLayout();
        /*BUILD*/
    }
    static final String MISSING="请先进入一次最近任务，读取卡片圆角范围";
    static int checks;
    static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
    static void quiet(TestRecentsRadiusLoadingUi h,String why){
        check(h.recentsRadiusStatus.visibility==View.GONE&&h.recentsRadiusStatus.text.isEmpty(),why+": status hidden");
        check(!h.recentsRadiusSlider.state.contains(MISSING),why+": no false accessibility failure");
    }
    static TestRecentsRadiusLoadingUi fresh(int value){
        TestRecentsRadiusLoadingUi h=new TestRecentsRadiusLoadingUi();h.saved=value;h.build();return h;
    }
    static RecentsCardRadiusUiRange range(int min,int max){
        // Store returns an already verified model. Its validation is tested separately.
        try{var c=RecentsCardRadiusUiRange.class.getDeclaredConstructor(int.class,int.class);c.setAccessible(true);return c.newInstance(min,max);}
        catch(ReflectiveOperationException e){throw new AssertionError(e);}
    }
    static void settle(TestRecentsRadiusLoadingUi h){h.worker.runNext();h.main.runNext();}
    static TestRecentsRadiusLoadingUi ready(int value){
        TestRecentsRadiusLoadingUi h=fresh(value);h.storedRange=range(-16,96);h.startRecentsRadiusRange();settle(h);return h;
    }
    static void publish(TestRecentsRadiusLoadingUi h,RecentsCardRadiusUiRange range){
        h.storedRange=range;h.preferences.changed(RecentsCardRadiusStore.KEY);
    }
    public static void main(String[] args){
        TestRecentsRadiusLoadingUi h=fresh(-6);
        quiet(h,"build first frame");
        check(!h.recentsRadiusSlider.isEnabled(),"build slider disabled");
        check(h.recentsRadiusValue.text.equals("圆角偏移 -6 dp"),"build keeps saved signed title");
        h.storedRange=range(-16,96);h.startRecentsRadiusRange();quiet(h,"resume first frame");
        check(h.preferences.listeners.size()==1,"listener registered before reading");
        check(h.cacheReads==0&&h.worker.tasks.size()==1,"one asynchronous initial cache read");
        h.worker.runNext();quiet(h,"worker result pending UI delivery");
        check(h.cacheReads==1&&!h.recentsRadiusSlider.isEnabled(),"worker did not mutate widgets");
        h.main.runNext();quiet(h,"cache result accepted immediately");
        check(h.recentsRadiusSlider.isEnabled()&&h.recentsRadiusSlider.getProgress()==-6,"cache initializes correct thumb");
        check(h.main.tasks.isEmpty()&&h.worker.tasks.isEmpty(),"no delayed acceptance or repeat polling");
        check(!h.recentsRadiusStatus.everVisible&&h.writes==0,"valid cache never flashes failure or writes config");

        h.startRecentsRadiusRange();quiet(h,"resume retains loaded range");
        check(h.recentsRadiusSlider.isEnabled()&&h.recentsRadiusSlider.getProgress()==-6,"refresh does not disable/reset loaded thumb");
        check(h.preferences.listeners.size()==1&&h.worker.tasks.size()==1,"resume replaces listener and reads once");settle(h);
        h.preferences.changed("unrelated");check(h.worker.tasks.isEmpty(),"unrelated preference does not reload");
        publish(h,range(-8,20));
        check(h.recentsRadiusSlider.min==-16&&h.recentsRadiusSlider.isEnabled(),"old valid range usable during refresh");
        settle(h);check(h.recentsRadiusSlider.min==-8&&h.recentsRadiusSlider.max==20,"preference update changes endpoints");quiet(h,"updated cache");
        h.storedRange=null;h.preferences.changed(null);settle(h);
        check(!h.recentsRadiusSlider.isEnabled()&&h.recentsRadiusStatus.text.equals(MISSING),"clear notification invalidates loaded range");
        check(h.saved==-6&&h.writes==0,"invalidated cache preserves saved offset");

        h=fresh(-6);h.startRecentsRadiusRange();quiet(h,"first missing-cache read pending");settle(h);
        check(h.recentsRadiusStatus.visibility==View.VISIBLE&&h.recentsRadiusStatus.text.equals(MISSING),"completed first cache miss shows actionable prompt");
        check(h.recentsRadiusSlider.state.contains(MISSING)&&!h.recentsRadiusSlider.isEnabled(),"cache miss accessibility and disabled state");
        check(h.cacheReads==1&&h.main.tasks.isEmpty()&&h.worker.tasks.isEmpty(),"cache miss has no polling");
        publish(h,range(-16,96));settle(h);quiet(h,"new stored measurement recovers without reopening");

        h=ready(0);publish(h,range(-8,30));h.worker.runNext();
        publish(h,range(-4,13));h.worker.runNext();h.main.runLast();h.main.runNext();
        check(h.recentsRadiusSlider.min==-4&&h.recentsRadiusSlider.max==13,"older posted result cannot replace newest range");
        publish(h,null);h.worker.runNext();h.stopRecentsRadiusRange();
        check(h.preferences.listeners.isEmpty()&&h.recentsRadiusPreferences==null,"pause unregisters and releases preference listener");
        h.main.runNext();quiet(h,"paused callback ignored");
        int reads=h.cacheReads;h.preferences.changed(RecentsCardRadiusStore.KEY);
        h.recentsRadiusListener.onSharedPreferenceChanged(h.preferences,RecentsCardRadiusStore.KEY);
        check(h.worker.tasks.isEmpty()&&h.cacheReads==reads,"paused listener cannot schedule work");
        h.storedRange=range(-16,96);h.startRecentsRadiusRange();settle(h);quiet(h,"resume accepts new current result");

        h=ready(-6);h.recentsRadiusSlider.start();h.recentsRadiusSlider.userProgress(50);
        publish(h,range(-4,13));settle(h);
        check(h.recentsRadiusSlider.max==96&&h.recentsRadiusSlider.getProgress()==50,"range shrink deferred during drag");
        check(h.saved==50&&h.writes==1&&h.recentsRadiusUpdatePending,"drag value unchanged by deferred range");
        publish(h,range(-5,17));settle(h);h.recentsRadiusSlider.stop();
        check(h.saved==50&&h.writes==2&&h.flushes==1,"release saves old-range gesture before applying pending sample");
        check(h.recentsRadiusSlider.min==-5&&h.recentsRadiusSlider.max==17&&h.recentsRadiusSlider.getProgress()==17,"only latest deferred range applied at release");
        check(h.recentsRadiusValue.text.equals("圆角偏移 +50 dp")&&h.recentsRadiusStatus.text.contains("+17 dp"),"shrink projects thumb but keeps saved title and explanation");
        h.recentsRadiusSlider.start();h.recentsRadiusSlider.stop();
        check(h.saved==17&&h.writes==3,"explicit endpoint gesture can save projected endpoint");quiet(h,"saved endpoint");

        h=ready(-6);h.recentsRadiusSlider.start();h.recentsRadiusSlider.userProgress(8);
        publish(h,null);settle(h);
        check(h.recentsRadiusSlider.isEnabled()&&h.recentsRadiusUpdatePending,"cache removal is deferred during drag too");
        h.recentsRadiusSlider.stop();check(h.saved==8&&!h.recentsRadiusSlider.isEnabled(),"release retains gesture value then disables invalid cache");
        check(h.recentsRadiusStatus.text.equals(MISSING),"deferred null is distinct from no update");
        h=ready(-6);h.recentsRadiusSlider.start();publish(h,range(-4,13));settle(h);h.stopRecentsRadiusRange();
        check(!h.recentsRadiusTracking&&!h.recentsRadiusUpdatePending&&h.recentsRadiusPendingRange==null,"pause discards drag and deferred range");

        for(int saved:new int[]{-200,200,0}){
            h=ready(saved);
            check(h.saved==saved&&h.writes==0,"range projection never rewrites saved "+saved);
            check(h.recentsRadiusValue.text.equals("圆角偏移 "+signedRadius(saved)),"title retains actual saved value "+saved);
            if(saved==0){quiet(h,"zero original");check(h.recentsRadiusSlider.state.contains("原厂"),"zero accessibility retains original semantics");}
            else{
                int endpoint=saved<0?-16:96;
                check(h.recentsRadiusSlider.getProgress()==endpoint,"out-of-range thumb projected");
                check(h.recentsRadiusStatus.visibility==View.VISIBLE&&h.recentsRadiusStatus.text.contains(signedRadius(endpoint))&&h.recentsRadiusStatus.text.contains("调节后保存"),"out-of-range explanation visible");
                h.recentsRadiusSlider.start();h.recentsRadiusSlider.stop();
                check(h.saved==endpoint&&h.writes==1&&h.flushes==1,"explicit endpoint gesture saves even unchanged thumb");quiet(h,"saved endpoint");
            }
        }
        h=ready(-6);h.recentsRadiusSlider.userProgress(8);
        check(h.saved==8&&h.recentsRadiusValue.text.equals("圆角偏移 +8 dp"),"user change updates signed title live");
        publish(h,null);h.worker.runNext();h.build();quiet(h,"rebuild first frame");
        h.startRecentsRadiusRange();h.main.runNext();quiet(h,"old-view callback ignored");
        check(!h.recentsRadiusSlider.isEnabled(),"old-view completion cannot enable replacement widget");
        for(boolean destroyed:new boolean[]{true,false}){
            h=fresh(-6);h.startRecentsRadiusRange();h.worker.runNext();h.destroyed=destroyed;h.finishing=!destroyed;
            h.main.runNext();quiet(h,"closed activity ignores cache completion");
        }
        h=fresh(-6);h.storedRange=range(-16,96);h.startRecentsRadiusRange();h.worker.runNext();
        h.display=null;h.preferences.changed(RecentsCardRadiusStore.KEY);h.main.runNext();
        check(!h.recentsRadiusSlider.isEnabled()&&h.recentsRadiusStatus.text.equals(MISSING),"unavailable display invalidates earlier posted result");
        check(h.cacheReads==1&&h.worker.tasks.isEmpty(),"unavailable display does not read cache");
        System.out.println("PASS Recents radius cached UI "+checks+" checks (production load/apply/listeners; no Android/device)");
    }
    static class Queue {
        final boolean background;final List<Runnable> tasks=new ArrayList<>();boolean shutdown;
        Queue(boolean background){this.background=background;}boolean isShutdown(){return shutdown;}
        void execute(Runnable r){tasks.add(r);}void post(Runnable r){tasks.add(r);}
        void postDelayed(Runnable r,long delay){throw new AssertionError("fixed waits/polling must not return");}
        void runNext(){run(0);}void runLast(){run(tasks.size()-1);}
        void run(int index){Runnable r=tasks.remove(index);boolean old=onWorker;onWorker=background;try{r.run();}finally{onWorker=old;}}
    }
    static class SharedPreferences {
        interface OnSharedPreferenceChangeListener {void onSharedPreferenceChanged(SharedPreferences preferences,String key);}
        final Set<OnSharedPreferenceChangeListener> listeners=new HashSet<>();
        void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){listeners.add(l);}
        void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){listeners.remove(l);}
        void changed(String key){for(var l:new ArrayList<>(listeners))l.onSharedPreferenceChanged(this,key);}
    }
    static class RecentsCardRadiusStore {
        static final String PREFS="private-range",KEY="range";
        static RecentsCardRadiusUiRange load(TestRecentsRadiusLoadingUi h,int dpi,int width,int height){
            if(!onWorker)throw new AssertionError("cache read on UI thread");
            if(!h.preferences.listeners.contains(h.recentsRadiusListener))throw new AssertionError("listener not registered before read");
            if(dpi!=520||width!=1216||height!=2688)throw new AssertionError("display geometry not forwarded");
            h.cacheReads++;return h.storedRange;
        }
    }
    static class Display {void getRealMetrics(android.util.DisplayMetrics m){m.widthPixels=1216;m.heightPixels=2688;}}
    static class Resources {android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}
    static class View {static final int VISIBLE=0,GONE=8;int visibility=VISIBLE;void setTag(Object tag){}void setVisibility(int v){if(onWorker)throw new AssertionError("widget write on worker");visibility=v;}}
    static class TextView extends View {String text="";boolean everVisible;void setText(String s){text=s;record();}@Override void setVisibility(int v){super.setVisibility(v);record();}void record(){if(visibility==VISIBLE&&!text.isEmpty())everVisible=true;}}
    static class LinearLayout extends View {void addView(View v,Object params){}}
    static class Ui {int muted,accent;SeekBar slider(){return new SeekBar(this);}TextView text(String t,int size,int color,boolean bold){TextView v=new TextView();v.setText(t);return v;}Object wrap(){return null;}int dp(int value){return value;}}
    static class SeekBar extends View {
        int min,max=100,progress;boolean enabled=true;String state="";OnSeekBarChangeListener listener;
        SeekBar(Object context){}void setMin(int v){min=v;}void setMax(int v){max=v;}
        void setEnabled(boolean value){enabled=value;}boolean isEnabled(){return enabled;}
        void setKeyProgressIncrement(int value){}void setMinHeight(int value){}void setMinimumHeight(int value){}
        void setContentDescription(String text){}void setProgressTintList(Object color){}void setThumbTintList(Object color){}
        void setStateDescription(String text){state=text;}int getProgress(){return progress;}
        void setProgress(int value){progress=Math.max(min,Math.min(max,value));if(listener!=null)listener.onProgressChanged(this,progress,false);}
        void userProgress(int value){progress=value;listener.onProgressChanged(this,value,true);}
        void start(){listener.onStartTrackingTouch(this);}void stop(){listener.onStopTrackingTouch(this);}
        void setOnSeekBarChangeListener(OnSeekBarChangeListener value){listener=value;}
        interface OnSeekBarChangeListener {void onStartTrackingTouch(SeekBar b);void onStopTrackingTouch(SeekBar b);void onProgressChanged(SeekBar b,int progress,boolean user);}
    }
}
'''


def main():
    source = (JAVA / 'EnhancementSettingsActivity.java').read_text(encoding='utf-8')
    with tempfile.TemporaryDirectory(prefix='lsa-radius-loading-') as directory:
        folder = Path(directory)
        generated = folder / 'TestRecentsRadiusLoadingUi.java'
        generated.write_text(harness(source), encoding='utf-8')
        colors = folder / 'ColorStateList.java'
        colors.write_text('package android.content.res; public class ColorStateList { public static ColorStateList valueOf(int color){return new ColorStateList();}}', encoding='utf-8')
        metrics = folder / 'DisplayMetrics.java'
        metrics.write_text('package android.util; public class DisplayMetrics { public int densityDpi=520,widthPixels,heightPixels; }', encoding='utf-8')
        home = os.environ.get('JAVA_HOME')
        def java_tool(name):
            return str(Path(home) / 'bin' / (name + ('.exe' if os.name == 'nt' else ''))) if home else name
        production = [JAVA / (name + '.java') for name in ('EnhancementOption', 'RecentsCardRadiusOptions', 'RecentsCardRadiusRange', 'RecentsCardRadiusUiRange')]
        subprocess.run([java_tool('javac'), '-encoding', 'UTF-8', '--release', '17', '-d', str(folder), str(generated), str(colors), str(metrics), *map(str, production)], check=True)
        subprocess.run([java_tool('java'), '-cp', str(folder), 'ls.augment.com.TestRecentsRadiusLoadingUi'], check=True)


if __name__ == '__main__':
    main()
