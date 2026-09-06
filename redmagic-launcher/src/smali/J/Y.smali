.class public LJ/Y;
.super Ljava/lang/Object;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LJ/Y$i;,
        LJ/Y$j;,
        LJ/Y$h;,
        LJ/Y$g;,
        LJ/Y$f;,
        LJ/Y$e;,
        LJ/Y$k;,
        LJ/Y$a;,
        LJ/Y$l;,
        LJ/Y$c;,
        LJ/Y$b;,
        LJ/Y$d;
    }
.end annotation


# static fields
.field public static final b:LJ/Y;


# instance fields
.field private final a:LJ/Y$j;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, LJ/Y$i;->l:LJ/Y;

    .line 2
    .line 3
    sput-object v0, LJ/Y;->b:LJ/Y;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(LJ/Y;)V
    .locals 2

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_5

    .line 4
    iget-object p1, p1, LJ/Y;->a:LJ/Y$j;

    .line 5
    instance-of v0, p1, LJ/Y$i;

    if-eqz v0, :cond_0

    .line 6
    new-instance v0, LJ/Y$i;

    move-object v1, p1

    check-cast v1, LJ/Y$i;

    invoke-direct {v0, p0, v1}, LJ/Y$i;-><init>(LJ/Y;LJ/Y$i;)V

    iput-object v0, p0, LJ/Y;->a:LJ/Y$j;

    goto :goto_0

    .line 7
    :cond_0
    instance-of v0, p1, LJ/Y$h;

    if-eqz v0, :cond_1

    .line 8
    new-instance v0, LJ/Y$h;

    move-object v1, p1

    check-cast v1, LJ/Y$h;

    invoke-direct {v0, p0, v1}, LJ/Y$h;-><init>(LJ/Y;LJ/Y$h;)V

    iput-object v0, p0, LJ/Y;->a:LJ/Y$j;

    goto :goto_0

    .line 9
    :cond_1
    instance-of v0, p1, LJ/Y$g;

    if-eqz v0, :cond_2

    .line 10
    new-instance v0, LJ/Y$g;

    move-object v1, p1

    check-cast v1, LJ/Y$g;

    invoke-direct {v0, p0, v1}, LJ/Y$g;-><init>(LJ/Y;LJ/Y$g;)V

    iput-object v0, p0, LJ/Y;->a:LJ/Y$j;

    goto :goto_0

    .line 11
    :cond_2
    instance-of v0, p1, LJ/Y$f;

    if-eqz v0, :cond_3

    .line 12
    new-instance v0, LJ/Y$f;

    move-object v1, p1

    check-cast v1, LJ/Y$f;

    invoke-direct {v0, p0, v1}, LJ/Y$f;-><init>(LJ/Y;LJ/Y$f;)V

    iput-object v0, p0, LJ/Y;->a:LJ/Y$j;

    goto :goto_0

    .line 13
    :cond_3
    instance-of v0, p1, LJ/Y$e;

    if-eqz v0, :cond_4

    .line 14
    new-instance v0, LJ/Y$e;

    move-object v1, p1

    check-cast v1, LJ/Y$e;

    invoke-direct {v0, p0, v1}, LJ/Y$e;-><init>(LJ/Y;LJ/Y$e;)V

    iput-object v0, p0, LJ/Y;->a:LJ/Y$j;

    goto :goto_0

    .line 15
    :cond_4
    new-instance v0, LJ/Y$j;

    invoke-direct {v0, p0}, LJ/Y$j;-><init>(LJ/Y;)V

    iput-object v0, p0, LJ/Y;->a:LJ/Y$j;

    .line 16
    :goto_0
    invoke-virtual {p1, p0}, LJ/Y$j;->e(LJ/Y;)V

    return-void

    .line 17
    :cond_5
    new-instance p1, LJ/Y$j;

    invoke-direct {p1, p0}, LJ/Y$j;-><init>(LJ/Y;)V

    iput-object p1, p0, LJ/Y;->a:LJ/Y$j;

    return-void
.end method

