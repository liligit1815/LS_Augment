package ls.augment.com;

import android.app.Activity;
import android.view.Gravity;
import android.view.View;
import android.widget.*;
import java.util.function.BiConsumer;
import java.util.function.Function;

/** Uses the same presets and separate row/column actions as the desktop layout editor. */
final class ControlCenterGridEditor {
    private final Activity owner;
    private final UiKit ui;
    private final Function<String,String> value;
    private final BiConsumer<String,String> change;
    private LinearLayout body;
    ControlCenterGridEditor(Activity owner,UiKit ui,Function<String,String> value,BiConsumer<String,String> change){
        this.owner=owner;this.ui=ui;this.value=value;this.change=change;
    }
    View view(){body=new LinearLayout(owner);body.setOrientation(LinearLayout.VERTICAL);body.setTag("control-center-grid-editor");render();return body;}
    private String key(String suffix){return SystemUiOptions.PREFIX+"qs_"+suffix;}
    private int number(String suffix){return Integer.parseInt(value.apply(key(suffix)));}
    private void update(String suffix,int next){change.accept(key(suffix),String.valueOf(next));}
    private void render(){
        body.removeAllViews();
        orientation(false);orientation(true);
        dimension("edit_columns","磁贴编辑列数",2,8);
        dimension("land_edit_columns","横屏磁贴编辑列数",2,10);
    }
    private void orientation(boolean landscape){
        String prefix=landscape?"land_":"",title=landscape?"横屏":"竖屏";
        TextView summary=ui.text(title+" · "+number(prefix+"columns")+" 列 × "+number(prefix+"rows")+" 行",15,ui.text,true);
        summary.setGravity(Gravity.CENTER);body.addView(summary,ui.margins(0,12,0,8));
        body.addView(ui.featureTitle("常用布局（列 × 行）",null),ui.margins(0,6,0,6));
        LinearLayout presets=new LinearLayout(owner);body.addView(presets,ui.wrap());
        for(int[] size:new int[][]{{3,3},{4,3},{4,4}}){
            Button preset=ui.tonalButton(size[0]+" × "+size[1]);
            LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,ui.dp(44),1);if(presets.getChildCount()>0)p.setMarginStart(ui.dp(5));
            presets.addView(preset,p);preset.setOnClickListener(v->{update(prefix+"columns",size[0]);update(prefix+"rows",size[1]);render();});
        }
        body.addView(ui.featureTitle("分别调整行列",null),ui.margins(0,7,0,3));
        dimension(prefix+"columns",title+"列数 · 从左到右",2,landscape?10:8);
        dimension(prefix+"rows",title+"行数 · 从上到下",1,landscape?6:8);
    }
    private void dimension(String suffix,String title,int min,int max){
        int n=number(suffix);LinearLayout row=new LinearLayout(owner);row.setGravity(Gravity.CENTER_VERTICAL);
        body.addView(row,ui.margins(0,3,0,3));row.addView(ui.text(title,13,ui.text,false),new LinearLayout.LayoutParams(0,-2,1));
        Button minus=ui.tonalButton("−"),current=ui.tonalButton(n+" ▾"),plus=ui.tonalButton("＋");
        for(Button button:new Button[]{minus,current,plus}){
            button.setTextSize(14);button.setMinWidth(0);button.setMinimumWidth(0);button.setPadding(0,0,0,0);
            row.addView(button,new LinearLayout.LayoutParams(ui.dp(button==current?62:42),ui.dp(44)));
        }
        current.setTag("config:"+key(suffix));current.setContentDescription(title+"，当前 "+n);
        minus.setContentDescription("减少"+title);plus.setContentDescription("增加"+title);
        minus.setEnabled(n>min);plus.setEnabled(n<max);
        minus.setOnClickListener(v->{update(suffix,n-1);render();});plus.setOnClickListener(v->{update(suffix,n+1);render();});
        current.setOnClickListener(v->{String[] labels=new String[max-min+1];for(int i=0;i<labels.length;i++)labels[i]=String.valueOf(min+i);
            ui.choiceDialog(title,labels,null,index->{update(suffix,min+index);render();});});
    }
}
