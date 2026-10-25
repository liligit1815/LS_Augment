package ls.augment.com;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.AtomicMoveNotSupportedException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.*;

/** DE evidence grouped by boot, so repeated exports cannot evict the previous boot. */
final class BootEvidenceArchive {
    static final int LIMIT=1024*1024,BOOTS=3;
    static final Set<String> PHASES=Set.of("APP","LOCKED_BOOT","BOOT","SHUTDOWN","EXPORT");
    private static boolean valid(File file){return file.getName().matches("[A-Za-z0-9_-]{1,64}--(APP|LOCKED_BOOT|BOOT|SHUTDOWN|EXPORT)\\.txt");}
    static void save(File directory,String boot,String phase,String body)throws IOException {
        if(!boot.matches("[A-Za-z0-9_-]{1,64}")||!PHASES.contains(phase))throw new IOException("archive_identity");
        if(Files.isSymbolicLink(directory.toPath())||!directory.exists()&&!directory.mkdirs())throw new IOException("archive_directory");
        byte[] bytes=body.getBytes(StandardCharsets.UTF_8);if(bytes.length>LIMIT)throw new IOException("archive_limit");
        File destination=new File(directory,boot+"--"+phase+".txt"),temporary=new File(directory,"pending-"+UUID.randomUUID()+".tmp");
        try {
            try(FileOutputStream stream=new FileOutputStream(temporary)){stream.write(bytes);stream.getFD().sync();}
            if(Files.isSymbolicLink(destination.toPath()))throw new IOException("archive_symlink");
            try{Files.move(temporary.toPath(),destination.toPath(),StandardCopyOption.REPLACE_EXISTING,StandardCopyOption.ATOMIC_MOVE);}
            catch(AtomicMoveNotSupportedException unsupported){Files.move(temporary.toPath(),destination.toPath(),StandardCopyOption.REPLACE_EXISTING);}
        }finally{temporary.delete();}
        File[] files=directory.listFiles(BootEvidenceArchive::valid);if(files==null)throw new IOException("archive_list");
        Map<String,Long> groups=new HashMap<>();
        for(File file:files)if(!Files.isSymbolicLink(file.toPath()))groups.merge(file.getName().split("--",2)[0],file.lastModified(),Math::max);
        List<String> others=new ArrayList<>(groups.keySet());others.remove(boot);others.sort(Comparator.comparingLong((String id)->groups.get(id)).reversed());
        Set<String> keep=new HashSet<>(others.subList(0,Math.min(BOOTS-1,others.size())));keep.add(boot);
        for(File file:files)if(!keep.contains(file.getName().split("--",2)[0])&&!Files.isSymbolicLink(file.toPath()))file.delete();
    }
    static String read(File directory) {
        StringBuilder out=new StringBuilder("retention=3_boots_x_5_phases;perFileLimitBytes="+LIMIT+";historical_not_current=true\n");
        File[] files=directory.listFiles(BootEvidenceArchive::valid);
        if(files==null)return out.append("status=MISSING_OR_INACCESSIBLE\n").toString();
        Arrays.sort(files,Comparator.comparingLong(File::lastModified).reversed());
        for(int i=0;i<Math.min(15,files.length);i++)try {
            File file=files[i];out.append("\n--- retained=").append(file.getName()).append(";modifiedWall=").append(file.lastModified()).append(" ---\n");
            if(Files.isSymbolicLink(file.toPath())||!file.isFile()||file.length()>LIMIT){out.append("status=INVALID_ARCHIVE\n");continue;}
            out.append(new String(Files.readAllBytes(file.toPath()),StandardCharsets.UTF_8));
        }catch(Exception failure){out.append("status=UNAVAILABLE;error=").append(failure.getClass().getSimpleName()).append('\n');}
        return out.toString();
    }
}
