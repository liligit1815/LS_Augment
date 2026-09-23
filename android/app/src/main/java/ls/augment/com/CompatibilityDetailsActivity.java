package ls.augment.com;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import org.json.JSONArray;
import org.json.JSONObject;

import io.github.libxposed.service.XposedService;

/** Checks metadata and the framework's public read APIs; never requests scope or runs su. */
public final class CompatibilityDetailsActivity extends Activity {
    public static final String EXTRA_SECTION = "section";
    public static final String SECTION_FRAMEWORK = "framework";
    public static final String SECTION_VERSION = "version";
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable serviceChanged = this::refresh;
    private UiKit ui;
    private LinearLayout results;
    private Button refreshButton;
    private TextView checkedAt;
    private Future<?> pending;
    private boolean loading, refreshAgain;
    private int generation;
    private String section;
    private ScrollView scroll;
    private int desiredScrollY;
    private boolean restorePending;
    private ViewTreeObserver.OnPreDrawListener restoreLayout;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        String requested = state == null ? getIntent().getStringExtra(EXTRA_SECTION)
                : state.getString(EXTRA_SECTION);
        section = SECTION_FRAMEWORK.equals(requested) ? SECTION_FRAMEWORK : SECTION_VERSION;
        desiredScrollY = state == null ? 0 : Math.max(0, state.getInt("scroll_y", 0));
        restorePending = state != null;
        ui = new UiKit(this);
        LinearLayout page = ui.detailPage(SECTION_FRAMEWORK.equals(section) ? "框架兼容性" : "当前版本兼容性", null);
        page.setTag("compatibility-section:" + section);
        page.setPadding(ui.dp(16), ui.dp(8), ui.dp(16), ui.dp(24));
        if (page.getParent() instanceof ScrollView) scroll = (ScrollView) page.getParent();
        LinearLayout intro = ui.card();
        intro.setPadding(ui.dp(12), ui.dp(12), ui.dp(12), ui.dp(12));
        intro.addView(ui.featureTitle("只读检查", SECTION_FRAMEWORK.equals(section)
                ? "读取框架连接、版本、API 和可用的当前进程加载证据。已连接或作用域已勾选不等于当前模块已加载。刷新不会申请 Root、写入作用域、启用功能或重启设备。"
                : "读取本机系统与目标应用版本，并与当前模块随安装包收录的基准核对。已安装、版本相同都不能证明实际功能已经适配。刷新不会改变配置。"));
        intro.addView(ui.text(SECTION_FRAMEWORK.equals(section) ? "连接、API 与加载状态分别核对。"
                : "当前模块：" + BuildConfig.VERSION_NAME + "\n系统与软件版本分别核对。", 12, ui.muted, false), ui.margins(0, 6, 0, 0));
        page.addView(intro, ui.wrap());
        refreshButton = ui.tonalButton("刷新检查");
        refreshButton.setTag("compatibility-refresh");
        refreshButton.setMinimumHeight(ui.dp(48));
        refreshButton.setOnClickListener(view -> refresh());
        page.addView(refreshButton, ui.margins(0, 8, 0, 0));
        checkedAt = ui.text("正在读取当前环境…", 11.5f, ui.muted, false);
        page.addView(checkedAt, ui.margins(0, 6, 0, 0));
        results = new LinearLayout(this);
        results.setTag("compatibility-results");
        results.setOrientation(LinearLayout.VERTICAL);
        page.addView(results, ui.margins(0, 8, 0, 0));
        if (SECTION_FRAMEWORK.equals(section)) ModuleScopeService.addListener(serviceChanged);
    }

    @Override protected void onResume() { super.onResume(); refresh(); }

    private void refresh() {
        if (isFinishing() || isDestroyed()) return;
        if (loading) { refreshAgain = true; return; }
        if (!restorePending && scroll != null) desiredScrollY = scroll.getScrollY();
        loading = true;
        refreshButton.setEnabled(false);
        refreshButton.setText("正在检查…");
        int request = ++generation;
        Context context = getApplicationContext();
        WeakReference<CompatibilityDetailsActivity> owner = new WeakReference<>(this);
        Handler handler = main;
        String selectedSection = section;
        pending = worker.submit(() -> {
            CompatibilityReport report;
            try { report = inspect(context, selectedSection); }
            catch (RuntimeException unavailable) {
                List<CompatibilityReport.Item> problem = Arrays.asList(item("本次检查",
                        CompatibilityReport.State.UNAVAILABLE, "读取未完成", error(unavailable)));
                report = new CompatibilityReport(System.currentTimeMillis(),
                        SECTION_FRAMEWORK.equals(selectedSection) ? problem : new ArrayList<>(),
                        SECTION_VERSION.equals(selectedSection) ? problem : new ArrayList<>(), new ArrayList<>());
            }
            if (Thread.currentThread().isInterrupted()) return;
            CompatibilityReport completed = report;
            handler.post(() -> {
                CompatibilityDetailsActivity activity = owner.get();
                if (activity == null || activity.isDestroyed() || activity.isFinishing()
                        || request != activity.generation) return;
                activity.loading = false;
                activity.refreshButton.setEnabled(true);
                activity.refreshButton.setText("刷新检查");
                activity.render(completed);
                if (activity.refreshAgain) { activity.refreshAgain = false; activity.refresh(); }
            });
        });
    }

    private void render(CompatibilityReport report) {
        results.removeAllViews();
        checkedAt.setText("检查时间：" + DateFormat.getDateTimeInstance(DateFormat.SHORT,
                DateFormat.MEDIUM).format(new Date(report.checkedAt)));
        if (SECTION_FRAMEWORK.equals(section)) renderGroup("框架兼容性", report.framework);
        else {
            renderGroup("系统兼容性", report.system);
            renderGroup("软件适配情况", report.software);
        }
        restoreScrollAfterLayout();
    }

    private void renderGroup(String title, List<CompatibilityReport.Item> items) {
        if (items.isEmpty()) return;
        TextView heading = ui.text(title, 13, ui.text, true);
        heading.setAccessibilityHeading(true);
        results.addView(heading, ui.margins(0, 8, 0, 8));
        for (CompatibilityReport.Item value : items) {
            LinearLayout card = ui.card();
            card.setPadding(ui.dp(12), ui.dp(12), ui.dp(12), ui.dp(12));
            card.addView(ui.text(value.title, 12.5f, ui.text, true));
            int color = value.state == CompatibilityReport.State.MATCH ? ui.cyan
                    : value.state == CompatibilityReport.State.MISMATCH ? ui.danger : ui.warning;
            card.addView(ui.text(value.summary, 12, color, true), ui.margins(0, 5, 0, 0));
            if (!value.detail.isEmpty()) {
                TextView detail = ui.text(value.detail, 11.5f, ui.muted, false);
                detail.setTextIsSelectable(true);
                card.addView(detail, ui.margins(0, 6, 0, 0));
            }
            results.addView(card, ui.margins(0, 0, 0, 8));
        }
    }

    /** Full read-only report retained for callers that explicitly request all checks. */
    public static CompatibilityReport inspect(Context context) { return inspect(context, null); }

    /** A detail page only reads its own category; null requests the complete report. */
    public static CompatibilityReport inspect(Context context, String section) {
        List<CompatibilityReport.Item> framework = new ArrayList<>();
        List<CompatibilityReport.Item> system = new ArrayList<>();
        List<CompatibilityReport.Item> software = new ArrayList<>();
        if (section == null || SECTION_FRAMEWORK.equals(section)) inspectFramework(context, framework);
        if (SECTION_FRAMEWORK.equals(section)) {
            return new CompatibilityReport(System.currentTimeMillis(), framework, system, software);
        }
        JSONObject baseline = new JSONObject();
        String baselineError = "";
        try (InputStream input = context.getAssets().open("redmagic-baseline.json")) {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int count;
            while ((count = input.read(buffer)) != -1) bytes.write(buffer, 0, count);
            baseline = new JSONObject(new String(bytes.toByteArray(), StandardCharsets.UTF_8));
        } catch (Exception unavailable) { baselineError = error(unavailable); }
        JSONObject build = baseline.optJSONObject("build");
        String expectedModel = property(build, "ro.product.model");
        String expectedRom = property(build, "ro.build.display.id");
        String expectedFingerprint = property(build, "ro.build.fingerprint");
        int expectedSdk = integer(property(build, "ro.build.version.sdk"));
        boolean systemMatches = CompatibilityReport.systemMatches(Build.MODEL,
                Build.VERSION.SDK_INT, Build.DISPLAY, Build.FINGERPRINT, expectedModel,
                expectedSdk, expectedRom, expectedFingerprint);
        String device = "品牌：" + Build.BRAND + " · " + Build.MANUFACTURER + "\n型号：" + Build.MODEL
                + "\n系统版本：" + Build.DISPLAY + "\nAndroid：" + Build.VERSION.RELEASE
                + "（API " + Build.VERSION.SDK_INT + "）\n安全补丁：" + Build.VERSION.SECURITY_PATCH;
        String recorded = expectedModel.isEmpty() ? "基准读取未完成：" + baselineError
                : "项目基准：" + expectedModel + " · " + expectedRom + " · Android API " + expectedSdk;
        system.add(item("设备与系统", systemMatches ? CompatibilityReport.State.MATCH
                : CompatibilityReport.State.NEEDS_VERIFICATION,
                systemMatches ? "与已记录系统基准一致" : "当前系统需要单独验证",
                device + "\n" + recorded + "\n系统标识一致不代表全部功能已通过本次检查。"));
        system.add(item("系统构建", systemMatches ? CompatibilityReport.State.MATCH
                : CompatibilityReport.State.NEEDS_VERIFICATION,
                systemMatches ? "构建指纹与基准一致" : "构建指纹需要核对",
                "当前：" + Build.FINGERPRINT + "\n基准："
                        + (expectedFingerprint.isEmpty() ? "未读取到记录" : expectedFingerprint)));
        boolean arm64 = Arrays.asList(Build.SUPPORTED_ABIS).contains("arm64-v8a");
        system.add(item("运行架构", arm64 ? CompatibilityReport.State.MATCH
                : CompatibilityReport.State.MISMATCH, arm64 ? "提供 arm64 运行环境"
                : "原生功能所需架构不匹配", "当前架构：" + String.join("、", Build.SUPPORTED_ABIS)
                        + "\n极速连点等原生功能使用 arm64 库；架构匹配仍需对应功能专项验证。"));
        JSONObject packages = baseline.optJSONObject("packages");
        for (String pkg : HookTargetRegistry.packages()) {
            if (Thread.currentThread().isInterrupted()) break;
            if ("system".equals(pkg)) continue; // This process is covered by the system section.
            software.add(inspectApplication(context, pkg, packages, systemMatches, baselineError));
        }
        return new CompatibilityReport(System.currentTimeMillis(), framework, system, software);
    }

    private static void inspectFramework(Context context, List<CompatibilityReport.Item> items) {
        int requiredApi = -1, targetApi = -1;
        try (ZipFile apk = new ZipFile(context.getApplicationInfo().sourceDir)) {
            ZipEntry entry = apk.getEntry("META-INF/xposed/module.prop");
            if (entry == null) throw new IllegalStateException("安装包缺少框架声明");
            Properties metadata = new Properties();
            try (InputStream input = apk.getInputStream(entry)) { metadata.load(input); }
            requiredApi = integer(metadata.getProperty("minApiVersion"));
            targetApi = integer(metadata.getProperty("targetApiVersion"));
        } catch (Exception unavailable) {
            items.add(item("模块框架声明", CompatibilityReport.State.UNAVAILABLE,
                    "声明读取未完成", error(unavailable)));
        }
        XposedService service = ModuleScopeService.service();
        String requirement = requiredApi > 0 ? "当前安装包要求：Modern libxposed API "
                + requiredApi + " 起" + (targetApi > 0 ? "；目标 API " + targetApi : "")
                : "当前安装包的 API 要求未能读取";
        if (service == null) {
            items.add(item("框架连接", CompatibilityReport.State.UNAVAILABLE, "未连接框架服务",
                    "请在支持 Modern API 的框架中检查模块是否启用，再返回此页刷新。未连接不能单独证明框架未安装。"));
            items.add(item("框架 API", CompatibilityReport.State.UNAVAILABLE, "当前 API 未知", requirement));
            items.add(item("当前模块加载", CompatibilityReport.State.UNAVAILABLE, "尚无法确认当前版本已加载",
                    "模块版本：" + BuildConfig.VERSION_NAME + "\n连接状态、历史日志和作用域勾选均不能替代当前进程的加载证据。"));
            return;
        }
        try {
            String identity = service.getFrameworkName() + " " + service.getFrameworkVersion()
                    + "（" + service.getFrameworkVersionCode() + "）";
            items.add(item("框架连接", CompatibilityReport.State.MATCH, "框架服务已连接", identity));
        } catch (RuntimeException unavailable) {
            items.add(item("框架连接", CompatibilityReport.State.UNAVAILABLE, "框架信息读取失败", error(unavailable)));
        }
        try {
            int api = service.getApiVersion();
            boolean enough = requiredApi > 0 && api >= requiredApi;
            items.add(item("框架 API", requiredApi <= 0 ? CompatibilityReport.State.UNAVAILABLE
                    : enough ? CompatibilityReport.State.MATCH : CompatibilityReport.State.MISMATCH,
                    enough ? "满足模块声明的最低 API" : requiredApi <= 0 ? "模块要求未知" : "低于模块要求",
                    "框架报告 API：" + api + "\n" + requirement + "\nAPI 版本满足要求不等于 Hook 已在目标进程中生效。"));
        } catch (RuntimeException unavailable) {
            items.add(item("框架 API", CompatibilityReport.State.UNAVAILABLE, "当前 API 未知",
                    requirement + "\n" + error(unavailable)));
        }
        try {
            long installedCode = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).getLongVersionCode();
            // The bundled service 101 API has no running-target query. Only use the
            // optional public API when a service library actually exposes it; never
            // reach into its Binder or infer loading from connection/scope metadata.
            Object observed = service.getClass().getMethod("getRunningTargets").invoke(service);
            if (!(observed instanceof List<?>)) throw new IllegalStateException("框架未返回运行进程清单");
            List<?> targets = (List<?>) observed;
            int current = 0;
            StringBuilder detail = new StringBuilder("当前模块：").append(BuildConfig.VERSION_NAME)
                    .append("（").append(installedCode).append("）");
            for (Object target : targets) {
                if (target == null) continue;
                Class<?> type = target.getClass();
                int pid = ((Number) type.getMethod("getPid").invoke(target)).intValue();
                long loadedCode = ((Number) type.getMethod("getLoadedVersionCode").invoke(target)).longValue();
                Object stateValue = type.getMethod("getState").invoke(target);
                String state = stateValue instanceof Enum<?> ? ((Enum<?>) stateValue).name() : "";
                Object process = type.getMethod("getProcessName").invoke(target);
                boolean loaded = pid > 0 && loadedCode == installedCode && "UP_TO_DATE".equals(state);
                if (loaded) current++;
                detail.append('\n').append(process).append(" · PID ")
                        .append(pid).append(" · ").append(targetState(state))
                        .append(" · 版本号 ").append(loadedCode);
            }
            detail.append("\n框架当前返回 ").append(targets.size()).append(" 个进程；未启动的应用不会出现在清单中。加载证据仅针对所列进程，不代表各项功能均通过验证。");
            items.add(item("当前模块加载", current > 0 ? CompatibilityReport.State.MATCH
                    : CompatibilityReport.State.NEEDS_VERIFICATION, current > 0
                    ? "框架报告 " + current + " 个进程已加载当前版本" : "尚无当前版本的有效加载记录", detail.toString()));
        } catch (NoSuchMethodException unsupported) {
            items.add(item("当前模块加载", CompatibilityReport.State.UNAVAILABLE, "当前加载状态未知",
                    "当前模块：" + BuildConfig.VERSION_NAME
                            + "\n当前框架服务暂不提供进程加载检查。已连接、API满足要求或作用域已勾选均不能证明当前版本已经加载。"));
        } catch (Exception unavailable) {
            items.add(item("当前模块加载", CompatibilityReport.State.UNAVAILABLE, "当前加载状态未知",
                    "框架未能提供当前运行清单：" + error(unavailable)
                            + "\n旧框架可能未实现此只读接口。历史诊断记录不会被当作本次加载通过。"));
        }
    }

    private static CompatibilityReport.Item inspectApplication(Context context, String pkg,
            JSONObject baseline, boolean systemMatches, String baselineError) {
        String title = pkg, version = "", readError = "", expectedVersion = "";
        long code = -1, expectedCode = -1;
        boolean installed = false, enabled = false;
        JSONObject expected = baseline == null ? null : baseline.optJSONObject(pkg);
        if (expected != null && expected.optBoolean("present")) {
            expectedVersion = first(expected.optJSONArray("versionName"));
            try { expectedCode = Long.parseLong(first(expected.optJSONArray("versionCode"))); }
            catch (NumberFormatException ignored) { expectedCode = -1; }
        }
        try {
            PackageManager pm = context.getPackageManager();
            PackageInfo info = pm.getPackageInfo(pkg, 0);
            ApplicationInfo app = pm.getApplicationInfo(pkg, PackageManager.MATCH_DISABLED_COMPONENTS);
            installed = true; enabled = app.enabled; version = info.versionName; code = info.getLongVersionCode();
            try {
                CharSequence label = app.loadLabel(pm);
                if (label != null && label.length() > 0) title = label.toString();
            } catch (RuntimeException missingLabel) { /* The package/version result remains valid. */ }
        } catch (PackageManager.NameNotFoundException absent) { /* Report actual absence, not incompatibility. */ }
        catch (RuntimeException unavailable) { readError = error(unavailable); }
        CompatibilityReport.Item result = CompatibilityReport.application(title, pkg, installed,
                enabled, version, code, expectedVersion, expectedCode, systemMatches, readError);
        if (!baselineError.isEmpty()) return item(result.title, result.state, result.summary,
                result.detail + "\n基准清单读取失败：" + baselineError);
        if (LauncherCompatibility.PACKAGE.equals(pkg) && installed && readError.isEmpty()) {
            String original = "原厂桌面另有记录：" + LauncherCompatibility.VERSION + "（160000）。"
                    + "本页仅比较版本；原厂签名和关键权限可返回帮助，打开“修改版桌面兼容性”检查。";
            boolean recognizedOriginal = LauncherCompatibility.VERSION.equals(version) && code == 160000;
            boolean recognizedModified = LauncherCompatibility.MODIFIED_VERSION.equals(version)
                    && code >= LauncherCompatibility.MODIFIED_MIN_VERSION_CODE;
            if (enabled && (recognizedOriginal || recognizedModified)
                    && result.state == CompatibilityReport.State.NEEDS_VERIFICATION) {
                return item(title, CompatibilityReport.State.NEEDS_VERIFICATION,
                        recognizedOriginal ? "已识别原厂桌面版本 · 仍需专项验证" : "已识别修改版桌面 · 仍需专项验证",
                        result.detail + "\n" + original);
            }
            return item(result.title, result.state, result.summary, result.detail + "\n" + original);
        }
        return result;
    }

    private static String targetState(String state) {
        if ("UP_TO_DATE".equals(state)) return "框架报告最新";
        if ("STALE".equals(state)) return "加载版本已过期";
        if ("RELOADING".equals(state)) return "正在重新加载";
        if ("FAILED".equals(state)) return "加载失败";
        return "状态未知";
    }

    private static CompatibilityReport.Item item(String title, CompatibilityReport.State state,
            String summary, String detail) { return new CompatibilityReport.Item(title, state, summary, detail); }
    private static String property(JSONObject object, String name) { return object == null ? "" : object.optString(name, ""); }
    private static String first(JSONArray values) { return values == null ? "" : values.optString(0, ""); }
    private static int integer(String value) { try { return Integer.parseInt(value); } catch (Exception ignored) { return -1; } }
    private static String error(Exception error) {
        android.util.Log.w("LSA-Compatibility", "Read-only compatibility check unavailable", error);
        return "本次读取未完成，请稍后刷新。";
    }

    @Override protected void onDestroy() {
        generation++;
        ModuleScopeService.removeListener(serviceChanged);
        removeRestoreListener();
        if (pending != null) pending.cancel(true);
        main.removeCallbacksAndMessages(null);
        worker.shutdownNow();
        super.onDestroy();
    }

    private void restoreScrollAfterLayout() {
        if (scroll == null) return;
        removeRestoreListener();
        restorePending = true;
        restoreLayout = () -> {
            removeRestoreListener();
            if (!isDestroyed() && !isFinishing()) scroll.scrollTo(0, desiredScrollY);
            restorePending = false;
            return true;
        };
        scroll.getViewTreeObserver().addOnPreDrawListener(restoreLayout);
    }

    private void removeRestoreListener() {
        if (restoreLayout != null && scroll != null && scroll.getViewTreeObserver().isAlive()) {
            scroll.getViewTreeObserver().removeOnPreDrawListener(restoreLayout);
        }
        restoreLayout = null;
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putString(EXTRA_SECTION, section);
        state.putInt("scroll_y", restorePending || scroll == null ? desiredScrollY : scroll.getScrollY());
        super.onSaveInstanceState(state);
    }
}
