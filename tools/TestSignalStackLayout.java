package ls.augment.com.hook;

public final class TestSignalStackLayout {
    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
    private static void close(float actual, float expected, String message) {
        check(Math.abs(actual - expected) < .001f, message + ": " + actual);
    }
    public static void main(String[] args) {
        SignalStackLayout.Geometry normal = SignalStackLayout.fit(8, 3, 18, 18, 40, 24, 1);
        check(normal != null, "normal slot fits both signals");
        close(normal.rowHeight, 11.5f, "both rows use the available height");
        close(normal.width / normal.rowHeight, 1, "signals keep their aspect ratio");
        close(normal.height(), 24, "two rows stay inside the native slot");
        close(normal.left + normal.width / 2, 17, "stack stays centered on the strength glyph");

        SignalStackLayout.Geometry narrow = SignalStackLayout.fit(4, 4, 30, 20, 8, 40, 2);
        close(narrow.width, 8, "narrow native slot limits width");
        close(narrow.width / narrow.rowHeight, 1.5f, "narrow slot preserves proportions");
        check(narrow.top >= 0 && narrow.top + narrow.height() <= 40, "narrow slot does not clip either row");

        SignalStackLayout.Geometry shifted = SignalStackLayout.fit(50, 50, 16, 20, 30, 30, 1);
        check(shifted.left + shifted.width <= 30 && shifted.top + shifted.height() <= 30,
                "layout changes cannot move the lower row outside its owner");
        check(SignalStackLayout.fit(0, 0, 0, 20, 30, 30, 1) == null, "unmeasured glyph stays native");
        check(SignalStackLayout.fit(0, 0, 20, 20, 30, 0, 1) == null, "unmeasured slot stays native");
        check(SignalStackLayout.fit(0, 0, Float.NaN, 20, 30, 30, 1) == null, "invalid geometry stays native");
        SignalStackLayout.Geometry compact=SignalStackLayout.compact(5,3,65,42,65,42,3);
        close(compact.width/compact.height(),1.3f,"compact combined glyph keeps one icon's aspect ratio");
        check(compact.left>=0&&compact.top>=0&&compact.left+compact.width<=65&&compact.top+compact.height()<=42,"compact rows stay inside native icon");
        check(compact.gap>0&&compact.rowHeight>0,"separated compact signal rows");
        check(SignalStackLayout.compact(0,0,Float.NaN,20,30,30,1)==null,"compact invalid geometry stays native");
        System.out.println("Signal stack geometry checks passed");
    }
}
