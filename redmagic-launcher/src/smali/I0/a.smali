.class public LI0/a;
.super Ljava/lang/Object;
.source "Keyframe.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final a:Lv0/h;

.field public final b:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final d:Landroid/view/animation/Interpolator;

.field public final e:Landroid/view/animation/Interpolator;

.field public final f:Landroid/view/animation/Interpolator;

.field public final g:F

.field public h:Ljava/lang/Float;

.field private i:F

.field private j:F

.field private k:I

.field private l:I

.field private m:F

.field private n:F

.field public o:Landroid/graphics/PointF;

.field public p:Landroid/graphics/PointF;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, -0x358c9d09

    .line 53
    iput v0, p0, LI0/a;->i:F

    .line 54
    iput v0, p0, LI0/a;->j:F

    const v0, 0x2ec8fb09

    .line 55
    iput v0, p0, LI0/a;->k:I

    .line 56
    iput v0, p0, LI0/a;->l:I

    const/4 v0, 0x1

    .line 57
    iput v0, p0, LI0/a;->m:F

    .line 58
    iput v0, p0, LI0/a;->n:F

    const/4 v1, 0x0

    .line 59
    iput-object v1, p0, LI0/a;->o:Landroid/graphics/PointF;

    .line 60
    iput-object v1, p0, LI0/a;->p:Landroid/graphics/PointF;

    .line 61
    iput-object v1, p0, LI0/a;->a:Lv0/h;

    .line 62
    iput-object p1, p0, LI0/a;->b:Ljava/lang/Object;

    .line 63
    iput-object p1, p0, LI0/a;->c:Ljava/lang/Object;

    .line 64
    iput-object v1, p0, LI0/a;->d:Landroid/view/animation/Interpolator;

    .line 65
    iput-object v1, p0, LI0/a;->e:Landroid/view/animation/Interpolator;

    .line 66
    iput-object v1, p0, LI0/a;->f:Landroid/view/animation/Interpolator;

    .line 67
    iput v0, p0, LI0/a;->g:F

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 68
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, LI0/a;->h:Ljava/lang/Float;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, -0x358c9d09

    .line 70
    iput v0, p0, LI0/a;->i:F

    .line 71
    iput v0, p0, LI0/a;->j:F

    const v0, 0x2ec8fb09

    .line 72
    iput v0, p0, LI0/a;->k:I

    .line 73
    iput v0, p0, LI0/a;->l:I

    const/4 v0, 0x1

    .line 74
    iput v0, p0, LI0/a;->m:F

    .line 75
    iput v0, p0, LI0/a;->n:F

    const/4 v1, 0x0

    .line 76
    iput-object v1, p0, LI0/a;->o:Landroid/graphics/PointF;

    .line 77
    iput-object v1, p0, LI0/a;->p:Landroid/graphics/PointF;

    .line 78
    iput-object v1, p0, LI0/a;->a:Lv0/h;

    .line 79
    iput-object p1, p0, LI0/a;->b:Ljava/lang/Object;

    .line 80
    iput-object p2, p0, LI0/a;->c:Ljava/lang/Object;

    .line 81
    iput-object v1, p0, LI0/a;->d:Landroid/view/animation/Interpolator;

    .line 82
    iput-object v1, p0, LI0/a;->e:Landroid/view/animation/Interpolator;

    .line 83
    iput-object v1, p0, LI0/a;->f:Landroid/view/animation/Interpolator;

    .line 84
    iput v0, p0, LI0/a;->g:F

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 85
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, LI0/a;->h:Ljava/lang/Float;

    return-void
.end method

