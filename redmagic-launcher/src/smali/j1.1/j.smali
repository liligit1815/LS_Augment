.class public final Lj1/j;
.super Ljava/lang/Object;
.source "DesktopAppLaunchTransitionManager.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lj1/j$a;
    }
.end annotation


# static fields
.field public static final d:Lj1/j$a;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Lcom/android/quickstep/SystemUiProxy;

.field private c:Landroid/window/RemoteTransition;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lj1/j$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lj1/j$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lj1/j;->d:Lj1/j$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/SystemUiProxy;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "systemUiProxy"

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
    iput-object p1, p0, Lj1/j;->a:Landroid/content/Context;

    .line 15
    .line 16
    iput-object p2, p0, Lj1/j;->b:Lcom/android/quickstep/SystemUiProxy;

    .line 17
    .line 18
    return-void
.end method

.method private final b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lj1/j;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, LO2/d;->c(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_APP_LAUNCH_TRANSITIONS_BUGFIX:Landroid/window/DesktopModeFlags;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method


# virtual methods
.method public final a()V
    .locals 9

    .line 1
    invoke-direct {p0}, Lj1/j;->b()Z

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
    new-instance v0, Landroid/window/RemoteTransition;

    .line 9
    .line 10
    new-instance v1, Lj1/i;

    .line 11
    .line 12
    iget-object v2, p0, Lj1/j;->a:Landroid/content/Context;

    .line 13
    .line 14
    sget-object v3, Lj1/i$a;->j:Lj1/i$a;

    .line 15
    .line 16
    sget-object v5, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 17
    .line 18
    const-string v4, "MAIN_EXECUTOR"

    .line 19
    .line 20
    invoke-static {v5, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/16 v7, 0x10

    .line 24
    .line 25
    const/4 v8, 0x0

    .line 26
    const/16 v4, 0x7b

    .line 27
    .line 28
    const/4 v6, 0x0

    .line 29
    invoke-direct/range {v1 .. v8}, Lj1/i;-><init>(Landroid/content/Context;Lj1/i$a;ILjava/util/concurrent/Executor;LI/j;ILkotlin/jvm/internal/j;)V

    .line 30
    .line 31
    .line 32
    const-string v2, "DesktopWindowLimitUnminimize"

    .line 33
    .line 34
    invoke-direct {v0, v1, v2}, Landroid/window/RemoteTransition;-><init>(Landroid/window/IRemoteTransition;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lj1/j;->c:Landroid/window/RemoteTransition;

    .line 38
    .line 39
    iget-object p0, p0, Lj1/j;->b:Lcom/android/quickstep/SystemUiProxy;

    .line 40
    .line 41
    sget-object v1, Lj1/j;->d:Lj1/j$a;

    .line 42
    .line 43
    invoke-static {v1}, Lj1/j$a;->a(Lj1/j$a;)Landroid/window/TransitionFilter;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/SystemUiProxy;->registerRemoteTransition(Landroid/window/RemoteTransition;Landroid/window/TransitionFilter;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final c()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lj1/j;->b()Z

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
    iget-object v0, p0, Lj1/j;->b:Lcom/android/quickstep/SystemUiProxy;

    .line 9
    .line 10
    iget-object v1, p0, Lj1/j;->c:Landroid/window/RemoteTransition;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/quickstep/SystemUiProxy;->unregisterRemoteTransition(Landroid/window/RemoteTransition;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lj1/j;->c:Landroid/window/RemoteTransition;

    .line 17
    .line 18
    return-void
.end method
