package ls.augment.com;

/**
 * Single source of truth for the visual values used by the expected recents demo.
 *
 * <p>Keep the serialized values beside their UI values so configuration defaults,
 * reset controls and Launcher runtime fallbacks cannot silently drift apart.</p>
 */
public final class RecentsRecommendedConfig {
    public static final int COMPRESSION_PERCENT = 32;
    public static final int FRONT_OVERLAP_PERCENT = 30;
    public static final int MEMORY_TEXT_SP = 13;
    public static final int MEMORY_GAP_DP = 8;

    public static final float COMPRESSION = COMPRESSION_PERCENT / 100.0f;
    public static final float FRONT_OVERLAP = FRONT_OVERLAP_PERCENT / 100.0f;

    public static final String COMPRESSION_SERIALIZED = "0.32";
    public static final String FRONT_OVERLAP_SERIALIZED = "0.30";
    public static final String MEMORY_TEXT_SP_SERIALIZED = "13";
    public static final String MEMORY_GAP_DP_SERIALIZED = "8";

    private RecentsRecommendedConfig() { }
}