.method public constructor <init>(Lv0/h;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv0/h;",
            "TT;TT;",
            "Landroid/view/animation/Interpolator;",
            "F",
            "Ljava/lang/Float;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, -0x358c9d09

    .line 2
    iput v0, p0, LI0/a;->i:F

    .line 3
    iput v0, p0, LI0/a;->j:F

    const v0, 0x2ec8fb09

    .line 4
    iput v0, p0, LI0/a;->k:I

    .line 5
    iput v0, p0, LI0/a;->l:I

    const/4 v0, 0x1

    .line 6
    iput v0, p0, LI0/a;->m:F

    .line 7
    iput v0, p0, LI0/a;->n:F

    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, LI0/a;->o:Landroid/graphics/PointF;

    .line 9
    iput-object v0, p0, LI0/a;->p:Landroid/graphics/PointF;

    .line 10
    iput-object p1, p0, LI0/a;->a:Lv0/h;

    .line 11
    iput-object p2, p0, LI0/a;->b:Ljava/lang/Object;

    .line 12
    iput-object p3, p0, LI0/a;->c:Ljava/lang/Object;

    .line 13
    iput-object p4, p0, LI0/a;->d:Landroid/view/animation/Interpolator;

    .line 14
    iput-object v0, p0, LI0/a;->e:Landroid/view/animation/Interpolator;

    .line 15
    iput-object v0, p0, LI0/a;->f:Landroid/view/animation/Interpolator;

    .line 16
    iput p5, p0, LI0/a;->g:F

    .line 17
    iput-object p6, p0, LI0/a;->h:Ljava/lang/Float;

    return-void
.end method

.method public constructor <init>(Lv0/h;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv0/h;",
            "TT;TT;",
            "Landroid/view/animation/Interpolator;",
            "Landroid/view/animation/Interpolator;",
            "F",
            "Ljava/lang/Float;",
            ")V"
        }
    .end annotation

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, -0x358c9d09

    .line 19
    iput v0, p0, LI0/a;->i:F

    .line 20
    iput v0, p0, LI0/a;->j:F

    const v0, 0x2ec8fb09

    .line 21
    iput v0, p0, LI0/a;->k:I

    .line 22
    iput v0, p0, LI0/a;->l:I

    const/4 v0, 0x1

    .line 23
    iput v0, p0, LI0/a;->m:F

    .line 24
    iput v0, p0, LI0/a;->n:F

    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, LI0/a;->o:Landroid/graphics/PointF;

    .line 26
    iput-object v0, p0, LI0/a;->p:Landroid/graphics/PointF;

    .line 27
    iput-object p1, p0, LI0/a;->a:Lv0/h;

    .line 28
    iput-object p2, p0, LI0/a;->b:Ljava/lang/Object;

    .line 29
    iput-object p3, p0, LI0/a;->c:Ljava/lang/Object;

    .line 30
    iput-object v0, p0, LI0/a;->d:Landroid/view/animation/Interpolator;

    .line 31
    iput-object p4, p0, LI0/a;->e:Landroid/view/animation/Interpolator;

    .line 32
    iput-object p5, p0, LI0/a;->f:Landroid/view/animation/Interpolator;

    .line 33
    iput p6, p0, LI0/a;->g:F

    .line 34
    iput-object p7, p0, LI0/a;->h:Ljava/lang/Float;

    return-void
.end method

.method protected constructor <init>(Lv0/h;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv0/h;",
            "TT;TT;",
            "Landroid/view/animation/Interpolator;",
            "Landroid/view/animation/Interpolator;",
            "Landroid/view/animation/Interpolator;",
            "F",
            "Ljava/lang/Float;",
            ")V"
        }
    .end annotation

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, -0x358c9d09

    .line 36
    iput v0, p0, LI0/a;->i:F

    .line 37
    iput v0, p0, LI0/a;->j:F

    const v0, 0x2ec8fb09

    .line 38
    iput v0, p0, LI0/a;->k:I

    .line 39
    iput v0, p0, LI0/a;->l:I

    const/4 v0, 0x1

    .line 40
    iput v0, p0, LI0/a;->m:F

    .line 41
    iput v0, p0, LI0/a;->n:F

    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, LI0/a;->o:Landroid/graphics/PointF;

    .line 43
    iput-object v0, p0, LI0/a;->p:Landroid/graphics/PointF;

    .line 44
    iput-object p1, p0, LI0/a;->a:Lv0/h;

    .line 45
    iput-object p2, p0, LI0/a;->b:Ljava/lang/Object;

    .line 46
    iput-object p3, p0, LI0/a;->c:Ljava/lang/Object;

    .line 47
    iput-object p4, p0, LI0/a;->d:Landroid/view/animation/Interpolator;

    .line 48
    iput-object p5, p0, LI0/a;->e:Landroid/view/animation/Interpolator;

    .line 49
    iput-object p6, p0, LI0/a;->f:Landroid/view/animation/Interpolator;

    .line 50
    iput p7, p0, LI0/a;->g:F

    .line 51
    iput-object p8, p0, LI0/a;->h:Ljava/lang/Float;

    return-void
.end method


# virtual methods
.method public a(F)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, LI0/a;->f()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    cmpl-float v0, p1, v0

    .line 6
    .line 7
    if-ltz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, LI0/a;->c()F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    cmpg-float p0, p1, p0

    .line 14
    .line 15
    if-gez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public b(Ljava/lang/Object;Ljava/lang/Object;)LI0/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)",
            "LI0/a<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance p0, LI0/a;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, LI0/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public c()F
    .locals 3

    .line 1
    iget-object v0, p0, LI0/a;->a:Lv0/h;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return v1

    .line 8
    :cond_0
    iget v0, p0, LI0/a;->n:F

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    cmpl-float v0, v0, v2

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, LI0/a;->h:Ljava/lang/Float;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iput v1, p0, LI0/a;->n:F

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {p0}, LI0/a;->f()F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v1, p0, LI0/a;->h:Ljava/lang/Float;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iget v2, p0, LI0/a;->g:F

    .line 33
    .line 34
    sub-float/2addr v1, v2

    .line 35
    iget-object v2, p0, LI0/a;->a:Lv0/h;

    .line 36
    .line 37
    invoke-virtual {v2}, Lv0/h;->e()F

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    div-float/2addr v1, v2

    .line 42
    add-float/2addr v0, v1

    .line 43
    iput v0, p0, LI0/a;->n:F

    .line 44
    .line 45
    :cond_2
    :goto_0
    iget p0, p0, LI0/a;->n:F

    .line 46
    .line 47
    return p0
