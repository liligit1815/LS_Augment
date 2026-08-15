package ls.augment.com.hook;

public final class TestRecentsDismissPolicy {
    private TestRecentsDismissPolicy() { }

    public static void main(String[] args) {
        assertHooked("dismissTaskView");
        assertHooked("expressiveDismissTaskView");
        assertHooked("createTaskDismissAnimation");

        assertRejected("setDismissTranslationX", true, true);
        assertRejected("setDismissTranslationY", true, true);
        assertRejected("setDismissScale", true, true);
        assertRejected("setSettledProgressDismiss", true, true);
        assertRejected("lambda$dismissTaskView$42", true, true);
        assertRejected("dismissTaskView", true, false);
        if (RecentsDismissPolicy.shouldHook(
                "com.android.quickstep.views.TaskView",
                "dismissTaskView", true, true)) {
            throw new AssertionError("TaskView owner must never be treated as RecentsView");
        }
        System.out.println("Recents dismiss policy checks: OK");
    }

    private static void assertHooked(String methodName) {
        if (!RecentsDismissPolicy.shouldHook(
                "com.android.quickstep.views.RecentsView",
                methodName, true, true)) {
            throw new AssertionError("expected hook for " + methodName);
        }
    }

    private static void assertRejected(
            String methodName, boolean returnsVoid, boolean hasTaskViewParameter) {
        if (RecentsDismissPolicy.shouldHook(
                "com.android.quickstep.views.RecentsView",
                methodName, returnsVoid, hasTaskViewParameter)) {
            throw new AssertionError("unexpected hook for " + methodName);
        }
    }
}
