package ls.augment.com.step;

import android.app.ActivityManager;
import android.app.ActivityOptions;
import android.app.Dialog;
import android.content.*;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.*;
import android.provider.MediaStore;
import android.view.*;
import android.widget.*;
import java.util.*;
import java.util.concurrent.*;
import static ls.augment.com.step.StepRuntime.*;

/** User-selected content only; no broad chooser or background delivery to a replacement task. */
final class WorkspaceRecentSheet {
    static final String TITLE="RedMagicDuoRecentSelection";
    static boolean physical(int type,CharSequence title,int uid,int trustedUid){
        return trustedUid>=0 && uid==trustedUid && type==2017 && TITLE.contentEquals(title==null?"":title);
    }
    final WorkspaceQuickBar owner;
    final int kind;
    final Context ctx;
    final Dialog dialog;
    final ActivityManager.RunningTaskInfo target;
    final Object targetToken;
    final String targetPackage,targetLabel;
    final List<Item> entries=new ArrayList<>();
    final Set<Item> selected=new LinkedHashSet<>();
    final ExecutorService worker=Executors.newSingleThreadExecutor();
    final CancellationSignal cancellation=new CancellationSignal();
    final TextView state,confirm;
    final ListView list;
    boolean closed;
    static final class Item {
        final Uri uri;final String title,mime,text;final long modified,size;
        Item(Uri uri,String title,String mime,long modified,long size,String text){
            this.uri=uri;this.title=title;this.mime=mime;this.modified=modified;this.size=size;this.text=text;
        }
    }
    WorkspaceRecentSheet(WorkspaceQuickBar owner,int kind){
        this.owner=owner;this.kind=kind;
        target=owner.host.focused();
        if(target==null || LiveWorkspace.number(target,"userId")!=owner.userId || target.topActivity==null
                || owner.host.slots.index(target.taskId)>=0 || owner.host.holdsUpper(target.taskId)
                || (Integer)call(target,"getActivityType")!=1)
            throw new IllegalStateException("请先在主工作区打开需要使用内容的应用");
        targetToken=field(target,"token");if(targetToken==null)throw new IllegalStateException("主区应用身份尚未就绪");targetPackage=target.topActivity.getPackageName();
        String name=targetPackage;
        try{name=owner.ctx.getPackageManager().getApplicationLabel(owner.ctx.getPackageManager().getApplicationInfo(name,0)).toString();}
        catch(android.content.pm.PackageManager.NameNotFoundException ignored){}
        targetLabel=name;
        ctx=StepMaterial.statusBarPanelContext(owner.ctx,owner.ctx.getDisplay());
        dialog=new Dialog(ctx,StepMaterial.dark(ctx)?android.R.style.Theme_Material_Dialog_NoActionBar:android.R.style.Theme_Material_Light_Dialog_NoActionBar);
        LinearLayout card=new LinearLayout(ctx);card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16),dp(8),dp(16),dp(8));card.setBackground(StepMaterial.glass(ctx,true,20));
        LinearLayout header=new LinearLayout(ctx);header.setGravity(Gravity.CENTER_VERTICAL);
        TextView title=StepMaterial.label(ctx,new String[]{"最近媒体","最近文件","最近剪切"}[kind],18,true);
        title.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);header.addView(title,new LinearLayout.LayoutParams(0,-1,1));
        header.addView(new StepGlyph(ctx,"close","关闭选择",this::close),dp(48),-1);card.addView(header,-1,dp(48));
        state=StepMaterial.label(ctx,kind==2?"选择后复制并返回 "+targetLabel:"按时间从新到旧 · 交给 "+targetLabel,12,false);
        state.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams hint=new LinearLayout.LayoutParams(-1,dp(32));hint.topMargin=dp(8);card.addView(state,hint);
        list=new ListView(ctx);list.setDivider(null);card.addView(list,new LinearLayout.LayoutParams(-1,0,1));
        confirm=StepMaterial.label(ctx,kind==2?"复制并返回主区":"选择内容",15,true);
        confirm.setBackground(StepMaterial.glass(ctx,false,12));StepMaterial.feedback(confirm);
        card.addView(confirm,-1,dp(48));confirm.setEnabled(false);confirm.setAlpha(.45f);confirm.setOnClickListener(v->deliver());
        dialog.setContentView(card);dialog.setCanceledOnTouchOutside(true);
        Window window=dialog.getWindow();window.setType(StepMaterial.STATUS_BAR_SUB_PANEL);
        window.setBackgroundDrawableResource(android.R.color.transparent);
        window.addFlags(WindowManager.LayoutParams.FLAG_SECURE|WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        window.setDimAmount(.2f);window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING);
        WindowManager.LayoutParams lp=window.getAttributes();lp.setTitle(TITLE);
        lp.gravity=Gravity.BOTTOM;lp.width=owner.host.geometry.width;lp.height=owner.host.geometry.height/2;
        lp.setFitInsetsTypes(WindowInsets.Type.navigationBars());window.setAttributes(lp);
        dialog.setOnDismissListener(d->dispose());
    }
    int dp(int value){return owner.dp(value);}
    void show(){dialog.show();load();}
    boolean validTarget(){
        if(closed || owner.closed || !owner.currentUser() || !interactive(ctx))return false;
        ActivityManager.RunningTaskInfo live=owner.host.info(target.taskId);
        ActivityManager.RunningTaskInfo focused=owner.host.focused();
        return live!=null && targetToken.equals(field(live,"token")) && LiveWorkspace.number(live,"userId")==owner.userId
                && live.topActivity!=null && targetPackage.equals(live.topActivity.getPackageName())
                && owner.host.slots.index(live.taskId)<0 && !owner.host.holdsUpper(live.taskId)
                && focused!=null && focused.taskId==live.taskId;
    }
    void load(){
        if(kind==2){
            if(!WorkspaceClipboard.readable() || !WorkspaceClipboard.available()){state.setText("当前系统未提供剪切内容读取能力");return;}
            WorkspaceClipboard.read();
            for(String text:WorkspaceClipboard.history.list())entries.add(new Item(null,text,"text/plain",0,0,text));
            render();return;
        }
        state.setText("正在读取最近内容…");
        worker.execute(()->{
            ArrayList<Item> found=new ArrayList<>();String failure=null;
            try{
                Uri base=MediaStore.Files.getContentUri("external");
                Bundle query=new Bundle();
                query.putString(ContentResolver.QUERY_ARG_SQL_SELECTION,"is_pending=0 AND is_trashed=0"+(kind==0?" AND (media_type=1 OR media_type=3)":""));
                query.putString(ContentResolver.QUERY_ARG_SQL_SORT_ORDER,"date_modified DESC, _id DESC");
                query.putInt(ContentResolver.QUERY_ARG_LIMIT,120);
                String[] projection={"_id","_display_name","mime_type","date_modified","_size","media_type"};
                try(Cursor cursor=ctx.getContentResolver().query(base,projection,query,cancellation)){
                    if(cursor==null)throw new IllegalStateException("内容索引不可用");
                    while(found.size()<120 && cursor.moveToNext() && !cancellation.isCanceled()){
                        long id=cursor.getLong(0);String title=cursor.getString(1),mime=cursor.getString(2);int type=cursor.getInt(5);
                        if(title==null || mime==null || mime.equals("vnd.android.document/directory"))continue;
                        Uri source=type==1?MediaStore.Images.Media.EXTERNAL_CONTENT_URI:type==3?MediaStore.Video.Media.EXTERNAL_CONTENT_URI:base;
                        found.add(new Item(ContentUris.withAppendedId(source,id),title,mime,cursor.getLong(3)*1000,cursor.getLong(4),null));
                    }
                }
            }catch(SecurityException denied){failure="系统未授权读取本机内容，请在系统设置中检查访问权限";}
            catch(OperationCanceledException ignored){return;}
            catch(RuntimeException error){failure="暂时无法读取最近内容，请稍后重试";}
            final String message=failure;
            owner.host.main.post(()->{if(closed)return;entries.addAll(found);render();if(message!=null)state.setText(message);});
        });
    }
    void render(){
        state.setText(entries.isEmpty()?"暂无可选择内容":kind==2?"选择后复制并返回 "+targetLabel:"按时间从新到旧 · 交给 "+targetLabel);
        list.setAdapter(new BaseAdapter(){
            public int getCount(){return entries.size();}public Item getItem(int at){return entries.get(at);}public long getItemId(int at){return at;}
            public View getView(int at,View reuse,android.view.ViewGroup parent){
                Item item=entries.get(at);LinearLayout row=new LinearLayout(ctx);row.setGravity(Gravity.CENTER_VERTICAL);row.setMinimumHeight(dp(68));
                ImageView thumb=new ImageView(ctx);thumb.setScaleType(ImageView.ScaleType.CENTER_CROP);thumb.setTag(item);
                if(item.uri!=null && (item.mime.startsWith("image/") || item.mime.startsWith("video/"))){
                    row.addView(thumb,dp(48),dp(48));
                    worker.execute(()->{try{
                        Bitmap bitmap=ctx.getContentResolver().loadThumbnail(item.uri,new android.util.Size(dp(48),dp(48)),cancellation);
                        owner.host.main.post(()->{if(!closed && thumb.getTag()==item)thumb.setImageBitmap(bitmap);});
                    }catch(Exception ignored){}});
                }
                LinearLayout labels=new LinearLayout(ctx);labels.setOrientation(LinearLayout.VERTICAL);labels.setPadding(dp(8),dp(6),dp(8),dp(6));
                TextView name=StepMaterial.label(ctx,item.title,14,false);name.setMaxLines(kind==2?3:2);name.setEllipsize(android.text.TextUtils.TruncateAt.END);name.setGravity(Gravity.START);
                labels.addView(name,-1,-2);
                if(item.uri!=null){TextView detail=StepMaterial.label(ctx,android.text.format.DateFormat.format("MM-dd HH:mm",item.modified)+" · "+android.text.format.Formatter.formatShortFileSize(ctx,item.size),11,false);detail.setGravity(Gravity.START);labels.addView(detail,-1,-2);}
                row.addView(labels,new LinearLayout.LayoutParams(0,-2,1));
                CheckBox checked=new CheckBox(ctx);checked.setClickable(false);checked.setFocusable(false);checked.setChecked(selected.contains(item));row.addView(checked,dp(44),dp(48));
                row.setOnClickListener(v->{if(selected.remove(item)){}else{if(kind==2)selected.clear();selected.add(item);}notifyDataSetChanged();updateSelection();});
                StepMaterial.feedback(row);return row;
            }
        });
    }
    void updateSelection(){confirm.setEnabled(!selected.isEmpty());confirm.setAlpha(selected.isEmpty()?.45f:1f);
        confirm.setText(kind==2?"复制并返回主区":selected.isEmpty()?"选择内容":"交给 "+targetLabel+"（"+selected.size()+"）");}
    void deliver(){
        try{
            owner.checkAction();if(!validTarget())throw new IllegalStateException("主工作区应用已变化，请重新选择");
            if(selected.isEmpty())return;
            if(kind==2){
                if(!WorkspaceClipboard.copy(selected.iterator().next().text))throw new IllegalStateException("内容已失效，请重新选择");
                close();Toast.makeText(owner.ctx,"已复制，可在 "+targetLabel+" 中粘贴",Toast.LENGTH_SHORT).show();return;
            }
            ArrayList<Uri> uris=new ArrayList<>();String mime=null;
            for(Item item:selected){uris.add(item.uri);mime=mime==null?item.mime:mime.equals(item.mime)?mime:mime.split("/")[0].equals(item.mime.split("/")[0])?mime.split("/")[0]+"/*":"*/*";}
            Intent send=new Intent(uris.size()==1?Intent.ACTION_SEND:Intent.ACTION_SEND_MULTIPLE).setPackage(targetPackage).setType(mime);
            if(uris.size()==1)send.putExtra(Intent.EXTRA_STREAM,uris.get(0));else send.putParcelableArrayListExtra(Intent.EXTRA_STREAM,uris);
            ClipData clip=new ClipData("所选内容",new String[]{mime},new ClipData.Item(uris.get(0)));
            for(int n=1;n<uris.size();n++)clip.addItem(new ClipData.Item(uris.get(n)));send.setClipData(clip);
            send.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_ACTIVITY_NEW_TASK);
            if(ctx.getPackageManager().resolveActivity(send,android.content.pm.PackageManager.MATCH_DEFAULT_ONLY)==null)
                throw new IllegalStateException(targetLabel+" 不支持接收所选内容，请在主区切换应用后重试");
            // Package affinity alone can select the same app's parked side/top
            // task. Bind the receiver to the exact main task checked above.
            ActivityOptions options=ActivityOptions.makeBasic();
            try{
                java.lang.reflect.Method launch=OwnershipBridge.method(ActivityOptions.class,"setLaunchTaskId",int.class);
                if(launch.getReturnType()!=void.class || java.lang.reflect.Modifier.isStatic(launch.getModifiers()))
                    throw new NoSuchMethodException("setLaunchTaskId");
                launch.invoke(options,target.taskId);
            }catch(ReflectiveOperationException unavailable){
                throw new IllegalStateException("当前系统无法将内容交给指定的主工作区窗口",unavailable);
            }
            ctx.startActivity(send,options.toBundle());close();
        }catch(RuntimeException error){owner.note(error);}
    }
    void close(){if(dialog.isShowing())dialog.dismiss();else dispose();}
    void dispose(){if(closed)return;closed=true;cancellation.cancel();worker.shutdownNow();selected.clear();entries.clear();if(owner.recent==this)owner.recent=null;}
}
