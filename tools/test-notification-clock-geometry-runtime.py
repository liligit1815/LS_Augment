"""Execute the production header hook against nested ROM anchors and delayed geometry.

This independent layout double models the verified ALIGN_BOTTOM dependency and
separate layout passes. It is not Android RelativeLayout/GPU or real-device QA.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
helper = ROOT / 'tools/test-notification-appearance-runtime.py'
scope = {'__file__': str(helper)}
exec(compile(helper.read_text(encoding='utf-8').split('java=Path(', 1)[0], str(helper), 'exec'), scope)
files = scope['files']
files['android/content/res/Resources.java'] = files['android/content/res/Resources.java'].replace(
    'public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}',
    'public static final android.util.DisplayMetrics metrics=new android.util.DisplayMetrics();public android.util.DisplayMetrics getDisplayMetrics(){return metrics;}'
)
files['android/view/View.java'] = '''package android.view;
public class View implements ViewParent {
 public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 public static final int VISIBLE=0,INVISIBLE=4,GONE=8;public int id,visibility,boxLeft,boxTop,boxWidth,boxHeight,paddingLeft,paddingRight,paddingTop,paddingBottom;
 public int layoutRequests;public boolean attached=true,clickable,rtl;public float x,y,alpha=1;public Runnable click;
 public ViewGroup parent;public ViewGroup.LayoutParams lp=new ViewGroup.LayoutParams(-1,100);public android.graphics.drawable.Drawable background;
 final android.content.Context context=new android.content.Context();final android.content.res.Resources resources=new android.content.res.Resources();final ViewTreeObserver tree=new ViewTreeObserver();
 public android.content.Context getContext(){return context;}public android.content.res.Resources getResources(){return resources;}
 public ViewParent getParent(){return parent;}public View getRootView(){return parent==null?this:parent.getRootView();}
 public int getId(){return id;}public int getVisibility(){return visibility;}public void setVisibility(int v){visibility=v;}
 public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return attached&&visibility==VISIBLE&&(parent==null||parent.isShown());}
 public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){}public ViewTreeObserver getViewTreeObserver(){return tree;}
 public View findViewById(int key){return id==key?this:null;}public int getWidth(){return boxWidth;}public int getHeight(){return boxHeight;}
 public int getMeasuredWidth(){return boxWidth;}public int getMeasuredHeight(){return boxHeight;}public int getLeft(){return boxLeft;}public int getTop(){return boxTop;}public int getBottom(){return boxTop+boxHeight;}
 public int getPaddingLeft(){return paddingLeft;}public int getPaddingRight(){return paddingRight;}public int getPaddingTop(){return paddingTop;}public int getPaddingBottom(){return paddingBottom;}
 public float getTranslationX(){return x;}public float getTranslationY(){return y;}public void setTranslationX(float value){x=value;}public void setTranslationY(float value){y=value;}
 public ViewGroup.LayoutParams getLayoutParams(){return lp;}public void setLayoutParams(ViewGroup.LayoutParams value){lp=value;layoutRequests++;}
 public void getLocationOnScreen(int[] p){p[0]=boxLeft+(int)x;p[1]=boxTop+(int)y;if(parent!=null){int[] above=new int[2];parent.getLocationOnScreen(above);p[0]+=above[0];p[1]+=above[1];}}
 public android.graphics.drawable.Drawable getBackground(){return background;}public void setBackground(android.graphics.drawable.Drawable d){background=d;}public float getAlpha(){return alpha;}
 public boolean isClickable(){return clickable;}public void performClick(){if(click!=null)click.run();}public void invalidate(){}
}'''
files['com/zte/controlcenter/widget/CCHeaderView.java'] = '''package com.zte.controlcenter.widget;
import android.view.*;import android.widget.*;import ls.augment.com.hook.AugmentModule;
public class CCHeaderView extends RelativeLayout {
 public int panelType=2;public TextView mClockView=new TextView(),mDateView=new TextView(),period=new TextView();
 public RelativeLayout mTimeGroup=new RelativeLayout(),mDateViewContainer=new RelativeLayout(),right=new RelativeLayout();
 public View icons=new View(),privacy=new View(),carrier=new View();public float nativeSize=24;public int nativeHeaderHeight=180,iconTop=46,iconHeight=20;
 public CCHeaderView(){mTimeGroup.id="time_group".hashCode();mDateViewContainer.id="date_view".hashCode();right.id="status_icons_group_container".hashCode();icons.id="status_icons_group".hashCode();period.id="am_pm_view".hashCode();privacy.id="privacy_container".hashCode();
  add(mTimeGroup);mTimeGroup.add(mClockView);mTimeGroup.add(period);add(mDateViewContainer);mDateViewContainer.add(mDateView);add(right);right.add(icons);add(privacy);add(carrier);carrier.visibility=GONE;period.visibility=GONE;native_updateHeaderResources();}
 int px(float value){return Math.round(value*getResources().getDisplayMetrics().density);}
 public void native_updateHeaderResources(){
  if(lp==null)lp=new RelativeLayout.LayoutParams(px(400),px(nativeHeaderHeight));lp.height=px(nativeHeaderHeight);
  mClockView.setTextSize(0,px(nativeSize));mDateView.setTextSize(0,px(14));mDateView.text="October 4 Sunday";
  mClockView.lp=new RelativeLayout.LayoutParams(-2,px(40));mDateView.lp=new RelativeLayout.LayoutParams(-2,px(20));
  mTimeGroup.lp=new RelativeLayout.LayoutParams(-2,-2);((RelativeLayout.LayoutParams)mTimeGroup.lp).topMargin=px(33);((RelativeLayout.LayoutParams)mTimeGroup.lp).addRule(ALIGN_PARENT_START);
  mDateViewContainer.lp=new RelativeLayout.LayoutParams(-2,-2);((RelativeLayout.LayoutParams)mDateViewContainer.lp).addRule(BELOW,mTimeGroup.id);((RelativeLayout.LayoutParams)mDateViewContainer.lp).addRule(ALIGN_PARENT_START);
  right.lp=new RelativeLayout.LayoutParams(-2,-1);RelativeLayout.LayoutParams rp=(RelativeLayout.LayoutParams)right.lp;rp.addRule(RIGHT_OF,mTimeGroup.id);rp.addRule(ALIGN_BOTTOM,mDateViewContainer.id);rp.addRule(ALIGN_PARENT_END);
  icons.lp=new RelativeLayout.LayoutParams(-1,px(iconHeight));((RelativeLayout.LayoutParams)icons.lp).topMargin=px(iconTop);
  privacy.lp=new RelativeLayout.LayoutParams(px(20),px(22));((RelativeLayout.LayoutParams)privacy.lp).topMargin=px(3);
  period.lp=new RelativeLayout.LayoutParams(px(22),px(20));period.text="PM";
 }
 public void updateHeaderResources(){AugmentModule.invoke(this,"updateHeaderResources",new Class<?>[]{});}
 public void updateVisibilities(){AugmentModule.invoke(this,"updateVisibilities",new Class<?>[]{});}public void native_updateVisibilities(){}
 public void onAttachedToWindow(){AugmentModule.invoke(this,"onAttachedToWindow",new Class<?>[]{});}public void native_onAttachedToWindow(){}
 public void onDetachedFromWindow(){AugmentModule.invoke(this,"onDetachedFromWindow",new Class<?>[]{});}public void native_onDetachedFromWindow(){attached=false;}
 public void onConfigurationChanged(android.content.res.Configuration c){AugmentModule.invoke(this,"onConfigurationChanged",new Class<?>[]{android.content.res.Configuration.class},c);}public void native_onConfigurationChanged(android.content.res.Configuration c){native_updateHeaderResources();}
 public void setViewType(int type){AugmentModule.invoke(this,"setViewType",new Class<?>[]{int.class},type);}public void native_setViewType(int type){panelType=type;}
}'''
files['ls/augment/com/hook/TestNotificationClockGeometry.java'] = '''package ls.augment.com.hook;
import java.util.*;import android.view.*;import android.widget.*;import android.content.res.Resources;import ls.augment.com.*;
import com.zte.controlcenter.widget.CCHeaderView;import com.android.systemui.statusbar.notification.stack.NotificationStackScrollLayout;
public class TestNotificationClockGeometry {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static void near(float a,float b,String why){check(Math.abs(a-b)<1.1f,why+" actual="+a+" expected="+b);}
 static int top(View v){int[] p=new int[2];v.getLocationOnScreen(p);return p[1];}static int left(View v){int[] p=new int[2];v.getLocationOnScreen(p);return p[0];}
 static int margin(View v,boolean vertical){if(!(v.lp instanceof ViewGroup.MarginLayoutParams))return 0;ViewGroup.MarginLayoutParams p=(ViewGroup.MarginLayoutParams)v.lp;return vertical?p.topMargin+p.bottomMargin:p.leftMargin+p.rightMargin;}
 static int intrinsic(View v,boolean vertical){
  if(v instanceof TextView)return Math.round(vertical?((TextView)v).getTextSize():((TextView)v).getPaint().measureText(((TextView)v).getText().toString()));
  if(v instanceof ViewGroup){int total=0;for(View child:((ViewGroup)v).children)if(child.visibility!=View.GONE){int dimension=vertical?child.lp.height:child.lp.width;total=Math.max(total,(dimension>=0?dimension:intrinsic(child,vertical))+margin(child,vertical));}return total;}
  return 0;
 }
 // setLayoutParams deliberately does not alter getWidth/getTop. Native callers
 // can observe old geometry until a separate traversal resolves sibling anchors.
 static void layout(View v,int w,int h){
  if(v.visibility==View.GONE){v.boxWidth=v.boxHeight=0;return;}
  v.boxWidth=v.lp.width>=0?v.lp.width:v.lp.width==-1?w:intrinsic(v,false);
  v.boxHeight=v.lp.height>=0?v.lp.height:v.lp.height==-1?h:intrinsic(v,true);
  if(!(v instanceof ViewGroup))return;ViewGroup parent=(ViewGroup)v;
  for(View child:parent.children){child.rtl=parent.rtl;layout(child,Math.max(0,v.boxWidth-v.paddingLeft-v.paddingRight),Math.max(0,v.boxHeight-v.paddingTop-v.paddingBottom));}
  for(int pass=0;pass<3;pass++)for(View child:parent.children){
   ViewGroup.MarginLayoutParams mp=child.lp instanceof ViewGroup.MarginLayoutParams?(ViewGroup.MarginLayoutParams)child.lp:null;
   int l=v.paddingLeft+(mp==null?0:mp.leftMargin),t=v.paddingTop+(mp==null?0:mp.topMargin);
   if(mp!=null&&mp.isMarginRelative()){if(v.rtl&&mp.startMargin!=Integer.MIN_VALUE)l=v.boxWidth-v.paddingRight-child.boxWidth-mp.startMargin;else if(!v.rtl&&mp.startMargin!=Integer.MIN_VALUE)l=v.paddingLeft+mp.startMargin;}
   if(child.lp instanceof RelativeLayout.LayoutParams){RelativeLayout.LayoutParams rp=(RelativeLayout.LayoutParams)child.lp;int id=rp.getRule(RelativeLayout.BELOW);View sibling=id==0?null:parent.findViewById(id);if(sibling!=null)t=sibling.getBottom()+rp.topMargin;
    id=rp.getRule(RelativeLayout.ALIGN_BOTTOM);sibling=id==0?null:parent.findViewById(id);if(sibling!=null)t=sibling.getBottom()-child.boxHeight-rp.bottomMargin;
    id=rp.getRule(RelativeLayout.RIGHT_OF);sibling=id==0?null:parent.findViewById(id);if(sibling!=null)l=sibling.getLeft()+sibling.getWidth()+rp.leftMargin;
    if(rp.getRule(RelativeLayout.ALIGN_PARENT_START)!=0)l=v.rtl?v.boxWidth-v.paddingRight-child.boxWidth-rp.rightMargin:v.paddingLeft+rp.leftMargin;
    if(rp.getRule(RelativeLayout.ALIGN_PARENT_END)!=0)l=v.rtl?v.paddingLeft+rp.leftMargin:v.boxWidth-v.paddingRight-child.boxWidth-rp.rightMargin;
    if(rp.getRule(RelativeLayout.ALIGN_PARENT_LEFT)!=0)l=v.paddingLeft+rp.leftMargin;
   }
   child.boxLeft=l;child.boxTop=t;
  }
 }
 static void frame(ViewGroup root,CCHeaderView h){for(int i=0;i<5;i++){layout(root,root.lp.width,root.lp.height);for(ViewTreeObserver.OnGlobalLayoutListener l:new ArrayList<>(h.getViewTreeObserver().layouts))l.onGlobalLayout();}layout(root,root.lp.width,root.lp.height);}
 static void visibleGeometry(CCHeaderView h,NotificationStackScrollLayout list,float density,String label){
  check(top(h.icons)+h.icons.getHeight()<=top(h.mTimeGroup)-Math.floor(12*density),label+": independent icon band clears the clock");
  check(top(h.mDateViewContainer)>=top(h.mTimeGroup)+h.mTimeGroup.getHeight(),label+": date stays below full clock bounds");
  check(top(h.mDateView)+h.mDateView.getHeight()<=top(h)+h.getHeight(),label+": outer header contains date");
  check(list.mAmbientState.mTopPadding>=top(h)+h.getHeight()-top(list),label+": list padding follows entire header not local child coordinates; padding="+list.mAmbientState.mTopPadding+" header="+top(h)+"/"+h.getHeight()+" stack="+top(list)+" owns="+NotificationAppearanceHook.ownsClock(h.mClockView));
  for(View text:new View[]{h.mTimeGroup,h.mDateViewContainer}){check(left(text)>=left(h)+h.paddingLeft+Math.floor(16*density),label+": left inset preserved");check(left(text)+text.getWidth()<=left(h)+h.getWidth()-h.paddingRight-Math.floor(16*density)+1,label+": right inset preserved");}
  RelativeLayout.LayoutParams rp=(RelativeLayout.LayoutParams)h.right.lp;
  check(rp.getRule(RelativeLayout.ALIGN_BOTTOM)==0&&rp.getRule(RelativeLayout.RIGHT_OF)==0&&rp.getRule(RelativeLayout.END_OF)==0,label+": native date/clock anchors removed together");
  check(!rp.isMarginRelative()&&!((RelativeLayout.LayoutParams)h.mTimeGroup.lp).isMarginRelative(),label+": physical left/right options have no RTL margin collision");
 }
 public static void main(String[] args){
  AugmentModule module=new AugmentModule();AugmentModule.active=module;NotificationAppearanceHook.install(module,TestNotificationClockGeometry.class.getClassLoader());
  for(float density:new float[]{1,3.25f})for(float font:new float[]{1,1.8f})for(boolean rtl:new boolean[]{false,true})for(boolean wide:new boolean[]{false,true}){
   Resources.metrics.density=density;Resources.metrics.scaledDensity=density*font;Resources.config.orientation=wide?2:1;
   FeatureSettings.values.clear();FeatureSettings.values.put(NotificationAppearanceOptions.clock(wide,"enabled"),"1");
   ViewGroup root=new ViewGroup();root.lp=new ViewGroup.LayoutParams(Math.round((wide?700:400)*density),Math.round((wide?350:900)*density));root.rtl=rtl;
   CCHeaderView header=new CCHeaderView();header.lp.width=root.lp.width;header.paddingLeft=Math.round(7*density);header.paddingRight=Math.round(19*density);header.paddingTop=Math.round(5*density);header.paddingBottom=Math.round(3*density);
   if(wide){header.iconTop=9;header.native_updateHeaderResources();}NotificationStackScrollLayout list=new NotificationStackScrollLayout();list.lp=new ViewGroup.LayoutParams(root.lp.width,root.lp.height);root.add(header);root.add(list);
   layout(root,root.lp.width,root.lp.height);int originalRightWidth=header.right.getWidth(),originalHeaderHeight=header.lp.height;int[] clicks={0};header.mClockView.click=()->clicks[0]++;
   list.onLayout(true,0,0,root.lp.width,root.lp.height);header.onAttachedToWindow();frame(root,header);
   String label=density+"/"+font+"/rtl="+rtl+"/wide="+wide;
   check(NotificationAppearanceHook.ownsClock(header.mClockView),label+": custom clock owns this scene");visibleGeometry(header,list,density,label);
   near(header.right.getWidth(),header.getWidth()-header.paddingLeft-header.paddingRight,label+": icon width derives from current header not prior native half");
   check(header.right.getWidth()!=originalRightWidth,label+": original measured right width is not frozen");
   int iconTop=top(header.icons),iconHeight=header.icons.getHeight();list.mOwnScrollY=Math.round(120*density);list.updateChildren();frame(root,header);
   near(top(header.icons),iconTop,label+": icon row does not follow clock collapse");near(header.icons.getHeight(),iconHeight,label+": native icon height unchanged");
   visibleGeometry(header,list,density,label+" collapsed");list.mOwnScrollY=0;list.updateChildren();frame(root,header);
   header.mClockView.performClick();check(clicks[0]==1,label+": original native clock listener remains attached");
   for(int align=0;align<3;align++){FeatureSettings.values.put(NotificationAppearanceOptions.clock(wide,"align"),""+align);FeatureSettings.values.put(NotificationAppearanceOptions.clock(wide,"x"),align==0?"-120":"120");frame(root,header);visibleGeometry(header,list,density,label+" align="+align);}
   FeatureSettings.values.put(NotificationAppearanceOptions.clock(wide,"x"),"0");
   int requests=header.layoutRequests+header.right.layoutRequests+header.mTimeGroup.layoutRequests+header.mDateViewContainer.layoutRequests;for(int i=0;i<20;i++)frame(root,header);
   int requestsAfter=header.layoutRequests+header.right.layoutRequests+header.mTimeGroup.layoutRequests+header.mDateViewContainer.layoutRequests;
   // First traversal applies the just-changed x; subsequent traversals must settle.
   check(requestsAfter-requests<=2,label+": steady global layout does not request endless re-layout");
   if(wide)check(list.getHeight()-list.mAmbientState.mTopPadding>=Math.floor(150*density),label+": landscape keeps a useful notification viewport");
   FeatureSettings.values.put(NotificationAppearanceOptions.clock(wide,"enabled"),"0");frame(root,header);
   check(header.lp.height==originalHeaderHeight,label+": disabling restores outer native header height");
   check(((RelativeLayout.LayoutParams)header.right.lp).getRule(RelativeLayout.ALIGN_BOTTOM)==header.mDateViewContainer.id,label+": disabling restores original bottom anchor");
   check(header.right.lp.width==-2&&header.right.lp.height==-1,label+": disabling restores native dynamic measurement modes");
   check(header.mDateView.getEllipsize()==null,label+": disabling restores native date ellipsis policy");
   header.onDetachedFromWindow();
  }
  Resources.metrics.density=1;Resources.metrics.scaledDensity=1;Resources.config.orientation=1;FeatureSettings.values.clear();FeatureSettings.values.put(NotificationAppearanceOptions.CLOCK_PORTRAIT,"1");FeatureSettings.values.put(NotificationAppearanceOptions.CLOCK_LANDSCAPE,"1");
  ViewGroup root=new ViewGroup();root.lp=new ViewGroup.LayoutParams(400,900);CCHeaderView h=new CCHeaderView();h.lp.width=400;NotificationStackScrollLayout list=new NotificationStackScrollLayout();list.lp=new ViewGroup.LayoutParams(400,900);root.add(h);root.add(list);layout(root,400,900);list.onLayout(true,0,0,400,900);h.onAttachedToWindow();frame(root,h);
  int oldBand=h.right.getHeight();Resources.config.orientation=2;root.lp.width=700;root.lp.height=350;list.lp.width=700;list.lp.height=350;h.lp.width=700;h.nativeHeaderHeight=130;h.iconTop=9;h.iconHeight=18;
  h.onConfigurationChanged(Resources.config);
  // The right parent now reserves the complete footer as well as the native icon
  // row; the row itself must still read the newly supplied 9 + 18 resource box.
  check(h.icons.lp.height==18&&((RelativeLayout.LayoutParams)h.icons.lp).topMargin==9&&h.right.lp.height>=27&&h.right.getHeight()==oldBand,"configuration callback reads new icon layout params while old measured bounds are still present");
  frame(root,h);visibleGeometry(h,list,1,"rotation settled");check(h.icons.getHeight()==18&&top(h.icons)-top(h.right)==9&&h.right.getWidth()==700,"rotation recomputes current band dimensions without old width/height cache");
  FeatureSettings.values.put(NotificationAppearanceOptions.clock(true,"date_size"),"24");h.mDateView.text="A very long localized date that must stay inside the screen";frame(root,h);visibleGeometry(h,list,1,"long date");check(h.mDateView.getEllipsize()==null&&h.mDateView.getTextSize()==24&&h.mDateView.getText().toString().equals("A very long localized date that must stay inside the screen"),"long date retains original content/size using bounded multiline layout");
  FeatureSettings.values.put(NotificationAppearanceOptions.CLOCK_LANDSCAPE,"0");frame(root,h);check(h.lp.height==130,"rotation disable restores latest OEM outer height");
  FeatureSettings.values.put(NotificationAppearanceOptions.CLOCK_LANDSCAPE,"1");frame(root,h);h.lp.width=690;h.lp.height=154;h.mTimeGroup.x=3;h.mTimeGroup.y=4;frame(root,h);
  FeatureSettings.values.put(NotificationAppearanceOptions.CLOCK_LANDSCAPE,"0");frame(root,h);check(h.lp.width==690&&h.lp.height==154,"external native parent width and latest height survive disable");near(h.mTimeGroup.x,3,"unowned native horizontal animation survives restore");near(h.mTimeGroup.y,4,"unowned native vertical animation survives restore");h.mTimeGroup.x=h.mTimeGroup.y=0;
  FeatureSettings.values.put(NotificationAppearanceOptions.CLOCK_LANDSCAPE,"1");h.period.visibility=View.VISIBLE;h.carrier.visibility=View.VISIBLE;h.carrier.lp=new RelativeLayout.LayoutParams(100,32);((RelativeLayout.LayoutParams)h.carrier.lp).addRule(RelativeLayout.BELOW,h.mDateViewContainer.id);((RelativeLayout.LayoutParams)h.carrier.lp).topMargin=7;frame(root,h);
  visibleGeometry(h,list,1,"native period and below-date payload");check(top(h.carrier)+h.carrier.getHeight()<=top(h)+h.getHeight(),"header height includes native below-date carrier/data content");
  h.carrier.visibility=View.GONE;h.period.visibility=View.GONE;root.lp.height=100;list.lp.height=100;frame(root,h);
  check(!NotificationAppearanceHook.ownsClock(h.mClockView),"impossibly short viewport uses native layout instead of hiding date or notifications");
  int requests=h.layoutRequests+h.right.layoutRequests+h.mTimeGroup.layoutRequests+h.mDateViewContainer.layoutRequests;
  for(int i=0;i<30;i++)frame(root,h);check(requests==h.layoutRequests+h.right.layoutRequests+h.mTimeGroup.layoutRequests+h.mDateViewContainer.layoutRequests,"insufficient-height fallback does not oscillate through apply/restore on every traversal");
  root.lp.height=350;list.lp.height=350;frame(root,h);check(NotificationAppearanceHook.ownsClock(h.mClockView),"viewport growth retries previously rejected clock geometry");visibleGeometry(h,list,1,"viewport recovery");
  FeatureSettings.values.put(NotificationAppearanceOptions.CLOCK_LANDSCAPE,"0");frame(root,h);root.children.remove(h);root.lp.height=500;ViewGroup wrapper=new ViewGroup();wrapper.lp=new ViewGroup.MarginLayoutParams(700,450);((ViewGroup.MarginLayoutParams)wrapper.lp).topMargin=48;root.add(wrapper);wrapper.add(h);h.lp=new FrameLayout.LayoutParams(-1,130);
  // Keep this coordinate-conversion case large enough for the preceding full
  // localized date; insufficient-height native fallback is asserted above.
  list.lp=new ViewGroup.MarginLayoutParams(700,500);((ViewGroup.MarginLayoutParams)list.lp).topMargin=16;
  FeatureSettings.values.put(NotificationAppearanceOptions.CLOCK_LANDSCAPE,"1");frame(root,h);visibleGeometry(h,list,1,"different native header/list parent offsets");
  near(list.mAmbientState.mTopPadding,top(h)+h.getHeight()-top(list)+16,"padding conversion uses shared screen space across nested native parents");
  check(module.errors==0,"all header geometry callbacks complete without runtime failure");
  Resources.metrics.density=Resources.metrics.scaledDensity=1;Resources.config.orientation=1;
  FeatureSettings.values.put(NotificationAppearanceOptions.CLOCK_PORTRAIT,"0");FeatureSettings.values.put("ls_augment_rm_qs_clock_period","1");
  ViewGroup stableRoot=new ViewGroup();stableRoot.lp=new ViewGroup.LayoutParams(400,900);CCHeaderView stable=new CCHeaderView();stable.lp.width=400;
  NotificationStackScrollLayout stableList=new NotificationStackScrollLayout();stableList.lp=new ViewGroup.LayoutParams(400,900);stableRoot.add(stable);stableRoot.add(stableList);
  stable.mClockView.text="12:11:00 中午";stable.icons.lp.width=50;layout(stableRoot,400,900);stableList.onLayout(true,0,0,400,900);stable.onAttachedToWindow();frame(stableRoot,stable);
  int clockTop=top(stable.mTimeGroup),dateTop=top(stable.mDateViewContainer),headerHeight=stable.getHeight();float listTop=stableList.mAmbientState.mTopPadding;
  for(int iconWidth:new int[]{50,180,70,200,50}){stable.icons.lp.width=iconWidth;stable.mClockView.text="12:11:58 中午";frame(stableRoot,stable);
    near(top(stable.mTimeGroup),clockTop,"period time remains at one Y across Bluetooth widths");near(top(stable.mDateViewContainer),dateTop,"period date remains stable");
    near(stable.getHeight(),headerHeight,"period header height remains stable");near(stableList.mAmbientState.mTopPadding,listTop,"period notification padding remains stable");}
  System.out.println("Notification clock production geometry: "+checks+" delayed-layout/anchor/RTL/font/rotation checks passed; Android rendering and touch remain unverified");
 }
}'''

import runpy
runpy.run_path(str(ROOT/'tools/header-clock-facade-support.py'))['apply'](files)
java = Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
with tempfile.TemporaryDirectory(prefix='duo-clock-geometry-') as folder:
    target=Path(folder);sources=[]
    for name, content in files.items():
        path=target/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,encoding='utf-8');sources.append(path)
    sources += [SRC/name for name in ('HeaderClockGeometry.java','HeaderClockLayout.java','EnhancementOption.java','NotificationAppearanceOptions.java','NotificationLayoutPolicy.java','hook/SystemUiAdapter.java','hook/NotificationAppearanceHook.java','hook/NotificationViewportInset.java')]
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','--release','17','-d',folder,*map(str,sources)],check=True)
    subprocess.run([str(java/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestNotificationClockGeometry'],check=True,timeout=20)
    # Reintroduce the device-observed incomplete anchor cleanup. The independent
    # traversal must reject it; counting production method calls is insufficient.
    source=(SRC/'HeaderClockLayout.java').read_text(encoding='utf-8')
    marker='for(int i=0;i<rules.length;i++)p.removeRule(i);'
    assert marker in source
    mutant=target/'mutant/ls/augment/com/HeaderClockLayout.java';mutant.parent.mkdir(parents=True,exist_ok=True)
    mutant.write_text(source.replace(marker,'for(int i=0;i<rules.length;i++)if(i!=RelativeLayout.ALIGN_BOTTOM)p.removeRule(i);'),encoding='utf-8')
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','--release','17','-cp',folder,'-d',folder,str(mutant)],check=True)
    rejected=subprocess.run([str(java/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestNotificationClockGeometry'],text=True,capture_output=True,timeout=20)
    assert rejected.returncode!=0 and ('independent icon band clears the clock' in rejected.stderr or 'native date/clock anchors removed together' in rejected.stderr),rejected.stdout+rejected.stderr
    print('PASS real-device ALIGN_BOTTOM regression mutant rejected by independent nested geometry')
