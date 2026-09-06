.class public final Lp0/i;
.super Ljava/lang/Object;
.source "WindowInfoTrackerImpl.kt"

# interfaces
.implements Lp0/f;


# instance fields
.field private final b:Lp0/l;

.field private final c:Lq0/a;


# direct methods
.method public constructor <init>(Lp0/l;Lq0/a;)V
    .locals 1

    .line 1
    const-string v0, "windowMetricsCalculator"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "windowBackend"

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
    iput-object p1, p0, Lp0/i;->b:Lp0/l;

    .line 15
    .line 16
    iput-object p2, p0, Lp0/i;->c:Lq0/a;

    .line 17
    .line 18
    return-void
.end method

.method public static final synthetic c(Lp0/i;)Lq0/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lp0/i;->c:Lq0/a;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b(Landroid/app/Activity;)LI4/d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            ")",
            "LI4/d<",
            "Lp0/j;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "activity"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lp0/i$a;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, p0, p1, v1}, Lp0/i$a;-><init>(Lp0/i;Landroid/app/Activity;Ll4/d;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, LI4/f;->c(Lu4/p;)LI4/d;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, LF4/Z;->c()LF4/E0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p0, p1}, LI4/f;->q(LI4/d;Ll4/g;)LI4/d;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method
