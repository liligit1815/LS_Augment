package ls.augment.com;

import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;

/** The original game-space monitor items, shared by settings and the phone runtime. */
public final class GamePerformanceMonitorConfig {
    public static final int MARGIN_STORAGE_LIMIT=32767;
    public static final String GEOMETRY="ls_augment_game_monitor_geometry";
    public static final String DEFAULT_ITEMS = "time,fps,network,battery,duration";
    private static final String[] ITEMS = {"time", "fps", "network", "battery", "duration", "battery_temperature", "cpu_temperature", "gpu_temperature", "power"};
    private static final String[] LABELS = {"时间", "FPS", "网速", "电量", "游戏时长", "电池温度", "CPU 温度", "GPU 温度", "功耗"};

    public static String[] items() { return ITEMS.clone(); }
    public static String[] labels() { return LABELS.clone(); }

    /** Reject empty/unknown selections and keep the original order for stable backups. */
    public static String normalizeItems(String value) {
        if (value == null || value.trim().isEmpty()) return null;
        Set<String> selected = new LinkedHashSet<>();
        for (String raw : value.split(",", -1)) {
            String item = raw.trim();
            if (!Arrays.asList(ITEMS).contains(item)) return null;
            selected.add(item);
        }
        Set<String> ordered = new LinkedHashSet<>();
        for (String item : ITEMS) if (selected.contains(item)) ordered.add(item);
        return ordered.isEmpty() ? null : String.join(",", ordered);
    }

    public static boolean selected(String value, String item) {
        String normalized = normalizeItems(value);
        return normalized != null && Arrays.asList(normalized.split(",")).contains(item);
    }

    /** Pixel geometry captured before customization; shared by editor and runtime. */
    public static final class Geometry {
        public final int screen,full;public final float density,scaledDensity;
        public final int[] occupied,cells;
        public Geometry(int screen,int full,float density,float scaledDensity,int[] occupied,int[] cells){
            this.screen=screen;this.full=full;this.density=density;this.scaledDensity=scaledDensity;
            this.occupied=occupied.clone();this.cells=cells.clone();
        }
        public int[] range(String selection){
            int count=0,cellTotal=0,margins=0,minimum=Integer.MAX_VALUE,previous=-1;
            int chrome=full;for(int i=0;i<5;i++)chrome-=occupied[i];
            for(int i=0;i<9;i++)if(selected(selection,ITEMS[i])){count++;cellTotal+=cells[i];margins+=occupied[i]-cells[i];}
            if(count<2||density<=0||screen<=0||cellTotal<=0)return new int[]{0,0};
            float ratio=Math.min(1f,Math.max(count,screen-chrome-margins)/(float)cellTotal);
            for(int i=0;i<9;i++)if(selected(selection,ITEMS[i])){
                if(previous>=0)minimum=Math.min(minimum,Math.max(1,(int)(cells[previous]*ratio)));
                previous=i;
            }
            int min=(int)Math.ceil((1-minimum)/density);
            int max=(int)Math.floor(Math.max(0,screen-chrome-cellTotal-margins)/((count-1)*density));
            return new int[]{Math.max(-MARGIN_STORAGE_LIMIT,min),Math.min(MARGIN_STORAGE_LIMIT,max)};
        }
        public int clamp(String selection,int requested){int[] range=range(selection);return Math.max(range[0],Math.min(range[1],requested));}
        public String encode(){return "1|"+screen+"|"+full+"|"+density+"|"+scaledDensity+"|"+join(occupied)+"|"+join(cells);}
        private static String join(int[] values){StringBuilder out=new StringBuilder();for(int n:values){if(out.length()>0)out.append(',');out.append(n);}return out.toString();}
        public static Geometry parse(String value){
            try{String[] p=value.split("\\|",-1);if(p.length!=7||!"1".equals(p[0]))return null;
                int[] occupied=Arrays.stream(p[5].split(",")).mapToInt(Integer::parseInt).toArray();
                int[] cells=Arrays.stream(p[6].split(",")).mapToInt(Integer::parseInt).toArray();
                Geometry g=new Geometry(Integer.parseInt(p[1]),Integer.parseInt(p[2]),Float.parseFloat(p[3]),Float.parseFloat(p[4]),occupied,cells);
                if(occupied.length!=9||cells.length!=9||g.screen<=0||g.full<=0||!Float.isFinite(g.density)||g.density<=0||!Float.isFinite(g.scaledDensity)||g.scaledDensity<=0)return null;
                for(int i=0;i<9;i++)if(cells[i]<=0||occupied[i]<cells[i]||cells[i]>100000)return null;
                return g;
            }catch(RuntimeException invalid){return null;}
        }
    }

    private GamePerformanceMonitorConfig() { }
}
