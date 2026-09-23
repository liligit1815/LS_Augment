package ls.augment.com;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
/** The OEM MO reader returns a byte count for a size query, and 0 for a successful read. */
public final class OtaBufferPolicy {
    private OtaBufferPolicy() { }
    public static int read(String value,byte[] destination) {
        byte[] bytes=value.getBytes(StandardCharsets.UTF_8);
        if(destination==null)return bytes.length;
        if(destination.length<bytes.length)return -1;
        Arrays.fill(destination,(byte)0);System.arraycopy(bytes,0,destination,0,bytes.length);return 0;
    }
    public static boolean validUrl(String value) {
        if(value==null||value.length()>8192||value.indexOf('\n')>=0||value.indexOf('\r')>=0)return false;
        try {java.net.URI uri=new java.net.URI(value);return ("https".equalsIgnoreCase(uri.getScheme())||"http".equalsIgnoreCase(uri.getScheme()))&&uri.getHost()!=null;}
        catch(Exception ignored){return false;}
    }
}
