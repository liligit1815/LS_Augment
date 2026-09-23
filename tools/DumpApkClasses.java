import java.io.StringWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashSet;
import java.util.Set;
import java.util.zip.ZipFile;
import com.android.tools.smali.baksmali.BaksmaliOptions;
import com.android.tools.smali.baksmali.Adaptors.ClassDefinition;
import com.android.tools.smali.baksmali.formatter.BaksmaliWriter;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;

/** Inspect only named classes from the captured phone APK using the bundled apktool runtime. */
public final class DumpApkClasses {
    public static void main(String[] args) throws Exception {
        Path output=Path.of(args[1]);Files.createDirectories(output);
        Set<String> wanted=new HashSet<>();
        for(int i=2;i<args.length;i++)wanted.add("L"+args[i].replace('.','/')+";");
        try(ZipFile zip=new ZipFile(args[0])){
            var entries=zip.entries();
            while(entries.hasMoreElements()){
                var entry=entries.nextElement();if(!entry.getName().matches("classes[0-9]*\\.dex"))continue;
                byte[] bytes;try(var input=zip.getInputStream(entry)){bytes=input.readAllBytes();}
                DexBackedDexFile dex=new DexBackedDexFile(bytes,0);
                for(int i=0;i<dex.classCount;i++){
                    ClassDef type=(ClassDef)dex.classSection.get(i);if(!wanted.remove(type.getType()))continue;
                    StringWriter text=new StringWriter();
                    new ClassDefinition(new BaksmaliOptions(),type).writeTo(new BaksmaliWriter(text));
                    String name=type.getType().substring(1,type.getType().length()-1).replace('/','.');
                    Files.writeString(output.resolve(name+".smali"),text.toString());
                    System.out.println(entry.getName()+": "+name);
                }
            }
        }
        if(!wanted.isEmpty())throw new IllegalArgumentException("Classes not found: "+wanted);
    }
}