.end method

.method public d()F
    .locals 2

    .line 1
    iget v0, p0, LI0/a;->j:F

    .line 2
    .line 3
    const v1, -0x358c9d09

    .line 4
    .line 5
    .line 6
    cmpl-float v0, v0, v1

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, LI0/a;->c:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ljava/lang/Float;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, LI0/a;->j:F

    .line 19
    .line 20
    :cond_0
    iget p0, p0, LI0/a;->j:F

    .line 21
    .line 22
    return p0
.end method

.method public e()I
    .locals 2

    .line 1
    iget v0, p0, LI0/a;->l:I

    .line 2
    .line 3
    const v1, 0x2ec8fb09

    .line 4
    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, LI0/a;->c:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, LI0/a;->l:I

    .line 17
    .line 18
    :cond_0
    iget p0, p0, LI0/a;->l:I

    .line 19
    .line 20
    return p0
.end method

.method public f()F
    .locals 3

    .line 1
    iget-object v0, p0, LI0/a;->a:Lv0/h;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget v1, p0, LI0/a;->m:F

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    cmpl-float v1, v1, v2

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    iget v1, p0, LI0/a;->g:F

    .line 15
    .line 16
    invoke-virtual {v0}, Lv0/h;->p()F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    sub-float/2addr v1, v0

    .line 21
    iget-object v0, p0, LI0/a;->a:Lv0/h;

    .line 22
    .line 23
    invoke-virtual {v0}, Lv0/h;->e()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    div-float/2addr v1, v0

    .line 28
    iput v1, p0, LI0/a;->m:F

    .line 29
    .line 30
    :cond_1
    iget p0, p0, LI0/a;->m:F

    .line 31
    .line 32
    return p0
.end method

.method public g()F
    .locals 2

    .line 1
    iget v0, p0, LI0/a;->i:F

    .line 2
    .line 3
    const v1, -0x358c9d09

    .line 4
    .line 5
    .line 6
    cmpl-float v0, v0, v1

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, LI0/a;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ljava/lang/Float;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, LI0/a;->i:F

    .line 19
    .line 20
    :cond_0
    iget p0, p0, LI0/a;->i:F

    .line 21
    .line 22
    return p0
.end method

.method public h()I
    .locals 2

    .line 1
    iget v0, p0, LI0/a;->k:I

    .line 2
    .line 3
    const v1, 0x2ec8fb09

    .line 4
    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, LI0/a;->b:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, LI0/a;->k:I

    .line 17
    .line 18
    :cond_0
    iget p0, p0, LI0/a;->k:I

    .line 19
    .line 20
    return p0
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object v0, p0, LI0/a;->d:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LI0/a;->e:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, LI0/a;->f:Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Keyframe{startValue="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, LI0/a;->b:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", endValue="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, LI0/a;->c:Ljava/lang/Object;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", startFrame="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget v1, p0, LI0/a;->g:F

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ", endFrame="

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, LI0/a;->h:Ljava/lang/Float;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, ", interpolator="

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, LI0/a;->d:Landroid/view/animation/Interpolator;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const/16 p0, 0x7d

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method
