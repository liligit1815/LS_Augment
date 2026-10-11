"""Run actual notification appearance hook with native-view lifecycle doubles.
No phone interaction. Checks reversible state and scene ownership, not Android rendering.
"""
from pathlib import Path
import subprocess
import tempfile
ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
helper=ROOT/'tools/test-notification-whole-stack-runtime.py'
scope={'__file__':str(helper)}
exec(compile(helper.read_text(encoding='utf-8').split("java = Path(",1)[0],str(helper),'exec'),scope)
files={k:v for k,v in scope['files'].items() if not k.startswith('com/android/systemui/') and not k.endswith('TestNotificationWholeStack.java')}
files.update({
'ls/augment/com/hook/LiftArcLog.java':'package ls.augment.com.hook;final class LiftArcLog{static void w(String text,Throwable error){}static boolean e(String text,Throwable error){return true;}}',
'ls/augment/com/hook/OemNotificationClearHook.java':'package ls.augment.com.hook;final class OemNotificationClearHook{static int install(AugmentModule m,ClassLoader l){return 0;}}',
'android/R.java':'package android;public class R{public static class id{public static final int mask=99;}}',
'android/util/DisplayMetrics.java':'package android.util;public class DisplayMetrics{public float density=1,scaledDensity=1;}',
'android/util/TypedValue.java':'package android.util;public class TypedValue{public static final int COMPLEX_UNIT_PX=0;}',
'android/text/TextUtils.java':'package android.text;public class TextUtils{public enum TruncateAt{START,MIDDLE,END,MARQUEE}}',
'android/content/res/Configuration.java':'package android.content.res;public class Configuration{public static final int ORIENTATION_LANDSCAPE=2,UI_MODE_NIGHT_MASK=48,UI_MODE_NIGHT_YES=32;public int orientation=1,uiMode;}',
'android/content/res/Resources.java':'''package android.content.res;public class Resources{public static final Configuration config=new Configuration();
 public Configuration getConfiguration(){return config;}public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}
 public int getIdentifier(String name,String type,String pkg){return name.hashCode();}}''',
'android/view/ViewParent.java':'package android.view;public interface ViewParent{ViewParent getParent();}',
'android/view/ViewTreeObserver.java':'''package android.view;public class ViewTreeObserver{public interface OnGlobalLayoutListener{void onGlobalLayout();}public interface OnPreDrawListener{boolean onPreDraw();}
 public final java.util.List<OnGlobalLayoutListener> layouts=new java.util.ArrayList<>();public final java.util.List<OnPreDrawListener> draws=new java.util.ArrayList<>();
 public boolean isAlive(){return true;}public void addOnGlobalLayoutListener(OnGlobalLayoutListener l){layouts.add(l);}public void removeOnGlobalLayoutListener(OnGlobalLayoutListener l){layouts.remove(l);}
 public void addOnPreDrawListener(OnPreDrawListener l){draws.add(l);}public void removeOnPreDrawListener(OnPreDrawListener l){draws.remove(l);}
 public void draw(){for(OnPreDrawListener l:new java.util.ArrayList<>(draws))l.onPreDraw();}}''',
'android/graphics/Paint.java':'''package android.graphics;public class Paint{public float size=24;public static class FontMetrics{public float top,bottom;}
 public float measureText(String value){return value.length()*size*.5f;}public FontMetrics getFontMetrics(){FontMetrics f=new FontMetrics();f.top=-size;f.bottom=0;return f;}}''',
'android/graphics/Color.java':'package android.graphics;public class Color{public static int parseColor(String s){return (int)Long.parseLong(s.substring(1),16);}}',
'android/graphics/drawable/Drawable.java':'''package android.graphics.drawable;public class Drawable{public int tint;public Drawable mutate(){return this;}public void setTint(int c){tint=c;}
 public ConstantState getConstantState(){return new ConstantState(this);}public static class ConstantState{final Drawable base;ConstantState(Drawable b){base=b;}
 public Drawable newDrawable(android.content.res.Resources r){Drawable d=base instanceof RippleDrawable?new RippleDrawable():new Drawable();d.tint=base.tint;return d;}}}''',
'android/graphics/drawable/RippleDrawable.java':'''package android.graphics.drawable;public class RippleDrawable extends Drawable{public final Drawable base=new Drawable(),mask=new Drawable();public int getNumberOfLayers(){return 2;}
 public int getId(int i){return i==1?android.R.id.mask:0;}public Drawable getDrawable(int i){return i==0?base:mask;}}''',
'android/animation/ValueAnimator.java':'''package android.animation;public class ValueAnimator{public interface Update{void update(ValueAnimator a);}public static boolean enabled=true;public static int started;
 public float value;public Update callback;public static boolean areAnimatorsEnabled(){return enabled;}public static ValueAnimator ofFloat(float a,float b){return new ValueAnimator();}
 public void setDuration(long d){}public void setInterpolator(Object i){}public void addUpdateListener(Update u){callback=u;}public Object getAnimatedValue(){return value;}
 public void start(){started++;value=0;if(callback!=null)callback.update(this);}public void cancel(){} }''',
'android/view/animation/DecelerateInterpolator.java':'package android.view.animation;public class DecelerateInterpolator{}',
'android/view/View.java':'''package android.view;
 public class View implements ViewParent{public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 public static final int VISIBLE=0,INVISIBLE=4,GONE=8;public int id,visibility,nativeWidth=400,nativeHeight=100;public float x,y,alpha=1;public boolean attached=true,clickable;
 public ViewGroup parent;public Runnable click;public android.graphics.drawable.Drawable background;public ViewGroup.LayoutParams lp=new ViewGroup.LayoutParams(-1,100);
 final android.content.Context context=new android.content.Context();final android.content.res.Resources resources=new android.content.res.Resources();final ViewTreeObserver tree=new ViewTreeObserver();
 public android.content.Context getContext(){return context;}public android.content.res.Resources getResources(){return resources;}public ViewParent getParent(){return parent;}
 public View getRootView(){return parent==null?this:parent.getRootView();}public int getVisibility(){return visibility;}public void setVisibility(int v){visibility=v;}
 public boolean isAttachedToWindow(){return attached;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){}public ViewTreeObserver getViewTreeObserver(){return tree;}
 public int getId(){return id;}public View findViewById(int i){return id==i?this:null;}public int getWidth(){return lp.width>0?lp.width:nativeWidth;}
 public int getHeight(){return lp.height>0?lp.height:nativeHeight;}public int getLeft(){return lp instanceof ViewGroup.MarginLayoutParams?((ViewGroup.MarginLayoutParams)lp).leftMargin:0;}
 public int getTop(){int result=lp instanceof ViewGroup.MarginLayoutParams?((ViewGroup.MarginLayoutParams)lp).topMargin:0;
  if(lp instanceof android.widget.RelativeLayout.LayoutParams&&parent!=null){int below=((android.widget.RelativeLayout.LayoutParams)lp).getRule(android.widget.RelativeLayout.BELOW);View sibling=below==0?null:parent.findViewById(below);if(sibling!=null)result+=sibling.getBottom();}return result;}
 public int getBottom(){return getTop()+getHeight();}public int getPaddingLeft(){return 0;}public int getPaddingRight(){return 0;}public int getPaddingTop(){return 0;}public int getPaddingBottom(){return 0;}public int getMeasuredWidth(){return getWidth();}public int getMeasuredHeight(){return getHeight();}
 public float getTranslationX(){return x;}public float getTranslationY(){return y;}public void setTranslationX(float v){x=v;}public void setTranslationY(float v){y=v;}
 public ViewGroup.LayoutParams getLayoutParams(){return lp;}public void setLayoutParams(ViewGroup.LayoutParams p){lp=p;}
 public void getLocationOnScreen(int[] point){point[0]=getLeft()+(int)x;point[1]=getTop()+(int)y;if(parent!=null){int[] above=new int[2];parent.getLocationOnScreen(above);point[0]+=above[0];point[1]+=above[1];}}
 public android.graphics.drawable.Drawable getBackground(){return background;}public void setBackground(android.graphics.drawable.Drawable d){background=d;}
 public float getAlpha(){return alpha;}public boolean isShown(){return attached&&visibility==VISIBLE&&(parent==null||parent.isShown());}public boolean isClickable(){return clickable;}
 public void invalidate(){}public void performClick(){if(click!=null)click.run();}}
''',
'android/view/ViewGroup.java':'''package android.view;public class ViewGroup extends View{
 public static class LayoutParams{public static final int WRAP_CONTENT=-2,MATCH_PARENT=-1;public int width,height;public LayoutParams(int w,int h){width=w;height=h;}public LayoutParams(LayoutParams p){this(p.width,p.height);}}
 public static class MarginLayoutParams extends LayoutParams{public int leftMargin,topMargin,rightMargin,bottomMargin,startMargin=Integer.MIN_VALUE,endMargin=Integer.MIN_VALUE;public MarginLayoutParams(int w,int h){super(w,h);}public MarginLayoutParams(MarginLayoutParams p){super(p);leftMargin=p.leftMargin;topMargin=p.topMargin;rightMargin=p.rightMargin;bottomMargin=p.bottomMargin;startMargin=p.startMargin;endMargin=p.endMargin;}public void setMarginStart(int m){startMargin=m;}public void setMarginEnd(int m){endMargin=m;}public boolean isMarginRelative(){return startMargin!=Integer.MIN_VALUE||endMargin!=Integer.MIN_VALUE;}}
 public final java.util.List<View> children=new java.util.ArrayList<>();public void add(View child){children.add(child);child.parent=this;}
 public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}public View findViewById(int i){View found=super.findViewById(i);if(found!=null)return found;for(View v:children){found=v.findViewById(i);if(found!=null)return found;}return null;}}
''',
'android/widget/RelativeLayout.java':'''package android.widget;public class RelativeLayout extends android.view.ViewGroup{public static final int ALIGN_PARENT_START=1,ALIGN_PARENT_END=2,CENTER_HORIZONTAL=3,ALIGN_PARENT_RIGHT=4,ALIGN_PARENT_LEFT=5,BELOW=6,RIGHT_OF=7,END_OF=8,ALIGN_PARENT_TOP=9,ALIGN_BOTTOM=10;
 public static class LayoutParams extends android.view.ViewGroup.MarginLayoutParams{public int[] rules=new int[20];public LayoutParams(int w,int h){super(w,h);}public LayoutParams(LayoutParams p){super(p);rules=p.rules.clone();}public int[] getRules(){return rules;}public int getRule(int r){return rules[r];}public void removeRule(int r){rules[r]=0;}public void addRule(int r){rules[r]=-1;}public void addRule(int r,int v){rules[r]=v;}}
 }''',
'android/widget/FrameLayout.java':'''package android.widget;public class FrameLayout extends android.view.ViewGroup{public static class LayoutParams extends android.view.ViewGroup.MarginLayoutParams{public LayoutParams(int w,int h){super(w,h);}public LayoutParams(LayoutParams p){super(p);}}}''',
'android/widget/TextView.java':'''package android.widget;public class TextView extends android.view.View{public final android.graphics.Paint paint=new android.graphics.Paint();public String text="12:34";
 public float getTextSize(){return paint.size;}public void setTextSize(int unit,float size){paint.size=size;}public android.graphics.Paint getPaint(){return paint;}public CharSequence getText(){return text;}
 public android.text.TextUtils.TruncateAt ellipsize;public android.text.TextUtils.TruncateAt getEllipsize(){return ellipsize;}public void setEllipsize(android.text.TextUtils.TruncateAt value){ellipsize=value;}public int getCompoundPaddingLeft(){return 0;}public int getCompoundPaddingRight(){return 0;}public int getCompoundPaddingTop(){return 0;}public int getCompoundPaddingBottom(){return 0;}}''',
'com/zte/controlcenter/widget/CCHeaderView.java':'''package com.zte.controlcenter.widget;import android.widget.*;import android.view.*;import ls.augment.com.hook.AugmentModule;
 public class CCHeaderView extends RelativeLayout{public int panelType=2;public TextView mClockView=new TextView(),mDateView=new TextView();public RelativeLayout mTimeGroup=new RelativeLayout(),mDateViewContainer=new RelativeLayout(),right=new RelativeLayout();public View icons=new View();public float nativeSize=24;
 public CCHeaderView(){lp=new RelativeLayout.LayoutParams(400,180);mTimeGroup.id="time_group".hashCode();mDateViewContainer.id="date_view".hashCode();right.id="status_icons_group_container".hashCode();icons.id="status_icons_group".hashCode();
  add(mTimeGroup);mTimeGroup.add(mClockView);add(mDateViewContainer);mDateViewContainer.add(mDateView);add(right);right.add(icons);icons.lp=new RelativeLayout.LayoutParams(120,20);native_updateHeaderResources();}
 public void native_updateHeaderResources(){mClockView.setTextSize(0,nativeSize);mDateView.setTextSize(0,14);mDateView.text="October 4";
  mClockView.lp=new RelativeLayout.LayoutParams(-2,40);mDateView.lp=new RelativeLayout.LayoutParams(-2,20);mTimeGroup.lp=new RelativeLayout.LayoutParams(80,40);((RelativeLayout.LayoutParams)mTimeGroup.lp).topMargin=40;
  mDateViewContainer.lp=new RelativeLayout.LayoutParams(150,20);((RelativeLayout.LayoutParams)mDateViewContainer.lp).topMargin=90;right.lp=new RelativeLayout.LayoutParams(160,100);((RelativeLayout.LayoutParams)right.lp).addRule(RIGHT_OF,mTimeGroup.id);}
 public void updateHeaderResources(){AugmentModule.invoke(this,"updateHeaderResources",new Class<?>[]{});}public void updateVisibilities(){AugmentModule.invoke(this,"updateVisibilities",new Class<?>[]{});}public void native_updateVisibilities(){}
 public void onAttachedToWindow(){AugmentModule.invoke(this,"onAttachedToWindow",new Class<?>[]{});}public void native_onAttachedToWindow(){}
 public void onDetachedFromWindow(){AugmentModule.invoke(this,"onDetachedFromWindow",new Class<?>[]{});}public void native_onDetachedFromWindow(){attached=false;}
 public void onConfigurationChanged(android.content.res.Configuration c){AugmentModule.invoke(this,"onConfigurationChanged",new Class<?>[]{android.content.res.Configuration.class},c);}public void native_onConfigurationChanged(android.content.res.Configuration c){native_updateHeaderResources();}
 public void setViewType(int value){AugmentModule.invoke(this,"setViewType",new Class<?>[]{int.class},value);}public void native_setViewType(int value){panelType=value;}}
''',
'com/android/systemui/statusbar/notification/stack/NotificationStackScrollLayout.java':'''package com.android.systemui.statusbar.notification.stack;import ls.augment.com.hook.AugmentModule;
 public class NotificationStackScrollLayout extends android.view.ViewGroup{public static class Ambient{public int mStatusBarState,mTopPadding=100;public boolean mDozing,mShowingStackOnLockscreen,mShadeExpanded=true;}
 public final Ambient mAmbientState=new Ambient();public int mOwnScrollY;public android.view.View mFooterView;
 public void updateChildren(){AugmentModule.invoke(this,"updateChildren",new Class<?>[]{});}public void native_updateChildren(){}
 public void onLayout(boolean change,int l,int t,int r,int b){AugmentModule.invoke(this,"onLayout",new Class<?>[]{boolean.class,int.class,int.class,int.class,int.class},change,l,t,r,b);}public void native_onLayout(boolean change,int l,int t,int r,int b){}
 public void setStatusBarState(int state){AugmentModule.invoke(this,"setStatusBarState",new Class<?>[]{int.class},state);}public void native_setStatusBarState(int state){mAmbientState.mStatusBarState=state;}
 public void setIsExpanded(boolean value){AugmentModule.invoke(this,"setIsExpanded",new Class<?>[]{boolean.class},value);}public void native_setIsExpanded(boolean value){mAmbientState.mShadeExpanded=value;}
 public void updateTopPadding(float pad,boolean animate){AugmentModule.invoke(this,"updateTopPadding",new Class<?>[]{float.class,boolean.class},pad,animate);}public void native_updateTopPadding(float pad,boolean animate){mAmbientState.mTopPadding=(int)pad;}}
''',
'com/android/systemui/statusbar/notification/footer/ui/view/FooterView.java':'''package com.android.systemui.statusbar.notification.footer.ui.view;import android.view.*;import ls.augment.com.hook.AugmentModule;
 public class FooterView extends ViewGroup{public final android.widget.TextView mClearAllButton=new android.widget.TextView();public final ViewGroup content=new ViewGroup();
 public FooterView(){lp=new LayoutParams(400,100);content.lp=new LayoutParams(400,80);mClearAllButton.lp=new MarginLayoutParams(100,48);((MarginLayoutParams)mClearAllButton.lp).leftMargin=280;((MarginLayoutParams)mClearAllButton.lp).topMargin=12;mClearAllButton.background=new android.graphics.drawable.RippleDrawable();add(content);content.add(mClearAllButton);}
 public void onFinishInflate(){AugmentModule.invoke(this,"onFinishInflate",new Class<?>[]{});}public void native_onFinishInflate(){}
 public void updateColors(){AugmentModule.invoke(this,"updateColors",new Class<?>[]{});}public void native_updateColors(){mClearAllButton.background=new android.graphics.drawable.RippleDrawable();mClearAllButton.background.tint=17;}
 public void onConfigurationChanged(android.content.res.Configuration c){AugmentModule.invoke(this,"onConfigurationChanged",new Class<?>[]{android.content.res.Configuration.class},c);}public void native_onConfigurationChanged(android.content.res.Configuration c){}
 public void setClearAllButtonVisible(boolean value,boolean animate){AugmentModule.invoke(this,"setClearAllButtonVisible",new Class<?>[]{boolean.class,boolean.class},value,animate);}public void native_setClearAllButtonVisible(boolean value,boolean animate){mClearAllButton.visibility=value?VISIBLE:INVISIBLE;}}
'''
})
files['ls/augment/com/hook/FeatureSettings.java']=files['ls/augment/com/hook/FeatureSettings.java'].replace('public static int integer','public static String text(android.content.Context c,String key,String fallback){return values.getOrDefault(key,fallback);}public static int integer')
files['ls/augment/com/hook/TestNotificationAppearance.java']='''package ls.augment.com.hook;
 import ls.augment.com.*;import android.view.*;import android.widget.*;import android.graphics.drawable.*;import com.zte.controlcenter.widget.CCHeaderView;
 import com.android.systemui.statusbar.notification.stack.NotificationStackScrollLayout;import com.android.systemui.statusbar.notification.footer.ui.view.FooterView;
 public class TestNotificationAppearance{static int checks;static void check(boolean ok,String m){checks++;if(!ok)throw new AssertionError(m);}static void near(float a,float b,String m){check(Math.abs(a-b)<.01,m+" actual="+a+" expected="+b);}
 public static void main(String[] args){AugmentModule module=new AugmentModule();AugmentModule.active=module;check(NotificationAppearanceHook.install(module,TestNotificationAppearance.class.getClassLoader())==15,"native appearance signatures install");
 ViewGroup root=new ViewGroup();CCHeaderView header=new CCHeaderView();NotificationStackScrollLayout list=new NotificationStackScrollLayout();FooterView footer=new FooterView();root.lp.height=1000;list.lp.height=1000;root.add(header);root.add(list);list.add(footer);list.mFooterView=footer;
 list.onLayout(true,0,0,400,1000);header.onAttachedToWindow();footer.onFinishInflate();list.updateTopPadding(100,false);near(header.mClockView.getTextSize(),24,"default native clock");
 FeatureSettings.change(NotificationAppearanceOptions.CLOCK_PORTRAIT,"1");near(header.mClockView.getTextSize(),64,"portrait expansion uses native clock");check(list.mAmbientState.mTopPadding>100,"real notification top padding reserves clock space");
 list.mOwnScrollY=120;list.updateChildren();near(header.mClockView.getTextSize(),24,"native scroll collapses clock");list.mOwnScrollY=0;list.updateChildren();near(header.mClockView.getTextSize(),64,"native scroll reversal expands clock");
 list.setStatusBarState(1);near(header.mClockView.getTextSize(),24,"lockscreen restores native clock");near(list.mAmbientState.mTopPadding,100,"lockscreen restores native notification padding");list.setStatusBarState(0);
 header.setViewType(1);near(header.mClockView.getTextSize(),24,"control center never gains notification layout");header.setViewType(2);
 header.getResources().getConfiguration().orientation=2;header.onConfigurationChanged(header.getResources().getConfiguration());near(header.mClockView.getTextSize(),24,"landscape remains native until own switch enabled");
 FeatureSettings.change(NotificationAppearanceOptions.CLOCK_LANDSCAPE,"1");near(header.mClockView.getTextSize(),44,"landscape has independent default size");
 header.nativeSize=30;header.updateHeaderResources();FeatureSettings.change(NotificationAppearanceOptions.CLOCK_LANDSCAPE,"0");near(header.mClockView.getTextSize(),30,"disable restores latest OEM resource size, not stale first snapshot");
 check(((RelativeLayout.LayoutParams)header.right.lp).getRule(RelativeLayout.RIGHT_OF)==header.mTimeGroup.id,"restore native right icon layout rule");
 Drawable original=footer.mClearAllButton.background;int[] clicks={0};footer.mClearAllButton.click=()->clicks[0]++;footer.mClearAllButton.clickable=true;
 FeatureSettings.change(NotificationAppearanceOptions.CLEAR,"1");check(footer.mClearAllButton.background!=original,"clear appearance uses isolated drawable clone");
 RippleDrawable styled=(RippleDrawable)footer.mClearAllButton.background;check(styled.base.tint==0xE3E3E8&&styled.mask.tint==0,"tint base only and retain native ripple mask");check(((RippleDrawable)original).base.tint==0,"native drawable is not mutated");
 FeatureSettings.change(NotificationAppearanceOptions.CLEAR_ALIGN,"2");near(footer.mClearAllButton.getTranslationX(),-130,"native clear button centered without replacing view");footer.mClearAllButton.performClick();check(clicks[0]==1,"same native click listener retained");
 footer.setClearAllButtonVisible(false,false);check(footer.mClearAllButton.visibility==View.INVISIBLE,"native visibility retains final authority");int animations=android.animation.ValueAnimator.started;footer.setClearAllButtonVisible(true,false);check(android.animation.ValueAnimator.started==animations+1,"new native appearance triggers one entry animation");footer.getViewTreeObserver().draw();check(android.animation.ValueAnimator.started==animations+1,"steady draw does not restart entry");
 footer.updateColors();Drawable latest=((Drawable)footer.mClearAllButton.background);FeatureSettings.change(NotificationAppearanceOptions.CLEAR,"0");check(footer.mClearAllButton.background.tint==17&&footer.mClearAllButton.background!=latest,"disable restores latest native theme background");near(footer.mClearAllButton.getTranslationX(),0,"clear placement restored");near(footer.mClearAllButton.getTranslationY(),0,"clear entry translation restored");
 FeatureSettings.change(NotificationAppearanceOptions.CLEAR,"1");list.setStatusBarState(1);check(footer.mClearAllButton.background.tint==17,"locked shade restores clear style");
 check(module.errors==0,"no appearance hook callback failures");System.out.println("Actual NotificationAppearanceHook: "+checks+" lifecycle and restore checks passed; visual/device checks remain separate");
 }}'''
import runpy
runpy.run_path(str(ROOT/'tools/header-clock-facade-support.py'))['apply'](files)
java=Path(r'C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
with tempfile.TemporaryDirectory(prefix='lsa-notification-appearance-') as folder:
    work=Path(folder);paths=[]
    for name,code in files.items():
        path=work/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(code,encoding='utf-8');paths.append(path)
    paths += [SRC/name for name in ['HeaderClockGeometry.java','HeaderClockLayout.java','EnhancementOption.java','NotificationAppearanceOptions.java','NotificationLayoutPolicy.java','hook/SystemUiAdapter.java','hook/NotificationAppearanceHook.java','hook/NotificationViewportInset.java']]
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','--release','17','-d',folder,*map(str,paths)],check=True)
    subprocess.run([str(java/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestNotificationAppearance'],check=True,timeout=10)
