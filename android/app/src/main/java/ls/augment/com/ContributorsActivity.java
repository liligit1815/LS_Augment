package ls.augment.com;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.LinearLayout;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Hosted HTML with an offline website snapshot captured during the build. */
public final class ContributorsActivity extends Activity {
    private static final int MAX_BYTES = 512 * 1024;
    private static final String MARKER = "<meta name=\"redmagic-duo-contributors\" content=\"1\">";
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private volatile HttpURLConnection connection;
    private volatile boolean closed;
    private WebView web;
    private UiKit ui;
    private String pageUrl;
    private String buildSnapshot;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        ui = new UiKit(this);
        pageUrl = getString(R.string.contributors_page_url).trim();
        LinearLayout root=ui.detailChrome("贡献名单",null);
        web = new WebView(this);
        web.setBackgroundColor(android.graphics.Color.TRANSPARENT);
        WebSettings settings = web.getSettings();
        settings.setJavaScriptEnabled(false);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setBlockNetworkLoads(true); // This document has no remote subresources.
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        settings.setTextZoom(Math.round(getResources().getConfiguration().fontScale * 100));
        web.setWebViewClient(new WebViewClient() {
            @Override public boolean shouldOverrideUrlLoading(WebView view,
                    android.webkit.WebResourceRequest request) {
                return true; // A read-only list, without links or other navigation.
            }
        });
        root.addView(web, new LinearLayout.LayoutParams(-1, 0, 1));
        ui.setContentView(root);
        ui.applyGestureInset(root, 0);
        worker.execute(() -> {
            String initial = null;
            try (InputStream input = getAssets().open("contributors/index.html")) {
                initial = read(input);
            } catch (Exception ignored) { }
            final String html = initial;
            runOnUiThread(() -> {
                if (closed) return;
                buildSnapshot = html;
                if (html != null) show(html);
                refresh();
            });
        });
    }

    private void show(String html) {
        String themed = html.replace("data-theme=\"auto\"",
                "data-theme=\"" + (ui.dark ? "dark" : "light") + "\"");
        // The standalone website has its own heading; the embedded document inherits
        // the app's existing breadcrumbs, spacing, text scale and card shape.
        String embedded="<style id=\"duo-native-embedded\">"
                +"body{background:transparent;color:"+color(ui.text)+";font-size:"+UiKit.compactTextSize(14)+"px}"
                +"main{max-width:none;padding:0 16px 32px;animation:none}main>header{display:none}"
                +".section-heading{margin:0 3px 16px;gap:8px}h2{font-size:"+UiKit.compactTextSize(12)+"px;color:"+color(ui.muted)+"}"
                +".en{display:none}.people{gap:8px}.person{min-height:48px;padding:12px 14px;gap:12px}"
                +".person,.support-card{border-radius:"+ui.surfaceRadiusDp(26)+"px;background:"+color(ui.card)+";border-color:"+color(ui.outline)+";box-shadow:none}"
                +".person h3{font-size:"+UiKit.compactTextSize(15)+"px}.role,.support-card p{font-size:"+UiKit.compactTextSize(12)+"px;color:"+color(ui.muted)+"}"
                +".initial{width:36px;height:36px;border-radius:12px;font-size:"+UiKit.compactTextSize(16)+"px;background:"+color(ui.accentContainer)+";color:"+color(ui.accent)+"}"
                +".support{margin-top:8px}.support-card{padding:14px}.donors{gap:8px}.donors li{padding:8px 12px;font-size:"+UiKit.compactTextSize(13)+"px;background:"+color(ui.accentContainer)+";color:"+color(ui.text)+"}"
                +"footer{margin-top:16px;color:"+color(ui.muted)+";font-size:"+UiKit.compactTextSize(11)+"px}"
                +"</style>";
        themed=themed.replace("</head>",embedded+"</head>");
        web.loadDataWithBaseURL("https://contributors.invalid/", themed,
                "text/html", "UTF-8", null);
    }

    private static String color(int value){return String.format(java.util.Locale.ROOT,"#%06x",value&0xffffff);}

    private void refresh() {
        if (pageUrl.isEmpty()) {
            return;
        }
        try {
            URI uri = URI.create(pageUrl);
            if (!"https".equalsIgnoreCase(uri.getScheme()) || uri.getHost() == null
                    || uri.getUserInfo() != null || uri.getFragment() != null)
                throw new IllegalArgumentException();
        } catch (Exception error) {
            return;
        }
        worker.execute(() -> {
            String html = null;
            try {
                if (closed) return;
                HttpURLConnection request = (HttpURLConnection) URI.create(pageUrl).toURL().openConnection();
                connection = request;
                if (closed) return;
                request.setConnectTimeout(8000);
                request.setReadTimeout(8000);
                request.setInstanceFollowRedirects(false);
                request.setRequestProperty("Accept", "text/html");
                request.setRequestProperty("Cache-Control", "no-cache");
                if (request.getResponseCode() != 200) throw new java.io.IOException("HTTP response");
                String type = request.getContentType();
                if (type == null || !type.toLowerCase(java.util.Locale.ROOT).startsWith("text/html"))
                    throw new java.io.IOException("Content type");
                try (InputStream input = request.getInputStream()) { html = read(input); }
                if (!valid(html)) throw new java.io.IOException("Invalid contributor document");
            } catch (Exception ignored) {
                html = null;
            } finally {
                HttpURLConnection request = connection;
                connection = null;
                if (request != null) request.disconnect();
            }
            final String result = html;
            runOnUiThread(() -> {
                if (closed) return;
                if (result != null) {
                    show(result);
                } else if (buildSnapshot == null) {
                    android.widget.Toast.makeText(this, "暂时无法加载贡献者网页",
                            android.widget.Toast.LENGTH_SHORT).show();
                }
            });
        });
    }

    private static boolean valid(String html) {
        return html.contains(MARKER) && html.contains("</html>");
    }

    private static String read(InputStream input) throws java.io.IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int count;
        while ((count = input.read(buffer)) != -1) {
            if (output.size() + count > MAX_BYTES) throw new java.io.IOException("Page too large");
            output.write(buffer, 0, count);
        }
        return output.toString(StandardCharsets.UTF_8.name());
    }

    @Override protected void onDestroy() {
        closed = true;
        HttpURLConnection request = connection;
        if (request != null) request.disconnect();
        worker.shutdownNow();
        if (web != null) {
            ((android.view.ViewGroup) web.getParent()).removeView(web);
            web.destroy();
        }
        super.onDestroy();
    }
}
