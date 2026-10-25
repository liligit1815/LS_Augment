import java.nio.file.*;
import java.util.zip.*;
import ls.augment.com.OwnedNativeLibrary;

public class TestOwnedNativeLibrary {
    static int checks;
    static void check(boolean ok,String name){checks++;if(!ok)throw new AssertionError(name);}
    public static void main(String[]args)throws Exception {
        Path dir=Path.of(args[0]);Path apk=dir.resolve("base.apk"), lib=dir.resolve("lib/arm64/libduo.so");
        Files.createDirectories(lib.getParent());byte[] good={1,2,3,4};Files.write(lib,good);
        try(ZipOutputStream zip=new ZipOutputStream(Files.newOutputStream(apk))){zip.putNextEntry(new ZipEntry("lib/arm64-v8a/libduo.so"));zip.write(good);zip.closeEntry();}
        String[] abis={"arm64-v8a","armeabi-v7a"};
        check(OwnedNativeLibrary.matches(apk.toFile(),lib.toFile(),"libduo.so",abis),"owned runtime arch alias");
        check(!OwnedNativeLibrary.matches(apk.toFile(),lib.toFile(),"libduo.so",new String[]{"x86"}),"ABI missing");
        Files.write(lib,new byte[]{4,3,2,1});check(!OwnedNativeLibrary.matches(apk.toFile(),lib.toFile(),"libduo.so",abis),"same-size modified bytes rejected");
        Files.write(lib,new byte[]{1});check(!OwnedNativeLibrary.matches(apk.toFile(),lib.toFile(),"libduo.so",abis),"truncated library rejected");Files.write(lib,good);
        Path foreign=dir.resolve("cache/libduo.so");Files.createDirectories(foreign.getParent());Files.write(foreign,good);
        check(!OwnedNativeLibrary.matches(apk.toFile(),foreign.toFile(),"libduo.so",abis),"same bytes outside owned lib rejected");
        check(!OwnedNativeLibrary.matches(apk.toFile(),lib.toFile(),"../libduo.so",abis),"traversal name rejected");
        check(!OwnedNativeLibrary.matches(null,lib.toFile(),"libduo.so",abis),"missing APK rejected");
        check(!OwnedNativeLibrary.matches(apk.toFile(),lib.toFile(),"libduo.so",new String[]{"../arm64-v8a"}),"invalid ABI rejected");
        Files.write(apk,new byte[]{0});check(!OwnedNativeLibrary.matches(apk.toFile(),lib.toFile(),"libduo.so",abis),"malformed APK rejected");
        System.out.println("PASS native load provenance: "+checks+" checks");
    }
}
