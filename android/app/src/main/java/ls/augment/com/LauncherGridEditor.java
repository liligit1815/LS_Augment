package ls.augment.com;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import java.util.function.Function;

/** Native desktop-grid controls. The host owns persistence; the preview is illustrative only. */
final class LauncherGridEditor {
    private final Activity owner;
    private final UiKit ui;
    private final Function<String,String> value;
    private final Consumer<Map<String,String>> change;
    private final List<Button> presets=new ArrayList<>();
    private TextView summary;
    private Button rows,columns,lessRows,moreRows,lessColumns,moreColumns;
    private Preview preview;

    LauncherGridEditor(Activity owner,UiKit ui,Function<String,String> value,Consumer<Map<String,String>> change){
        this.owner=owner;this.ui=ui;this.value=value;this.change=change;
    }
    private LauncherGridSpec spec(){
        LauncherGridSpec current=LauncherGridSpec.parse(value.apply(LauncherGridSpec.ENABLED),value.apply(LauncherGridSpec.ROWS),value.apply(LauncherGridSpec.COLUMNS));
        return current==null?LauncherGridSpec.defaults():current;
    }
    View view(){
        LinearLayout body=column();body.setTag("launcher-grid-editor");
        summary=ui.text("",15,ui.text,true);summary.setGravity(Gravity.CENTER);body.addView(summary,ui.margins(0,4,0,0));
        preview=new Preview();body.addView(preview,new LinearLayout.LayoutParams(-1,ui.dp(238)));
        body.addView(ui.featureTitle("常用布局（列 × 行）",null),ui.margins(0,6,0,6));
        LinearLayout row=null;
        for(int i=0;i<LauncherGridSpec.PRESETS.size();i++){
            if(i%3==0){row=new LinearLayout(owner);body.addView(row,ui.margins(0,0,0,6));}
            LauncherGridSpec.Preset preset=LauncherGridSpec.PRESETS.get(i);Button button=button(row,preset.label,()->apply(preset.rows,preset.columns));
            button.setContentDescription(preset.columns+" 列 "+preset.rows+" 行布局");presets.add(button);
        }
        if(LauncherGridSpec.PRESETS.size()%3==0){row=new LinearLayout(owner);body.addView(row,ui.margins(0,0,0,6));}
        button(row,"n × n…",this::squareDialog).setContentDescription("选择方形布局，3×3 到 12×12");
        body.addView(ui.featureTitle("分别调整行列",null),ui.margins(0,7,0,3));
        dimension(body,false);dimension(body,true);
        refresh();return body;
    }
    private LinearLayout column(){LinearLayout result=new LinearLayout(owner);result.setOrientation(LinearLayout.VERTICAL);return result;}
    private Button button(LinearLayout row,String label,Runnable action){
        Button b=ui.tonalButton(label);b.setTextSize(12);b.setMinWidth(0);b.setMinimumWidth(0);b.setPadding(ui.dp(3),0,ui.dp(3),0);b.setOnClickListener(v->action.run());
        LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,ui.dp(44),1);if(row.getChildCount()>0)p.setMarginStart(ui.dp(5));row.addView(b,p);return b;
    }
    private void dimension(LinearLayout body,boolean vertical){
        LinearLayout row=new LinearLayout(owner);row.setGravity(Gravity.CENTER_VERTICAL);body.addView(row,ui.margins(0,3,0,3));
        row.addView(ui.text(vertical?"行数 · 从上到下":"列数 · 从左到右",13,ui.text,false),new LinearLayout.LayoutParams(0,-2,1));
        Button minus=ui.tonalButton("−"),current=ui.tonalButton(""),plus=ui.tonalButton("＋");
        for(Button b:new Button[]{minus,current,plus}){b.setTextSize(14);b.setMinWidth(0);b.setMinimumWidth(0);b.setPadding(0,0,0,0);row.addView(b,new LinearLayout.LayoutParams(ui.dp(b==current?62:42),ui.dp(44)));}
        current.setTag("config:"+(vertical?LauncherGridSpec.ROWS:LauncherGridSpec.COLUMNS));
        minus.setContentDescription(vertical?"减少桌面行数":"减少桌面列数");plus.setContentDescription(vertical?"增加桌面行数":"增加桌面列数");
        minus.setOnClickListener(v->step(vertical,-1));plus.setOnClickListener(v->step(vertical,1));current.setOnClickListener(v->dimensionDialog(vertical));
        if(vertical){rows=current;lessRows=minus;moreRows=plus;}else{columns=current;lessColumns=minus;moreColumns=plus;}
    }
    private void step(boolean vertical,int delta){LauncherGridSpec s=spec();apply(s.rows+(vertical?delta:0),s.columns+(vertical?0:delta));}
    private void dimensionDialog(boolean vertical){
        String[] choices=new String[LauncherGridSpec.MAX-LauncherGridSpec.MIN+1];
        for(int i=0;i<choices.length;i++)choices[i]=(i+LauncherGridSpec.MIN)+(vertical?" 行":" 列");
        ui.choiceDialog(vertical?"桌面行数":"桌面列数",choices,null,index->{LauncherGridSpec s=spec();int n=LauncherGridSpec.MIN+index;apply(vertical?n:s.rows,vertical?s.columns:n);});
    }
    private void squareDialog(){
        String[] choices=new String[LauncherGridSpec.MAX-LauncherGridSpec.MIN+1];
        for(int i=0;i<choices.length;i++){int n=LauncherGridSpec.MIN+i;choices[i]=n+" × "+n+"（"+n+" 列 × "+n+" 行）";}
        ui.choiceDialog("方形桌面布局",choices,null,index->{int n=LauncherGridSpec.MIN+index;apply(n,n);});
    }
    private void apply(int rowCount,int columnCount){
        if(rowCount<LauncherGridSpec.MIN||rowCount>LauncherGridSpec.MAX||columnCount<LauncherGridSpec.MIN||columnCount>LauncherGridSpec.MAX)return;
        change.accept(spec().withSize(rowCount,columnCount).values());refresh();
    }
    private void refresh(){
        LauncherGridSpec s=spec();summary.setText(summary.getContext().getString(R.string.status_launchergrideditor_32 ,String.valueOf(s.columns), String.valueOf(s.rows), String.valueOf((s.rows*s.columns))));
        rows.setText(rows.getContext().getString(R.string.status_launchergrideditor_33 ,String.valueOf(s.rows)));columns.setText(columns.getContext().getString(R.string.status_launchergrideditor_34 ,String.valueOf(s.columns)));rows.setContentDescription("桌面行数，当前 "+s.rows+" 行");columns.setContentDescription("桌面列数，当前 "+s.columns+" 列");
        lessRows.setEnabled(s.rows>LauncherGridSpec.MIN);moreRows.setEnabled(s.rows<LauncherGridSpec.MAX);lessColumns.setEnabled(s.columns>LauncherGridSpec.MIN);moreColumns.setEnabled(s.columns<LauncherGridSpec.MAX);
        for(int i=0;i<presets.size();i++){LauncherGridSpec.Preset p=LauncherGridSpec.PRESETS.get(i);boolean chosen=p.rows==s.rows&&p.columns==s.columns;Button b=presets.get(i);b.setSelected(chosen);b.setBackground(ui.roundStroke(chosen?ui.accentContainer:ui.cardHigh,12,chosen?ui.accent:ui.outline,chosen?2:1));}
        preview.setContentDescription("桌面布局示意，"+s.columns+" 列，"+s.rows+" 行，共 "+(s.rows*s.columns)+" 格；实际布局需重启系统桌面生效");preview.invalidate();
    }
    private final class Preview extends View {
        private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        Preview(){super(owner);setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);}
        @Override protected void onDraw(Canvas canvas){
            super.onDraw(canvas);LauncherGridSpec s=spec();float width=Math.min(ui.dp(180),getWidth()-ui.dp(24)),height=getHeight()-ui.dp(16),left=(getWidth()-width)/2,top=ui.dp(8),radius=ui.dp(18);
            paint.setStyle(Paint.Style.FILL);paint.setColor(ui.cardHigh);canvas.drawRoundRect(left,top,left+width,top+height,radius,radius,paint);
            paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(ui.dp(1));paint.setColor(ui.outline);canvas.drawRoundRect(left,top,left+width,top+height,radius,radius,paint);paint.setStyle(Paint.Style.FILL);
            paint.setColor(ui.muted);canvas.drawRoundRect(left+width*.37f,top+ui.dp(8),left+width*.63f,top+ui.dp(11),ui.dp(2),ui.dp(2),paint);
            float x=left+ui.dp(10),y=top+ui.dp(22),cellW=(width-ui.dp(20))/s.columns,cellH=(height-ui.dp(50))/s.rows;
            int[] colors={ui.accent,ui.cyan,ui.warning,ui.muted};
            for(int r=0;r<s.rows;r++)for(int c=0;c<s.columns;c++){
                float size=Math.min(cellW*.56f,cellH*.57f),cx=x+cellW*(c+.5f),cy=y+cellH*(r+.42f);paint.setColor(colors[(r+c)%colors.length]);paint.setAlpha(170);
                canvas.drawRoundRect(cx-size/2,cy-size/2,cx+size/2,cy+size/2,Math.max(1,size*.25f),Math.max(1,size*.25f),paint);paint.setAlpha(255);paint.setColor(ui.outline);
                canvas.drawRoundRect(cx-size*.4f,cy+size*.65f,cx+size*.4f,cy+size*.65f+ui.dp(1),1,1,paint);
            }
            paint.setColor(ui.muted);paint.setTextAlign(Paint.Align.CENTER);paint.setTextSize(ui.dp(10));canvas.drawText("布局示意",left+width/2,top+height-ui.dp(11),paint);
        }
    }
}
