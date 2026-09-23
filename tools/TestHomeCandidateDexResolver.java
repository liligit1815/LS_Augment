package ls.augment.com.hook;

import java.io.IOException;
import java.util.Arrays;

/** Run production lookup against captured APKs and adversarial DEX fixtures. */
public final class TestHomeCandidateDexResolver {
    public static void main(String[] args) throws Exception {
        String expected=args[0];
        try {
            HomeCandidateDexResolver.Target result=HomeCandidateDexResolver.find(
                    Arrays.copyOfRange(args,1,args.length),System.getProperty("ls.test.home.list"));
            if(!result.key().equals(expected))throw new AssertionError("expected "+expected+", got "+result.key());
            System.out.println("Resolved "+result.key());
        } catch(IOException error) {
            if(!expected.equals("REJECT"))throw error;
            System.out.println("Rejected: "+error.getMessage());
            return;
        }
        if(expected.equals("REJECT"))throw new AssertionError("unsafe match accepted");
    }
}
