package ls.augment.com;

public final class TestStatusBarHeight {
    static void check(boolean value,String reason){if(!value)throw new AssertionError(reason);}
    public static void main(String[] args){
        check(ConfigSchema.statusBarHeightPx(107,0,3.25f)==107,"native unchanged");
        check(ConfigSchema.statusBarHeightPx(107,-4,3.25f)==94,"relative reduction");
        check(ConfigSchema.statusBarHeightPx(70,-4,3.25f)==57,"rotation uses its own OEM height");
        check(ConfigSchema.statusBarHeightPx(107,20,3.25f)==107,"legacy positive minimum");
        check(ConfigSchema.statusBarHeightPx(107,96,3.25f)==312,"full configured maximum reaches runtime");
        check(ConfigSchema.statusBarHeightPx(20,-32,3.25f)==3,"safe minimum at small native heights");
        check(ConfigSchema.statusBarHeightPx(20,0,3.25f)==20,"reset after reduction");
        check(ConfigSchema.statusBarHeightPx(107,-100,3.25f)==3,"out of range defensive clamp");
        check(ConfigSchema.statusBarHeightPx(107,1000,3.25f)==312,"upper defensive clamp");
        for(int height:new int[]{-32,-4,0,80,81,96}){
            java.util.Map<String,String> values=new java.util.LinkedHashMap<>(ConfigSchema.defaults());
            values.put(ConfigSchema.STATUSBAR_HEIGHT_DP,""+height);
            ConfigSnapshot snapshot=ConfigSnapshot.create(1,1,values);
            check(snapshot!=null&&snapshot.get(ConfigSchema.STATUSBAR_HEIGHT_DP).equals(""+height),"schema/runtime agreement "+height);
        }
        System.out.println("Status bar height: 15 native, negative, rotation, restore and schema checks passed");
    }
}
