package ls.augment.com;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/** Only load extracted code owned by the installed module and identical to its APK. */
public final class OwnedNativeLibrary {
    public static boolean matches(File apk, File library, String fileName, String[] abis) {
        if (apk == null || library == null || abis == null || !fileName.matches("lib[a-zA-Z0-9_]+\\.so")) return false;
        try {
            File code = apk.getCanonicalFile().getParentFile();
            File canonical = library.getCanonicalFile();
            File root = new File(code, "lib").getCanonicalFile();
            if (!root.getParentFile().equals(code) || !canonical.toPath().startsWith(root.toPath()) || !canonical.getName().equals(fileName)
                    || !canonical.isFile() || canonical.length() <= 0) return false;
            byte[] actual;
            try (InputStream input = Files.newInputStream(canonical.toPath())) { actual = digest(input); }
            try (ZipFile zip = new ZipFile(apk)) {
                for (String abi : abis) {
                    if (!abi.matches("[a-zA-Z0-9_-]+")) continue;
                    ZipEntry entry = zip.getEntry("lib/" + abi + "/" + fileName);
                    if (entry == null || entry.getSize() != canonical.length()) continue;
                    try (InputStream input = zip.getInputStream(entry)) {
                        if (MessageDigest.isEqual(actual, digest(input))) return true;
                    }
                }
            }
        } catch (Exception unavailable) { return false; }
        return false;
    }
    private static byte[] digest(InputStream input) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] buffer = new byte[16384];
        int count;
        while ((count = input.read(buffer)) != -1) if (count > 0) digest.update(buffer, 0, count);
        return digest.digest();
    }
    private OwnedNativeLibrary() {}
}
