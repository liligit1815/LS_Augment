.class LJ/Y$d;
.super Ljava/lang/Object;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LJ/Y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "d"
.end annotation


# instance fields
.field private final a:LJ/Y;

.field b:[LB/b;


# direct methods
.method constructor <init>()V
    .locals 2

    .line 1
    new-instance v0, LJ/Y;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, LJ/Y;-><init>(LJ/Y;)V

    invoke-direct {p0, v0}, LJ/Y$d;-><init>(LJ/Y;)V

    return-void
.end method

.method constructor <init>(LJ/Y;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, LJ/Y$d;->a:LJ/Y;

    return-void
.end method


# virtual methods
.method protected final a()V
    .locals 5

    .line 1
    iget-object v0, p0, LJ/Y$d;->b:[LB/b;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v1}, LJ/Y$k;->d(I)I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    aget-object v0, v0, v2

    .line 11
    .line 12
    iget-object v2, p0, LJ/Y$d;->b:[LB/b;

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    invoke-static {v3}, LJ/Y$k;->d(I)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    aget-object v2, v2, v4

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    iget-object v2, p0, LJ/Y$d;->a:LJ/Y;

    .line 24
    .line 25
    invoke-virtual {v2, v3}, LJ/Y;->f(I)LB/b;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    :cond_0
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, LJ/Y$d;->a:LJ/Y;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, LJ/Y;->f(I)LB/b;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :cond_1
    invoke-static {v0, v2}, LB/b;->a(LB/b;LB/b;)LB/b;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, LJ/Y$d;->f(LB/b;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, LJ/Y$d;->b:[LB/b;

    .line 45
    .line 46
    const/16 v1, 0x10

    .line 47
    .line 48
    invoke-static {v1}, LJ/Y$k;->d(I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    aget-object v0, v0, v1

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0, v0}, LJ/Y$d;->e(LB/b;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-object v0, p0, LJ/Y$d;->b:[LB/b;

    .line 60
    .line 61
    const/16 v1, 0x20

    .line 62
    .line 63
    invoke-static {v1}, LJ/Y$k;->d(I)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    aget-object v0, v0, v1

    .line 68
    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    invoke-virtual {p0, v0}, LJ/Y$d;->c(LB/b;)V

    .line 72
    .line 73
    .line 74
    :cond_3
    iget-object v0, p0, LJ/Y$d;->b:[LB/b;

    .line 75
    .line 76
    const/16 v1, 0x40

    .line 77
    .line 78
    invoke-static {v1}, LJ/Y$k;->d(I)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    aget-object v0, v0, v1

    .line 83
    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    invoke-virtual {p0, v0}, LJ/Y$d;->g(LB/b;)V

    .line 87
    .line 88
    .line 89
    :cond_4
    return-void
.end method

.method b()LJ/Y;
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method c(LB/b;)V
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method d(LB/b;)V
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method e(LB/b;)V
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method f(LB/b;)V
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method g(LB/b;)V
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method
