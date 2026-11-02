package ls.augment.com;

/** Launcher-owned text geometry. Display identity is separate from app/window/font metrics. */
public final class LauncherMemoryGeometry {
    public static final String KEY = "ls_augment_rm_recents_memory_portrait_geometry";
    public static final String LANDSCAPE_KEY = "ls_augment_rm_recents_memory_landscape_geometry";
    public static final String UI_STATE = "ls_augment_rm_recents_memory_geometry_ui_state";
    public final int displayWidth, displayHeight, style, content, heightDp, centerDp, maximumDp, maximumTopDp;
    public final float displayDensity, density, scaledDensity, systemFontScale, size;
    public final boolean landscape;

    public LauncherMemoryGeometry(int width, int height, float displayDensity, float density, float scaledDensity,
            float systemFontScale, boolean landscape, int style, int content, float size, int heightDp,
            int centerDp, int maximumDp, int maximumTopDp) {
        displayWidth=Math.min(width,height);displayHeight=Math.max(width,height);
        this.displayDensity=displayDensity;this.systemFontScale=systemFontScale;this.landscape=landscape;
        this.density=density;this.scaledDensity=scaledDensity;this.style=style;this.content=content;
        this.size=size;this.heightDp=heightDp;this.centerDp=centerDp;this.maximumDp=maximumDp;this.maximumTopDp=maximumTopDp;
    }
    public String encode() {
        return "2;"+displayWidth+";"+displayHeight+";"+displayDensity+";"+density+";"+scaledDensity
                +";"+systemFontScale+";"+(landscape?1:0)+";"+style+";"+content+";"+size+";"+heightDp
                +";"+centerDp+";"+maximumDp+";"+maximumTopDp;
    }
    public static LauncherMemoryGeometry parse(String value) {
        try {
            String[] p=value.split(";",-1);
            // Schema 1 used root-window dimensions as display identity and has no top/landscape bounds.
            if(p.length!=15||!"2".equals(p[0])||!("0".equals(p[7])||"1".equals(p[7])))return null;
            LauncherMemoryGeometry g=new LauncherMemoryGeometry(Integer.parseInt(p[1]),Integer.parseInt(p[2]),
                    Float.parseFloat(p[3]),Float.parseFloat(p[4]),Float.parseFloat(p[5]),Float.parseFloat(p[6]),"1".equals(p[7]),
                    Integer.parseInt(p[8]),Integer.parseInt(p[9]),Float.parseFloat(p[10]),Integer.parseInt(p[11]),
                    Integer.parseInt(p[12]),Integer.parseInt(p[13]),Integer.parseInt(p[14]));
            if(g.displayWidth<=0||g.displayHeight<=0||!Float.isFinite(g.density)||g.density<=0
                    ||!Float.isFinite(g.displayDensity)||g.displayDensity<=0||!Float.isFinite(g.systemFontScale)||g.systemFontScale<=0
                    ||!Float.isFinite(g.scaledDensity)||g.scaledDensity<=0||!Float.isFinite(g.size)
                    ||g.size<6||g.size>40||g.style<0||g.style>1||g.content<0||g.content>LauncherMemoryPresentation.FULL_LABELS
                    ||g.heightDp<24||g.heightDp>(g.landscape?200:240)||g.centerDp<0||g.centerDp>g.maximumDp||g.maximumDp>2000
                    ||g.maximumTopDp<0||g.maximumTopDp>2000)return null;
            return g;
        }catch(RuntimeException invalid){return null;}
    }
    public String mismatch(int width,int height,float displayDensity,float systemFontScale,boolean landscape,
            int style,int content,float size,int heightDp) {
        if(displayWidth!=Math.min(width,height)||displayHeight!=Math.max(width,height))return "display_size";
        if(!Float.isFinite(displayDensity)||Math.abs(this.displayDensity-displayDensity)>=.001f)return "display_density";
        if(!Float.isFinite(systemFontScale)||Math.abs(this.systemFontScale-systemFontScale)>=.001f)return "system_font_scale";
        if(this.landscape!=landscape)return "orientation";
        if(this.style!=style||this.content!=content||Math.abs(this.size-size)>=.001f||this.heightDp!=heightDp)return "content_layout";
        // The launcher's actual density/font scale need not equal the settings Activity's metrics.
        return "";
    }
}
