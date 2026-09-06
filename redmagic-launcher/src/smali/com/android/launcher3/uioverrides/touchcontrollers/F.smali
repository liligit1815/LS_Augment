.class public final Lcom/android/launcher3/uioverrides/touchcontrollers/F;
.super Ljava/lang/Object;
.source "TaskViewDismissTouchController.kt"

# interfaces
.implements Lcom/android/launcher3/util/G2;
.implements Lcom/android/launcher3/touch/H$d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/uioverrides/touchcontrollers/F$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<CONTAINER:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/util/G2;",
        "Lcom/android/launcher3/touch/H$d;"
    }
.end annotation


# static fields
.field public static final v:Lcom/android/launcher3/uioverrides/touchcontrollers/F$a;


# instance fields
.field private final g:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TCONTAINER;"
        }
    .end annotation
.end field

.field private final h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

.field private final i:Lcom/android/quickstep/views/RecentsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation
.end field

.field private final j:Lcom/android/launcher3/touch/H;

.field private final k:Z

.field private final l:I

.field private final m:Landroid/graphics/Rect;

.field private n:Lcom/android/quickstep/views/TaskView;

.field private o:Landroidx/dynamicanimation/animation/j;

.field private p:I

.field private q:I

.field private r:Z

.field private s:F

.field private t:Landroidx/dynamicanimation/animation/j;

