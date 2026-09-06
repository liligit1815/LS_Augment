.class public abstract Lcom/android/quickstep/BaseContainerInterface;
.super Ljava/lang/Object;
.source "BaseContainerInterface.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<STATE_TYPE::",
        "Lcom/android/launcher3/statemanager/a<",
        "TSTATE_TYPE;>;CONTAINER_TYPE::",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ":",
        "Lcom/android/launcher3/statemanager/i<",
        "TSTATE_TYPE;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final FULLSCREEN_TO_WINDOW_SCROLLRATIO_UPPERBOUND:F = 0.5f

.field public static final FULLSCREEN_TO_WINDOW_TRIGGER_MINIWINDOW_THRESHOLD:F = 2.5f

.field protected static final TAG:Ljava/lang/String; = "BaseContainerInterface"


# instance fields
.field protected final mBackgroundState:Lcom/android/launcher3/statemanager/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TSTATE_TYPE;"
        }
    .end annotation
.end field

.field public mFullScreenToWindow:Z

.field public mFullScreenToWindowSmallOrMini:Z

.field public mIfRunningTaskSupportMiniWindow:Z

.field public mNeedChangeTaskTranslation:Z

.field public mNeedOffsetTaskRect:Z

.field protected mOnInitBackgroundStateUICallback:Ljava/lang/Runnable;

.field public mTaskRectOffsetAnimPrimary:F

.field public mTaskRectOffsetAnimSecondary:F

.field public mTaskRectOffsetPrimary:F

.field public mTaskRectOffsetSecondary:F

.field public rotationSupportedByActivity:Z


