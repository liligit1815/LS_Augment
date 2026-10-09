package ls.augment.com;

import java.util.Locale;

/** Intent classification independent of framework reflection. */
public final class FreeformLaunchPolicy {
    private FreeformLaunchPolicy(){}
    public static boolean loginTarget(String packageName,String activityName){
        if("com.tencent.mm".equals(packageName)||"com.tencent.mobileqq".equals(packageName)
                ||"com.tencent.tim".equals(packageName))return true;
        String name=activityName==null?"":activityName.toLowerCase(Locale.ROOT);
        return name.contains("oauth")||name.contains("authorize")||name.contains("authactivity")
                ||name.contains("loginactivity")||name.endsWith(".ssoactivity");
    }
    public static boolean shouldOpen(boolean gameLogin,boolean external,String source,String target,
            boolean visibleSource,boolean standardSource,boolean standardTarget,boolean thirdPartyTarget,
            boolean sourceGame,boolean targetGame,boolean loginTarget,boolean excluded,boolean returning){
        if(!visibleSource||!standardSource||!standardTarget||!thirdPartyTarget||excluded||returning
                ||source==null||target==null||source.equals(target))return false;
        // Login providers returning to the game must not pull the game into a window.
        if(targetGame&&loginTarget(source,""))return false;
        return external||(gameLogin&&sourceGame&&loginTarget);
    }
}
