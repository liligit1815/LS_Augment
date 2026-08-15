package ls.augment.com.hook;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/** Limits recents interception to task-level dismiss entry points. */
final class RecentsDismissPolicy {
    private static final Set<String> ENTRY_POINTS = Collections.unmodifiableSet(
            new HashSet<>(Arrays.asList(
                    "dismissTaskView",
                    "expressiveDismissTaskView",
                    "createTaskDismissAnimation")));

    private RecentsDismissPolicy() { }

    static boolean shouldHook(
            String ownerClassName,
            String methodName,
            boolean returnsVoid,
            boolean hasTaskViewParameter) {
        return ownerClassName != null
                && ownerClassName.endsWith("RecentsView")
                && returnsVoid
                && hasTaskViewParameter
                && ENTRY_POINTS.contains(methodName);
    }
}
