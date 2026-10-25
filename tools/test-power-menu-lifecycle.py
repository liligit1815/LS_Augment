"""Exercise the real OEM-dismiss repair without Android, Root, menu interaction or reboot."""
from pathlib import Path
import ast
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
tree = ast.parse((ROOT / 'tools/test-back-gesture-runtime.py').read_text(encoding='utf-8'))
base = next(ast.literal_eval(n.value) for n in tree.body if isinstance(n, ast.Assign)
            and any(isinstance(t, ast.Name) and t.id == 'files' for t in n.targets))
files = {k: v for k, v in base.items() if k.startswith('io/') or k.endswith('/AugmentModule.java')}
files.update({
    'android/content/Context.java': 'package android.content;public class Context{}',
    'android/content/DialogInterface.java': '''package android.content;public interface DialogInterface{
      interface OnDismissListener{void onDismiss(DialogInterface dialog);}}''',
    'android/os/Message.java': 'package android.os;public class Message{public Object obj;public Message(Object o){obj=o;}}',
    'android/app/Dialog.java': '''package android.app;import android.content.*;import android.os.Message;
      public class Dialog implements DialogInterface {
        private Message mDismissMessage;public boolean showing,listenerFailure;public int nativeStops;
        public static final java.util.List<Runnable> queue=new java.util.ArrayList<>();
        public Context getContext(){return new Context();}public boolean isShowing(){return showing;}
        public void setOnDismissListener(OnDismissListener listener){if(listenerFailure)throw new IllegalStateException("listener owned");mDismissMessage=listener==null?null:new Message(listener);}
        public Message listener(){return mDismissMessage;}
        public void finishDismiss(){nativeStops++;showing=false;Message pending=mDismissMessage;
          if(pending!=null)queue.add(()->((OnDismissListener)pending.obj).onDismiss(this));}
        public static void drain(){while(!queue.isEmpty())queue.remove(0).run();}
        public void show(){}public void dispatchOnStart(){}
      }''',
    'com/android/systemui/plugins/GlobalActions.java': '''package com.android.systemui.plugins;
      public interface GlobalActions{interface GlobalActionsManager{void onGlobalActionsHidden();}}''',
    'com/android/systemui/globalactions/GlobalActionsDialogLite.java': '''package com.android.systemui.globalactions;
      public class GlobalActionsDialogLite{public android.app.Dialog mDialog;
        public com.android.systemui.plugins.GlobalActions.GlobalActionsManager mWindowManagerFuncs;}''',
    'com/zte/feature/globalaction/MfvGlobalActionsDialog.java': '''package com.zte.feature.globalaction;
      public class MfvGlobalActionsDialog extends com.android.systemui.globalactions.GlobalActionsDialogLite{
        public class MFVActionsDialog extends android.app.Dialog{public boolean failStart;public int starts;
          public Object owner(){return MfvGlobalActionsDialog.this;}
          public void onStart(){starts++;if(failStart)throw new IllegalArgumentException("OEM start");}
        }
      }''',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;class FeatureSettings{
      static String state="";static boolean fail;static void diagnostic(android.content.Context c,String k,String v){
        if(fail)throw new IllegalStateException("diagnostic failed");state=v;}}''',
    'ls/augment/com/hook/TestPowerMenuLifecycle.java': '''package ls.augment.com.hook;
      import android.app.Dialog;import android.content.DialogInterface;import com.zte.feature.globalaction.MfvGlobalActionsDialog;
      import com.zte.feature.globalaction.MfvGlobalActionsDialog.MFVActionsDialog;
      public class TestPowerMenuLifecycle {
        static int checks;static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
        public static class Manager implements com.android.systemui.plugins.GlobalActions.GlobalActionsManager{
          boolean mShowing,fail;int hidden,fallback;public void onGlobalActionsHidden(){hidden++;if(fail)throw new IllegalStateException("binder");mShowing=false;}
          void providerLost(){if(mShowing)fallback++;}
        }
        static class Session{final MfvGlobalActionsDialog owner=new MfvGlobalActionsDialog();final Manager manager=new Manager();
          Session(){owner.mWindowManagerFuncs=manager;}
          MFVActionsDialog open()throws Throwable{MFVActionsDialog d=owner.new MFVActionsDialog();show(d);return d;}
          void show(MFVActionsDialog d)throws Throwable{owner.mDialog=d;Object result=AugmentModule.call(d,MFVActionsDialog.class,"onStart",new Class[]{});
            check(result==null,"native void result unchanged");d.showing=true;manager.mShowing=true;}
          void close(MFVActionsDialog d){d.finishDismiss();if(owner.mDialog==d)owner.mDialog=null;}
        }
        public static void main(String[] args)throws Throwable{
          AugmentModule m=new AugmentModule();AugmentModule.active=m;
          if(args.length==0)PowerMenuLifecycleHook.install(m,TestPowerMenuLifecycle.class.getClassLoader());
          Session a=new Session();MFVActionsDialog first=a.open();a.close(first);Dialog.drain();
          check(!a.manager.mShowing,"closed OEM menu must clear framework mShowing before SystemUI restart");
          a.manager.providerLost();check(a.manager.fallback==0,"closed menu does not trigger legacy fallback on provider loss");
          check(a.manager.hidden==1&&first.nativeStops==1,"one original close and one hidden notification");
          ((DialogInterface.OnDismissListener)first.listener().obj).onDismiss(first);
          check(a.manager.hidden==1,"duplicate dismiss notification is ignored");
          MFVActionsDialog visible=a.open();a.manager.providerLost();
          check(a.manager.fallback==1&&a.manager.mShowing,"provider loss while menu actually visible keeps native fallback");
          a.close(visible);Dialog.drain();
          Session b=new Session();MFVActionsDialog old=b.open();b.close(old);MFVActionsDialog replacement=b.open();Dialog.drain();
          check(b.manager.hidden==0&&b.manager.mShowing,"queued old dismissal cannot clear a replacement menu");
          b.close(replacement);Dialog.drain();check(b.manager.hidden==1&&!b.manager.mShowing,"replacement closes normally");
          Session c=new Session();MFVActionsDialog reused=c.open();c.close(reused);c.show(reused);Dialog.drain();
          check(c.manager.hidden==0&&c.manager.mShowing,"queued dismiss cannot clear a re-shown same dialog");
          c.close(reused);Dialog.drain();check(c.manager.hidden==1&&!c.manager.mShowing,"new same-dialog lifecycle notifies once");
          c.show(reused);c.close(reused);Dialog.drain();check(c.manager.hidden==2,"completed dialog can be shown and dismissed again");
          Session d=new Session();MFVActionsDialog nativeListener=d.owner.new MFVActionsDialog();
          DialogInterface.OnDismissListener own=x->d.manager.onGlobalActionsHidden();nativeListener.setOnDismissListener(own);
          d.show(nativeListener);check(nativeListener.listener().obj==own,"existing native listener preserved exactly");
          d.close(nativeListener);Dialog.drain();check(d.manager.hidden==1,"native hidden notification never duplicated");
          Session e=new Session();MFVActionsDialog failing=e.owner.new MFVActionsDialog();failing.listenerFailure=true;e.show(failing);
          check(failing.starts==1&&failing.listener()==null,"binding failure keeps original menu and return");
          MFVActionsDialog nativeFailure=e.owner.new MFVActionsDialog();nativeFailure.failStart=true;
          try{e.show(nativeFailure);throw new AssertionError("missing native exception");}catch(IllegalArgumentException expected){check("OEM start".equals(expected.getMessage()),"original failure propagated unchanged");}
          check(nativeFailure.starts==1&&nativeFailure.listener()==null,"original start never replayed after failure");
          Session f=new Session();MFVActionsDialog notifyFailure=f.open();f.manager.fail=true;f.close(notifyFailure);Dialog.drain();
          check(f.manager.hidden==1&&notifyFailure.nativeStops==1&&!notifyFailure.showing,"notification failure does not undo native close");
          ((DialogInterface.OnDismissListener)notifyFailure.listener().obj).onDismiss(notifyFailure);
          check(f.manager.hidden==1,"notification exception does not generate repeated requests");
          FeatureSettings.fail=true;Session g=new Session();MFVActionsDialog noTelemetry=g.open();g.close(noTelemetry);Dialog.drain();
          check(g.manager.hidden==1&&!g.manager.mShowing,"diagnostic failure does not affect closure");FeatureSettings.fail=false;
          int hooks=m.hooks.size();PowerMenuLifecycleHook.install(m,TestPowerMenuLifecycle.class.getClassLoader());
          check(hooks==1&&m.hooks.size()==hooks,"installation is idempotent with one OEM lifecycle hook");
          System.out.println("PASS power menu lifecycle: "+checks+" checks; no device or reboot calls");
        }
      }''',
})
files['ls/augment/com/hook/PowerMenuLifecycleHook.java'] = (SRC / 'PowerMenuLifecycleHook.java').read_text(encoding='utf-8')
for profile in ['legacy', 'delegate', 'missing', 'wrong_type']:
    current=dict(files)
    controller='com/android/systemui/globalactions/GlobalActionsDialogLite.java'
    test='ls/augment/com/hook/TestPowerMenuLifecycle.java'
    if profile=='delegate':
        current[controller]=current[controller].replace('public android.app.Dialog mDialog;', 'public Delegate mDelegate=new Delegate();public static class BaseDelegate {public android.app.Dialog mCurrentDialog;}public static class Delegate extends BaseDelegate {}')
        current[test]=current[test].replace('owner.mDialog', 'owner.mDelegate.mCurrentDialog')
        current[test]=current[test].replace('MFVActionsDialog replacement=b.open();', 'b.owner.mDelegate=new com.android.systemui.globalactions.GlobalActionsDialogLite.Delegate();MFVActionsDialog replacement=b.open();')
    if profile in ('missing','wrong_type'):
        current[controller]=current[controller].replace('public android.app.Dialog mDialog;', 'public Object mDialog;' if profile=='wrong_type' else '')
        current[test]='''package ls.augment.com.hook;public class TestPowerMenuLifecycle {public static void main(String[] args){AugmentModule m=new AugmentModule();AugmentModule.active=m;PowerMenuLifecycleHook.install(m,TestPowerMenuLifecycle.class.getClassLoader());if(!m.hooks.isEmpty())throw new AssertionError("Unknown dialog contract must remain native");System.out.println("PASS unavailable dialog contract preserves native lifecycle");}}'''
    with tempfile.TemporaryDirectory(prefix='lsa-power-lifecycle-') as directory:
        sources = []
        for name, source in current.items():
            path = Path(directory) / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source, encoding='utf-8')
            sources.append(str(path))
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', directory, *sources], check=True)
        print('Profile:',profile,flush=True)
        subprocess.run(['java', '-cp', directory, 'ls.augment.com.hook.TestPowerMenuLifecycle',
                        *(['without-fix'] if '--without-fix' in sys.argv else [])], check=True)
