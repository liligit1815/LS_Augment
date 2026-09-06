.class Lcom/android/launcher3/taskbar/allapps/l$a;
.super Ljava/lang/Object;
.source "TaskbarAllAppsViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/allapps/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "a"
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

.field final synthetic b:Lcom/android/launcher3/taskbar/allapps/l;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/taskbar/allapps/l;Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->b:Lcom/android/launcher3/taskbar/allapps/l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->a:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/taskbar/allapps/l;Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;Lcom/android/launcher3/taskbar/allapps/m;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/allapps/l$a;-><init>(Lcom/android/launcher3/taskbar/allapps/l;Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;)V

    return-void
.end method


# virtual methods
.method a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->a:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method b()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->b:Lcom/android/launcher3/taskbar/allapps/l;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/allapps/l;->e(Lcom/android/launcher3/taskbar/allapps/l;)La2/e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, La2/e;->j()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method c()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->b:Lcom/android/launcher3/taskbar/allapps/l;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/allapps/l;->e(Lcom/android/launcher3/taskbar/allapps/l;)La2/e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, La2/e;->l()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->a:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method e(Lcom/android/launcher3/anim/V;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->a:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->b:Lcom/android/launcher3/taskbar/allapps/l;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/android/launcher3/taskbar/allapps/l;->f(Lcom/android/launcher3/taskbar/allapps/l;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p1, p2, p0}, Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;->e(Lcom/android/launcher3/anim/V;ZZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public f(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->a:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;->f(Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->b:Lcom/android/launcher3/taskbar/allapps/l;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/taskbar/allapps/l;->f(Lcom/android/launcher3/taskbar/allapps/l;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->b:Lcom/android/launcher3/taskbar/allapps/l;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/taskbar/allapps/l;->d(Lcom/android/launcher3/taskbar/allapps/l;)Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getSearchUiManager()Lcom/android/launcher3/allapps/p0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Lcom/android/launcher3/allapps/p0;->getEditText()Lcom/android/launcher3/ExtendedEditText;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->b:Lcom/android/launcher3/taskbar/allapps/l;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/android/launcher3/taskbar/allapps/l;->d(Lcom/android/launcher3/taskbar/allapps/l;)Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getSearchUiManager()Lcom/android/launcher3/allapps/p0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p0}, Lcom/android/launcher3/allapps/p0;->getEditText()Lcom/android/launcher3/ExtendedEditText;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Landroid/widget/EditText;->requestFocus()Z

    .line 47
    .line 48
    .line 49
    :cond_0
    if-eqz p1, :cond_1

    .line 50
    .line 51
    const/16 p0, 0x19

    .line 52
    .line 53
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/l$a;->a:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;->g(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