# direct methods
.method protected constructor <init>(Lcom/android/launcher3/statemanager/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TSTATE_TYPE;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/BaseContainerInterface;->rotationSupportedByActivity:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/android/quickstep/BaseContainerInterface;->mOnInitBackgroundStateUICallback:Ljava/lang/Runnable;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/android/quickstep/BaseContainerInterface;->mBackgroundState:Lcom/android/launcher3/statemanager/a;

    .line 11
    .line 12
    return-void
.end method

.method private calculateLargeTileSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f070974

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getFloat(I)F

    .line 9
    .line 10
    .line 11
    move-result v6

    .line 12
    new-instance v5, Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p2, p1, v5}, Lcom/android/quickstep/BaseContainerInterface;->calculateGridSize(Lcom/android/launcher3/h0;Landroid/content/Context;Landroid/graphics/Rect;)V

    .line 18
    .line 19
    .line 20
    const/16 v7, 0x11

    .line 21
    .line 22
    move-object v2, p0

    .line 23
    move-object v3, p1

    .line 24
    move-object v4, p2

    .line 25
    move-object v8, p3

    .line 26
    invoke-direct/range {v2 .. v8}, Lcom/android/quickstep/BaseContainerInterface;->calculateTaskSizeInternal(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;FILandroid/graphics/Rect;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private calculateTaskSizeInternal(Landroid/content/Context;Lcom/android/launcher3/h0;IIIFILandroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V
    .locals 5

    move v0, p3

    .line 1
    new-instance p3, Landroid/graphics/Rect;

    iget v1, p2, Lcom/android/launcher3/h0;->T0:I

    iget v2, p2, Lcom/android/launcher3/h0;->U0:I

    const/4 v3, 0x0

    invoke-direct {p3, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 2
    invoke-interface {p9}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->isLayoutNaturalToLauncher()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    move-result-object p9

    goto :goto_1

    .line 4
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    move-result-object v1

    .line 5
    sget-object v2, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher3/util/Z;

    .line 6
    invoke-virtual {v2}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher3/util/Z$c;->k()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 7
    invoke-interface {p9}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getRotation()I

    move-result v3

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher3/util/p3;

    iget-object v2, v2, Lcom/android/launcher3/util/p3;->b:Landroid/graphics/Rect;

    goto :goto_0

    .line 8
    :cond_1
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 9
    :goto_0
    invoke-interface {p9, v2, p8}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->rotateInsets(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 10
    iget p9, p8, Landroid/graphics/Rect;->left:I

    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 11
    invoke-static {p9, v2}, Ljava/lang/Math;->max(II)I

    move-result p9

    iget v2, p8, Landroid/graphics/Rect;->top:I

    iget v3, v1, Landroid/graphics/Rect;->top:I

    .line 12
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget v3, p8, Landroid/graphics/Rect;->right:I

    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 13
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget v4, p8, Landroid/graphics/Rect;->bottom:I

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 14
    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 15
    invoke-virtual {p8, p9, v2, v3, v1}, Landroid/graphics/Rect;->set(IIII)V

    move-object p9, p8

    .line 16
    :goto_1
    invoke-virtual {p3, p9}, Landroid/graphics/Rect;->inset(Landroid/graphics/Rect;)V

    .line 17
    invoke-virtual {p8, p5, v0, p5, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 18
    invoke-virtual {p3, p8}, Landroid/graphics/Rect;->inset(Landroid/graphics/Rect;)V

    move p4, p6

    move p5, p7

    move-object p6, p8

    .line 19
    invoke-direct/range {p0 .. p6}, Lcom/android/quickstep/BaseContainerInterface;->calculateTaskSizeInternal(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;FILandroid/graphics/Rect;)V

    return-void
.end method

.method private calculateTaskSizeInternal(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;FILandroid/graphics/Rect;)V
    .locals 3

    .line 20
    invoke-static {p1, p2}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimension(Landroid/content/Context;Lcom/android/launcher3/h0;)Landroid/graphics/PointF;

    move-result-object p0

    .line 21
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Landroid/graphics/PointF;->x:F

    div-float/2addr v0, v1

    .line 22
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Landroid/graphics/PointF;->y:F

    div-float/2addr v1, v2

    .line 23
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 24
    invoke-static {v0, p4}, Ljava/lang/Math;->min(FF)F

    move-result p4

    .line 25
    iget v0, p0, Landroid/graphics/PointF;->x:F

    mul-float/2addr v0, p4

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 26
    iget p0, p0, Landroid/graphics/PointF;->y:F

    mul-float/2addr p4, p0

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p0

    .line 27
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object p4

    invoke-virtual {p4}, Lcom/android/launcher3/resource/B;->s()Z

    move-result p4

    if-eqz p4, :cond_1

    .line 28
    invoke-virtual {p2}, Lcom/android/launcher3/X3;->b()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 29
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p2, 0x7f070a36

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 30
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f070a34

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p2, 0x7f070a35

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 32
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f070a33

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    .line 33
    :cond_1
    :goto_0
    invoke-static {p5, v0, p0, p3, p6}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    return-void
.end method

.method private static getTaskDimension(Landroid/content/Context;Lcom/android/launcher3/h0;)Landroid/graphics/PointF;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 2
    invoke-static {p0, p1, v0}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimension(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/PointF;)V

    return-object v0
.end method

.method public static getTaskDimension(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/PointF;)V
    .locals 1

    .line 3
    iget v0, p1, Lcom/android/launcher3/h0;->T0:I

    int-to-float v0, v0

    iput v0, p2, Landroid/graphics/PointF;->x:F

    .line 4
    iget v0, p1, Lcom/android/launcher3/h0;->U0:I

    int-to-float v0, v0

    iput v0, p2, Landroid/graphics/PointF;->y:F

    .line 5
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->G0:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/android/launcher3/util/Z;->D(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 6
    iget p0, p2, Landroid/graphics/PointF;->y:F

    iget p1, p1, Lcom/android/launcher3/h0;->r3:I

    int-to-float p1, p1

    sub-float/2addr p0, p1

    iput p0, p2, Landroid/graphics/PointF;->y:F

    :cond_0
    return-void
.end method

.method private updateOutRect(Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;Lcom/android/quickstep/views/RecentsView;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "BaseContainerInterface"

    .line 8
    .line 9
    const-string p1, "calculateGridTaskSize: container null return"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-boolean v1, p0, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    .line 16
    .line 17
    if-eqz v1, :cond_a

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    if-eqz v1, :cond_4

    .line 27
    .line 28
    invoke-virtual {p4}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 29
    .line 30
    .line 31
    move-result p4

    .line 32
    if-le p4, v2, :cond_a

    .line 33
    .line 34
    sget-object p4, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 35
    .line 36
    if-ne p3, p4, :cond_1

    .line 37
    .line 38
    iget p1, p1, Lcom/android/launcher3/h0;->T0:I

    .line 39
    .line 40
    div-int/2addr p1, v2

    .line 41
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    :goto_0
    sub-int/2addr p1, v0

    .line 46
    int-to-float p1, p1

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    iget p1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 49
    .line 50
    div-int/2addr p1, v2

    .line 51
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerY()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    goto :goto_0

    .line 56
    :goto_1
    iput p1, p0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetPrimary:F

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    iput v0, p0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetSecondary:F

    .line 60
    .line 61
    if-ne p3, p4, :cond_2

    .line 62
    .line 63
    float-to-int p0, p1

    .line 64
    goto :goto_2

    .line 65
    :cond_2
    float-to-int p0, v0

    .line 66
    :goto_2
    if-ne p3, p4, :cond_3

    .line 67
    .line 68
    float-to-int p1, v0

    .line 69
    goto :goto_3

    .line 70
    :cond_3
    float-to-int p1, p1

    .line 71
    :goto_3
    invoke-virtual {p2, p0, p1}, Landroid/graphics/Rect;->offset(II)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_4
    invoke-virtual {p4}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 76
    .line 77
    .line 78
    move-result p4

    .line 79
    if-lt p4, v2, :cond_a

    .line 80
    .line 81
    sget-object p4, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 82
    .line 83
    if-ne p3, p4, :cond_5

    .line 84
    .line 85
    iget p1, p1, Lcom/android/launcher3/h0;->T0:I

    .line 86
    .line 87
    div-int/2addr p1, v2

    .line 88
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    :goto_4
    sub-int/2addr p1, v1

    .line 93
    int-to-float p1, p1

    .line 94
    goto :goto_5

    .line 95
    :cond_5
    iget p1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 96
    .line 97
    div-int/2addr p1, v2

    .line 98
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerY()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    goto :goto_4

    .line 103
    :goto_5
    iput p1, p0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetPrimary:F

    .line 104
    .line 105
    if-ne p3, p4, :cond_6

    .line 106
    .line 107
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    const v0, 0x7f070834

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    const/high16 v0, 0x40000000    # 2.0f

    .line 123
    .line 124
    div-float/2addr p1, v0

    .line 125
    goto :goto_7

    .line 126
    :cond_6
    sget-object p1, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->LANDSCAPE:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 127
    .line 128
    const/high16 v1, 0x40400000    # 3.0f

    .line 129
    .line 130
    const v2, 0x7f070833

    .line 131
    .line 132
    .line 133
    if-ne p3, p1, :cond_7

    .line 134
    .line 135
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    neg-float p1, p1

    .line 148
    :goto_6
    div-float/2addr p1, v1

    .line 149
    goto :goto_7

    .line 150
    :cond_7
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    goto :goto_6

    .line 163
    :goto_7
    iput p1, p0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetSecondary:F

    .line 164
    .line 165
    if-ne p3, p4, :cond_8

    .line 166
    .line 167
    iget v0, p0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetPrimary:F

    .line 168
    .line 169
    float-to-int v0, v0

    .line 170
    goto :goto_8

    .line 171
    :cond_8
    float-to-int v0, p1

    .line 172
    :goto_8
    if-ne p3, p4, :cond_9

    .line 173
    .line 174
    float-to-int p0, p1

    .line 175
    goto :goto_9

    .line 176
    :cond_9
    iget p0, p0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetPrimary:F

    .line 177
    .line 178
    float-to-int p0, p0

    .line 179
    :goto_9
    invoke-virtual {p2, v0, p0}, Landroid/graphics/Rect;->offset(II)V

    .line 180
    .line 181
    .line 182
    :cond_a
    return-void
.end method


# virtual methods
.method public final calculateDoubleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimensionRatio(Landroid/content/Context;Lcom/android/launcher3/h0;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-interface {p4, p1, p2, p3, p0}, Lcom/android/launcher3/touch/G;->calculateDoubleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final calculateGridSize(Lcom/android/launcher3/h0;Landroid/content/Context;Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p2, p1, Lcom/android/launcher3/h0;->S2:I

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->E0()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p1, Lcom/android/launcher3/h0;->Y2:I

    .line 12
    .line 13
    iget v2, p1, Lcom/android/launcher3/h0;->T0:I

    .line 14
    .line 15
    iget p1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-virtual {p3, v3, v3, v2, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 19
    .line 20
    .line 21
    iget p1, p0, Landroid/graphics/Rect;->left:I

    .line 22
    .line 23
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget v2, p0, Landroid/graphics/Rect;->top:I

    .line 28
    .line 29
    add-int/2addr v2, p2

    .line 30
    iget p2, p0, Landroid/graphics/Rect;->right:I

    .line 31
    .line 32
    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 37
    .line 38
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {p3, p1, v2, p2, p0}, Landroid/graphics/Rect;->inset(IIII)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final calculateGridSizeMFV(Lcom/android/launcher3/h0;Landroid/content/Context;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "BaseContainerInterface"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "calculateGridSize: container null return"

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    const-string p0, "calculateGridSize: recentsView null return"

    .line 24
    .line 25
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-virtual {p0, p2, p1}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimensionRatio(Landroid/content/Context;Lcom/android/launcher3/h0;)F

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    if-eq p0, v1, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x2

    .line 43
    if-eq p0, v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    move-object v4, p1

    .line 50
    move-object v3, p2

    .line 51
    move-object v5, p3

    .line 52
    move-object v2, p4

    .line 53
    invoke-interface/range {v2 .. v7}, Lcom/android/launcher3/touch/G;->calculateMultiGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;IF)Landroid/graphics/Rect;

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    move-object v4, p1

    .line 58
    move-object v3, p2

    .line 59
    move-object v5, p3

    .line 60
    move-object v2, p4

    .line 61
    invoke-interface {v2, v3, v4, v5, v7}, Lcom/android/launcher3/touch/G;->calculateDoubleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    move-object v4, p1

    .line 66
    move-object v3, p2

    .line 67
    move-object v5, p3

    .line 68
    move-object v2, p4

    .line 69
    invoke-interface {v2, v3, v4, v5, v7}, Lcom/android/launcher3/touch/G;->calculateSingleGridSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final calculateGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/quickstep/BaseContainerInterface;->calculateGridTaskSizeMFV(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, p1, p2, v1}, Lcom/android/quickstep/BaseContainerInterface;->calculateLargeTileSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    iget v2, p2, Lcom/android/launcher3/h0;->S2:I

    .line 25
    .line 26
    add-int/2addr p0, v2

    .line 27
    iget v2, p2, Lcom/android/launcher3/h0;->X2:I

    .line 28
    .line 29
    sub-int/2addr p0, v2

    .line 30
    int-to-float p0, p0

    .line 31
    const/high16 v2, 0x40000000    # 2.0f

    .line 32
    .line 33
    div-float/2addr p0, v2

    .line 34
    invoke-static {p1, p2}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimension(Landroid/content/Context;Lcom/android/launcher3/h0;)Landroid/graphics/PointF;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget p2, p2, Lcom/android/launcher3/h0;->S2:I

    .line 39
    .line 40
    int-to-float p2, p2

    .line 41
    sub-float/2addr p0, p2

    .line 42
    iget p2, p1, Landroid/graphics/PointF;->y:F

    .line 43
    .line 44
    div-float/2addr p0, p2

    .line 45
    iget p2, p1, Landroid/graphics/PointF;->x:F

    .line 46
    .line 47
    mul-float/2addr p2, p0

    .line 48
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 53
    .line 54
    mul-float/2addr p0, p1

    .line 55
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-interface {p4, v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getRecentsRtlSetting(Landroid/content/res/Resources;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_1

    .line 64
    .line 65
    const/4 p1, 0x5

    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const/4 p1, 0x3

    .line 68
    :goto_0
    or-int/lit8 p1, p1, 0x30

    .line 69
    .line 70
    invoke-static {p1, p2, p0, v1, p3}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final calculateGridTaskSizeMFV(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)Z
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "BaseContainerInterface"

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string p0, "calculateGridTaskSize: container null return"

    .line 11
    .line 12
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    const-string p0, "calculateGridTaskSize: recentsView null return"

    .line 25
    .line 26
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return v1

    .line 30
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/4 v2, 0x1

    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    if-eq v1, v2, :cond_3

    .line 38
    .line 39
    const/4 v3, 0x2

    .line 40
    if-eq v1, v3, :cond_2

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 43
    .line 44
    .line 45
    move-result v9

    .line 46
    move-object v4, p0

    .line 47
    move-object v5, p1

    .line 48
    move-object v6, p2

    .line 49
    move-object v7, p3

    .line 50
    move-object v8, p4

    .line 51
    invoke-virtual/range {v4 .. v9}, Lcom/android/quickstep/BaseContainerInterface;->calculateMultiGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;I)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    move-object v4, p0

    .line 56
    move-object v5, p1

    .line 57
    move-object v6, p2

    .line 58
    move-object v7, p3

    .line 59
    move-object v8, p4

    .line 60
    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/android/quickstep/BaseContainerInterface;->calculateDoubleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    move-object v4, p0

    .line 65
    move-object v5, p1

    .line 66
    move-object v6, p2

    .line 67
    move-object v7, p3

    .line 68
    move-object v8, p4

    .line 69
    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/android/quickstep/BaseContainerInterface;->calculateSingleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;)V

    .line 70
    .line 71
    .line 72
    :goto_0
    invoke-direct {v4, v6, v7, v8, v0}, Lcom/android/quickstep/BaseContainerInterface;->updateOutRect(Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;Lcom/android/quickstep/views/RecentsView;)V

    .line 73
    .line 74
    .line 75
    return v2
.end method

.method public final calculateModalTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V
    .locals 10

    .line 1
    invoke-virtual/range {p0 .. p4}, Lcom/android/quickstep/BaseContainerInterface;->calculateTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p2, Lcom/android/launcher3/h0;->G0:Z

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget v3, p2, Lcom/android/launcher3/h0;->U2:I

    .line 21
    .line 22
    iget v4, p2, Lcom/android/launcher3/h0;->T2:I

    .line 23
    .line 24
    add-int/2addr v3, v4

    .line 25
    iget v4, p2, Lcom/android/launcher3/h0;->s3:I

    .line 26
    .line 27
    add-int/2addr v3, v4

    .line 28
    :goto_1
    move v4, v3

    .line 29
    goto :goto_2

    .line 30
    :cond_1
    iget v3, p2, Lcom/android/launcher3/h0;->U0:I

    .line 31
    .line 32
    iget v4, p3, Landroid/graphics/Rect;->bottom:I

    .line 33
    .line 34
    sub-int/2addr v3, v4

    .line 35
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 40
    .line 41
    sub-int/2addr v3, v4

    .line 42
    goto :goto_1

    .line 43
    :goto_2
    if-nez v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const v1, 0x7f070976

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getFloat(I)F

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget v1, p2, Lcom/android/launcher3/h0;->V0:I

    .line 57
    .line 58
    int-to-float v1, v1

    .line 59
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    int-to-float v3, v3

    .line 64
    mul-float/2addr v3, v0

    .line 65
    sub-float/2addr v1, v3

    .line 66
    const/high16 v0, 0x40000000    # 2.0f

    .line 67
    .line 68
    div-float/2addr v1, v0

    .line 69
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    :cond_2
    move v5, v1

    .line 74
    iget v3, p2, Lcom/android/launcher3/h0;->O2:I

    .line 75
    .line 76
    const/high16 v6, 0x3f800000    # 1.0f

    .line 77
    .line 78
    const/16 v7, 0x51

    .line 79
    .line 80
    move-object v0, p0

    .line 81
    move-object v1, p1

    .line 82
    move-object v2, p2

    .line 83
    move-object v8, p3

    .line 84
    move-object v9, p4

    .line 85
    invoke-direct/range {v0 .. v9}, Lcom/android/quickstep/BaseContainerInterface;->calculateTaskSizeInternal(Landroid/content/Context;Lcom/android/launcher3/h0;IIIFILandroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final calculateMultiGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;I)V
    .locals 7

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimensionRatio(Landroid/content/Context;Lcom/android/launcher3/h0;)F

    .line 2
    .line 3
    .line 4
    move-result v6

    .line 5
    move-object v4, p4

    .line 6
    move-object v1, p1

    .line 7
    move-object v2, p2

    .line 8
    move-object v3, p3

    .line 9
    move-object v0, p4

    .line 10
    move v5, p5

    .line 11
    invoke-interface/range {v0 .. v6}, Lcom/android/launcher3/touch/G;->calculateMultiGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;IF)Landroid/graphics/Rect;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final calculateSingleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/launcher3/touch/G;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimensionRatio(Landroid/content/Context;Lcom/android/launcher3/h0;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-interface {p4, p1, p2, p3, p0}, Lcom/android/launcher3/touch/G;->calculateSingleGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;F)Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final calculateTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V
    .locals 10

    .line 1
    iget-boolean v0, p2, Lcom/android/launcher3/h0;->G0:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/android/launcher3/X3;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const v1, 0x7f070974

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getFloat(I)F

    .line 20
    .line 21
    .line 22
    move-result v6

    .line 23
    iget v1, p2, Lcom/android/launcher3/h0;->O2:I

    .line 24
    .line 25
    invoke-interface {p4}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->isLayoutNaturalToLauncher()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->E0()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    :goto_0
    move v4, v3

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    iget v3, p2, Lcom/android/launcher3/h0;->U2:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iget v3, p2, Lcom/android/launcher3/h0;->S2:I

    .line 41
    .line 42
    const v5, 0x7f070975

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    invoke-static {v0, v5}, Lx1/O;->B0(Landroid/content/res/Resources;I)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int v5, v0, v1

    .line 54
    .line 55
    const/16 v7, 0x11

    .line 56
    .line 57
    move-object v0, p0

    .line 58
    move-object v1, p1

    .line 59
    move-object v2, p2

    .line 60
    move-object v8, p3

    .line 61
    move-object v9, p4

    .line 62
    invoke-direct/range {v0 .. v9}, Lcom/android/quickstep/BaseContainerInterface;->calculateTaskSizeInternal(Landroid/content/Context;Lcom/android/launcher3/h0;IIIFILandroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    :goto_2
    invoke-virtual/range {p0 .. p4}, Lcom/android/quickstep/BaseContainerInterface;->calculateGridTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public abstract closeOverlay()V
.end method

.method public abstract createActivityInitListener(Ljava/util/function/Predicate;)Lcom/android/quickstep/util/ContextInitListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/android/quickstep/util/ContextInitListener;"
        }
    .end annotation
.end method

.method public abstract deferStartingActivity(Lcom/android/quickstep/RecentsAnimationDeviceState;Landroid/view/MotionEvent;)Z
.end method

.method public abstract getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TCONTAINER_TYPE;"
        }
    .end annotation
.end method

.method protected abstract getOverviewScrimColorForState(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/statemanager/a;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TCONTAINER_TYPE;TSTATE_TYPE;)I"
        }
    .end annotation
.end method

.method public abstract getOverviewWindowBounds(Landroid/graphics/Rect;Landroid/view/RemoteAnimationTarget;)Landroid/graphics/Rect;
.end method

.method public getParallelAnimationToGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;JLcom/android/quickstep/RecentsAnimationCallbacks;)Landroid/animation/Animator;
    .locals 3

    .line 1
    sget-object p4, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-ne p1, p4, :cond_3

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 7
    .line 8
    .line 9
    move-result-object p4

    .line 10
    if-nez p4, :cond_0

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    invoke-interface {p4}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/android/quickstep/BaseContainerInterface;->stateFromGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/statemanager/a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p4}, Lcom/android/quickstep/views/RecentsViewContainer;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget-object v2, Lcom/android/launcher3/G2;->l:Landroid/util/IntProperty;

    .line 28
    .line 29
    invoke-virtual {p0, p4, p1}, Lcom/android/quickstep/BaseContainerInterface;->getOverviewScrimColorForState(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/statemanager/a;)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    filled-new-array {p0}, [I

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {v1, v2, p0}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->isKeyboardTaskFocusPending()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    sget-object p1, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    :goto_0
    sget-object p1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 57
    .line 58
    :goto_1
    invoke-virtual {p0, p1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 59
    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_3
    return-object v0
.end method

.method public abstract getSwipeUpDestinationAndLength(Lcom/android/launcher3/h0;Landroid/content/Context;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)I
.end method

.method public getTaskDimensionRatio(Landroid/content/Context;Lcom/android/launcher3/h0;)F
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/android/quickstep/BaseContainerInterface;->getTaskDimension(Landroid/content/Context;Lcom/android/launcher3/h0;)Landroid/graphics/PointF;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p1, p0, Landroid/graphics/PointF;->x:F

    .line 6
    .line 7
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 8
    .line 9
    div-float/2addr p1, p0

    .line 10
    return p1
.end method

.method public abstract getTaskbarController()Lcom/android/launcher3/taskbar/o4;
.end method

.method public abstract getVisibleRecentsView()Lcom/android/quickstep/views/RecentsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;>()TT;"
        }
    .end annotation
.end method

.method public abstract isInLiveTileMode()Z
.end method

.method public abstract isResumed()Z
.end method

.method public abstract isStarted()Z
.end method

.method public abstract onAssistantVisibilityChanged(F)V
.end method

.method public abstract onExitOverview(Ljava/lang/Runnable;)V
.end method

.method protected onInitBackgroundStateUI()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/BaseContainerInterface;->mOnInitBackgroundStateUICallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/quickstep/BaseContainerInterface;->mOnInitBackgroundStateUICallback:Ljava/lang/Runnable;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public abstract onLaunchTaskFailed()V
.end method

.method public onSettledOnEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/o4;->N(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->l()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public onSwipeUpToHomeComplete()V
    .locals 0

    .line 1
    return-void
.end method

.method public onTransitionCancelled(ZLcom/android/quickstep/GestureState$GestureEndTarget;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->B()Lcom/android/launcher3/statemanager/a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Lcom/android/quickstep/BaseContainerInterface;->stateFromGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/statemanager/a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget-object v2, LP1/k;->o:Lcom/android/launcher3/util/I;

    .line 33
    .line 34
    invoke-virtual {v2, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, LP1/k;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/content/Context;->getDisplayId()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {v2, p0}, LP1/k;->s(I)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 51
    .line 52
    if-ne p2, p0, :cond_1

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->B()Lcom/android/launcher3/statemanager/a;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const/4 p1, 0x0

    .line 63
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public abstract prepareRecentsUI(ZLjava/util/function/Consumer;)Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/util/AnimatorControllerWithResistance;",
            ">;)",
            "Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;"
        }
    .end annotation
.end method

.method public runOnInitBackgroundStateUI(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/statemanager/i;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/android/quickstep/BaseContainerInterface;->mBackgroundState:Lcom/android/launcher3/statemanager/a;

    .line 18
    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->onInitBackgroundStateUI()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iput-object p1, p0, Lcom/android/quickstep/BaseContainerInterface;->mOnInitBackgroundStateUICallback:Ljava/lang/Runnable;

    .line 29
    .line 30
    return-void
.end method

.method public setOnDeferredActivityLaunchCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public shouldCancelCurrentGesture()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public abstract stateFromGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/statemanager/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/GestureState$GestureEndTarget;",
            ")TSTATE_TYPE;"
        }
    .end annotation
.end method

.method public abstract switchRunningTaskViewToScreenshot(Ljava/util/HashMap;Ljava/lang/Runnable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation
.end method

.method public abstract switchToRecentsIfVisible(Landroid/animation/Animator$AnimatorListener;)Z
.end method
