package ls.augment.com;

import java.util.Arrays;
import java.util.List;
import static ls.augment.com.AtomicWorkbenchWindowLayoutPlan.*;
import static ls.augment.com.AtomicWorkbenchWindowPresentationPolicy.*;

/** Calls actual production policies and actual WorkspaceModel; no replacement state machine. */
public final class AtomicWorkbenchWindowPresentationIntegrationCases {
    static int cases, checks;
    interface Case { void run() throws Exception; }
    static void yes(boolean value, String why) { checks++; if (!value) throw new AssertionError(why); }
    static void test(String name, Case body) throws Exception { body.run(); cases++; System.out.println("PASS window presentation integration: " + name); }
    static Roles roles() { return new Roles(0, new int[]{1,2,3}); }
    static EntryKey key(long trigger) { return new EntryKey(0,7,20575,9,"a".repeat(64),trigger); }
    static Lease lease(int id) { return new Lease(id,88+id,"vd-"+id,"unique-"+id,"session-"+id); }
    static Roles roles(AtomicWorkbenchWorkspaceModel model) { return new Roles(model.mainWindowId(),new int[]{model.sideWindowId(0),model.sideWindowId(1),model.sideWindowId(2)}); }
    static void expectInvalid(Runnable body) { try { body.run(); throw new AssertionError("invalid input accepted"); } catch (IllegalArgumentException expected) { checks++; } }
    static void entryCases() throws Exception {
        test("authenticated physical entry side is frozen and consumed exactly once",()->{
            var p=new AtomicWorkbenchWindowPresentationPolicy();var a=key(1000);
            yes(p.offerEntry(a,RailSide.LEFT,1000,3000)==Offer.NEW,"fresh entry not offered");
            yes(p.railSide()==RailSide.RIGHT,"offer changed side before authenticated consumption");
            yes(p.consumeEntry(a,1001,true)==Consumption.CHANGED&&p.railSide()==RailSide.LEFT,"fresh left entry not applied");
            yes(p.consumeEntry(a,1002,true)==Consumption.NONE,"duplicate consume replayed entry");
            yes(p.offerEntry(a,RailSide.RIGHT,1002,3000)==Offer.DUPLICATE,"duplicate entry reissued");
            yes(p.railSide()==RailSide.LEFT,"duplicate key changed frozen side");
        });
        for(String why:List.of("ttl","future","authentication"))test("queued entry refuses "+why,()->{
            var p=new AtomicWorkbenchWindowPresentationPolicy();var a=key(1000);p.offerEntry(a,RailSide.LEFT,1000,3000);
            long now=why.equals("ttl")?4001:why.equals("future")?999:1001;
            yes(p.consumeEntry(a,now,!why.equals("authentication"))==Consumption.EXPIRED,"stale entry side consumed");
            yes(p.railSide()==RailSide.RIGHT&&p.consumeEntry(a,1001,true)==Consumption.NONE,"invalid entry remained replayable");
        });
        test("A queued then B cannot be replaced by duplicate or delayed A",()->{
            var p=new AtomicWorkbenchWindowPresentationPolicy();var a=key(1000);var b=key(1100);
            p.offerEntry(a,RailSide.LEFT,1000,3000);long before=p.entryGeneration();
            yes(p.offerEntry(b,RailSide.RIGHT,1100,3000)==Offer.NEW&&p.entryGeneration()>before,"new entry did not fence old");
            yes(p.offerEntry(a,RailSide.LEFT,1101,3000)!=Offer.NEW,"old queued entry revived");
            yes(p.consumeEntry(a,1101,true)==Consumption.NONE&&p.consumeEntry(b,1101,true)==Consumption.UNCHANGED,"wrong pending entry consumed");
            yes(p.offerEntry(key(1050),RailSide.LEFT,1102,3000)==Offer.REJECTED,"entry highwater accepted delayed unseen A");
        });
        test("live entry deduplication fills without eviction and later expires honestly",()->{
            var p=new AtomicWorkbenchWindowPresentationPolicy();for(int i=0;i<128;i++)yes(p.offerEntry(key(1000+i),RailSide.LEFT,1200,3000)==Offer.NEW,"entry ledger filled early");
            yes(p.offerEntry(key(1200),RailSide.LEFT,1200,3000)==Offer.REJECTED,"full dedup ledger silently evicted old identity");
            yes(p.offerEntry(key(1000),RailSide.RIGHT,1200,3000)==Offer.DUPLICATE,"old live identity evicted");
            yes(p.offerEntry(key(5000),RailSide.LEFT,5000,3000)==Offer.NEW,"expired dedup identities never retired");
        });
        test("invalid entry shape never changes presentation",()->{
            var p=new AtomicWorkbenchWindowPresentationPolicy();yes(p.offerEntry(null,RailSide.LEFT,1000,3000)==Offer.REJECTED,"null key accepted");
            yes(p.offerEntry(key(1000),null,1000,3000)==Offer.REJECTED,"unknown side accepted");
            yes(p.offerEntry(key(1001),RailSide.LEFT,1000,3000)==Offer.REJECTED,"future trigger offered");
            expectInvalid(()->new EntryKey(0,0,1,1,"bad",0));yes(p.railSide()==RailSide.RIGHT,"invalid entry mutated side");
        });
    }
    static void receiptCases() throws Exception {
        test("actual WorkspaceModel launch reservation and proposal do not flip before focus",()->{
            var m=new AtomicWorkbenchWorkspaceModel();m.commitLaunch(m.planLaunch("app.a/.A"));
            var p=new AtomicWorkbenchWindowPresentationPolicy();var before=roles(m);var plan=m.planLaunch("app.b/.B");
            var receipt=p.begin(plan.windowId,8,1,before,null);yes(m.commitLaunch(plan),"actual launch reservation failed");
            var proposed=p.proposal(receipt,roles(m));yes(proposed!=null&&m.mainWindowId()==1,"actual precommit roles missing");
            yes(p.railSide()==RailSide.RIGHT,"launch proposal flipped before real focus");
            proposed=p.bindLease(proposed,lease(1));var focus=p.continueFocus(proposed,8,2,roles(m),lease(1));
            yes(p.confirm(focus,8,2,roles(m),lease(1))&&p.railSide()==RailSide.LEFT,"successful focus did not flip one side promotion");
            yes(!p.confirm(focus,8,2,roles(m),lease(1))&&p.railSide()==RailSide.LEFT,"duplicate ACK flipped twice");
        });
        test("same-main focus consumes no direction flip",()->{
            var p=new AtomicWorkbenchWindowPresentationPolicy();var r=p.begin(0,8,1,roles(),lease(0));
            yes(!p.confirm(r,8,1,roles(),lease(0))&&p.railSide()==RailSide.RIGHT,"same main focus flipped direction");
        });
        for(String old:List.of("confirm","cancel","proposal","eligible","continue"))test("old continuation cannot disturb current "+old,()->{
            var p=new AtomicWorkbenchWindowPresentationPolicy();var initial=roles();var after=initial.promoted(1);
            var r0=p.begin(1,8,1,initial,lease(1));var r1=p.proposal(r0,after);var current=p.continueFocus(r1,8,2,after,lease(1));
            switch(old){case "confirm":yes(!p.confirm(r0,8,1,after,lease(1)),"old receipt accepted");break;
                case "cancel":p.cancel(r0);break;case "proposal":yes(p.proposal(r0,initial)==null,"old proposal accepted");break;
                case "eligible":yes(!p.eligible(r0,8,initial),"old eligibility accepted");break;
                default:yes(p.continueFocus(r0,8,3,initial,lease(1))==null,"old continuation accepted");}
            yes(p.confirm(current,8,2,after,lease(1)),"stale continuation closed current focus receipt");
        });
        for(String stale:List.of("session","epoch","new_entry","role_ABA","invalidate","reset","cancel","other_begin"))test("pending focus refuses "+stale,()->{
            var p=new AtomicWorkbenchWindowPresentationPolicy();var base=roles();var r=p.begin(1,8,1,base,lease(1));long session=8;int epoch=1;
            switch(stale){case "session":session=9;break;case "epoch":epoch=2;break;
                case "new_entry":p.offerEntry(key(1000),RailSide.RIGHT,1000,3000);break;
                case "role_ABA":p.observeRoles(base.promoted(2));p.observeRoles(base);break;
                case "invalidate":p.invalidate();break;case "reset":p.reset();break;case "cancel":p.cancel(r);break;
                default:p.begin(2,8,2,base,lease(2));}
            yes(!p.confirm(r,session,epoch,base.promoted(1),lease(1))&&p.railSide()==RailSide.RIGHT,"stale focus receipt flipped: "+stale);
        });
        for(String field:List.of("window","display","name","unique","session"))test("lease identity mismatch refuses "+field,()->{
            var p=new AtomicWorkbenchWindowPresentationPolicy();var l=lease(1);var r=p.begin(1,8,1,roles(),l);
            var changed=new Lease(field.equals("window")?2:1,field.equals("display")?777:l.displayId,
                field.equals("name")?"new-name":l.name,field.equals("unique")?"new-unique":l.unique,field.equals("session")?"new-session":l.windowSession);
            yes(!p.confirm(r,8,1,roles().promoted(1),changed)&&p.railSide()==RailSide.RIGHT,"stale display lease flipped");
        });
        test("unknown interrupted or rejected proposal never becomes an implicit ACK",()->{
            var p=new AtomicWorkbenchWindowPresentationPolicy();var before=roles();var r=p.begin(1,8,1,before,lease(1));var after=before.promoted(1);
            var staged=p.proposal(r,after);yes(p.railSide()==RailSide.RIGHT&&p.eligible(staged,8,after),"unknown proposal consumed as focus");
            p.invalidate();yes(!p.confirm(staged,8,1,after,lease(1)),"interrupted proposal later flipped");
        });
        test("roles are defensive identities and preserve side order across promotion",()->{
            int[] a={1,2,3};var rs=new Roles(0,a);a[0]=3;int[] returned=rs.sideIds();returned[1]=1;
            yes(Arrays.equals(rs.sideIds(),new int[]{1,2,3}),"roles exposed mutable side identities");
            var next=rs.promoted(2);yes(next.mainId==2&&Arrays.equals(next.sideIds(),new int[]{1,0,3}),"promotion reordered unrelated sides");
            expectInvalid(()->new Roles(0,new int[]{0,1,2}));
        });
    }
    static void layoutCases() throws Exception {
        for(RailSide side:RailSide.values())for(boolean expanded:new boolean[]{false,true})for(int count=0;count<=3;count++){
            final int n=count;test("actual layout "+side+" expanded="+expanded+" visible="+n,()->{
                int[] visible=new int[n];for(int i=0;i<n;i++)visible[i]=new int[]{1,3,0}[i];
                var topology=Topology.of(new int[]{0,1,2,3},new int[]{2},2,new int[]{1,3,0},visible);
                var viewport=Rect.ofSize(7,11,1001,1651);var plan=AtomicWorkbenchWindowLayoutPlan.singleMainFour(viewport,4,topology,side,expanded);
                int shown=expanded?0:n;int railWidth=shown==0?0:(1001-4)/4;int expectedLeft=7+(shown>0&&side==RailSide.LEFT?railWidth+4:0);
                yes(plan.mainBounds().left==expectedLeft&&plan.mainBounds().top==11,"main physical origin mismatch");
                yes(plan.desktopBounds().equals(plan.mainBounds())&&plan.coverBounds().equals(plan.mainBounds())&&plan.statusBounds().equals(plan.mainBounds()),"main overlay origin diverged");
                yes(plan.frameFor(2).role==Role.MAIN&&plan.frameFor(2).bounds.equals(plan.mainBounds()),"window identity was treated as visual index");
                int shownCount=0;for(var frame:plan.framesByWindowId().values()){
                    if(frame.visible){yes(viewport.contains(frame.bounds),"visible frame escaped viewport");shownCount++;}
                    else yes(frame.bounds.left==-2&&frame.bounds.top==-2&&frame.bounds.width()==1&&frame.bounds.height()==1,"hidden producer was not retained outside viewport");
                }
                yes(shownCount==shown+1,"visible side count wrong");
                for(int i=0;i<shown;i++){
                    var rect=plan.frameFor(visible[i]).bounds;
                    yes(rect.left==(side==RailSide.LEFT?7:plan.mainBounds().right+4)&&!rect.overlaps(plan.mainBounds()),"rail physical side or overlap wrong");
                    if(i>0)yes(plan.frameFor(visible[i-1]).bounds.bottom+4==rect.top,"side order/gap changed");
                    if(i==shown-1)yes(rect.bottom==viewport.bottom,"last rail row lost remainder");
                }
            });
        }
        test("actual model occupied sides survive zero empty-placeholder preference",()->{
            var m=new AtomicWorkbenchWorkspaceModel();m.commitLaunch(m.planLaunch("one/.A"));m.commitLaunch(m.planLaunch("two/.A"));
            int main=m.mainWindowId();int[] visible=m.visibleSideWindowIds(0);yes(visible.length==1,"occupied side hidden by empty limit");
            var p=AtomicWorkbenchWindowLayoutPlan.singleMainFour(Rect.ofSize(0,0,101,201),4,Topology.of(new int[]{0,1,2,3},new int[]{main},main,roles(m).sideIds(),visible),RailSide.LEFT,false);
            yes(p.frameFor(visible[0]).visible&&m.appCount()==2,"layout changed task/app bindings");
            m.setMainExpanded(true);yes(m.appCount()==2&&m.hasWindow(visible[0]),"fullscreen released retained window");
        });
        test("impossible viewports fail honestly and do not invent overlapping frames",()->{
            var t=Topology.of(new int[]{0,1,2,3},new int[]{0},0,new int[]{1,2,3},new int[]{1,2,3});
            expectInvalid(()->AtomicWorkbenchWindowLayoutPlan.singleMainFour(Rect.ofSize(0,0,4,20),4,t,RailSide.LEFT,false));
            expectInvalid(()->AtomicWorkbenchWindowLayoutPlan.singleMainFour(Rect.ofSize(0,0,20,4),4,t,RailSide.LEFT,false));
        });
    }
    public static void main(String[] args) throws Exception {
        entryCases();receiptCases();layoutCases();
        System.out.println("WINDOW PRESENTATION POLICY RESULT "+cases+" cases; "+checks+" assertions");
    }
}
