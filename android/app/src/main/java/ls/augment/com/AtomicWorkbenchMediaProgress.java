package ls.augment.com;

/** Pure monotonic-clock projection of a player's reported position; never seeks. */
final class AtomicWorkbenchMediaProgress {
    final boolean known, durationKnown, advancing;
    final long position, duration, sampled;
    final float speed;

    AtomicWorkbenchMediaProgress(long position, long duration, float speed,
            long updated, long sampled, boolean moving) {
        this.known = position >= 0;
        this.durationKnown = duration > 0;
        this.duration = Math.max(0, duration);
        this.sampled = Math.max(0, sampled);
        this.advancing = known && moving && Float.isFinite(speed) && updated > 0
                && sampled >= updated && sampled >= 0;
        this.speed = advancing ? speed : 0;
        this.position = project(known ? position : 0, this.duration,
                advancing ? (double) (sampled - updated) * speed : 0);
    }

    long positionAt(long now) {
        return project(position, duration, advancing && now >= sampled
                ? (double) (now - sampled) * speed : 0);
    }

    private static long project(long position, long duration, double delta) {
        double result = Math.max(0d, (double) position + delta);
        if (duration > 0) result = Math.min(duration, result);
        return result >= Long.MAX_VALUE ? Long.MAX_VALUE : Math.round(result);
    }
}
