package ls.augment.com;

/** Durable, compare-and-restore ownership of the two OEM settings; never touches the driver switch. */
public final class BypassSettingsLease {
    public static final String THRESHOLD="charge_separation_threshold",AUTO="charge_separation_auto_switch";
    public interface Store {
        String get(String key);
        boolean put(String key,String value);
        String saved(String key);
        boolean save(String previousLevel,String previousAuto,String desiredLevel,String ownedLevel);
        boolean clear();
    }
    private BypassSettingsLease(){}
    public static String apply(Store store,boolean enabled,int level){
        if(enabled){
            if(level<BypassChargingOptions.MIN||level>BypassChargingOptions.MAX)return "invalid_level";
            String wanted=Integer.toString(level);
            String previousLevel=store.saved("level"),previousAuto=store.saved("auto");
            String oldWanted=store.saved("desired"),oldOwned=store.saved("owned");
            String current=store.get(THRESHOLD),owned=null;
            if(oldWanted==null){previousLevel=current;previousAuto=store.get(AUTO);}
            else if(java.util.Objects.equals(current,oldWanted)||oldOwned!=null&&oldOwned.equals(current))owned=current;
            // Persist the original values before either write, including process death
            // between the threshold and auto-switch writes.
            if(!store.save(previousLevel,previousAuto,wanted,owned))return "backup_failed";
            if(!write(store,THRESHOLD,wanted)||!write(store,AUTO,"1"))return "write_failed";
            return "active;threshold="+wanted;
        }
        String wanted=store.saved("desired");if(wanted==null)return "native";
        // Disable a previously OFF native automatic policy before restoring its
        // threshold, so that restoration cannot briefly activate bypass charging.
        boolean autoOk=restore(store,AUTO,"1",store.saved("auto"));
        if(!autoOk)return "restore_failed";
        String current=store.get(THRESHOLD);
        boolean levelOk=(!java.util.Objects.equals(current,wanted)
                &&!(store.saved("owned")!=null&&store.saved("owned").equals(current)))
                ||write(store,THRESHOLD,store.saved("level"));
        if(!levelOk||!autoOk)return "restore_failed";
        return store.clear()?"restored":"restore_marker_failed";
    }
    private static boolean restore(Store store,String key,String owned,String previous){
        // A later native edit belongs to the user, not to this lease.
        return !java.util.Objects.equals(store.get(key),owned)||write(store,key,previous);
    }
    private static boolean write(Store store,String key,String value){
        return java.util.Objects.equals(store.get(key),value)
                ||store.put(key,value)&&java.util.Objects.equals(store.get(key),value);
    }
}
