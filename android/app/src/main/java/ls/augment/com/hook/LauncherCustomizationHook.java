package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.*;
import android.view.View;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import ls.augment.com.BuildConfig;
import ls.augment.com.ConfigSchema;
import ls.augment.com.LauncherOverrides;

/** Native model icon factory covers desktop, drawer, and folder preview icons. */
final class LauncherCustomizationHook {
    private static final ThreadLocal<Integer> WRITING=ThreadLocal.withInitial(()->0);
    private static Controller controller;private static boolean installed;
    static synchronized void install(AugmentModule module,ClassLoader loader){
        if(installed)return;
        try{
            Class<?> info=Class.forName("com.android.launcher3.model.data.z",false,loader);
            Class<?> item=Class.forName("com.android.launcher3.model.data.y",false,loader);
            Class<?> bubble=Class.forName("com.android.launcher3.BubbleTextView",false,loader);
            Method icon=info.getDeclaredMethod("G",Context.class,int.class),label=bubble.getDeclaredMethod("B",item);
            module.registerFeatureHook(module.prepareFeatureHook(icon,"launcher.icon",true).intercept(chain->{
                Controller c=ensure(module,loader,(Context)chain.getArg(0));if(c!=null)c.apply(chain.getThisObject());
                Object result=chain.proceed();if(c!=null)c.traceImage(chain.getThisObject(),result,"icon");return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(label,"launcher.label",true).intercept(chain->{
                Controller c=ensure(module,loader,((View)chain.getThisObject()).getContext());if(c!=null)c.apply(chain.getArg(0));
                Object result=chain.proceed();if(c!=null)c.traceView(chain.getArg(0),chain.getThisObject());return result;
            }));
            for(Class<?> type:new Class<?>[]{item,Class.forName("com.android.launcher3.model.data.I",false,loader)})
                for(Method m:type.getDeclaredMethods())if(m.getName().equals("onAddToDatabase")||m.getName().equals("writeToValues")){
                    module.registerFeatureHook(module.prepareFeatureHook(m,"launcher.persistence."+type.getSimpleName()+"."+m.getName(),true).intercept(chain->{
                        int depth=WRITING.get();WRITING.set(depth+1);Controller c=controller;Object value=chain.getThisObject();
                        if(depth==0&&c!=null)c.restore(value);
                        try{return chain.proceed();}finally{WRITING.set(depth);if(depth==0&&c!=null)c.apply(value);}
                    }));
                }
            installed=true;
            Handler main=new Handler(Looper.getMainLooper());main.postDelayed(new Runnable(){public void run(){if(ensure(module,loader,FeatureSettings.from(null))==null)main.postDelayed(this,1500);}},1500);
        }catch(Throwable e){module.logFeatureError("LAUNCHER_CUSTOM_INSTALL",e);}
    }
    private static synchronized Controller ensure(AugmentModule module,ClassLoader loader,Context context){
        if(controller==null&&context!=null)controller=new Controller(module,loader,context.getApplicationContext());return controller;
    }
    private static final class Original {
        Object title,description,icon,appliedTitle,appliedIcon;String hash="";
    }
    private static final class Controller {
        final AugmentModule module;final ClassLoader loader;final Context context;final Handler main=new Handler(Looper.getMainLooper());
        final ExecutorService worker=Executors.newSingleThreadExecutor();final Map<Object,Original> originals=Collections.synchronizedMap(new WeakHashMap<>());
        volatile LauncherOverrides overrides=LauncherOverrides.empty();volatile Map<String,Bitmap> images=Collections.emptyMap();volatile String last;
        String publishedText;int imageFailures;final Runnable retryImages=this::load;
        final Set<String> imageWitnesses=new HashSet<>();final ArrayDeque<String> imageTrace=new ArrayDeque<>();int loadAttempts;
        final Field title,description,user,itemType,iconField;final Constructor<?> bitmapInfo;
        Controller(AugmentModule module,ClassLoader loader,Context context){
            this.module=module;this.loader=loader;this.context=context;
            try{Class<?> info=Class.forName("com.android.launcher3.model.data.z",false,loader),base=info.getSuperclass();
                title=base.getField("title");description=base.getField("contentDescription");user=base.getField("user");itemType=base.getField("itemType");
                Class<?> bitmapType=Class.forName("s1.d",false,loader);iconField=info.getDeclaredField("g");iconField.setAccessible(true);
                if(iconField.getType()!=bitmapType)throw new IllegalStateException("桌面图标类型不匹配");bitmapInfo=bitmapType.getConstructor(Bitmap.class,int.class);
            }catch(Exception e){throw new IllegalStateException(e);}
            FeatureSettings.addSnapshotListener(context,this::load);load();
        }
        void load(){worker.execute(()->{String text=FeatureSettings.text(context,ConfigSchema.LAUNCHER_OVERRIDES,"");if(text.equals(last))return;
            LauncherOverrides parsed=LauncherOverrides.parse(text);if(parsed==null)return;
            int attempt=++loadAttempts;long started=SystemClock.elapsedRealtime();
            Map<String,Bitmap> decoded=new HashMap<>();String error="";
            for(LauncherOverrides.Entry e:parsed.entries())if(!e.icon.isEmpty()&&!decoded.containsKey(e.icon))try{
                Bitmap b=images.get(e.icon);if(b==null)try(java.io.InputStream in=context.getContentResolver().openInputStream(Uri.parse("content://ls.augment.com.config/icon/"+e.icon))){b=BitmapFactory.decodeStream(in);}
                if(b==null||b.getWidth()>1024||b.getHeight()>1024)throw new IllegalStateException("图标图片无效");decoded.put(e.icon,b);
            }catch(Exception failure){error="；图片暂未读到，正在后台重试";
                if(BuildConfig.DEBUG)FeatureSettings.diagnostic(context,"ls_augment_launcher_image_error",
                        "attempt="+attempt+"|uptime="+SystemClock.elapsedRealtime()+"|"+failure.getClass().getSimpleName()+":"+failure.getMessage());}
            final String detail=error;main.post(()->{
                // A slow provider must not publish an older edit over the latest choice.
                if(!text.equals(FeatureSettings.text(context,ConfigSchema.LAUNCHER_OVERRIDES,""))){load();return;}
                boolean changed=!text.equals(publishedText)||!images.equals(decoded);
                if(!text.equals(publishedText))imageFailures=0;
                main.removeCallbacks(retryImages);
                // Failed image reads are not a completed configuration load. Early boot
                // can expose the mirrored names before the image provider is available.
                last=detail.isEmpty()?text:null;
                if(!detail.isEmpty()){
                    long delay=Math.min(30000L,2000L<<Math.min(imageFailures++,4));
                    main.postDelayed(retryImages,delay);
                }else imageFailures=0;
                if(BuildConfig.DEBUG)FeatureSettings.diagnostic(context,"ls_augment_launcher_image_load",
                        "attempt="+attempt+"|started="+started+"|published="+SystemClock.elapsedRealtime()
                                +"|entries="+parsed.entries().size()+"|images="+decoded.size()+"|failed="+!detail.isEmpty()+"|changed="+changed);
                // A still-unavailable image must not restart the launcher model on
                // every retry. Refresh only for an edit or newly recovered pixels.
                if(!changed)return;
                synchronized(originals){for(Object value:new ArrayList<>(originals.keySet()))restore(value);originals.clear();}
                overrides=parsed;images=Collections.unmodifiableMap(decoded);publishedText=text;
                try{Object state=TargetReflection.call(Class.forName("com.android.launcher3.P2",false,loader),"h",context);
                    Object model=TargetReflection.call(state,"j");TargetReflection.call(model,"a0");
                    FeatureSettings.diagnostic(context,"ls_augment_launcher_runtime","桌面、文件夹和抽屉已刷新；自定义 "+parsed.entries().size()+" 项"+detail);
                }catch(Exception failure){FeatureSettings.diagnostic(context,"ls_augment_launcher_runtime","配置已载入，自动刷新未完成，请重新打开桌面");module.logFeatureError("LAUNCHER_REFRESH",failure);}
            });
        });}
        void traceView(Object value,Object view){if(!BuildConfig.DEBUG)return;
            try{traceImage(value,TargetReflection.call(view,"getIcon"),"label");}catch(Throwable ignored){}
        }
        void traceImage(Object value,Object drawable,String phase){if(!BuildConfig.DEBUG||value==null)return;
            try{
                String pkg=(String)TargetReflection.call(value,"getTargetPackage");
                int userId=(Integer)TargetReflection.call(user.get(value),"getIdentifier");
                LauncherOverrides.Entry entry=overrides.get(userId,pkg);if(entry==null||entry.icon.isEmpty())return;
                Bitmap custom=images.get(entry.icon);Object model=iconField.get(value);
                Field bitmap=bitmapInfo.getDeclaringClass().getField("a");
                Object drawn=drawable==null?null:drawable.getClass().getField("h").get(drawable);
                String state=phase+"|user="+userId+"|package="+pkg+"|loaded="+(custom!=null)
                        +"|modelCustom="+(custom!=null&&model!=null&&bitmap.get(model)==custom)
                        +"|drawableCustom="+(custom!=null&&drawn!=null&&bitmap.get(drawn)==custom);
                synchronized(imageWitnesses){if(imageWitnesses.size()>=256||!imageWitnesses.add(entry.icon+"|"+state))return;
                    if(imageTrace.size()==8)imageTrace.removeFirst();imageTrace.addLast("uptime="+SystemClock.elapsedRealtime()+"|"+state);
                    FeatureSettings.diagnostic(context,"ls_augment_launcher_image_trace",String.join("\n",imageTrace));}
            }catch(Throwable ignored){}
        }
        void apply(Object value){
            if(value==null||WRITING.get()>0||!iconField.getDeclaringClass().isInstance(value))return;
            try{
                if(itemType.getInt(value)!=0)return;
                String pkg=(String)TargetReflection.call(value,"getTargetPackage");
                int userId=(Integer)TargetReflection.call(user.get(value),"getIdentifier");LauncherOverrides.Entry e=overrides.get(userId,pkg);
                if(e==null){restore(value);return;}
                synchronized(originals){Original o=originals.computeIfAbsent(value,key->new Original());Object currentTitle=title.get(value),currentIcon=iconField.get(value);
                    if(o.appliedTitle==null||!Objects.equals(o.appliedTitle,currentTitle)){o.title=currentTitle;o.description=description.get(value);}
                    if(o.appliedIcon==null||o.appliedIcon!=currentIcon){o.icon=currentIcon;o.appliedIcon=null;o.hash="";}
                    if(!e.name.isEmpty()){o.appliedTitle=e.name;title.set(value,e.name);description.set(value,context.getPackageManager().getUserBadgedLabel(e.name,(UserHandle)user.get(value)));}
                    Bitmap custom=images.get(e.icon);if(custom!=null){
                        if(o.appliedIcon==null||!o.hash.equals(e.icon)){
                            Object copy=bitmapInfo.newInstance(custom,0);
                            // Keep native profile flags and the user's full-color crop.
                            // A clone watermark baked into the old bitmap is intentionally not copied.
                            for(String field:new String[]{"d","f"}){Field f=bitmapInfo.getDeclaringClass().getDeclaredField(field);f.setAccessible(true);f.set(copy,f.get(o.icon));}
                            o.appliedIcon=copy;o.hash=e.icon;
                        }
                        iconField.set(value,o.appliedIcon);
                    }
                }
            }catch(Throwable e){module.logFeatureError("LAUNCHER_ITEM",e);}
        }
        void restore(Object value){if(value==null)return;synchronized(originals){Original o=originals.get(value);if(o==null)return;
            try{if(o.appliedTitle!=null&&Objects.equals(title.get(value),o.appliedTitle)){title.set(value,o.title);description.set(value,o.description);}
                if(o.appliedIcon!=null&&iconField.get(value)==o.appliedIcon)iconField.set(value,o.icon);
                o.appliedTitle=null;o.appliedIcon=null;o.hash="";
            }catch(Exception ignored){}
        }}
    }
}
