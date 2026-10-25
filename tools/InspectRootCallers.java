import jadx.api.JadxArgs;
import jadx.api.JadxDecompiler;
import jadx.core.dex.nodes.ClassNode;
import jadx.core.dex.nodes.MethodNode;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/** Offline direct-use index. Does not prove virtual dispatch, active frames or ART coverage. */
public final class InspectRootCallers {
    private static String descriptor(MethodNode method) {
        return "L"+method.getMethodInfo().getDeclClass().getRawName().replace('.', '/')+";->"+method.getMethodInfo().getShortId();
    }
    public static void main(String[] argv)throws Exception {
        Set<String> targets=new TreeSet<>(Files.readAllLines(Path.of(argv[0])));
        JadxArgs args=new JadxArgs();List<File> inputs=new ArrayList<>();
        for(int i=2;i<argv.length;i++)inputs.add(new File(argv[i]));
        args.setInputFiles(inputs);args.setSkipResources(true);args.setThreadsCount(3);
        args.setInlineMethods(false);args.setInlineAnonymousClasses(false);
        List<String> rows=new ArrayList<>();rows.add("target\tcaller\tcallerFlags");
        try(JadxDecompiler decompiler=new JadxDecompiler(args)) {
            decompiler.load();decompiler.getRoot().runPreDecompileStage();
            for(ClassNode type:decompiler.getRoot().getClasses())for(MethodNode method:type.getMethods()) {
                String target=descriptor(method);if(!targets.remove(target))continue;
                List<MethodNode> callers=method.getUseIn();
                if(callers.isEmpty())rows.add(target+"\t<no-direct-use-indexed>\t0");
                else for(MethodNode caller:callers)rows.add(target+"\t"+descriptor(caller)+"\t"+caller.getRawAccessFlags());
            }
            for(String missing:targets)rows.add(missing+"\t<target-absent>\t0");
        }
        Files.write(Path.of(argv[1]),rows);
        System.out.println("Saved "+(rows.size()-1)+" direct-use rows; remaining targets="+targets.size()+"; admission=false");
    }
}
