.class public final Lcom/android/quickstep/util/animation/RectTransformHelper;
.super Ljava/lang/Object;
.source "RectTransformHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;,
        Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static final INSTANCE:Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;

.field private static final TAG:Ljava/lang/String; = "RectTransformHelper"


# instance fields
.field private mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

.field private mClipRect:Landroid/graphics/Rect;

.field private mRealWindowRect:Landroid/graphics/Rect;

.field private mSourceWindowRect:Landroid/graphics/Rect;

.field private mTmpMatrix:Landroid/graphics/Matrix;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/animation/RectTransformHelper;->INSTANCE:Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V
    .locals 2

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string v0, "sourceRectF"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    const-string v0, "realWindowRectF"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    const-string v0, "animType"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 20
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mRealWindowRect:Landroid/graphics/Rect;

    .line 21
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mClipRect:Landroid/graphics/Rect;

    .line 22
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 23
    iget-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 24
    iget v1, p1, Landroid/graphics/RectF;->left:F

    float-to-int v1, v1

    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 25
    iget v1, p1, Landroid/graphics/RectF;->top:F

    float-to-int v1, v1

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 26
    iget v1, p1, Landroid/graphics/RectF;->right:F

    float-to-int v1, v1

    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 27
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    float-to-int p1, p1

    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    .line 28
    iget-object p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mRealWindowRect:Landroid/graphics/Rect;

    .line 29
    iget v0, p2, Landroid/graphics/RectF;->left:F

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 30
    iget v0, p2, Landroid/graphics/RectF;->top:F

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 31
    iget v0, p2, Landroid/graphics/RectF;->right:F

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 32
    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    float-to-int p2, p2

    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 33
    iput-object p3, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/RectF;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    const-string v0, "sourceRectF"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    const-string v0, "animType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 5
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mRealWindowRect:Landroid/graphics/Rect;

    .line 6
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mClipRect:Landroid/graphics/Rect;

    .line 7
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 8
    iget-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 9
    iget v1, p1, Landroid/graphics/RectF;->left:F

    float-to-int v1, v1

    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 10
    iget v1, p1, Landroid/graphics/RectF;->top:F

    float-to-int v1, v1

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 11
    iget v1, p1, Landroid/graphics/RectF;->right:F

    float-to-int v1, v1

    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 12
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    float-to-int p1, p1

    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    .line 13
    iget-object p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mRealWindowRect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    .line 14
    iput-object p2, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    return-void
.end method

