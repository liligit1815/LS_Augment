package ls.augment.com.step;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.text.*;
import android.view.*;
import android.widget.*;
import java.util.*;

/** The standalone settings entry and the physical workspace open the same selection surface. */
final class QuickPicker {
    static final String TITLE="RedMagicDuoStepPicker";
    interface Commit { boolean write(LinkedHashSet<String> keys); }
    final Dialog dialog;
    final Context ctx;
    final LinkedHashSet<String> chosen;
    final ArrayList<QuickCatalog.App> shown=new ArrayList<>(), all;
    final TextView count;
    final EditText search;
    final ListView list;
    final BaseAdapter adapter;

    QuickPicker(Context base, boolean overlay, List<QuickCatalog.App> catalog, Collection<String> pins,
                android.graphics.Bitmap wallpaper, Commit commit, Runnable closed) {
        if(overlay){
            android.view.Display display=base.getSystemService(android.hardware.display.DisplayManager.class).getDisplay(0);
            Context physical=StepMaterial.modalPanelContext(base,display);
            ctx=new android.view.ContextThemeWrapper(physical,StepMaterial.dark(base)?
                    android.R.style.Theme_Material_Dialog_NoActionBar:android.R.style.Theme_Material_Light_Dialog_NoActionBar);
        }else ctx=base;
        chosen=new LinkedHashSet<>(pins);all=new ArrayList<>(catalog);
        java.text.Collator sorter=java.text.Collator.getInstance();
        all.sort((a,b)->{int byName=sorter.compare(a.label,b.label);return byName==0?a.key.compareTo(b.key):byName;});
        dialog=new Dialog(ctx,StepMaterial.dark(ctx)?android.R.style.Theme_Material_Dialog_NoActionBar:
                android.R.style.Theme_Material_Light_Dialog_NoActionBar);
        dialog.setCanceledOnTouchOutside(true); dialog.setOnDismissListener(d->closed.run());
        FrameLayout card=new FrameLayout(ctx);card.setBackground(StepMaterial.glass(ctx,true,24));
        card.setClipToOutline(true);
        if(wallpaper!=null){ImageView wall=StepMaterial.wallView(ctx);wall.setImageBitmap(wallpaper);wall.setAlpha(.27f);card.addView(wall,-1,-1);}
        LinearLayout body=new LinearLayout(ctx);body.setOrientation(LinearLayout.VERTICAL);int pad=dp(16);body.setPadding(pad,pad,pad,pad);
        card.addView(body,-1,-1);
        LinearLayout header=new LinearLayout(ctx);header.setGravity(Gravity.CENTER_VERTICAL);
        TextView title=StepMaterial.label(ctx,"自定义快捷应用",20,true);title.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);
        header.addView(title,new LinearLayout.LayoutParams(0,-1,1));
        TextView cross=StepMaterial.label(ctx,"×",23,false);cross.setContentDescription("关闭，不保存");cross.setOnClickListener(v->dialog.dismiss());
        header.addView(cross,dp(44),-1);body.addView(header,-1,dp(44));
        TextView desc=StepMaterial.label(ctx,"按选择顺序保存，取消后重新选择可调整顺序",13,false);desc.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);
        desc.setMinHeight(dp(28));body.addView(desc,-1,-2);
        search=new EditText(ctx); search.setSingleLine(); search.setTextSize(15); search.setTextColor(StepMaterial.ink(ctx));
        search.setHint("搜索应用");search.setContentDescription("搜索快捷应用");search.setBackground(StepMaterial.glass(ctx,false,15));
        search.setPadding(pad,0,pad,0); body.addView(search,-1,dp(44));
        count=StepMaterial.label(ctx,"",13,true);count.setGravity(Gravity.END|Gravity.CENTER_VERTICAL);body.addView(count,-1,dp(30));
        list=new ListView(ctx);list.setDivider(null);body.addView(list,new LinearLayout.LayoutParams(-1,0,1));
        adapter=new BaseAdapter() {
            public int getCount(){return shown.size();} public Object getItem(int i){return shown.get(i);}
            public long getItemId(int i){return i;}
            public View getView(int i,View recycled,ViewGroup parent) {
                QuickCatalog.App app=shown.get(i);
                CheckedTextView row=(CheckedTextView) android.view.LayoutInflater.from(ctx).inflate(android.R.layout.simple_list_item_multiple_choice,parent,false);
                row.setText(app.label);row.setTextSize(15);row.setTextColor(StepMaterial.ink(ctx));row.setChecked(chosen.contains(app.key));
                int order=new ArrayList<>(chosen).indexOf(app.key)+1;
                row.setCheckMarkDrawable(new OrderMark(order));
                row.setContentDescription(app.label+(order>0?"，固定第"+order+"位":"，未固定"));
                try {
                    android.graphics.drawable.Drawable icon=app.info.getBadgedIcon(ctx.getResources().getDisplayMetrics().densityDpi);
                    if(icon!=null){icon.setBounds(0,0,dp(27),dp(27));row.setCompoundDrawablePadding(dp(10));row.setCompoundDrawables(icon,null,null,null);}
                } catch(RuntimeException ignored){}
                row.setMinHeight(dp(46));return row;
            }
        };
        list.setAdapter(adapter);
        list.setOnItemClickListener((p,v,i,id)->{String key=shown.get(i).key;if(!chosen.remove(key))chosen.add(key);refresh();});
        search.addTextChangedListener(new TextWatcher(){
            public void beforeTextChanged(CharSequence s,int a,int b,int c){} public void afterTextChanged(Editable s){}
            public void onTextChanged(CharSequence s,int a,int b,int c){refresh();}
        });
        LinearLayout footer=new LinearLayout(ctx);body.addView(footer,-1,dp(44));
        TextView cancel=StepMaterial.label(ctx,"取消",16,false);cancel.setOnClickListener(v->dialog.dismiss());
        TextView done=StepMaterial.label(ctx,"完成",16,true);done.setTextColor(0xff286cd8);done.setOnClickListener(v->{
            if(commit.write(new LinkedHashSet<>(chosen)))dialog.dismiss();
            else Toast.makeText(ctx,"配置已变化或无法保存，请重开选择器",Toast.LENGTH_SHORT).show();
        });
        footer.addView(cancel,new LinearLayout.LayoutParams(0,-1,1));footer.addView(done,new LinearLayout.LayoutParams(0,-1,1));
        body.setFocusableInTouchMode(true);body.requestFocus();dialog.setContentView(card);
        Window w=dialog.getWindow();if(overlay)w.setType(StepMaterial.MODAL_PANEL);
        w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        w.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE|WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        WindowManager.LayoutParams lp=w.getAttributes();lp.setTitle(TITLE);lp.gravity=Gravity.CENTER;lp.dimAmount=.28f;w.setAttributes(lp);
        w.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        Rect screen=ctx.getSystemService(WindowManager.class).getCurrentWindowMetrics().getBounds();
        int preferred=Math.min(dp(540),Math.round(screen.height()*.76f));
        int width=Math.min(dp(430),Math.round(screen.width()*.90f));
        w.setLayout(width,preferred);
        // Some OEM panel windows consume IME insets while still reporting the
        // reduced visible display frame. Observe both; do not reuse this dialog's
        // own bounds as the available display, which would shrink it repeatedly.
        View decor=w.getDecorView();
        Runnable fit=()->{
            if(!decor.isAttachedToWindow())return;
            WindowInsets root=decor.getRootWindowInsets();
            WindowInsets physical=ctx.getSystemService(WindowManager.class).getCurrentWindowMetrics().getWindowInsets();
            int keyboard=Math.max(root==null?0:root.getInsets(WindowInsets.Type.ime()).bottom,
                    physical.getInsets(WindowInsets.Type.ime()).bottom);
            int safeTop=physical.getInsetsIgnoringVisibility(WindowInsets.Type.systemBars()).top;
            Rect visible=new Rect();decor.getWindowVisibleDisplayFrame(visible);
            int[] location=new int[2];decor.getLocationOnScreen(location);
            int bottom=availableBottom(screen,visible,location[1]+decor.getHeight(),keyboard);
            int available=Math.max(1,bottom-screen.top-safeTop-dp(16));
            int size=Math.min(preferred,available);
            if(w.getAttributes().height!=size){
                StepRuntime.diagnostic("PICKER_VIEWPORT","ime="+keyboard+";visible="+visible.toShortString()+";height="+size);
                w.setLayout(width,size);
            }
        };
        decor.setOnApplyWindowInsetsListener((v,insets)->{v.post(fit);return v.onApplyWindowInsets(insets);});
        decor.getViewTreeObserver().addOnGlobalLayoutListener(fit::run);
        refresh();
    }
    static int availableBottom(Rect screen,Rect visible,int ownBottom,int ime){
        int bottom=screen.bottom-Math.max(0,ime);
        if(visible.left<=screen.left && visible.right>=screen.right && visible.bottom>screen.top
                && visible.bottom<=screen.bottom && Math.abs(visible.bottom-ownBottom)>1)
            bottom=Math.min(bottom,visible.bottom);
        return Math.max(screen.top,bottom);
    }
    void refresh(){
        String query=search.getText().toString().trim().toLowerCase(Locale.ROOT);
        shown.clear();for(QuickCatalog.App app:all)if(app.label.toLowerCase(Locale.ROOT).contains(query)||app.key.toLowerCase(Locale.ROOT).contains(query))shown.add(app);
        count.setText("已选 "+chosen.size()+" 个");adapter.notifyDataSetChanged();
    }
    int dp(int n){return StepMaterial.dp(ctx,n);}
    final class OrderMark extends android.graphics.drawable.Drawable{
        final int order;final android.graphics.Paint paint=new android.graphics.Paint(1);
        OrderMark(int value){order=value;}
        @Override public int getIntrinsicWidth(){return dp(24);}
        @Override public int getIntrinsicHeight(){return dp(24);}
        @Override public void draw(android.graphics.Canvas canvas){
            android.graphics.Rect rect=getBounds();float x=rect.exactCenterX(),y=rect.exactCenterY();
            paint.setColor(order>0?0xff377ee1:0xff8795a0);paint.setStyle(order>0?android.graphics.Paint.Style.FILL:android.graphics.Paint.Style.STROKE);
            paint.setStrokeWidth(dp(1));canvas.drawCircle(x,y,dp(10),paint);
            if(order>0){paint.setColor(-1);paint.setTextAlign(android.graphics.Paint.Align.CENTER);paint.setTextSize(dp(order>99?9:12));
                canvas.drawText(String.valueOf(order),x,y-(paint.ascent()+paint.descent())/2,paint);}
        }
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);}
        @Override public void setColorFilter(android.graphics.ColorFilter filter){paint.setColorFilter(filter);}
        @Override public int getOpacity(){return android.graphics.PixelFormat.TRANSLUCENT;}
    }
    void show(){
        dialog.show();View content=dialog.getWindow().getDecorView().findViewById(android.R.id.content);
        if(content!=null){content.setAlpha(0);content.setScaleX(.97f);content.setScaleY(.97f);
            content.animate().alpha(1).scaleX(1).scaleY(1).setDuration(180).start();}
    }
    void close(){dialog.dismiss();}
    Bundle draft(){Bundle b=new Bundle();b.putStringArrayList("draft",new ArrayList<>(chosen));b.putString("search",search.getText().toString());return b;}
}
