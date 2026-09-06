.class public Lcom/android/systemui/shared/recents/utilities/Utilities;
.super Ljava/lang/Object;
.source "Utilities.java"


# static fields
.field private static final TABLET_MIN_DPS:F = 600.0f


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static clamp(FFF)F
    .locals 0

    .line 1
    invoke-static {p2, p0}, Ljava/lang/Math;->min(FF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static computeContrastBetweenColors(II)F
    .locals 14

    .line 1
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x437f0000    # 255.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    int-to-float v2, v2

    .line 14
    div-float/2addr v2, v1

    .line 15
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    div-float/2addr p0, v1

    .line 21
    const v3, 0x3d20e411    # 0.03928f

    .line 22
    .line 23
    .line 24
    cmpg-float v4, v0, v3

    .line 25
    .line 26
    const-wide v5, 0x4003333340000000L    # 2.4000000953674316

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    const v7, 0x3f870a3d    # 1.055f

    .line 32
    .line 33
    .line 34
    const v8, 0x3d6147ae    # 0.055f

    .line 35
    .line 36
    .line 37
    const v9, 0x414eb852    # 12.92f

    .line 38
    .line 39
    .line 40
    if-gez v4, :cond_0

    .line 41
    .line 42
    div-float/2addr v0, v9

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    add-float/2addr v0, v8

    .line 45
    div-float/2addr v0, v7

    .line 46
    float-to-double v10, v0

    .line 47
    invoke-static {v10, v11, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 48
    .line 49
    .line 50
    move-result-wide v10

    .line 51
    double-to-float v0, v10

    .line 52
    :goto_0
    cmpg-float v4, v2, v3

    .line 53
    .line 54
    if-gez v4, :cond_1

    .line 55
    .line 56
    div-float/2addr v2, v9

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    add-float/2addr v2, v8

    .line 59
    div-float/2addr v2, v7

    .line 60
    float-to-double v10, v2

    .line 61
    invoke-static {v10, v11, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 62
    .line 63
    .line 64
    move-result-wide v10

    .line 65
    double-to-float v2, v10

    .line 66
    :goto_1
    cmpg-float v4, p0, v3

    .line 67
    .line 68
    if-gez v4, :cond_2

    .line 69
    .line 70
    div-float/2addr p0, v9

    .line 71
    goto :goto_2

    .line 72
    :cond_2
    add-float/2addr p0, v8

    .line 73
    div-float/2addr p0, v7

    .line 74
    float-to-double v10, p0

    .line 75
    invoke-static {v10, v11, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 76
    .line 77
    .line 78
    move-result-wide v10

    .line 79
    double-to-float p0, v10

    .line 80
    :goto_2
    const v4, 0x3e59b3d0    # 0.2126f

    .line 81
    .line 82
    .line 83
    mul-float/2addr v0, v4

    .line 84
    const v10, 0x3f371759    # 0.7152f

    .line 85
    .line 86
    .line 87
    mul-float/2addr v2, v10

    .line 88
    add-float/2addr v0, v2

    .line 89
    const v2, 0x3d93dd98    # 0.0722f

    .line 90
    .line 91
    .line 92
    mul-float/2addr p0, v2

    .line 93
    add-float/2addr v0, p0

    .line 94
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    int-to-float p0, p0

    .line 99
    div-float/2addr p0, v1

    .line 100
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    .line 101
    .line 102
    .line 103
    move-result v11

    .line 104
    int-to-float v11, v11

    .line 105
    div-float/2addr v11, v1

    .line 106
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    int-to-float p1, p1

    .line 111
    div-float/2addr p1, v1

    .line 112
    cmpg-float v1, p0, v3

    .line 113
    .line 114
    if-gez v1, :cond_3

    .line 115
    .line 116
    div-float/2addr p0, v9

    .line 117
    goto :goto_3

    .line 118
    :cond_3
    add-float/2addr p0, v8

    .line 119
    div-float/2addr p0, v7

    .line 120
    float-to-double v12, p0

    .line 121
    invoke-static {v12, v13, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 122
    .line 123
    .line 124
    move-result-wide v12

    .line 125
    double-to-float p0, v12

    .line 126
    :goto_3
    cmpg-float v1, v11, v3

    .line 127
    .line 128
    if-gez v1, :cond_4

    .line 129
    .line 130
    div-float/2addr v11, v9

    .line 131
    goto :goto_4

    .line 132
    :cond_4
    add-float/2addr v11, v8

    .line 133
    div-float/2addr v11, v7

    .line 134
    float-to-double v11, v11

    .line 135
    invoke-static {v11, v12, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 136
    .line 137
    .line 138
    move-result-wide v11

    .line 139
    double-to-float v11, v11

    .line 140
    :goto_4
    cmpg-float v1, p1, v3

    .line 141
    .line 142
    if-gez v1, :cond_5

    .line 143
    .line 144
    div-float/2addr p1, v9

    .line 145
    goto :goto_5

    .line 146
    :cond_5
    add-float/2addr p1, v8

    .line 147
    div-float/2addr p1, v7

    .line 148
    float-to-double v7, p1

    .line 149
    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 150
    .line 151
    .line 152
    move-result-wide v5

    .line 153
    double-to-float p1, v5

    .line 154
    :goto_5
    mul-float/2addr p0, v4

    .line 155
    mul-float/2addr v11, v10

    .line 156
    add-float/2addr p0, v11

    .line 157
    mul-float/2addr p1, v2

    .line 158
    add-float/2addr p0, p1

    .line 159
    const p1, 0x3d4ccccd    # 0.05f

    .line 160
    .line 161
    .line 162
    add-float/2addr p0, p1

    .line 163
    add-float/2addr v0, p1

    .line 164
    div-float/2addr p0, v0

    .line 165
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    return p0
.end method

.method public static dpiFromPx(FI)F
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x43200000    # 160.0f

    .line 3
    .line 4
    div-float/2addr p1, v0

    .line 5
    div-float/2addr p0, p1

    .line 6
    return p0
.end method

.method public static isFreeformTask(Lcom/android/systemui/shared/recents/model/Task;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/Task;->getKey()Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/Task;->getKey()Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->windowingMode:I

    .line 14
    .line 15
    const/4 v0, 0x5

    .line 16
    if-ne p0, v0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public static isLargeScreen(Landroid/content/Context;)Z
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1e
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/android/systemui/utils/windowmanager/WindowManagerUtils;->getWindowManager(Landroid/content/Context;)Landroid/view/WindowManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/systemui/shared/recents/utilities/Utilities;->isLargeScreen(Landroid/view/WindowManager;Landroid/content/res/Resources;)Z

    move-result p0

    return p0
.end method

.method public static isLargeScreen(Landroid/view/WindowManager;Landroid/content/res/Resources;)Z
    .locals 1

    .line 2
    invoke-interface {p0}, Landroid/view/WindowManager;->getCurrentWindowMetrics()Landroid/view/WindowMetrics;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    move-result-object p0

    .line 3
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    int-to-float p0, p0

    .line 4
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->densityDpi:I

    .line 5
    invoke-static {p0, p1}, Lcom/android/systemui/shared/recents/utilities/Utilities;->dpiFromPx(FI)F

    move-result p0

    const/high16 p1, 0x44160000    # 600.0f

    cmpl-float p0, p0, p1

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isRelativePercentDifferenceGreaterThan(FFF)Z
    .locals 1

    .line 1
    sub-float v0, p0, p1

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-float/2addr p0, p1

    .line 8
    const/high16 p1, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr p0, p1

    .line 11
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    div-float/2addr v0, p0

    .line 16
    cmpl-float p0, v0, p2

    .line 17
    .line 18
    if-lez p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public static isRotationAnimationCCW(II)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    if-ne p1, v1, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    const/4 v2, 0x2

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    if-ne p1, v2, :cond_1

    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    const/4 v3, 0x3

    .line 15
    if-nez p0, :cond_2

    .line 16
    .line 17
    if-ne p1, v3, :cond_2

    .line 18
    .line 19
    return v1

    .line 20
    :cond_2
    if-ne p0, v1, :cond_3

    .line 21
    .line 22
    if-nez p1, :cond_3

    .line 23
    .line 24
    return v1

    .line 25
    :cond_3
    if-ne p0, v1, :cond_4

    .line 26
    .line 27
    if-ne p1, v2, :cond_4

    .line 28
    .line 29
    return v0

    .line 30
    :cond_4
    if-ne p0, v1, :cond_5

    .line 31
    .line 32
    if-ne p1, v3, :cond_5

    .line 33
    .line 34
    return v1

    .line 35
    :cond_5
    if-ne p0, v2, :cond_6

    .line 36
    .line 37
    if-nez p1, :cond_6

    .line 38
    .line 39
    return v1

    .line 40
    :cond_6
    if-ne p0, v2, :cond_7

    .line 41
    .line 42
    if-ne p1, v1, :cond_7

    .line 43
    .line 44
    return v1

    .line 45
    :cond_7
    if-ne p0, v2, :cond_8

    .line 46
    .line 47
    if-ne p1, v3, :cond_8

    .line 48
    .line 49
    return v0

    .line 50
    :cond_8
    if-ne p0, v3, :cond_9

    .line 51
    .line 52
    if-nez p1, :cond_9

    .line 53
    .line 54
    return v0

    .line 55
    :cond_9
    if-ne p0, v3, :cond_a

    .line 56
    .line 57
    if-ne p1, v1, :cond_a

    .line 58
    .line 59
    return v1

    .line 60
    :cond_a
    if-ne p0, v3, :cond_b

    .line 61
    .line 62
    if-ne p1, v2, :cond_b

    .line 63
    .line 64
    return v1

    .line 65
    :cond_b
    return v0
.end method

.method public static postAtFrontOfQueueAsynchronously(Landroid/os/Handler;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/os/Message;->setCallback(Ljava/lang/Runnable;)Landroid/os/Message;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessageAtFrontOfQueue(Landroid/os/Message;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static updateNavbarFlagsFromIme(IIZZ)I
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eq p1, v1, :cond_1

    .line 6
    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    if-eq p1, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    and-int/lit8 p0, p0, -0x2

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    if-eqz p2, :cond_0

    .line 17
    .line 18
    or-int/lit8 p0, p0, 0x1

    .line 19
    .line 20
    :goto_0
    if-eqz p2, :cond_2

    .line 21
    .line 22
    or-int/2addr p0, v0

    .line 23
    goto :goto_1

    .line 24
    :cond_2
    and-int/lit8 p0, p0, -0x3

    .line 25
    .line 26
    :goto_1
    if-eqz p3, :cond_3

    .line 27
    .line 28
    if-eqz p2, :cond_3

    .line 29
    .line 30
    or-int/lit8 p0, p0, 0x4

    .line 31
    .line 32
    return p0

    .line 33
    :cond_3
    and-int/lit8 p0, p0, -0x5

    .line 34
    .line 35
    return p0
.end method