.method public static synthetic a(Lu2/s;Lcom/android/quickstep/util/SurfaceTransaction;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/animation/RectTransformHelper;->applySurfaceParams$lambda$5$lambda$4(Lu2/s;Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final applySurfaceParams$lambda$5$lambda$3(Lu2/s;Lcom/android/quickstep/util/animation/RectTransformHelper;Lcom/android/quickstep/util/SurfaceTransaction;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;ZLu2/s$a;)V
    .locals 7

    .line 1
    const-string v0, "$it"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "this$0"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "$transaction"

    .line 12
    .line 13
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "$transformParams"

    .line 17
    .line 18
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lu2/s;->h:Landroid/view/SurfaceControl;

    .line 22
    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :cond_0
    iget-object v0, p1, Lcom/android/quickstep/util/animation/RectTransformHelper;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 34
    .line 35
    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->OPEN_FROM_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 36
    .line 37
    sget-object v0, Lcom/android/quickstep/util/animation/RectTransformHelper;->INSTANCE:Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;

    .line 38
    .line 39
    invoke-static {v0, p0, p2}, Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;->a(Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;Lu2/s;Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, LM3/a;->f()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v1, "Apply "

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, ", crop: "

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object v1, p1, Lcom/android/quickstep/util/animation/RectTransformHelper;->mClipRect:Landroid/graphics/Rect;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v1, ", type: "

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v1, p1, Lcom/android/quickstep/util/animation/RectTransformHelper;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v1, "RectTransformHelper"

    .line 86
    .line 87
    invoke-static {v1, v0}, LM3/a;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    iget-object p0, p0, Lu2/s;->h:Landroid/view/SurfaceControl;

    .line 91
    .line 92
    invoke-virtual {p2, p0}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    iget-object p2, p1, Lcom/android/quickstep/util/animation/RectTransformHelper;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 97
    .line 98
    invoke-virtual {p0, p2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-virtual {p3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getAlpha()F

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-virtual {p3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getRadius()F

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    invoke-virtual {p3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getRadiusWeight()F

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-virtual {p2, v0, v1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(FF)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 119
    .line 120
    .line 121
    if-eqz p4, :cond_2

    .line 122
    .line 123
    iget-object p2, p1, Lcom/android/quickstep/util/animation/RectTransformHelper;->mClipRect:Landroid/graphics/Rect;

    .line 124
    .line 125
    invoke-virtual {p0, p2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 126
    .line 127
    .line 128
    :cond_2
    if-eqz p5, :cond_3

    .line 129
    .line 130
    invoke-virtual {p3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getX()F

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    invoke-virtual {p3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getY()F

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    invoke-virtual {p3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getScale()F

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    invoke-virtual {p3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getRadius()F

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    invoke-virtual {p3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getAlpha()F

    .line 147
    .line 148
    .line 149
    move-result v5

    .line 150
    iget-object v6, p1, Lcom/android/quickstep/util/animation/RectTransformHelper;->mClipRect:Landroid/graphics/Rect;

    .line 151
    .line 152
    move-object v0, p5

    .line 153
    invoke-virtual/range {v0 .. v6}, Lu2/s$a;->c(FFFFFLandroid/graphics/Rect;)V

    .line 154
    .line 155
    .line 156
    :cond_3
    :goto_0
    return-void
.end method

.method public static final applySurfaceParams$lambda$5$lambda$4(Lu2/s;Lcom/android/quickstep/util/SurfaceTransaction;)V
    .locals 1

    .line 1
    const-string v0, "$it"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "$transaction"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lu2/s;->h:Landroid/view/SurfaceControl;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lu2/s;->h:Landroid/view/SurfaceControl;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/high16 p1, 0x3f800000    # 1.0f

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public static final getTracking(ILandroid/graphics/RectF;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/RectTransformHelper;->INSTANCE:Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;->getTracking(ILandroid/graphics/RectF;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private final isAppTarget(ILu2/s;)Z
    .locals 2

    .line 1
    iget v0, p2, Lu2/s;->m:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 p1, 0x2

    .line 8
    if-ne v0, p1, :cond_2

    .line 9
    .line 10
    iget p1, p2, Lu2/s;->a:I

    .line 11
    .line 12
    if-ne p1, v1, :cond_2

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 15
    .line 16
    sget-object p1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->OPEN_FROM_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 17
    .line 18
    if-eq p0, p1, :cond_1

    .line 19
    .line 20
    sget-object p1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->REMOTE_CLOSE_TO_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 21
    .line 22
    if-ne p0, p1, :cond_2

    .line 23
    .line 24
    :cond_1
    return v1

    .line 25
    :cond_2
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private final isLargeCardAnim(FILcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method private static final restoreTaskLayerIfNeeded(Lu2/s;Lcom/android/quickstep/util/SurfaceTransaction;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/RectTransformHelper;->INSTANCE:Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;->a(Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;Lu2/s;Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final applySurfaceParams(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;[Lu2/s;ILcom/android/quickstep/util/SurfaceTransaction;Lu2/s$a;Landroid/graphics/RectF;Z)V
    .locals 10

    .line 1
    move-object/from16 v7, p6

    .line 2
    .line 3
    const-string v0, "transformParams"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "appTargets"

    .line 9
    .line 10
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "transaction"

    .line 14
    .line 15
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string v0, "appActualWindowRectF"

    .line 19
    .line 20
    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1, v7}, Lcom/android/quickstep/util/animation/RectTransformHelper;->updateWindowCropRect(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;)V

    .line 24
    .line 25
    .line 26
    array-length v8, p2

    .line 27
    const/4 v0, 0x0

    .line 28
    move v9, v0

    .line 29
    :goto_0
    if-ge v9, v8, :cond_2

    .line 30
    .line 31
    aget-object v2, p2, v9

    .line 32
    .line 33
    invoke-direct {p0, p3, v2}, Lcom/android/quickstep/util/animation/RectTransformHelper;->isAppTarget(ILu2/s;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    div-float/2addr v0, v1

    .line 48
    iget-object v1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 49
    .line 50
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-direct {p0, v0, v1, p1}, Lcom/android/quickstep/util/animation/RectTransformHelper;->isLargeCardAnim(FILcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_0

    .line 59
    .line 60
    iget-object v1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getScale()F

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    iget-object v5, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 67
    .line 68
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    int-to-float v5, v5

    .line 73
    div-float/2addr v5, v0

    .line 74
    mul-float/2addr v4, v5

    .line 75
    iget-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    int-to-float v0, v0

    .line 82
    div-float/2addr v4, v0

    .line 83
    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iget-object v5, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mClipRect:Landroid/graphics/Rect;

    .line 88
    .line 89
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    int-to-float v5, v5

    .line 94
    div-float/2addr v0, v5

    .line 95
    invoke-virtual {v1, v4, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getX()F

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getScale()F

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    iget-object v5, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mClipRect:Landroid/graphics/Rect;

    .line 109
    .line 110
    iget v5, v5, Landroid/graphics/Rect;->left:I

    .line 111
    .line 112
    int-to-float v5, v5

    .line 113
    mul-float/2addr v4, v5

    .line 114
    sub-float/2addr v1, v4

    .line 115
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getY()F

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    invoke-virtual {v0, v1, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getScale()F

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getScale()F

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    invoke-virtual {v0, v1, v4}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 137
    .line 138
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getX()F

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getY()F

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    invoke-virtual {v0, v1, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 147
    .line 148
    .line 149
    :goto_1
    new-instance v0, Lcom/android/quickstep/util/animation/RectTransformHelper$1;

    .line 150
    .line 151
    move-object v1, p0

    .line 152
    move-object v4, p1

    .line 153
    move-object v3, p4

    .line 154
    move-object v6, p5

    .line 155
    move/from16 v5, p7

    .line 156
    .line 157
    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/util/animation/RectTransformHelper$1;-><init>(Lcom/android/quickstep/util/animation/RectTransformHelper;Lu2/s;Lcom/android/quickstep/util/SurfaceTransaction;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;ZLu2/s$a;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v2, v0}, Lu2/s;->j(Ljava/lang/Runnable;)V

    .line 161
    .line 162
    .line 163
    goto :goto_2

    .line 164
    :cond_1
    new-instance v0, Lcom/android/quickstep/util/animation/i;

    .line 165
    .line 166
    invoke-direct {v0, v2, p4}, Lcom/android/quickstep/util/animation/i;-><init>(Lu2/s;Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v2, v0}, Lu2/s;->j(Ljava/lang/Runnable;)V

    .line 170
    .line 171
    .line 172
    :goto_2
    add-int/lit8 v9, v9, 0x1

    .line 173
    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :cond_2
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getSurfaceTransactionApplier()Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    if-nez p0, :cond_3

    .line 181
    .line 182
    invoke-virtual {p4}, Lcom/android/quickstep/util/SurfaceTransaction;->setVsyncId()V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p4}, Lcom/android/quickstep/util/SurfaceTransaction;->getTransaction()Landroid/view/SurfaceControl$Transaction;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {p0}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 190
    .line 191
    .line 192
    return-void

    .line 193
    :cond_3
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getSurfaceTransactionApplier()Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    if-eqz p0, :cond_4

    .line 198
    .line 199
    invoke-virtual {p0, p4}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 200
    .line 201
    .line 202
    :cond_4
    return-void
.end method

.method public final calculateWindowAlpha(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;Landroid/graphics/RectF;Z)F
    .locals 5

    .line 1
    const-string v0, "transformParams"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "curRectF"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "iconRectF"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    div-float/2addr v0, v1

    .line 25
    const/high16 v1, 0x3f800000    # 1.0f

    .line 26
    .line 27
    cmpl-float v0, v0, v1

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x1

    .line 31
    if-lez v0, :cond_0

    .line 32
    .line 33
    move v0, v3

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v0, v2

    .line 36
    :goto_0
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsVerticalClip()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_2

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    goto :goto_3

    .line 45
    :cond_1
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    :goto_1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    :goto_2
    int-to-float p0, p0

    .line 60
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/N5;->r(FFF)F

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    goto :goto_5

    .line 65
    :cond_2
    :goto_3
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsVerticalClip()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_4

    .line 70
    .line 71
    if-eqz v0, :cond_4

    .line 72
    .line 73
    iget-object p1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iget-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    div-int/2addr p1, v0

    .line 86
    if-gt p1, v3, :cond_3

    .line 87
    .line 88
    goto :goto_4

    .line 89
    :cond_3
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    goto :goto_1

    .line 98
    :cond_4
    :goto_4
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    goto :goto_2

    .line 113
    :goto_5
    if-eqz p4, :cond_5

    .line 114
    .line 115
    sget-object p1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;->getTHRESHOLD_RANGE_GRADIENT()[F

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    goto :goto_6

    .line 122
    :cond_5
    sget-object p1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;->getTHRESHOLD_RANGE_GRADIENT()[F

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    :goto_6
    aget p2, p1, v2

    .line 129
    .line 130
    sub-float/2addr p0, p2

    .line 131
    aget p1, p1, v3

    .line 132
    .line 133
    sub-float/2addr p1, p2

    .line 134
    div-float/2addr p0, p1

    .line 135
    const/4 p1, 0x0

    .line 136
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    invoke-static {v1, p0}, Ljava/lang/Math;->min(FF)F

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    return p0
.end method

.method public final calculateWindowScale(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;)F
    .locals 1

    .line 1
    const-string v0, "transformParams"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "curRectF"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsVerticalClip()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    :goto_0
    int-to-float p0, p0

    .line 39
    div-float/2addr p1, p0

    .line 40
    return p1
.end method

.method public final getMClipRect()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mClipRect:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMTmpMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mTmpMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getWindowCropStrategy(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;IZ)V
    .locals 4

    .line 1
    const-string p4, "transformParams"

    .line 2
    .line 3
    invoke-static {p1, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p4, "iconRectF"

    .line 7
    .line 8
    invoke-static {p2, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    div-float/2addr p4, v0

    .line 20
    iget-object v0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-float v0, v0

    .line 27
    iget-object v1, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    int-to-float v1, v1

    .line 34
    div-float/2addr v0, v1

    .line 35
    const/4 v1, 0x1

    .line 36
    const/4 v2, 0x0

    .line 37
    if-nez p3, :cond_1

    .line 38
    .line 39
    cmpg-float p4, p4, v0

    .line 40
    .line 41
    if-gtz p4, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move v1, v2

    .line 45
    :goto_0
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setVerticalClip(Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v2}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setClipFromLeftOrTop(Z)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    if-ne p3, v1, :cond_2

    .line 53
    .line 54
    invoke-virtual {p1, v2}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setVerticalClip(Z)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v2}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setClipFromLeftOrTop(Z)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    const/4 v3, 0x2

    .line 62
    if-ne p3, v3, :cond_4

    .line 63
    .line 64
    cmpg-float p4, p4, v0

    .line 65
    .line 66
    if-gtz p4, :cond_3

    .line 67
    .line 68
    move v2, v1

    .line 69
    :cond_3
    invoke-virtual {p1, v2}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setVerticalClip(Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setClipFromLeftOrTop(Z)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    const/4 p4, 0x3

    .line 77
    if-ne p3, p4, :cond_5

    .line 78
    .line 79
    invoke-virtual {p1, v2}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setVerticalClip(Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setClipFromLeftOrTop(Z)V

    .line 83
    .line 84
    .line 85
    :cond_5
    :goto_1
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsVerticalClip()Z

    .line 86
    .line 87
    .line 88
    move-result p4

    .line 89
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsClipFromLeftOrTop()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 94
    .line 95
    const-string v0, ", isClipFromLeftOrTop: "

    .line 96
    .line 97
    const-string v1, ", rotation: "

    .line 98
    .line 99
    const-string v2, "isVerticalClip: "

    .line 100
    .line 101
    invoke-static {v2, p4, v0, p1, v1}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string p3, ", iconRectF: "

    .line 109
    .line 110
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string p2, ", winRectF: "

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string p0, "RectTransformHelper"

    .line 125
    .line 126
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-static {p0, p1}, LM3/a;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public final updateWindowCropRect(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;)V
    .locals 4

    .line 1
    const-string v0, "transformParams"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "appActualWindowRectF"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    div-float/2addr v0, p2

    .line 20
    iget-object p2, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mRealWindowRect:Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/graphics/Rect;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    iget-object p2, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mSourceWindowRect:Landroid/graphics/Rect;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mRealWindowRect:Landroid/graphics/Rect;

    .line 32
    .line 33
    :goto_0
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsVerticalClip()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/4 v3, 0x0

    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsClipFromLeftOrTop()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mClipRect:Landroid/graphics/Rect;

    .line 51
    .line 52
    iput v3, p0, Landroid/graphics/Rect;->left:I

    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    int-to-float p1, p1

    .line 59
    int-to-float v2, v1

    .line 60
    mul-float/2addr v2, v0

    .line 61
    sub-float/2addr p1, v2

    .line 62
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iput p1, p0, Landroid/graphics/Rect;->top:I

    .line 67
    .line 68
    iput v1, p0, Landroid/graphics/Rect;->right:I

    .line 69
    .line 70
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    iput p1, p0, Landroid/graphics/Rect;->bottom:I

    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mClipRect:Landroid/graphics/Rect;

    .line 78
    .line 79
    iput v3, p0, Landroid/graphics/Rect;->left:I

    .line 80
    .line 81
    iput v3, p0, Landroid/graphics/Rect;->top:I

    .line 82
    .line 83
    iput v1, p0, Landroid/graphics/Rect;->right:I

    .line 84
    .line 85
    int-to-float p1, v1

    .line 86
    mul-float/2addr p1, v0

    .line 87
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    iput p1, p0, Landroid/graphics/Rect;->bottom:I

    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsClipFromLeftOrTop()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_3

    .line 99
    .line 100
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mClipRect:Landroid/graphics/Rect;

    .line 101
    .line 102
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    int-to-float p1, p1

    .line 107
    div-float/2addr p1, v0

    .line 108
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    sub-int p1, v1, p1

    .line 113
    .line 114
    iput p1, p0, Landroid/graphics/Rect;->left:I

    .line 115
    .line 116
    iput v3, p0, Landroid/graphics/Rect;->top:I

    .line 117
    .line 118
    iput v1, p0, Landroid/graphics/Rect;->right:I

    .line 119
    .line 120
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    iput p1, p0, Landroid/graphics/Rect;->bottom:I

    .line 125
    .line 126
    return-void

    .line 127
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/util/animation/RectTransformHelper;->mClipRect:Landroid/graphics/Rect;

    .line 128
    .line 129
    iput v3, p0, Landroid/graphics/Rect;->left:I

    .line 130
    .line 131
    iput v3, p0, Landroid/graphics/Rect;->top:I

    .line 132
    .line 133
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    int-to-float p1, p1

    .line 138
    div-float/2addr p1, v0

    .line 139
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    iput p1, p0, Landroid/graphics/Rect;->right:I

    .line 144
    .line 145
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    iput p1, p0, Landroid/graphics/Rect;->bottom:I

    .line 150
    .line 151
    return-void
.end method
