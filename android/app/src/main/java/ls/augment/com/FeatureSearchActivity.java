package ls.augment.com;

import android.app.Activity;
import android.app.ActivityOptions;
import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.*;
import java.util.List;

/** A separate search destination, keeping the home page and submitted history intact. */
public final class FeatureSearchActivity extends Activity {
    private UiKit ui;
    private EditText input;
    private LinearLayout results;
    private ScrollView scroll;
    private String focusTitle="",focusTag="";
    static void open(Activity owner,View source){
        owner.startActivity(new Intent(owner,FeatureSearchActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,"feature_search"),
                ActivityOptions.makeScaleUpAnimation(source,0,0,source.getWidth(),source.getHeight()).toBundle());
    }
    @Override protected void onCreate(Bundle state){
        super.onCreate(state);ui=new UiKit(this);
        getIntent().putExtra(ModuleNavigation.EXTRA_ROUTE,"feature_search");
        LinearLayout root=ui.detailChrome("搜索",null);
        LinearLayout field=new LinearLayout(this);field.setGravity(Gravity.CENTER_VERTICAL);
        field.setPadding(ui.dp(16),0,ui.dp(16),0);
        input=new EditText(this);input.setSingleLine(true);input.setHint("搜索分组或功能");
        input.setTag("feature-search-input");input.setContentDescription("搜索分组或功能");
        input.setImeOptions(EditorInfo.IME_ACTION_SEARCH);ui.styleInput(input);
        input.setFilters(new android.text.InputFilter[]{new android.text.InputFilter.LengthFilter(80)});
        field.addView(input,new LinearLayout.LayoutParams(0,-2,1));
        Button clear=ui.tonalButton("清除");clear.setContentDescription("清除搜索文字");
        LinearLayout.LayoutParams clearParams=new LinearLayout.LayoutParams(-2,ui.dp(48));clearParams.leftMargin=ui.dp(8);
        field.addView(clear,clearParams);root.addView(field,ui.wrap());
        scroll=new ScrollView(this);scroll.setTag("search-results-scroll");scroll.setFillViewport(true);
        results=new LinearLayout(this);results.setOrientation(LinearLayout.VERTICAL);results.setPadding(ui.dp(16),ui.dp(12),ui.dp(16),ui.dp(24));
        scroll.addView(results);root.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
        ui.setContentView(root);ui.applyGestureInset(root,8);
        clear.setOnClickListener(v->input.setText(""));
        input.addTextChangedListener(new TextWatcher(){
            public void beforeTextChanged(CharSequence s,int start,int count,int after){}
            public void onTextChanged(CharSequence s,int start,int before,int count){render();scroll.scrollTo(0,0);}
            public void afterTextChanged(Editable value){}
        });
        input.setOnEditorActionListener((v,action,event)->{
            if(action!=EditorInfo.IME_ACTION_SEARCH)return false;
            rememberVisibleQuery();hideKeyboard();return true;
        });
        input.setText(state==null?"":state.getString("query",""));input.setSelection(input.length());render();
        if(state!=null)scroll.post(()->scroll.scrollTo(0,state.getInt("scroll",0)));
        else input.postDelayed(()->{if(!isFinishing()&&!isDestroyed()){input.requestFocus();getSystemService(InputMethodManager.class).showSoftInput(input,InputMethodManager.SHOW_IMPLICIT);}},220);
    }
    @Override protected void onResume(){super.onResume();if(results!=null)render();}
    @Override protected void onSaveInstanceState(Bundle state){state.putString("query",input.getText().toString());state.putInt("scroll",scroll.getScrollY());super.onSaveInstanceState(state);}
    private void hideKeyboard(){getSystemService(InputMethodManager.class).hideSoftInputFromWindow(input.getWindowToken(),0);}
    private void rememberVisibleQuery(){
        String query=input.getText().toString();
        if(ModuleFeatureSearch.search(query,false).size()>0)FeatureSearchHistory.remember(this,query);
    }
    private void render(){
        results.removeAllViews();String query=input.getText().toString().trim();
        if(query.isEmpty()){
            ui.addDetailSectionTitle(results,"近期搜索");
            LinearLayout card=ui.preferenceCard();int count=0;
            for(String recent:FeatureSearchHistory.read(this)){
                if(ModuleFeatureSearch.search(recent,HiddenEntrySession.isUnlocked()).isEmpty())continue;
                if(count++>0)card.addView(ui.divider());
                // A history action edits this search, so it has no navigation arrow.
                TextView row=ui.text(recent,14,ui.text,false);row.setGravity(Gravity.CENTER_VERTICAL);
                row.setMinHeight(ui.dp(48));row.setTag("search-history:"+recent);row.setFocusable(true);
                row.setBackground(ui.pressable(ui.round(android.graphics.Color.TRANSPARENT,8)));
                row.setOnClickListener(v->{input.setText(recent);input.setSelection(input.length());});card.addView(row,ui.wrap());
            }
            if(count==0)results.addView(ui.text("还没有搜索记录",14,ui.muted,false));
            else {results.addView(card);Button clear=ui.tonalButton("清除搜索记录");clear.setTag("clear-search-history");
                clear.setOnClickListener(v->{FeatureSearchHistory.clear(this);render();});results.addView(clear,ui.margins(0,12,0,0));}
            return;
        }
        List<ModuleFeatureSearch.Result> matches=ModuleFeatureSearch.search(query,HiddenEntrySession.isUnlocked());
        if(matches.isEmpty()){results.addView(ui.text("没有找到相关分组或功能\n试试“时钟”“USB”或“截图”",14,ui.muted,false));return;}
        LinearLayout card=ui.preferenceCard();results.addView(card);
        for(ModuleFeatureSearch.Result result:matches){
            if(card.getChildCount()>0)card.addView(ui.divider());
            View row=ui.preferenceRow(result.route,result.title,result.path,()->{
                if(ModuleHierarchy.isRestricted(result.route)&&!HiddenEntrySession.isUnlocked()){render();return;}
                if(!ModuleHierarchy.isRestricted(result.route))FeatureSearchHistory.remember(this,query);
                hideKeyboard();focusTitle=result.title;focusTag=result.focusTag;
                try{ModuleNavigation.open(this,result.route);}finally{focusTitle=focusTag="";}
            });
            row.setTag("search-result:"+result.route);card.addView(row,ui.wrap());
        }
    }
    @Override public void startActivity(Intent intent,Bundle options){
        // Only the selected result carries a one-shot focus request to its real editor.
        if(!focusTitle.isEmpty())intent.putExtra(SearchResultHighlight.TITLE,focusTitle).putExtra(SearchResultHighlight.TAG,focusTag);
        super.startActivity(intent,options);
    }
}
