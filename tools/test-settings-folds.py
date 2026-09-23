"""Exercise the production Fold with view doubles; no Android/Root operations.

Covers initial expansion, user toggles, manual collapse and independent settings
accessible with their layout switch off. This does not verify pixel appearance.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / 'android/app/src/main/java/ls/augment/com/UiKit.java').read_text(encoding='utf-8')
start = source.index('    final class Fold {')
end = source.index('\n    View divider()', start)
fold = source[start:end].replace('android.widget.Toast', 'Toast')
harness = r'''
import java.util.*;
public class TestSettingsFolds {
 static class View {
  static final int VISIBLE=0,GONE=8; int visibility=VISIBLE; boolean enabled=true;
  float rotation,alpha; String description; View parent; java.util.function.Consumer<View> click;
  int getVisibility(){return visibility;} void setVisibility(int v){visibility=v;}
  boolean isEnabled(){return enabled;} void setEnabled(boolean v){enabled=v;}
  View getParent(){return parent;} void setRotation(float v){rotation=v;}
  void setAlpha(float v){alpha=v;} void setContentDescription(String v){description=v;}
  void setOnClickListener(java.util.function.Consumer<View> v){click=v;}
  void click(){if(enabled&&click!=null)click.accept(this);}
 }
 static class Switch extends View {boolean checked;boolean isChecked(){return checked;}}
 static class ImageButton extends View {ImageButton(Object a){}void setImageResource(int r){}
  void setColorFilter(int c){}void setBackground(Object b){}}
 static class LinearLayout extends View {
  List<View> children=new ArrayList<>(); int getChildCount(){return children.size();}
  void removeViewAt(int i){children.remove(i);}void addView(View v,LayoutParams p){children.add(v);v.parent=this;}
  static class LayoutParams {LayoutParams(int w,int h){}}
 }
 static class R {static class drawable {static int ic_expand_more=1;}}
 static class Color {static int TRANSPARENT=0;}
 static class Toast {static int LENGTH_SHORT; static Toast makeText(Object a,String s,int i){return new Toast();}void show(){}}
 Object activity=new Object();int muted;int dp(int n){return n;}Object round(int c,int r){return null;}Object pressable(Object b){return b;}
 // PRODUCTION_FOLD
 Fold create(boolean checked,boolean enabled,boolean accessible){
  Switch control=new Switch();control.checked=checked;control.enabled=enabled;
  LinearLayout row=new LinearLayout();row.addView(control,new LinearLayout.LayoutParams(1,1));row.addView(new View(),new LinearLayout.LayoutParams(1,1));
  return new Fold(control,new View(),accessible);
 }
 static int checks;
 static void check(boolean v,String reason){checks++;if(!v)throw new AssertionError(reason);}
 static void collapsed(Fold f){check(f.content.getVisibility()==View.GONE,"must be collapsed");check(f.arrow.rotation==0,"collapsed arrow");check("展开配置".equals(f.arrow.description),"collapsed accessibility label");}
 public static void main(String[] args){
  TestSettingsFolds ui=new TestSettingsFolds();
  for(boolean checked:new boolean[]{false,true})for(boolean enabled:new boolean[]{false,true})for(boolean accessible:new boolean[]{false,true}){
   Fold f=ui.create(checked,enabled,accessible);collapsed(f);f.sync();collapsed(f);
   check(f.arrow.enabled==(enabled&&(checked||accessible)),"initial accessibility follows actual setting");
   f.arrow.click();check((f.content.visibility==View.VISIBLE)==f.arrow.enabled,"explicit expand respects availability");
  }
  Fold active=ui.create(true,true,false);active.arrow.click();check(active.content.visibility==View.VISIBLE,"enabled setting can expand");
  active.arrow.click();active.sync();collapsed(active);active.sync();collapsed(active);
  active.control.checked=false;active.sync();collapsed(active);
  active.control.checked=true;active.sync();check(active.content.visibility==View.VISIBLE,"user activation opens configuration");
  active.control.checked=false;active.sync();collapsed(active);check(!active.arrow.enabled,"disabled feature cannot expand");
  Fold independent=ui.create(false,true,true);independent.arrow.click();independent.sync();
  check(independent.content.visibility==View.VISIBLE,"independent settings remain accessible while layout is off");
  independent.arrow.click();independent.sync();collapsed(independent);
  Fold recreated=ui.create(true,true,false);collapsed(recreated);
  System.out.println("PASS settings folds: "+checks+" state checks");
 }
}
'''.replace('// PRODUCTION_FOLD', fold)
with tempfile.TemporaryDirectory(prefix='ls-settings-folds-') as temporary:
    path = Path(temporary)
    (path / 'TestSettingsFolds.java').write_text(harness, encoding='utf-8')
    subprocess.run(['javac', '-encoding', 'UTF-8', '--release', '17', '-d', str(path), str(path / 'TestSettingsFolds.java')], check=True)
    subprocess.run(['java', '-cp', str(path), 'TestSettingsFolds'], check=True)
