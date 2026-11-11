"""Check actual picker viewport calculation with consumed and regular IME insets."""
from pathlib import Path
import os,subprocess,tempfile
r=Path(__file__).resolve().parents[1]
s=(r/'android/app/src/main/java/ls/augment/com/step/QuickPicker.java').read_text(encoding='utf-8')
a=s.index('    static int availableBottom(');b=s.index('    void refresh()',a)
method=s[a:b]
code=r'''
public class PickerViewport {
 static int checks;
 static class Rect {int left,top,right,bottom;Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}}
 METHOD
 static void check(int actual,int expected,String why){checks++;if(actual!=expected)throw new AssertionError(why+": "+actual);}
 public static void main(String[] args){
  Rect screen=new Rect(0,0,1216,2688),imeFrame=new Rect(0,0,1216,1594);
  check(availableBottom(screen,imeFrame,1755,0),1594,"OEM consumes insets but visible display excludes keyboard");
  check(availableBottom(screen,screen,2221,1094),1594,"standard IME inset");
  check(availableBottom(screen,imeFrame,1505,1094),1594,"second layout remains stable");
  check(availableBottom(screen,screen,1505,0),2688,"keyboard dismissal restores original space");
  check(availableBottom(screen,new Rect(61,0,1155,1755),1755,0),2688,"own dialog frame is not display viewport");
  check(availableBottom(screen,new Rect(0,0,1216,1755),1755,0),2688,"full-width own frame cannot shrink itself");
  check(availableBottom(screen,new Rect(0,0,0,0),1755,0),2688,"unattached or unavailable visible frame ignored");
  check(availableBottom(screen,new Rect(0,0,1216,3000),1755,0),2688,"foreign display bounds ignored");
  check(availableBottom(screen,screen,1755,4000),0,"invalid oversized keyboard never produces negative boundary");
  check(availableBottom(screen,imeFrame,1755,1200),1488,"stricter native boundary wins");
  System.out.println("PASS "+checks+" production picker keyboard viewport checks");
 }
}
'''.replace('METHOD',method)
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-picker-') as directory:
 p=Path(directory);f=p/'PickerViewport.java';f.write_text(code,encoding='utf-8');subprocess.run([java/'javac','-encoding','UTF-8','-d',p,f],check=True);subprocess.run([java/'java','-cp',p,'PickerViewport'],check=True)
