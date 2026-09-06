.class Lcom/android/quickstep/TaskViewUtils$2;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "TaskViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/TaskViewUtils;->createRecentsWindowAnimator(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Z[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;LP1/h;Landroid/window/TransitionInfo;Lcom/android/launcher3/anim/V;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mNavFadeIn:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field mNavFadeOut:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final synthetic val$cropRect:Landroid/graphics/Rect;

.field final synthetic val$navBarTarget:Landroid/view/RemoteAnimationTarget;

.field final synthetic val$out:Lcom/android/launcher3/anim/V;

.field final synthetic val$remoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/V;[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;Landroid/view/RemoteAnimationTarget;Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskViewUtils$2;->val$out:Lcom/android/launcher3/anim/V;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/TaskViewUtils$2;->val$remoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/TaskViewUtils$2;->val$navBarTarget:Landroid/view/RemoteAnimationTarget;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/TaskViewUtils$2;->val$cropRect:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 13
    .line 14
    sget-object p3, Lcom/android/launcher3/q5;->Y:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/anim/V;->t()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    long-to-float p4, v0

    .line 21
    const/4 v0, 0x0

    .line 22
    const/high16 v1, 0x43050000    # 133.0f

    .line 23
    .line 24
    invoke-static {p3, v0, v1, p4}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    const/high16 p4, 0x3f800000    # 1.0f

    .line 29
    .line 30
    invoke-direct {p2, p0, p4, v0, p3}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 31
    .line 32
    .line 33
    iput-object p2, p0, Lcom/android/quickstep/TaskViewUtils$2;->mNavFadeOut:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 34
    .line 35
    new-instance p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 36
    .line 37
    sget-object p3, Lcom/android/launcher3/q5;->X:Landroid/view/animation/Interpolator;

    .line 38
    .line 39
    sget-wide v2, Lcom/android/launcher3/q5;->W:J

    .line 40
    .line 41
    long-to-float v2, v2

    .line 42
    invoke-virtual {p1}, Lcom/android/launcher3/anim/V;->t()J

    .line 43
    .line 44
    .line 45
    move-result-wide v3

    .line 46
    long-to-float p1, v3

    .line 47
    invoke-static {p3, v2, v1, p1}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-direct {p2, p0, v0, p4, p1}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 52
    .line 53
    .line 54
    iput-object p2, p0, Lcom/android/quickstep/TaskViewUtils$2;->mNavFadeIn:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public onUpdate(FZ)V
    .locals 7

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/TaskViewUtils$2;->val$remoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    array-length p2, p1

    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    if-ge v0, p2, :cond_1

    .line 6
    .line 7
    aget-object v1, p1, v0

    .line 8
    .line 9
    new-instance v2, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 10
    .line 11
    invoke-direct {v2}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v3, p0, Lcom/android/quickstep/TaskViewUtils$2;->val$navBarTarget:Landroid/view/RemoteAnimationTarget;

    .line 15
    .line 16
    iget-object v3, v3, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget-object v4, p0, Lcom/android/quickstep/TaskViewUtils$2;->mNavFadeIn:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 23
    .line 24
    iget v5, v4, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 25
    .line 26
    invoke-virtual {v4}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->getStartValue()F

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    cmpl-float v4, v5, v4

    .line 31
    .line 32
    if-lez v4, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v4}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCropRect()Landroid/graphics/RectF;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    iget-object v6, p0, Lcom/android/quickstep/TaskViewUtils$2;->val$cropRect:Landroid/graphics/Rect;

    .line 43
    .line 44
    invoke-virtual {v5, v6}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v4}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentMatrix()Landroid/graphics/Matrix;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v3, v4}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    iget-object v4, p0, Lcom/android/quickstep/TaskViewUtils$2;->val$cropRect:Landroid/graphics/Rect;

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget-object v4, p0, Lcom/android/quickstep/TaskViewUtils$2;->mNavFadeIn:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 62
    .line 63
    iget v4, v4, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 64
    .line 65
    invoke-virtual {v3, v4}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_0
    iget-object v4, p0, Lcom/android/quickstep/TaskViewUtils$2;->mNavFadeOut:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 70
    .line 71
    iget v4, v4, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 72
    .line 73
    invoke-virtual {v3, v4}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 74
    .line 75
    .line 76
    :goto_1
    invoke-virtual {v1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/TransformParams;->applySurfaceParams(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 81
    .line 82
    .line 83
    add-int/lit8 v0, v0, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    return-void
.end method
