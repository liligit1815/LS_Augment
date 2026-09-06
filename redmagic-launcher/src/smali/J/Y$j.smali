.class LJ/Y$j;
.super Ljava/lang/Object;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LJ/Y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "j"
.end annotation


# static fields
.field static final b:LJ/Y;


# instance fields
.field final a:LJ/Y;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LJ/Y$a;

    .line 2
    .line 3
    invoke-direct {v0}, LJ/Y$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, LJ/Y$a;->a()LJ/Y;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, LJ/Y;->a()LJ/Y;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, LJ/Y;->b()LJ/Y;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, LJ/Y;->c()LJ/Y;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, LJ/Y$j;->b:LJ/Y;

    .line 23
    .line 24
    return-void
.end method

.method constructor <init>(LJ/Y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LJ/Y$j;->a:LJ/Y;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method a()LJ/Y;
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y$j;->a:LJ/Y;

    .line 2
    .line 3
    return-object p0
.end method

.method b()LJ/Y;
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y$j;->a:LJ/Y;

    .line 2
    .line 3
    return-object p0
.end method

.method c()LJ/Y;
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y$j;->a:LJ/Y;

    .line 2
    .line 3
    return-object p0
.end method

.method d(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method e(LJ/Y;)V
    .locals 0

    .line 1
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, LJ/Y$j;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, LJ/Y$j;

    .line 12
    .line 13
    invoke-virtual {p0}, LJ/Y$j;->o()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p1}, LJ/Y$j;->o()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-ne v1, v3, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0}, LJ/Y$j;->n()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p1}, LJ/Y$j;->n()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-ne v1, v3, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, LJ/Y$j;->k()LB/b;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p1}, LJ/Y$j;->k()LB/b;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-static {v1, v3}, LI/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, LJ/Y$j;->i()LB/b;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p1}, LJ/Y$j;->i()LB/b;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-static {v1, v3}, LI/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, LJ/Y$j;->f()LJ/g;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1}, LJ/Y$j;->f()LJ/g;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {p0, p1}, LI/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_2

    .line 74
    .line 75
    return v0

    .line 76
    :cond_2
    return v2
.end method

.method f()LJ/g;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method g(I)LB/b;
    .locals 0

    .line 1
    sget-object p0, LB/b;->e:LB/b;

    .line 2
    .line 3
    return-object p0
.end method

.method h()LB/b;
    .locals 0

    .line 1
    invoke-virtual {p0}, LJ/Y$j;->k()LB/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public hashCode()I
    .locals 4

    .line 1
    invoke-virtual {p0}, LJ/Y$j;->o()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, LJ/Y$j;->n()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, LJ/Y$j;->k()LB/b;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {p0}, LJ/Y$j;->i()LB/b;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {p0}, LJ/Y$j;->f()LJ/g;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    filled-new-array {v0, v1, v2, v3, p0}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, LI/c;->b([Ljava/lang/Object;)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method i()LB/b;
    .locals 0

    .line 1
    sget-object p0, LB/b;->e:LB/b;

    .line 2
    .line 3
    return-object p0
.end method

.method j()LB/b;
    .locals 0

    .line 1
    invoke-virtual {p0}, LJ/Y$j;->k()LB/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method k()LB/b;
    .locals 0

    .line 1
    sget-object p0, LB/b;->e:LB/b;

    .line 2
    .line 3
    return-object p0
.end method

.method l()LB/b;
    .locals 0

    .line 1
    invoke-virtual {p0}, LJ/Y$j;->k()LB/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method m(IIII)LJ/Y;
    .locals 0

    .line 1
    sget-object p0, LJ/Y$j;->b:LJ/Y;

    .line 2
    .line 3
    return-object p0
.end method

.method n()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method o()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method p(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public q([LB/b;)V
    .locals 0

    .line 1
    return-void
.end method

.method r(LB/b;)V
    .locals 0

    .line 1
    return-void
.end method

.method s(LJ/Y;)V
    .locals 0

    .line 1
    return-void
.end method
