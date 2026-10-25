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
    private TextView portraitSummary,landscapeSummary;
    ControlCenterGridEditor(Activity owner,UiKit ui,Function<String,String> value,BiConsumer<String,String> change){
        this.owner=owner;this.ui=ui;this.value=value;this.change=change;
    }
    View view(){body=new LinearLayout(owner);body.setOrientation(LinearLayout.VERTICAL);body.setTag("control-center-grid-editor");render();return body;}
    private String key(String suffix){return SystemUiOptions.PREFIX+"qs_"+suffix;}
    private int number(String suffix){return Integer.parseInt(value.apply(key(suffix)));}
    private void update(String suffix,int next){
        change.accept(key(suffix),String.valueOf(next));
        if(portraitSummary!=null)portraitSummary.setText(owner.getString(R.string.control_center_grid_summary,"竖屏",number("columns"),number("rows")));
        if(landscapeSummary!=null)landscapeSummary.setText(owner.getString(R.string.control_center_grid_summary,"横屏",number("land_columns"),number("land_rows")));
    }
    private void render(){
        body.removeAllViews();
        orientation(false);orientation(true);
        dimension("edit_columns","磁贴编辑列数",2,8);
        dimension("land_edit_columns","横屏磁贴编辑列数",2,10);
    }
    private void orientation(boolean landscape){
        String prefix=landscape?"land_":"",title=landscape?"横屏":"竖屏";
        TextView summary=ui.text(title+" · "+number(prefix+"columns")+" 列 × "+number(prefix+"rows")+" 行",15,ui.text,true);
        if(landscape)landscapeSummary=summary;else portraitSummary=summary;
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
        View heading=ui.featureTitle(title,null);body.addView(heading,ui.margins(0,3,0,0));
        ParameterSlider editor=new ParameterSlider(ui,EnhancementOption.integer(key(suffix),"control-center",title,"",number(suffix),min,max),
                String.valueOf(number(suffix)),next->update(suffix,Integer.parseInt(next)));
        editor.bindTitle(heading);body.addView(editor,ui.wrap());
    }
}
