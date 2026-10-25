package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.LinearLayout;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Stable real-data pages. Horizontal paging leaves vertical scrolling and child controls intact. */
final class AtomicWorkbenchCardPager extends LinearLayout {
    public static final class Page {
        public final String id,title;
        public final long appearedRevision;
        public final View view;
        public Page(String id,String title,long appearedRevision,View view){
            if(id==null||id.isEmpty()||id.length()>96||title==null||title.isEmpty()||title.length()>128||appearedRevision<0||view==null)
                throw new IllegalArgumentException("invalid_card_page");
            this.id=id;this.title=title;this.appearedRevision=appearedRevision;this.view=view;
        }
    }
    private final AtomicWorkbenchCardPageModel model=new AtomicWorkbenchCardPageModel();
    private final Map<String,Page> dynamic=new LinkedHashMap<>();
    private final Map<String,View> attached=new LinkedHashMap<>();
    private final int slop,threshold;
    private View music,navigation;
    private boolean available,candidate,dragging;
    private float downX,downY;
    private int pointer=-1;
    private Runnable changed;
    AtomicWorkbenchCardPager(Context context){
        super(context);setOrientation(VERTICAL);slop=ViewConfiguration.get(context).getScaledTouchSlop();
        threshold=Math.max(slop*2,Math.round(24*context.getResources().getDisplayMetrics().density));
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_YES);
    }
    void setPages(View music,View navigation,Runnable listener){
        if(music==null||navigation==null||music==navigation)throw new IllegalArgumentException("invalid_base_pages");
        this.music=music;this.navigation=navigation;changed=listener;reconcile();
    }
    void setNavigationAvailable(boolean value){if(available==value)return;available=value;model.base(value);reset();reconcile();}
    void setNavigationSource(boolean value,String sourceGeneration){String before=model.selected();List<String> ids=model.ids();model.navigation(value,sourceGeneration);available=value;if(!ids.equals(model.ids())||!before.equals(model.selected()))reset();reconcile();}
    void setNotificationPages(List<Page> pages,boolean trustedComplete){
        if(pages==null||pages.size()>AtomicWorkbenchCardPageModel.MAX_DYNAMIC)throw new IllegalArgumentException("invalid_notification_pages");
        LinkedHashMap<String,Page> parsed=new LinkedHashMap<>();ArrayList<AtomicWorkbenchCardPageModel.Item> items=new ArrayList<>();
        java.util.Set<View> views=java.util.Collections.newSetFromMap(new java.util.IdentityHashMap<>());
        for(Page page:pages){
            if(page==null||page.id.equals("music")||page.id.equals("navigation")||parsed.put(page.id,page)!=null||!views.add(page.view)
                    ||page.view==music||page.view==navigation)throw new IllegalArgumentException("duplicate_notification_page");
            if(page.view.getParent() instanceof ViewGroup&&page.view.getParent()!=this)throw new IllegalArgumentException("card_view_already_parented");
            items.add(new AtomicWorkbenchCardPageModel.Item(page.id,page.appearedRevision));
        }
        if(!trustedComplete)for(Page retained:dynamic.values())if(!parsed.containsKey(retained.id)&&views.contains(retained.view))throw new IllegalArgumentException("duplicate_notification_page");
        List<String> before=model.ids();String old=model.selected();model.dynamic(items,trustedComplete);
        dynamic.keySet().retainAll(model.ids());
        for(Page p:parsed.values())if(model.ids().contains(p.id))dynamic.put(p.id,p);
        if(!before.equals(model.ids())||!old.equals(model.selected()))reset();reconcile();
    }
    void resetNotificationPages(){model.resetDynamic();dynamic.clear();reset();reconcile();}
    void resetNavigationSource(){model.resetNavigationSource();}
    int page(){return model.index();}
    String pageId(){return model.selected();}
    String pageTitle(){if(pageId().equals("music"))return "音乐";if(pageId().equals("navigation"))return "导航";Page p=dynamic.get(pageId());return p==null?"计时":p.title;}
    int pageCount(){return model.size();}
    boolean hasNavigation(){return available;}
    boolean selectPage(String id){boolean changed=model.select(id);if(changed){reset();render();}return changed;}
    String indicator(){if(model.size()>7)return (model.index()+1)+" / "+model.size();StringBuilder b=new StringBuilder();for(int i=0;i<model.size();i++){if(i>0)b.append(' ');b.append(i==model.index()?'●':'○');}return b.toString();}
    String pageDescription(){return pageTitle()+"，第 "+(page()+1)+" 页，共 "+pageCount()+" 页"+(page()<pageCount()-1?"，左滑查看下一页":"")+(page()>0?"，右滑查看上一页":"");}
    private void reconcile(){
        if(music==null||navigation==null)return;
        LinkedHashMap<String,View> desired=new LinkedHashMap<>();
        for(String id:model.ids()){View view=id.equals("music")?music:id.equals("navigation")?navigation:dynamic.containsKey(id)?dynamic.get(id).view:null;if(view!=null)desired.put(id,view);}
        for(String id:new ArrayList<>(attached.keySet()))if(!desired.containsKey(id)||attached.get(id)!=desired.get(id)){removeView(attached.remove(id));}
        for(Map.Entry<String,View> entry:desired.entrySet())if(!attached.containsKey(entry.getKey())){
            View view=entry.getValue();if(view.getParent() instanceof ViewGroup&&view.getParent()!=this)throw new IllegalArgumentException("card_view_already_parented");
            addView(view,new LinearLayout.LayoutParams(-1,-2));attached.put(entry.getKey(),view);
        }
        render();
    }
    private void render(){for(Map.Entry<String,View> e:attached.entrySet())e.getValue().setVisibility(e.getKey().equals(model.selected())?VISIBLE:GONE);if(changed!=null)changed.run();}
    private void reset(){candidate=dragging=false;pointer=-1;if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(false);}
    private boolean valid(MotionEvent e){return e.getPointerCount()==1&&Float.isFinite(e.getX())&&Float.isFinite(e.getY());}
    private void down(MotionEvent e){reset();if(valid(e)){pointer=e.getPointerId(0);downX=e.getX();downY=e.getY();candidate=true;}}
    @Override public boolean onInterceptTouchEvent(MotionEvent e){
        if(model.size()<2){reset();return false;}
        switch(e.getActionMasked()){
            case MotionEvent.ACTION_DOWN:down(e);break;
            case MotionEvent.ACTION_MOVE:
                if(!candidate||!valid(e)||e.getPointerId(0)!=pointer){reset();break;}
                float x=Math.abs(e.getX()-downX),y=Math.abs(e.getY()-downY);
                if(y>slop&&y>=x){reset();break;}if(x>slop&&x>y*1.25f){dragging=true;if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(true);return true;}break;
            case MotionEvent.ACTION_POINTER_DOWN:case MotionEvent.ACTION_CANCEL:case MotionEvent.ACTION_UP:reset();break;
            default:break;
        }return false;
    }
    @Override public boolean onTouchEvent(MotionEvent e){
        if(model.size()<2)return super.onTouchEvent(e);
        int action=e.getActionMasked();if(action==MotionEvent.ACTION_DOWN){down(e);return true;}
        if(action==MotionEvent.ACTION_POINTER_DOWN||action==MotionEvent.ACTION_CANCEL){reset();return true;}
        if(action==MotionEvent.ACTION_MOVE&&candidate){if(!valid(e)||e.getPointerId(0)!=pointer){reset();return true;}float x=Math.abs(e.getX()-downX),y=Math.abs(e.getY()-downY);
            if(y>slop&&y>=x)reset();else if(x>slop&&x>y*1.25f)dragging=true;return true;}
        if(action==MotionEvent.ACTION_UP){
            if(candidate&&dragging&&valid(e)&&e.getPointerId(0)==pointer){float delta=e.getX()-downX;if(Math.abs(delta)>=threshold&&model.move(delta<0?1:-1))render();}
            else if(candidate&&valid(e))performClick();reset();return true;
        }return true;
    }
    @Override public boolean performClick(){return super.performClick();}
    @Override public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info){super.onInitializeAccessibilityNodeInfo(info);info.setScrollable(model.size()>1);
        if(page()<pageCount()-1)info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD);
        if(page()>0)info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_BACKWARD);}
    @Override public boolean performAccessibilityAction(int action,Bundle args){
        int delta=action==AccessibilityNodeInfo.ACTION_SCROLL_FORWARD?1:action==AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD?-1:0;
        if(delta!=0&&model.move(delta)){reset();render();return true;}return super.performAccessibilityAction(action,args);
    }
}
