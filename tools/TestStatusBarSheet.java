package ls.augment.com;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.Map;
import java.util.HashMap;

/** Real worksheet contracts: persistence, no data loss, readability and merged-cell centering. */
public final class TestStatusBarSheet {
    public static void main(String[] args) {
        persistence(); sparseTracks(); edits(); migration(); geometry(); outputAndExtremes(); adversarialGeometry();
        System.out.println("Status-bar sheet: SS1/SS2, sparse canvas, fixed paper clipping, immutable edits and 1000 merged geometry cases passed");
    }
    private static void persistence() {
        require(StatusBarSheetSpec.parse("") == null && StatusBarSheetSpec.parse(null) == null, "empty means legacy/unconfigured");
        require(StatusBarSheetSpec.parseResult("").valid, "empty is not corrupt");
        StatusBarSheetSpec original = StatusBarSheetSpec.empty(2, 3)
                .withCell(new StatusBarSheetSpec.Cell(0, 0, 2, 1, "text", 12, 1, 2, 0, 0, "center", "中文;逗号, / ♥ 😀\n下一行", ""))
                .withCell(new StatusBarSheetSpec.Cell(0, 1, 2, 1, "image", 14, 0, 0, 0, 0, "right", "图片", "a".repeat(64)));
        String saved = original.serialize();
        StatusBarSheetSpec restored = StatusBarSheetSpec.parse(saved);
        require(restored != null && saved.equals(restored.serialize()), "canonical round trip");
        require(original.cellAt(1, 0).text.equals(restored.cellAt(0, 0).text), "Unicode delimiters and newlines preserved");
        require(restored.cellAt(1, 1).image.equals("a".repeat(64)), "asset hash preserved");
        reject(() -> original.rowOverrides.clear(), "sparse tracks immutable");
        float[] heights = {16, 24}, widths = {20, 30}; List<StatusBarSheetSpec.Cell> input = new ArrayList<>();
        input.add(cell(0, 0, "wifi"));
        StatusBarSheetSpec independent = new StatusBarSheetSpec(2, 2, heights, widths, 2, 2, input);
        heights[0] = Float.NaN; widths[0] = -50; input.clear();
        require(independent.rowHeight(0) == 16 && independent.colWidth(0) == 20 && independent.cells.size() == 1,
                "constructor owns array/list copies");
        reject(() -> independent.cells.clear(), "cell list immutable");
        String valid = StatusBarSheetSpec.defaults().serialize();
        require(StatusBarSheetSpec.parse(valid.replace("SS2", "SS9")) == null, "unknown version");
        require(StatusBarSheetSpec.parse(valid + ";") == null, "trailing broken cell");
        require(StatusBarSheetSpec.parse(valid.replace("2,8,15", "2,8,NaN")) == null, "nonfinite dimensions");
        require(StatusBarSheetSpec.parse(saved.replace("5Lit5paH", "!!!!")) == null, "bad URL-safe encoding rejected");
        reject(() -> new StatusBarSheetSpec.Cell(0, 0, 1, 1, "image", 14, 0, 0, 0, 0, "center", "", "/sdcard/icon.png"), "paths not asset references");
        require(cell(0, 0, "wifi").withSize(.01f).size == .01f, "small positive sizes remain editable");
        reject(() -> cell(0, 0, "text").withSize(0), "size must be positive");
        reject(() -> new StatusBarSheetSpec.Cell(0, 0, 1, 1, "text", 12, 0, 0, 0, 0, "center", "\ud800", ""), "invalid Unicode cannot change on save");
        require(StatusBarSheetSpec.defaults().height() == 32, "defaults fit 32 dp native height");
        StatusBarSheetSpec old = StatusBarSheetSpec.parse("SS1;2,2,2,4;16,24;24,36;0,0,2,2,wifi,14,3,2,0,0,center,,");
        require(old != null && old.rowHeight(1) == 24 && old.colWidth(1) == 36 && old.cellAt(1, 1).content.equals("wifi"), "SS1 preserves old geometry");
        require(old.serialize().startsWith("SS2;") && old.outputScale == 1 && old.fitMode.equals("manual"), "legacy editing writes SS2");
        reject(() -> StatusBarSheetSpec.empty(1,1).withCell(new StatusBarSheetSpec.Cell(0,0,1,1,"text",12,0,0,0,0,"center","x".repeat(50000),"")), "configuration capacity enforced before save");
        require(!StatusBarSheetSpec.parseResult("x".repeat(StatusBarSheetSpec.MAX_SERIALIZED_BYTES + 1)).valid, "oversized serialized config rejected");
    }
    private static void sparseTracks() {
        int last = Integer.MAX_VALUE - 1;
        StatusBarSheetSpec huge = StatusBarSheetSpec.empty(Integer.MAX_VALUE, Integer.MAX_VALUE).withRowHeight(last, 25).withColWidth(last, 39).withCell(cell(last, last, "text"));
        require(huge.serialize().length() < 200 && huge.rowOverrides.size() == 1 && huge.colOverrides.size() == 1 && huge.cells.size() == 1, "maximum logical dimensions stay sparse");
        require(StatusBarSheetSpec.parse(huge.serialize()) != null, "maximum logical dimensions round trip");
        require(huge.rowStart(last) == (double) last * 17 && huge.heightExact() == (double) last * 17 + 25, "remote sparse track dimensions exact");
        require(huge.rowAt(huge.rowStart(last)) == last && huge.colAt(huge.colStart(last)) == last, "inverse lookup reaches last integer track");
        require(huge.rowAt(Double.POSITIVE_INFINITY) == last && huge.colAt(-10) == 0, "viewport inverse lookup clamps");
        StatusBarSheetSpec dimensions = StatusBarSheetSpec.empty(4, 4).withRowHeight(1, 30).withColWidth(2, 40).withDefaultRowHeight(30).withDefaultColWidth(40).withDefaultRowHeight(20).withDefaultColWidth(50);
        require(dimensions.rowHeight(1) == 30 && dimensions.rowHeight(0) == 20 && dimensions.colWidth(2) == 40 && dimensions.colWidth(0) == 50, "explicit sizes survive matching then changing defaults");
        dimensions = StatusBarSheetSpec.parse(dimensions.serialize()).withoutRowHeight(1).withoutColWidth(2);
        require(dimensions.rowHeight(1) == 20 && dimensions.colWidth(2) == 50, "remove override follows default");
        Map<Integer, Float> mutable = new HashMap<>(); mutable.put(1, 20f);
        StatusBarSheetSpec isolated = new StatusBarSheetSpec(2, 2, 15, 26, mutable, Collections.emptyMap(), 2, 2, Collections.emptyList(), 1, 0, 0, "manual");
        mutable.put(1, Float.NaN); require(isolated.rowHeight(1) == 20, "map input copied");
        StatusBarSheetSpec dynamic = StatusBarSheetSpec.empty(1, 1).withDefaultRowHeight(Float.MAX_VALUE).withRowHeight(0, 1).withDefaultColWidth(Float.MAX_VALUE).withColWidth(0, 2).withGaps(0, 0);
        require(dynamic.heightExact() == 1 && dynamic.widthExact() == 2, "small overrides avoid catastrophic default subtraction");
        String[] names = {"A", "Z", "AA", "AZ", "BA", "ZZ", "AAA"}; int[] columns = {0, 25, 26, 51, 52, 701, 702};
        for (int i = 0; i < names.length; i++) {
            require(StatusBarSheetSpec.columnName(columns[i]).equals(names[i]), "Excel column " + names[i]);
            StatusBarSheetSpec.Address a = StatusBarSheetSpec.parseAddress(" " + names[i].toLowerCase() + "123 ");
            require(a.col == columns[i] && a.row == 122 && a.toString().equals(names[i] + "123"), "Excel multi-digit address");
        }
        StatusBarSheetSpec.Address max = StatusBarSheetSpec.parseAddress(StatusBarSheetSpec.address(last, last)); require(max.row == last && max.col == last, "maximum integer address round trip");
        StatusBarSheetSpec.Address aa12 = StatusBarSheetSpec.parseAddress("AA12"); require(aa12.row == 11 && aa12.col == 26, "AA12 address");
        for (String invalid : new String[]{"A0", "A01", "A-1", "A", "A2147483648", "ZZZZZZZZZZ1", "A1B"}) reject(() -> StatusBarSheetSpec.parseAddress(invalid), "invalid address " + invalid);
        int limit = Integer.MAX_VALUE;
        StatusBarSheetSpec giant = StatusBarSheetSpec.empty(limit, limit).merge(0, 0, limit, limit).withCell(cell(limit / 2, limit / 2, "wifi"));
        require(giant.cells.size() == 5 && giant.cellAt(limit - 1, limit - 1) != null && StatusBarSheetSpec.parse(giant.serialize()) != null, "giant blank merged rectangle splits into four sparse residuals");
        StatusBarSheetSpec many = StatusBarSheetSpec.empty(30, 1); for (int row = 0; row < 30; row++) many = many.withCell(cell(row, 0, row % 2 == 0 ? "text" : "image"));
        require(many.cells.size() == 30, "more than 24 cells allowed");
    }
    private static void edits() {
        StatusBarSheetSpec before = StatusBarSheetSpec.empty(2, 4).withCell(cell(1, 1, "wifi"));
        String snapshot = before.serialize();
        StatusBarSheetSpec merged = before.merge(0, 1, 2, 1);
        require(merged.cells.size() == 1 && merged.cellAt(0, 1) == merged.cellAt(1, 1), "vertical merge has one anchor");
        require(merged.cellAt(0, 1).content.equals("wifi"), "merge upward preserves lower icon");
        require(before.serialize().equals(snapshot), "edits do not mutate previous snapshot");
        StatusBarSheetSpec split = merged.unmerge(1, 1);
        require(split.cellAt(0, 1).rowSpan == 1 && split.cellAt(1, 1) == null, "unmerge preserves anchor and frees second row");
        StatusBarSheetSpec occupied = before.withCell(cell(0, 1, "bluetooth"));
        reject(() -> occupied.merge(0, 1, 2, 1), "merge cannot lose other live content");
        StatusBarSheetSpec cleared = occupied.withoutCell(0, 1).merge(0, 1, 2, 1);
        require(cleared.cellAt(0, 1).content.equals("wifi"), "clear allows safe merge");
        reject(() -> before.resize(1, 2), "shrink refuses live content loss");
        require(before.withoutCell(1, 1).resize(1, 2).cells.isEmpty(), "clear permits shrink");
        StatusBarSheetSpec blank = StatusBarSheetSpec.empty(2, 4).merge(0, 1, 2, 3).resize(1, 2);
        require(blank.cellAt(0, 1).rowSpan == 1 && blank.cellAt(0, 1).colSpan == 1, "empty merged areas clip safely when shrinking");
        StatusBarSheetSpec shifted = StatusBarSheetSpec.empty(2, 4).withCell(cell(0, 0, "wifi").withSpan(1, 2)).move(0, 0, 0, 1);
        require(shifted.cells.size() == 1 && shifted.cellAt(0, 0) == null && shifted.cellAt(0, 2).content.equals("wifi"), "move into own covered cell does not duplicate");
        StatusBarSheetSpec swapped = before.withCell(cell(0, 0, "bluetooth")).move(1, 1, 0, 0);
        require(swapped.cellAt(0, 0).content.equals("wifi") && swapped.cellAt(1, 1).content.equals("bluetooth"), "occupied destination swaps complete cells");
        reject(() -> before.withCell(cell(0, 0, "wifi")), "native content cannot be duplicated");
        StatusBarSheetSpec repeated = StatusBarSheetSpec.empty(2, 2).withCell(cell(0, 0, "text")).withCell(cell(1, 0, "text"))
                .withCell(cell(0, 1, "image")).withCell(cell(1, 1, "image"));
        require(repeated.cells.size() == 4, "text and image can repeat");
        require(StatusBarSheetSpec.empty(4, 30).cols == 30, "no fixed dimension cap");
        reject(() -> StatusBarSheetSpec.empty(0, 2), "dimensions positive");
        reject(() -> StatusBarSheetSpec.empty(2, 2).withCell(cell(0, 1, "wifi").withSpan(1, 2)), "spans cannot exceed columns");
    }
    private static void migration() {
        StatusBarGridSpec legacy = StatusBarGridSpec.defaults(); String unchanged = legacy.serialize();
        StatusBarSheetSpec.MigrationResult result = StatusBarSheetSpec.fromGrid(legacy);
        require(result.valid && result.spec != null && legacy.serialize().equals(unchanged), "legacy remains unchanged");
        Set<String> expected = new HashSet<>(), actual = new HashSet<>();
        for (String id : StatusBarGridSpec.IDS) if (legacy.get(id).visible) expected.add(id);
        for (StatusBarSheetSpec.Cell c : result.spec.cells) actual.add(c.content);
        require(expected.equals(actual), "migration retains all visible content");
        for (String id : StatusBarGridSpec.IDS) legacy = legacy.with(id, new StatusBarGridSpec.Item("LS", 1, 13, true));
        StatusBarSheetSpec.MigrationResult crowded = StatusBarSheetSpec.fromGrid(legacy);
        require(crowded.valid && crowded.spec.cells.size() == StatusBarGridSpec.IDS.length && crowded.spec.cols > 12, "crowded migration grows without dropping content");
        StatusBarGridSpec low = StatusBarGridSpec.defaults().with("cpu", new StatusBarGridSpec.Item("C1", 0, 6, true));
        StatusBarSheetSpec.MigrationResult upgraded = StatusBarSheetSpec.fromGrid(low);
        require(upgraded.valid && !upgraded.warning.isEmpty(), "readability upgrade is explicitly reported");
        for (StatusBarSheetSpec.Cell c : upgraded.spec.cells) if (c.content.equals("cpu")) require(c.size == low.get("cpu").size, "migration preserves original chosen size");
    }
    private static void geometry() {
        StatusBarSheetSpec.Cell merged = new StatusBarSheetSpec.Cell(0, 0, 2, 2, "wifi", 14, 3, 2, 0, 0, "center", "", "");
        StatusBarSheetSpec spec = new StatusBarSheetSpec(2, 2, new float[]{16, 24}, new float[]{24, 36}, 2, 4, Collections.singletonList(merged));
        StatusBarSheetLayout.Result placed = layout(spec, 100, 42, 1, 14, 14, 0, 0);
        require(placed.valid, placed.error);
        StatusBarSheetLayout.Placement p = placed.get("A1");
        near(p.cellBox.width, 64, "merged column includes gap"); near(p.cellBox.height, 42, "merged row includes gap");
        near(p.contentBox.centerY(), 21, "unequal merged rows use exact total center, not row center");
        near(p.contentBox.centerX(), 32, "merged horizontal center");
        near(p.contentBox.width, 14, "actual width not shrunk");
        StatusBarSheetLayout.Result scaled = layout(spec, 300, 126, 3, 42, 42, 0, 0);
        require(scaled.valid, scaled.error); near(scaled.get("A1").contentBox.centerY(), 63, "density affects exact center");
        StatusBarSheetLayout.Result taller = layout(spec, 100, 60, 1, 14, 14, 0, 0);
        near(taller.get("A1").contentBox.centerY(), 21, "fixed paper does not recenter or stretch canvas");
        require(layout(spec, 63, 42, 1, 14, 14, 0, 0).valid, "wide geometry clips");
        require(layout(spec, 100, 41, 1, 14, 14, 0, 0).valid, "tall geometry clips");
        require(layout(spec, 100, 42, 1, 60, 14, 0, 0).valid, "content beyond padding remains editable");
        require(layout(spec, 100, 42, 1, 14, 39, 0, 0).valid, "vertical excess content remains editable");
        require(layout(spec, 100, 42, 1, 14, 14, 30, 35).valid, "cutout clips instead of fallback");
        require(layout(spec, 100, 42, 1, 14, 14, 0, 20).valid, "cell may cross cutout when content remains clear");
        StatusBarSheetLayout.Bounds inset = new StatusBarSheetLayout.Bounds(10, 7, 100, 42, 1, 0, 0);
        StatusBarSheetLayout.Result offsetBounds = StatusBarSheetLayout.layout(spec, Collections.singletonList(new StatusBarSheetLayout.Measure("A1", 14, 14)), inset);
        near(offsetBounds.get("A1").contentBox.centerX(), 42, "real horizontal inset"); near(offsetBounds.get("A1").contentBox.centerY(), 28, "real vertical inset");
        StatusBarSheetLayout.Bounds shortHole = new StatusBarSheetLayout.Bounds(0, 0, 100, 42, 1,
                Collections.singletonList(new StatusBarSheetLayout.Box(30, 0, 5, 5)));
        require(StatusBarSheetLayout.layout(spec, Collections.singletonList(new StatusBarSheetLayout.Measure("A1", 14, 14)), shortHole).valid,
                "cutout y extent is honored");
        StatusBarSheetLayout.Bounds actualHole = new StatusBarSheetLayout.Bounds(0, 0, 100, 42, 1,
                Collections.singletonList(new StatusBarSheetLayout.Box(30, 17, 5, 5)));
        StatusBarSheetLayout.Result cut = StatusBarSheetLayout.layout(spec, Collections.singletonList(new StatusBarSheetLayout.Measure("A1", 14, 14)), actualHole);
        require(cut.valid && cut.get("A1").clipped && cut.get("A1").visibleBoxes.size() == 4, "actual cutout rectangle creates four visible fragments");
        float area = 0; for (StatusBarSheetLayout.Box box : cut.get("A1").visibleBoxes) area += box.width * box.height;
        near(area, 196 - 25, "cutout exact area removed");
        require(StatusBarSheetLayout.layout(spec, Collections.emptyList(), actualHole).valid, "inactive native icon is empty rather than fake");
        require(layout(spec, 100, 42, 1, 0, 0, 30, 35).valid, "zero-sized inactive measure allowed");
        for (String align : new String[]{"left", "center", "right"}) {
            StatusBarSheetSpec.Cell c = new StatusBarSheetSpec.Cell(0, 0, 2, 2, "wifi", 14, 3, 2, 0, 0, align, "", "");
            StatusBarSheetLayout.Result aligned = layout(spec.withCell(c), 100, 42, 1, 14, 14, 0, 0);
            near(aligned.get("A1").contentBox.x, align.equals("left") ? 3 : align.equals("right") ? 47 : 25, "alignment " + align);
        }
        StatusBarSheetSpec.Cell offset = new StatusBarSheetSpec.Cell(0, 0, 2, 2, "wifi", 14, 3, 2, 10, -5, "center", "", "");
        StatusBarSheetLayout.Result shifted = layout(spec.withCell(offset), 100, 42, 1, 14, 14, 0, 0);
        require(shifted.valid, shifted.error); near(shifted.get("A1").contentBox.centerY(), 16, "vertical offset applies after merged centering");
        near(shifted.get("A1").contentBox.centerX(), 42, "horizontal offset applies after alignment");
        StatusBarSheetSpec.Cell excessive = new StatusBarSheetSpec.Cell(0, 0, 2, 2, "wifi", 14, 3, 2, 30, 0, "center", "", "");
        require(layout(spec.withCell(excessive), 100, 42, 1, 14, 14, 0, 0).valid, "offset outside cell remains editable");
        require(!layout(spec, 100, 42, 1, Float.NaN, 14, 0, 0).valid, "nonfinite measure");
        require(!layout(spec, 100, 42, 0, 14, 14, 0, 0).valid, "invalid density");
    }
    private static void outputAndExtremes() {
        StatusBarSheetSpec base = StatusBarSheetSpec.empty(4, 30).withGaps(0, 0).withDefaultRowHeight(20).withDefaultColWidth(10).withCell(cell(0, 0, "wifi"));
        StatusBarSheetLayout.Result manual = layout(base.withOutput(2, 5, 7, "manual"), 300, 80, 1, 14, 14, 0, 0);
        require(manual.valid && manual.outputScale == 2, "manual output scale independent of editor");
        near(manual.get("A1").contentBox.centerX(), 15, "output x after scale"); near(manual.get("A1").contentBox.centerY(), 27, "output y after scale");
        near(manual.get("A1").rawContentBox.centerY(), 10, "unscaled raw geometry");
        StatusBarSheetLayout.Result width = layout(base.withOutput(9, 0, 0, "width"), 150, 20, 1, 14, 14, 0, 0);
        require(width.valid && !width.warning.isEmpty(), "4 by 30 width-fit clips vertically"); near(width.outputScale, .5f, "width-fit ignores manual scale");
        StatusBarSheetLayout.Result page = layout(base.withOutput(9, 0, 0, "page"), 150, 20, 1, 14, 14, 0, 0); near(page.outputScale, .25f, "page-fit shared scale");
        StatusBarSheetSpec roundTrip = StatusBarSheetSpec.parse(base.withOutput(1.25f, -4, 7, "page").serialize());
        require(roundTrip.outputScale == 1.25f && roundTrip.outputOffsetX == -4 && roundTrip.outputOffsetY == 7 && roundTrip.fitMode.equals("page"), "output parameters persist");
        StatusBarSheetLayout.Result crop = layout(base, 8, 12, 1, 14, 14, 0, 0);
        require(crop.valid && crop.get("A1").clipped, "overflow clips without fallback"); near(crop.get("A1").visibleBox.width, 8, "paper right and left crop"); near(crop.get("A1").visibleBox.height, 9, "paper bottom crop");
        StatusBarSheetLayout.Result hidden = layout(base.withOutput(1, 1000, 0, "manual"), 100, 30, 1, 14, 14, 0, 0);
        require(hidden.valid && hidden.get("A1").visibleBox != null && hidden.get("A1").visibleBoxes.isEmpty(), "off-paper content has safe empty visibility");
        int max = Integer.MAX_VALUE;
        StatusBarSheetSpec huge = StatusBarSheetSpec.empty(max, max).withDefaultRowHeight(Float.MAX_VALUE).withDefaultColWidth(Float.MAX_VALUE).withGaps(0, 0).withCell(cell(0, 0, "text")).withCell(cell(max - 1, max - 1, "image")).withOutput(1, 0, 0, "page");
        StatusBarSheetLayout.Bounds paper = new StatusBarSheetLayout.Bounds(0, 0, 100, 30, 1, 0, 0);
        StatusBarSheetLayout.Result tiny = StatusBarSheetLayout.layout(huge, Arrays.asList(new StatusBarSheetLayout.Measure("A1", 14, 14), new StatusBarSheetLayout.Measure(StatusBarSheetSpec.address(max - 1, max - 1), 14, 14)), paper);
        require(tiny.valid && tiny.outputScaleExact > 0 && tiny.outputScaleExact < Float.MIN_VALUE, "extreme sparse canvas retains subfloat effective scale");
        for (StatusBarSheetLayout.Placement p : tiny.placements.values()) finiteBox(p.cellBox, "tiny-fit boxes finite");
        StatusBarSheetSpec large = StatusBarSheetSpec.empty(2, 2).withCell(cell(0, 0, "wifi")).withCell(cell(1, 1, "text").withSize(Float.MAX_VALUE)).withOutput(Float.MAX_VALUE, 0, 0, "manual");
        StatusBarSheetLayout.Result expanded = StatusBarSheetLayout.layout(large, Arrays.asList(new StatusBarSheetLayout.Measure("A1", 14, 14), new StatusBarSheetLayout.Measure("B2", Float.MAX_VALUE, Float.MAX_VALUE)), paper);
        require(expanded.valid, "finite input products exceeding float do not invalidate sheet");
        for (StatusBarSheetLayout.Placement p : expanded.placements.values()) { finiteBox(p.contentBox, "huge output finite"); for (StatusBarSheetLayout.Box box : p.visibleBoxes) { finiteBox(box, "visible output finite"); require(box.x >= 0 && box.y >= 0 && box.x + box.width <= 100.001f && box.y + box.height <= 30.001f, "visible geometry stays on paper"); } }
        StatusBarSheetSpec remote = StatusBarSheetSpec.empty(max, max).withCell(cell(0, 0, "wifi")).withCell(cell(max - 1, max - 1, "text").withSize(Float.MAX_VALUE));
        StatusBarSheetLayout.Result retained = StatusBarSheetLayout.layout(remote, Arrays.asList(new StatusBarSheetLayout.Measure("A1", 14, 14), new StatusBarSheetLayout.Measure(StatusBarSheetSpec.address(max - 1, max - 1), 14, 14)), paper);
        require(retained.valid && !retained.get("A1").visibleBoxes.isEmpty() && retained.get(StatusBarSheetSpec.address(max - 1, max - 1)).visibleBoxes.isEmpty(), "remote cell does not suppress visible local icon");
    }
    private static void finiteBox(StatusBarSheetLayout.Box b, String message) { require(Float.isFinite(b.x) && Float.isFinite(b.y) && Float.isFinite(b.width) && Float.isFinite(b.height), message); }
    private static void adversarialGeometry() {
        Random random = new Random(20400);
        for (int trial = 0; trial < 1000; trial++) {
            float upper = 12 + random.nextInt(40), lower = 12 + random.nextInt(40), gap = random.nextInt(21), density = .75f + random.nextInt(17) / 4f;
            float cw1 = 24 + random.nextInt(50), cw2 = 24 + random.nextInt(50), columnGap = random.nextInt(21);
            StatusBarSheetSpec spec = new StatusBarSheetSpec(2, 2, new float[]{upper, lower}, new float[]{cw1, cw2}, gap, columnGap,
                    Collections.singletonList(cell(0, 0, "wifi").withSpan(2, 2)));
            StatusBarSheetLayout.Result result = layout(spec, (cw1 + cw2 + columnGap) * density, (upper + lower + gap) * density,
                    density, 14 * density, 14 * density, 0, 0);
            require(result.valid, result.error);
            near(result.get("A1").contentBox.centerY(), (upper + lower + gap) * density / 2, "random unequal row center");
            near(result.get("A1").contentBox.width, 14 * density, "random no shrink");
            require(StatusBarSheetSpec.parse(spec.serialize()) != null, "random format remains valid");
        }
    }
    private static StatusBarSheetSpec.Cell cell(int r, int c, String content) { return StatusBarSheetSpec.Cell.empty(r, c).withContent(content); }
    private static StatusBarSheetLayout.Result layout(StatusBarSheetSpec sheet, float width, float height, float density, float contentWidth, float contentHeight, float cutLeft, float cutRight) {
        return StatusBarSheetLayout.layout(sheet, Collections.singletonList(new StatusBarSheetLayout.Measure("A1", contentWidth, contentHeight)),
                new StatusBarSheetLayout.Bounds(0, 0, width, height, density, cutLeft, cutRight));
    }
    private static void require(boolean condition, String message) { if (!condition) throw new AssertionError(message); }
    private static void near(float actual, float expected, String message) { require(Math.abs(actual - expected) < .001f, message + ": " + actual + " != " + expected); }
    private static void reject(Runnable operation, String message) {
        try { operation.run(); } catch (IllegalArgumentException | UnsupportedOperationException expected) { return; }
        throw new AssertionError(message);
    }
}
