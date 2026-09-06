.class public LC0/b;
.super Ljava/lang/Object;
.source "CircleShape.java"

# interfaces
.implements LC0/c;


# instance fields
.field private final a:Ljava/lang/String;

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

.field private final c:LB0/f;

.field private final d:Z

.field private final e:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;LB0/m;LB0/f;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LB0/m<",
            "Landroid/graphics/PointF;",
            "Landroid/graphics/PointF;",
            ">;",
            "LB0/f;",
            "ZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LC0/b;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, LC0/b;->b:LB0/m;

    .line 7
    .line 8
    iput-object p3, p0, LC0/b;->c:LB0/f;

    .line 9
    .line 10
    iput-boolean p4, p0, LC0/b;->d:Z

    .line 11
    .line 12
    iput-boolean p5, p0, LC0/b;->e:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Lcom/airbnb/lottie/n;Lv0/h;LD0/b;)Lx0/c;
    .locals 0

    .line 1
    new-instance p2, Lx0/f;

    .line 2
    .line 3
    invoke-direct {p2, p1, p3, p0}, Lx0/f;-><init>(Lcom/airbnb/lottie/n;LD0/b;LC0/b;)V

    .line 4
    .line 5
    .line 6
    return-object p2
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()LB0/m;
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
    iget-object p0, p0, LC0/b;->b:LB0/m;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()LB0/f;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/b;->c:LB0/f;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LC0/b;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LC0/b;->d:Z

    .line 2
    .line 3
    return p0
.end method
