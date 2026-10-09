package com.android.systemui.statusbar;
public interface StatusIconDisplayable {
    boolean isIconVisible();
    boolean isIconBlocked();
    String getSlot();
}
