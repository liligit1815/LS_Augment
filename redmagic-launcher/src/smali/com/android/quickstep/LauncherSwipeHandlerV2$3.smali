.class Lcom/android/quickstep/LauncherSwipeHandlerV2$3;
.super Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;
.source "LauncherSwipeHandlerV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2;->createHomeAnimationFactory(Ljava/util/List;JZZLandroid/view/RemoteAnimationTarget;Lcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private syncGestureState:Z

.field final synthetic this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;


# direct methods
.method constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$3;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/quickstep/B1;)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$3;->syncGestureState:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getEndRadius(Landroid/graphics/RectF;)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$3;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 12
    .line 13
    int-to-float p0, p0

    .line 14
    const/high16 p1, 0x40800000    # 4.0f

    .line 15
    .line 16
    div-float/2addr p0, p1

    .line 17
    return p0
.end method

.method protected getWindowAlpha(F)F
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    sget-object v5, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const v2, 0x3f5eb852    # 0.87f

    .line 6
    .line 7
    .line 8
    const/high16 v3, 0x3f800000    # 1.0f

    .line 9
    .line 10
    move v0, p1

    .line 11
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public getWindowTargetRect()Landroid/graphics/RectF;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$3;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/statemanager/h;

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    invoke-static {p0, v0}, Lcom/android/launcher3/anim/C;->U(Lcom/android/launcher3/statemanager/h;I)Landroid/graphics/RectF;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public update(Landroid/graphics/RectF;FFI)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->update(Landroid/graphics/RectF;FFI)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x3f000000    # 0.5f

    .line 5
    .line 6
    cmpl-float p1, p2, p1

    .line 7
    .line 8
    if-lez p1, :cond_0

    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$3;->syncGestureState:Z

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    cmpl-float p1, p3, p1

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$3;->syncGestureState:Z

    .line 21
    .line 22
    invoke-static {}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->getGestureState()Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$3;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 29
    .line 30
    const/16 p2, 0xc

    .line 31
    .line 32
    invoke-virtual {p1, p0, p2}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;->syncGestureState(Landroid/content/Context;I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
