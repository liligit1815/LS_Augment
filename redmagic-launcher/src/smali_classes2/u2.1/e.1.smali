.class public final Lu2/e;
.super Ljava/lang/Object;
.source "AppTransitionParam.java"


# instance fields
.field private a:F

.field private b:Z

.field private c:F

.field private d:Landroid/graphics/Matrix;

.field private e:F

.field private f:Landroid/graphics/Rect;

.field private g:F

.field private final h:Landroid/graphics/RectF;

.field private i:Landroid/animation/AnimatorSet;

.field public j:Landroid/graphics/PointF;

.field public k:F

.field public l:F

.field public m:Z

.field public n:Landroid/graphics/PointF;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lu2/e;->d:Landroid/graphics/Matrix;

    .line 10
    .line 11
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    iput v0, p0, Lu2/e;->e:F

    .line 14
    .line 15
    new-instance v1, Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lu2/e;->f:Landroid/graphics/Rect;

    .line 21
    .line 22
    iput v0, p0, Lu2/e;->g:F

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/RectF;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lu2/e;->h:Landroid/graphics/RectF;

    .line 30
    .line 31
    new-instance v0, Landroid/graphics/PointF;

    .line 32
    .line 33
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lu2/e;->j:Landroid/graphics/PointF;

    .line 37
    .line 38
    new-instance v0, Landroid/graphics/PointF;

    .line 39
    .line 40
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lu2/e;->n:Landroid/graphics/PointF;

    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public a()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/e;->f:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/e;->i:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/e;->h:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/e;->d:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()F
    .locals 0

    .line 1
    iget p0, p0, Lu2/e;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public f()F
    .locals 0

    .line 1
    iget p0, p0, Lu2/e;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lu2/e;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lu2/e;->m:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lu2/e;->b:Z

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lu2/e;->i:Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    return-void
.end method

.method public i(F)V
    .locals 0

    .line 1
    iput p1, p0, Lu2/e;->a:F

    .line 2
    .line 3
    return-void
.end method

.method public j(Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lu2/e;->i:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lu2/e;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public l(F)V
    .locals 0

    .line 1
    iput p1, p0, Lu2/e;->e:F

    .line 2
    .line 3
    return-void
.end method

.method public m(F)V
    .locals 0

    .line 1
    iput p1, p0, Lu2/e;->c:F

    .line 2
    .line 3
    return-void
.end method
