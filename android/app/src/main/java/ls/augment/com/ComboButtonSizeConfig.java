package ls.augment.com;

/** Shared integer-percent geometry used by the editor and the actual macro window. */
public final class ComboButtonSizeConfig {
    public static final String GEOMETRY="ls_augment_combo_button_size_geometry";
    public static int maximum(int width,int height,int screenWidth,int screenHeight){
        if(width<=0||height<=0||screenWidth<=0||screenHeight<=0)return 0;
        return (int)Math.min(GameOptions.COMBO_BUTTON_SIZE_MAX,
                Math.min(100L*screenWidth/width,100L*screenHeight/height));
    }
    public static int maximum(String encoded,float density){
        try{
            String[] parts=encoded.split("\\|",-1);
            if(parts.length!=6||!"1".equals(parts[0])||!Float.isFinite(density)||density<=0)return 0;
            float observedDensity=Float.parseFloat(parts[5]);
            if(!Float.isFinite(observedDensity)||Math.abs(observedDensity-density)>.01f)return 0;
            return maximum(Integer.parseInt(parts[1]),Integer.parseInt(parts[2]),Integer.parseInt(parts[3]),Integer.parseInt(parts[4]));
        }catch(RuntimeException invalid){return 0;}
    }
    private ComboButtonSizeConfig(){}
}
