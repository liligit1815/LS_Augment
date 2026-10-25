package ls.augment.com;

/** Drop semantics, independent of optional imports and explicit sharing tools. */
public final class AtomicWorkbenchDragDeliveryPolicy {
    public enum Kind { TEXT, IMAGE, VIDEO, FILE, MIXED }
    public enum Action { TEXT_SEARCH, IMAGE_SEARCH, NATIVE_DROP, UNSUPPORTED }
    public static final String UNSUPPORTED = "当前app暂不支持";
    private AtomicWorkbenchDragDeliveryPolicy() { }
    public static Action browser(Kind kind, boolean textSearch, boolean imageSearch) {
        if (kind == Kind.TEXT && textSearch) return Action.TEXT_SEARCH;
        if (kind == Kind.IMAGE && imageSearch) return Action.IMAGE_SEARCH;
        return Action.UNSUPPORTED;
    }
    public static Action nativeTarget(Kind kind, boolean receiverVerified) {
        return kind != null && receiverVerified ? Action.NATIVE_DROP : Action.UNSUPPORTED;
    }
}
