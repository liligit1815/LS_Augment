package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.LinkedHashMap;

public final class TestBootConfigMirror {
    public static void main(String[] args) throws Exception {
        Path directory=Files.createTempDirectory("lsa-boot-mirror-");
        Path file=directory.resolve("snapshot");
        try {
            if(BootConfigMirror.read(file.toFile())!=null)throw new AssertionError("missing file accepted");
            LinkedHashMap<String,String> values=new LinkedHashMap<>(ConfigSchema.runtimeDefaults());
            values.put(SystemOptions.key("audio_steps_media_enabled"),"1");
            values.put(SystemOptions.key("audio_steps_media"),"47");
            ConfigSnapshot snapshot=ConfigSnapshot.create(43,4567,values);
            if(BootConfigMirror.shellWrite(snapshot).contains(snapshot.serialize())
                    ||BootConfigMirror.shellWrite(snapshot).length()>1024)
                throw new AssertionError("bootstrap snapshot duplicated in command argument");
            Files.write(file,snapshot.serialize().getBytes(StandardCharsets.UTF_8));
            ConfigSnapshot loaded=BootConfigMirror.read(file.toFile());
            if(loaded==null||loaded.revision!=43||!"47".equals(loaded.get(SystemOptions.key("audio_steps_media"))))
                throw new AssertionError("early boot configuration lost");
            Files.writeString(file,"LSA1.truncated");
            if(BootConfigMirror.read(file.toFile())!=null)throw new AssertionError("partial snapshot accepted");
            Files.write(file,new byte[256*1024+1]);
            if(BootConfigMirror.read(file.toFile())!=null)throw new AssertionError("oversize snapshot accepted");
            Files.write(file,new byte[0]);
            if(BootConfigMirror.read(file.toFile())!=null)throw new AssertionError("empty snapshot accepted");
            System.out.println("Boot snapshot preserves constructor-time options; missing/partial/oversized files fail closed");
        } finally {Files.deleteIfExists(file);Files.deleteIfExists(directory);}
    }
}