.field private u:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/F$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/uioverrides/touchcontrollers/F$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->v:Lcom/android/launcher3/uioverrides/touchcontrollers/F$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/uioverrides/touchcontrollers/I;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TCONTAINER;",
            "Lcom/android/launcher3/uioverrides/touchcontrollers/I;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "container"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "taskViewRecentsTouchContext"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->g:Landroid/content/Context;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 17
    .line 18
    move-object p2, p1

    .line 19
    check-cast p2, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 20
    .line 21
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    const-string v0, "getOverviewPanel(...)"

    .line 26
    .line 27
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    check-cast p2, Lcom/android/quickstep/views/RecentsView;

    .line 31
    .line 32
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 33
    .line 34
    new-instance v0, Lcom/android/launcher3/touch/H;

    .line 35
    .line 36
    const-string v1, "null cannot be cast to non-null type android.content.Context"

    .line 37
    .line 38
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getUpDownSwipeDirection()Lcom/android/launcher3/touch/H$c;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-direct {v0, p1, p0, v1}, Lcom/android/launcher3/touch/H;-><init>(Landroid/content/Context;Lcom/android/launcher3/touch/H$d;Lcom/android/launcher3/touch/H$c;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->j:Lcom/android/launcher3/touch/H;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->k:Z

    .line 63
    .line 64
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-interface {p2, p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getUpDirection(Z)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->l:I

    .line 73
    .line 74
    new-instance p1, Landroid/graphics/Rect;

    .line 75
    .line 76
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->m:Landroid/graphics/Rect;

    .line 80
    .line 81
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/uioverrides/touchcontrollers/F;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i(Lcom/android/launcher3/uioverrides/touchcontrollers/F;Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(FLcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->h(FLcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic c(Lcom/android/launcher3/uioverrides/touchcontrollers/F;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final d(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    and-int/lit16 p1, p1, 0x100

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    const-string v1, "TaskViewDismissTouchController"

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const-string p0, "Not intercepting edge swipe on nav bar."

    .line 13
    .line 14
    invoke-static {v1, p0}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->g:Landroid/content/Context;

    .line 19
    .line 20
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 21
    .line 22
    const v2, 0x7ff8febf

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v2}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    const-string p0, "Not intercepting, open floating view blocking touch."

    .line 32
    .line 33
    invoke-static {v1, p0}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return v0

    .line 37
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 38
    .line 39
    invoke-interface {p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/I;->isRecentsModal()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    const-string p0, "Not intercepting touch in modal overlay."

    .line 46
    .line 47
    invoke-static {v1, p0}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return v0

    .line 51
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 52
    .line 53
    invoke-interface {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/I;->isRecentsInteractive()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-nez p0, :cond_3

    .line 58
    .line 59
    const-string p1, "Not intercepting touch, recents not interactive."

    .line 60
    .line 61
    invoke-static {v1, p1}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    return p0
.end method

.method private final e()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->j:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->c()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->j:Lcom/android/launcher3/touch/H;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1, v1}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->n:Lcom/android/quickstep/views/TaskView;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setTranslationZ(F)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->n:Lcom/android/quickstep/views/TaskView;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->o:Landroidx/dynamicanimation/animation/j;

    .line 24
    .line 25
    iput-boolean v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->u:Z

    .line 26
    .line 27
    return-void
.end method

.method private final f(F)F
    .locals 6

    .line 1
    const/4 p0, 0x0

    .line 2
    cmpg-float p0, p1, p0

    .line 3
    .line 4
    if-gtz p0, :cond_0

    .line 5
    .line 6
    const/high16 p0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    const p0, 0x3e4ccccd    # 0.2f

    .line 10
    .line 11
    .line 12
    cmpg-float p0, p1, p0

    .line 13
    .line 14
    if-gez p0, :cond_1

    .line 15
    .line 16
    const v4, 0x3f7ccccd    # 0.9875f

    .line 17
    .line 18
    .line 19
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    const v2, 0x3e4ccccd    # 0.2f

    .line 23
    .line 24
    .line 25
    const/high16 v3, 0x3f800000    # 1.0f

    .line 26
    .line 27
    move v0, p1

    .line 28
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_1
    move v0, p1

    .line 34
    const/high16 p0, 0x3f000000    # 0.5f

    .line 35
    .line 36
    cmpg-float p0, v0, p0

    .line 37
    .line 38
    if-gez p0, :cond_2

    .line 39
    .line 40
    const p0, 0x3f7ccccd    # 0.9875f

    .line 41
    .line 42
    .line 43
    return p0

    .line 44
    :cond_2
    const p0, 0x3f133333    # 0.575f

    .line 45
    .line 46
    .line 47
    cmpg-float p0, v0, p0

    .line 48
    .line 49
    if-gez p0, :cond_3

    .line 50
    .line 51
    const v4, 0x3f79999a    # 0.975f

    .line 52
    .line 53
    .line 54
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 55
    .line 56
    const/high16 v1, 0x3f000000    # 0.5f

    .line 57
    .line 58
    const v2, 0x3f133333    # 0.575f

    .line 59
    .line 60
    .line 61
    const v3, 0x3f7ccccd    # 0.9875f

    .line 62
    .line 63
    .line 64
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    return p0

    .line 69
    :cond_3
    const p0, 0x3f79999a    # 0.975f

    .line 70
    .line 71
    .line 72
    return p0
.end method

.method private final g(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->o:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->t:Landroidx/dynamicanimation/animation/j;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 13
    .line 14
    .line 15
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->d(Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    return v1

    .line 23
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViews()Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v2, "getTaskViews(...)"

    .line 30
    .line 31
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    const/4 v3, 0x0

    .line 43
    if-eqz v2, :cond_4

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    move-object v4, v2

    .line 50
    check-cast v4, Lcom/android/quickstep/views/TaskView;

    .line 51
    .line 52
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 53
    .line 54
    invoke-virtual {v5, v4}, Lcom/android/quickstep/views/RecentsView;->isTaskViewVisible(Lcom/android/quickstep/views/TaskView;)Z

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    if-eqz v5, :cond_3

    .line 59
    .line 60
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->g:Landroid/content/Context;

    .line 61
    .line 62
    check-cast v5, Lcom/android/launcher3/views/k;

    .line 63
    .line 64
    invoke-interface {v5}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v5, v4, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-eqz v4, :cond_3

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    move-object v2, v3

    .line 76
    :goto_0
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 77
    .line 78
    const/4 p1, 0x1

    .line 79
    if-eqz v2, :cond_5

    .line 80
    .line 81
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->g:Landroid/content/Context;

    .line 88
    .line 89
    check-cast v3, Lcom/android/launcher3/views/k;

    .line 90
    .line 91
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    const-string v4, "getDragLayer(...)"

    .line 96
    .line 97
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-interface {v0, v3}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryDimension(Landroid/view/View;)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->m:Landroid/graphics/Rect;

    .line 105
    .line 106
    invoke-virtual {v2, v3, p1}, Lcom/android/quickstep/views/TaskView;->getThumbnailBounds(Landroid/graphics/Rect;Z)V

    .line 107
    .line 108
    .line 109
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 110
    .line 111
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->m:Landroid/graphics/Rect;

    .line 116
    .line 117
    invoke-interface {v3, v0, v4}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getTaskDismissLength(ILandroid/graphics/Rect;)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->p:I

    .line 122
    .line 123
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 124
    .line 125
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-interface {v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getTaskDismissVerticalDirection()I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->q:I

    .line 134
    .line 135
    move-object v3, v2

    .line 136
    :cond_5
    iput-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->n:Lcom/android/quickstep/views/TaskView;

    .line 137
    .line 138
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->j:Lcom/android/launcher3/touch/H;

    .line 139
    .line 140
    iget p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->l:I

    .line 141
    .line 142
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 143
    .line 144
    .line 145
    return p1
.end method

.method private static final h(FLcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/android/quickstep/util/TaskViewSimulator;->taskSecondaryTranslation:Lcom/android/launcher3/anim/d;

    .line 6
    .line 7
    iput p0, p1, Lcom/android/launcher3/anim/d;->d:F

    .line 8
    .line 9
    return-void
.end method

.method private static final i(Lcom/android/launcher3/uioverrides/touchcontrollers/F;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->t:Landroidx/dynamicanimation/animation/j;

    .line 3
    .line 4
    return-void
.end method

.method private final j(F)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->p:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    const/high16 v1, 0x3f000000    # 0.5f

    .line 5
    .line 6
    mul-float/2addr v0, v1

    .line 7
    iget v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->q:I

    .line 8
    .line 9
    int-to-float v1, v1

    .line 10
    mul-float/2addr v0, v1

    .line 11
    const/high16 v1, 0x41200000    # 10.0f

    .line 12
    .line 13
    sub-float v2, v0, v1

    .line 14
    .line 15
    cmpl-float v2, p1, v2

    .line 16
    .line 17
    if-ltz v2, :cond_1

    .line 18
    .line 19
    add-float/2addr v0, v1

    .line 20
    cmpg-float p1, p1, v0

    .line 21
    .line 22
    if-gtz p1, :cond_1

    .line 23
    .line 24
    iget-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->r:Z

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    sget-object p1, Lcom/android/launcher3/util/s1;->b:Lcom/android/launcher3/util/I;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/android/launcher3/util/s1;

    .line 41
    .line 42
    sget-object v0, Lw3/e;->v:Lw3/e;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/s1;->c(Lw3/e;)V

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x1

    .line 48
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->r:Z

    .line 49
    .line 50
    :cond_0
    return-void

    .line 51
    :cond_1
    const/4 p1, 0x0

    .line 52
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->r:Z

    .line 53
    .line 54
    return-void
.end method


# virtual methods
.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    const-string v0, "ev"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x3

    .line 18
    if-ne v0, v2, :cond_1

    .line 19
    .line 20
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->e()V

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v2, 0x0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->g(Landroid/view/MotionEvent;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    return v2

    .line 37
    :cond_2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->onControllerTouchEvent(Landroid/view/MotionEvent;)Z

    .line 38
    .line 39
    .line 40
    iget p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->l:I

    .line 41
    .line 42
    if-ne p1, v1, :cond_3

    .line 43
    .line 44
    move p1, v1

    .line 45
    goto :goto_0

    .line 46
    :cond_3
    move p1, v2

    .line 47
    :goto_0
    if-eqz p1, :cond_4

    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->j:Lcom/android/launcher3/touch/H;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/touch/H;->y()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_5

    .line 56
    .line 57
    :cond_4
    if-nez p1, :cond_6

    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->j:Lcom/android/launcher3/touch/H;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/android/launcher3/touch/H;->y()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_6

    .line 66
    .line 67
    :cond_5
    move p1, v1

    .line 68
    goto :goto_1

    .line 69
    :cond_6
    move p1, v2

    .line 70
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->j:Lcom/android/launcher3/touch/H;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->f()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_7

    .line 77
    .line 78
    if-eqz p1, :cond_7

    .line 79
    .line 80
    return v1

    .line 81
    :cond_7
    return v2
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->j:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onDrag(F)Z
    .locals 12

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->u:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->n:Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    iget v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->s:F

    .line 14
    .line 15
    add-float/2addr v2, p1

    .line 16
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    iget v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->p:I

    .line 21
    .line 22
    int-to-float v4, v4

    .line 23
    const/4 v5, 0x0

    .line 24
    invoke-static {v3, v5, v4}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    iget-boolean v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->k:Z

    .line 35
    .line 36
    invoke-interface {v3, v2, v4}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->isGoingUp(FZ)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    iget v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->q:I

    .line 43
    .line 44
    int-to-float v2, v2

    .line 45
    mul-float/2addr v6, v2

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    iget v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->p:I

    .line 48
    .line 49
    int-to-float v8, v2

    .line 50
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->g:Landroid/content/Context;

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const v3, 0x7f070b13

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 60
    .line 61
    .line 62
    move-result v10

    .line 63
    sget-object v11, LJ0/h;->I:Landroid/view/animation/Interpolator;

    .line 64
    .line 65
    const/4 v7, 0x0

    .line 66
    const/4 v9, 0x0

    .line 67
    invoke-static/range {v6 .. v11}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    iget v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->q:I

    .line 72
    .line 73
    neg-int v3, v3

    .line 74
    int-to-float v3, v3

    .line 75
    mul-float v6, v2, v3

    .line 76
    .line 77
    :goto_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getSecondaryDismissTranslationProperty()Landroid/util/FloatProperty;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v2, v0, v6}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getEnableDrawingLiveTile()Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 99
    .line 100
    new-instance v2, Lcom/android/launcher3/uioverrides/touchcontrollers/D;

    .line 101
    .line 102
    invoke-direct {v2, v6}, Lcom/android/launcher3/uioverrides/touchcontrollers/D;-><init>(F)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v2}, Lcom/android/quickstep/views/RecentsView;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->redrawLiveTile()V

    .line 111
    .line 112
    .line 113
    :cond_3
    iget v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->p:I

    .line 114
    .line 115
    iget v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->q:I

    .line 116
    .line 117
    mul-int/2addr v0, v2

    .line 118
    int-to-float v0, v0

    .line 119
    div-float v0, p1, v0

    .line 120
    .line 121
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 122
    .line 123
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 124
    .line 125
    invoke-direct {p0, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->f(F)F

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-virtual {v2, v3, v0}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 130
    .line 131
    .line 132
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->j(F)V

    .line 133
    .line 134
    .line 135
    return v1
.end method

.method public onDragEnd(F)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->u:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->n:Lcom/android/quickstep/views/TaskView;

    .line 7
    .line 8
    if-nez v2, :cond_1

    .line 9
    .line 10
    :goto_0
    return-void

    .line 11
    :cond_1
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getSecondaryDismissTranslationProperty()Landroid/util/FloatProperty;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, v2}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Float;

    .line 20
    .line 21
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->p:I

    .line 33
    .line 34
    int-to-float v1, v1

    .line 35
    const/high16 v3, 0x3f000000    # 0.5f

    .line 36
    .line 37
    mul-float/2addr v1, v3

    .line 38
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    cmpl-float v0, v0, v1

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    const/4 v7, 0x1

    .line 46
    if-lez v0, :cond_2

    .line 47
    .line 48
    move v0, v7

    .line 49
    goto :goto_1

    .line 50
    :cond_2
    move v0, v1

    .line 51
    :goto_1
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 52
    .line 53
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iget-boolean v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->k:Z

    .line 58
    .line 59
    invoke-interface {v3, p1, v4}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->isGoingUp(FZ)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->j:Lcom/android/launcher3/touch/H;

    .line 64
    .line 65
    invoke-virtual {v4, p1}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_3

    .line 70
    .line 71
    if-eqz v3, :cond_3

    .line 72
    .line 73
    move v4, v7

    .line 74
    goto :goto_2

    .line 75
    :cond_3
    move v4, v1

    .line 76
    :goto_2
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->j:Lcom/android/launcher3/touch/H;

    .line 77
    .line 78
    invoke-virtual {v5, p1}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-eqz v5, :cond_4

    .line 83
    .line 84
    if-nez v3, :cond_4

    .line 85
    .line 86
    move v3, v7

    .line 87
    goto :goto_3

    .line 88
    :cond_4
    move v3, v1

    .line 89
    :goto_3
    if-nez v4, :cond_6

    .line 90
    .line 91
    if-eqz v0, :cond_5

    .line 92
    .line 93
    if-nez v3, :cond_5

    .line 94
    .line 95
    goto :goto_4

    .line 96
    :cond_5
    move v4, v1

    .line 97
    goto :goto_5

    .line 98
    :cond_6
    :goto_4
    move v4, v7

    .line 99
    :goto_5
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 100
    .line 101
    iget v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->p:I

    .line 102
    .line 103
    new-instance v6, Lcom/android/launcher3/uioverrides/touchcontrollers/F$b;

    .line 104
    .line 105
    invoke-direct {v6, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/F$b;-><init>(Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    move v3, p1

    .line 109
    invoke-virtual/range {v1 .. v6}, Lcom/android/quickstep/views/RecentsView;->createTaskDismissSettlingSpringAnimation(Lcom/android/quickstep/views/TaskView;FZILu4/a;)Landroidx/dynamicanimation/animation/j;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    if-eqz v4, :cond_7

    .line 114
    .line 115
    iget v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->p:I

    .line 116
    .line 117
    iget v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->q:I

    .line 118
    .line 119
    mul-int/2addr v0, v1

    .line 120
    int-to-float v0, v0

    .line 121
    goto :goto_6

    .line 122
    :cond_7
    const/4 v0, 0x0

    .line 123
    :goto_6
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 124
    .line 125
    .line 126
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->o:Landroidx/dynamicanimation/animation/j;

    .line 127
    .line 128
    iput-boolean v7, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->u:Z

    .line 129
    .line 130
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->i:Lcom/android/quickstep/views/RecentsView;

    .line 131
    .line 132
    const/high16 v0, 0x3f800000    # 1.0f

    .line 133
    .line 134
    invoke-virtual {p1, v0}, Lcom/android/quickstep/views/RecentsView;->animateRecentsScale(F)Landroidx/dynamicanimation/animation/j;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/E;

    .line 139
    .line 140
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/E;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/F;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    check-cast p1, Landroidx/dynamicanimation/animation/j;

    .line 148
    .line 149
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->t:Landroidx/dynamicanimation/animation/j;

    .line 150
    .line 151
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->u:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->n:Lcom/android/quickstep/views/TaskView;

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    :goto_0
    return-void

    .line 11
    :cond_1
    const-string p2, "TaskViewDismissTouchController"

    .line 12
    .line 13
    const-string v0, "Handling touch event."

    .line 14
    .line 15
    invoke-static {p2, v0}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getSecondaryDismissTranslationProperty()Landroid/util/FloatProperty;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2, p1}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    check-cast p2, Ljava/lang/Number;

    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iput p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;->s:F

    .line 33
    .line 34
    const p0, 0x3dcccccd    # 0.1f

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->setTranslationZ(F)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
