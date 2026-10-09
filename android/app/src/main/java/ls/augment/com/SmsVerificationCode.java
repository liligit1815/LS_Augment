package ls.augment.com;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Pure, bounded parser. Only an unambiguous code next to an explicit label is accepted. */
public final class SmsVerificationCode {
    private static final Pattern LABEL = Pattern.compile(
            "验证码|驗證碼|校验码|校驗碼|动态码|動態碼|动态密码|動態密碼|"
            + "(?i:\\b(?:(?:verification|security|login|authentication|one[ -]time)\\s+code|otp|passcode|code)\\b)");
    private static final Pattern CODE = Pattern.compile("(?<![A-Za-z0-9])([A-Za-z0-9]{4,8})(?![A-Za-z0-9])");
    private SmsVerificationCode() { }

    public static String extract(String body) {
        if (body == null || body.length() > 8192) return null;
        Matcher labels = LABEL.matcher(body);
        String selected = null;
        while (labels.find()) {
            Matcher codes = CODE.matcher(body);
            String nearest = null;
            int best = 25;
            boolean ambiguous = false;
            while (codes.find()) {
                int distance;
                String gap;
                if (codes.start() >= labels.end()) {
                    distance = codes.start() - labels.end();
                    gap = body.substring(labels.end(), codes.start());
                } else if (codes.end() <= labels.start()) {
                    distance = labels.start() - codes.end();
                    gap = body.substring(codes.end(), labels.start());
                } else continue;
                if (distance > 24 || distance > best || !codes.group().matches(".*[0-9].*")) continue;
                // Do not cross sentences, other numbers, URLs or account/amount labels.
                if (gap.matches("(?s).*[0-9。.!?！？;；\\n/].*")
                        || gap.matches("(?is).*(?:订单|订单号|金额|尾号|手机|电话|有效|分钟|order|amount|phone|valid|minute).*")) continue;
                if (distance < best) { nearest = codes.group(); best = distance; ambiguous = false; }
                else if (!codes.group().equals(nearest)) ambiguous = true;
            }
            if (ambiguous) return null;
            if (nearest != null) {
                if (selected != null && !selected.equals(nearest)) return null;
                selected = nearest;
            }
        }
        return selected;
    }
}
