package ls.augment.com;

import java.util.Arrays;
import java.util.Collections;

public final class TestUserResolution {
    public static void main(String[] args) {
        resolved(0, UserResolution.resolve(true, "0", true, "0",
                Arrays.asList(0, 999)));
        resolved(999, UserResolution.resolve(true, "999", false, "",
                Arrays.asList(0, 999)));
        failed(UserResolution.resolve(true, "", true, "", Arrays.asList(0)));
        failed(UserResolution.resolve(true, "0", true, "999", Arrays.asList(0, 999)));
        failed(UserResolution.resolve(true, "用户 0", false, "", Arrays.asList(0)));
        failed(UserResolution.resolve(true, "乱码", true, "0", Arrays.asList(0)));
        failed(UserResolution.resolve(true, "0", true, "", Arrays.asList(0)));
        failed(UserResolution.resolve(true, "0", true, "0", Collections.singleton(999)));
        failed(UserResolution.resolve(false, "0", false, "0", Arrays.asList(0)));
        System.out.println("PASS TestUserResolution");
    }

    private static void resolved(int expected, UserResolution value) {
        if (!value.resolved || value.userId != expected) {
            throw new AssertionError("expected user " + expected + ": " + value.message);
        }
    }

    private static void failed(UserResolution value) {
        if (value.resolved || value.userId != -1) {
            throw new AssertionError("resolution should fail");
        }
    }
}
