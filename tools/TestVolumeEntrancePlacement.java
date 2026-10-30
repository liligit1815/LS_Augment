package ls.augment.com.hook;

/** Measured OEM windows, safe insets and portrait/landscape bounds. */
public final class TestVolumeEntrancePlacement {
    static int checks;
    static void check(boolean value,String why){checks++;if(!value)throw new AssertionError(why);}
    public static void main(String[] args){
        check(VolumeEntrancePlacement.panelTop(300,1000,440,88,24)==300,"native panel position retained when there is room above");
        check(VolumeEntrancePlacement.panelTop(40,1000,440,88,24)==112,"reserve top space for entrance");
        check(VolumeEntrancePlacement.panelTop(900,1000,440,88,24)==560,"bottom edge stays visible");
        check(VolumeEntrancePlacement.panelTop(40,500,440,88,24)==-1,"short landscape falls back to native");
        check(VolumeEntrancePlacement.panelTop(0,552,440,88,24)==112,"exact fit admitted");
        int top=VolumeEntrancePlacement.entranceTop(304,78,88,39);
        check(top==182,"window padding excluded from surface anchor");
        check(top+5+78==304-39,"visible button bottom sits above slider with requested gap");
        for(int density:new int[]{1,2,3,4}){
            int gap=VolumeEntrancePlacement.GAP_DP*density;
            int panel=VolumeEntrancePlacement.panelTop(0,800*density,400*density,56*density,gap);
            int button=VolumeEntrancePlacement.entranceTop(panel,48*density,56*density,gap);
            check(button>=0,"button stays below safe top at each density");
            check(button+52*density+gap==panel,"visual gap is density independent");
            check(panel+400*density<=800*density,"panel remains within safe bottom");
        }
        System.out.println("PASS volume entrance above: "+checks+" placement checks");
    }
}
