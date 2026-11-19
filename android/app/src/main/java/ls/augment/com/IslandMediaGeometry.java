package ls.augment.com;

/** Content geometry in pixels; no assumed display density or capped font scale. */
public final class IslandMediaGeometry {
    public final int headerHeight,seekTop,seekHeight,timeTop,controlsTop,auxTop,height,controlsWidth;
    public final boolean separateAux;
    public IslandMediaGeometry(int contentWidth,int headerTextHeight,int timeHeight,float density){
        int action=Math.round(IslandVisualSpec.ACTION_HEIGHT*density);
        headerHeight=Math.max(Math.round(IslandVisualSpec.PANEL_ICON*density),headerTextHeight);
        seekTop=headerHeight+Math.round(12*density);
        timeTop=seekTop+Math.round(44*density);
        seekHeight=Math.round(44*density)+timeHeight;
        controlsTop=seekTop+seekHeight+Math.round(8*density);
        separateAux=contentWidth<action*5;
        controlsWidth=separateAux?contentWidth:contentWidth-action*2;
        auxTop=controlsTop+(separateAux?action+Math.round(8*density):0);
        height=auxTop+action+Math.round(2*IslandVisualSpec.PANEL_PADDING*density);
    }
}
