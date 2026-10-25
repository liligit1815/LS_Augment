package ls.augment.com;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public final class TestAtomicWorkbenchTransferPolicy {
    private static int assertions;
    public static void main(String[] args) throws Exception {
        require(AtomicWorkbenchTransferPolicy.validPackage("com.tencent.mm"), "ordinary share destination");
        for (String invalid : new String[]{"", "android", "../com.tencent.mm", "com.tencent.mm/Private", "com.tencent.mm\n"})
            require(!AtomicWorkbenchTransferPolicy.validPackage(invalid), "reject malformed package");
        require(AtomicWorkbenchTransferPolicy.validId("0123456789abcdef0123456789abcdef"), "cache token");
        require(!AtomicWorkbenchTransferPolicy.validId("../0123456789abcdef0123456789abcdef"), "no path traversal");
        require(!AtomicWorkbenchTransferPolicy.validId("0123456789ABCDEF0123456789ABCDEF"), "canonical token only");
        require(AtomicWorkbenchTransferPolicy.displayName("a/b\\c\n.mp4").equals("a_b_c_.mp4"), "source names cannot form paths");
        require(AtomicWorkbenchTransferPolicy.displayName("..").equals("分享文件"), "empty path names replaced");
        require(AtomicWorkbenchTransferPolicy.displayName("a".repeat(150)).length() == 120, "bounded name");
        require(AtomicWorkbenchTransferPolicy.text("  hello\u0000  ").equals("  hello  "), "preserve original whitespace while removing NUL");
        require(AtomicWorkbenchTransferPolicy.text("字".repeat(32768)).length() == 32768, "text boundary accepted");
        fails(() -> AtomicWorkbenchTransferPolicy.text("x".repeat(32769)), "oversized text rejected without truncation");
        require(AtomicWorkbenchTransferPolicy.mime("VIDEO/MP4").equals("video/mp4"), "MIME canonicalized");
        require(AtomicWorkbenchTransferPolicy.mime("text/plain\nprivate").equals("application/octet-stream"), "malformed MIME rejected");
        require(AtomicWorkbenchTransferPolicy.commonMime(List.of()).equals("text/plain"), "text share MIME");
        require(AtomicWorkbenchTransferPolicy.commonMime(List.of("image/png", "image/png")).equals("image/png"), "specific MIME retained");
        require(AtomicWorkbenchTransferPolicy.commonMime(List.of("image/png", "image/jpeg")).equals("image/*"), "image collection");
        require(AtomicWorkbenchTransferPolicy.commonMime(List.of("image/png", "video/mp4")).equals("*/*"), "mixed collection");
        long now = 1_000_000_000L;
        require(AtomicWorkbenchTransferPolicy.fresh(now - AtomicWorkbenchTransferPolicy.LIFETIME_MS, now), "cache TTL exact boundary");
        require(!AtomicWorkbenchTransferPolicy.fresh(now - AtomicWorkbenchTransferPolicy.LIFETIME_MS - 1, now), "expired cache rejected");
        require(!AtomicWorkbenchTransferPolicy.fresh(now + 300001, now), "future timestamps rejected");
        require(!AtomicWorkbenchTransferPolicy.fresh(0, now), "missing creation rejected");
        byte[] bytes = new byte[65537]; for (int index = 0; index < bytes.length; index++) bytes[index] = (byte) (index % 251);
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        require(AtomicWorkbenchTransferPolicy.copy(new ByteArrayInputStream(bytes), output, bytes.length) == bytes.length, "exact byte budget accepted");
        require(java.util.Arrays.equals(bytes, output.toByteArray()), "original file bytes retained");
        ByteArrayOutputStream bounded = new ByteArrayOutputStream();
        fails(() -> AtomicWorkbenchTransferPolicy.copy(new ByteArrayInputStream(bytes), bounded, 32), "oversize file rejected");
        require(bounded.size() <= 32, "oversize content never written past budget");
        InputStream stalled = new InputStream() { public int read() { return 0; } public int read(byte[] value) { return 0; } };
        fails(() -> AtomicWorkbenchTransferPolicy.copy(stalled, new ByteArrayOutputStream(), 32), "stalled provider bounded");
        fails(() -> AtomicWorkbenchTransferPolicy.copy(null, new ByteArrayOutputStream(), 32), "unreadable provider rejected");
        require(AtomicWorkbenchTransferPolicy.copy(new ByteArrayInputStream(new byte[0]), new ByteArrayOutputStream(), 0) == 0, "empty file accepted");
        System.out.println("Atomic workbench transfer policy: " + assertions + " assertions passed");
    }
    private interface Operation { void run() throws IOException; }
    private static void fails(Operation operation, String message) throws Exception {
        try { operation.run(); throw new AssertionError(message); } catch (IOException expected) { assertions++; }
    }
    private static void require(boolean value, String message) { assertions++; if (!value) throw new AssertionError(message); }
}
