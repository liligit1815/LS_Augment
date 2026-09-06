.class public Lv0/h;
.super Ljava/lang/Object;
.source "LottieComposition.java"


# instance fields
.field private final a:Lv0/y;

.field private final b:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "LD0/e;",
            ">;>;"
        }
    .end annotation
.end field

.field private d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lv0/q;",
            ">;"
        }
    .end annotation
.end field

.field private e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "LA0/c;",
            ">;"
        }
    .end annotation
.end field

.field private f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LA0/h;",
            ">;"
        }
    .end annotation
.end field

.field private g:Lo/s;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lo/s<",
            "LA0/d;",
            ">;"
        }
    .end annotation
.end field

.field private h:Lo/j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lo/j<",
            "LD0/e;",
            ">;"
        }
    .end annotation
.end field

.field private i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LD0/e;",
            ">;"
        }
    .end annotation
.end field

.field private j:Landroid/graphics/Rect;

.field private k:F

.field private l:F

.field private m:F

.field private n:Z

.field private o:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lv0/y;

    .line 5
    .line 6
    invoke-direct {v0}, Lv0/y;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lv0/h;->a:Lv0/y;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lv0/h;->b:Ljava/util/HashSet;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lv0/h;->o:I

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, LH0/d;->c(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lv0/h;->b:Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lv0/h;->j:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lo/s;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lo/s<",
            "LA0/d;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lv0/h;->g:Lo/s;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Lv0/h;->e()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, Lv0/h;->m:F

    .line 6
    .line 7
    div-float/2addr v0, p0

    .line 8
    const/high16 p0, 0x447a0000    # 1000.0f

    .line 9
    .line 10
    mul-float/2addr v0, p0

    .line 11
    float-to-long v0, v0

    .line 12
    long-to-float p0, v0

    .line 13
    return p0
.end method

.method public e()F
    .locals 1

    .line 1
    iget v0, p0, Lv0/h;->l:F

    .line 2
    .line 3
    iget p0, p0, Lv0/h;->k:F

    .line 4
    .line 5
    sub-float/2addr v0, p0

    .line 6
    return v0
.end method

.method public f()F
    .locals 0

    .line 1
    iget p0, p0, Lv0/h;->l:F

    .line 2
    .line 3
    return p0
.end method

.method public g()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "LA0/c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lv0/h;->e:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(F)F
    .locals 1

    .line 1
    iget v0, p0, Lv0/h;->k:F

    .line 2
    .line 3
    iget p0, p0, Lv0/h;->l:F

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, LH0/g;->i(FFF)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public i()F
    .locals 0

    .line 1
    iget p0, p0, Lv0/h;->m:F

    .line 2
    .line 3
    return p0
.end method

.method public j()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lv0/q;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lv0/h;->d:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LD0/e;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lv0/h;->i:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Ljava/lang/String;)LA0/h;
    .locals 4

    .line 1
    iget-object v0, p0, Lv0/h;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lv0/h;->f:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, LA0/h;

    .line 17
    .line 18
    invoke-virtual {v2, p1}, LA0/h;->a(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    return-object v2

    .line 25
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Lv0/h;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public n()Lv0/y;
    .locals 0

    .line 1
    iget-object p0, p0, Lv0/h;->a:Lv0/y;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "LD0/e;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lv0/h;->c:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method public p()F
    .locals 0

    .line 1
    iget p0, p0, Lv0/h;->k:F

    .line 2
    .line 3
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lv0/h;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public r(I)V
    .locals 1

    .line 1
    iget v0, p0, Lv0/h;->o:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    iput v0, p0, Lv0/h;->o:I

    .line 5
    .line 6
    return-void
.end method

.method public s(Landroid/graphics/Rect;FFFLjava/util/List;Lo/j;Ljava/util/Map;Ljava/util/Map;Lo/s;Ljava/util/Map;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Rect;",
            "FFF",
            "Ljava/util/List<",
            "LD0/e;",
            ">;",
            "Lo/j<",
            "LD0/e;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "LD0/e;",
            ">;>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lv0/q;",
            ">;",
            "Lo/s<",
            "LA0/d;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "LA0/c;",
            ">;",
            "Ljava/util/List<",
            "LA0/h;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv0/h;->j:Landroid/graphics/Rect;

    .line 2
    .line 3
    iput p2, p0, Lv0/h;->k:F

    .line 4
    .line 5
    iput p3, p0, Lv0/h;->l:F

    .line 6
    .line 7
    iput p4, p0, Lv0/h;->m:F

    .line 8
    .line 9
    iput-object p5, p0, Lv0/h;->i:Ljava/util/List;

    .line 10
    .line 11
    iput-object p6, p0, Lv0/h;->h:Lo/j;

    .line 12
    .line 13
    iput-object p7, p0, Lv0/h;->c:Ljava/util/Map;

    .line 14
    .line 15
    iput-object p8, p0, Lv0/h;->d:Ljava/util/Map;

    .line 16
    .line 17
    iput-object p9, p0, Lv0/h;->g:Lo/s;

    .line 18
    .line 19
    iput-object p10, p0, Lv0/h;->e:Ljava/util/Map;

    .line 20
    .line 21
    iput-object p11, p0, Lv0/h;->f:Ljava/util/List;

    .line 22
    .line 23
    return-void
.end method

.method public t(J)LD0/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lv0/h;->h:Lo/j;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lo/j;->d(J)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LD0/e;

    .line 8
    .line 9
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "LottieComposition:\n"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lv0/h;->i:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, LD0/e;

    .line 25
    .line 26
    const-string v2, "\t"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, LD0/e;->y(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv0/h;->n:Z

    .line 2
    .line 3
    return-void
.end method

.method public v(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv0/h;->a:Lv0/y;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv0/y;->b(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
