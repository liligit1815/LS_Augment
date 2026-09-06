.class public Lcom/android/launcher3/widget/H0;
.super Ln1/d;
.source "PendingItemDragHelper.java"


# instance fields
.field private final i:Lcom/android/launcher3/W4;

.field private j:[I

.field private k:Landroid/widget/RemoteViews;

.field private l:F

.field private m:Lcom/android/launcher3/widget/x0;

.field private final n:F

.field public o:Z

.field private p:Landroid/widget/RemoteViews;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ln1/d;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/android/launcher3/widget/H0;->l:F

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/android/launcher3/W4;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/launcher3/widget/H0;->i:Lcom/android/launcher3/W4;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput p1, p0, Lcom/android/launcher3/widget/H0;->n:F

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic t(Landroid/view/View;Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private u(Lcom/android/launcher3/widget/x0;Lcom/android/launcher3/C2;Landroid/widget/RemoteViews;I)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/H0;->i:Lcom/android/launcher3/W4;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/widget/z0;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/widget/z0;->n:Lcom/android/launcher3/widget/U;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/widget/x0;->setAppWidget(ILandroid/appwidget/AppWidgetProviderInfo;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p1, p3}, Landroid/appwidget/AppWidgetHostView;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 19
    .line 20
    .line 21
    iget-object p3, p0, Lcom/android/launcher3/widget/H0;->i:Lcom/android/launcher3/W4;

    .line 22
    .line 23
    iget v0, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 24
    .line 25
    iget p3, p3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 26
    .line 27
    invoke-static {p2, v0, p3}, Lr2/b;->e(Lcom/android/launcher3/h0;II)Landroid/util/Size;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    int-to-float p4, p4

    .line 40
    iget v0, p0, Lcom/android/launcher3/widget/H0;->l:F

    .line 41
    .line 42
    mul-float/2addr p4, v0

    .line 43
    float-to-int p4, p4

    .line 44
    iget-object v0, p0, Lcom/android/launcher3/widget/H0;->j:[I

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    aget v0, v0, v1

    .line 48
    .line 49
    invoke-static {p4, v0}, Ljava/lang/Math;->min(II)I

    .line 50
    .line 51
    .line 52
    move-result p4

    .line 53
    if-le p3, p4, :cond_1

    .line 54
    .line 55
    int-to-float v0, p4

    .line 56
    int-to-float p3, p3

    .line 57
    div-float/2addr v0, p3

    .line 58
    int-to-float p2, p2

    .line 59
    mul-float/2addr p2, v0

    .line 60
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    move p3, p4

    .line 65
    :cond_1
    const/high16 p4, 0x40000000    # 2.0f

    .line 66
    .line 67
    invoke-static {p3, p4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 68
    .line 69
    .line 70
    move-result p3

    .line 71
    invoke-static {p2, p4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    invoke-virtual {p1, p3, p2}, Landroid/appwidget/AppWidgetHostView;->measure(II)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v1}, Landroid/appwidget/AppWidgetHostView;->setClipChildren(Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, v1}, Landroid/appwidget/AppWidgetHostView;->setClipToPadding(Z)V

    .line 82
    .line 83
    .line 84
    iget p0, p0, Lcom/android/launcher3/widget/H0;->l:F

    .line 85
    .line 86
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/x0;->setScaleToFit(F)V

    .line 87
    .line 88
    .line 89
    instance-of p0, p1, Lcom/android/launcher3/widget/T;

    .line 90
    .line 91
    if-eqz p0, :cond_2

    .line 92
    .line 93
    check-cast p1, Lcom/android/launcher3/widget/T;

    .line 94
    .line 95
    invoke-virtual {p1, v1}, Lcom/android/launcher3/widget/h;->setNeedShowWidgetTitle(Z)V

    .line 96
    .line 97
    .line 98
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method protected e(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/H0;->i:Lcom/android/launcher3/W4;

    .line 2
    .line 3
    instance-of v0, v0, Lcom/android/launcher3/widget/y0;

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/widget/H0;->j:[I

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v1, 0x0

    .line 13
    aget v2, v0, v1

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    aget v0, v0, v3

    .line 17
    .line 18
    sget-object v3, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 19
    .line 20
    invoke-static {v2, v0, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    new-instance v4, Landroid/graphics/Rect;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    invoke-direct {v4, v1, v1, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 35
    .line 36
    .line 37
    iget v5, p0, Ln1/d;->d:I

    .line 38
    .line 39
    sub-int v5, v2, v5

    .line 40
    .line 41
    int-to-float v5, v5

    .line 42
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    int-to-float v6, v6

    .line 47
    div-float/2addr v5, v6

    .line 48
    iget p0, p0, Ln1/d;->d:I

    .line 49
    .line 50
    sub-int p0, v0, p0

    .line 51
    .line 52
    int-to-float p0, p0

    .line 53
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    int-to-float v6, v6

    .line 58
    div-float/2addr p0, v6

    .line 59
    invoke-static {v5, p0}, Ljava/lang/Math;->min(FF)F

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    int-to-float v5, v5

    .line 68
    mul-float/2addr v5, p0

    .line 69
    float-to-int v5, v5

    .line 70
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    int-to-float v6, v6

    .line 75
    mul-float/2addr p0, v6

    .line 76
    float-to-int p0, p0

    .line 77
    new-instance v6, Landroid/graphics/Rect;

    .line 78
    .line 79
    invoke-direct {v6, v1, v1, v5, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 80
    .line 81
    .line 82
    sub-int/2addr v2, v5

    .line 83
    const/4 v1, 0x2

    .line 84
    div-int/2addr v2, v1

    .line 85
    sub-int/2addr v0, p0

    .line 86
    div-int/2addr v0, v1

    .line 87
    invoke-virtual {v6, v2, v0}, Landroid/graphics/Rect;->offset(II)V

    .line 88
    .line 89
    .line 90
    new-instance p0, Landroid/graphics/Canvas;

    .line 91
    .line 92
    invoke-direct {p0, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 93
    .line 94
    .line 95
    new-instance v0, Landroid/graphics/Paint;

    .line 96
    .line 97
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, p1, v4, v6, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 101
    .line 102
    .line 103
    return-object v3

    .line 104
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Ln1/d;->e(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0
.end method

.method public v(Lcom/android/launcher3/widget/x0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 2
    .line 3
    return-void
.end method

.method public w(Landroid/widget/RemoteViews;F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/H0;->k:Landroid/widget/RemoteViews;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/H0;->l:F

    .line 4
    .line 5
    return-void
.end method

.method public x(Landroid/graphics/Rect;IILandroid/graphics/Point;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V
    .locals 28

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    move-object/from16 v4, p4

    .line 10
    .line 11
    iget-object v5, v0, Ln1/d;->b:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    invoke-static {v5}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    invoke-static {v5}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 26
    .line 27
    .line 28
    move-result-object v7

    .line 29
    iget-object v8, v0, Lcom/android/launcher3/widget/H0;->i:Lcom/android/launcher3/W4;

    .line 30
    .line 31
    invoke-virtual {v7, v8}, Lcom/android/launcher3/Workspace;->Z0(Lcom/android/launcher3/model/data/y;)[I

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    iput-object v7, v0, Lcom/android/launcher3/widget/H0;->j:[I

    .line 36
    .line 37
    iget-object v8, v0, Lcom/android/launcher3/widget/H0;->i:Lcom/android/launcher3/W4;

    .line 38
    .line 39
    instance-of v9, v8, Lcom/android/launcher3/widget/z0;

    .line 40
    .line 41
    const/4 v11, 0x1

    .line 42
    const/4 v12, 0x0

    .line 43
    if-eqz v9, :cond_e

    .line 44
    .line 45
    check-cast v8, Lcom/android/launcher3/widget/z0;

    .line 46
    .line 47
    int-to-float v6, v2

    .line 48
    const/high16 v9, 0x3fa00000    # 1.25f

    .line 49
    .line 50
    mul-float/2addr v6, v9

    .line 51
    float-to-int v6, v6

    .line 52
    aget v7, v7, v12

    .line 53
    .line 54
    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    new-array v7, v11, [I

    .line 59
    .line 60
    iget-object v9, v0, Lcom/android/launcher3/widget/H0;->k:Landroid/widget/RemoteViews;

    .line 61
    .line 62
    if-eqz v9, :cond_0

    .line 63
    .line 64
    new-instance v9, Lcom/android/launcher3/widget/T;

    .line 65
    .line 66
    invoke-direct {v9, v5}, Lcom/android/launcher3/widget/T;-><init>(Landroid/content/Context;)V

    .line 67
    .line 68
    .line 69
    iput-object v9, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 70
    .line 71
    iget-object v13, v0, Lcom/android/launcher3/widget/H0;->k:Landroid/widget/RemoteViews;

    .line 72
    .line 73
    invoke-direct {v0, v9, v5, v13, v2}, Lcom/android/launcher3/widget/H0;->u(Lcom/android/launcher3/widget/x0;Lcom/android/launcher3/C2;Landroid/widget/RemoteViews;I)V

    .line 74
    .line 75
    .line 76
    :cond_0
    new-instance v9, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v13, "startDrag mAppWidgetHostViewPreview="

    .line 82
    .line 83
    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object v13, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 87
    .line 88
    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v9

    .line 95
    const-string v13, "PendingItemDragHelper"

    .line 96
    .line 97
    invoke-static {v13, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    iget-object v9, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 101
    .line 102
    if-eqz v9, :cond_1

    .line 103
    .line 104
    invoke-virtual {v9}, Landroid/appwidget/AppWidgetHostView;->getMeasuredWidth()I

    .line 105
    .line 106
    .line 107
    move-result v9

    .line 108
    aput v9, v7, v12

    .line 109
    .line 110
    :cond_1
    iget-object v9, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 111
    .line 112
    if-eqz v9, :cond_2

    .line 113
    .line 114
    iget-object v9, v0, Lcom/android/launcher3/widget/H0;->p:Landroid/widget/RemoteViews;

    .line 115
    .line 116
    if-eqz v9, :cond_2

    .line 117
    .line 118
    new-instance v9, Lcom/android/launcher3/widget/T;

    .line 119
    .line 120
    invoke-direct {v9, v5}, Lcom/android/launcher3/widget/T;-><init>(Landroid/content/Context;)V

    .line 121
    .line 122
    .line 123
    iput-object v9, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 124
    .line 125
    iget-object v13, v0, Lcom/android/launcher3/widget/H0;->p:Landroid/widget/RemoteViews;

    .line 126
    .line 127
    invoke-direct {v0, v9, v5, v13, v2}, Lcom/android/launcher3/widget/H0;->u(Lcom/android/launcher3/widget/x0;Lcom/android/launcher3/C2;Landroid/widget/RemoteViews;I)V

    .line 128
    .line 129
    .line 130
    :cond_2
    iget-boolean v9, v0, Lcom/android/launcher3/widget/H0;->o:Z

    .line 131
    .line 132
    if-eqz v9, :cond_3

    .line 133
    .line 134
    iget-object v9, v0, Lcom/android/launcher3/widget/H0;->k:Landroid/widget/RemoteViews;

    .line 135
    .line 136
    if-eqz v9, :cond_3

    .line 137
    .line 138
    new-instance v9, Lcom/android/launcher3/widget/P;

    .line 139
    .line 140
    invoke-direct {v9, v5}, Lcom/android/launcher3/widget/P;-><init>(Landroid/content/Context;)V

    .line 141
    .line 142
    .line 143
    iget-object v13, v0, Lcom/android/launcher3/widget/H0;->k:Landroid/widget/RemoteViews;

    .line 144
    .line 145
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 146
    .line 147
    .line 148
    move-result v14

    .line 149
    invoke-virtual {v9, v5, v13, v2, v14}, Lcom/android/launcher3/widget/P;->e(Lcom/android/launcher3/v;Landroid/widget/RemoteViews;II)Landroid/graphics/Bitmap;

    .line 150
    .line 151
    .line 152
    move-result-object v9

    .line 153
    sput-boolean v11, Lcom/android/launcher3/dragndrop/v;->c0:Z

    .line 154
    .line 155
    invoke-virtual {v0, v9}, Ln1/d;->s(Landroid/graphics/Bitmap;)V

    .line 156
    .line 157
    .line 158
    :cond_3
    iget-object v9, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 159
    .line 160
    const/4 v13, 0x0

    .line 161
    if-eqz v9, :cond_5

    .line 162
    .line 163
    invoke-virtual {v9}, Landroid/appwidget/AppWidgetHostView;->getParent()Landroid/view/ViewParent;

    .line 164
    .line 165
    .line 166
    move-result-object v9

    .line 167
    if-eqz v9, :cond_5

    .line 168
    .line 169
    iget-object v9, v0, Lcom/android/launcher3/widget/H0;->p:Landroid/widget/RemoteViews;

    .line 170
    .line 171
    if-eqz v9, :cond_4

    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_4
    iget-object v9, v0, Lcom/android/launcher3/widget/H0;->k:Landroid/widget/RemoteViews;

    .line 175
    .line 176
    :goto_0
    if-eqz v9, :cond_6

    .line 177
    .line 178
    new-instance v14, Lcom/android/launcher3/widget/T;

    .line 179
    .line 180
    invoke-direct {v14, v5}, Lcom/android/launcher3/widget/T;-><init>(Landroid/content/Context;)V

    .line 181
    .line 182
    .line 183
    invoke-direct {v0, v14, v5, v9, v2}, Lcom/android/launcher3/widget/H0;->u(Lcom/android/launcher3/widget/x0;Lcom/android/launcher3/C2;Landroid/widget/RemoteViews;I)V

    .line 184
    .line 185
    .line 186
    iput-object v14, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 187
    .line 188
    invoke-virtual {v14}, Landroid/appwidget/AppWidgetHostView;->getMeasuredWidth()I

    .line 189
    .line 190
    .line 191
    move-result v9

    .line 192
    aput v9, v7, v12

    .line 193
    .line 194
    :cond_5
    const/high16 v16, 0x40000000    # 2.0f

    .line 195
    .line 196
    goto :goto_2

    .line 197
    :cond_6
    iget-object v9, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 198
    .line 199
    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    .line 200
    .line 201
    .line 202
    move-result v14

    .line 203
    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    .line 204
    .line 205
    .line 206
    move-result v15

    .line 207
    if-lez v14, :cond_7

    .line 208
    .line 209
    if-gtz v15, :cond_8

    .line 210
    .line 211
    :cond_7
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    .line 212
    .line 213
    .line 214
    move-result v14

    .line 215
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredHeight()I

    .line 216
    .line 217
    .line 218
    move-result v15

    .line 219
    :cond_8
    if-lez v14, :cond_9

    .line 220
    .line 221
    if-lez v15, :cond_9

    .line 222
    .line 223
    const/high16 v16, 0x40000000    # 2.0f

    .line 224
    .line 225
    new-instance v10, Lcom/android/launcher3/widget/G0;

    .line 226
    .line 227
    invoke-direct {v10, v9}, Lcom/android/launcher3/widget/G0;-><init>(Landroid/view/View;)V

    .line 228
    .line 229
    .line 230
    invoke-static {v14, v15, v10}, Ls1/e;->b(IILs1/e;)Landroid/graphics/Bitmap;

    .line 231
    .line 232
    .line 233
    move-result-object v9

    .line 234
    new-instance v10, Ls1/o;

    .line 235
    .line 236
    invoke-direct {v10, v9}, Ls1/o;-><init>(Landroid/graphics/Bitmap;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v0, v9}, Ln1/d;->s(Landroid/graphics/Bitmap;)V

    .line 240
    .line 241
    .line 242
    aput v14, v7, v12

    .line 243
    .line 244
    new-instance v9, Ls1/k0;

    .line 245
    .line 246
    iget v14, v0, Lcom/android/launcher3/widget/H0;->n:F

    .line 247
    .line 248
    invoke-direct {v9, v10, v14}, Ls1/k0;-><init>(Landroid/graphics/drawable/Drawable;F)V

    .line 249
    .line 250
    .line 251
    goto :goto_1

    .line 252
    :cond_9
    const/high16 v16, 0x40000000    # 2.0f

    .line 253
    .line 254
    move-object v9, v13

    .line 255
    :goto_1
    iput-object v13, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 256
    .line 257
    goto :goto_3

    .line 258
    :goto_2
    move-object v9, v13

    .line 259
    :goto_3
    if-nez v9, :cond_a

    .line 260
    .line 261
    iget-object v10, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 262
    .line 263
    if-nez v10, :cond_a

    .line 264
    .line 265
    new-instance v9, Lcom/android/launcher3/widget/P;

    .line 266
    .line 267
    invoke-direct {v9, v5}, Lcom/android/launcher3/widget/P;-><init>(Landroid/content/Context;)V

    .line 268
    .line 269
    .line 270
    iget-object v8, v8, Lcom/android/launcher3/widget/z0;->n:Lcom/android/launcher3/widget/U;

    .line 271
    .line 272
    invoke-virtual {v9, v8, v6, v7}, Lcom/android/launcher3/widget/P;->i(Lcom/android/launcher3/widget/U;I[I)Landroid/graphics/Bitmap;

    .line 273
    .line 274
    .line 275
    move-result-object v6

    .line 276
    new-instance v8, Ls1/o;

    .line 277
    .line 278
    invoke-direct {v8, v6}, Ls1/o;-><init>(Landroid/graphics/Bitmap;)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {v0, v6}, Ln1/d;->s(Landroid/graphics/Bitmap;)V

    .line 282
    .line 283
    .line 284
    new-instance v9, Ls1/k0;

    .line 285
    .line 286
    iget v6, v0, Lcom/android/launcher3/widget/H0;->n:F

    .line 287
    .line 288
    invoke-direct {v9, v8, v6}, Ls1/k0;-><init>(Landroid/graphics/drawable/Drawable;F)V

    .line 289
    .line 290
    .line 291
    :cond_a
    aget v6, v7, v12

    .line 292
    .line 293
    if-ge v6, v2, :cond_c

    .line 294
    .line 295
    sub-int v6, v2, v6

    .line 296
    .line 297
    div-int/lit8 v6, v6, 0x2

    .line 298
    .line 299
    if-le v2, v3, :cond_b

    .line 300
    .line 301
    mul-int/2addr v6, v3

    .line 302
    div-int/2addr v6, v2

    .line 303
    :cond_b
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 304
    .line 305
    add-int/2addr v2, v6

    .line 306
    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 307
    .line 308
    iget v2, v1, Landroid/graphics/Rect;->right:I

    .line 309
    .line 310
    sub-int/2addr v2, v6

    .line 311
    iput v2, v1, Landroid/graphics/Rect;->right:I

    .line 312
    .line 313
    :cond_c
    iget-object v2, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 314
    .line 315
    if-eqz v2, :cond_d

    .line 316
    .line 317
    invoke-virtual {v2}, Landroid/appwidget/AppWidgetHostView;->getScaleX()F

    .line 318
    .line 319
    .line 320
    move-result v2

    .line 321
    iget-object v3, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 322
    .line 323
    invoke-virtual {v3}, Landroid/appwidget/AppWidgetHostView;->getMeasuredWidth()I

    .line 324
    .line 325
    .line 326
    move-result v3

    .line 327
    iget-object v6, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 328
    .line 329
    invoke-virtual {v6}, Landroid/appwidget/AppWidgetHostView;->getMeasuredHeight()I

    .line 330
    .line 331
    .line 332
    move-result v6

    .line 333
    int-to-float v3, v3

    .line 334
    mul-float v7, v3, v2

    .line 335
    .line 336
    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    .line 337
    .line 338
    .line 339
    move-result v7

    .line 340
    int-to-float v6, v6

    .line 341
    mul-float v8, v6, v2

    .line 342
    .line 343
    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    .line 344
    .line 345
    .line 346
    move-result v8

    .line 347
    const/high16 v10, 0x3f800000    # 1.0f

    .line 348
    .line 349
    sub-float/2addr v2, v10

    .line 350
    mul-float/2addr v3, v2

    .line 351
    div-float v3, v3, v16

    .line 352
    .line 353
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 354
    .line 355
    .line 356
    move-result v3

    .line 357
    mul-float/2addr v6, v2

    .line 358
    div-float v6, v6, v16

    .line 359
    .line 360
    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    .line 361
    .line 362
    .line 363
    move-result v2

    .line 364
    invoke-virtual {v1, v3, v2}, Landroid/graphics/Rect;->offset(II)V

    .line 365
    .line 366
    .line 367
    goto :goto_4

    .line 368
    :cond_d
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 369
    .line 370
    .line 371
    move-result v7

    .line 372
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 373
    .line 374
    .line 375
    move-result v8

    .line 376
    :goto_4
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 377
    .line 378
    .line 379
    move-result v2

    .line 380
    int-to-float v2, v2

    .line 381
    int-to-float v3, v7

    .line 382
    div-float/2addr v2, v3

    .line 383
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 384
    .line 385
    .line 386
    move-result-object v3

    .line 387
    new-instance v6, Lcom/android/launcher3/widget/T0;

    .line 388
    .line 389
    iget-object v10, v0, Ln1/d;->b:Landroid/view/View;

    .line 390
    .line 391
    invoke-direct {v6, v5, v10}, Lcom/android/launcher3/widget/T0;-><init>(Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {v3, v6}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 395
    .line 396
    .line 397
    invoke-static {v11}, Lcom/android/launcher3/dragndrop/y;->h(I)Lcom/android/launcher3/dragndrop/y;

    .line 398
    .line 399
    .line 400
    move-result-object v3

    .line 401
    :goto_5
    move/from16 v25, v2

    .line 402
    .line 403
    move-object/from16 v19, v3

    .line 404
    .line 405
    move-object/from16 v18, v9

    .line 406
    .line 407
    move-object/from16 v24, v13

    .line 408
    .line 409
    goto :goto_6

    .line 410
    :cond_e
    const/high16 v16, 0x40000000    # 2.0f

    .line 411
    .line 412
    check-cast v8, Lcom/android/launcher3/widget/y0;

    .line 413
    .line 414
    invoke-virtual {v8, v5}, Lcom/android/launcher3/widget/y0;->P(Landroid/content/Context;)LD1/i;

    .line 415
    .line 416
    .line 417
    move-result-object v2

    .line 418
    invoke-virtual {v6}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 419
    .line 420
    .line 421
    move-result-object v3

    .line 422
    invoke-virtual {v2, v3}, LD1/i;->h(Lt1/f;)Landroid/graphics/drawable/Drawable;

    .line 423
    .line 424
    .line 425
    move-result-object v2

    .line 426
    invoke-static {v5}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 427
    .line 428
    .line 429
    move-result-object v3

    .line 430
    invoke-virtual {v3, v2, v12}, Ls1/b;->w(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    .line 431
    .line 432
    .line 433
    move-result-object v2

    .line 434
    invoke-virtual {v0, v2}, Ln1/d;->s(Landroid/graphics/Bitmap;)V

    .line 435
    .line 436
    .line 437
    new-instance v9, Ls1/o;

    .line 438
    .line 439
    invoke-direct {v9, v2}, Ls1/o;-><init>(Landroid/graphics/Bitmap;)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 443
    .line 444
    .line 445
    move-result v7

    .line 446
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 447
    .line 448
    .line 449
    move-result v8

    .line 450
    invoke-virtual {v3}, Ls1/X;->n0()V

    .line 451
    .line 452
    .line 453
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 454
    .line 455
    .line 456
    move-result-object v2

    .line 457
    iget v2, v2, Lcom/android/launcher3/h0;->B1:I

    .line 458
    .line 459
    int-to-float v2, v2

    .line 460
    int-to-float v3, v7

    .line 461
    div-float/2addr v2, v3

    .line 462
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 463
    .line 464
    .line 465
    move-result-object v3

    .line 466
    iget v6, v3, Lcom/android/launcher3/h0;->B1:I

    .line 467
    .line 468
    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 469
    .line 470
    .line 471
    move-result-object v10

    .line 472
    const v13, 0x7f070c90

    .line 473
    .line 474
    .line 475
    invoke-virtual {v10, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 476
    .line 477
    .line 478
    move-result v10

    .line 479
    iget v13, v1, Landroid/graphics/Rect;->left:I

    .line 480
    .line 481
    add-int/2addr v13, v10

    .line 482
    iput v13, v1, Landroid/graphics/Rect;->left:I

    .line 483
    .line 484
    iget v13, v1, Landroid/graphics/Rect;->top:I

    .line 485
    .line 486
    add-int/2addr v13, v10

    .line 487
    iput v13, v1, Landroid/graphics/Rect;->top:I

    .line 488
    .line 489
    new-instance v13, Landroid/graphics/Rect;

    .line 490
    .line 491
    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 492
    .line 493
    .line 494
    iget-object v10, v0, Lcom/android/launcher3/widget/H0;->j:[I

    .line 495
    .line 496
    aget v14, v10, v12

    .line 497
    .line 498
    sub-int/2addr v14, v6

    .line 499
    div-int/lit8 v14, v14, 0x2

    .line 500
    .line 501
    iput v14, v13, Landroid/graphics/Rect;->left:I

    .line 502
    .line 503
    add-int/2addr v14, v6

    .line 504
    iput v14, v13, Landroid/graphics/Rect;->right:I

    .line 505
    .line 506
    aget v10, v10, v11

    .line 507
    .line 508
    sub-int/2addr v10, v6

    .line 509
    iget v11, v3, Lcom/android/launcher3/h0;->C1:I

    .line 510
    .line 511
    sub-int/2addr v10, v11

    .line 512
    iget v3, v3, Lcom/android/launcher3/h0;->D1:I

    .line 513
    .line 514
    sub-int/2addr v10, v3

    .line 515
    div-int/lit8 v10, v10, 0x2

    .line 516
    .line 517
    iput v10, v13, Landroid/graphics/Rect;->top:I

    .line 518
    .line 519
    add-int/2addr v10, v6

    .line 520
    iput v10, v13, Landroid/graphics/Rect;->bottom:I

    .line 521
    .line 522
    invoke-static {v12}, Lcom/android/launcher3/dragndrop/y;->h(I)Lcom/android/launcher3/dragndrop/y;

    .line 523
    .line 524
    .line 525
    move-result-object v3

    .line 526
    goto :goto_5

    .line 527
    :goto_6
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 528
    .line 529
    .line 530
    move-result-object v2

    .line 531
    invoke-virtual {v2, v0}, Lcom/android/launcher3/Workspace;->C2(Ln1/d;)V

    .line 532
    .line 533
    .line 534
    iget v2, v4, Landroid/graphics/Point;->x:I

    .line 535
    .line 536
    iget v3, v1, Landroid/graphics/Rect;->left:I

    .line 537
    .line 538
    add-int/2addr v2, v3

    .line 539
    int-to-float v3, v7

    .line 540
    mul-float v6, v25, v3

    .line 541
    .line 542
    sub-float/2addr v6, v3

    .line 543
    div-float v6, v6, v16

    .line 544
    .line 545
    float-to-int v3, v6

    .line 546
    add-int v20, v2, v3

    .line 547
    .line 548
    iget v2, v4, Landroid/graphics/Point;->y:I

    .line 549
    .line 550
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 551
    .line 552
    add-int/2addr v2, v1

    .line 553
    int-to-float v1, v8

    .line 554
    mul-float v3, v25, v1

    .line 555
    .line 556
    sub-float/2addr v3, v1

    .line 557
    div-float v3, v3, v16

    .line 558
    .line 559
    float-to-int v1, v3

    .line 560
    add-int v21, v2, v1

    .line 561
    .line 562
    iget-object v1, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 563
    .line 564
    if-eqz v1, :cond_f

    .line 565
    .line 566
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 567
    .line 568
    .line 569
    move-result-object v17

    .line 570
    iget-object v1, v0, Lcom/android/launcher3/widget/H0;->m:Lcom/android/launcher3/widget/x0;

    .line 571
    .line 572
    iget-object v0, v0, Lcom/android/launcher3/widget/H0;->i:Lcom/android/launcher3/W4;

    .line 573
    .line 574
    move/from16 v26, v25

    .line 575
    .line 576
    move-object/from16 v22, p5

    .line 577
    .line 578
    move-object/from16 v27, p6

    .line 579
    .line 580
    move-object/from16 v23, v0

    .line 581
    .line 582
    move-object/from16 v18, v1

    .line 583
    .line 584
    invoke-virtual/range {v17 .. v27}, Lcom/android/launcher3/dragndrop/j;->R(Landroid/view/View;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;

    .line 585
    .line 586
    .line 587
    return-void

    .line 588
    :cond_f
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 589
    .line 590
    .line 591
    move-result-object v17

    .line 592
    iget-object v0, v0, Lcom/android/launcher3/widget/H0;->i:Lcom/android/launcher3/W4;

    .line 593
    .line 594
    move/from16 v26, v25

    .line 595
    .line 596
    move-object/from16 v22, p5

    .line 597
    .line 598
    move-object/from16 v27, p6

    .line 599
    .line 600
    move-object/from16 v23, v0

    .line 601
    .line 602
    invoke-virtual/range {v17 .. v27}, Lcom/android/launcher3/dragndrop/j;->Q(Landroid/graphics/drawable/Drawable;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;

    .line 603
    .line 604
    .line 605
    return-void
.end method
