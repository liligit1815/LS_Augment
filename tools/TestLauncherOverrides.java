import ls.augment.com.LauncherOverrides;
import ls.augment.com.ConfigSchema;
public class TestLauncherOverrides {
    static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    public static void main(String[] args){
        LauncherOverrides a=LauncherOverrides.empty().with(new LauncherOverrides.Entry(0,"com.example.app","主空间 🐱","a".repeat(64)))
                .with(new LauncherOverrides.Entry(999,"com.example.app","分身",""));
        LauncherOverrides b=LauncherOverrides.parse(a.serialize());
        check(a.serialize().equals(ConfigSchema.normalize(ConfigSchema.LAUNCHER_OVERRIDES,a.serialize())),"profile survives configuration normalization");
        check(b!=null&&b.get(999,"com.example.app").name.equals("分身"),"clone isolated");
        check(b.get(0,"com.example.app").icon.equals("a".repeat(64)),"image preserved");
        b=b.with(new LauncherOverrides.Entry(0,"com.example.app","",""));
        check(b.get(0,"com.example.app")==null&&b.get(999,"com.example.app")!=null,"reset only selected user");
        check(LauncherOverrides.parse(a.serialize()+";"+a.serialize().split(";")[1])==null,"duplicate rejected");
        check(LauncherOverrides.parse("LI1\n0:com.example.app||../../file")==null,"icon path rejected");
        System.out.println("Launcher profile, roundtrip and reset checks passed");
    }
}
