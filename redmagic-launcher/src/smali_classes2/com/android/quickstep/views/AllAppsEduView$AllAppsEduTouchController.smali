.class Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;
.super Lcom/android/launcher3/uioverrides/touchcontrollers/x;
.source "AllAppsEduView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/AllAppsEduView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AllAppsEduTouchController"
.end annotation


# direct methods
.method private constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;-><init>(Lcom/android/launcher3/C2;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/C2;Lcom/android/quickstep/views/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;-><init>(Lcom/android/launcher3/C2;)V

    return-void
.end method

.method static bridge synthetic c(Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;)Lcom/android/launcher3/anim/q;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;->initAllAppsAnimation()Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;->isDraggingOrSettling()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private initAllAppsAnimation()Lcom/android/launcher3/anim/q;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->initCurrentAnimation()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/android/launcher3/touch/d;->mProgressMultiplier:F

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 16
    .line 17
    return-object p0
.end method

.method private isDraggingOrSettling()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->e()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method


# virtual methods
.method protected canInterceptTouch(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public bridge synthetic clearLastStatus()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/util/G2;->clearLastStatus()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/util/G2;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onDrag(FFLandroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/touch/H$d;->onDrag(FFLandroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
