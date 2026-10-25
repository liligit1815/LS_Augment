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
        close(compact.width/compact.height(),85f/75f,"Honor columns use a narrower layout while keeping full reference height");
        check(compact.left>=0&&compact.top>=0&&compact.left+compact.width<=65&&compact.top+compact.height()<=42,"compact rows stay inside native icon");
        check(compact.gap>0&&compact.rowHeight>0,"separated compact signal rows");
        check(SignalStackLayout.compact(0,0,Float.NaN,20,30,30,1)==null,"compact invalid geometry stays native");
        SignalStackLayout.Geometry single=SignalStackLayout.compactSingle(5,3,65,42,65,42);
        check(single!=null&&single.rows==1&&single.gap==0,"single SIM has one row and no phantom gutter");
        close(single.width/single.height(),85f/35f,"single-row signal uses the same narrower column arrangement");
        close(single.height(),single.rowHeight,"only one real row consumes the native slot");
        check(single.left>=0&&single.top>=0&&single.left+single.width<=65&&single.top+single.height()<=42,"single glyph remains within native geometry");
        check(SignalStackLayout.compactSingle(0,0,20,0,30,30)==null,"unmeasured single glyph stays native");
        SignalStackLayout.Geometry ios=SignalStackLayout.ios(8,3,18,24,40,30,false);
        close(ios.height(),24,"iOS dual uses native signal height instead of the wide Honor aspect limit");
        close(ios.width/ios.height(),47f/37f,"iOS uses the supplied complete dual glyph proportions");
        close(ios.gap,24*2f/37f,"the compact two-pixel artwork gutter scales uniformly");
        close(ios.left+ios.width/2,17,"iOS artwork is centered on the same original strength glyph");
        SignalStackLayout.Geometry iosSingle=SignalStackLayout.ios(8,3,18,24,40,30,true);
        close(iosSingle.height(),24,"single iOS SIM retains the native glyph height");
        close(iosSingle.width/iosSingle.height(),47f/42f,"single SIM preserves supplied PNG ink aspect");
        check(iosSingle.rows==1&&iosSingle.gap==0,"single iOS SIM allocates one actual row");
        for(boolean one:new boolean[]{false,true})for(float w:new float[]{8,18,24,65})for(float h:new float[]{12,18,24,42}){
            SignalStackLayout.Geometry png=SignalStackLayout.ios(4,3,w,h,40,30,one);
            check(png!=null&&png.left>=0&&png.top>=0&&png.left+png.width<=40.001&&png.top+png.height()<=30.001,"all iOS dimensions fit the native owner");
            float aspect=one?47f/42f:47f/37f;
            close(png.width/png.height(),aspect,"single and combined PNGs retain their distinct original proportions");
            close(png.height(),Math.min(Math.min(h,30),40/aspect),"only an actual owner boundary may reduce native height");
        }
        SignalStackLayout.Geometry tight=SignalStackLayout.ios(0,0,18,24,8,30,false);
        close(tight.width,8,"an actually narrow owner bounds iOS width");
        check(tight.height()<24&&tight.top+tight.height()<=30,"owner constraint shrinks both PNG axes together");
        check(SignalStackLayout.ios(0,0,Float.NaN,24,40,30,false)==null,"invalid iOS input keeps native rendering");
        close(SignalStackLayout.referenceHeight(33,39,60),39,"a matching native image frame restores the nearby icon height");
        close(SignalStackLayout.referenceHeight(33,20,60),33,"a small frame never shrinks the measured glyph");
        close(SignalStackLayout.referenceHeight(33,90,100),39.6f,"a full status-bar-sized frame cannot cause runaway growth");
        close(SignalStackLayout.referenceHeight(33,39,36),36,"owner height remains a strict bound");
        close(SignalStackLayout.referenceHeight(33,Float.NaN,60),33,"unknown native frame preserves measured glyph");
        close(SignalStackLayout.referenceHeight(33,Float.POSITIVE_INFINITY,60),33,"infinite frame preserves measured glyph");
        close(SignalStackLayout.referenceHeight(0,39,60),0,"unmeasured native glyph remains unavailable");
        close(SignalStackLayout.referenceHeight(33,39,Float.NaN),0,"invalid owner is unavailable");
        SignalStackLayout.Geometry narrowInk=SignalStackLayout.compact(8,3,12,24,50,30,1);
        close(narrowInk.height(),24,"Honor is sized by icon height rather than an old narrow single-signal width");
        System.out.println("Signal stack geometry checks passed");
    }
}
