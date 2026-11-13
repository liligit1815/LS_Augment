package ls.augment.com.hook;

import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.Set;
import static ls.augment.com.hook.SystemUiAdapter.field;

/** Reversible role styling for verified ordinary scene views. RemoteViews keep their source-owned controls. */
final class IslandScenePresentation {
    private final Map<View,Snapshot> original=new IdentityHashMap<>();
    private final Map<View,Integer> applied=new IdentityHashMap<>();
    private static final class Snapshot {
        final Drawable background;final int left,top,right,bottom,width,height;
        final android.content.res.ColorStateList colors;final boolean fontPadding;
        final float size;final Typeface font;
        Snapshot(View view){
            background=view.getBackground();left=view.getPaddingLeft();top=view.getPaddingTop();right=view.getPaddingRight();bottom=view.getPaddingBottom();
            ViewGroup.LayoutParams p=view.getLayoutParams();width=p==null?-1:p.width;height=p==null?-1:p.height;
            TextView text=view instanceof TextView?(TextView)view:null;
            colors=text==null?null:text.getTextColors();fontPadding=text==null||text.getIncludeFontPadding();size=text==null?0:text.getTextSize();font=text==null?null:text.getTypeface();
        }
        void restore(View view){
            view.setBackground(background);view.setPadding(left,top,right,bottom);
            if(view instanceof TextView){TextView text=(TextView)view;text.setTextColor(colors);text.setIncludeFontPadding(fontPadding);text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,size);text.setTypeface(font);}
            ViewGroup.LayoutParams p=view.getLayoutParams();if(p!=null&&(p.width!=width||p.height!=height)){p.width=width;p.height=height;view.setLayoutParams(p);}
        }
    }
    private void save(View view){original.computeIfAbsent(view,Snapshot::new);}
    void style(View compact,View panel){
        if(compact==null)return;
        int signature=compact.getResources().getConfiguration().hashCode();
        if(applied.getOrDefault(compact,0)==signature)return;applied.put(compact,signature);
        save(compact);compact.setBackground(Native12IslandStyle.background(compact.getContext(),false));
        roles(compact,false);
        if(panel!=null){save(panel);panel.setBackground(Native12IslandStyle.background(panel.getContext(),true));roles(panel,true);}
    }
    private void roles(View view,boolean panel){
        for(String name:new String[]{"mDisplayText","mDisplayTitle","mDisplaySecondText"}){
            Object value=field(view,name);if(!(value instanceof TextView))continue;
            TextView text=(TextView)value;save(text);
            boolean secondary="mDisplaySecondText".equals(name);
            Native12IslandStyle.text(text,panel?secondary?Native12IslandStyle.DETAIL:Native12IslandStyle.TITLE:Native12IslandStyle.COMPACT_TEXT,!secondary);
        }
        Object value=field(view,"mDisplayIcon");
        if(value instanceof ImageView){ImageView image=(ImageView)value;save(image);ViewGroup.LayoutParams p=image.getLayoutParams();
            if(p!=null){p.width=p.height=Native12IslandStyle.dp(view.getContext(),panel?Native12IslandStyle.PANEL_ICON:Native12IslandStyle.COMPACT_ICON);image.setLayoutParams(p);}}
    }
    void retain(Set<View> live){
        // A scene's children remain owned only while its compact/panel root is selected for styling.
        for(View view:original.keySet().toArray(new View[0])){
            boolean keep=live.contains(view);
            for(android.view.ViewParent parent=view.getParent();!keep&&parent instanceof View;parent=parent.getParent())keep=live.contains(parent);
            if(!keep){original.remove(view).restore(view);applied.remove(view);}
        }
    }
    void clear(){for(Map.Entry<View,Snapshot> entry:original.entrySet())entry.getValue().restore(entry.getKey());original.clear();applied.clear();}
}
