package ls.augment.com.hook;

import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

public final class TestStatusBarFeatureSupport {
    private TestStatusBarFeatureSupport() { }

    public static void main(String[] args) {
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Shanghai"), Locale.CHINA);
        calendar.set(2026, Calendar.AUGUST, 13, 19, 5, 6);
        calendar.set(Calendar.MILLISECOND, 0);
        String value = StatusBarClockFormatter.format(
                calendar.getTimeInMillis(), Locale.CHINA,
                true, true, true, true, "");
        require(value.contains("19:05:06"), "24-hour seconds formatting");
        require(value.contains("傍晚"), "Chinese period formatting");
        require(StatusBarClockFormatter.period(0, Locale.CHINA).equals("凌晨"),
                "midnight period");
        require(StatusBarClockFormatter.period(12, Locale.CHINA).equals("中午"),
                "noon period");

        StatusBarClockFormatter.FormatResult dual = StatusBarClockFormatter.formatDetailed(
                calendar.getTimeInMillis(), Locale.CHINA,
                true, false, false, false, "yy:MM-HH:mm", "E");
        require(dual.valid, "dual-line pattern valid");
        require(dual.text.contains("\n"), "dual-line clock contains line break");
        require(!dual.refreshEverySecond, "minute-only pattern does not tick every second");

        StatusBarClockFormatter.FormatResult seconds = StatusBarClockFormatter.formatDetailed(
                calendar.getTimeInMillis(), Locale.CHINA,
                true, false, false, false, "HH:mm:ss", "'II'");
        require(seconds.valid && seconds.refreshEverySecond,
                "seconds in a custom pattern controls refresh frequency");
        require(seconds.text.endsWith("\nII"), "quoted literal is supported");

        StatusBarClockFormatter.FormatResult extended = StatusBarClockFormatter.formatDetailed(
                calendar.getTimeInMillis(), Locale.CHINA,
                true, false, false, false, "HH:mm", "II");
        require(extended.valid && extended.text.contains("\n")
                        && !extended.text.endsWith("\nII"),
                "extended earthly-branch hour token is formatted");
        require(!StatusBarClockFormatter.needsSecondRefresh("'ss'", "E"),
                "quoted seconds are literals");

        ls.augment.com.StatusBarLayoutSpec.ParseResult layout =
                ls.augment.com.StatusBarLayoutSpec.parse(
                        "clock,120,500;slot.wifi,880,240");
        require(layout.valid, "status bar layout parses");
        require(layout.spec.get("slot.wifi").x == 880, "slot coordinate retained");
        require(ls.augment.com.StatusBarLayoutSpec.pixel(500, 1216) == 608,
                "normalized coordinate maps to current status bar");
        require(!ls.augment.com.StatusBarLayoutSpec.parse("clock,1001,500").valid,
                "out-of-bounds normalized coordinate rejected");
        ls.augment.com.StatusBarLayoutSpec.ParseResult hidden = ls.augment.com.StatusBarLayoutSpec.parse("slot.wifi,800,500,hidden,1.25");
        require(hidden.valid && ls.augment.com.StatusBarLayoutSpec.parse(hidden.spec.serialize()).valid,
                "hidden and scaled legacy icon round-trips");
        require(!ls.augment.com.StatusBarLayoutSpec.parse("clock,120,500,NaN").valid, "non-finite scale rejected");
        ls.augment.com.StatusBarGridSpec grid = ls.augment.com.StatusBarGridSpec.defaults();
        require(ls.augment.com.StatusBarGridSpec.parse(grid.serialize()) != null, "grid round trip");
        require(ls.augment.com.StatusBarGridSpec.parse(grid.serialize().replace("clock,LS", "clock,X1")) == null, "unknown zone rejected");
        java.util.List<ls.augment.com.StatusBarGridLayout.Node> nodes = java.util.Arrays.asList(
                new ls.augment.com.StatusBarGridLayout.Node("clock", "LS", 0, 50, 30),
                new ls.augment.com.StatusBarGridLayout.Node("up", "L1", 1, 70, 14),
                new ls.augment.com.StatusBarGridLayout.Node("down", "L2", 1, 70, 14),
                new ls.augment.com.StatusBarGridLayout.Node("center", "CS", 0, 50, 30));
        java.util.Map<String,ls.augment.com.StatusBarGridLayout.Box> boxes =
                ls.augment.com.StatusBarGridLayout.pack(nodes, 300, 32, 0, 0, 0, 0, 2, 145, 155);
        require(boxes.get("up").x >= boxes.get("clock").x + boxes.get("clock").width,
                "spanning clock reserves both rows");
        require(boxes.get("up").y + boxes.get("up").height <= boxes.get("down").y,
                "rows do not overlap");
        for(float barWidth:new float[]{90,300,1000})for(float gap:new float[]{0,2,8}){
            java.util.Map<String,ls.augment.com.StatusBarGridLayout.Box> rows=ls.augment.com.StatusBarGridLayout.pack(
                java.util.Arrays.asList(
                    new ls.augment.com.StatusBarGridLayout.Node("cpu","R1",0,80,17),
                    new ls.augment.com.StatusBarGridLayout.Node("gpu","R2",0,100,12),
                    new ls.augment.com.StatusBarGridLayout.Node("iconTop","L1",0,70,10),
                    new ls.augment.com.StatusBarGridLayout.Node("iconBottom","L2",0,40,20)),
                barWidth,50,0,0,3,5,gap,0,0);
            close(rows.get("gpu").y-rows.get("cpu").y-rows.get("cpu").height,gap,"actual row gap after fitting");
            close(rows.get("cpu").y+rows.get("cpu").height,rows.get("iconTop").y+rows.get("iconTop").height,"global top row edge");
            close(rows.get("gpu").y,rows.get("iconBottom").y,"global bottom row edge");
        }
        require(boxes.get("center").x + boxes.get("center").width <= 145 || boxes.get("center").x >= 155,
                "center avoids camera cutout");
        for(String region:new String[]{"L","C","R"})for(float barWidth:new float[]{90,300,1000})for(boolean topLonger:new boolean[]{true,false}){
            java.util.Map<String,ls.augment.com.StatusBarGridLayout.Box> aligned=ls.augment.com.StatusBarGridLayout.pack(
                java.util.Arrays.asList(
                    new ls.augment.com.StatusBarGridLayout.Node("prefixTop",region+"1",0,topLonger?80:25,14),
                    new ls.augment.com.StatusBarGridLayout.Node("prefixBottom",region+"2",0,topLonger?25:80,14),
                    new ls.augment.com.StatusBarGridLayout.Node("notifications#0",region+"1",1,40,14),
                    new ls.augment.com.StatusBarGridLayout.Node("notifications#1",region+"2",1,20,14),
                    new ls.augment.com.StatusBarGridLayout.Node("followingTop",region+"1",2,12,14),
                    new ls.augment.com.StatusBarGridLayout.Node("followingBottom",region+"2",2,12,14)),
                barWidth,40,0,0,0,0,4,0,0);
            ls.augment.com.StatusBarGridLayout.Box upper=aligned.get("notifications#0"),lower=aligned.get("notifications#1");
            close(upper.x,lower.x,"notification rows share left edge after preceding text and width fitting");
            require(upper.x>=aligned.get("prefixTop").x+aligned.get("prefixTop").width,"upper icons do not overlap prefix");
            require(lower.x>=aligned.get("prefixBottom").x+aligned.get("prefixBottom").width,"lower icons do not overlap prefix");
            require(aligned.get("followingTop").x>=upper.x+upper.width,"following upper content does not overlap icons");
            require(aligned.get("followingBottom").x>=lower.x+lower.width,"following lower content does not overlap icons");
            close(lower.y-upper.y-upper.height,4,"notification alignment preserves row gap");
        }
        // Native sibling indicators must have their own space even when ordinary
        // icon rows and a spanning clock already fill a narrow display region.
        for(String region:new String[]{"L","C","R"})for(float width:new float[]{90,300,1216}){
            java.util.List<ls.augment.com.StatusBarGridLayout.Node> indicators=java.util.Arrays.asList(
                new ls.augment.com.StatusBarGridLayout.Node("clock",region+"S",0,180,40),
                new ls.augment.com.StatusBarGridLayout.Node("ongoing",region+"S",91,120,40),
                new ls.augment.com.StatusBarGridLayout.Node("join",region+"S",99,60,40),
                new ls.augment.com.StatusBarGridLayout.Node("notifications#0",region+"1",100,130,40),
                new ls.augment.com.StatusBarGridLayout.Node("notifications#1",region+"2",100,90,40),
                new ls.augment.com.StatusBarGridLayout.Node("systemWithFan",region+"2",200,160,40),
                new ls.augment.com.StatusBarGridLayout.Node("user",region+"S",210,50,40));
            java.util.List<ls.augment.com.StatusBarGridLayout.Box> placed=new java.util.ArrayList<>(
                ls.augment.com.StatusBarGridLayout.pack(indicators,width,107,4,4,0,0,2,0,0).values());
            require(placed.size()==indicators.size(),"every independent indicator receives a box");
            for(int i=0;i<placed.size();i++)for(int j=i+1;j<placed.size();j++){
                ls.augment.com.StatusBarGridLayout.Box a=placed.get(i),b=placed.get(j);
                require(Math.min(a.x+a.width,b.x+b.width)-Math.max(a.x,b.x)<0.001f
                    ||Math.min(a.y+a.height,b.y+b.height)-Math.max(a.y,b.y)<0.001f,
                    "native companion, icon rows and clock do not overlap");
            }
        }
        for (ls.augment.com.StatusBarGridLayout.Box b : boxes.values())
            require(b.x >= 0 && b.x+b.width <= 300 && b.y >= 0 && b.y+b.height <= 32, "packed inside bar");

        require(StatusBarMetricsFormatter.rate(1024L).equals("1.0 K/s"), "KiB rate");
        require(ls.augment.com.StatusBarNetworkDisplay.resolve("0",true)==4,"old two-row configuration retained");
        require(ls.augment.com.StatusBarNetworkDisplay.resolve("0",false)==3,"old single-row configuration retained");
        String[] modes={"↑12K","↓36K","↑12K ↓36K","↑12K\n↓36K"};
        for(int mode=1;mode<=4;mode++){
            require(ls.augment.com.StatusBarNetworkDisplay.resolve(String.valueOf(mode),mode!=4)==mode,"explicit mode overrides legacy toggle");
            require(ls.augment.com.StatusBarNetworkDisplay.format(mode,"12K","36K").equals(modes[mode-1]),"network mode output");
        }
        require(ls.augment.com.ModuleRuntimeStatus.apiVersion("version=x|api=102|pid=45").equals("102"),"actual LSPosed API parsed");
        require(ls.augment.com.ModuleRuntimeStatus.apiVersion("version=x|pid=45").isEmpty(),"missing API is not invented");
        close(StatusBarMetricsFormatter.temperatureCelsius(375), 37.5d, "battery temp");
        close(StatusBarMetricsFormatter.temperatureCelsius(45000), 45.0d, "thermal temp");
        close(StatusBarMetricsFormatter.currentMilliAmp(-2500000), -2500.0d, "current");
        close(StatusBarMetricsFormatter.voltageVolt(4000000), 4.0d, "voltage");
        close(StatusBarMetricsFormatter.powerWatt(-2500000, 4000000), 10.0d, "power");
        System.out.println("Status bar feature support checks: OK");
    }

    private static void require(boolean value, String name) {
        if (!value) throw new AssertionError(name);
    }

    private static void close(double actual, double expected, String name) {
        if (Math.abs(actual - expected) > 0.0001d) {
            throw new AssertionError(name + ": expected=" + expected + " actual=" + actual);
        }
    }
}
