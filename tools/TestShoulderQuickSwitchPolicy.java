package ls.augment.com;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class TestShoulderQuickSwitchPolicy {
    private static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }
    public static void main(String[] args) {
        ShoulderQuickSwitchPolicy.CaseRef a = ref(0, "game.one", 0, 4);
        ShoulderQuickSwitchPolicy.CaseRef b = ref(0, "game.one", 1, 17);
        ShoulderQuickSwitchPolicy.CaseRef c = ref(0, "game.one", 0, 9);
        ShoulderQuickSwitchPolicy policy = ShoulderQuickSwitchPolicy.empty().with(b, true).with(a, true);
        check(policy.visible(Arrays.asList(c, a, b)).equals(Arrays.asList(a, b)), "OEM order, not serialized key order");
        check(ShoulderQuickSwitchPolicy.directTarget(Arrays.asList(a,b),a).equals(b), "A to B");
        check(ShoulderQuickSwitchPolicy.directTarget(Arrays.asList(a,b),b).equals(a), "B to A");
        check(ShoulderQuickSwitchPolicy.directTarget(Arrays.asList(a,b),c).equals(a), "outside pair enters first");
        check(ShoulderQuickSwitchPolicy.directTarget(Collections.singletonList(a),a).equals(a), "one current no-op");
        check(ShoulderQuickSwitchPolicy.directTarget(Collections.emptyList(),a)==null, "zero native");
        check(ShoulderQuickSwitchPolicy.directTarget(Arrays.asList(a,b,c),a)==null, "three menu");
        check(!policy.contains(ref(10,"game.one",0,4)), "separate Android user");
        check(!policy.contains(ref(0,"game.two",0,4)), "separate game");
        check(!policy.contains(ref(0,"game.one",1,4)), "separate OEM table");
        check(policy.visible(Arrays.asList(c,b)).equals(Collections.singletonList(b)), "deleted IDs cannot redirect to adjacent index");
        check(ShoulderQuickSwitchPolicy.parse(policy.serialize()).serialize().equals(policy.serialize()), "round trip");
        check(ShoulderQuickSwitchPolicy.parse("TQ1;0:game.one:0:4;0:game.one:0:4")==null, "duplicate rejected");
        check(ShoulderQuickSwitchPolicy.parse("TQ1;0:game.one:2:4")==null, "table rejected");
        check(ShoulderQuickSwitchPolicy.parse("TQ1;0:game.one:0:-1")==null, "sentinel ID rejected");
        check(ShoulderQuickSwitchPolicy.parse("TQ1;00:game.one:0:4")==null, "noncanonical rejected");
        check(ShoulderQuickSwitchPolicy.canWrite(10123, "cn.nubia.gamelauncher", new String[]{"cn.nubia.gamelauncher"}), "vendor writer");
        check(!ShoulderQuickSwitchPolicy.canWrite(10123, "cn.nubia.gamelauncher", new String[]{"other.app"}), "spoofed package");
        check(!ShoulderQuickSwitchPolicy.canWrite(1000, "com.android.settings", new String[]{"cn.nubia.gamelauncher","com.android.settings"}), "other shared-UID package");
        check(!ShoulderQuickSwitchPolicy.canWrite(0, null, null), "root not a general writer");
        check(ShoulderQuickSwitchPolicy.canWriteForUser(101000, 110123, "cn.nubia.gamelauncher", new String[]{"cn.nubia.gamelauncher"}), "same secondary user");
        check(!ShoulderQuickSwitchPolicy.canWriteForUser(101000, 10123, "cn.nubia.gamelauncher", new String[]{"cn.nubia.gamelauncher"}), "cross-user writer rejected");
        check(policy.with(a,false).contains(b), "one atomic membership edit preserves other candidates");
        System.out.println("Shoulder candidate selection, isolation, stale IDs and caller policy passed");
    }
    private static ShoulderQuickSwitchPolicy.CaseRef ref(int user,String pkg,int table,long id) {
        return new ShoulderQuickSwitchPolicy.CaseRef(user,pkg,table,id);
    }
}
