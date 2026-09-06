.class public final LL0/d;
.super LL0/n;
.source "SettingsAwareViewCapture.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LL0/d$b;
    }
.end annotation


# static fields
.field public static final k:LL0/d$b;


# instance fields
.field private final i:Landroid/content/Context;

.field private final j:Landroid/window/IDumpCallback$Stub;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LL0/d$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LL0/d$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LL0/d;->k:LL0/d$b;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;)V
    .locals 2

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "executor"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/16 v0, 0x7d0

    .line 12
    .line 13
    const/16 v1, 0x12c

    .line 14
    .line 15
    invoke-direct {p0, v0, v1, p2}, LL0/n;-><init>(IILjava/util/concurrent/Executor;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, LL0/d;->i:Landroid/content/Context;

    .line 19
    .line 20
    new-instance p1, LL0/d$d;

    .line 21
    .line 22
    invoke-direct {p1, p0}, LL0/d$d;-><init>(LL0/d;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, LL0/d;->j:Landroid/window/IDumpCallback$Stub;

    .line 26
    .line 27
    invoke-direct {p0}, LL0/d;->w()V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, LL0/n;->d:Ljava/util/concurrent/Executor;

    .line 31
    .line 32
    new-instance p2, LL0/d$a;

    .line 33
    .line 34
    invoke-direct {p2, p0}, LL0/d$a;-><init>(LL0/d;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static final synthetic t(LL0/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LL0/d;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic u(LL0/d;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, LL0/d;->i:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic v(LL0/d;)Landroid/window/IDumpCallback$Stub;
    .locals 0

    .line 1
    iget-object p0, p0, LL0/d;->j:Landroid/window/IDumpCallback$Stub;

    .line 2
    .line 3
    return-object p0
.end method

.method private final w()V
    .locals 2

    .line 1
    iget-object v0, p0, LL0/n;->d:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    new-instance v1, LL0/d$c;

    .line 4
    .line 5
    invoke-direct {v1, p0}, LL0/d$c;-><init>(LL0/d;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
