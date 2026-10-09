package ls.augment.com;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/** Actual production cleaner fixture. Android may call run(itsCacheDir, true). */
public final class TestOwnedFileCleaner {
    public static final class Report {
        public final List<String> results = new ArrayList<>();
        public int passed, unsupported;
        void pass(String name) { passed++; results.add("PASS " + name); }
        void unsupported(String reason) { unsupported++; results.add("UNSUPPORTED real symlinks: " + reason); }
    }
    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
    private static void rejects(RunnableIo operation, String message) throws Exception {
        try { operation.run(); throw new AssertionError(message); }
        catch (IOException expected) { }
    }
    private interface RunnableIo { void run() throws Exception; }

    public static Report run(File parent, boolean requireLinks) throws Exception {
        Path work = Files.createTempDirectory(parent.toPath(), "owned-file-cleaner-fixture-");
        Report report = new Report();
        try {
            Path root = Files.createDirectory(work.resolve("owned"));
            Path outside = Files.createDirectory(work.resolve("owned-sibling"));
            Path sentinel = outside.resolve("sentinel.txt");
            Files.writeString(sentinel, "original outside fixture sentinel");
            Path nested = Files.createDirectories(root.resolve("nested/deep"));
            Files.writeString(root.resolve("private.txt"), "private module fixture");
            Files.writeString(nested.resolve("private.txt"), "nested module fixture");
            OwnedFileCleaner.clear(root.toFile());
            check(Files.isDirectory(root) && root.toFile().list().length == 0, "nested contents not cleared");
            check(Files.readString(sentinel).equals("original outside fixture sentinel"), "outside sibling changed");
            report.pass("nested files removed, root retained, sibling preserved");
            Files.writeString(root.resolve("alias-private.txt"), "alias fixture");
            OwnedFileCleaner.clear(new File(root.toFile(), "."));
            check(root.toFile().list().length == 0, "lexical dot alias not cleared");
            report.pass("lexical root alias resolves to the same explicit directory");
            OwnedFileCleaner.clear(work.resolve("missing").toFile());
            report.pass("missing directory is harmless");
            Path plain = work.resolve("plain-file.txt");
            Files.writeString(plain, "must remain");
            rejects(() -> OwnedFileCleaner.clear(plain.toFile()), "plain root file accepted");
            check(Files.readString(plain).equals("must remain"), "root plain file modified");
            report.pass("root plain file rejected and preserved");
            Method remove = OwnedFileCleaner.class.getDeclaredMethod("remove", File.class, File.class);
            remove.setAccessible(true);
            try { remove.invoke(null, root.toFile().getCanonicalFile(), sentinel.toFile());
                throw new AssertionError("same-prefix sibling boundary accepted");
            } catch (InvocationTargetException failure) {
                check(failure.getCause() instanceof IOException, "unexpected boundary failure");
            }
            check(Files.readString(sentinel).equals("original outside fixture sentinel"), "boundary fixture deleted outside file");
            report.pass("Path segment boundary rejects same-prefix sibling");

            Path probe = work.resolve("symlink-probe");
            try { Files.createSymbolicLink(probe, outside); }
            catch (IOException | UnsupportedOperationException unsupported) {
                if (requireLinks) throw new AssertionError("Real symlink support required", unsupported);
                report.unsupported(unsupported.getClass().getSimpleName());
                return report;
            }
            check(Files.isSymbolicLink(probe), "host did not create an actual NIO symlink");
            rejects(() -> OwnedFileCleaner.clear(probe.toFile()), "root symlink followed");
            check(Files.isSymbolicLink(probe) && Files.exists(sentinel), "root link or outside deleted");
            report.pass("root symlink rejected without following target");
            Files.createSymbolicLink(root.resolve("directory-link"), outside);
            Files.createSymbolicLink(root.resolve("file-link"), sentinel);
            Files.createSymbolicLink(root.resolve("dangling-child"), work.resolve("never-created"));
            OwnedFileCleaner.clear(root.toFile());
            check(root.toFile().list().length == 0, "child links not unlinked");
            check(Files.readString(sentinel).equals("original outside fixture sentinel"), "child links followed outside");
            report.pass("file, directory and dangling child links unlinked without following targets");
            Path danglingRoot = work.resolve("dangling-root");
            Files.createSymbolicLink(danglingRoot, work.resolve("never-created"));
            rejects(() -> OwnedFileCleaner.clear(danglingRoot.toFile()), "dangling root symlink incorrectly accepted");
            check(Files.isSymbolicLink(danglingRoot), "dangling root modified on rejection");
            report.pass("dangling root symlink rejected rather than classified as missing");
            return report;
        } finally {
            // The only final cleanup target is the new fixture directory. The
            // walk does not follow links; production/user data are not candidates.
            check(work.getParent().toRealPath().equals(parent.toPath().toRealPath()), "fixture root escaped parent");
            try (var paths = Files.walk(work)) {
                for (Path path : paths.sorted(Comparator.reverseOrder()).toList()) Files.deleteIfExists(path);
            }
        }
    }
    public static void main(String[] arguments) throws Exception {
        File parent = new File(System.getProperty("java.io.tmpdir"));
        boolean required = arguments.length > 0 && "--require-symlinks".equals(arguments[0]);
        Report report = run(parent, required);
        report.results.forEach(System.out::println);
        System.out.println("OWNED FILE RESULT " + report.passed + " passed, " + report.unsupported + " unsupported");
    }
}
