"""Small raster canvas doubles; GPU blur itself still requires Android device acceptance."""
FILES = {
'android/view/ViewTreeObserver.java': '''package android.view;public class ViewTreeObserver{public interface OnPreDrawListener{boolean onPreDraw();}public java.util.List<OnPreDrawListener> listeners=new java.util.ArrayList<>();public boolean isAlive(){return true;}public void addOnPreDrawListener(OnPreDrawListener l){listeners.add(l);}public void removeOnPreDrawListener(OnPreDrawListener l){listeners.remove(l);}public void dispatch(){for(var l:new java.util.ArrayList<>(listeners))l.onPreDraw();}}''',
'android/graphics/Rect.java': '''package android.graphics;public class Rect{public int left,top,right,bottom;public Rect(){}public Rect(int l,int t,int r,int b){set(l,t,r,b);}public void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public int width(){return right-left;}public int height(){return bottom-top;}public boolean isEmpty(){return width()<=0||height()<=0;}}''',
'android/graphics/Paint.java': 'package android.graphics;public class Paint{public static final int FILTER_BITMAP_FLAG=2;public Paint(int flags){}}',
'android/graphics/ColorFilter.java': 'package android.graphics;public class ColorFilter{}',
'android/graphics/PixelFormat.java': 'package android.graphics;public class PixelFormat{public static final int TRANSLUCENT=-3;}',
'android/graphics/Bitmap.java': '''package android.graphics;public class Bitmap{public enum Config{ARGB_8888}public final int w,h;public final int[][] p;public Bitmap(int w,int h){this.w=w;this.h=h;p=new int[h][w];}public static Bitmap createBitmap(int w,int h,Config c){return new Bitmap(w,h);}public int getWidth(){return w;}public int getHeight(){return h;}public void eraseColor(int color){for(int[] r:p)java.util.Arrays.fill(r,color);}}''',
'android/graphics/Canvas.java': '''package android.graphics;public class Canvas{
 public Bitmap bitmap;public boolean hardware;public int nodes;float sx=1,sy=1,tx,ty;int l,t,r,b;java.util.ArrayList<float[]> saves=new java.util.ArrayList<>();
 public Canvas(){this(new Bitmap(600,1000));hardware=true;}public Canvas(Bitmap bitmap){setBitmap(bitmap);}public void setBitmap(Bitmap v){bitmap=v;if(v!=null){l=t=0;r=v.w;b=v.h;}}public boolean isHardwareAccelerated(){return hardware;}
 public int save(){saves.add(new float[]{sx,sy,tx,ty,l,t,r,b});return saves.size();}public void restoreToCount(int n){float[] s=saves.get(n-1);sx=s[0];sy=s[1];tx=s[2];ty=s[3];l=(int)s[4];t=(int)s[5];r=(int)s[6];b=(int)s[7];while(saves.size()>=n)saves.remove(saves.size()-1);}
 public int saveLayerAlpha(float a,float c,float d,float e,int alpha){return save();}public void scale(float x,float y){sx*=x;sy*=y;}public void translate(float x,float y){tx+=x*sx;ty+=y*sy;}
 public boolean clipRect(Rect v){return clipRect(v.left,v.top,v.right,v.bottom);}public boolean clipRect(float a,float c,float d,float e){l=Math.max(l,Math.round(tx+a*sx));t=Math.max(t,Math.round(ty+c*sy));r=Math.min(r,Math.round(tx+d*sx));b=Math.min(b,Math.round(ty+e*sy));return r>l&&b>t;}
 public void fill(int a,int c,int d,int e,int color){int x0=Math.max(l,Math.round(tx+a*sx)),y0=Math.max(t,Math.round(ty+c*sy)),x1=Math.min(r,Math.round(tx+d*sx)),y1=Math.min(b,Math.round(ty+e*sy));for(int y=y0;y<y1;y++)for(int x=x0;x<x1;x++)bitmap.p[y][x]=color;}
 public void drawBitmap(Bitmap src,Rect ignored,Rect dst,Paint paint){for(int y=0;y<dst.height();y++)for(int x=0;x<dst.width();x++){int color=src.p[y*src.h/dst.height()][x*src.w/dst.width()];if(color!=0)fill(dst.left+x,dst.top+y,dst.left+x+1,dst.top+y+1,color);}}
 public void drawRenderNode(RenderNode node){if(node.effect==null)throw new AssertionError("missing Gaussian effect");nodes++;drawBitmap(node.canvas.bitmap,null,new Rect(0,0,node.w,node.h),null);}}
''',
'android/graphics/RenderNode.java': '''package android.graphics;public class RenderNode{public int w,h;public RenderEffect effect;public Canvas canvas;public RenderNode(String name){}public boolean setRenderEffect(RenderEffect v){effect=v;return true;}public boolean setPosition(int l,int t,int r,int b){w=r-l;h=b-t;return true;}public Canvas beginRecording(){canvas=new Canvas(new Bitmap(w,h));canvas.hardware=true;return canvas;}public void endRecording(){}public void discardDisplayList(){canvas=null;}}''',
'android/graphics/drawable/Drawable.java': '''package android.graphics.drawable;public abstract class Drawable{public abstract void draw(android.graphics.Canvas c);public void setAlpha(int a){}public void setColorFilter(android.graphics.ColorFilter f){}public int getOpacity(){return -3;}}''',
'android/graphics/drawable/ColorDrawable.java': '''package android.graphics.drawable;public class ColorDrawable extends Drawable{int color;public ColorDrawable(int color){this.color=color;}public void draw(android.graphics.Canvas c){if(color!=0)c.fill(0,0,600,1000,color);}}''',
'android/graphics/drawable/LayerDrawable.java': '''package android.graphics.drawable;public class LayerDrawable extends Drawable{public static final int PADDING_MODE_STACK=1;final Drawable[] layers;public LayerDrawable(Drawable[] layers){this.layers=layers;}public void setPaddingMode(int m){}public void draw(android.graphics.Canvas c){for(Drawable d:layers)d.draw(c);}}''',
'android/widget/TextView.java': 'package android.widget;public class TextView extends android.view.View{}',
'com/zte/controlcenter/widget/CCHeaderView.java': '''package com.zte.controlcenter.widget;public class CCHeaderView extends android.view.ViewGroup{public int panelType=2;public android.widget.TextView mClockView=new android.widget.TextView(),mDateView=new android.widget.TextView();public CCHeaderView(){height=180;mClockView.x=10;mClockView.y=20;mClockView.width=160;mClockView.height=50;mClockView.ink=3;mDateView.x=10;mDateView.y=75;mDateView.width=120;mDateView.height=20;mDateView.ink=4;addView(mClockView);addView(mDateView);}}''',
}

