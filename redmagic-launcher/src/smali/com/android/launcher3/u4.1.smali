.class public Lcom/android/launcher3/u4;
.super Ljava/lang/Object;
.source "MFVRecentInterfaceProxy.java"

# interfaces
.implements Lcom/android/launcher3/H5$h;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/u4$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/android/launcher3/v;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/H5$h;"
    }
.end annotation


# instance fields
.field private g:Lcom/android/launcher3/v;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private h:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/launcher3/u4$a;",
            ">;"
        }
    .end annotation
.end field

.field private i:Ljava/lang/Runnable;

.field private j:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/DialogInterface;",
            ">;"
        }
    .end annotation
.end field

.field private volatile k:Z


# direct methods
.method constructor <init>(Lcom/android/launcher3/v;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/u4;->j:Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/android/launcher3/u4;->k:Z

    .line 9
    .line 10
    iput-object p1, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/u4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/u4;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/u4;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/u4;->j(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic j(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/v;->updateForeColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 7
    .line 8
    instance-of v1, v0, Lcom/android/launcher3/C2;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    check-cast v0, Lcom/android/launcher3/C2;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/u4;->g()Lcom/android/launcher3/u4$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/u4;->g()Lcom/android/launcher3/u4$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0, p1}, Lcom/android/launcher3/u4$a;->onForeColorChanged(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private synthetic k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/u4;->onLowMemInit(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public c(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/u4;->j:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method

.method public d(Landroid/graphics/PointF;)Z
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/u4;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/u4;->g()Lcom/android/launcher3/u4$a;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/u4;->g()Lcom/android/launcher3/u4$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Lcom/android/launcher3/u4$a;->getIsOneHandedModeActive()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    iget p0, p1, Landroid/graphics/PointF;->y:F

    .line 32
    .line 33
    float-to-double p0, p0

    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    int-to-double v3, v3

    .line 43
    const-wide v5, 0x3fe3333333333333L    # 0.6

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    mul-double/2addr v3, v5

    .line 49
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const v5, 0x7f070953

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    int-to-double v5, v0

    .line 61
    sub-double/2addr v3, v5

    .line 62
    cmpl-double p0, p0, v3

    .line 63
    .line 64
    if-gtz p0, :cond_0

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    return v2

    .line 68
    :cond_1
    :goto_0
    return v1

    .line 69
    :cond_2
    if-nez p1, :cond_3

    .line 70
    .line 71
    return v2

    .line 72
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/u4;->e(Landroid/graphics/PointF;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    return v2

    .line 79
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const v3, 0x7f0700c7

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iget-object v3, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 93
    .line 94
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->O0:Z

    .line 99
    .line 100
    if-eqz v3, :cond_5

    .line 101
    .line 102
    new-instance v3, Landroid/graphics/Rect;

    .line 103
    .line 104
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 108
    .line 109
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 114
    .line 115
    .line 116
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    :goto_1
    int-to-float p0, p0

    .line 121
    sub-float/2addr p0, v0

    .line 122
    goto :goto_2

    .line 123
    :cond_5
    iget-object p0, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .line 136
    .line 137
    const-string v4, "checkUpCanStartAllApps: allAppStartLength "

    .line 138
    .line 139
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    const-string v0, " x: "

    .line 146
    .line 147
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 151
    .line 152
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string v0, " y: "

    .line 156
    .line 157
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    iget v0, p1, Landroid/graphics/PointF;->y:F

    .line 161
    .line 162
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    const-string v0, " = "

    .line 166
    .line 167
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    const-string v3, "R-Loader-Recent"

    .line 178
    .line 179
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 183
    .line 184
    cmpl-float p0, p0, p1

    .line 185
    .line 186
    if-lez p0, :cond_6

    .line 187
    .line 188
    return v1

    .line 189
    :cond_6
    return v2
.end method

.method public e(Landroid/graphics/PointF;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/u4;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    new-instance v0, Landroid/graphics/RectF;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v2, v2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 26
    .line 27
    iget v2, v2, Lcom/android/launcher3/r4;->S:I

    .line 28
    .line 29
    sub-int/2addr v1, v2

    .line 30
    int-to-float v1, v1

    .line 31
    iget-object v2, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget v2, v2, Lcom/android/launcher3/h0;->T0:I

    .line 38
    .line 39
    int-to-float v2, v2

    .line 40
    iget-object v3, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 41
    .line 42
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iget v3, v3, Lcom/android/launcher3/h0;->U0:I

    .line 47
    .line 48
    int-to-float v3, v3

    .line 49
    const/4 v4, 0x0

    .line 50
    invoke-direct {v0, v4, v1, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->O0:Z

    .line 60
    .line 61
    if-eqz v1, :cond_1

    .line 62
    .line 63
    new-instance v0, Landroid/graphics/Rect;

    .line 64
    .line 65
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 69
    .line 70
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 75
    .line 76
    .line 77
    new-instance v1, Landroid/graphics/RectF;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    iget-object p0, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 90
    .line 91
    iget p0, p0, Lcom/android/launcher3/r4;->S:I

    .line 92
    .line 93
    sub-int/2addr v2, p0

    .line 94
    int-to-float p0, v2

    .line 95
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    int-to-float v2, v2

    .line 100
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    int-to-float v0, v0

    .line 105
    invoke-direct {v1, v4, p0, v2, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 106
    .line 107
    .line 108
    move-object v0, v1

    .line 109
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v1, "checkUpGestureCanStart: swipeTouchRegion "

    .line 115
    .line 116
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v1, " x: "

    .line 123
    .line 124
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    iget v1, p1, Landroid/graphics/PointF;->x:F

    .line 128
    .line 129
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v1, " y: "

    .line 133
    .line 134
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    iget v1, p1, Landroid/graphics/PointF;->y:F

    .line 138
    .line 139
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    const-string v1, "R-Loader-Recent"

    .line 147
    .line 148
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    iget p0, p1, Landroid/graphics/PointF;->x:F

    .line 152
    .line 153
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 154
    .line 155
    invoke-virtual {v0, p0, p1}, Landroid/graphics/RectF;->contains(FF)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    return p0
.end method

.method public f()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/u4;->j:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    const-string v1, "closeCacheDialogAndClear called "

    .line 4
    .line 5
    const-string v2, "R-Loader-Recent"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/u4;->j:Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/content/DialogInterface;

    .line 25
    .line 26
    invoke-interface {v0}, Landroid/content/DialogInterface;->cancel()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/u4;->j:Ljava/lang/ref/WeakReference;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 32
    .line 33
    .line 34
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-boolean v1, p0, Lcom/android/launcher3/u4;->k:Z

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    iget-boolean v0, p0, Lcom/android/launcher3/u4;->k:Z

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    iput-boolean v0, p0, Lcom/android/launcher3/u4;->k:Z

    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 62
    .line 63
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string v0, "com.android.permissioncontroller"

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/android/launcher3/H5;->r(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_1
    return-void
.end method

.method public g()Lcom/android/launcher3/u4$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/u4;->h:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/u4$a;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public h(Landroid/graphics/PointF;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/u4;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const v2, 0x7f070131

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget v2, p1, Landroid/graphics/PointF;->x:F

    .line 23
    .line 24
    cmpg-float v3, v2, v0

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    if-ltz v3, :cond_2

    .line 28
    .line 29
    iget-object v3, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 30
    .line 31
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    iget v3, v3, Lcom/android/launcher3/h0;->T0:I

    .line 36
    .line 37
    int-to-float v3, v3

    .line 38
    sub-float/2addr v3, v0

    .line 39
    cmpl-float v0, v2, v3

    .line 40
    .line 41
    if-lez v0, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move v0, v1

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    :goto_0
    move v0, v4

    .line 47
    :goto_1
    iget v2, p1, Landroid/graphics/PointF;->y:F

    .line 48
    .line 49
    iget-object v3, p0, Lcom/android/launcher3/u4;->g:Lcom/android/launcher3/v;

    .line 50
    .line 51
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    iget v3, v3, Lcom/android/launcher3/h0;->U0:I

    .line 56
    .line 57
    div-int/lit8 v3, v3, 0x4

    .line 58
    .line 59
    int-to-float v3, v3

    .line 60
    cmpl-float v2, v2, v3

    .line 61
    .line 62
    if-lez v2, :cond_3

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lcom/android/launcher3/u4;->e(Landroid/graphics/PointF;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-nez p0, :cond_3

    .line 69
    .line 70
    move p0, v4

    .line 71
    goto :goto_2

    .line 72
    :cond_3
    move p0, v1

    .line 73
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v2, "inBackRegion: "

    .line 79
    .line 80
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v2, " - isInVertical -"

    .line 87
    .line 88
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const-string v2, "R-Loader-Recent"

    .line 99
    .line 100
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    if-eqz p0, :cond_4

    .line 106
    .line 107
    return v4

    .line 108
    :cond_4
    return v1
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/u4;->h:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/u4;->h:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/android/launcher3/u4$a;

    .line 18
    .line 19
    invoke-interface {p0}, Lcom/android/launcher3/u4$a;->getCurNavMode()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 v0, 0x2

    .line 24
    if-ne p0, v0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public l()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/android/launcher3/H5;->t1(Lcom/android/launcher3/H5$h;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/u4;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public n(Lcom/android/launcher3/u4$a;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/u4;->h:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/u4;->i:Ljava/lang/Runnable;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/android/launcher3/u4;->i:Ljava/lang/Runnable;

    .line 17
    .line 18
    :cond_0
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1, p0}, Lcom/android/launcher3/H5;->t1(Lcom/android/launcher3/H5$h;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public onForeColorChanged(I)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, -0x1

    .line 4
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/t4;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/t4;-><init>(Lcom/android/launcher3/u4;I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onLowMemInit(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onLowMemInit: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " wait task "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/u4;->i:Ljava/lang/Runnable;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "R-Loader-Recent"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/u4;->g()Lcom/android/launcher3/u4$a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/u4;->g()Lcom/android/launcher3/u4$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0}, Lcom/android/launcher3/u4$a;->enableMiniWindow()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    new-instance p1, Lcom/android/launcher3/s4;

    .line 50
    .line 51
    invoke-direct {p1, p0}, Lcom/android/launcher3/s4;-><init>(Lcom/android/launcher3/u4;)V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Lcom/android/launcher3/u4;->i:Ljava/lang/Runnable;

    .line 55
    .line 56
    :cond_1
    return-void
.end method
