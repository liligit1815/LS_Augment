package ls.augment.com;

public final class TestSmsVerificationCode {
    private static void expect(String expected, String message) {
        String actual = SmsVerificationCode.extract(message);
        if (!java.util.Objects.equals(expected, actual))
            throw new AssertionError("Expected " + expected + " got " + actual + " for " + message);
    }
    public static void main(String[] args) {
        expect("001234", "【测试】您的验证码为001234，5分钟内有效，请勿泄露。");
        expect("9831", "9831是您的验证码，请勿告知他人。");
        expect("A7b92X", "Your verification code is A7b92X. Valid for 5 minutes.");
        expect("123456", "123456 is your verification code.");
        expect("778899", "驗證碼：778899，請勿洩漏。");
        expect("12345678", "OTP: 12345678");
        expect("1234", "code: 1234, code: 1234");
        expect(null, null);
        expect(null, "订单123456已发货，请联系13800138000。");
        expect(null, "验证码已发送到13800138000");
        expect(null, "验证码123");
        expect(null, "验证码123456789");
        expect(null, "验证码：ABCDEFGH");
        expect(null, "验证码：1234；验证码：5678");
        expect(null, "验证码。订单123456已发货");
        expect(null, "验证码有效期2026年");
        expect(null, "x".repeat(8193));
        System.out.println("PASS SMS verification code extraction");
    }
}
