package ls.augment.com.hook;

import java.lang.reflect.Method;

/** Exact signatures must reject same-name decoys and preserve caller boundaries. */
public final class TestAutomaticHookCompatibility {
    static class Legacy {
        boolean handleClick() { return true; }
        static boolean m(Object context) { return false; }
        static boolean l(String pkg) { return true; }
        static boolean mVisible;
    }
    static class Modern {
        void handleClick(String unrelated) { }
        boolean T() { return true; }
        static int mVisible;
        static boolean W;
    }
    static class Wrong {
        static boolean handleClick() { return true; }
        int T() { return 1; }
        boolean W;
    }
    public static void main(String[] args) throws Exception {
        String[] names={"handleClick","T"};
        Method old=HookCompatibility.method(Legacy.class,boolean.class,false,names);
        Method newer=HookCompatibility.method(Modern.class,boolean.class,false,names);
        check(old.getName().equals("handleClick")&&newer.getName().equals("T"),"old/new click");
        try { HookCompatibility.method(Wrong.class,boolean.class,false,names); throw new AssertionError("wrong signature accepted"); }
        catch(NoSuchMethodException expected) { }
        try { HookCompatibility.method(Legacy.class,boolean.class,true,new String[]{"m"},String.class); throw new AssertionError("stealth gate accepted"); }
        catch(NoSuchMethodException expected) { }
        check(HookCompatibility.field(Modern.class,boolean.class,true,"mVisible","W").getName().equals("W"),"field type");
        try { HookCompatibility.field(Wrong.class,boolean.class,true,"W"); throw new AssertionError("instance field accepted"); }
        catch(NoSuchFieldException expected) { }
        check(HookCompatibility.calledFrom(stack(Legacy.class.getName(),"handleClick"),old),"actual caller");
        check(!HookCompatibility.calledFrom(stack(Modern.class.getName(),"handleClick"),old),"unrelated class");
        check(!HookCompatibility.calledFrom(stack(Legacy.class.getName(),"explicitOff"),old),"explicit off");
        System.out.println("Automatic hook signature/caller tests passed");
    }
    static StackTraceElement[] stack(String type,String method) {return new StackTraceElement[]{new StackTraceElement(type,method,"fixture",1)};}
    static void check(boolean ok,String message) {if(!ok)throw new AssertionError(message);}
}
