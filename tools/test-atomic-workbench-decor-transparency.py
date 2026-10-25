"""Couple the real SystemUI hint/commit hook, exact native client wire and WMS overlay resolver."""
from pathlib import Path
import argparse, runpy

ROOT=Path(__file__).resolve().parents[1]
B=runpy.run_path(str(ROOT/'tools/test-atomic-workbench-extraction-system.py'))
G=B['run'].__globals__
S=G['S']
S.pop('ls/augment/com/hook/AtomicWorkbenchDecorTransparency.java')
G['FILES'].append('hook/AtomicWorkbenchDecorTransparency.java')
S['android/graphics/Rect.java']=S['android/graphics/Rect.java'].replace('public boolean contains(', 'public int width(){return right-left;}public int height(){return bottom-top;}public boolean isEmpty(){return right<=left||bottom<=top;}public boolean contains(',1)
S['android/graphics/Region.java']=S['android/graphics/Region.java'].replace('public Rect bounds=', 'public enum Op{INTERSECT}public Region(){}public Region(Region r){bounds=new Rect(r.bounds);}public boolean op(Rect r,Op op){return bounds.intersect(r);}public Rect bounds=',1)
S['android/view/WindowManager.java']=S['android/view/WindowManager.java'].replace('public float alpha=1;', 'public static final int PRIVATE_FLAG_IS_ROUNDED_CORNERS_OVERLAY=1,PRIVATE_FLAG_TRUSTED_OVERLAY=2,TYPE_NAVIGATION_BAR_PANEL=2024;public String packageName="com.android.systemui";public int privateFlags;public android.graphics.Rect surfaceInsets=new android.graphics.Rect();public float alpha=1;')
S['android/view/View.java']='''package android.view;public class View{public Display display=new Display();public Display getDisplay(){return display;}}'''
S['android/view/SurfaceControl.java']='''package android.view;import android.graphics.Region;import java.util.*;public class SurfaceControl{public int id=42;public boolean valid=true;public boolean isValid(){return valid;}public int getLayerId(){return id;}public interface TransactionCommittedListener{void onTransactionCommitted();}public static class Transaction{public List<Runnable> commits=new ArrayList<>();public boolean fail;public Transaction setTransparentRegionHint(SurfaceControl s,Region r){if(fail)throw new IllegalStateException("native hint failure");return this;}public Transaction addTransactionCommittedListener(java.util.concurrent.Executor e,TransactionCommittedListener l){commits.add(()->e.execute(l::onTransactionCommitted));return this;}public void apply(){for(Runnable r:List.copyOf(commits))r.run();commits.clear();}}}'''
S['android/view/IWindow.java']='''package android.view;public interface IWindow{class Stub extends android.os.Binder{public int originals;@Override public boolean onTransact(int code,android.os.Parcel d,android.os.Parcel r,int flags){originals++;return false;}}}'''
S['android/view/ViewRootImpl.java']='''package android.view;import android.graphics.*;public class ViewRootImpl{public Object mTranslator;public int mWidth=1080,mHeight=2400;public Rect mWinFrame=new Rect(0,0,1080,2400);public View mView=new View();public WindowManager.LayoutParams mWindowAttributes=new WindowManager.LayoutParams();public SurfaceControl surface=new SurfaceControl();public Runnable body;public void performTraversals(){if(body!=null)body.run();}public SurfaceControl getSurfaceControl(){return surface;}public W mWindow=new W(this);public static class SubW extends W{public SubW(ViewRootImpl r){super(r);}}public static class W extends IWindow.Stub{public java.lang.ref.WeakReference<ViewRootImpl> mViewAncestor;public ls.augment.com.hook.AugmentModule module;public Runnable beforeReply;public W(ViewRootImpl root){mViewAncestor=new java.lang.ref.WeakReference<>(root);}@Override public boolean transact(int c,android.os.Parcel d,android.os.Parcel r,int f)throws java.lang.Exception{if(Thread.holdsLock(com.android.server.wm.WindowManagerService.LOCK))throw new AssertionError("decor query under WMS lock");if(beforeReply!=null)beforeReply.run();try{return(Boolean)module.invoke(this,"onTransact",new Class<?>[]{int.class,android.os.Parcel.class,android.os.Parcel.class,int.class},c,d,r,f|0x10);}catch(java.lang.Exception e){throw e;}catch(Throwable t){throw new AssertionError(t);}}}}'''
S['com/android/server/wm/WindowState.java']=S['com/android/server/wm/WindowState.java'].replace('public int mOwnerUid=', 'public static class Direct{public android.view.SurfaceControl mSurfaceControl;}public static class DirectSub extends Direct{}public static class Ambiguous{public Object mSurfaceControl;public Controller mSurfaceController=new Controller();}public static class Missing{}public static class Token{public boolean mRoundedCornerOverlay;}public static class Animator{public Controller mSurfaceController=new Controller();}public static class Controller{public android.view.SurfaceControl mSurfaceControl=new android.view.SurfaceControl();}public Token mToken=new Token();public Object mWinAnimator=new Animator();public boolean mOwnerCanAddInternalSystemWindow=true;public int mOwnerUid=',1)
S['android/os/Parcel.java']=S['android/os/Parcel.java'].replace('return v.size()*32;', 'return v.size()*8;')
S['ls/augment/com/hook/TestDecorTransparency.java']=r'''package ls.augment.com.hook;
import android.graphics.*;import android.os.*;import android.view.*;import java.lang.reflect.*;
public final class TestDecorTransparency{
static int checks,cases;static void ok(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
interface Action{void run()throws Throwable;}static void test(String name,Action action)throws Throwable{action.run();cases++;System.out.println("PASS decor: "+name);}
static class F extends TestExtractionSystem.Fixture{
final ViewRootImpl root=new ViewRootImpl();final SurfaceControl.Transaction transaction=new SurfaceControl.Transaction();final com.android.server.wm.WindowState overlay=new com.android.server.wm.WindowState();
F()throws Exception{super();Field installed=AtomicWorkbenchDecorTransparency.class.getDeclaredField("installed");installed.setAccessible(true);installed.setBoolean(null,false);Field p=AtomicWorkbenchDecorTransparency.class.getDeclaredField("proofs");p.setAccessible(true);((java.util.Map<?,?>)p.get(null)).clear();ok(AtomicWorkbenchDecorTransparency.install(module,getClass().getClassLoader())==1,"decor install unavailable");root.mWindowAttributes.type=2024;root.mWindowAttributes.flags=16;root.mWindowAttributes.privateFlags=3;root.mWindow.module=module;overlay.mAttrs=root.mWindowAttributes;overlay.mToken.mRoundedCornerOverlay=true;overlay.mClient=root.mWindow;((com.android.server.wm.WindowState.Animator)overlay.mWinAnimator).mSurfaceController.mSurfaceControl=root.surface;overlay.content=source.content;overlay.mOwnerUid=10101;overlay.mSession.mPid=789;wm.mRoot.display.windows.add(0,overlay);}
void hint(Region region,boolean commit)throws Throwable{root.body=()->{try{module.invoke(transaction,"setTransparentRegionHint",new Class<?>[]{SurfaceControl.class,Region.class},root.surface,region);}catch(Throwable t){throw new RuntimeException(t);}};module.invoke(root,"performTraversals",new Class<?>[0]);if(commit)transaction.apply();}
Region clear(){Region r=new Region();r.bounds=new Rect(20,100,1060,2300);return r;}
boolean query(int caller,int flags,int layer,int x,int y,boolean tail,int forced)throws Throwable{Binder.uid=caller;Parcel d=Parcel.obtain(),r=Parcel.obtain();d.writeInterfaceToken(AtomicWorkbenchDecorTransparency.DESCRIPTOR);d.writeInt(1);d.writeString("f".repeat(32));for(int n:new int[]{layer,0,1080,2400,x,y})d.writeInt(n);if(tail)d.writeInt(9);d.forcedSize=forced;module.invoke(root.mWindow,"onTransact",new Class<?>[]{int.class,Parcel.class,Parcel.class,int.class},AtomicWorkbenchDecorTransparency.TRANSACTION,d,r,flags);r.readException();ok(r.readInt()==1&&"f".repeat(32).equals(r.readString()),"decor reply framing");return r.readInt()==1&&r.dataAvail()==0;}
boolean query()throws Throwable{return query(1000,0,42,100,200,false,-1);}
AtomicWorkbenchExtractionWindowResolver.Window resolve()throws Exception{Binder.uid=1000;return new AtomicWorkbenchExtractionWindowResolver(wm,getClass().getClassLoader()).window(0,0,100,200);}
void denied(String why)throws Exception{try{resolve();throw new AssertionError(why);}catch(AtomicWorkbenchExtractionWindowResolver.Refusal expected){ok(true,"refused");}}
}
public static void run()throws Throwable{
test("real committed native hint traverses exact IWindow and resolver outside WMS lock",()->{F f=new F();f.hint(f.clear(),false);ok(!f.query(),"uncommitted hint accepted");f.transaction.apply();ok(f.query(),"committed transparent point denied");ok(f.resolve().state==f.source,"committed native transparency not used");});
test("opaque and empty declared areas remain blocked",()->{F f=new F();f.hint(f.clear(),true);ok(!f.query(1000,0,42,2,2,false,-1),"opaque decoration corner accepted");Region empty=f.clear();empty.bounds=new Rect();f.hint(empty,true);f.denied("empty transparency bypassed");});
test("uncommitted replacement revokes former transparency",()->{F f=new F();f.hint(f.clear(),true);f.hint(f.clear(),false);ok(!f.query(),"old committed proof survived replacement");f.denied("pending compositor submission accepted");});
test("late commit of replaced hint cannot resurrect old region",()->{F f=new F();f.hint(f.clear(),false);Region empty=f.clear();empty.bounds=new Rect();f.hint(empty,false);f.transaction.apply();ok(!f.query(),"old commit resurrected clear area");});
test("hint outside original traversal revokes previous proof",()->{F f=new F();f.hint(f.clear(),true);f.module.invoke(f.transaction,"setTransparentRegionHint",new Class<?>[]{SurfaceControl.class,Region.class},f.root.surface,f.clear());ok(!f.query(),"unassociated native hint retained old proof");});
test("native hint throw leaves no usable old proof and preserves throw",()->{F f=new F();f.hint(f.clear(),true);f.transaction.fail=true;boolean threw=false;try{f.hint(f.clear(),true);}catch(RuntimeException expected){threw=true;}ok(threw&&!f.query(),"native failure swallowed or old hint retained");});
test("surface invalidity and generation changes reject",()->{for(int mode=0;mode<2;mode++){F f=new F();f.hint(f.clear(),true);if(mode==0)f.root.surface.valid=false;else f.root.surface.id++;ok(!f.query(),"changed native surface accepted");}});
test("wrong caller flags size and packet tails reject",()->{for(int mode=0;mode<5;mode++){F f=new F();f.hint(f.clear(),true);Binder.uid=1000;Parcel d=Parcel.obtain(),r=Parcel.obtain();d.writeInterfaceToken(AtomicWorkbenchDecorTransparency.DESCRIPTOR);d.writeInt(1);d.writeString("f".repeat(32));for(int n:new int[]{42,0,1080,2400,100,200})d.writeInt(n);if(mode==3)d.writeInt(9);if(mode==4)d.forcedSize=257;Binder.uid=mode==0?0:mode==1?10101:1000;f.module.invoke(f.root.mWindow,"onTransact",new Class<?>[]{int.class,Parcel.class,Parcel.class,int.class},AtomicWorkbenchDecorTransparency.TRANSACTION,d,r,mode==2?1:0);r.readException();r.readInt();r.readString();ok(r.readInt()==0,"invalid decor query admitted");}});
test("unknown native geometry scale and inset reject",()->{for(int mode=0;mode<4;mode++){F f=new F();if(mode==0)f.root.mTranslator=new Object();if(mode==1)f.root.mWidth--;if(mode==2)f.root.mWinFrame.left=1;if(mode==3)f.root.mWindowAttributes.surfaceInsets.right=1;f.hint(f.clear(),true);ok(!f.query(),"unknown native calibration accepted");}});
test("untrusted touchable nondecor and unrelated package stay blocked",()->{for(int mode=0;mode<5;mode++){F f=new F();f.hint(f.clear(),true);if(mode==0)f.overlay.mAttrs.privateFlags=1;if(mode==1)f.overlay.mAttrs.flags=0;if(mode==2)f.overlay.mToken.mRoundedCornerOverlay=false;if(mode==3)f.overlay.mOwnerCanAddInternalSystemWindow=false;if(mode==4)f.overlay.mAttrs.packageName="other";f.denied("unsupported overlay bypassed");}});
test("native surface change during remote query rejects",()->{F f=new F();f.hint(f.clear(),true);f.root.mWindow.beforeReply=()->{f.root.surface.id++;};f.denied("surface swap during query accepted");});
test("wrong display point and layer cannot use committed proof",()->{F f=new F();f.hint(f.clear(),true);ok(!f.query(1000,0,43,100,200,false,-1),"other layer used proof");ok(!f.query(1000,0,42,1080,200,false,-1),"offscreen point accepted");});
test("a new non-touchable cover during remote read is rejected",()->{F f=new F();f.hint(f.clear(),true);f.root.mWindow.beforeReply=()->{var other=new com.android.server.wm.WindowState();other.mAttrs.flags=16;f.wm.mRoot.display.windows.add(0,other);};f.denied("new cover during remote read accepted");});
test("secure decorations never grant transparency",()->{for(int mode=0;mode<2;mode++){F f=new F();f.hint(f.clear(),true);if(mode==0)f.overlay.mAttrs.flags|=8192;else f.overlay.secure=true;f.denied("secure decor accepted");}});
test("no installed commit adapter retains original refusal",()->{F f=new F();f.denied("missing native transparency accepted");});
test("original IWindow client subclass retains its native root association",()->{F f=new F();f.root.mWindow=new ViewRootImpl.SubW(f.root);f.root.mWindow.module=f.module;f.overlay.mClient=f.root.mWindow;f.hint(f.clear(),true);ok(f.resolve().state==f.source,"native client subclass rejected");});
test("native animator direct surface and its subclass use the same actual layer",()->{for(boolean sub:new boolean[]{false,true}){F f=new F();var animator=sub?new com.android.server.wm.WindowState.DirectSub():new com.android.server.wm.WindowState.Direct();animator.mSurfaceControl=f.root.surface;f.overlay.mWinAnimator=animator;f.hint(f.clear(),true);ok(f.resolve().state==f.source,"native direct surface unavailable");}});
test("present invalid direct surface cannot fall back to legacy controller",()->{F f=new F();var animator=new com.android.server.wm.WindowState.Ambiguous();animator.mSurfaceControl=f.root.surface;animator.mSurfaceController.mSurfaceControl=f.root.surface;f.overlay.mWinAnimator=animator;f.hint(f.clear(),true);f.denied("invalid direct field fell through to legacy");});
test("missing and null native surface interfaces retain refusal",()->{for(boolean missing:new boolean[]{true,false}){F f=new F();f.overlay.mWinAnimator=missing?new com.android.server.wm.WindowState.Missing():new com.android.server.wm.WindowState.Direct();f.hint(f.clear(),true);f.denied("unknown native surface accepted");}});
System.out.println("DECOR TRANSPARENCY RESULT "+cases+" cases "+checks+" assertions");
}}
'''
G['TEST']=G['TEST'].replace('System.out.println("EXTRACTION SYSTEM RESULT ', 'TestDecorTransparency.run();System.out.println("EXTRACTION SYSTEM RESULT ',1)

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--negative-controls',action='store_true');args=parser.parse_args()
    result=G['run']()
    if result.returncode:raise AssertionError(result.stdout+result.stderr)
    print(result.stdout,end='')
    if args.negative_controls:
        path='hook/AtomicWorkbenchDecorTransparency.java';text=(B['SRC']/path).read_text(encoding='utf-8')
        variants=[
            ('proof.committed&&','true&&','uncommitted hint accepted'),
            ('proofs.values().removeIf(proof->proof.layer==changed);','/* stale proof retained */','unassociated native hint retained old proof'),
            ('&&proof.region.contains(x,y);','&&true;','opaque decoration corner accepted'),
            ('Binder.getCallingUid()!=1000','false','invalid decor query admitted'),
            ('(flags&trusted)!=0','true','unsupported overlay bypassed'),
        ]
        for before,after,witness in variants:
            assert text.count(before)==1,before
            result=G['run']({path:text.replace(before,after)})
            assert result.returncode!=0 and witness in result.stdout+result.stderr,result.stdout+result.stderr
            print('PASS decor negative: '+witness)

if __name__=='__main__':main()
