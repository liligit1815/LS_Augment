package ls.augment.com.hook;
public class TestThemeServiceContract {
    static int checks;
    static void check(boolean value){checks++;if(!value)throw new AssertionError("check "+checks);}
    static class Old {
        static int X(int n){return 1;}static void a0(int n){}static int Y(){return 1;}static int Z(){return 1;}
        static int U(){return 1;}static void b0(int n){}int x(int n,String p,String id){return 1;}
    }
    static class Modern {
        static int Z(int n){return 1;}static void c0(int n){}static int a0(){return 1;}static int b0(){return 1;}
        static int W(){return 1;}static void d0(int n){}int y(int n,String p,String id){return 1;}
    }
    static class Child extends Modern{}
    static class Partial {static int Z(int n){return 1;}}
    static class Wrong {
        static int Z(int n){return 1;}static void c0(int n){}static int a0(){return 1;}static int b0(){return 1;}
        static int W(){return 1;}static void d0(int n){}static int y(int n,String p,String id){return 1;}
    }
    static class Ambiguous extends Old {
        static int Z(int n){return 1;}static void c0(int n){}static int a0(){return 1;}static int b0(){return 1;}
        static int W(){return 1;}static void d0(int n){}int y(int n,String p,String id){return 1;}
    }
    public static void main(String[] args)throws Exception{
        ThemeServiceContract old=ThemeServiceContract.resolve(Old.class),modern=ThemeServiceContract.resolve(Modern.class);
        check(old.apply.getName().equals("x"));check(modern.apply.getName().equals("y"));
        check(modern.combined.getName().equals("Z"));check(modern.wallpaper.getName().equals("b0"));
        check(modern.trialFlag.getName().equals("d0"));check(ThemeServiceContract.resolve(Child.class).font.getName().equals("W"));
        for(Class<?> type:new Class[]{Partial.class,Wrong.class,Ambiguous.class}){
            try{ThemeServiceContract.resolve(type);throw new AssertionError("unsafe partial contract "+type);}
            catch(NoSuchMethodException expected){checks++;}
        }
        System.out.println("Theme contract checks="+checks);
    }
}
