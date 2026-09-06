.class public Lcom/android/launcher3/taskbar/bubbles/o0;
.super Ljava/lang/Object;
.source "BubbleDismissController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/bubbles/o0$c;
    }
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/I1;

.field private final b:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

.field private c:Lcom/android/launcher3/taskbar/bubbles/g0;

.field private d:LN2/q;

.field private e:LQ2/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LQ2/b<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private f:LQ2/b$c;

.field private g:Lcom/android/launcher3/taskbar/bubbles/s0;

.field private h:Lcom/android/launcher3/taskbar/bubbles/o0$c;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarDragLayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->a:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->b:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 7
    .line 8
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/taskbar/bubbles/o0;)Lcom/android/launcher3/taskbar/bubbles/s0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->g:Lcom/android/launcher3/taskbar/bubbles/s0;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/taskbar/bubbles/o0;)Lcom/android/launcher3/taskbar/bubbles/o0$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->h:Lcom/android/launcher3/taskbar/bubbles/o0$c;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/taskbar/bubbles/o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/o0;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->e:LQ2/b;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->c:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, LQ2/b;->k()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    instance-of v0, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->e:LQ2/b;

    .line 19
    .line 20
    invoke-virtual {v0}, LQ2/b;->k()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->c:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->V0(Lcom/android/launcher3/taskbar/bubbles/u;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->e:LQ2/b;

    .line 43
    .line 44
    invoke-virtual {v0}, LQ2/b;->k()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    instance-of v0, v0, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->c:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->e1()V

    .line 55
    .line 56
    .line 57
    :cond_2
    :goto_0
    return-void
.end method

.method private i()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->d:LN2/q;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, LN2/q;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->a:Lcom/android/launcher3/taskbar/I1;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/view/ContextThemeWrapper;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, LN2/q;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->d:LN2/q;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/android/launcher3/taskbar/bubbles/p0;->a(LN2/q;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->b:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->d:LN2/q;

    .line 25
    .line 26
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 27
    .line 28
    const/4 v3, -0x1

    .line 29
    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 30
    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-virtual {v0, v1, v3, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->d:LN2/q;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const v2, 0x7f07015f

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    int-to-float v1, v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setElevation(F)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->d:LN2/q;

    .line 54
    .line 55
    invoke-virtual {v0}, LN2/q;->getCircle()LN2/o;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/o0;->k(Landroid/view/View;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private k(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7f07015a

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    new-instance v1, LQ2/b$c;

    .line 15
    .line 16
    invoke-direct {v1, p1, v0}, LQ2/b$c;-><init>(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->f:LQ2/b$c;

    .line 20
    .line 21
    return-void
.end method

.method private l(Landroid/view/View;)V
    .locals 6

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/o0$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->a:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/ContextThemeWrapper;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    sget-object v4, Lcom/android/launcher3/taskbar/bubbles/u0;->k:Landroidx/dynamicanimation/animation/g;

    .line 10
    .line 11
    sget-object v5, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 12
    .line 13
    move-object v1, p0

    .line 14
    move-object v3, p1

    .line 15
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/taskbar/bubbles/o0$a;-><init>(Lcom/android/launcher3/taskbar/bubbles/o0;Landroid/content/Context;Landroid/view/View;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/g;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, v1, Lcom/android/launcher3/taskbar/bubbles/o0;->e:LQ2/b;

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    invoke-virtual {v0, p0}, LQ2/b;->q(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, v1, Lcom/android/launcher3/taskbar/bubbles/o0;->e:LQ2/b;

    .line 25
    .line 26
    const p1, 0x45bb8000    # 6000.0f

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, LQ2/b;->p(F)V

    .line 30
    .line 31
    .line 32
    iget-object p0, v1, Lcom/android/launcher3/taskbar/bubbles/o0;->f:LQ2/b$c;

    .line 33
    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    iget-object p1, v1, Lcom/android/launcher3/taskbar/bubbles/o0;->e:LQ2/b;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, LQ2/b;->d(LQ2/b$c;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string p0, "BubbleDismissController"

    .line 43
    .line 44
    const-string p1, "Requires MagneticTarget to add target to MagnetizedObject!"

    .line 45
    .line 46
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    :goto_0
    iget-object p0, v1, Lcom/android/launcher3/taskbar/bubbles/o0;->e:LQ2/b;

    .line 50
    .line 51
    new-instance p1, Lcom/android/launcher3/taskbar/bubbles/o0$b;

    .line 52
    .line 53
    invoke-direct {p1, v1}, Lcom/android/launcher3/taskbar/bubbles/o0$b;-><init>(Lcom/android/launcher3/taskbar/bubbles/o0;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p1}, LQ2/b;->r(LQ2/b$b;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public e(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->e:LQ2/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, LQ2/b;->n(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->d:LN2/q;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, LN2/q;->d()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->c:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 4
    .line 5
    return-void
.end method

.method public h(Lcom/android/launcher3/taskbar/bubbles/o0$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->h:Lcom/android/launcher3/taskbar/bubbles/o0$c;

    .line 2
    .line 3
    return-void
.end method

.method public j(Landroid/view/View;Lcom/android/launcher3/taskbar/bubbles/s0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/o0;->i()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/o0;->l(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->d:LN2/q;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2, p1}, Lcom/android/launcher3/taskbar/bubbles/s0;->k(LN2/q;)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->g:Lcom/android/launcher3/taskbar/bubbles/s0;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public m()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/o0;->d:LN2/q;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, LN2/q;->f()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
