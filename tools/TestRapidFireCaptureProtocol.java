package ls.augment.com;

/** Regression tests only; recorded/synthetic events never enter live device diagnostics. */
public final class TestRapidFireCaptureProtocol {
    private static final RapidFireInputDetector.Device LEFT =
            new RapidFireInputDetector.Device("/dev/input/event4", "nubia_tgk_aw_sar0_ch0");
    private static final RapidFireInputDetector.Device RIGHT =
            new RapidFireInputDetector.Device("/dev/input/event5", "nubia_tgk_aw_sar1_ch0");
    private static final String HEADER = "LSA_CAPTURE_SOURCE=/dev/input/event4\nLSA_CAPTURE_READY=2:2\n";
    // Real left press/release timestamps and values from the failed 20143 capture.
    private static final String DOWN = "[     804.016089] 0001 0041 00000001\n";
    private static final String UP = "[     804.794617] 0001 0041 00000000\n";
    private static final String END = "LSA_CAPTURE_END=pair_received\nLSA_CAPTURE_RESTORED=2:2\n";

    public static void main(String[] args) {
        String complete = HEADER + DOWN + UP + END;
        check(RapidFireCaptureProtocol.isComplete(complete, LEFT), "complete protocol");
        check(RapidFireCaptureProtocol.observedPair(complete, LEFT).code == 65, "real code 65");
        check(RapidFireCaptureProtocol.observedPair(HEADER + DOWN, LEFT) == null, "wait for release");
        check(RapidFireCaptureProtocol.observedPair(HEADER + DOWN + UP, LEFT) != null, "immediate feedback");
        check(!RapidFireCaptureProtocol.isComplete(HEADER + DOWN + UP, LEFT), "progress cannot approve");
        check(!RapidFireCaptureProtocol.isComplete(HEADER + DOWN + UP
                + "Terminated\nLSA_CAPTURE_RESTORED=2:2\n", LEFT), "20143 missing fence rejected");
        check(RapidFireCaptureProtocol.observedPair(HEADER + DOWN + END + UP, LEFT) == null,
                "a restoration-generated release cannot complete a physical pair");
        check(!RapidFireCaptureProtocol.isComplete(complete.replace("pair_received", "cancelled"), LEFT),
                "cancellation rejected even after a pair");
        check(!RapidFireCaptureProtocol.isComplete(complete.replace("pair_received", "interrupted"), LEFT),
                "watchdog interruption rejected");
        check(!RapidFireCaptureProtocol.isComplete(complete.replace("pair_received", "reader_failed"), LEFT),
                "early reader failure rejected");
        check(!RapidFireCaptureProtocol.isComplete(complete + "LSA_CAPTURE_ERROR=restore_failed\n", LEFT),
                "restore failure rejected");
        check(!RapidFireCaptureProtocol.isComplete(complete.replace("RESTORED=2:2", "RESTORED=1:2"), LEFT),
                "restored mode must match original mode");
        check(!RapidFireCaptureProtocol.isComplete(complete + "LSA_CAPTURE_END=pair_received\n", LEFT),
                "duplicate terminal marker rejected");
        check(!RapidFireCaptureProtocol.isComplete(HEADER + "LSA_CAPTURE_RESTORED=2:2\n"
                + DOWN + UP + "LSA_CAPTURE_END=pair_received\n", LEFT), "marker order matters");
        check(RapidFireCaptureProtocol.observedPair(complete, RIGHT) == null, "wrong side never accepted");
        check(!RapidFireCaptureProtocol.isComplete(complete, RIGHT), "wrong source rejected");
        String empty = HEADER + END.replace("pair_received", "window_elapsed");
        check(RapidFireCaptureProtocol.isComplete(empty, LEFT), "normal empty timeout closes cleanly");
        check(RapidFireCaptureProtocol.observedPair(empty, LEFT) == null, "empty timeout is not a pair");
        for (int code : new int[] {66, 136, 137, 138, 501}) {
            String right = complete.replace("event4", "event5").replace("0041", String.format("%04x", code));
            check(RapidFireCaptureProtocol.isComplete(right, RIGHT), "right stream closes");
            check(RapidFireCaptureProtocol.observedPair(right, RIGHT).code == code, "dynamic code " + code);
        }
        check(RapidFireCaptureProtocol.observedPair(HEADER + DOWN
                + "[ 804.794617] 0001 0041 0000000", LEFT) == null, "partial output chunk rejected");
        RapidFireInputDetector.Device unknown=new RapidFireInputDetector.Device("/dev/input/event19","new_vendor_airtrigger");
        java.util.List<RapidFireInputDetector.Device> sources=java.util.Arrays.asList(LEFT,unknown);
        String readOnly="LSA_READONLY_SOURCE=/dev/input/event4\nLSA_READONLY_SOURCE=/dev/input/event19\nLSA_READONLY_READY=1\n"
                +"/dev/input/event19: "+DOWN+"/dev/input/event19: "+UP+"LSA_READONLY_END=window_elapsed\n";
        check(RapidFireReadOnlyCaptureProtocol.observedPair(readOnly,sources).code==65,"unknown driver read-only path");
        check(RapidFireReadOnlyCaptureProtocol.observedPair(readOnly.replace("window_elapsed","cancelled"),sources)==null,"cancel cannot pass");
        check(!RapidFireReadOnlyCaptureProtocol.isComplete(readOnly+"/dev/input/event19: "+UP,sources),"late events rejected");
        check(!RapidFireReadOnlyCaptureProtocol.isComplete(readOnly.replace("event19","event8"),sources),"unidentified source rejected");
        check(!RapidFireReadOnlyCaptureProtocol.isComplete(readOnly.replace("LSA_READONLY_SOURCE=/dev/input/event4\n",""),sources),"missing reader rejected");
        check(RapidFireReadOnlyCaptureProtocol.observedPair(readOnly.replace("LSA_READONLY_END=", "/dev/input/event4: "+DOWN+"/dev/input/event4: "+UP+"LSA_READONLY_END="),sources)==null,"mixed shoulders ambiguous");
        System.out.println("RapidFireCaptureProtocol tests passed");
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
