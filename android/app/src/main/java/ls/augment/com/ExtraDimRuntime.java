package ls.augment.com;

/** Evidence from the live color service, never inferred from its Settings request. */
public final class ExtraDimRuntime {
    public static final String PREFIX = "LSA_EXTRA_DIM_V1 ";
    private ExtraDimRuntime() { }
    /** Same constrained mapping and truncation as ColorDisplayService, not a raw matrix level. */
    public static int nativeStrength(int requested,int minimum,int maximum){
        if(minimum<0||maximum<minimum||maximum>100)throw new IllegalArgumentException("Invalid native dim range");
        float fraction=Math.max(0,Math.min(100,requested))/100f;
        return (int)(minimum+(maximum-minimum)*fraction);
    }

    public static boolean sameTransform(boolean active, int strength, float[] expected, float[] actual) {
        if (expected == null || expected.length != 16 || actual != null && actual.length != 16) return false;
        for (int i = 0; i < 16; i++) {
            float value = actual == null ? (i % 5 == 0 ? 1 : 0) : actual[i];
            if (!Float.isFinite(expected[i]) || !Float.isFinite(value) || Math.abs(expected[i] - value) > .0001f) return false;
        }
        return !active || strength == 0 || expected[0] > 0 && expected[0] < .9999f
                && expected[5] > 0 && expected[5] < .9999f && expected[10] > 0 && expected[10] < .9999f;
    }

    public static final class Snapshot {
        public final int user, strength;
        public final boolean available, active, transform;
        Snapshot(int user, boolean available, boolean active, int strength, boolean transform) {
            this.user=user;this.available=available;this.active=active;this.strength=strength;this.transform=transform;
        }
        public boolean matches(int requestedUser, boolean requestedActive, int requestedStrength) {
            return available && transform && user == requestedUser && active == requestedActive && strength == requestedStrength;
        }
    }

    public static Snapshot parse(String dump) {
        Snapshot found=null;
        if(dump==null)return null;
        for(String line:dump.split("\\r?\\n")) {
            if(!line.startsWith(PREFIX))continue;
            if(found!=null)return null;
            String[] fields=line.substring(PREFIX.length()).split(";",-1);
            if(fields.length!=5)return null;
            try {
                if(!fields[0].matches("user=-?[0-9]+") || !fields[1].matches("available=[01]")
                        || !fields[2].matches("active=[01]") || !fields[3].matches("strength=[0-9]+")
                        || !fields[4].matches("transform=[01]"))return null;
                int user=Integer.parseInt(fields[0].substring(5)),strength=Integer.parseInt(fields[3].substring(9));
                if(user < 0 || user > 99999 || strength > 100)return null;
                found=new Snapshot(user,fields[1].endsWith("1"),fields[2].endsWith("1"),strength,fields[4].endsWith("1"));
            }catch(NumberFormatException invalid){return null;}
        }
        return found;
    }
}
