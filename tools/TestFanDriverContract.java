package ls.augment.com.hook;
import java.nio.file.Files;
import java.nio.file.Path;
public final class TestFanDriverContract {
    static void check(boolean ok,String reason){if(!ok)throw new AssertionError(reason);}
    public static void main(String[] args)throws Exception {
        for(int i=0;i<args.length;i+=3) {
            byte[] image=Files.readAllBytes(Path.of(args[i])),note=Files.readAllBytes(Path.of(args[i+1]));
            String release=args[i+2];
            String digest=java.util.HexFormat.of().formatHex(java.security.MessageDigest.getInstance("SHA-256").digest(image));
            String report=release+"\n"+java.util.HexFormat.of().formatHex(note)+"\n"+digest;
            check("verified".equals(FanDriverContract.proofStatus(report)),"privileged reader exact firmware proof");
            check("driver_digest_mismatch".equals(FanDriverContract.proofStatus(report.replace(digest,"0".repeat(64)))),"digest cannot attest another module");
            check("running_kernel_unverified".equals(FanDriverContract.proofStatus(report.substring(1))),"kernel release mismatch rejects privileged proof");
            check(FanDriverContract.matches(image,note,release),"audited driver, running note and kernel match");
            check(!FanDriverContract.matches(image,note,release+"_different"),"kernel mismatch rejects");
            byte[] foreign=note.clone();foreign[foreign.length-1]^=1;
            check(!FanDriverContract.matches(image,foreign,release),"unloaded/foreign module rejects");
            image[image.length-1]^=1;
            check(!FanDriverContract.matches(image,note,release),"changed driver rejects before any write");
        }
        check(!FanDriverContract.matches(new byte[0],null,""),"missing proof rejects");
        System.out.println("PASS audited fan drivers: "+(args.length/3)+" images; loaded-module identity, kernel mismatch, modified/missing proof");
    }
}
