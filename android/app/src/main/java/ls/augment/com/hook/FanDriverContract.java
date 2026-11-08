package ls.augment.com.hook;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.Arrays;

/** Read-only proof for audited 0..5 drivers; node names alone never authorize writes. */
public final class FanDriverContract {
    private static final String[] HASHES={
        "96618714657d8a72fa762b58f2d3fcbc7e8ceb4dfea5aae62a3a6af60f6caf65",
        "bd22b52f17ffbc311619288935276c1d6aa13fa9ca669b5ead6efc777b718887",
        // 6.6.30 driver: fan_level_store accepts 0..5; fan_speed_count reports
        // OEM-adjusted feedback. Still require its loaded build-id and vermagic.
        "0693fb6f722969a9cc830e58f3df7ff96c21215e5b8f665b71c374bdd03cd8cc"
    };
    // ELF .note.gnu.build-id and vermagic from each audited image above.
    private static final String[] NOTES={
        "3e93bad95b41c372af9b2cb5fedf3887395f514b", "32845c5c3948a5838f61b8d9c16942ecef1365fa",
        "a0711bd15d5c7ecb30f8f2e6a41d874e018c4d22"
    };
    private static final String[] RELEASES={
        "6.18.21-android17-5-maybe-dirty-4k", "6.18.21-android17-5-maybe-dirty-16k",
        "6.6.30-android15-8-maybe-dirty-4k"
    };
    public static String proofStatus(String output) {
        if (output == null || output.length() > 8192 || output.trim().isEmpty()) return "proof_missing_or_invalid";
        String[] lines=output.trim().split("\\r?\\n");
        for (int i=0;i<RELEASES.length;i++) {
            if (!RELEASES[i].equals(lines[0])) continue;
            if (lines.length<2 || lines[1].isEmpty()) return "loaded_note_unavailable";
            if (!("040000001400000003000000474e5500"+NOTES[i]).equals(lines[1])) return "loaded_build_id_mismatch";
            if (lines.length<3) return "driver_file_unavailable";
            boolean digest=false;
            for (int n=2;n<lines.length;n++) {
                if (HASHES[i].equals(lines[n])) return "verified";
                if (lines[n].matches("[a-f0-9]{64}")) digest=true;
            }
            return digest?"driver_digest_mismatch":"driver_file_unavailable";
        }
        return "running_kernel_unverified";
    }
    static boolean verified() {
        try {
            String release=System.getProperty("os.version","");
            if(!Arrays.asList(RELEASES).contains(release))return false;
            byte[] loaded=Files.readAllBytes(Path.of("/sys/module/soc_fan/notes/.note.gnu.build-id"));
            for(String candidate:new String[]{"/vendor/lib/modules/soc_fan.ko","/vendor/lib/modules/16k-mode/soc_fan.ko",
                    "/vendor_dlkm/lib/modules/soc_fan.ko","/vendor_dlkm/lib/modules/16k-mode/soc_fan.ko",
                    "/lib/modules/soc_fan.ko","/lib/modules/"+release+"_16k/soc_fan.ko"}) {
                try {
                    Path path=Path.of(candidate);
                    if(!Files.isRegularFile(path)||Files.size(path)>4*1024*1024)continue;
                    if(matches(Files.readAllBytes(path),loaded,release))return true;
                }catch(Exception inaccessibleCandidate){ /* Try remaining audited locations. */ }
            }
        }catch(Exception unavailable){/* No loaded-driver evidence, no new level-write permission. */}
        return false;
    }
    static boolean matches(byte[] image,byte[] loaded,String release) {
        try {
            if(image==null||image.length<64||image.length>4*1024*1024||loaded==null||loaded.length<16||loaded.length>128
                    ||release==null||release.isEmpty())return false;
            StringBuilder hash=new StringBuilder();
            for(byte b:MessageDigest.getInstance("SHA-256").digest(image))hash.append(String.format(java.util.Locale.ROOT,"%02x",b&255));
            if(!Arrays.asList(HASHES).contains(hash.toString()))return false;
            // Require the audited bytes to be the running module, not just an unused file.
            ByteBuffer b=ByteBuffer.wrap(image).order(ByteOrder.LITTLE_ENDIAN);
            if(b.getInt(0)!=0x464c457f||image[4]!=2||b.getShort(16)!=1||b.getShort(18)!=183)return false;
            long table=b.getLong(40);int count=b.getShort(60)&65535;
            if(table<0||table>image.length-(long)count*64||b.getShort(58)!=64)return false;
            boolean note=false;
            for(int i=0;i<count;i++) {
                int at=(int)table+i*64;
                if(b.getInt(at+4)!=7)continue; // SHT_NOTE
                long start=b.getLong(at+24),size=b.getLong(at+32);
                if(size==loaded.length&&start>=0&&start<=image.length-size
                        &&Arrays.equals(loaded,Arrays.copyOfRange(image,(int)start,(int)(start+size))))note=true;
            }
            String strings=new String(image,java.nio.charset.StandardCharsets.ISO_8859_1);
            return note&&strings.contains("\0vermagic="+release+" ");
        }catch(Exception malformed){return false;}
    }
    private FanDriverContract(){}
}
