package com.android.quickstep.orientation;

import android.view.View;

public interface RecentsPagedOrientationHandler {
    int getPrimaryScroll(View view);
    int getPrimarySize(View view);
    int getChildStart(View view);
    float getPrimaryValue(float x, float y);
    float getSecondaryValue(float x, float y);
}
