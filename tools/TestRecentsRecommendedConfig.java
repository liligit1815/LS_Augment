package ls.augment.com;

public final class TestRecentsRecommendedConfig {
    private TestRecentsRecommendedConfig() { }

    public static void main(String[] args) {
        assertEquals(32, RecentsRecommendedConfig.COMPRESSION_PERCENT);
        assertEquals(30, RecentsRecommendedConfig.FRONT_OVERLAP_PERCENT);
        assertEquals(13, RecentsRecommendedConfig.MEMORY_TEXT_SP);
        assertEquals(8, RecentsRecommendedConfig.MEMORY_GAP_DP);
        assertEquals("0.32", RecentsRecommendedConfig.COMPRESSION_SERIALIZED);
        assertEquals("0.30", RecentsRecommendedConfig.FRONT_OVERLAP_SERIALIZED);
        assertEquals("13", RecentsRecommendedConfig.MEMORY_TEXT_SP_SERIALIZED);
        assertEquals("8", RecentsRecommendedConfig.MEMORY_GAP_DP_SERIALIZED);
        assertClose(0.32f, RecentsRecommendedConfig.COMPRESSION);
        assertClose(0.30f, RecentsRecommendedConfig.FRONT_OVERLAP);
        System.out.println("Recents recommended configuration checks: OK");
    }

    private static void assertEquals(Object expected, Object actual) {
        if (!expected.equals(actual)) {
            throw new AssertionError("expected " + expected + " but was " + actual);
        }
    }

    private static void assertClose(float expected, float actual) {
        if (Math.abs(expected - actual) > 0.0001f) {
            throw new AssertionError("expected " + expected + " but was " + actual);
        }
    }
}
