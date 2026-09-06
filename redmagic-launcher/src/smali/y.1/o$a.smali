.class Ly/o$a;
.super Ly/o;
.source "Keyframe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ly/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ly/o<",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# instance fields
.field l:F


# direct methods
.method constructor <init>(F)V
    .locals 0

    .line 6
    invoke-direct {p0}, Ly/o;-><init>()V

    .line 7
    iput p1, p0, Ly/o;->i:F

    .line 8
    sget-object p1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    iput-object p1, p0, Ly/o;->j:Ljava/lang/Class;

    return-void
.end method

.method constructor <init>(FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ly/o;-><init>()V

    .line 2
    iput p1, p0, Ly/o;->i:F

    .line 3
    iput p2, p0, Ly/o$a;->l:F

    .line 4
    sget-object p1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    iput-object p1, p0, Ly/o;->j:Ljava/lang/Class;

    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ly/o;->g:Z

    return-void
.end method


# virtual methods
.method public bridge synthetic a()Ly/o;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ly/o$a;->o()Ly/o$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ly/o$a;->o()Ly/o$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic d()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ly/o$a;->q()Ljava/lang/Float;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic l(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Float;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ly/o$a;->r(Ljava/lang/Float;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()Ly/o$a;
    .locals 3

    .line 1
    iget-boolean v0, p0, Ly/o;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ly/o$a;

    .line 6
    .line 7
    invoke-virtual {p0}, Ly/o;->b()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget v2, p0, Ly/o$a;->l:F

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ly/o$a;-><init>(FF)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance v0, Ly/o$a;

    .line 18
    .line 19
    invoke-virtual {p0}, Ly/o;->b()F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-direct {v0, v1}, Ly/o$a;-><init>(F)V

    .line 24
    .line 25
    .line 26
    :goto_0
    invoke-virtual {p0}, Ly/o;->c()Ly/n;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ly/o;->k(Ly/n;)V

    .line 31
    .line 32
    .line 33
    iget-boolean p0, p0, Ly/o;->h:Z

    .line 34
    .line 35
    iput-boolean p0, v0, Ly/o;->h:Z

    .line 36
    .line 37
    return-object v0
.end method

.method public p()F
    .locals 0

    .line 1
    iget p0, p0, Ly/o$a;->l:F

    .line 2
    .line 3
    return p0
.end method

.method public q()Ljava/lang/Float;
    .locals 0

    .line 1
    iget p0, p0, Ly/o$a;->l:F

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public r(Ljava/lang/Float;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-class v1, Ljava/lang/Float;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Ly/o$a;->l:F

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Ly/o;->g:Z

    .line 19
    .line 20
    :cond_0
    return-void
.end method
