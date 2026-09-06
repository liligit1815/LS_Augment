.class public Lcom/android/launcher3/taskbar/E4;
.super Ljava/lang/Object;
.source "TaskbarViewCallbacks.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/E4$c;
    }
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/I1;

.field private final b:Lcom/android/launcher3/taskbar/R1;

.field private final c:Lcom/android/launcher3/taskbar/TaskbarView;

.field private final d:Landroid/view/GestureDetector;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/TaskbarView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/E4;->a:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/taskbar/E4;->c:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 9
    .line 10
    new-instance p2, Landroid/view/GestureDetector;

    .line 11
    .line 12
    new-instance p3, Lcom/android/launcher3/taskbar/E4$c;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-direct {p3, p0, v0}, Lcom/android/launcher3/taskbar/E4$c;-><init>(Lcom/android/launcher3/taskbar/E4;Lcom/android/launcher3/taskbar/F4;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p2, p1, p3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 19
    .line 20
    .line 21
    iput-object p2, p0, Lcom/android/launcher3/taskbar/E4;->d:Landroid/view/GestureDetector;

    .line 22
    .line 23
    return-void
.end method

.method private synthetic A(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->d:Landroid/view/GestureDetector;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private D()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/E4;->c:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarView;->getTaskbarOverflowView()Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/taskbar/E4;->c:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarView;->getTaskbarOverflowView()Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->setIsActive(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 22
    .line 23
    const/16 v0, 0x100

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/K1;->g(IZ)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private F()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/E4;->c:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarView;->getTaskbarOverflowView()Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/E4;->c:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarView;->getTaskbarOverflowView()Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/taskbar/E4;->c:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/TaskbarView;->getTaskbarOverflowView()Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->getIsActive()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    xor-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->setIsActive(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/taskbar/E4;->c:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/TaskbarView;->getTaskbarOverflowView()Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->getIsActive()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/16 v2, 0x100

    .line 45
    .line 46
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/taskbar/K1;->g(IZ)V

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 50
    .line 51
    iget-object v1, v0, Lcom/android/launcher3/taskbar/R1;->x:Lcom/android/launcher3/taskbar/s;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/W4;->Q()Ljava/util/Set;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v2, Lcom/android/launcher3/taskbar/D4;

    .line 60
    .line 61
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/D4;-><init>(Lcom/android/launcher3/taskbar/E4;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v0, v2}, Lcom/android/launcher3/taskbar/s;->M(Ljava/util/Set;Ljava/lang/Runnable;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/bubbles/m0;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->E0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/E4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/E4;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/E4;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/E4;->z(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/bubbles/m0;)Ljava/lang/Float;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->p0()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic e(Lcom/android/launcher3/taskbar/E4;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/E4;->A(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic f(Lcom/android/launcher3/taskbar/E4;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/E4;->y(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic g(Lcom/android/launcher3/taskbar/bubbles/m0;)Lcom/android/launcher3/taskbar/bubbles/g0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/taskbar/E4;)Lcom/android/launcher3/taskbar/I1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/taskbar/E4;)Lcom/android/launcher3/taskbar/R1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/taskbar/E4;)Lcom/android/launcher3/taskbar/TaskbarView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->c:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic k(Lcom/android/launcher3/taskbar/E4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/E4;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private n()F
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->c:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getTaskbarDividerViewContainer()LY1/g;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    const/high16 v1, 0x40000000    # 2.0f

    .line 21
    .line 22
    div-float/2addr p0, v1

    .line 23
    add-float/2addr v0, p0

    .line 24
    return v0
.end method

.method private synthetic y(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->y:Lcom/android/launcher3/taskbar/q3;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/E4;->n()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p1, p0}, Lcom/android/launcher3/taskbar/q3;->n(Landroid/view/View;F)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method private synthetic z(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    const/16 v0, 0x2002

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Landroid/view/MotionEvent;->isFromSource(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getButtonState()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    const/4 v0, 0x2

    .line 20
    if-ne p2, v0, :cond_0

    .line 21
    .line 22
    iget-object p2, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/android/launcher3/taskbar/R1;->y:Lcom/android/launcher3/taskbar/q3;

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/E4;->n()F

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p2, p1, p0}, Lcom/android/launcher3/taskbar/q3;->n(Landroid/view/View;F)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method


# virtual methods
.method public B()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->E()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public C()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->g:Lcom/android/launcher3/taskbar/I3;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->c:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/I3;->i(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method E()V
    .locals 1

    .line 1
    invoke-static {}, Lf1/a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Landroid/window/DesktopModeFlags;->ENABLE_TASKBAR_RECENTS_LAYOUT_TRANSITION:Landroid/window/DesktopModeFlags;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->C0()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public G(Landroid/view/View;)V
    .locals 2

    .line 1
    const/16 v0, 0x19

    .line 2
    .line 3
    const-string v1, "TASKBAR_BUTTON"

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/taskbar/E4;->a:Lcom/android/launcher3/taskbar/I1;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->H2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 19
    .line 20
    invoke-interface {p1, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/taskbar/E4;->a:Lcom/android/launcher3/taskbar/I1;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->r2()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/launcher3/taskbar/E4;->a:Lcom/android/launcher3/taskbar/I1;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->q2()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->p:Lcom/android/launcher3/taskbar/allapps/c;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/allapps/c;->p()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/o4;->R(Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public H()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->I2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 12
    .line 13
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public l()LN2/h;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/taskbar/C4;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/C4;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->A0()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    return-object v0
.end method

.method public m()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/taskbar/x4;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/x4;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/util/Optional;->filter(Ljava/util/function/Predicate;)Ljava/util/Optional;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Lcom/android/launcher3/taskbar/y4;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/y4;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/Float;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public o()Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p(Landroid/view/View;)Landroid/view/View$OnHoverListener;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/J2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/E4;->a:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->c:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p1}, Lcom/android/launcher3/taskbar/J2;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarView;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public q()Landroid/view/View$OnLongClickListener;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->b:Lcom/android/launcher3/taskbar/j2;

    .line 4
    .line 5
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/taskbar/B4;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/B4;-><init>(Lcom/android/launcher3/taskbar/j2;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public r()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/E4$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/E4$a;-><init>(Lcom/android/launcher3/taskbar/E4;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public s()Landroid/view/View$OnLongClickListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/E4$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/E4$b;-><init>(Lcom/android/launcher3/taskbar/E4;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public t()Landroid/view/View$OnLongClickListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/A4;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/A4;-><init>(Lcom/android/launcher3/taskbar/E4;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public u()Landroid/view/View$OnTouchListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/z4;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/z4;-><init>(Lcom/android/launcher3/taskbar/E4;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public v()Landroid/view/View$OnTouchListener;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/w4;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/w4;-><init>(Lcom/android/launcher3/taskbar/E4;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public w(Landroid/content/Context;)Z
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public x()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/E4;->b:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/Optional;->isPresent()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
