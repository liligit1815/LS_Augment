"""Shared Android pre-draw lifecycle facade for the real glass hooks."""
def apply(files):
    files['android/view/ViewTreeObserver.java']='''package android.view;
public class ViewTreeObserver {
 public interface OnPreDrawListener {boolean onPreDraw();}
 public final java.util.List<OnPreDrawListener> listeners=new java.util.ArrayList<>();
 public boolean isAlive(){return true;}
 public void addOnPreDrawListener(OnPreDrawListener l){listeners.add(l);}
 public void removeOnPreDrawListener(OnPreDrawListener l){listeners.remove(l);}
 public void draw(){for(OnPreDrawListener l:new java.util.ArrayList<>(listeners))l.onPreDraw();}
}'''
    key='android/view/View.java'
    files[key]=files[key].replace('public class View implements ViewParent', 'public class View implements ViewParent',1)
    at=files[key].index('{',files[key].index('public class View'))+1
    files[key]=files[key][:at]+'''public final ViewTreeObserver observer=new ViewTreeObserver();
 public ViewTreeObserver getViewTreeObserver(){return observer;}'''+files[key][at:]
