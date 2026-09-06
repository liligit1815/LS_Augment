.class public final Lcom/android/launcher3/util/n1;
.super Ljava/lang/Object;
.source "LockedUserState.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/n1$a;
    }
.end annotation


# static fields
.field public static final f:Lcom/android/launcher3/util/n1$a;

.field public static final g:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/util/n1;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Z

.field private c:Z

.field private final d:Lcom/android/launcher3/util/Y1;

.field private final e:Lcom/android/launcher3/util/x2;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/n1$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/n1$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/util/n1;->f:Lcom/android/launcher3/util/n1$a;

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/util/i1;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/android/launcher3/util/i1;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/launcher3/util/n1;->g:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/K;)V
    .locals 3

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "lifeCycle"

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
    iput-object p1, p0, Lcom/android/launcher3/util/n1;->a:Landroid/content/Context;

    .line 15
    .line 16
    new-instance v0, Lcom/android/launcher3/util/Y1;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/util/n1;->d:Lcom/android/launcher3/util/Y1;

    .line 22
    .line 23
    new-instance v0, Lcom/android/launcher3/util/x2;

    .line 24
    .line 25
    sget-object v1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 26
    .line 27
    new-instance v2, Lcom/android/launcher3/util/j1;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Lcom/android/launcher3/util/j1;-><init>(Lcom/android/launcher3/util/n1;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {v0, p1, v1, v2}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/launcher3/util/n1;->e:Lcom/android/launcher3/util/x2;

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/android/launcher3/util/n1;->g()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/n1;->n(Z)V

    .line 42
    .line 43
    .line 44
    iget-boolean p1, p0, Lcom/android/launcher3/util/n1;->c:Z

    .line 45
    .line 46
    iput-boolean p1, p0, Lcom/android/launcher3/util/n1;->b:Z

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    new-instance p1, Lcom/android/launcher3/util/k1;

    .line 51
    .line 52
    invoke-direct {p1, p0}, Lcom/android/launcher3/util/k1;-><init>(Lcom/android/launcher3/util/n1;)V

    .line 53
    .line 54
    .line 55
    const-string v1, "android.intent.action.USER_UNLOCKED"

    .line 56
    .line 57
    filled-new-array {v1}, [Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/util/x2;->p(Ljava/lang/Runnable;[Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    new-instance p1, Lcom/android/launcher3/util/l1;

    .line 65
    .line 66
    invoke-direct {p1, p0}, Lcom/android/launcher3/util/l1;-><init>(Lcom/android/launcher3/util/n1;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/util/n1;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/n1;->f(Lcom/android/launcher3/util/n1;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/util/n1;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/util/n1;->o(Lcom/android/launcher3/util/n1;Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/util/n1;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/n1;->e(Lcom/android/launcher3/util/n1;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d(Lcom/android/launcher3/util/n1;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/n1;->n(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private static final e(Lcom/android/launcher3/util/n1;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/n1;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 8
    .line 9
    new-instance v1, Lcom/android/launcher3/util/m1;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lcom/android/launcher3/util/m1;-><init>(Lcom/android/launcher3/util/n1;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private static final f(Lcom/android/launcher3/util/n1;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/n1;->e:Lcom/android/launcher3/util/x2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/x2;->v()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final g()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/n1;->a:Landroid/content/Context;

    .line 2
    .line 3
    const-class v0, Landroid/os/UserManager;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/os/UserManager;

    .line 13
    .line 14
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/UserManager;->isUserUnlocked(Landroid/os/UserHandle;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public static final h(Landroid/content/Context;)Lcom/android/launcher3/util/n1;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/n1;->f:Lcom/android/launcher3/util/n1$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/n1$a;->a(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private final k()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/util/n1;->d:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/Y1;->c()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :catch_0
    move-exception v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/util/n1;->e:Lcom/android/launcher3/util/x2;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/util/x2;->v()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private static final o(Lcom/android/launcher3/util/n1;Landroid/content/Intent;)V
    .locals 1

    .line 1
    const-string v0, "android.intent.action.USER_UNLOCKED"

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {v0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/n1;->n(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public final i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/n1;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/n1;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public final l(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const-string v0, "action"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/util/n1;->d:Lcom/android/launcher3/util/Y1;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Y1;->e(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final m(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const-string v0, "action"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/util/n1;->d:Lcom/android/launcher3/util/Y1;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final n(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/util/n1;->c:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/util/n1;->k()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
