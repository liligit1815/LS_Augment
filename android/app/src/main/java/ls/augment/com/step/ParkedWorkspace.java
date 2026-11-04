package ls.augment.com.step;

/** A volatile, exact-identity bookmark. Never resolves a task by application or by ID alone. */
public final class ParkedWorkspace {
    public static final int UPPER=SideSlots.MAX_COUNT;
    int principal=-1,page;
    boolean left,topFace,manualMain;
    TaskIdentity main;
    private final TaskIdentity[] items=new TaskIdentity[UPPER+1];
    ParkedWorkspace copy(){
        ParkedWorkspace scene=new ParkedWorkspace();scene.principal=principal;scene.page=page;scene.left=left;
        scene.topFace=topFace;scene.manualMain=manualMain;scene.main=main;
        System.arraycopy(items,0,scene.items,0,items.length);return scene;
    }
    public void put(int slot,TaskIdentity task){items[slot]=task;}
    void retainRunning(java.util.function.Predicate<TaskIdentity> running,int sideCount,boolean upperEnabled){
        boolean partial=false;
        if(main!=null && !running.test(main)){main=null;manualMain=false;partial=true;}
        for(int i=0;i<items.length;i++){
            if(items[i]!=null && (!running.test(items[i]) || i==UPPER && !upperEnabled)){
                items[i]=null;partial=true;
            }else if(i>=sideCount && i<UPPER && items[i]!=null)partial=true;
        }
        if(!partial)return;
        int next=0;
        for(int i=0;i<UPPER;i++){
            TaskIdentity task=items[i];items[i]=null;
            if(task!=null && next<sideCount)items[next++]=task;
        }
    }
    public boolean matches(int slot,int id,int user,Object token){
        if(slot<0 || slot>=items.length || items[slot]==null)return false;
        return items[slot].matches(id,user,0,token);
    }
    public int[] idsFor(java.util.function.IntPredicate allowed){
        int[] result=new int[items.length];java.util.Arrays.fill(result,-1);
        for(int n=0;n<items.length;n++){TaskIdentity i=items[n];if(i!=null && allowed.test(i.user))result[n]=i.id;}
        return result;
    }
    public void consumed(int slot){items[slot]=null;}
}
