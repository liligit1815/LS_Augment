.class final Ly0/a$f;
.super Ljava/lang/Object;
.source "BaseKeyframeAnimation.java"

# interfaces
.implements Ly0/a$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ly0/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "f"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ly0/a$d<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final a:LI0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI0/a<",
            "TT;>;"
        }
    .end annotation
.end field

.field private b:F


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "LI0/a<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Ly0/a$f;->b:F

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, LI0/a;

    .line 14
    .line 15
    iput-object p1, p0, Ly0/a$f;->a:LI0/a;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a(F)Z
    .locals 1

    .line 1
    iget v0, p0, Ly0/a$f;->b:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    iput p1, p0, Ly0/a$f;->b:F

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public b()LI0/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LI0/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ly0/a$f;->a:LI0/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ly0/a$f;->a:LI0/a;

    .line 2
    .line 3
    invoke-virtual {p0}, LI0/a;->i()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public d()F
    .locals 0

    .line 1
    iget-object p0, p0, Ly0/a$f;->a:LI0/a;

    .line 2
    .line 3
    invoke-virtual {p0}, LI0/a;->f()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()F
    .locals 0

    .line 1
    iget-object p0, p0, Ly0/a$f;->a:LI0/a;

    .line 2
    .line 3
    invoke-virtual {p0}, LI0/a;->c()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isEmpty()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
