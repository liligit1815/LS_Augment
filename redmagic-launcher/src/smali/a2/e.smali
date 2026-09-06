.class public final La2/e;
.super Ljava/lang/Object;
.source "TaskbarOverlayController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        La2/e$b;
    }
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/I1;

.field private final b:Landroid/content/Context;

.field private final c:La2/e$b;

.field private final d:Landroid/view/WindowManager$LayoutParams;

.field private final e:I

.field private final f:Lcom/android/systemui/shared/system/TaskStackChangeListener;

.field private g:Lcom/android/launcher3/h0;

.field private h:La2/a;

.field private i:Lcom/android/launcher3/taskbar/R1;

.field private j:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, La2/e$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, La2/e$a;-><init>(La2/e;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, La2/e;->f:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 10
    .line 11
    iput-object p1, p0, La2/e;->a:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    const/16 v0, 0x7f6

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p1, v0, v1}, Landroid/view/ContextThemeWrapper;->createWindowContext(ILandroid/os/Bundle;)Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, La2/e;->b:Landroid/content/Context;

    .line 21
    .line 22
    new-instance v0, La2/e$b;

    .line 23
    .line 24
    invoke-direct {v0, p0, v1}, La2/e$b;-><init>(La2/e;La2/g;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, La2/e;->c:La2/e$b;

    .line 28
    .line 29
    invoke-direct {p0}, La2/e;->i()Landroid/view/WindowManager$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, La2/e;->d:Landroid/view/WindowManager$LayoutParams;

    .line 34
    .line 35
    iput-object p2, p0, La2/e;->g:Lcom/android/launcher3/h0;

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const p2, 0x7f0706ce

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iput p1, p0, La2/e;->e:I

    .line 49
    .line 50
    return-void
.end method

.method public static synthetic a(La2/e;Landroid/view/WindowManager;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, La2/e;->p(Landroid/view/WindowManager;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(La2/e;La2/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, La2/e;->o(La2/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(La2/a;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const v1, 0x70d66274

    .line 3
    .line 4
    .line 5
    invoke-static {p0, v0, v1}, Lcom/android/launcher3/a;->closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;ZI)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->dispatchDeviceProfileChanged()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method static bridge synthetic d(La2/e;)Lcom/android/launcher3/taskbar/R1;
    .locals 0

    .line 1
    iget-object p0, p0, La2/e;->i:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(La2/e;)La2/a;
    .locals 0

    .line 1
    iget-object p0, p0, La2/e;->h:La2/a;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(La2/e;)Lcom/android/launcher3/taskbar/I1;
    .locals 0

    .line 1
    iget-object p0, p0, La2/e;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(La2/e;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, La2/e;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private h()Z
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object v0, p0, La2/e;->h:La2/a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const v2, 0x7ffeffff

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v2}, Lcom/android/launcher3/a;->hasOpenView(Lcom/android/launcher3/views/k;I)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    iget-object p0, p0, La2/e;->h:La2/a;

    .line 19
    .line 20
    invoke-virtual {p0}, La2/a;->l()Lcom/android/launcher3/taskbar/j2;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/j2;->n0()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    xor-int/2addr p0, v1

    .line 29
    return p0
.end method

.method private i()Landroid/view/WindowManager$LayoutParams;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x3

    .line 4
    const/16 v2, 0x7f6

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v2, v3, v1}, Landroid/view/WindowManager$LayoutParams;-><init>(III)V

    .line 8
    .line 9
    .line 10
    const-string v1, "Taskbar Overlay"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    const/16 v1, 0x50

    .line 16
    .line 17
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 18
    .line 19
    iget-object p0, p0, La2/e;->a:Lcom/android/launcher3/taskbar/I1;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getPackageName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iput-object p0, v0, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v3}, Landroid/view/WindowManager$LayoutParams;->setFitInsetsTypes(I)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x3

    .line 31
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    invoke-virtual {v0, p0}, Landroid/view/WindowManager$LayoutParams;->setSystemApplicationOverlay(Z)V

    .line 35
    .line 36
    .line 37
    const/high16 p0, 0x2000000

    .line 38
    .line 39
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    .line 40
    .line 41
    return-object v0
.end method

.method private synthetic o(La2/a;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, La2/a;->r()V

    .line 2
    .line 3
    .line 4
    const-class v0, Landroid/view/WindowManager;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/ContextThemeWrapper;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/view/WindowManager;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, La2/e;->h:La2/a;

    .line 15
    .line 16
    invoke-virtual {p0}, La2/a;->n()La2/h;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p1, p0}, Landroid/view/WindowManager;->removeViewImmediate(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private synthetic p(Landroid/view/WindowManager;)V
    .locals 1

    .line 1
    iget-object v0, p0, La2/e;->h:La2/a;

    .line 2
    .line 3
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, La2/e;->d:Landroid/view/WindowManager$LayoutParams;

    .line 8
    .line 9
    invoke-interface {p1, v0, p0}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public j()I
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    iget-object p0, p0, La2/e;->a:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, p0, v1}, Lcom/android/launcher3/statemanager/a;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public k()Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, La2/e;->g:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()I
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    iget-object p0, p0, La2/e;->a:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-interface {v0, p0, v1}, Lcom/android/launcher3/statemanager/a;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object p0, p0, La2/e;->c:La2/e$b;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public n(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    iput-object p1, p0, La2/e;->i:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-void
.end method

.method q()V
    .locals 2

    .line 1
    invoke-direct {p0}, La2/e;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, La2/e;->c:La2/e$b;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, La2/e;->r()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, La2/e;->f:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, La2/e;->h:La2/a;

    .line 11
    .line 12
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, La2/c;

    .line 17
    .line 18
    invoke-direct {v1, p0}, La2/c;-><init>(La2/e;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, La2/e;->h:La2/a;

    .line 26
    .line 27
    return-void
.end method

.method public s()La2/a;
    .locals 4

    .line 1
    iget-object v0, p0, La2/e;->h:La2/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, La2/a;

    .line 6
    .line 7
    iget-object v1, p0, La2/e;->b:Landroid/content/Context;

    .line 8
    .line 9
    iget-object v2, p0, La2/e;->a:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    iget-object v3, p0, La2/e;->i:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2, v3}, La2/a;-><init>(Landroid/content/Context;Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/R1;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, La2/e;->h:La2/a;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, La2/e;->c:La2/e$b;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, La2/e;->c:La2/e$b;

    .line 27
    .line 28
    invoke-static {v0}, La2/e$b;->O(La2/e$b;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, La2/e;->h:La2/a;

    .line 32
    .line 33
    const-class v1, Landroid/view/WindowManager;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/ContextThemeWrapper;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroid/view/WindowManager;

    .line 40
    .line 41
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, La2/d;

    .line 46
    .line 47
    invoke-direct {v1, p0}, La2/d;-><init>(La2/e;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v1, p0, La2/e;->f:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->registerTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-object p0, p0, La2/e;->h:La2/a;

    .line 63
    .line 64
    return-object p0
.end method

.method public t(I)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lcom/android/systemui/shared/system/BlurUtils;->supportsBlursOnWindows()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    const-string v2, "TaskbarOverlayController"

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string p1, "setBackgroundBlurRadius: not supported, setting to 0"

    .line 18
    .line 19
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move p1, v1

    .line 23
    :cond_1
    iget-object v0, p0, La2/e;->h:La2/a;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    const-string p0, "setBackgroundBlurRadius: no overlay context"

    .line 28
    .line 29
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-nez v0, :cond_3

    .line 38
    .line 39
    const-string p0, "setBackgroundBlurRadius: no drag layer"

    .line 40
    .line 41
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_3
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    if-nez v3, :cond_4

    .line 50
    .line 51
    const-string p0, "setBackgroundBlurRadius: dragLayerViewRoot is null"

    .line 52
    .line 53
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_4
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getRootSurfaceControl()Landroid/view/AttachedSurfaceControl;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-nez v0, :cond_5

    .line 62
    .line 63
    const-string p0, "setBackgroundBlurRadius: rootSurfaceControl is null"

    .line 64
    .line 65
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_5
    invoke-virtual {v3}, Landroid/view/ViewRootImpl;->getSurfaceControl()Landroid/view/SurfaceControl;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    if-eqz v3, :cond_a

    .line 74
    .line 75
    invoke-virtual {v3}, Landroid/view/SurfaceControl;->isValid()Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-nez v4, :cond_6

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    const-string v5, "setBackgroundBlurRadius: "

    .line 88
    .line 89
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    new-instance v4, Landroid/view/SurfaceControl$Transaction;

    .line 103
    .line 104
    invoke-direct {v4}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v4, v3, p1}, Landroid/view/SurfaceControl$Transaction;->setBackgroundBlurRadius(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    const/4 v4, 0x1

    .line 112
    if-lez p1, :cond_7

    .line 113
    .line 114
    iget v5, p0, La2/e;->e:I

    .line 115
    .line 116
    if-ge p1, v5, :cond_7

    .line 117
    .line 118
    move p1, v4

    .line 119
    goto :goto_0

    .line 120
    :cond_7
    move p1, v1

    .line 121
    :goto_0
    if-eqz p1, :cond_8

    .line 122
    .line 123
    iget-boolean v5, p0, La2/e;->j:Z

    .line 124
    .line 125
    if-nez v5, :cond_8

    .line 126
    .line 127
    const-string p1, "setBackgroundBlurRadius: setting early wakeup"

    .line 128
    .line 129
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    invoke-virtual {v3}, Landroid/view/SurfaceControl$Transaction;->setEarlyWakeupStart()Landroid/view/SurfaceControl$Transaction;

    .line 133
    .line 134
    .line 135
    iput-boolean v4, p0, La2/e;->j:Z

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_8
    if-nez p1, :cond_9

    .line 139
    .line 140
    iget-boolean p1, p0, La2/e;->j:Z

    .line 141
    .line 142
    if-eqz p1, :cond_9

    .line 143
    .line 144
    const-string p1, "setBackgroundBlurRadius: clearing early wakeup"

    .line 145
    .line 146
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    invoke-virtual {v3}, Landroid/view/SurfaceControl$Transaction;->setEarlyWakeupEnd()Landroid/view/SurfaceControl$Transaction;

    .line 150
    .line 151
    .line 152
    iput-boolean v1, p0, La2/e;->j:Z

    .line 153
    .line 154
    :cond_9
    :goto_1
    invoke-interface {v0, v3}, Landroid/view/AttachedSurfaceControl;->applyTransactionOnDraw(Landroid/view/SurfaceControl$Transaction;)Z

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_a
    :goto_2
    const-string p0, "setBackgroundBlurRadius: surfaceControl is null or invalid"

    .line 159
    .line 160
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public u(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    iput-object p1, p0, La2/e;->g:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    iget-object p0, p0, La2/e;->h:La2/a;

    .line 4
    .line 5
    invoke-static {p0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, La2/b;

    .line 10
    .line 11
    invoke-direct {p1}, La2/b;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
