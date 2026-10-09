package ls.augment.com;

import android.content.Context;

/** Extra Dim uses the platform color transform, independently of panel brightness. */
final class ExtraDimControl {
    static final String ACTIVE = "reduce_bright_colors_activated";
    static final String LEVEL = "reduce_bright_colors_level";
    private static volatile boolean active, ready;
    private static volatile int strength=50;
    private ExtraDimControl() { }
    /** Called through the authenticated provider by a background SystemUI worker. */
    static android.os.Bundle call(Context context,String method,android.os.Bundle extras) {
        boolean ok=false;
        if("extra_dim_read".equals(method) && extras==null) ok=read(context);
        else if("extra_dim_select".equals(method) && extras!=null && extras.size()==2
                && extras.get("active") instanceof Boolean && extras.get("strength") instanceof Integer) {
            int level=extras.getInt("strength",-1);
            if(level>=0 && level<=100)ok=set(context,extras.getBoolean("active"),level);
        }
        android.os.Bundle result=new android.os.Bundle();result.putBoolean("ok",ok);
        result.putBoolean("active",active);result.putInt("strength",strength);return result;
    }
    static boolean active(Context context) { return active; }
    static boolean ready() { return ready; }
    static int strength(Context context) { return strength; }
    static synchronized boolean read(Context context) {
        int user=android.os.Process.myUid()/100000;
        RootShell.Result r=RootShell.run("settings --user "+user+" get secure "+ACTIVE
                +"; settings --user "+user+" get secure "+LEVEL,null,4,512);
        String[] values=r.output.trim().split("\\s+");
        if(!r.isSuccess()||values.length!=2){ready=false;return false;}
        try {
            if(!values[0].equals("null")&&!values[0].equals("0")&&!values[0].equals("1")){ready=false;return false;}
            int level=values[1].equals("null")?50:Integer.parseInt(values[1]);
            if(level<0||level>100){ready=false;return false;}
            active=values[0].equals("1");strength=level;ready=true;return true;
        }catch(NumberFormatException e){ready=false;return false;}
    }
    static synchronized boolean set(Context context, boolean active, int strength) {
        if (strength < 0 || strength > 100) return false;
        ModuleSystemSettings.WriteResult result = ModuleSystemSettings.setExtraDim(context, active, strength);
        return result.success && read(context) && active(context) == active && strength(context) == strength;
    }
}
