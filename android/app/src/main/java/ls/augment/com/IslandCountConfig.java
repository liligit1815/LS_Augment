package ls.augment.com;

/** Counts current notifications' actual posts, never an application's unread messages. */
public final class IslandCountConfig {
    public static final String ENABLED=NativeIslandSceneOptions.key("notification_count");
    public static final String CHANNELS="ls_augment_rm_island_count_channels";
    public static final String DISCOVERED="ls_augment_island_count_channels";
    private IslandCountConfig(){}
}
