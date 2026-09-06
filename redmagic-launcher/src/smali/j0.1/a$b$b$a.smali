.class public final Lj0/a$b$b$a;
.super Ljava/lang/Object;
.source "Collect.kt"

# interfaces
.implements LI4/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lj0/a$b$b;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LI4/e<",
        "Lp0/j;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:LI4/e;

.field final synthetic h:Lj0/a;


# direct methods
.method public constructor <init>(LI4/e;Lj0/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lj0/a$b$b$a;->g:LI4/e;

    .line 2
    .line 3
    iput-object p2, p0, Lj0/a$b$b$a;->h:Lj0/a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 4

    .line 1
    instance-of v0, p2, Lj0/a$b$b$a$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lj0/a$b$b$a$a;

    .line 7
    .line 8
    iget v1, v0, Lj0/a$b$b$a$a;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lj0/a$b$b$a$a;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lj0/a$b$b$a$a;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lj0/a$b$b$a$a;-><init>(Lj0/a$b$b$a;Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lj0/a$b$b$a$a;->g:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, Lj0/a$b$b$a$a;->h:I

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-ne v2, v3, :cond_1

    .line 37
    .line 38
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 43
    .line 44
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 45
    .line 46
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw p0

    .line 50
    :cond_2
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Lj0/a$b$b$a;->g:LI4/e;

    .line 54
    .line 55
    check-cast p1, Lp0/j;

    .line 56
    .line 57
    iget-object p0, p0, Lj0/a$b$b$a;->h:Lj0/a;

    .line 58
    .line 59
    invoke-static {p0, p1}, Lj0/a;->a(Lj0/a;Lp0/j;)Lp0/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    if-nez p0, :cond_3

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    iput v3, v0, Lj0/a$b$b$a$a;->h:I

    .line 67
    .line 68
    invoke-interface {p2, p0, v0}, LI4/e;->emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    if-ne p0, v1, :cond_4

    .line 73
    .line 74
    return-object v1

    .line 75
    :cond_4
    :goto_1
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 76
    .line 77
    return-object p0
.end method
