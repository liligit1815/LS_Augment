.class public final LL0/b;
.super LL0/n;
.source "NoOpViewCapture.kt"


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const-string v0, "NoOpViewCapture"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, LL0/n;->h(Ljava/lang/String;I)LL0/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {p0, v1, v1, v0}, LL0/n;-><init>(IILjava/util/concurrent/Executor;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public q(Landroid/view/View;Ljava/lang/String;)Landroid/media/permission/SafeCloseable;
    .locals 0

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "name"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, LL0/b$a;->g:LL0/b$a;

    .line 12
    .line 13
    return-object p0
.end method

.method public r(Landroid/view/Window;)Landroid/media/permission/SafeCloseable;
    .locals 0

    .line 1
    const-string p0, "window"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, LL0/b$b;->g:LL0/b$b;

    .line 7
    .line 8
    return-object p0
.end method
