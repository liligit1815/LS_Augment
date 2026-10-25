package ls.augment.com.hook;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.Arrays;

/** Read-only proof for audited 0..5 drivers; node names alone never authorize writes. */
final class FanDriverContract {
    private static final String[] HASHES={
        "96618714657d8a72fa762b58f2d3fcbc7e8ceb4dfea5aae62a3a6af60f6caf65",
        "bd22b52f17ffbc311619288935276c1d6aa13fa9ca669b5ead6efc777b718887"
    };
    static boolean verified() {
        try {
            byte[] loaded=Files.readAllBytes(Path.of("/sys/module/soc_fan/notes/.note.gnu.build-id"));
            for(String base:new String[]{"/vendor/lib/modules/","/vendor_dlkm/lib/modules/"})
                for(String suffix:new String[]{"soc_fan.ko","16k-mode/soc_fan.ko"}) {
                    Path path=Path.of(base+suffix);
                    if(!Files.isRegularFile(path)||Files.size(path)>4*1024*1024)continue;
                    if(matches(Files.readAllBytes(path),loaded,System.getProperty("os.version","")))return true;
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
