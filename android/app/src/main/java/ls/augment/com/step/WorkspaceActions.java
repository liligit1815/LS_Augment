package ls.augment.com.step;

import android.app.Dialog;
import android.content.*;
import android.content.pm.*;
import android.net.Uri;
import android.os.Handler;
import android.view.*;
import android.widget.*;
import java.lang.reflect.Method;
import java.util.*;
import java.util.function.Consumer;

/** Present only actions with a current original target. No clipboard content or codes leave the device. */
final class WorkspaceActions {
    static final String TITLE="StepWorkspaceTools";
    final WorkspaceQuickBar owner;
    Dialog clipboard;
    PopupWindow providers;
    LinearLayout rows;
    static Object screenshot;
    Method takeShot;
    int source;
    WorkspaceActions(WorkspaceQuickBar bar){
        owner=bar;
        try{
            Class<?> helper=Class.forName("com.android.internal.util.ScreenshotHelper",false,StepRuntime.Shell.loader);
            Method m=OwnershipBridge.method(helper,"takeScreenshot",int.class,Handler.class,Consumer.class);
            if(m.getReturnType()!=void.class)return;
            source=Class.forName("android.view.WindowManager$ScreenshotSource",false,StepRuntime.Shell.loader).getField("SCREENSHOT_OTHER").getInt(null);
            if(screenshot==null)screenshot=helper.getConstructor(Context.class).newInstance(StepRuntime.Shell.context);
            takeShot=m;
        }catch(Exception|LinkageError e){bar.host.log("系统截图入口不可用："+e.getClass().getSimpleName());}
    }
    void menu(View anchor){
        try{owner.checkAction();}catch(RuntimeException e){owner.note(e);return;}
        PopupMenu menu=new PopupMenu(owner.ctx,anchor);
        entry(menu,"工作区布局 · "+owner.host.visibleSlots+" 个侧格",owner::chooseCount);
        entry(menu,"自定义快捷应用",owner::edit);
        android.app.ActivityManager.RunningTaskInfo target=owner.host.focused();
        if(target!=null && (Integer)StepRuntime.call(target,"getActivityType")==1 && (Integer)StepRuntime.call(target,"getWindowingMode")==1){
            if(owner.host.localLandscape)entry(menu,"切换当前应用横屏",()->local("localLandscape",target));
            if(owner.host.edgeHandoff)entry(menu,"原厂小窗贴边",()->local("edgeHandoff",target));
        }
        if(NativeTiles.read(owner.userId,"wallet")>0)entry(menu,"系统钱包",()->owner.activateTile("wallet",anchor));
        menu.show();
    }
    void capture(){
        try{
            owner.checkAction();
            if(takeShot!=null)takeShot.invoke(screenshot,source,owner.host.main,(Consumer<Uri>)u->{
                if(u==null && !owner.closed)owner.logUnavailable("系统未返回截图");
            });
        }catch(Exception e){owner.note(e);}
    }
    enum Code {
        PAY("付款码","pay","WECHAT_PAY"), SCAN("扫一扫","scan","WECHAT_SCAN"), TRANSIT("乘车码","transit","WECHAT_BUS");
        final String label,icon,oemAction;
        Code(String label,String icon,String action){this.label=label;this.icon=icon;this.oemAction=action;}
        boolean matches(String name){
            return name.startsWith(label) || this==PAY && name.startsWith("收付款");
        }
    }
    static final class Service {
        final String label;
        final Runnable open;
        Service(String label,Runnable open){this.label=label;this.open=open;}
    }
    EnumMap<Code,List<Service>> codeServices(){
        EnumMap<Code,List<Service>> result=new EnumMap<>(Code.class);
        for(Code kind:Code.values())result.put(kind,new ArrayList<>());
        if(!owner.currentUser())return result;
        boolean alipayScan=false;
        EnumSet<Code> wechatShortcuts=EnumSet.noneOf(Code.class);
        for(ShortcutInfo item:shortcuts()){
            if(!item.isEnabled() || !owner.user.equals(item.getUserHandle()))continue;
            String name=String.valueOf(item.getShortLabel()),pkg=item.getPackage();
            for(Code kind:Code.values())if(kind.matches(name)){
                if(kind==Code.SCAN && pkg.equals("com.eg.android.AlipayGphone"))alipayScan=true;
                if(pkg.equals("com.tencent.mm"))wechatShortcuts.add(kind);
                String provider=pkg.equals("com.tencent.mm")?"微信":"支付宝";
                result.get(kind).add(new Service(provider+" · "+name,()->afterPromotion(pkg,()->
                        owner.launcher.startShortcut(pkg,item.getId(),null,null,owner.user))));
            }
        }
        // This stock bridge delegates each operation to WeChat. The bridge alone is insufficient.
        String wechat="com.tencent.mm",bridge="com.zte.fingerflashpay";
        if(owner.launcher!=null && owner.launcher.isPackageEnabled(wechat,owner.user)){
            PackageManager pm=owner.ctx.getPackageManager();
            for(Code kind:Code.values()){
                if(wechatShortcuts.contains(kind))continue;
                Intent request=new Intent(bridge+"."+kind.oemAction).setPackage(bridge);
                ResolveInfo ri=pm.resolveActivity(request,PackageManager.MATCH_SYSTEM_ONLY);
                ActivityInfo info=ri==null?null:ri.activityInfo;
                if(info==null || !info.exported || !info.enabled || !info.applicationInfo.enabled || !bridge.equals(info.packageName)
                        || info.permission!=null && owner.ctx.checkSelfPermission(info.permission)!=PackageManager.PERMISSION_GRANTED)continue;
                request.setClassName(info.packageName,info.name).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                result.get(kind).add(new Service("微信",()->afterPromotion(wechat,()->owner.ctx.startActivity(request))));
            }
        }
        if(!alipayScan){
            Intent scan=new Intent(Intent.ACTION_VIEW,Uri.parse("alipays://platformapi/startapp?appId=10000007")).setPackage("com.eg.android.AlipayGphone");
            ResolveInfo r=owner.ctx.getPackageManager().resolveActivity(scan,0);
            if(r!=null && r.activityInfo!=null && r.activityInfo.enabled && r.activityInfo.exported
                    && scan.getPackage().equals(r.activityInfo.packageName))
                result.get(Code.SCAN).add(new Service("支付宝 · 扫一扫",()->afterPromotion(scan.getPackage(),()->
                        owner.ctx.startActivity(scan.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)))));
        }
        ComponentName scanner=systemScanner();
        if(scanner!=null){
            Intent request=new Intent(Intent.ACTION_MAIN).setComponent(scanner).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            result.get(Code.SCAN).add(new Service("系统扫码",()->afterPromotion(scanner.getPackageName(),()->owner.ctx.startActivity(request))));
        }else if(owner.ctx.checkSelfPermission("android.permission.STATUS_BAR_SERVICE")==PackageManager.PERMISSION_GRANTED){
            ComponentName decoder=ls.augment.com.StepBarcodeActivity.decoder(owner.ctx);
            if(decoder!=null){
                Intent request=new Intent().setClassName("ls.augment.com","ls.augment.com.StepBarcodeActivity")
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                result.get(Code.SCAN).add(new Service("系统扫码",()->afterPromotion(decoder.getPackageName(),()->owner.ctx.startActivity(request))));
            }
        }
        return result;
    }
    private ComponentName systemScanner(){
        try{
            String component=null;
            try{
                Class<?> config=Class.forName("android.provider.DeviceConfig",false,StepRuntime.Shell.loader);
                Method read=config.getMethod("getProperty",String.class,String.class);
                if(read.getReturnType()==String.class && java.lang.reflect.Modifier.isStatic(read.getModifiers()))
                    component=(String)read.invoke(null,"systemui","default_qr_code_scanner");
            }catch(ReflectiveOperationException|LinkageError unavailable){/* Try the platform resource below. */}
            if(component==null || component.isEmpty()){
                int resource=owner.ctx.getResources().getIdentifier("config_defaultQrCodeComponent","string","android");
                if(resource==0)return null;
                component=owner.ctx.getResources().getString(resource);
            }
            ComponentName target=ComponentName.unflattenFromString(component);
            if(target==null)return null;
            ActivityInfo info=owner.ctx.getPackageManager().getActivityInfo(target,0);
            if(!info.exported || !info.enabled || !info.applicationInfo.enabled ||
                    info.permission!=null && owner.ctx.checkSelfPermission(info.permission)!=PackageManager.PERMISSION_GRANTED)return null;
            return target;
        }catch(PackageManager.NameNotFoundException|RuntimeException unavailable){return null;}
    }
    void openCode(View anchor,List<Service> services){
        try{
            owner.checkAction();
            if(services.size()==1){services.get(0).open.run();return;}
            if(services.isEmpty())return;
            closeProviders();
            LinearLayout row=new LinearLayout(owner.ctx);row.setGravity(Gravity.CENTER);
            HorizontalScrollView list=new HorizontalScrollView(owner.ctx);list.setHorizontalScrollBarEnabled(false);
            list.setFillViewport(true);list.setBackground(StepMaterial.glass(owner.ctx,true,18));list.addView(row);
            int width=owner.deck.networks.codeAreaWidth(),height=Math.max(owner.dp(32),anchor.getHeight());
            PopupWindow bubble=new PopupWindow(list,width,height,true);
            bubble.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(android.graphics.Color.TRANSPARENT));
            bubble.setInputMethodMode(PopupWindow.INPUT_METHOD_NOT_NEEDED);bubble.setOutsideTouchable(true);
            for(Service service:services){
                String name=service.label.split(" · ",2)[0];
                TextView choice=StepMaterial.label(owner.ctx,name,12,true);choice.setMaxLines(2);choice.setContentDescription(service.label);
                choice.setOnClickListener(v->{bubble.dismiss();try{owner.checkAction();service.open.run();}catch(RuntimeException e){owner.note(e);}});
                row.addView(choice,new LinearLayout.LayoutParams(Math.max(owner.dp(44),width/services.size()),-1));
            }
            bubble.setOnDismissListener(()->{if(providers==bubble)providers=null;});
            bubble.setEnterTransition(new android.transition.Fade().setDuration(180));
            bubble.setExitTransition(new android.transition.Fade().setDuration(140));
            providers=bubble;bubble.showAsDropDown(anchor,owner.deck.networks.codeLeft()-anchor.getLeft(),-anchor.getHeight(),Gravity.LEFT);
            list.setScaleX(.94f);list.setScaleY(.94f);list.animate().scaleX(1).scaleY(1).setDuration(180).start();
        }catch(RuntimeException e){owner.note(e);}
    }
    void closeProviders(){if(providers!=null){providers.dismiss();providers=null;}}
    void local(String action,android.app.ActivityManager.RunningTaskInfo task){
        android.os.Bundle b=new android.os.Bundle();b.putInt("task",task.taskId);
        b.putParcelable("token",(android.os.Parcelable)StepRuntime.field(task,"token"));
        owner.host.rpc(action,b,r->owner.logUnavailable(r.getString("message","系统未返回结果")));
    }
    void entry(PopupMenu menu,String label,Runnable action){
        menu.getMenu().add(label).setOnMenuItemClickListener(i->{try{owner.checkAction();action.run();}catch(RuntimeException e){owner.note(e);}return true;});
    }
    void afterPromotion(String pkg,Runnable start){
        LiveWorkspace h=owner.host;
        int slot=WorkspaceRoutes.match(h,pkg,owner.userId,-1,null);
        if(slot>=0){
            if(WorkspaceRoutes.promote(h,slot,ok->{
                if(ok && !owner.closed && owner.currentUser() && StepRuntime.interactive(owner.ctx))try{start.run();}catch(RuntimeException e){owner.note(e);}
                else if(!owner.closed)owner.logUnavailable("没有确认原任务进入主区");
            }))return;
            owner.logUnavailable("原任务正在切换");return;
        }
        for(int id:h.slots.snapshot())if(id>=0){
            android.app.ActivityManager.RunningTaskInfo t=h.info(id);
            if(t!=null && LiveWorkspace.number(t,"userId")==owner.userId && WorkspaceQuickBar.belongs(t.baseActivity,pkg)){
                owner.logUnavailable("有多个同包任务，请先点选目标副格");return;
            }
        }
        start.run();
    }
    List<ShortcutInfo> shortcuts(){
        List<ShortcutInfo> result=new ArrayList<>();
        try{
            if(owner.launcher==null || !owner.launcher.hasShortcutHostPermission())return result;
            for(String pkg:new String[]{"com.tencent.mm","com.eg.android.AlipayGphone"}){
                LauncherApps.ShortcutQuery query=new LauncherApps.ShortcutQuery().setPackage(pkg).setQueryFlags(
                        LauncherApps.ShortcutQuery.FLAG_MATCH_PINNED|LauncherApps.ShortcutQuery.FLAG_MATCH_MANIFEST|LauncherApps.ShortcutQuery.FLAG_MATCH_DYNAMIC);
                List<ShortcutInfo> list=owner.launcher.getShortcuts(query,owner.user);if(list!=null)result.addAll(list);
            }
        }catch(RuntimeException e){owner.host.log("应用快捷方式不可读："+e.getClass().getSimpleName());}
        return result;
    }
    void openClips(){
        try{owner.checkAction();}catch(RuntimeException e){owner.note(e);return;}
        if(!WorkspaceClipboard.readable() || clipboard!=null)return;
        android.view.Display display=owner.ctx.getSystemService(android.hardware.display.DisplayManager.class).getDisplay(0);
        Context c=owner.ctx.createDisplayContext(display).createWindowContext(2017,null);
        clipboard=new Dialog(c,StepMaterial.dark(c)?android.R.style.Theme_Material_Dialog_NoActionBar:android.R.style.Theme_Material_Light_Dialog_NoActionBar);
        LinearLayout card=new LinearLayout(c);card.setOrientation(1);card.setPadding(owner.dp(16),owner.dp(12),owner.dp(16),owner.dp(12));card.setBackground(StepMaterial.glass(c,true,20));
        LinearLayout header=new LinearLayout(c);header.setGravity(Gravity.CENTER_VERTICAL);card.addView(header,-1,owner.dp(48));
        TextView heading=StepMaterial.label(c,"剪贴板历史",18,true);heading.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);
        header.addView(heading,new LinearLayout.LayoutParams(0,-1,1));
        header.addView(new StepGlyph(c,"trash","清空历史",()->{WorkspaceClipboard.history.clear();renderRows();}),owner.dp(48),-1);
        header.addView(new StepGlyph(c,"close","关闭剪贴板",this::closeClips),owner.dp(48),-1);
        ScrollView scroll=new ScrollView(c);rows=new LinearLayout(c);rows.setOrientation(1);scroll.addView(rows);card.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
        clipboard.setContentView(card);Window w=clipboard.getWindow();w.setType(2017);
        WindowManager.LayoutParams lp=w.getAttributes();lp.setTitle(TITLE);w.setAttributes(lp);
        w.setBackgroundDrawableResource(android.R.color.transparent);
        w.addFlags(WindowManager.LayoutParams.FLAG_SECURE);
        w.setLayout(Math.min(owner.dp(430),owner.host.geometry.width*9/10),Math.min(owner.dp(440),owner.host.geometry.height*2/3));
        clipboard.setOnDismissListener(d->{WorkspaceClipboard.changed=null;clipboard=null;rows=null;});
        WorkspaceClipboard.changed=closing->{if(closing)closeClips();else renderRows();};
        WorkspaceClipboard.read();renderRows();clipboard.show();
    }
    void renderRows(){
        if(rows==null || !WorkspaceClipboard.readable())return;
        rows.removeAllViews();Context c=rows.getContext();
        for(String text:WorkspaceClipboard.history.list()){
            LinearLayout row=new LinearLayout(c);TextView item=StepMaterial.label(c,text,14,false);item.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);item.setMaxLines(2);
            item.setOnClickListener(v->{if(WorkspaceClipboard.copy(text))closeClips();});
            row.addView(item,new LinearLayout.LayoutParams(0,-1,1));StepGlyph del=new StepGlyph(c,"trash","删除此条",()->{WorkspaceClipboard.history.remove(text);renderRows();});
            row.addView(del,owner.dp(48),-1);rows.addView(row,-1,owner.dp(48));
        }
        if(rows.getChildCount()==0)rows.addView(StepMaterial.label(c,"暂无文本记录",14,false));
    }
    void closeClips(){if(clipboard!=null)clipboard.dismiss();}
}
