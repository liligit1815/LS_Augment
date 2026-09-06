.class public final LF2/f;
.super Ljava/lang/Object;
.source "NaturalRotationUnfoldProgressProvider.kt"

# interfaces
.implements LC2/i;


# instance fields
.field private final g:Landroid/content/Context;

.field private final h:LE2/c;

.field private final i:LF2/i;

.field private j:Z

.field private final k:LE2/c$c;


# direct methods
.method public constructor <init>(Landroid/content/Context;LE2/c;LC2/i;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "rotationChangeProvider"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "unfoldTransitionProgressProvider"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, LF2/f;->g:Landroid/content/Context;

    .line 20
    .line 21
    iput-object p2, p0, LF2/f;->h:LE2/c;

    .line 22
    .line 23
    new-instance p1, LF2/i;

    .line 24
    .line 25
    invoke-direct {p1, p3}, LF2/i;-><init>(LC2/i;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, LF2/f;->i:LF2/i;

    .line 29
    .line 30
    new-instance p1, LF2/e;

    .line 31
    .line 32
    invoke-direct {p1, p0}, LF2/e;-><init>(LF2/f;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, LF2/f;->k:LE2/c$c;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic a(LF2/f;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LF2/f;->e(LF2/f;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final e(LF2/f;I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    goto :goto_1

    .line 9
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 10
    :goto_1
    iget-boolean v0, p0, LF2/f;->j:Z

    .line 11
    .line 12
    if-eq v0, p1, :cond_2

    .line 13
    .line 14
    iput-boolean p1, p0, LF2/f;->j:Z

    .line 15
    .line 16
    iget-object p0, p0, LF2/f;->i:LF2/i;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, LF2/i;->i(Z)V

    .line 19
    .line 20
    .line 21
    :cond_2
    return-void
.end method


# virtual methods
.method public bridge synthetic addCallback(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, LC2/i$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LF2/f;->b(LC2/i$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(LC2/i$a;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LF2/f;->i:LF2/i;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, LF2/i;->c(LC2/i$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final c()V
    .locals 2

    .line 1
    iget-object v0, p0, LF2/f;->h:LE2/c;

    .line 2
    .line 3
    iget-object v1, p0, LF2/f;->k:LE2/c$c;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, LE2/c;->f(LE2/c$c;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LF2/f;->g:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/content/Context;->getDisplay()Landroid/view/Display;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object p0, p0, LF2/f;->k:LE2/c$c;

    .line 21
    .line 22
    invoke-interface {p0, v0}, LE2/c$c;->onRotationChanged(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public d(LC2/i$a;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LF2/f;->i:LF2/i;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, LF2/i;->g(LC2/i$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    iget-object v0, p0, LF2/f;->h:LE2/c;

    .line 2
    .line 3
    iget-object v1, p0, LF2/f;->k:LE2/c$c;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, LE2/c;->h(LE2/c$c;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, LF2/f;->i:LF2/i;

    .line 9
    .line 10
    invoke-virtual {p0}, LF2/i;->destroy()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic removeCallback(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, LC2/i$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LF2/f;->d(LC2/i$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
