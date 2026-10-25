package ls.augment.com;

import java.util.HashMap;
import java.util.Map;

/** Behavioral contracts for physical edges and exact phone-side shell scripts. */
public final class TestCompetitiveKeyPolicy {
    private static int checks;
    private static void check(boolean condition,String message){checks++;if(!condition)throw new AssertionError(message);}
    public static void main(String[] args){
        Map<String,String> values=new HashMap<>();
        for(int category=0;category<4;category++){
            values.put(CompetitiveKeyOptions.CATEGORY,String.valueOf(category));
            values.put(CompetitiveKeyOptions.UP_ACTION,String.valueOf(CompetitiveKeyPolicy.defaultAction(category,true)));
            values.put(CompetitiveKeyOptions.DOWN_ACTION,String.valueOf(CompetitiveKeyPolicy.defaultAction(category,false)));
            check(CompetitiveKeyPolicy.action(values::get,true)!=0&&CompetitiveKeyPolicy.action(values::get,false)!=0,"both directions configured "+category);
            values.put(CompetitiveKeyOptions.UP_ACTION,"0");check(CompetitiveKeyPolicy.action(values::get,true)==0&&CompetitiveKeyPolicy.action(values::get,false)!=0,"up can be empty independently "+category);
            values.put(CompetitiveKeyOptions.UP_ACTION,String.valueOf(CompetitiveKeyPolicy.defaultAction(category,true)));values.put(CompetitiveKeyOptions.DOWN_ACTION,"0");
            check(CompetitiveKeyPolicy.action(values::get,true)!=0&&CompetitiveKeyPolicy.action(values::get,false)==0,"down can be empty independently "+category);
        }
        values.put(CompetitiveKeyOptions.CATEGORY,"1");values.put(CompetitiveKeyOptions.UP_ACTION,"7");
        check(CompetitiveKeyPolicy.action(values::get,true)==0,"wrong category cannot accidentally execute saved shell action");
        String script="v='中文 \"literal\"'\nprintf '%s\\n' \"$v\" > /data/local/tmp/a\n# comment\nprintf done\n";
        String encoded=CompetitiveKeyPolicy.encodeShell(script);
        check(!encoded.contains("\n")&&!encoded.contains("\r"),"snapshot-safe command codec");
        check(script.equals(CompetitiveKeyPolicy.decodeShell(encoded)),"multiple lines quotes variables redirects and terminal newline preserved exactly");
        check(CompetitiveKeyPolicy.normalizeShell(encoded).equals(encoded),"canonical encoding accepted");
        check(CompetitiveKeyPolicy.normalizeShell(encoded+"!")==null,"corrupt command fails closed");
        check(CompetitiveKeyPolicy.encodeShell("bad\0command")==null,"NUL command rejected");
        check(CompetitiveKeyPolicy.encodeShell("x".repeat(CompetitiveKeyPolicy.MAX_SHELL_BYTES+1))==null,"oversized command rejected");
        check(CompetitiveKeyPolicy.decodeShell("").isEmpty(),"empty direction command retained");
        check(CompetitiveKeyPolicy.normalizePackage("com.example.target").equals("com.example.target"),"package allowed");
        check(CompetitiveKeyPolicy.normalizePackage("com.example;am force-stop android")==null,"package is not a command");
        Map<String,String> newer=new HashMap<>(values);newer.put("other_setting","changed");
        check(CompetitiveKeyPolicy.sameConfiguration(values::get,newer::get),"unrelated setting does not retire key action");
        newer.put(CompetitiveKeyOptions.APP_PACKAGE,"com.example.changed");
        check(!CompetitiveKeyPolicy.sameConfiguration(values::get,newer::get),"changed target app retires key action");
        CompetitiveKeyPolicy.Edges edges=new CompetitiveKeyPolicy.Edges();
        check(!edges.accept(-1,true)&&!edges.accept(0,false),"boot and state replay never execute");
        check(edges.accept(100,true),"first positive physical edge");
        check(!edges.accept(100,true)&&!edges.accept(101,true),"duplicate route and same position replay ignored");
        check(!edges.accept(99,false),"out-of-order event ignored");
        check(edges.accept(102,false)&&edges.accept(103,true),"alternating real directions execute independently");
        for(EnhancementOption option:CompetitiveKeyOptions.options())check(option.normalize(option.defaultValue)!=null,"valid default "+option.key);
        System.out.println("PASS CompetitiveKeyPolicy: "+checks+" assertions");
    }
}
