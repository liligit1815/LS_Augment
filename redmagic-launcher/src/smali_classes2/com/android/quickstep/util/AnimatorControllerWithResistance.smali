.class public Lcom/android/quickstep/util/AnimatorControllerWithResistance;
.super Ljava/lang/Object;
.source "AnimatorControllerWithResistance.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;,
        Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;
    }
.end annotation


# static fields
.field private static final RECENTS_SCALE_RESIST_INTERPOLATOR:Landroid/animation/TimeInterpolator;

.field private static final RECENTS_TRANSLATE_RESIST_INTERPOLATOR:Landroid/animation/TimeInterpolator;

.field private static final TEMP_RECT:Landroid/graphics/Rect;


# instance fields
.field private mLastNormalProgress:F

.field private mLastResistProgress:F

.field private final mNormalController:Lcom/android/launcher3/anim/q;

.field private final mResistanceController:Lcom/android/launcher3/anim/q;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, LJ0/h;->I:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    sput-object v0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->RECENTS_SCALE_RESIST_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    .line 4
    .line 5
    sget-object v0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->RECENTS_TRANSLATE_RESIST_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->TEMP_RECT:Landroid/graphics/Rect;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/anim/q;Lcom/android/launcher3/anim/q;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->mLastNormalProgress:F

    .line 7
    .line 8
    iput-object p1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->mNormalController:Lcom/android/launcher3/anim/q;

    .line 9
    .line 10
    iput-object p2, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->mResistanceController:Lcom/android/launcher3/anim/q;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(FFFF)F
    .locals 1

    .line 1
    cmpg-float v0, p3, p0

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    return p3

    .line 6
    :cond_0
    cmpl-float v0, p3, p1

    .line 7
    .line 8
    if-ltz v0, :cond_1

    .line 9
    .line 10
    return p2

    .line 11
    :cond_1
    invoke-static {p3, p0, p1}, Lcom/android/launcher3/N5;->r(FFF)F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    sget-object p3, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->RECENTS_SCALE_RESIST_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    .line 16
    .line 17
    invoke-interface {p3, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    sub-float/2addr p2, p0

    .line 22
    mul-float/2addr p1, p2

    .line 23
    add-float/2addr p0, p1

    .line 24
    return p0
.end method

.method public static createForRecents(Lcom/android/launcher3/anim/q;Landroid/content/Context;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/launcher3/h0;Ljava/lang/Object;Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/util/FloatProperty;)Lcom/android/quickstep/util/AnimatorControllerWithResistance;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<SCA",
            "LE:Ljava/lang/Object;",
            "TRANS",
            "LATION:Ljava/lang/Object;",
            ">(",
            "Lcom/android/launcher3/anim/q;",
            "Landroid/content/Context;",
            "Lcom/android/quickstep/util/RecentsOrientedState;",
            "Lcom/android/launcher3/h0;",
            "TSCA",
            "LE;",
            "Landroid/util/FloatProperty<",
            "TSCA",
            "LE;",
            ">;TTRANS",
            "LATION;",
            "Landroid/util/FloatProperty<",
            "TTRANS",
            "LATION;",
            ">;)",
            "Lcom/android/quickstep/util/AnimatorControllerWithResistance;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;

    .line 2
    .line 3
    const/4 v8, 0x0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move-object v4, p4

    .line 8
    move-object v5, p5

    .line 9
    move-object v6, p6

    .line 10
    move-object/from16 v7, p7

    .line 11
    .line 12
    invoke-direct/range {v0 .. v8}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;-><init>(Landroid/content/Context;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/launcher3/h0;Ljava/lang/Object;Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/util/FloatProperty;Lcom/android/quickstep/util/k;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/android/quickstep/util/RecentsOrientedState;->getTouchRotation()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 p4, 0x1

    .line 20
    if-eq p1, p4, :cond_0

    .line 21
    .line 22
    invoke-virtual {p2}, Lcom/android/quickstep/util/RecentsOrientedState;->getTouchRotation()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 p2, 0x3

    .line 27
    if-ne p1, p2, :cond_1

    .line 28
    .line 29
    :cond_0
    sget-object p1, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP_LAND:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 30
    .line 31
    invoke-static {v0, p1}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->b(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    instance-of p2, p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 39
    .line 40
    if-eqz p2, :cond_3

    .line 41
    .line 42
    iget-boolean p2, p3, Lcom/android/launcher3/h0;->G0:Z

    .line 43
    .line 44
    if-eqz p2, :cond_3

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lcom/android/quickstep/views/RecentsView;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eq p1, p4, :cond_2

    .line 57
    .line 58
    sget-object p1, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP_TABLET_MFV:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    sget-object p1, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP_TABLET_MFV_ONETASK:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 62
    .line 63
    :goto_0
    invoke-static {v0, p1}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->b(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;

    .line 64
    .line 65
    .line 66
    :cond_3
    invoke-static {v0}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->createRecentsResistanceAnim(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;)Lcom/android/launcher3/anim/V;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    new-instance p2, Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 75
    .line 76
    invoke-direct {p2, p0, p1}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;-><init>(Lcom/android/launcher3/anim/q;Lcom/android/launcher3/anim/q;)V

    .line 77
    .line 78
    .line 79
    return-object p2
.end method

.method public static createRecentsResistanceAnim(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;)Lcom/android/launcher3/anim/V;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<SCA",
            "LE:Ljava/lang/Object;",
            "TRANS",
            "LATION:Ljava/lang/Object;",
            ">(",
            "Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams<",
            "TSCA",
            "LE;",
            "TTRANS",
            "LATION;",
            ">;)",
            "Lcom/android/launcher3/anim/V;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->recentsOrientedState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v2, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->recentsOrientedState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/android/quickstep/util/RecentsOrientedState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v3, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->context:Landroid/content/Context;

    .line 19
    .line 20
    iget-object v4, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->dp:Lcom/android/launcher3/h0;

    .line 21
    .line 22
    invoke-virtual {v2, v3, v4, v0, v1}, Lcom/android/quickstep/BaseContainerInterface;->calculateTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V

    .line 23
    .line 24
    .line 25
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 26
    .line 27
    int-to-long v2, v2

    .line 28
    const-wide/16 v4, 0x0

    .line 29
    .line 30
    cmp-long v6, v2, v4

    .line 31
    .line 32
    if-gez v6, :cond_0

    .line 33
    .line 34
    const-string v2, "AnimatorControllerWithResistance"

    .line 35
    .line 36
    const-string v3, "createRecentsResistanceAnim: distanceToCover < 0"

    .line 37
    .line 38
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-wide v2, v4

    .line 42
    :cond_0
    iget-object v4, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->resistAnim:Lcom/android/launcher3/anim/V;

    .line 43
    .line 44
    if-eqz v4, :cond_1

    .line 45
    .line 46
    :goto_0
    move-object v7, v4

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    new-instance v4, Lcom/android/launcher3/anim/V;

    .line 49
    .line 50
    const-wide/16 v5, 0x2

    .line 51
    .line 52
    mul-long/2addr v5, v2

    .line 53
    invoke-direct {v4, v5, v6}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :goto_1
    new-instance v4, Landroid/graphics/PointF;

    .line 58
    .line 59
    invoke-direct {v4}, Landroid/graphics/PointF;-><init>()V

    .line 60
    .line 61
    .line 62
    iget-object v5, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->recentsOrientedState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 63
    .line 64
    iget-object v6, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->dp:Lcom/android/launcher3/h0;

    .line 65
    .line 66
    invoke-virtual {v5, v0, v6, v4}, Lcom/android/quickstep/util/RecentsOrientedState;->getFullScreenScaleAndPivot(Landroid/graphics/Rect;Lcom/android/launcher3/h0;Landroid/graphics/PointF;)F

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    new-instance v6, Landroid/graphics/RectF;

    .line 71
    .line 72
    invoke-direct {v6, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 73
    .line 74
    .line 75
    new-instance v8, Landroid/graphics/Matrix;

    .line 76
    .line 77
    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    .line 78
    .line 79
    .line 80
    iget-object v9, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->resistanceParams:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 81
    .line 82
    iget v9, v9, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->scaleMaxResist:F

    .line 83
    .line 84
    iget v10, v4, Landroid/graphics/PointF;->x:F

    .line 85
    .line 86
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 87
    .line 88
    invoke-virtual {v8, v9, v9, v10, v4}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v8, v6}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 92
    .line 93
    .line 94
    iget v4, v6, Landroid/graphics/RectF;->top:F

    .line 95
    .line 96
    invoke-interface {v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryTranslationDirectionFactor()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    int-to-float v1, v1

    .line 101
    mul-float/2addr v4, v1

    .line 102
    iget-object v1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->resistanceParams:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 103
    .line 104
    iget v1, v1, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->translationFactor:F

    .line 105
    .line 106
    mul-float v11, v4, v1

    .line 107
    .line 108
    iget-object v8, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->translationTarget:Ljava/lang/Object;

    .line 109
    .line 110
    iget-object v9, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->translationProperty:Landroid/util/FloatProperty;

    .line 111
    .line 112
    iget v10, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->startTranslation:F

    .line 113
    .line 114
    sget-object v12, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->RECENTS_TRANSLATE_RESIST_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    .line 115
    .line 116
    invoke-virtual/range {v7 .. v12}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 117
    .line 118
    .line 119
    iget v1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->startScale:F

    .line 120
    .line 121
    sub-float/2addr v5, v1

    .line 122
    iget-object v4, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->dp:Lcom/android/launcher3/h0;

    .line 123
    .line 124
    iget v4, v4, Lcom/android/launcher3/h0;->U0:I

    .line 125
    .line 126
    iget v8, v0, Landroid/graphics/Rect;->bottom:I

    .line 127
    .line 128
    sub-int/2addr v4, v8

    .line 129
    int-to-float v4, v4

    .line 130
    div-float/2addr v5, v4

    .line 131
    long-to-float v2, v2

    .line 132
    mul-float/2addr v5, v2

    .line 133
    sub-float v11, v1, v5

    .line 134
    .line 135
    iget-object v2, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->resistanceParams:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 136
    .line 137
    iget v2, v2, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->scaleStartResist:F

    .line 138
    .line 139
    invoke-static {v2, v1, v11}, Lcom/android/launcher3/N5;->r(FFF)F

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    iget-object v2, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->resistanceParams:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 144
    .line 145
    iget v2, v2, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->scaleMaxResist:F

    .line 146
    .line 147
    iget v3, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->startScale:F

    .line 148
    .line 149
    invoke-static {v2, v3, v11}, Lcom/android/launcher3/N5;->r(FFF)F

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    iget-object v3, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->resistanceParams:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 154
    .line 155
    iget-boolean v3, v3, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->stopScalingAtTop:Z

    .line 156
    .line 157
    const/high16 v4, 0x3f800000    # 1.0f

    .line 158
    .line 159
    if-eqz v3, :cond_2

    .line 160
    .line 161
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 162
    .line 163
    int-to-float v0, v0

    .line 164
    iget v3, v6, Landroid/graphics/RectF;->top:F

    .line 165
    .line 166
    div-float/2addr v0, v3

    .line 167
    sub-float/2addr v4, v0

    .line 168
    :cond_2
    new-instance v12, Lcom/android/quickstep/util/j;

    .line 169
    .line 170
    invoke-direct {v12, v1, v4, v2}, Lcom/android/quickstep/util/j;-><init>(FFF)V

    .line 171
    .line 172
    .line 173
    iget-object v8, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->scaleTarget:Ljava/lang/Object;

    .line 174
    .line 175
    iget-object v9, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->scaleProperty:Landroid/util/FloatProperty;

    .line 176
    .line 177
    iget v10, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->startScale:F

    .line 178
    .line 179
    invoke-virtual/range {v7 .. v12}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 180
    .line 181
    .line 182
    return-object v7
.end method

.method public static createRecentsResistanceFromOverviewAnim(Lcom/android/launcher3/C2;Lcom/android/launcher3/anim/V;)Lcom/android/launcher3/anim/V;
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v5, v0

    .line 6
    check-cast v5, Lcom/android/quickstep/views/RecentsView;

    .line 7
    .line 8
    new-instance v1, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;

    .line 9
    .line 10
    invoke-virtual {v5}, Lcom/android/quickstep/views/RecentsView;->getPagedViewOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    sget-object v6, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 19
    .line 20
    sget-object v8, Lcom/android/quickstep/views/RecentsView;->TASK_SECONDARY_TRANSLATION:Landroid/util/FloatProperty;

    .line 21
    .line 22
    const/4 v9, 0x0

    .line 23
    move-object v7, v5

    .line 24
    move-object v2, p0

    .line 25
    invoke-direct/range {v1 .. v9}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;-><init>(Landroid/content/Context;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/launcher3/h0;Ljava/lang/Object;Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/util/FloatProperty;Lcom/android/quickstep/util/k;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, p1}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->a(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;Lcom/android/launcher3/anim/V;)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget-object p1, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_OVERVIEW:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 33
    .line 34
    invoke-static {p0, p1}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->b(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getScaleX()F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-static {p0, p1}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;->c(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;F)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->createRecentsResistanceAnim(Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsParams;)Lcom/android/launcher3/anim/V;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method


# virtual methods
.method public getNormalController()Lcom/android/launcher3/anim/q;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->mNormalController:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    return-object p0
.end method

.method public setProgress(FF)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    iget v3, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->mLastNormalProgress:F

    .line 9
    .line 10
    cmpl-float v3, v2, v3

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    iput v2, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->mLastNormalProgress:F

    .line 15
    .line 16
    iget-object v3, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->mNormalController:Lcom/android/launcher3/anim/q;

    .line 17
    .line 18
    invoke-virtual {v3, v2}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 19
    .line 20
    .line 21
    :cond_0
    cmpg-float v2, p2, v1

    .line 22
    .line 23
    if-gtz v2, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    cmpg-float v2, p1, v1

    .line 27
    .line 28
    if-gtz v2, :cond_2

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    invoke-static {p1, v1, p2}, Lcom/android/launcher3/N5;->r(FFF)F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    :goto_0
    iget p1, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->mLastResistProgress:F

    .line 36
    .line 37
    cmpl-float p1, v0, p1

    .line 38
    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iput v0, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->mLastResistProgress:F

    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->mResistanceController:Lcom/android/launcher3/anim/q;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 46
    .line 47
    .line 48
    :cond_3
    :goto_1
    return-void
.end method
