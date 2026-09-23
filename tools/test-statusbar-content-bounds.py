"""Run the actual content-bounds walker against small Android drawing doubles.

No device or Android runtime is required. Matrices use affine point mapping,
RectF union ignores empty areas, and roundOut follows Android's outward rounding.
"""
from pathlib import Path
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
SOURCES = {
    'android/graphics/Rect.java': '''package android.graphics;
public class Rect {
 public int left,top,right,bottom;
 public Rect(){}public Rect(int l,int t,int r,int b){set(l,t,r,b);}public Rect(Rect r){set(r.left,r.top,r.right,r.bottom);}
 public void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
 public boolean isEmpty(){return left>=right||top>=bottom;}public int width(){return right-left;}public int height(){return bottom-top;}
 public String toString(){return left+","+top+","+right+","+bottom;}
}''',
    'android/graphics/RectF.java': '''package android.graphics;
public class RectF {
 public float left,top,right,bottom;
 public RectF(){}public RectF(Rect r){set(r);}
 public void set(Rect r){set(r.left,r.top,r.right,r.bottom);}public void set(float l,float t,float r,float b){left=l;top=t;right=r;bottom=b;}
 public boolean isEmpty(){return left>=right||top>=bottom;}
 public void offset(float x,float y){left+=x;right+=x;top+=y;bottom+=y;}
 public void union(RectF r){union(r.left,r.top,r.right,r.bottom);}
 public void union(float l,float t,float r,float b){if(l>=r||t>=b)return;if(isEmpty()){set(l,t,r,b);return;}left=Math.min(left,l);top=Math.min(top,t);right=Math.max(right,r);bottom=Math.max(bottom,b);}
 public void roundOut(Rect r){r.set((int)Math.floor(left),(int)Math.floor(top),(int)Math.ceil(right),(int)Math.ceil(bottom));}
}''',
    'android/graphics/Matrix.java': '''package android.graphics;
public class Matrix {
 private float[] values={1,0,0,0,1,0,0,0,1};
 public void setValues(float[] next){values=next.clone();}
 public boolean mapRect(RectF r){
  float[] xs={r.left,r.right,r.right,r.left},ys={r.top,r.top,r.bottom,r.bottom};
  float l=Float.POSITIVE_INFINITY,t=l,rr=Float.NEGATIVE_INFINITY,b=rr;
  for(int i=0;i<4;i++){float x=values[0]*xs[i]+values[1]*ys[i]+values[2],y=values[3]*xs[i]+values[4]*ys[i]+values[5];l=Math.min(l,x);t=Math.min(t,y);rr=Math.max(rr,x);b=Math.max(b,y);}
  r.set(l,t,rr,b);return true;
 }
}''',
    'android/graphics/drawable/Drawable.java': '''package android.graphics.drawable;
public class Drawable {private final android.graphics.Rect bounds=new android.graphics.Rect();public android.graphics.Rect getBounds(){return bounds;}public void setBounds(int l,int t,int r,int b){bounds.set(l,t,r,b);}}''',
    'android/view/View.java': '''package android.view;
public class View {
 public static final int VISIBLE=0,INVISIBLE=4,GONE=8;
 private int visibility=VISIBLE,left,top,width,height,paddingLeft,paddingTop,scrollX,scrollY;
 private float alpha=1,transitionAlpha=1;private final android.graphics.Matrix matrix=new android.graphics.Matrix();
 public void layout(int l,int t,int r,int b){left=l;top=t;width=r-l;height=b-t;}
 public int getLeft(){return left;}public int getTop(){return top;}public int getWidth(){return width;}public int getHeight(){return height;}
 public void setVisibility(int v){visibility=v;}public int getVisibility(){return visibility;}
 public void setAlpha(float a){alpha=a;}public float getAlpha(){return alpha;}
 public void setTransitionAlpha(float a){transitionAlpha=a;}public float getTransitionAlpha(){return transitionAlpha;}
 public android.graphics.Matrix getMatrix(){return matrix;}
 public void setPadding(int l,int t,int r,int b){paddingLeft=l;paddingTop=t;}public int getPaddingLeft(){return paddingLeft;}public int getPaddingTop(){return paddingTop;}
 public void scrollTo(int x,int y){scrollX=x;scrollY=y;}public int getScrollX(){return scrollX;}public int getScrollY(){return scrollY;}
}''',
    'android/view/ViewGroup.java': '''package android.view;
public class ViewGroup extends View {private final java.util.List<View> children=new java.util.ArrayList<>();public void addView(View child){children.add(child);}public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}}''',
    'android/widget/ImageView.java': '''package android.widget;
public class ImageView extends android.view.View {private android.graphics.drawable.Drawable drawable;private final android.graphics.Matrix imageMatrix=new android.graphics.Matrix();public void setImageDrawable(android.graphics.drawable.Drawable d){drawable=d;}public android.graphics.drawable.Drawable getDrawable(){return drawable;}public android.graphics.Matrix getImageMatrix(){return imageMatrix;}}''',
    'android/text/Layout.java': '''package android.text;
public class Layout {private final float[][] lines;public Layout(float[][] values){lines=values;}public int getLineCount(){return lines.length;}public float getLineLeft(int i){return lines[i][0];}public int getLineTop(int i){return (int)lines[i][1];}public float getLineRight(int i){return lines[i][2];}public int getLineBottom(int i){return (int)lines[i][3];}}''',
    'android/widget/TextView.java': '''package android.widget;
public class TextView extends android.view.View {private android.text.Layout layout;private String text="";public void setText(String t){text=t;}public int length(){return text.length();}public void setLayout(android.text.Layout l){layout=l;}public android.text.Layout getLayout(){return layout;}public int getTotalPaddingLeft(){return getPaddingLeft();}public int getTotalPaddingTop(){return getPaddingTop();}}''',
    'ls/augment/com/hook/RedMagicSystemUiHook.java': '''package ls.augment.com.hook;
import android.view.View;import android.graphics.Rect;import java.util.*;
final class RedMagicSystemUiHook {
 static final Map<View,Rect> stacks=new IdentityHashMap<>();static final Set<View> collapsed=Collections.newSetFromMap(new IdentityHashMap<>());
 static Rect stackedSignalBounds(View view){return stacks.get(view);}static boolean isCollapsedSignal(View view){return collapsed.contains(view);}
}''',
    'ls/augment/com/hook/TestStatusBarContentBounds.java': r'''package ls.augment.com.hook;
import android.graphics.*;import android.graphics.drawable.Drawable;import android.view.*;import android.widget.*;
public final class TestStatusBarContentBounds {
 static int checks;
 static void bounds(View v,int l,int t,int r,int b,String why){Rect actual=StatusBarContentBounds.of(v);checks++;if(actual.left!=l||actual.top!=t||actual.right!=r||actual.bottom!=b)throw new AssertionError(why+": expected "+new Rect(l,t,r,b)+", got "+actual);}
 static ViewGroup group(int l,int t,int w,int h){ViewGroup v=new ViewGroup();v.layout(l,t,l+w,t+h);return v;}
 static ImageView image(int l,int t,int w,int h,int dw,int dh){ImageView v=new ImageView();v.layout(l,t,l+w,t+h);Drawable d=new Drawable();d.setBounds(0,0,dw,dh);v.setImageDrawable(d);return v;}
 static void matrix(Matrix m,float sx,float sy,float tx,float ty){m.setValues(new float[]{sx,0,tx,0,sy,ty,0,0,1});}
 public static void main(String[] args){
  ViewGroup mobile=group(30,0,20,24);ImageView strength=image(2,6,16,12,12,12);mobile.addView(strength);
  bounds(mobile,2,6,14,18,"12px signal drawing must not inherit the 24px parent allocation");
  ViewGroup system=group(0,0,70,24),wifi=group(0,0,24,24);ImageView wifiStrength=image(4,6,20,12,12,12);wifi.addView(wifiStrength);system.addView(wifi);system.addView(mobile);
  bounds(system,4,6,44,18,"visible WiFi and mobile share the same 12px content height");
  wifi.setVisibility(View.GONE);bounds(system,32,6,44,18,"turning WiFi off must preserve mobile content height");
  bounds(mobile,2,6,14,18,"mobile content stays unchanged when its WiFi sibling disappears");
  wifi.setVisibility(View.VISIBLE);wifi.setAlpha(0);bounds(system,32,6,44,18,"transparent WiFi contributes no allocation");
  wifi.setAlpha(1);wifi.setTransitionAlpha(0);bounds(system,32,6,44,18,"native transition-hidden WiFi contributes no allocation");
  wifi.setTransitionAlpha(1);RedMagicSystemUiHook.collapsed.add(wifi);bounds(system,32,6,44,18,"collapsed secondary signal is excluded");RedMagicSystemUiHook.collapsed.clear();

  ImageView matrixImage=image(0,0,40,24,10,12);matrixImage.getDrawable().setBounds(1,2,11,14);matrixImage.setPadding(4,5,0,0);matrix(matrixImage.getImageMatrix(),1.5f,.5f,3,-2);
  bounds(matrixImage,8,4,24,10,"drawable matrix is applied before padding and rounded outward");
  // A view's own matrix belongs to its parent, not its local drawing bounds.
  matrix(matrixImage.getMatrix(),3,3,100,100);bounds(matrixImage,8,4,24,10,"local bounds must not apply own transform twice");

  ViewGroup stacked=group(0,0,24,24);ImageView original=image(0,0,24,24,24,24);stacked.addView(original);original.setTransitionAlpha(0);
  RedMagicSystemUiHook.stacks.put(stacked,new Rect(1,-7,13,21));
  bounds(stacked,1,-7,13,21,"both stacked SIM rows remain included while original strength is transition-hidden");
  ImageView dataType=image(15,6,6,8,6,8);stacked.addView(dataType);bounds(stacked,1,-7,21,21,"native data type remains unioned with the full dual-SIM overlay");
  dataType.setVisibility(View.INVISIBLE);bounds(stacked,1,-7,13,21,"invisible auxiliary content does not enlarge the dual-SIM overlay");

  ViewGroup root=group(0,0,100,100),nested=group(20,30,40,50);root.scrollTo(3,4);nested.scrollTo(1,2);root.addView(nested);
  ImageView leaf=image(4,6,8,12,8,12);leaf.setPadding(1,2,0,0);nested.addView(leaf);matrix(leaf.getMatrix(),.5f,2,3,4);matrix(nested.getMatrix(),2,.5f,5,-3);
  bounds(nested,6,12,11,36,"child matrix, child position and parent scroll are combined in local space");
  bounds(root,34,29,44,41,"nested transform and outer scroll apply exactly once");
  ViewGroup rotated=group(0,0,40,40);ImageView rotatedLeaf=image(10,12,4,8,4,8);rotated.addView(rotatedLeaf);rotatedLeaf.getMatrix().setValues(new float[]{0,-1,0,1,0,0,0,0,1});
  bounds(rotated,2,12,10,16,"rotated child uses its transformed rectangle");

  TextView text=new TextView();text.layout(0,0,100,48);text.setText("12:34\n09/20");text.setPadding(3,4,0,0);text.scrollTo(1,2);text.setLayout(new android.text.Layout(new float[][]{{2,0,30,12},{0,12,24,28}}));
  bounds(text,2,2,32,30,"multiline text uses every line plus padding minus scrolling");
  View custom=new View();custom.layout(0,0,17,9);bounds(custom,0,0,17,9,"custom leaf drawing retains its native box fallback");
  TextView emptyText=new TextView();emptyText.layout(0,0,36,24);bounds(emptyText,0,0,0,0,"empty text contributes no icon allocation");
  ImageView emptyImage=new ImageView();emptyImage.layout(0,0,24,24);bounds(emptyImage,0,0,0,0,"image without a drawable contributes no icon allocation");

  // OEM WiFi wrappers can remain visible while only the internal content is GONE.
  wifiStrength.setVisibility(View.GONE);bounds(system,32,6,44,18,"empty visible WiFi wrapper must not shrink the remaining mobile icon");
  System.out.println("StatusBarContentBounds: "+checks+" actual-source geometry assertions passed");
 }
}''',
}
SOURCES['ls/augment/com/hook/StatusBarContentBounds.java'] = (
    JAVA / 'StatusBarContentBounds.java').read_text(encoding='utf-8')

with tempfile.TemporaryDirectory(prefix='lsa-statusbar-bounds-') as directory:
    temporary = Path(directory)
    files = []
    for name, source in SOURCES.items():
        target = temporary / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(source, encoding='utf-8')
        files.append(str(target))
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', directory, *files], check=True)
    subprocess.run(['java', '-cp', directory, 'ls.augment.com.hook.TestStatusBarContentBounds'], check=True, timeout=20)
