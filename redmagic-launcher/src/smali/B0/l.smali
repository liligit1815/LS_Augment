.class public LB0/l;
.super Ljava/lang/Object;
.source "AnimatableTransform.java"

# interfaces
.implements LC0/c;


# instance fields
.field private final a:LB0/e;

.field private final b:LB0/m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LB0/m<",
            "Landroid/graphics/PointF;",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private final c:LB0/g;

.field private final d:LB0/b;

.field private final e:LB0/d;

.field private final f:LB0/b;

.field private final g:LB0/b;

.field private final h:LB0/b;

.field private final i:LB0/b;


# direct methods
.method public constructor <init>()V
    .locals 10

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    .line 1
    invoke-direct/range {v0 .. v9}, LB0/l;-><init>(LB0/e;LB0/m;LB0/g;LB0/b;LB0/d;LB0/b;LB0/b;LB0/b;LB0/b;)V

    return-void
.end method

.method public constructor <init>(LB0/e;LB0/m;LB0/g;LB0/b;LB0/d;LB0/b;LB0/b;LB0/b;LB0/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LB0/e;",
            "LB0/m<",
            "Landroid/graphics/PointF;",
            "Landroid/graphics/PointF;",
            ">;",
            "LB0/g;",
            "LB0/b;",
            "LB0/d;",
            "LB0/b;",
            "LB0/b;",
            "LB0/b;",
            "LB0/b;",
            ")V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, LB0/l;->a:LB0/e;

    .line 4
    iput-object p2, p0, LB0/l;->b:LB0/m;

    .line 5
    iput-object p3, p0, LB0/l;->c:LB0/g;

    .line 6
    iput-object p4, p0, LB0/l;->d:LB0/b;

    .line 7
    iput-object p5, p0, LB0/l;->e:LB0/d;

    .line 8
    iput-object p6, p0, LB0/l;->h:LB0/b;

    .line 9
    iput-object p7, p0, LB0/l;->i:LB0/b;

    .line 10
    iput-object p8, p0, LB0/l;->f:LB0/b;

    .line 11
    iput-object p9, p0, LB0/l;->g:LB0/b;

    return-void
.end method


# virtual methods
.method public a(Lcom/airbnb/lottie/n;Lv0/h;LD0/b;)Lx0/c;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b()Ly0/p;
    .locals 1

    .line 1
    new-instance v0, Ly0/p;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ly0/p;-><init>(LB0/l;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public c()LB0/e;
    .locals 0

    .line 1
    iget-object p0, p0, LB0/l;->a:LB0/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LB0/l;->i:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()LB0/d;
    .locals 0

    .line 1
    iget-object p0, p0, LB0/l;->e:LB0/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()LB0/m;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LB0/m<",
            "Landroid/graphics/PointF;",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LB0/l;->b:LB0/m;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LB0/l;->d:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()LB0/g;
    .locals 0

    .line 1
    iget-object p0, p0, LB0/l;->c:LB0/g;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LB0/l;->f:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LB0/l;->g:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LB0/l;->h:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method
