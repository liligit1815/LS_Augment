.class public Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;
.super Ljava/lang/Object;
.source "AnimParamProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/AnimParamProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SwipeUpVelocityParam"
.end annotation


# instance fields
.field private maxRadioVelocity:F

.field private maxWidthVelocity:F

.field private maxXVelocity:F

.field private maxYVelocity:F

.field private widthVelocityStrategy:F

.field private xVelocityScale:F

.field private yVelocityScale:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->xVelocityScale:F

    .line 7
    .line 8
    iput v0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->yVelocityScale:F

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->initParam()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final getMaxRadioVelocity()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->maxRadioVelocity:F

    .line 2
    .line 3
    return p0
.end method

.method public final getMaxWidthVelocity()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->maxWidthVelocity:F

    .line 2
    .line 3
    return p0
.end method

.method public final getMaxXVelocity()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->maxXVelocity:F

    .line 2
    .line 3
    return p0
.end method

.method public final getMaxYVelocity()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->maxYVelocity:F

    .line 2
    .line 3
    return p0
.end method

.method public final getWidthVelocityStrategy()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->widthVelocityStrategy:F

    .line 2
    .line 3
    return p0
.end method

.method public final getXVelocityScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->xVelocityScale:F

    .line 2
    .line 3
    return p0
.end method

.method public final getYVelocityScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->yVelocityScale:F

    .line 2
    .line 3
    return p0
.end method

.method public initParam()V
    .locals 3

    .line 1
    sget v0, Lcom/android/launcher3/anim/x;->e:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/N5;->c(III)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, 0x41900000    # 18.0f

    .line 10
    .line 11
    iput v1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->maxWidthVelocity:F

    .line 12
    .line 13
    sget-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->getWIDTH_VELOCITY_RATE_Y()[F

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    aget v2, v2, v0

    .line 20
    .line 21
    iput v2, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->widthVelocityStrategy:F

    .line 22
    .line 23
    const/high16 v2, 0x3f000000    # 0.5f

    .line 24
    .line 25
    iput v2, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->xVelocityScale:F

    .line 26
    .line 27
    const/high16 v2, 0x41500000    # 13.0f

    .line 28
    .line 29
    iput v2, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->maxXVelocity:F

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->getSCALE_Y_VELOCITY()[F

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    aget v0, v1, v0

    .line 36
    .line 37
    iput v0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->yVelocityScale:F

    .line 38
    .line 39
    const/high16 v0, 0x41580000    # 13.5f

    .line 40
    .line 41
    iput v0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->maxYVelocity:F

    .line 42
    .line 43
    const/high16 v0, 0x419c0000    # 19.5f

    .line 44
    .line 45
    iput v0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->maxRadioVelocity:F

    .line 46
    .line 47
    return-void
.end method

.method public final setMaxRadioVelocity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->maxRadioVelocity:F

    .line 2
    .line 3
    return-void
.end method

.method public final setMaxWidthVelocity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->maxWidthVelocity:F

    .line 2
    .line 3
    return-void
.end method

.method public final setMaxXVelocity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->maxXVelocity:F

    .line 2
    .line 3
    return-void
.end method

.method public final setMaxYVelocity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->maxYVelocity:F

    .line 2
    .line 3
    return-void
.end method

.method public final setWidthVelocityStrategy(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->widthVelocityStrategy:F

    .line 2
    .line 3
    return-void
.end method

.method public final setXVelocityScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->xVelocityScale:F

    .line 2
    .line 3
    return-void
.end method

.method public final setYVelocityScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->yVelocityScale:F

    .line 2
    .line 3
    return-void
.end method
