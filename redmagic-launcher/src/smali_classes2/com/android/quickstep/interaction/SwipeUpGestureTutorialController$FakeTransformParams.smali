.class Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$FakeTransformParams;
.super Lcom/android/quickstep/util/TransformParams;
.source "SwipeUpGestureTutorialController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FakeTransformParams"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;


# direct methods
.method private constructor <init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$FakeTransformParams;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    invoke-direct {p0}, Lcom/android/quickstep/util/TransformParams;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;Lcom/android/quickstep/interaction/C;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$FakeTransformParams;-><init>(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)V

    return-void
.end method


# virtual methods
.method public applySurfaceParams(Lcom/android/quickstep/util/SurfaceTransaction;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/quickstep/util/RecordingSurfaceTransaction;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/quickstep/util/RecordingSurfaceTransaction;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/android/quickstep/util/RecordingSurfaceTransaction;->mockProperties:Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$FakeTransformParams;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->matrix:Landroid/graphics/Matrix;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setAnimationMatrix(Landroid/graphics/Matrix;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$FakeTransformParams;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->matrix:Landroid/graphics/Matrix;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setAnimationMatrix(Landroid/graphics/Matrix;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$FakeTransformParams;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->m(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;)Landroid/graphics/Rect;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p1, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->windowCrop:Landroid/graphics/Rect;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$FakeTransformParams;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 39
    .line 40
    iget p1, p1, Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;->cornerRadius:F

    .line 41
    .line 42
    invoke-static {v0, p1}, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;->o(Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;F)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$FakeTransformParams;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController$FakeTransformParams;->this$0:Lcom/android/quickstep/interaction/SwipeUpGestureTutorialController;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidateOutline()V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public createSurfaceParams(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/SurfaceTransaction;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/util/RecordingSurfaceTransaction;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/RecordingSurfaceTransaction;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/android/quickstep/util/RecordingSurfaceTransaction;->mockProperties:Lcom/android/quickstep/util/SurfaceTransaction$MockProperties;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-interface {p1, v1, v2, p0}, Lcom/android/quickstep/util/TransformParams$BuilderProxy;->onBuildTargetParams(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method
