.class public LC0/j;
.super Ljava/lang/Object;
.source "PolystarShape.java"

# interfaces
.implements LC0/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LC0/j$a;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:LC0/j$a;

.field private final c:LB0/b;

.field private final d:LB0/m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LB0/m<",
            "Landroid/graphics/PointF;",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private final e:LB0/b;

.field private final f:LB0/b;

.field private final g:LB0/b;

.field private final h:LB0/b;

.field private final i:LB0/b;

.field private final j:Z

.field private final k:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;LC0/j$a;LB0/b;LB0/m;LB0/b;LB0/b;LB0/b;LB0/b;LB0/b;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LC0/j$a;",
            "LB0/b;",
            "LB0/m<",
            "Landroid/graphics/PointF;",
            "Landroid/graphics/PointF;",
            ">;",
            "LB0/b;",
            "LB0/b;",
            "LB0/b;",
            "LB0/b;",
            "LB0/b;",
            "ZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LC0/j;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, LC0/j;->b:LC0/j$a;

    .line 7
    .line 8
    iput-object p3, p0, LC0/j;->c:LB0/b;

    .line 9
    .line 10
    iput-object p4, p0, LC0/j;->d:LB0/m;

    .line 11
    .line 12
    iput-object p5, p0, LC0/j;->e:LB0/b;

    .line 13
    .line 14
    iput-object p6, p0, LC0/j;->f:LB0/b;

    .line 15
    .line 16
    iput-object p7, p0, LC0/j;->g:LB0/b;

    .line 17
    .line 18
    iput-object p8, p0, LC0/j;->h:LB0/b;

    .line 19
    .line 20
    iput-object p9, p0, LC0/j;->i:LB0/b;

    .line 21
    .line 22
    iput-boolean p10, p0, LC0/j;->j:Z

    .line 23
    .line 24
    iput-boolean p11, p0, LC0/j;->k:Z

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a(Lcom/airbnb/lottie/n;Lv0/h;LD0/b;)Lx0/c;
    .locals 0

    .line 1
    new-instance p2, Lx0/n;

    .line 2
    .line 3
    invoke-direct {p2, p1, p3, p0}, Lx0/n;-><init>(Lcom/airbnb/lottie/n;LD0/b;LC0/j;)V

    .line 4
    .line 5
    .line 6
    return-object p2
.end method

.method public b()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/j;->f:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/j;->h:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/j;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/j;->g:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/j;->i:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/j;->c:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()LB0/m;
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
    iget-object p0, p0, LC0/j;->d:LB0/m;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/j;->e:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()LC0/j$a;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/j;->b:LC0/j$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LC0/j;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LC0/j;->k:Z

    .line 2
    .line 3
    return p0
.end method
