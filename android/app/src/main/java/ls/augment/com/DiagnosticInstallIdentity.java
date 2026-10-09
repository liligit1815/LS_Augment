package ls.augment.com;

import android.content.Context;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.UUID;

/** Anonymous installation identity, excluded from Android backup and config export/import. */
final class DiagnosticInstallIdentity {
    private DiagnosticInstallIdentity() { }
    static synchronized String get(Context context) {
        try {
            File file=new File(context.getNoBackupFilesDir(),"diagnostic-install-id");
            if(file.isFile()&&file.length()<=128) {
                String value=new String(Files.readAllBytes(file.toPath()),StandardCharsets.UTF_8).trim();
                if(value.matches("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"))return value;
            }
            String value=UUID.randomUUID().toString();Files.write(file.toPath(),value.getBytes(StandardCharsets.UTF_8));
            return value;
        }catch(Exception ignored){return "UNAVAILABLE";}
    }
}
