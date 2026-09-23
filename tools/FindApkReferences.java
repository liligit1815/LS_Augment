import java.util.zip.ZipFile;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;

/** Read-only reference search in captured device APKs; prints matching owners only. */
public final class FindApkReferences {
    public static void main(String[] args) throws Exception {
        try (ZipFile zip = new ZipFile(args[0])) {
            var entries = zip.entries();
            while (entries.hasMoreElements()) {
                var entry = entries.nextElement();
                if (!entry.getName().matches("classes[0-9]*\\.dex")) continue;
                byte[] bytes;
                try (var input = zip.getInputStream(entry)) { bytes = input.readAllBytes(); }
                var dex = new DexBackedDexFile(bytes, 0);
                for (int i = 0; i < dex.classCount; i++) {
                    var type = (ClassDef) dex.classSection.get(i);
                    var methods = new java.util.ArrayList<Method>();
                    for (Object method : type.getDirectMethods()) methods.add((Method) method);
                    for (Object method : type.getVirtualMethods()) methods.add((Method) method);
                    for (var method : methods) {
                        var impl = method.getImplementation();
                        if (impl == null) continue;
                        for (var instruction : impl.getInstructions()) {
                            if (!(instruction instanceof ReferenceInstruction)) continue;
                            String ref = ((ReferenceInstruction) instruction).getReference().toString();
                            for (int k = 1; k < args.length; k++) {
                                if (ref.contains(args[k])) {
                                    System.out.println(type.getType() + "->" + method.getName() + " : " + ref);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
