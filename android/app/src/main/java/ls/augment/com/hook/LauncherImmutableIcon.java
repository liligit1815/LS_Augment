package ls.augment.com.hook;

import android.graphics.Bitmap;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Kotlin BitmapInfo: construct a copy, preserving profile badges without writing final fields. */
final class LauncherImmutableIcon {
    private final Constructor<?> constructor;
    private final Method fromBitmap;
    private final Field color,flags,shape,themed,badge,delegate,provider;

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    LauncherImmutableIcon(Class<?> type)throws ReflectiveOperationException{
        if(!type.getName().equals("com.android.launcher3.icons.BitmapInfo"))throw new NoSuchMethodException("Unknown immutable icon model");
        ClassLoader loader=type.getClassLoader();
        Class<?> shapeType=Class.forName("com.android.launcher3.icons.IconShape",false,loader);
        Class<?> themeType=Class.forName("com.android.launcher3.icons.ThemedBitmap",false,loader);
        Class<?> delegateType=Class.forName("com.android.launcher3.icons.FastBitmapDrawableDelegate$DelegateFactory",false,loader);
        Class<?> providerType=Class.forName("com.android.launcher3.BadgeProvider",false,loader);
        constructor=type.getConstructor(Bitmap.class,int.class,int.class,shapeType,themeType,type,delegateType,providerType);
        fromBitmap=type.getDeclaredMethod("fromBitmap",Bitmap.class);
        if(!Modifier.isStatic(fromBitmap.getModifiers())||fromBitmap.getReturnType()!=type)throw new NoSuchMethodException("fromBitmap signature");
        fromBitmap.setAccessible(true);
        color=field(type,"color",int.class);flags=field(type,"flags",int.class);badge=field(type,"badgeInfo",type);
        shape=field(type,"defaultIconShape",shapeType);themed=field(type,"themedBitmap",themeType);
        delegate=field(type,"delegateFactory",delegateType);provider=field(type,"badgeProvider",providerType);
    }
    Object create(Bitmap image,Object original)throws ReflectiveOperationException{
        Object nativeImage=fromBitmap.invoke(null,image),metadata=original==null?nativeImage:original;
        return constructor.newInstance(image,color.get(nativeImage),flags.get(metadata),shape.get(nativeImage),
                themed.get(nativeImage),badge.get(metadata),delegate.get(nativeImage),provider.get(metadata));
    }
    private static Field field(Class<?> type,String name,Class<?> expected)throws ReflectiveOperationException{
        Field f=type.getDeclaredField(name);if(f.getType()!=expected||Modifier.isStatic(f.getModifiers()))throw new NoSuchFieldException(name+" signature");
        f.setAccessible(true);return f;
    }
}
