"""Actual carrier/Grid companion methods on Android layout facades; not device proof."""
from pathlib import Path
import ast, os, shutil, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
tree=ast.parse((ROOT/'tools/test-carrier-text-runtime.py').read_text(encoding='utf-8'))
FILES=next(ast.literal_eval(n.value) for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='FILES' for t in n.targets))

def method(source,signature):
    start=source.index(signature);begin=source.index('{',start);depth=1;i=begin+1
    while depth:
        if source[i]=='{':depth+=1
        elif source[i]=='}':depth-=1
        i+=1
    return source[start:i]

grid=(ROOT/'android/app/src/main/java/ls/augment/com/hook/StatusBarGridHook.java').read_text(encoding='utf-8')
geometry=method(grid,'private static final class Geometry')
native=method(grid,'static void carrierNativeFrame(')
overlay=method(grid,'static boolean isCarrierGridOverlay(')
companion=method(grid,'void addCompanion(')
independent=method(grid,'void addIndependentCarrier(')
FILES['ls/augment/com/hook/StatusBarGridHook.java']='''package ls.augment.com.hook;
import android.view.*;import android.widget.*;import android.graphics.*;import java.util.*;import ls.augment.com.*;
final class StatusBarGridHook {
static final Map<View,State> STATES=new IdentityHashMap<>();
static State stateFor(View view){for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)if(STATES.containsKey(at))return STATES.get(at);return null;}
'''+native+overlay+geometry+'''
static class State {
final ViewGroup root;final Map<View,Geometry> geometry=new IdentityHashMap<>();final Map<View,Rect> contentBounds=new IdentityHashMap<>();final StatusBarGridSpec spec=new StatusBarGridSpec();View overlay,connectivityIcon;
State(ViewGroup root){this.root=root;STATES.put(root,this);}Geometry own(View view){Geometry g=geometry.get(view);if(g==null){g=new Geometry(view);geometry.put(view,g);}return g;}
boolean visibleInRoot(View view){return view.getVisibility()==View.VISIBLE;}boolean showItem(String name){return true;}boolean positionOnly(){return false;}int px(float value){return Math.round(value*2);}float nativeIconHeight(View view,float fallback){return fallback;}
Rect iconBounds(View view){return new Rect(0,0,view.getWidth(),view.getHeight());}
void addInsetNode(List<StatusBarGridLayout.Node> nodes,String id,String zone,int order,float width,float height,float baseline,View view){nodes.add(new StatusBarGridLayout.Node(id,zone,order,width,height,baseline));}
'''+companion+independent+'''
void restore(TextView view){own(view).restore(view);}
}}
'''
FILES['ls/augment/com/StatusBarGridSpec.java']='''package ls.augment.com;public class StatusBarGridSpec {public final Item item=new Item();public Item get(String name){return item;}public static class Item {public String zone="L1";public int size=10,order=0;}}'''
FILES['ls/augment/com/hook/StatusBarContentBounds.java']='''package ls.augment.com.hook;public class StatusBarContentBounds {static float wifiSignalHeight(android.view.View view){return 0;}}'''
view=FILES['android/view/View.java']
view=view.replace('public int getWidth()', '''public float tx,ty,sx=1,sy=1;public int measuredWidth=80,measuredHeight=20,layoutCalls,invalidates;public boolean requested;
public float getTranslationX(){return tx;}public float getTranslationY(){return ty;}public float getScaleX(){return sx;}public float getScaleY(){return sy;}public void setTranslationX(float v){tx=v;}public void setTranslationY(float v){ty=v;}public void setScaleX(float v){sx=v;}public void setScaleY(float v){sy=v;}public void setAlpha(float v){alpha=v;}
public int getScrollX(){return 0;}public int getScrollY(){return 0;}public void scrollTo(int x,int y){}public int getLeft(){return x;}public int getTop(){return y;}public int getRight(){return x+width;}public int getBottom(){return y+height;}public int getMeasuredWidth(){return measuredWidth;}public int getMeasuredHeight(){return measuredHeight;}public boolean isLayoutRequested(){return requested;}
public static class MeasureSpec {public static final int EXACTLY=0x40000000,AT_MOST=0x80000000,UNSPECIFIED=0;public static int makeMeasureSpec(int size,int mode){return size|mode;}public static int getSize(int spec){return spec&0x3fffffff;}public static int getMode(int spec){return spec&0xc0000000;}}
public void measure(int w,int h){measuredWidth=MeasureSpec.getSize(w);measuredHeight=MeasureSpec.getSize(h);}public void layout(int l,int t,int r,int b){x=l;y=t;width=r-l;height=b-t;requested=false;layoutCalls++;}public void invalidate(){invalidates++;}
public int getWidth()''')
FILES['android/view/View.java']=view
FILES['android/text/Layout.java']=FILES['android/text/Layout.java'].replace('public int getLineCount()', 'public int getHeight(){return height;}public int getLineCount()')
text=FILES['android/widget/TextView.java']
text=text.replace('public CharSequence getText()', '''public Layout layout=new Layout(0,80);public int baseline=15;public Layout getLayout(){return layout;}public int getBaseline(){return baseline;}public int getTotalPaddingLeft(){return paddingLeft;}public int getTotalPaddingRight(){return paddingRight;}public int getTotalPaddingTop(){return 0;}
@Override public void measure(int w,int h){int wanted=(int)Math.ceil(getPaint().measureText(getText().toString()))+paddingLeft+paddingRight;int mode=MeasureSpec.getMode(w);measuredWidth=mode==MeasureSpec.EXACTLY?MeasureSpec.getSize(w):Math.min(wanted,Math.min(maxWidth,MeasureSpec.getSize(w)));measuredHeight=MeasureSpec.getMode(h)==MeasureSpec.EXACTLY?MeasureSpec.getSize(h):(int)Math.ceil(size*1.4f)+10;baseline=(int)size+4;layout=new Layout(0,Math.min(wanted,measuredWidth));}
public CharSequence getText()''')
FILES['android/widget/TextView.java']=text
FILES['ls/augment/com/hook/CarrierTextHook.java']=(ROOT/'android/app/src/main/java/ls/augment/com/hook/CarrierTextHook.java').read_text(encoding='utf-8')
for name in ('StatusBarGridLayout','StatusBarAdaptiveLayout'):
    FILES['ls/augment/com/'+name+'.java']=(ROOT/('android/app/src/main/java/ls/augment/com/'+name+'.java')).read_text(encoding='utf-8')
