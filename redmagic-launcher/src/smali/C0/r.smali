.class public LC0/r;
.super Ljava/lang/Object;
.source "ShapeStroke.java"

# interfaces
.implements LC0/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LC0/r$b;,
        LC0/r$c;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:LB0/b;

.field private final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LB0/b;",
            ">;"
        }
    .end annotation
.end field

.field private final d:LB0/a;

.field private final e:LB0/d;

.field private final f:LB0/b;

.field private final g:LC0/r$b;

.field private final h:LC0/r$c;

.field private final i:F

.field private final j:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;LB0/b;Ljava/util/List;LB0/a;LB0/d;LB0/b;LC0/r$b;LC0/r$c;FZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LB0/b;",
            "Ljava/util/List<",
            "LB0/b;",
            ">;",
            "LB0/a;",
            "LB0/d;",
            "LB0/b;",
            "LC0/r$b;",
            "LC0/r$c;",
            "FZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LC0/r;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, LC0/r;->b:LB0/b;

    .line 7
    .line 8
    iput-object p3, p0, LC0/r;->c:Ljava/util/List;

    .line 9
    .line 10
    iput-object p4, p0, LC0/r;->d:LB0/a;

    .line 11
    .line 12
    iput-object p5, p0, LC0/r;->e:LB0/d;

    .line 13
    .line 14
    iput-object p6, p0, LC0/r;->f:LB0/b;

    .line 15
    .line 16
    iput-object p7, p0, LC0/r;->g:LC0/r$b;

    .line 17
    .line 18
    iput-object p8, p0, LC0/r;->h:LC0/r$c;

    .line 19
    .line 20
    iput p9, p0, LC0/r;->i:F

    .line 21
    .line 22
    iput-boolean p10, p0, LC0/r;->j:Z

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a(Lcom/airbnb/lottie/n;Lv0/h;LD0/b;)Lx0/c;
    .locals 0

    .line 1
    new-instance p2, Lx0/t;

    .line 2
    .line 3
    invoke-direct {p2, p1, p3, p0}, Lx0/t;-><init>(Lcom/airbnb/lottie/n;LD0/b;LC0/r;)V

    .line 4
    .line 5
    .line 6
    return-object p2
.end method

.method public b()LC0/r$b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/r;->g:LC0/r$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()LB0/a;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/r;->d:LB0/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/r;->b:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()LC0/r$c;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/r;->h:LC0/r$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/util/List;
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
    iget-object p0, p0, LC0/r;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()F
    .locals 0

    .line 1
    iget p0, p0, LC0/r;->i:F

    .line 2
    .line 3
    return p0
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/r;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()LB0/d;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/r;->e:LB0/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/r;->f:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LC0/r;->j:Z

    .line 2
    .line 3
    return p0
.end method
