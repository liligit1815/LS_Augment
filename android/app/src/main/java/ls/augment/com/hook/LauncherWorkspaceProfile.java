package ls.augment.com.hook;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Point;
import android.util.DisplayMetrics;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Separate workspace profile contract used by the inspected newer named launcher. */
final class LauncherWorkspaceProfile {
    final Method factory,workspace,cellSize,copyIcon,setText;
    final Field icon,text,gap;

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    LauncherWorkspaceProfile(ClassLoader loader,Class<?> dp,Class<?> idp)throws Exception{
        Class<?> profile=Class.forName("com.android.launcher3.deviceprofile.WorkspaceProfile",false,loader);
        Class<?> owner=Class.forName("com.android.launcher3.deviceprofile.WorkspaceProfileNonResponsiveFactory",false,loader);
        workspace=method(dp,"getWorkspaceProfile",profile);
        cellSize=method(profile,"getCellSize",Point.class);
        copyIcon=method(profile,"changeIconSize",profile,int.class);
        setText=method(profile,"setIconTextSizePx",void.class,int.class);
        icon=field(profile,"iconSizePx");text=field(profile,"iconTextSizePx");gap=field(profile,"iconDrawablePaddingPx");
        factory=method(owner,"createWorkspaceProfileNonResponsive",profile,Context.class,Resources.class,
                Class.forName("com.android.launcher3.deviceprofile.DeviceProperties",false,loader),float.class,idp,
                boolean.class,boolean.class,int.class,DisplayMetrics.class,int.class,int.class,boolean.class,boolean.class,
                Class.forName("com.android.launcher3.deviceprofile.HotseatProfileInitialValues",false,loader));
    }
    Object fit(Object original,float density)throws Exception{
        Point cell=(Point)cellSize.invoke(original);
        LauncherGridIconFit.Fit fit=LauncherGridIconFit.fit(icon.getInt(original),text.getInt(original),gap.getInt(original),cell.x,cell.y,density);
        if(fit.icon==icon.getInt(original)&&fit.text==text.getInt(original))return original;
        // Copy before the DeviceProfile consumes it. Drawer/hotseat factories keep
        // their own native profiles, and no shared original object is rewritten.
        Object copy=copyIcon.invoke(original,fit.icon);setText.invoke(copy,fit.text);return copy;
    }
    private static Field field(Class<?> owner,String name)throws Exception{
        Field f=owner.getDeclaredField(name);if(f.getType()!=int.class||Modifier.isStatic(f.getModifiers()))throw new NoSuchFieldException(name+":int");
        f.setAccessible(true);return f;
    }
    private static Method method(Class<?> owner,String name,Class<?> result,Class<?>...args)throws Exception{
        Method m=owner.getDeclaredMethod(name,args);
        if(m.getReturnType()!=result||Modifier.isStatic(m.getModifiers())||Modifier.isAbstract(m.getModifiers()))throw new NoSuchMethodException(name+" signature");
        m.setAccessible(true);return m;
    }
}