.method private constructor <init>(Landroid/view/WindowInsets;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, LJ/Y$i;

    invoke-direct {v0, p0, p1}, LJ/Y$i;-><init>(LJ/Y;Landroid/view/WindowInsets;)V

    iput-object v0, p0, LJ/Y;->a:LJ/Y$j;

    return-void
.end method

.method static n(LB/b;IIII)LB/b;
    .locals 5

    .line 1
    iget v0, p0, LB/b;->a:I

    .line 2
    .line 3
    sub-int/2addr v0, p1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v2, p0, LB/b;->b:I

    .line 10
    .line 11
    sub-int/2addr v2, p2

    .line 12
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iget v3, p0, LB/b;->c:I

    .line 17
    .line 18
    sub-int/2addr v3, p3

    .line 19
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    iget v4, p0, LB/b;->d:I

    .line 24
    .line 25
    sub-int/2addr v4, p4

    .line 26
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-ne v0, p1, :cond_0

    .line 31
    .line 32
    if-ne v2, p2, :cond_0

    .line 33
    .line 34
    if-ne v3, p3, :cond_0

    .line 35
    .line 36
    if-ne v1, p4, :cond_0

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_0
    invoke-static {v0, v2, v3, v1}, LB/b;->b(IIII)LB/b;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static v(Landroid/view/WindowInsets;)LJ/Y;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, LJ/Y;->w(Landroid/view/WindowInsets;Landroid/view/View;)LJ/Y;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static w(Landroid/view/WindowInsets;Landroid/view/View;)LJ/Y;
    .locals 1

    .line 1
    new-instance v0, LJ/Y;

    .line 2
    .line 3
    invoke-static {p0}, LI/h;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/WindowInsets;

    .line 8
    .line 9
    invoke-direct {v0, p0}, LJ/Y;-><init>(Landroid/view/WindowInsets;)V

    .line 10
    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, LJ/I;->C(Landroid/view/View;)LJ/Y;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, LJ/Y;->t(LJ/Y;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, LJ/Y;->d(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-object v0
.end method


# virtual methods
.method public a()LJ/Y;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Y$j;->a()LJ/Y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b()LJ/Y;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Y$j;->b()LJ/Y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()LJ/Y;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Y$j;->c()LJ/Y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method d(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/Y$j;->d(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()LJ/g;
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Y$j;->f()LJ/g;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, LJ/Y;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    check-cast p1, LJ/Y;

    .line 12
    .line 13
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 14
    .line 15
    iget-object p1, p1, LJ/Y;->a:LJ/Y$j;

    .line 16
    .line 17
    invoke-static {p0, p1}, LI/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public f(I)LB/b;
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/Y$j;->g(I)LB/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public g()LB/b;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Y$j;->i()LB/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h()LB/b;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Y$j;->j()LB/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, LJ/Y$j;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public i()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Y$j;->k()LB/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, LB/b;->d:I

    .line 8
    .line 9
    return p0
.end method

.method public j()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Y$j;->k()LB/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, LB/b;->a:I

    .line 8
    .line 9
    return p0
.end method

.method public k()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Y$j;->k()LB/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, LB/b;->c:I

    .line 8
    .line 9
    return p0
.end method

.method public l()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Y$j;->k()LB/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p0, p0, LB/b;->b:I

    .line 8
    .line 9
    return p0
.end method

.method public m(IIII)LJ/Y;
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, LJ/Y$j;->m(IIII)LJ/Y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Y$j;->n()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/Y$j;->p(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public q(IIII)LJ/Y;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, LJ/Y$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LJ/Y$a;-><init>(LJ/Y;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p2, p3, p4}, LB/b;->b(IIII)LB/b;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, LJ/Y$a;->c(LB/b;)LJ/Y$a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, LJ/Y$a;->a()LJ/Y;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method r([LB/b;)V
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/Y$j;->q([LB/b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method s(LB/b;)V
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/Y$j;->r(LB/b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method t(LJ/Y;)V
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/Y$j;->s(LJ/Y;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u()Landroid/view/WindowInsets;
    .locals 1

    .line 1
    iget-object p0, p0, LJ/Y;->a:LJ/Y$j;

    .line 2
    .line 3
    instance-of v0, p0, LJ/Y$e;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, LJ/Y$e;

    .line 8
    .line 9
    iget-object p0, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method
