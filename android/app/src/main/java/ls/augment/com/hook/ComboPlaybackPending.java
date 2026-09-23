package ls.augment.com.hook;

import java.util.Objects;
import java.util.function.Consumer;

/** Owns one unpublished OEM playback request; completion and cancellation compete once. */
final class ComboPlaybackPending {
    private Token current;

    synchronized Token begin(Object owner, String sourcePath, String packageName,
            float rate, long nowNanos, long budgetNanos) {
        current = new Token(owner, sourcePath, packageName, rate,
                nowNanos + Math.max(0L, budgetNanos));
        return current;
    }

    synchronized Token cancel(Object owner) {
        if (current == null || current.owner != owner) return null;
        Token cancelled = current;
        current = null;
        return cancelled;
    }

    synchronized void cancelAll() {
        current = null;
    }

    synchronized Token cancelIfConfigChanged(boolean enabled, float rate) {
        return cancelIfConfigChanged(enabled, rate, null);
    }

    synchronized Token cancelIfConfigChanged(boolean enabled, float rate,
            Consumer<Token> cleanup) {
        if (current != null && (!enabled || Float.compare(current.rate, rate) != 0)) {
            Token cancelled = current;
            current = null;
            if (cleanup != null) cleanup.accept(cancelled);
            return cancelled;
        }
        return null;
    }

    synchronized boolean claim(Token token, Object owner, String sourcePath,
            String packageName, boolean enabled, float rate) {
        return claim(token, owner, sourcePath, packageName, enabled, rate, null);
    }

    synchronized boolean claim(Token token, Object owner, String sourcePath,
            String packageName, boolean enabled, float rate, Consumer<Token> cleanup) {
        return claim(token, owner, sourcePath, packageName, enabled, rate, cleanup, null);
    }

    synchronized boolean claim(Token token, Object owner, String sourcePath,
            String packageName, boolean enabled, float rate, Consumer<Token> cleanup,
            Runnable publish) {
        if (token == null || current != token) return false;
        current = null;
        boolean accepted = enabled && token.owner == owner
                && Objects.equals(token.sourcePath, sourcePath)
                && Objects.equals(token.packageName, packageName)
                && Float.compare(token.rate, rate) == 0;
        // Cleanup runs in the same ownership transaction: an older completion
        // can never stop a replacement request, even when its path is identical.
        if (!accepted && cleanup != null) cleanup.accept(token);
        // A real stop either wins before this claim or follows the publication;
        // it cannot slip between consuming ownership and issuing the OEM start.
        if (accepted && publish != null) publish.run();
        return accepted;
    }

    static final class Token {
        final Object owner;
        final String sourcePath;
        final String packageName;
        final float rate;
        final long deadlineNanos;

        private Token(Object owner, String sourcePath, String packageName,
                float rate, long deadlineNanos) {
            this.owner = owner;
            this.sourcePath = sourcePath;
            this.packageName = packageName;
            this.rate = rate;
            this.deadlineNanos = deadlineNanos;
        }

        long remainingNanos(long nowNanos) {
            return Math.max(0L, deadlineNanos - nowNanos);
        }
    }
}
