.class public Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;
.super Ljava/lang/Object;
.source "FloatingTaskView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/FloatingTaskView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FullscreenDrawParams"
.end annotation


# instance fields
.field public final mBounds:Landroid/graphics/RectF;

.field private final mCornerRadius:F

.field public mCurrentDrawnCornerRadius:F

.field public mIsStagedTask:Z

.field public mScaleX:F

.field public mScaleY:F

.field private final mWindowCornerRadius:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mBounds:Landroid/graphics/RectF;

    .line 10
    .line 11
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    iput v0, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mScaleX:F

    .line 14
    .line 15
    iput v0, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mScaleY:F

    .line 16
    .line 17
    invoke-static {p1}, Lcom/android/quickstep/util/TaskCornerRadius;->get(Landroid/content/Context;)F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mCornerRadius:F

    .line 22
    .line 23
    invoke-static {p1}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mWindowCornerRadius:F

    .line 28
    .line 29
    iput v0, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mCurrentDrawnCornerRadius:F

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public setIsStagedTask(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mIsStagedTask:Z

    .line 2
    .line 3
    return-void
.end method

.method public updateParams(Landroid/graphics/RectF;FFF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mBounds:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 4
    .line 5
    .line 6
    iput p3, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mScaleX:F

    .line 7
    .line 8
    iput p4, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mScaleY:F

    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mIsStagedTask:Z

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget p1, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mWindowCornerRadius:F

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget p1, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mCornerRadius:F

    .line 18
    .line 19
    iget p3, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mWindowCornerRadius:F

    .line 20
    .line 21
    invoke-static {p2, p1, p3}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    :goto_0
    iput p1, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mCurrentDrawnCornerRadius:F

    .line 26
    .line 27
    return-void
.end method