FILES['ls/augment/com/hook/TestCarrierGrid.java']=r'''
package ls.augment.com.hook;
import android.view.*;import android.widget.*;import android.graphics.*;import java.util.*;import ls.augment.com.*;import com.android.systemui.statusbar.phone.KeyguardStatusBarView;
public class TestCarrierGrid {
static int checks;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
static void put(String key,String value){FeatureSettings.put(CarrierTextOptions.key("lock",key),value);}
static StatusBarGridLayout.Node run(StatusBarGridHook.State grid,TextView text){
List<StatusBarGridLayout.Node> nodes=new ArrayList<>();Map<String,View> views=new HashMap<>();
grid.addCompanion(nodes,views,"clock.carrier","clock",text,-11,false);
check(nodes.size()==1,"one independent carrier provisional box");StatusBarGridLayout.Node preferred=nodes.remove(0);
grid.addIndependentCarrier(nodes,views,text,grid.spec.item,-11,(int)preferred.width+text.getTotalPaddingLeft()+text.getTotalPaddingRight());
check(nodes.size()==1&&views.get("clock.carrier")==text,"actual native text is the final packed view");
return nodes.get(0);
}
public static void main(String[] args){
KeyguardStatusBarView root=new KeyguardStatusBarView();root.width=1216;root.height=130;
TextView text=root.mCarrierLabel;text.x=52;text.y=7;text.width=598;text.height=123;text.measuredWidth=598;text.measuredHeight=123;text.setMaxWidth(377);
View icons=new View();icons.x=650;icons.width=566;icons.height=130;root.addView(icons);
StatusBarGridHook.State grid=new StatusBarGridHook.State(root);grid.overlay=new ViewGroup();grid.overlay.x=0;grid.overlay.width=1216;grid.overlay.height=130;root.addView(grid.overlay);
CarrierTextHook.bindHeader(root);put("enabled","1");put("mode","1");
String longText="锁屏长文字边界验证 红魔Duo 红魔Duo 红魔Duo 红魔Duo 红魔Duo";
int[][] states={{13,0},{13,1},{40,0},{40,1},{13,0}};
for(int[] state:states){
put("size",Integer.toString(state[0]));put("text",state[1]==0?"DUO LOCK":longText);
StatusBarGridLayout.Node node=run(grid,text);
check(text.getTextSize()==state[0]*2,"requested sp remains unchanged "+Arrays.toString(state));
check(node.height==(int)(text.getTextSize()*.8f)&&node.height>10,"visible glyph height independent of clock's 20px icon size");
check(node.zone.equals("LS"),"independent carrier reserves header height, not just clock top row");
check(node.width<=377&&node.width>20,"long text is ellipsized to a finite readable allocation");
int layouts=text.layoutCalls,invalidations=text.invalidates;
for(int i=0;i<35;i++){
text.setTranslationX(-300+i);text.setScaleX(.01f+i*.001f);text.setScaleY(.01f);icons.setTranslationX(-600+i);
text.getViewTreeObserver().draw();StatusBarGridLayout.Node next=run(grid,text);
check(next.width==node.width&&next.height==node.height,"prior visual transforms cannot shrink the next measured box");
}
check(text.layoutCalls==layouts&&text.invalidates==invalidations,"stable frames never relayout full width then shrink again");
Rect nativeFrame=new Rect();StatusBarGridHook.carrierNativeFrame(text,nativeFrame);
check(nativeFrame.left==52&&nativeFrame.top==7&&nativeFrame.width()==598&&nativeFrame.height()==123,"manual measurement retains OEM MATCH_PARENT baseline");
}
text.setText("OEM latest SIM");View.drain();put("enabled","0");grid.restore(text);
check(text.getText().toString().equals("OEM latest SIM")&&text.getTextSize()==14&&text.getMaxWidth()==377,"disable restores latest OEM text and font style");
check(text.x==52&&text.y==7&&text.width==598&&text.height==123,"disable restores complete original native frame");
// A real native relayout after rotation supersedes the pre-rotation baseline.
put("enabled","1");put("size","13");run(grid,text);text.layout(60,12,410,140);text.measuredWidth=350;text.measuredHeight=128;
run(grid,text);grid.restore(text);check(text.x==60&&text.y==12&&text.width==350&&text.height==128,"latest native rotation frame wins over old grid measurements");
text.direction=View.LAYOUT_DIRECTION_RTL;text.x=500;text.width=300;icons.x=200;icons.width=200;run(grid,text);
int nativeWidth=CarrierTextHook.gridWidth(text);text.setTranslationX(-480);text.setScaleX(.005f);run(grid,text);
check(CarrierTextHook.gridWidth(text)==nativeWidth,"RTL anchor remains stable while carrier has old tiny transform");
text.detach();System.out.println("PASS real Grid companion/measurement ownership: "+checks+" checks; Android/OEM facade only");
}}
'''

def java_tool(name):
    found=shutil.which(name)
    if found:return found
    return str(Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'/(name+'.exe'))

with tempfile.TemporaryDirectory(prefix='duo-carrier-grid-') as directory:
    tmp=Path(directory)
    for name,source in FILES.items():
        path=tmp/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf-8')
    subprocess.run([java_tool('javac'),'-encoding','UTF-8','-d',str(tmp/'classes')]+[str(tmp/name) for name in FILES],check=True)
    subprocess.run([java_tool('java'),'-cp',str(tmp/'classes'),'ls.augment.com.hook.TestCarrierGrid'],check=True)
