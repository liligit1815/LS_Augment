package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

public final class TestLauncherGridSpec {
    private static int checks;
    public static void main(String[] args) {
        LauncherGridSpec defaults = LauncherGridSpec.defaults();
        require(!defaults.enabled && defaults.rows == 6 && defaults.columns == 4, "upgrade keeps launcher unchanged");
        require(LauncherGridSpec.parse(null, null, null).values().equals(defaults.values()), "missing config defaults safely");
        require(LauncherGridSpec.from(null).values().equals(defaults.values()), "missing config map defaults");
        require(LauncherGridSpec.from(Map.of()).values().equals(defaults.values()), "empty config map defaults");
        require(defaults.label().equals("4 × 6"), "display order is columns by rows");
        for (boolean enabled : new boolean[]{false,true}) for (int rows=3;rows<=12;rows++) for (int cols=3;cols<=12;cols++) {
            LauncherGridSpec spec = new LauncherGridSpec(enabled,rows,cols);
            Map<String,String> saved=spec.values(); LauncherGridSpec restored=LauncherGridSpec.from(saved);
            require(restored!=null && restored.enabled==enabled && restored.rows==rows && restored.columns==cols, "all rectangle configurations round trip");
            require(saved.equals(restored.values()) && saved.size()==3, "three canonical keys only");
            require(spec.capacity()==rows*cols && spec.capacity()>=9 && spec.capacity()<=144, "bounded mathematical capacity cannot overflow");
            LauncherGridSpec disabled=spec.withEnabled(false); require(!disabled.enabled&&disabled.rows==rows&&disabled.columns==cols,"disable retains chosen shape");
            require(spec.enabled==enabled,"edits immutable");
        }
        for (int n=3;n<=12;n++) { LauncherGridSpec square=LauncherGridSpec.square(n); require(square.enabled&&square.rows==n&&square.columns==n,"square preset "+n); }
        String[] presets={"4 × 6","5 × 6","5 × 7","6 × 6","6 × 8"};
        require(LauncherGridSpec.PRESETS.size()==presets.length,"preset count");
        for(int i=0;i<presets.length;i++) {
            LauncherGridSpec.Preset preset=LauncherGridSpec.PRESETS.get(i);
            require(preset.label.equals(presets[i]),"preset visual order");
            LauncherGridSpec off=preset.apply(defaults),on=preset.apply(defaults.withEnabled(true));
            require(!off.enabled&&on.enabled&&off.rows==preset.rows&&off.columns==preset.columns,"preset preserves enabled state");
        }
        for(int bad:new int[]{Integer.MIN_VALUE,-1,0,1,2,13,100,Integer.MAX_VALUE}) {
            reject(()->new LauncherGridSpec(true,bad,4),"invalid rows rejected"); reject(()->new LauncherGridSpec(true,6,bad),"invalid columns rejected");
        }
        for(String bad:new String[]{"2","13","-1","3.5","3e0","NaN","Infinity","99999999999999999","three","3;4"}) {
            require(LauncherGridSpec.parse("1",bad,"4")==null,"invalid row encoding rejected");
            require(LauncherGridSpec.parse("0","6",bad)==null,"disabled config cannot hide invalid dimensions");
        }
        require(LauncherGridSpec.parse("maybe","6","4")==null,"invalid switch rejected");
        require(LauncherGridSpec.parse("true"," 03 ","12").values().get(LauncherGridSpec.ROWS).equals("3"),"parse canonicalizes valid values");
        reject(()->defaults.values().put(LauncherGridSpec.ENABLED,"1"),"configuration batch immutable");
        reject(()->LauncherGridSpec.PRESETS.clear(),"preset list immutable");
        Map<String,String> input=new LinkedHashMap<>(new LauncherGridSpec(true,8,6).values()); input.put("unrelated","keep");
        LauncherGridSpec read=LauncherGridSpec.from(input); input.put(LauncherGridSpec.ROWS,"12");
        require(read.rows==8&&read.values().size()==3&&input.get("unrelated").equals("keep"),"spec owns copied values and ignores unrelated settings");
        System.out.println("PASS LauncherGridSpec: "+checks+" checks for all rectangles, square presets, immutable configuration and bounded grid capacity");
    }
    private static void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private static void reject(Runnable action,String message){try{action.run();}catch(IllegalArgumentException|UnsupportedOperationException expected){checks++;return;}throw new AssertionError(message);}
}
