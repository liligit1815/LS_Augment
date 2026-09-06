package ls.augment.com;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.LinkedHashSet;
import java.util.Set;

public final class TestHookTargetRegistry {
    public static void main(String[] args) throws Exception {
        if (args.length != 1) throw new AssertionError("scope.list path required");
        Set<String> actual = new LinkedHashSet<>(Files.readAllLines(Path.of(args[0])));
        actual.removeIf(String::isBlank);
        if (!actual.equals(HookTargetRegistry.packages())) {
            throw new AssertionError("scope/provider registry drift: " + actual
                    + " != " + HookTargetRegistry.packages());
        }
        System.out.println("PASS TestHookTargetRegistry");
    }
}