def extend(files):
    files.update(FILES)
    key='android/view/View.java'
    view=files[key]
    extra='''
 public float x,y,alpha=1,rotation,rotationX,rotationY;public int ink,drawClipTop,drawClipBottom,drawCount,invalidates;public boolean drawThrows;private android.graphics.drawable.Drawable background;private int pl,pt,pr,pb;
 private final ViewTreeObserver observer=new ViewTreeObserver();public ViewTreeObserver getViewTreeObserver(){return observer;}public android.graphics.Rect getClipBounds(){return new android.graphics.Rect(0,drawClipTop,width,height-drawClipBottom);}
 public float getScaleX(){return sx;}public float getScaleY(){return sy;}public float getRotation(){return rotation;}public float getRotationX(){return rotationX;}public float getRotationY(){return rotationY;}public float getAlpha(){return alpha;}
 public View getRootView(){return parent==null?this:parent.getRootView();}public void getLocationInWindow(int[] p){float a=0,b=0;for(View v=this;v!=null;v=v.parent){a+=v.x;b+=v.y;}p[0]=Math.round(a);p[1]=Math.round(b);}
 public int getPaddingLeft(){return pl;}public int getPaddingTop(){return pt;}public int getPaddingRight(){return pr;}public int getPaddingBottom(){return pb;}public void setPadding(int l,int t,int r,int b){pl=l;pt=t;pr=r;pb=b;}
 public android.graphics.drawable.Drawable getBackground(){return background;}public void setBackground(android.graphics.drawable.Drawable v){background=v;setPadding(0,0,0,0);}public void invalidate(){invalidates++;}
 public void draw(android.graphics.Canvas c){drawCount++;if(drawThrows)throw new IllegalStateException("draw failed");if(background!=null)background.draw(c);if(ink!=0)c.fill(0,drawClipTop,width,height,ink);}
'''
    idx=view.rfind('}');files[key]=view[:idx]+extra+view[idx:]
    key='android/view/ViewGroup.java';view=files[key];idx=view.rfind('}')
    files[key]=view[:idx]+'''public void draw(android.graphics.Canvas c){super.draw(c);for(View v:children){int save=c.save();c.translate(v.x,v.y);v.draw(c);c.restoreToCount(save);}}'''+view[idx:]
