.class public Landroidx/appcompat/view/h;
.super Ljava/lang/Object;
.source "ViewPropertyAnimatorCompatSet.java"


# instance fields
.field final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "LJ/S;",
            ">;"
        }
    .end annotation
.end field

.field private b:J

.field private c:Landroid/view/animation/Interpolator;

.field d:LJ/T;

.field private e:Z

.field private final f:LJ/U;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Landroidx/appcompat/view/h;->b:J

    .line 7
    .line 8
    new-instance v0, Landroidx/appcompat/view/h$a;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Landroidx/appcompat/view/h$a;-><init>(Landroidx/appcompat/view/h;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Landroidx/appcompat/view/h;->f:LJ/U;

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Landroidx/appcompat/view/h;->a:Ljava/util/ArrayList;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/view/h;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/view/h;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, LJ/S;

    .line 23
    .line 24
    invoke-virtual {v1}, LJ/S;->c()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Landroidx/appcompat/view/h;->e:Z

    .line 30
    .line 31
    return-void
.end method

.method b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/appcompat/view/h;->e:Z

    .line 3
    .line 4
    return-void
.end method

.method public c(LJ/S;)Landroidx/appcompat/view/h;
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/view/h;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/appcompat/view/h;->a:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-object p0
.end method

.method public d(LJ/S;LJ/S;)Landroidx/appcompat/view/h;
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/h;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, LJ/S;->d()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    invoke-virtual {p2, v0, v1}, LJ/S;->i(J)LJ/S;

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Landroidx/appcompat/view/h;->a:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public e(J)Landroidx/appcompat/view/h;
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/view/h;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-wide p1, p0, Landroidx/appcompat/view/h;->b:J

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public f(Landroid/view/animation/Interpolator;)Landroidx/appcompat/view/h;
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/view/h;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Landroidx/appcompat/view/h;->c:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public g(LJ/T;)Landroidx/appcompat/view/h;
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/view/h;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Landroidx/appcompat/view/h;->d:LJ/T;

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public h()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/view/h;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/view/h;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_4

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, LJ/S;

    .line 23
    .line 24
    iget-wide v2, p0, Landroidx/appcompat/view/h;->b:J

    .line 25
    .line 26
    const-wide/16 v4, 0x0

    .line 27
    .line 28
    cmp-long v4, v2, v4

    .line 29
    .line 30
    if-ltz v4, :cond_1

    .line 31
    .line 32
    invoke-virtual {v1, v2, v3}, LJ/S;->e(J)LJ/S;

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v2, p0, Landroidx/appcompat/view/h;->c:Landroid/view/animation/Interpolator;

    .line 36
    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    invoke-virtual {v1, v2}, LJ/S;->f(Landroid/view/animation/Interpolator;)LJ/S;

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object v2, p0, Landroidx/appcompat/view/h;->d:LJ/T;

    .line 43
    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    iget-object v2, p0, Landroidx/appcompat/view/h;->f:LJ/U;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, LJ/S;->g(LJ/T;)LJ/S;

    .line 49
    .line 50
    .line 51
    :cond_3
    invoke-virtual {v1}, LJ/S;->k()V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_4
    const/4 v0, 0x1

    .line 56
    iput-boolean v0, p0, Landroidx/appcompat/view/h;->e:Z

    .line 57
    .line 58
    return-void
.end method
