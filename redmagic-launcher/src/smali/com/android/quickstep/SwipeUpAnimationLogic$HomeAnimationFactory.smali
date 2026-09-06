.class public abstract Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.super Ljava/lang/Object;
.source "SwipeUpAnimationLogic.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/SwipeUpAnimationLogic;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x404
    name = "HomeAnimationFactory"
.end annotation


# instance fields
.field protected mAnimType:I

.field public mIconScaleForNormal:F

.field public mIsNeedUpdateCurrentRectF:Z

.field public mRectFSpringAnim:Lcom/android/quickstep/util/RectFSpringAnim;

.field public mStartRect:Landroid/graphics/RectF;

.field protected mSwipeVelocity:F

.field public mTargetWorkspaceView:Landroid/view/View;

.field final synthetic this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;


# direct methods
.method protected constructor <init>(Lcom/android/quickstep/SwipeUpAnimationLogic;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 p1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    iput p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mIconScaleForNormal:F

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mAnimType:I

    .line 12
    .line 13
    new-instance p1, Landroid/graphics/RectF;

    .line 14
    .line 15
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mStartRect:Landroid/graphics/RectF;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public applyTaskFullRect(Landroid/graphics/Matrix;)V
    .locals 0

    .line 1
    return-void
.end method

.method public calculateScrollX(F)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public canUseWorkspaceItemView()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public abstract createActivityAnimationToHome()Lcom/android/launcher3/anim/q;
.end method

.method public createToHomeAnimRecord([Lu2/s;Lcom/android/quickstep/util/animation/AnimationRecord;)Lcom/android/quickstep/util/animation/AnimationRecord;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getAnimRecord()Lcom/android/quickstep/util/animation/AnimationRecord;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getEndRadius(Landroid/graphics/RectF;)F
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 p1, 0x40000000    # 2.0f

    .line 6
    .line 7
    div-float/2addr p0, p1

    .line 8
    return p0
.end method

.method public getIsDisappear()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getTargetTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method protected getViewIgnoredInWorkspaceRevealAnimation()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method protected getWindowAlpha(F)F
    .locals 8

    .line 1
    invoke-static {}, Lx1/O;->Y2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;

    .line 9
    .line 10
    iget v0, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mHomeAnimTargetViewType:I

    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/anim/C;->i0(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    move v3, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget v0, Lcom/android/launcher3/anim/C;->W:F

    .line 21
    .line 22
    move v3, v0

    .line 23
    :goto_0
    invoke-static {}, Lx1/O;->Y2()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;

    .line 32
    .line 33
    iget p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mHomeAnimTargetViewType:I

    .line 34
    .line 35
    invoke-static {p0}, Lcom/android/launcher3/anim/C;->i0(I)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_1

    .line 40
    .line 41
    move v4, v2

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    sget p0, Lcom/android/launcher3/anim/C;->X:F

    .line 44
    .line 45
    move v4, p0

    .line 46
    :goto_1
    cmpg-float p0, p1, v3

    .line 47
    .line 48
    if-gtz p0, :cond_2

    .line 49
    .line 50
    return v2

    .line 51
    :cond_2
    cmpl-float p0, p1, v4

    .line 52
    .line 53
    if-ltz p0, :cond_3

    .line 54
    .line 55
    return v1

    .line 56
    :cond_3
    invoke-static {}, Lx1/O;->Y2()Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_4

    .line 61
    .line 62
    sget-object p0, Lcom/android/launcher3/anim/L;->S:Landroid/view/animation/Interpolator;

    .line 63
    .line 64
    :goto_2
    move-object v7, p0

    .line 65
    goto :goto_3

    .line 66
    :cond_4
    sget-object p0, Lcom/android/launcher3/anim/L;->A:Landroid/view/animation/Interpolator;

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :goto_3
    const/high16 v5, 0x3f800000    # 1.0f

    .line 70
    .line 71
    const/4 v6, 0x0

    .line 72
    move v2, p1

    .line 73
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0
.end method

.method protected getWindowBlurRadius(F)I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public getWindowTargetRect()Landroid/graphics/RectF;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/SwipeUpAnimationLogic;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 10
    .line 11
    invoke-static {}, Lx1/O;->Y2()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-static {p0}, Lcom/android/launcher3/anim/C;->b0(Lcom/android/launcher3/h0;)Landroid/graphics/RectF;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    iget v1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 23
    .line 24
    div-int/lit8 v1, v1, 0x2

    .line 25
    .line 26
    iget v2, p0, Lcom/android/launcher3/h0;->V0:I

    .line 27
    .line 28
    iget v3, p0, Lcom/android/launcher3/h0;->W0:I

    .line 29
    .line 30
    invoke-interface {v0, v2, v3}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    int-to-float v2, v2

    .line 35
    iget v3, p0, Lcom/android/launcher3/h0;->V0:I

    .line 36
    .line 37
    iget v4, p0, Lcom/android/launcher3/h0;->W0:I

    .line 38
    .line 39
    invoke-interface {v0, v3, v4}, Lcom/android/launcher3/touch/G;->getSecondaryValue(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    int-to-float v0, v0

    .line 44
    const/high16 v3, 0x40000000    # 2.0f

    .line 45
    .line 46
    div-float/2addr v2, v3

    .line 47
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->p()Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v4, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const/high16 v3, 0x3f800000    # 1.0f

    .line 59
    .line 60
    :goto_0
    div-float/2addr v0, v3

    .line 61
    iget p0, p0, Lcom/android/launcher3/h0;->f2:I

    .line 62
    .line 63
    int-to-float p0, p0

    .line 64
    sub-float/2addr v0, p0

    .line 65
    new-instance p0, Landroid/graphics/RectF;

    .line 66
    .line 67
    int-to-float v1, v1

    .line 68
    sub-float v3, v2, v1

    .line 69
    .line 70
    sub-float v4, v0, v1

    .line 71
    .line 72
    add-float/2addr v2, v1

    .line 73
    add-float/2addr v0, v1

    .line 74
    invoke-direct {p0, v3, v4, v2, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 75
    .line 76
    .line 77
    return-object p0
.end method

.method public getWorkspaceView()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public isAnimatingIntoIcon()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isAnimationReady()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public isCard()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isFolder()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isHotSeatIcon()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isIconClamp()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public isInHotseat()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isMFVTwoCard()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isPortrait()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->S0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

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

.method public isReverseEnable()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isRtl()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public isViewSupportAsync()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isWidget()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isWorkSpaceFling()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onCancel()V
    .locals 0

    .line 1
    return-void
.end method

.method public onCancel(I)V
    .locals 0

    .line 2
    return-void
.end method

.method public onEnd(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    return-void
.end method

.method public playAtomicAnimation(FLandroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setAnimType(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setAnimation(Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mRectFSpringAnim:Lcom/android/quickstep/util/RectFSpringAnim;

    return-void
.end method

.method public setAnimation(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setReverseDisable(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public setSwipeVelocity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mSwipeVelocity:F

    .line 2
    .line 3
    return-void
.end method

.method public setTaskViewArtist(Lcom/android/launcher3/views/ClipIconView$b;)V
    .locals 0

    .line 1
    return-void
.end method

.method public update(FFLandroid/graphics/RectF;FFLjava/util/function/Supplier;Ljava/util/function/Supplier;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FF",
            "Landroid/graphics/RectF;",
            "FF",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public update(Landroid/graphics/RectF;FFI)V
    .locals 0

    .line 2
    return-void
.end method

.method public updateIconLayer(Landroid/graphics/RectF;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Lcom/android/quickstep/util/SurfaceTransaction;)V
    .locals 0

    .line 1
    return-void
.end method
