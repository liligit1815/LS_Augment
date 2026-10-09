package com.android.systemui.statusbar.pipeline.wifi.ui.view;
public class ModernStatusBarWifiView extends android.widget.FrameLayout implements com.android.systemui.statusbar.StatusIconDisplayable {
    public boolean iconVisible=true,iconBlocked=false;
    public ModernStatusBarWifiView(android.content.Context c){super(c);}
    public boolean isIconVisible(){return iconVisible;}
    public boolean isIconBlocked(){return iconBlocked;}
    public String getSlot(){return "wifi";}
}
