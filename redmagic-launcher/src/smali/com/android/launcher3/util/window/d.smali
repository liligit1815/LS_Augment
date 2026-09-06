.class public Lcom/android/launcher3/util/window/d;
.super Ljava/lang/Object;
.source "WindowManagerProxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/window/d$a;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/util/window/d;",
            ">;"
        }
    .end annotation
.end field

.field public static final MIN_TABLET_WIDTH:I = 0x258

.field private static final TAG:Ljava/lang/String; = "WindowManagerProxy"


# instance fields
.field protected final mTaskbarDrawnInProcess:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/window/c;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/util/window/c;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/launcher3/util/window/d;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/window/d;-><init>(Z)V

    return-void
.end method

.method protected constructor <init>(Z)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-boolean p1, p0, Lcom/android/launcher3/util/window/d;->mTaskbarDrawnInProcess:Z

    return-void
.end method

.method private static applyDisplayCutoutBottomInsetOverrideOnLargeScreen(Landroid/content/Context;ZILandroid/view/WindowInsets;Landroid/view/WindowInsets$Builder;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p3}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    invoke-virtual {p1}, Landroid/view/DisplayCutout;->getBoundingRectBottom()Landroid/graphics/Rect;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/util/window/d;->areBottomDisplayCutoutsSmallAndAtCorners(Landroid/graphics/Rect;ILandroid/content/res/Resources;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_2

    .line 24
    .line 25
    :goto_0
    return-void

    .line 26
    :cond_2
    invoke-static {}, Landroid/view/WindowInsets$Type;->displayCutout()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p3, p0}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget p1, p0, Landroid/graphics/Insets;->left:I

    .line 35
    .line 36
    iget p2, p0, Landroid/graphics/Insets;->top:I

    .line 37
    .line 38
    iget p0, p0, Landroid/graphics/Insets;->right:I

    .line 39
    .line 40
    const/4 p3, 0x0

    .line 41
    invoke-static {p1, p2, p0, p3}, Landroid/graphics/Insets;->of(IIII)Landroid/graphics/Insets;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {}, Landroid/view/WindowInsets$Type;->displayCutout()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-virtual {p4, p1, p0}, Landroid/view/WindowInsets$Builder;->setInsetsIgnoringVisibility(ILandroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method static areBottomDisplayCutoutsSmallAndAtCorners(Landroid/graphics/Rect;II)Z
    .locals 2

    .line 3
    invoke-virtual {p0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 4
    :cond_0
    iget v0, p0, Landroid/graphics/Rect;->right:I

    if-le v0, p2, :cond_2

    iget p0, p0, Landroid/graphics/Rect;->left:I

    sub-int/2addr p1, p2

    if-lt p0, p1, :cond_1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private static areBottomDisplayCutoutsSmallAndAtCorners(Landroid/graphics/Rect;ILandroid/content/res/Resources;)Z
    .locals 1

    const v0, 0x7f0706d4

    .line 1
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    .line 2
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/util/window/d;->areBottomDisplayCutoutsSmallAndAtCorners(Landroid/graphics/Rect;II)Z

    move-result p0

    return p0
.end method

.method private static dumpAssetPaths(Landroid/content/Context;Lcom/android/launcher3/util/C1;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "updateMode newMode: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, " UserId: "

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/content/Context;->getUserId()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p1, " assetPaths: "

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Landroid/content/res/AssetManager;->getApkAssets()[Landroid/content/res/ApkAssets;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    array-length p1, p0

    .line 44
    const/4 v1, 0x0

    .line 45
    :goto_0
    if-ge v1, p1, :cond_0

    .line 46
    .line 47
    aget-object v2, p0, v1

    .line 48
    .line 49
    const-string v3, "\n  "

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Landroid/content/res/ApkAssets;->getDebugName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    add-int/lit8 v1, v1, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    const-string p0, "WindowManagerProxy"

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public static getSafeInsets(Landroid/view/DisplayCutout;)Landroid/graphics/Rect;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/DisplayCutout;->getSafeInsetLeft()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p0}, Landroid/view/DisplayCutout;->getSafeInsetTop()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p0}, Landroid/view/DisplayCutout;->getSafeInsetRight()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-virtual {p0}, Landroid/view/DisplayCutout;->getSafeInsetBottom()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-direct {v0, v1, v2, v3, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method


# virtual methods
.method public estimateInternalDisplayBounds(Landroid/content/Context;)Landroid/util/ArrayMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Landroid/util/ArrayMap<",
            "Lcom/android/launcher3/util/window/a;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/p3;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/window/d;->getDisplayInfo(Landroid/content/Context;)Lcom/android/launcher3/util/window/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/window/a;->a(Lcom/android/launcher3/util/window/d;)Lcom/android/launcher3/util/window/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/util/window/d;->estimateWindowBounds(Landroid/content/Context;Lcom/android/launcher3/util/window/a;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Landroid/util/ArrayMap;

    .line 14
    .line 15
    invoke-direct {p1}, Landroid/util/ArrayMap;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0, p0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    return-object p1
.end method

.method protected estimateWindowBounds(Landroid/content/Context;Lcom/android/launcher3/util/window/a;)Ljava/util/List;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/util/window/a;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/p3;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    move-object/from16 v7, p2

    .line 6
    .line 7
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget v1, v1, Landroid/content/res/Configuration;->densityDpi:I

    .line 16
    .line 17
    iget v4, v7, Lcom/android/launcher3/util/window/a;->b:I

    .line 18
    .line 19
    iget-object v2, v7, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    .line 20
    .line 21
    iget v3, v2, Landroid/graphics/Point;->x:I

    .line 22
    .line 23
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 24
    .line 25
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    int-to-float v2, v2

    .line 30
    invoke-static {v2, v1}, Lcom/android/launcher3/N5;->j(FI)F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    float-to-int v1, v1

    .line 35
    new-instance v2, Landroid/content/res/Configuration;

    .line 36
    .line 37
    invoke-direct {v2}, Landroid/content/res/Configuration;-><init>()V

    .line 38
    .line 39
    .line 40
    iput v1, v2, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    .line 41
    .line 42
    invoke-virtual {v6, v2}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const/4 v8, 0x0

    .line 51
    invoke-static {v6, v2, v8}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 52
    .line 53
    .line 54
    const/16 v3, 0x258

    .line 55
    .line 56
    const/4 v5, 0x1

    .line 57
    if-lt v1, v3, :cond_0

    .line 58
    .line 59
    move v1, v5

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    move v1, v8

    .line 62
    :goto_0
    if-nez v1, :cond_2

    .line 63
    .line 64
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/util/window/d;->isGestureNav(Landroid/content/Context;)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    move v5, v8

    .line 72
    :cond_2
    :goto_1
    const-string v3, "status_bar_height_portrait"

    .line 73
    .line 74
    const-string v9, "status_bar_height"

    .line 75
    .line 76
    invoke-virtual {v0, v2, v3, v9}, Lcom/android/launcher3/util/window/d;->getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    const-string v10, "status_bar_height_landscape"

    .line 81
    .line 82
    invoke-virtual {v0, v2, v10, v9}, Lcom/android/launcher3/util/window/d;->getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 87
    .line 88
    .line 89
    move-result v10

    .line 90
    if-eqz v10, :cond_3

    .line 91
    .line 92
    const-string v3, "status_bar_height_default"

    .line 93
    .line 94
    invoke-virtual {v0, v2, v3}, Lcom/android/launcher3/util/window/d;->getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    move v9, v3

    .line 99
    move v10, v9

    .line 100
    goto :goto_2

    .line 101
    :cond_3
    move v10, v9

    .line 102
    move v9, v3

    .line 103
    :goto_2
    const v3, 0x7f070baf

    .line 104
    .line 105
    .line 106
    if-eqz v1, :cond_5

    .line 107
    .line 108
    iget-boolean v11, v0, Lcom/android/launcher3/util/window/d;->mTaskbarDrawnInProcess:Z

    .line 109
    .line 110
    if-eqz v11, :cond_4

    .line 111
    .line 112
    move v11, v8

    .line 113
    goto :goto_3

    .line 114
    :cond_4
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 115
    .line 116
    .line 117
    move-result-object v11

    .line 118
    invoke-virtual {v11, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 119
    .line 120
    .line 121
    move-result v11

    .line 122
    goto :goto_3

    .line 123
    :cond_5
    const-string v11, "navigation_bar_height"

    .line 124
    .line 125
    invoke-virtual {v0, v2, v11}, Lcom/android/launcher3/util/window/d;->getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v11

    .line 129
    :goto_3
    if-eqz v1, :cond_8

    .line 130
    .line 131
    iget-boolean v1, v0, Lcom/android/launcher3/util/window/d;->mTaskbarDrawnInProcess:Z

    .line 132
    .line 133
    if-eqz v1, :cond_7

    .line 134
    .line 135
    :cond_6
    move v12, v8

    .line 136
    goto :goto_5

    .line 137
    :cond_7
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    :goto_4
    move v12, v1

    .line 146
    goto :goto_5

    .line 147
    :cond_8
    if-eqz v5, :cond_6

    .line 148
    .line 149
    const-string v1, "navigation_bar_height_landscape"

    .line 150
    .line 151
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/util/window/d;->getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    goto :goto_4

    .line 156
    :goto_5
    if-eqz v5, :cond_9

    .line 157
    .line 158
    move v13, v8

    .line 159
    goto :goto_6

    .line 160
    :cond_9
    const-string v1, "navigation_bar_width"

    .line 161
    .line 162
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/util/window/d;->getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    move v13, v1

    .line 167
    :goto_6
    new-instance v14, Ljava/util/ArrayList;

    .line 168
    .line 169
    const/4 v15, 0x4

    .line 170
    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(I)V

    .line 171
    .line 172
    .line 173
    new-instance v1, Landroid/graphics/Point;

    .line 174
    .line 175
    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 176
    .line 177
    .line 178
    move v5, v8

    .line 179
    :goto_7
    if-ge v5, v15, :cond_e

    .line 180
    .line 181
    invoke-static {v4, v5}, Lcom/android/launcher3/util/X1;->a(II)I

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    iget-object v3, v7, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    .line 186
    .line 187
    iget v15, v3, Landroid/graphics/Point;->x:I

    .line 188
    .line 189
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 190
    .line 191
    invoke-virtual {v1, v15, v3}, Landroid/graphics/Point;->set(II)V

    .line 192
    .line 193
    .line 194
    invoke-static {v1, v2}, Lcom/android/launcher3/util/X1;->c(Landroid/graphics/Point;I)V

    .line 195
    .line 196
    .line 197
    new-instance v15, Landroid/graphics/Rect;

    .line 198
    .line 199
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 200
    .line 201
    iget v3, v1, Landroid/graphics/Point;->y:I

    .line 202
    .line 203
    invoke-direct {v15, v8, v8, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 204
    .line 205
    .line 206
    iget v2, v1, Landroid/graphics/Point;->y:I

    .line 207
    .line 208
    iget v3, v1, Landroid/graphics/Point;->x:I

    .line 209
    .line 210
    if-le v2, v3, :cond_a

    .line 211
    .line 212
    move/from16 v16, v8

    .line 213
    .line 214
    move v3, v9

    .line 215
    move v2, v11

    .line 216
    :goto_8
    move-object/from16 v17, v1

    .line 217
    .line 218
    goto :goto_9

    .line 219
    :cond_a
    move v3, v10

    .line 220
    move v2, v12

    .line 221
    move/from16 v16, v13

    .line 222
    .line 223
    goto :goto_8

    .line 224
    :goto_9
    iget-object v1, v7, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 225
    .line 226
    iget-object v8, v7, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    .line 227
    .line 228
    move/from16 v18, v2

    .line 229
    .line 230
    iget v2, v8, Landroid/graphics/Point;->x:I

    .line 231
    .line 232
    iget v8, v8, Landroid/graphics/Point;->y:I

    .line 233
    .line 234
    move v6, v3

    .line 235
    move v3, v8

    .line 236
    move/from16 v8, v18

    .line 237
    .line 238
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/util/window/d;->rotateCutout(Landroid/view/DisplayCutout;IIII)Landroid/view/DisplayCutout;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    invoke-static {v1}, Lcom/android/launcher3/util/window/d;->getSafeInsets(Landroid/view/DisplayCutout;)Landroid/graphics/Rect;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {v1}, Landroid/view/DisplayCutout;->getBoundingRectBottom()Landroid/graphics/Rect;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    invoke-virtual {v15}, Landroid/graphics/Rect;->width()I

    .line 251
    .line 252
    .line 253
    move-result v2

    .line 254
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/util/window/d;->areBottomDisplayCutoutsSmallAndAtCorners(Landroid/graphics/Rect;ILandroid/content/res/Resources;)Z

    .line 259
    .line 260
    .line 261
    move-result v1

    .line 262
    if-eqz v1, :cond_b

    .line 263
    .line 264
    const/4 v1, 0x0

    .line 265
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 266
    .line 267
    goto :goto_a

    .line 268
    :cond_b
    const/4 v1, 0x0

    .line 269
    :goto_a
    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 270
    .line 271
    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    .line 272
    .line 273
    .line 274
    move-result v2

    .line 275
    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 276
    .line 277
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 278
    .line 279
    invoke-static {v2, v8}, Ljava/lang/Math;->max(II)I

    .line 280
    .line 281
    .line 282
    move-result v2

    .line 283
    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 284
    .line 285
    const/4 v2, 0x3

    .line 286
    if-eq v5, v2, :cond_c

    .line 287
    .line 288
    const/4 v2, 0x2

    .line 289
    if-ne v5, v2, :cond_d

    .line 290
    .line 291
    :cond_c
    move/from16 v8, v16

    .line 292
    .line 293
    goto :goto_b

    .line 294
    :cond_d
    iget v2, v0, Landroid/graphics/Rect;->right:I

    .line 295
    .line 296
    move/from16 v8, v16

    .line 297
    .line 298
    invoke-static {v2, v8}, Ljava/lang/Math;->max(II)I

    .line 299
    .line 300
    .line 301
    move-result v2

    .line 302
    iput v2, v0, Landroid/graphics/Rect;->right:I

    .line 303
    .line 304
    goto :goto_c

    .line 305
    :goto_b
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 306
    .line 307
    invoke-static {v2, v8}, Ljava/lang/Math;->max(II)I

    .line 308
    .line 309
    .line 310
    move-result v2

    .line 311
    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 312
    .line 313
    :goto_c
    new-instance v2, Lcom/android/launcher3/util/p3;

    .line 314
    .line 315
    invoke-direct {v2, v15, v0, v5}, Lcom/android/launcher3/util/p3;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 316
    .line 317
    .line 318
    invoke-interface {v14, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    add-int/lit8 v5, v5, 0x1

    .line 322
    .line 323
    move-object/from16 v0, p0

    .line 324
    .line 325
    move-object/from16 v6, p1

    .line 326
    .line 327
    move v8, v1

    .line 328
    move-object/from16 v1, v17

    .line 329
    .line 330
    const/4 v15, 0x4

    .line 331
    goto/16 :goto_7

    .line 332
    .line 333
    :cond_e
    return-object v14
.end method

.method public getCurrentBounds(Landroid/content/Context;)Landroid/graphics/Rect;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget v0, p1, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 17
    .line 18
    mul-float/2addr v0, v1

    .line 19
    iget p1, p1, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 20
    .line 21
    int-to-float p1, p1

    .line 22
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 27
    .line 28
    mul-float/2addr p1, p0

    .line 29
    new-instance p0, Landroid/graphics/Rect;

    .line 30
    .line 31
    float-to-int v0, v0

    .line 32
    float-to-int p1, p1

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-direct {p0, v1, v1, v0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 35
    .line 36
    .line 37
    return-object p0
.end method

.method protected getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    .line 1
    invoke-static {p2, p1, p0}, Lc2/a;->b(Ljava/lang/String;Landroid/content/res/Resources;I)I

    move-result p0

    return p0
.end method

.method protected getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    const/4 v0, -0x1

    .line 2
    invoke-static {p2, p1, v0}, Lc2/a;->b(Ljava/lang/String;Landroid/content/res/Resources;I)I

    move-result p2

    if-le p2, v0, :cond_0

    return p2

    .line 3
    :cond_0
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/util/window/d;->getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method protected getDisplay(Landroid/content/Context;)Landroid/view/Display;
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getDisplay()Landroid/view/Display;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    const-class p0, Landroid/hardware/display/DisplayManager;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/hardware/display/DisplayManager;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public getDisplayInfo(Landroid/content/Context;)Lcom/android/launcher3/util/window/a;
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/window/d;->getRotation(Landroid/content/Context;)I

    move-result v0

    .line 2
    const-class v1, Landroid/view/WindowManager;

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    .line 3
    invoke-interface {p1}, Landroid/view/WindowManager;->getMaximumWindowMetrics()Landroid/view/WindowMetrics;

    move-result-object p1

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/util/window/d;->getDisplayInfo(Landroid/view/WindowMetrics;I)Lcom/android/launcher3/util/window/a;

    move-result-object p0

    return-object p0
.end method

.method public getDisplayInfo(Landroid/view/WindowMetrics;I)Lcom/android/launcher3/util/window/a;
    .locals 2

    .line 5
    new-instance p0, Landroid/graphics/Point;

    invoke-virtual {p1}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget v0, v0, Landroid/graphics/Rect;->right:I

    invoke-virtual {p1}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    invoke-direct {p0, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 6
    new-instance v0, Lcom/android/launcher3/util/window/a;

    .line 7
    invoke-virtual {p1}, Landroid/view/WindowMetrics;->getWindowInsets()Landroid/view/WindowInsets;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    move-result-object p1

    invoke-direct {v0, p0, p2, p1}, Lcom/android/launcher3/util/window/a;-><init>(Landroid/graphics/Point;ILandroid/view/DisplayCutout;)V

    return-object v0
.end method

.method public getNavigationMode(Landroid/content/Context;)Lcom/android/launcher3/util/C1;
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "config_navBarInteractionMode"

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    invoke-static {v0, p0, v1}, Lc2/a;->c(Ljava/lang/String;Landroid/content/res/Resources;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-ne p0, v1, :cond_0

    .line 13
    .line 14
    const-string p0, "WindowManagerProxy"

    .line 15
    .line 16
    const-string p1, "Failed to get system resource ID. Incompatible framework version?"

    .line 17
    .line 18
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-static {}, Lcom/android/launcher3/util/C1;->values()[Lcom/android/launcher3/util/C1;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    array-length v1, v0

    .line 27
    const/4 v2, 0x0

    .line 28
    :goto_0
    if-ge v2, v1, :cond_2

    .line 29
    .line 30
    aget-object v3, v0, v2

    .line 31
    .line 32
    iget v4, v3, Lcom/android/launcher3/util/C1;->h:I

    .line 33
    .line 34
    if-ne v4, p0, :cond_1

    .line 35
    .line 36
    invoke-static {p1, v3}, Lcom/android/launcher3/util/window/d;->dumpAssetPaths(Landroid/content/Context;Lcom/android/launcher3/util/C1;)V

    .line 37
    .line 38
    .line 39
    return-object v3

    .line 40
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    :goto_1
    sget-object p0, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 44
    .line 45
    return-object p0
.end method

.method public getRealBounds(Landroid/content/Context;Lcom/android/launcher3/util/window/a;)Lcom/android/launcher3/util/p3;
    .locals 3

    .line 1
    const-class v0, Landroid/view/WindowManager;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/WindowManager;

    .line 8
    .line 9
    invoke-interface {v0}, Landroid/view/WindowManager;->getMaximumWindowMetrics()Landroid/view/WindowMetrics;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/WindowMetrics;->getWindowInsets()Landroid/view/WindowInsets;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {p0, p1, v2, v1}, Lcom/android/launcher3/util/window/d;->normalizeWindowInsets(Landroid/content/Context;Landroid/view/WindowInsets;Landroid/graphics/Rect;)Landroid/view/WindowInsets;

    .line 23
    .line 24
    .line 25
    new-instance p0, Lcom/android/launcher3/util/p3;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget p2, p2, Lcom/android/launcher3/util/window/a;->b:I

    .line 32
    .line 33
    invoke-direct {p0, p1, v1, p2}, Lcom/android/launcher3/util/p3;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 34
    .line 35
    .line 36
    return-object p0
.end method

.method public getRotation(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/window/d;->getDisplay(Landroid/content/Context;)Landroid/view/Display;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method protected getStatusBarHeight(Landroid/content/Context;ZI)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string p2, "status_bar_height_portrait"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p2, "status_bar_height_landscape"

    .line 11
    .line 12
    :goto_0
    const-string v0, "status_bar_height"

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher3/util/window/d;->getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string p2, "status_bar_height_default"

    .line 25
    .line 26
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/window/d;->getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    :cond_1
    invoke-static {p3, p2}, Ljava/lang/Math;->max(II)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method protected isGestureNav(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, -0x1

    .line 6
    const-string v0, "config_navBarInteractionMode"

    .line 7
    .line 8
    invoke-static {v0, p0, p1}, Lc2/a;->c(Ljava/lang/String;Landroid/content/res/Resources;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const/4 p1, 0x2

    .line 13
    if-ne p0, p1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public isHomeVisible(Landroid/content/Context;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isInDesktopMode(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isTaskbarDrawnInProcess()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/window/d;->mTaskbarDrawnInProcess:Z

    .line 2
    .line 3
    return p0
.end method

.method public normalizeWindowInsets(Landroid/content/Context;Landroid/view/WindowInsets;Landroid/graphics/Rect;)Landroid/view/WindowInsets;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    iget-boolean v4, v0, Lcom/android/launcher3/util/window/d;->mTaskbarDrawnInProcess:Z

    .line 10
    .line 11
    if-nez v4, :cond_0

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    invoke-virtual {v3, v0, v1, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 30
    .line 31
    .line 32
    return-object v2

    .line 33
    :cond_0
    new-instance v4, Landroid/view/WindowInsets$Builder;

    .line 34
    .line 35
    invoke-direct {v4, v2}, Landroid/view/WindowInsets$Builder;-><init>(Landroid/view/WindowInsets;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    invoke-virtual {v2, v5}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    invoke-virtual {v6}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    iget v8, v7, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    .line 55
    .line 56
    const/16 v9, 0x258

    .line 57
    .line 58
    const/4 v10, 0x1

    .line 59
    if-le v8, v9, :cond_1

    .line 60
    .line 61
    move v8, v10

    .line 62
    goto :goto_0

    .line 63
    :cond_1
    const/4 v8, 0x0

    .line 64
    :goto_0
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/util/window/d;->isGestureNav(Landroid/content/Context;)Z

    .line 65
    .line 66
    .line 67
    move-result v9

    .line 68
    iget v12, v7, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 69
    .line 70
    iget v13, v7, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 71
    .line 72
    if-le v12, v13, :cond_2

    .line 73
    .line 74
    move v12, v10

    .line 75
    goto :goto_1

    .line 76
    :cond_2
    const/4 v12, 0x0

    .line 77
    :goto_1
    if-eqz v8, :cond_4

    .line 78
    .line 79
    :cond_3
    const/4 v13, 0x0

    .line 80
    goto :goto_2

    .line 81
    :cond_4
    if-eqz v12, :cond_5

    .line 82
    .line 83
    const-string v13, "navigation_bar_height"

    .line 84
    .line 85
    invoke-virtual {v0, v6, v13}, Lcom/android/launcher3/util/window/d;->getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v13

    .line 89
    goto :goto_2

    .line 90
    :cond_5
    if-eqz v9, :cond_3

    .line 91
    .line 92
    const-string v13, "navigation_bar_height_landscape"

    .line 93
    .line 94
    invoke-virtual {v0, v6, v13}, Lcom/android/launcher3/util/window/d;->getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v13

    .line 98
    :goto_2
    iget v14, v5, Landroid/graphics/Insets;->left:I

    .line 99
    .line 100
    iget v15, v5, Landroid/graphics/Insets;->right:I

    .line 101
    .line 102
    if-nez v8, :cond_8

    .line 103
    .line 104
    if-nez v9, :cond_8

    .line 105
    .line 106
    if-nez v12, :cond_8

    .line 107
    .line 108
    const-string v11, "navigation_bar_width"

    .line 109
    .line 110
    invoke-virtual {v0, v6, v11}, Lcom/android/launcher3/util/window/d;->getDimenByName(Landroid/content/res/Resources;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v6

    .line 114
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/util/window/d;->getRotation(Landroid/content/Context;)I

    .line 115
    .line 116
    .line 117
    move-result v11

    .line 118
    if-eq v11, v10, :cond_7

    .line 119
    .line 120
    const/4 v10, 0x3

    .line 121
    if-eq v11, v10, :cond_6

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_6
    move v14, v6

    .line 125
    goto :goto_3

    .line 126
    :cond_7
    move v15, v6

    .line 127
    :cond_8
    :goto_3
    iget v5, v5, Landroid/graphics/Insets;->top:I

    .line 128
    .line 129
    invoke-static {v14, v5, v15, v13}, Landroid/graphics/Insets;->of(IIII)Landroid/graphics/Insets;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    .line 134
    .line 135
    .line 136
    move-result v6

    .line 137
    invoke-virtual {v4, v6, v5}, Landroid/view/WindowInsets$Builder;->setInsets(ILandroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 138
    .line 139
    .line 140
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    .line 141
    .line 142
    .line 143
    move-result v6

    .line 144
    invoke-virtual {v4, v6, v5}, Landroid/view/WindowInsets$Builder;->setInsetsIgnoringVisibility(ILandroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 145
    .line 146
    .line 147
    invoke-static {}, Landroid/view/WindowInsets$Type;->statusBars()I

    .line 148
    .line 149
    .line 150
    move-result v5

    .line 151
    invoke-virtual {v2, v5}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    iget v6, v5, Landroid/graphics/Insets;->left:I

    .line 156
    .line 157
    iget v10, v5, Landroid/graphics/Insets;->top:I

    .line 158
    .line 159
    invoke-virtual {v0, v1, v12, v10}, Lcom/android/launcher3/util/window/d;->getStatusBarHeight(Landroid/content/Context;ZI)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    iget v10, v5, Landroid/graphics/Insets;->right:I

    .line 164
    .line 165
    iget v5, v5, Landroid/graphics/Insets;->bottom:I

    .line 166
    .line 167
    invoke-static {v6, v0, v10, v5}, Landroid/graphics/Insets;->of(IIII)Landroid/graphics/Insets;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-static {}, Landroid/view/WindowInsets$Type;->statusBars()I

    .line 172
    .line 173
    .line 174
    move-result v5

    .line 175
    invoke-virtual {v4, v5, v0}, Landroid/view/WindowInsets$Builder;->setInsets(ILandroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 176
    .line 177
    .line 178
    invoke-static {}, Landroid/view/WindowInsets$Type;->statusBars()I

    .line 179
    .line 180
    .line 181
    move-result v5

    .line 182
    invoke-virtual {v4, v5, v0}, Landroid/view/WindowInsets$Builder;->setInsetsIgnoringVisibility(ILandroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 183
    .line 184
    .line 185
    if-eqz v9, :cond_9

    .line 186
    .line 187
    invoke-static {}, Landroid/view/WindowInsets$Type;->tappableElement()I

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    invoke-virtual {v2, v0}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iget v5, v0, Landroid/graphics/Insets;->left:I

    .line 196
    .line 197
    iget v6, v0, Landroid/graphics/Insets;->top:I

    .line 198
    .line 199
    iget v0, v0, Landroid/graphics/Insets;->right:I

    .line 200
    .line 201
    const/4 v9, 0x0

    .line 202
    invoke-static {v5, v6, v0, v9}, Landroid/graphics/Insets;->of(IIII)Landroid/graphics/Insets;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-static {}, Landroid/view/WindowInsets$Type;->tappableElement()I

    .line 207
    .line 208
    .line 209
    move-result v5

    .line 210
    invoke-virtual {v4, v5, v0}, Landroid/view/WindowInsets$Builder;->setInsets(ILandroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 211
    .line 212
    .line 213
    :cond_9
    iget v0, v7, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 214
    .line 215
    int-to-float v0, v0

    .line 216
    invoke-static {v0}, Lcom/android/launcher3/N5;->i(F)I

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    invoke-static {v1, v8, v0, v2, v4}, Lcom/android/launcher3/util/window/d;->applyDisplayCutoutBottomInsetOverrideOnLargeScreen(Landroid/content/Context;ZILandroid/view/WindowInsets;Landroid/view/WindowInsets$Builder;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v4}, Landroid/view/WindowInsets$Builder;->build()Landroid/view/WindowInsets;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    invoke-static {}, Landroid/view/WindowInsets$Type;->displayCutout()I

    .line 232
    .line 233
    .line 234
    move-result v2

    .line 235
    or-int/2addr v1, v2

    .line 236
    invoke-virtual {v0, v1}, Landroid/view/WindowInsets;->getInsetsIgnoringVisibility(I)Landroid/graphics/Insets;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    iget v2, v1, Landroid/graphics/Insets;->left:I

    .line 241
    .line 242
    iget v4, v1, Landroid/graphics/Insets;->top:I

    .line 243
    .line 244
    iget v5, v1, Landroid/graphics/Insets;->right:I

    .line 245
    .line 246
    iget v1, v1, Landroid/graphics/Insets;->bottom:I

    .line 247
    .line 248
    invoke-virtual {v3, v2, v4, v5, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 249
    .line 250
    .line 251
    return-object v0
.end method

.method public registerDesktopVisibilityListener(Lcom/android/launcher3/util/window/d$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected rotateCutout(Landroid/view/DisplayCutout;IIII)Landroid/view/DisplayCutout;
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/util/window/d;->getSafeInsets(Landroid/view/DisplayCutout;)Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p4, p5}, Lcom/android/launcher3/util/X1;->a(II)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p0, p1}, Lcom/android/launcher3/util/X1;->b(Landroid/graphics/Rect;I)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Landroid/view/DisplayCutout;

    .line 13
    .line 14
    invoke-static {p0}, Landroid/graphics/Insets;->of(Landroid/graphics/Rect;)Landroid/graphics/Insets;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v4, 0x0

    .line 19
    const/4 v5, 0x0

    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-direct/range {v0 .. v5}, Landroid/view/DisplayCutout;-><init>(Landroid/graphics/Insets;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public showDesktopTaskbarForFreeformDisplay(Landroid/content/Context;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public showLockedTaskbarOnHome(Landroid/content/Context;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public unregisterDesktopVisibilityListener(Lcom/android/launcher3/util/window/d$a;)V
    .locals 0

    .line 1
    return-void
.end method
