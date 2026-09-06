.class public LC0/f;
.super Ljava/lang/Object;
.source "GradientStroke.java"

# interfaces
.implements LC0/c;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:LC0/g;

.field private final c:LB0/c;

.field private final d:LB0/d;

.field private final e:LB0/f;

.field private final f:LB0/f;

.field private final g:LB0/b;

.field private final h:LC0/r$b;

.field private final i:LC0/r$c;

.field private final j:F

.field private final k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LB0/b;",
            ">;"
        }
    .end annotation
.end field

.field private final l:LB0/b;

.field private final m:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;LC0/g;LB0/c;LB0/d;LB0/f;LB0/f;LB0/b;LC0/r$b;LC0/r$c;FLjava/util/List;LB0/b;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LC0/g;",
            "LB0/c;",
            "LB0/d;",
            "LB0/f;",
            "LB0/f;",
            "LB0/b;",
            "LC0/r$b;",
            "LC0/r$c;",
            "F",
            "Ljava/util/List<",
            "LB0/b;",
            ">;",
            "LB0/b;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LC0/f;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, LC0/f;->b:LC0/g;

    .line 7
    .line 8
    iput-object p3, p0, LC0/f;->c:LB0/c;

    .line 9
    .line 10
    iput-object p4, p0, LC0/f;->d:LB0/d;

    .line 11
    .line 12
    iput-object p5, p0, LC0/f;->e:LB0/f;

    .line 13
    .line 14
    iput-object p6, p0, LC0/f;->f:LB0/f;

    .line 15
    .line 16
    iput-object p7, p0, LC0/f;->g:LB0/b;

    .line 17
    .line 18
    iput-object p8, p0, LC0/f;->h:LC0/r$b;

    .line 19
    .line 20
    iput-object p9, p0, LC0/f;->i:LC0/r$c;

    .line 21
    .line 22
    iput p10, p0, LC0/f;->j:F

    .line 23
    .line 24
    iput-object p11, p0, LC0/f;->k:Ljava/util/List;

    .line 25
    .line 26
    iput-object p12, p0, LC0/f;->l:LB0/b;

    .line 27
    .line 28
    iput-boolean p13, p0, LC0/f;->m:Z

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public a(Lcom/airbnb/lottie/n;Lv0/h;LD0/b;)Lx0/c;
    .locals 0

    .line 1
    new-instance p2, Lx0/i;

    .line 2
    .line 3
    invoke-direct {p2, p1, p3, p0}, Lx0/i;-><init>(Lcom/airbnb/lottie/n;LD0/b;LC0/f;)V

    .line 4
    .line 5
    .line 6
    return-object p2
.end method

.method public b()LC0/r$b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/f;->h:LC0/r$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/f;->l:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()LB0/f;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/f;->f:LB0/f;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()LB0/c;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/f;->c:LB0/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()LC0/g;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/f;->b:LC0/g;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()LC0/r$c;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/f;->i:LC0/r$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LB0/b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LC0/f;->k:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()F
    .locals 0

    .line 1
    iget p0, p0, LC0/f;->j:F

    .line 2
    .line 3
    return p0
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()LB0/d;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/f;->d:LB0/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()LB0/f;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/f;->e:LB0/f;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/f;->g:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LC0/f;->m:Z

    .line 2
    .line 3
    return p0
.end method
