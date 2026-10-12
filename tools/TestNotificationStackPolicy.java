package ls.augment.com;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/** Notification identities verify switch semantics, rather than copying grouping formulas. */
public final class TestNotificationStackPolicy {
    static int checks;
    static final String APP_A=NotificationStackPolicy.ALERTING+":app:0:app.a";
    static void check(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
    static NotificationStackPolicy.Item<String> item(String key,String app,boolean silent,long time){
        return new NotificationStackPolicy.Item<>(key,key,app,silent,time);
    }
    static final List<NotificationStackPolicy.Item<String>> MIXED=Arrays.asList(
            item("a-old","0:app.a",false,100),item("b-latest-alert","0:app.b",false,300),
            item("a-new","0:app.a",false,200),item("s-old","0:app.a",true,800),item("s-latest","0:app.c",true,900));
    static Set<String> open(String... keys){return new LinkedHashSet<>(Arrays.asList(keys));}
    static NotificationStackPolicy.Plan<String> plan(boolean big,boolean small,String... expanded){
        return NotificationStackPolicy.plan(MIXED,big,small,open(expanded));
    }
    static List<String> visible(NotificationStackPolicy.Plan<String> plan){
        List<String> keys=new ArrayList<>();for(NotificationStackPolicy.Node<String> node:plan.nodes)if(node.item!=null)keys.add(node.item.value);return keys;
    }
    static void visible(NotificationStackPolicy.Plan<String> plan,String... expected){
        check(visible(plan).equals(Arrays.asList(expected)),"visible identities/order: "+visible(plan)+" expected "+Arrays.toString(expected));
        check(new HashSet<>(visible(plan)).size()==visible(plan).size(),"no notification duplicates in a plan");
    }
    static NotificationStackPolicy.Node<String> header(NotificationStackPolicy.Plan<String> plan,String key){
        NotificationStackPolicy.Node<String> found=null;
        for(NotificationStackPolicy.Node<String> node:plan.nodes)if(node.item==null&&key.equals(node.groupKey)){check(found==null,"only one header per group "+key);found=node;}
        check(found!=null,"header exists: "+key);return found;
    }
    static void groups(NotificationStackPolicy.Plan<String> plan,String... expected){
        check(plan.groups.keySet().equals(open(expected)),"expandable groups: "+plan.groups.keySet()+" expected "+Arrays.toString(expected));
        check(!plan.groups.containsKey(NotificationStackPolicy.ALERTING)&&!plan.groups.containsKey(NotificationStackPolicy.SILENT),"native categories never count as expandable groups");
    }
    static void categories(NotificationStackPolicy.Plan<String> plan){
        for(String key:new String[]{NotificationStackPolicy.ALERTING,NotificationStackPolicy.SILENT}){
            NotificationStackPolicy.Node<String> label=header(plan,key);check(label.expanded&&!label.label.isEmpty(),"category is a static title, without fold state: "+key);
        }
    }
    static void ordinaryRows(NotificationStackPolicy.Plan<String> plan){
        for(NotificationStackPolicy.Node<String> node:plan.nodes)if(node.item!=null)
            check(node.expanded&&node.count==1&&node.groupKey.isEmpty()&&node.label.isEmpty(),"ordinary notification retains native clicks: "+node.item.key);
    }
    static List<String> signatures(NotificationStackPolicy.Plan<String> plan){
        List<String> result=new ArrayList<>();for(NotificationStackPolicy.Node<String> node:plan.nodes)
            result.add((node.item==null?"label":node.item.key)+"|"+node.groupKey+"|"+node.label+"|"+node.expanded+"|"+node.count);return result;
    }
    static void samePlan(NotificationStackPolicy.Plan<String> actual,NotificationStackPolicy.Plan<String> expected,String reason){
        check(signatures(actual).equals(signatures(expected)),reason+": nodes");check(actual.hiddenKeys.equals(expected.hiddenKeys),reason+": hidden identities");check(actual.groups.keySet().equals(expected.groups.keySet()),reason+": groups");
    }
    static void conservation(NotificationStackPolicy.Plan<String> plan,List<NotificationStackPolicy.Item<String>> source){
        Set<String> seen=new HashSet<>(visible(plan));for(String hidden:plan.hiddenKeys)check(seen.add(hidden),"visible and folded identities do not overlap");
        Set<String> original=new HashSet<>();for(NotificationStackPolicy.Item<String> item:source)original.add(item.key);check(seen.equals(original),"every original notification is retained exactly once");
    }
    static void nativeMode(){
        // The summary is an opaque original row here. Preserving the actual native
        // notification group and its children belongs to the Hook runtime suite.
        List<NotificationStackPolicy.Item<String>> original=Arrays.asList(
                item("native-quiet-new","0:app.a",true,900),item("native-summary","0:app.a",false,100),
                item("native-alert","0:app.a",false,300),item("native-quiet-old","0:app.a",true,800));
        for(Set<String> expanded:Arrays.asList(open(),open(NotificationStackPolicy.ALERTING,NotificationStackPolicy.SILENT),open(NotificationStackPolicy.MERGED,APP_A,"removed-app"))){
            NotificationStackPolicy.Plan<String> nativePlan=NotificationStackPolicy.plan(original,false,false,expanded);
            visible(nativePlan,"native-quiet-new","native-summary","native-alert","native-quiet-old");
            check(nativePlan.nodes.size()==original.size(),"both switches off emits no module labels");groups(nativePlan);
            check(nativePlan.hiddenKeys.isEmpty(),"both switches off never hides native rows");ordinaryRows(nativePlan);
            for(int i=0;i<original.size();i++)check(nativePlan.nodes.get(i).item==original.get(i),"native item reference and index are unchanged");conservation(nativePlan,original);
        }
        NotificationStackPolicy.Plan<String> nativePlan=plan(false,false);
        visible(nativePlan,"a-old","b-latest-alert","a-new","s-old","s-latest");groups(nativePlan);ordinaryRows(nativePlan);
        samePlan(plan(false,false,NotificationStackPolicy.ALERTING,NotificationStackPolicy.SILENT,NotificationStackPolicy.MERGED,APP_A),nativePlan,"previous expansion keys cannot change native mode");
    }
    static void smallMode(){
        NotificationStackPolicy.Plan<String> small=plan(false,true);
        visible(small,"a-new","b-latest-alert","s-old","s-latest");groups(small,APP_A);categories(small);
        check(header(small,APP_A).count==2&&!header(small,APP_A).expanded,"app stack folds directly without opening its category");
        check(small.hiddenKeys.equals(open("a-old")),"only another notification of the same app/category is hidden");
        samePlan(plan(false,true,NotificationStackPolicy.ALERTING),small,"legacy alerting key is ignored");
        samePlan(plan(false,true,NotificationStackPolicy.SILENT),small,"legacy silent key is ignored");
        samePlan(plan(false,true,NotificationStackPolicy.ALERTING,NotificationStackPolicy.SILENT,NotificationStackPolicy.MERGED),small,"legacy category and big keys add no expansion gate");
        NotificationStackPolicy.Plan<String> appOpen=plan(false,true,APP_A);
        visible(appOpen,"a-old","a-new","b-latest-alert","s-old","s-latest");groups(appOpen,APP_A);
        check(header(appOpen,APP_A).expanded&&appOpen.hiddenKeys.isEmpty(),"one app expansion opens every member directly");
        for(NotificationStackPolicy.Node<String> node:small.nodes)if(node.item!=null&&!"a-new".equals(node.item.key))
            check(node.expanded&&node.count==1&&node.groupKey.isEmpty(),"single app notification keeps native clicks: "+node.item.key);
        conservation(small,MIXED);conservation(appOpen,MIXED);
    }
    static void bigMode(){
        NotificationStackPolicy.Plan<String> merged=plan(true,false);
        visible(merged,"b-latest-alert");groups(merged,NotificationStackPolicy.MERGED);
        check(header(merged,NotificationStackPolicy.MERGED).count==5&&!header(merged,NotificationStackPolicy.MERGED).expanded,"big stack includes both categories");
        check(merged.hiddenKeys.contains("s-latest"),"newer silent card cannot replace the alerting front");check(merged.nodes.size()==2,"folded big mode has no category labels or gates");
        samePlan(plan(true,false,NotificationStackPolicy.ALERTING,NotificationStackPolicy.SILENT,APP_A),merged,"only MERGED opens the big stack");
        NotificationStackPolicy.Plan<String> mergedOpen=plan(true,false,NotificationStackPolicy.MERGED);
        visible(mergedOpen,"a-old","b-latest-alert","a-new","s-old","s-latest");groups(mergedOpen,NotificationStackPolicy.MERGED);categories(mergedOpen);ordinaryRows(mergedOpen);
        check(header(mergedOpen,NotificationStackPolicy.MERGED).expanded,"big expansion restores both categories directly");
        samePlan(plan(true,false,NotificationStackPolicy.MERGED,NotificationStackPolicy.ALERTING,NotificationStackPolicy.SILENT,APP_A),mergedOpen,"old category/app keys cannot regroup big-only rows");
        conservation(merged,MIXED);conservation(mergedOpen,MIXED);
        visible(NotificationStackPolicy.plan(Arrays.asList(item("quiet-old","0:a",true,10),item("quiet-new","0:b",true,20)),true,false,open()),"quiet-new");
        visible(NotificationStackPolicy.plan(Arrays.asList(item("first","0:a",false,10),item("second","0:b",false,10)),true,false,open()),"first");
    }
    static void combinedMode(){
        NotificationStackPolicy.Plan<String> merged=plan(true,true,APP_A);
        visible(merged,"b-latest-alert");groups(merged,NotificationStackPolicy.MERGED);
        NotificationStackPolicy.Plan<String> mergedOpen=plan(true,true,NotificationStackPolicy.MERGED);
        visible(mergedOpen,"a-new","b-latest-alert","s-old","s-latest");groups(mergedOpen,NotificationStackPolicy.MERGED,APP_A);categories(mergedOpen);
        check(!header(mergedOpen,APP_A).expanded,"big expansion exposes the remaining app stack");check(mergedOpen.hiddenKeys.equals(open("a-old")),"big expansion leaves no hidden category stack");
        NotificationStackPolicy.Plan<String> bothOpen=plan(true,true,NotificationStackPolicy.MERGED,APP_A);
        visible(bothOpen,"a-old","a-new","b-latest-alert","s-old","s-latest");groups(bothOpen,NotificationStackPolicy.MERGED,APP_A);
        check(header(bothOpen,APP_A).expanded&&bothOpen.hiddenKeys.isEmpty(),"big then app expansion needs exactly those two keys");
        samePlan(plan(true,true,NotificationStackPolicy.MERGED,NotificationStackPolicy.ALERTING,NotificationStackPolicy.SILENT,APP_A),bothOpen,"legacy categories cannot add a third layer");
        visible(plan(false,true,NotificationStackPolicy.MERGED,APP_A),"a-old","a-new","b-latest-alert","s-old","s-latest");
        visible(plan(false,false,NotificationStackPolicy.MERGED,APP_A),"a-old","b-latest-alert","a-new","s-old","s-latest");
        conservation(merged,MIXED);conservation(mergedOpen,MIXED);conservation(bothOpen,MIXED);
    }
    static void profilesAndSingletons(){
        String work=NotificationStackPolicy.ALERTING+":app:10:app.a",quiet=NotificationStackPolicy.SILENT+":app:0:app.a";
        List<NotificationStackPolicy.Item<String>> original=Arrays.asList(
                item("personal-old","0:app.a",false,1),item("work-old","10:app.a",false,2),item("personal-new","0:app.a",false,3),item("work-new","10:app.a",false,4),
                item("quiet-personal-old","0:app.a",true,5),item("quiet-personal-new","0:app.a",true,6),item("quiet-work","10:app.a",true,7));
        NotificationStackPolicy.Plan<String> folded=NotificationStackPolicy.plan(original,false,true,open());
        visible(folded,"personal-new","work-new","quiet-personal-new","quiet-work");groups(folded,APP_A,work,quiet);
        for(String key:new String[]{APP_A,work,quiet})check(header(folded,key).count==2,"app stack excludes other category/profile: "+key);
        NotificationStackPolicy.Plan<String> personal=NotificationStackPolicy.plan(original,false,true,open(APP_A));
        visible(personal,"personal-old","personal-new","work-new","quiet-personal-new","quiet-work");
        check(!header(personal,work).expanded&&!header(personal,quiet).expanded,"opening one app/category/profile leaves the others folded");conservation(folded,original);conservation(personal,original);
        NotificationStackPolicy.Plan<String> one=NotificationStackPolicy.plan(Collections.singletonList(item("one-quiet","0:a",true,10)),false,true,open(NotificationStackPolicy.SILENT));
        visible(one,"one-quiet");groups(one);ordinaryRows(one);check(header(one,NotificationStackPolicy.SILENT).expanded,"silent singleton retains only a static category title");
        for(boolean big:new boolean[]{false,true})for(boolean small:new boolean[]{false,true}){
            NotificationStackPolicy.Plan<String> empty=NotificationStackPolicy.plan(Collections.emptyList(),big,small,open(NotificationStackPolicy.MERGED,APP_A,NotificationStackPolicy.ALERTING,NotificationStackPolicy.SILENT));
            check(empty.nodes.isEmpty()&&empty.hiddenKeys.isEmpty()&&empty.groups.isEmpty(),"empty mode has no phantom labels/groups: "+big+"/"+small);
        }
    }
    static void postsAndRemoval(){
        List<NotificationStackPolicy.Item<String>> changed=new ArrayList<>(MIXED);changed.remove(1);
        visible(NotificationStackPolicy.plan(changed,true,false,open()),"a-new");changed.add(item("new-alert","0:app.d",false,1000));
        visible(NotificationStackPolicy.plan(changed,true,false,open()),"new-alert");
        NotificationStackPolicy.Plan<String> appOpen=NotificationStackPolicy.plan(changed,false,true,open(APP_A));
        visible(appOpen,"a-old","a-new","new-alert","s-old","s-latest");groups(appOpen,APP_A);
        check(header(appOpen,APP_A).expanded,"unrelated post/clear preserves opened app stack");conservation(appOpen,changed);
        changed.removeIf(item->"a-old".equals(item.key));
        NotificationStackPolicy.Plan<String> single=NotificationStackPolicy.plan(changed,false,true,open(APP_A));
        visible(single,"a-new","new-alert","s-old","s-latest");groups(single);ordinaryRows(single);conservation(single,changed);
        changed.removeIf(item->"a-new".equals(item.key));visible(NotificationStackPolicy.plan(changed,false,true,open(APP_A)),"new-alert","s-old","s-latest");
    }
    public static void main(String[] args){
        for(String suite:args.length==0?new String[]{"native","small","big","both","profiles","events"}:args)switch(suite){
            case "native":nativeMode();break;case "small":smallMode();break;case "big":bigMode();break;
            case "both":combinedMode();break;case "profiles":profilesAndSingletons();break;case "events":postsAndRemoval();break;
            default:throw new IllegalArgumentException("Unknown test case: "+suite);
        }
        System.out.println("Notification grouped stack policy "+checks+" checks passed: four switch combinations, native order, direct app expansion, category/profile isolation and clear/post");
    }
}
