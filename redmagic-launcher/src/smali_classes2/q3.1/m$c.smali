.class Lq3/m$c;
.super Lq3/m$g;
.source "ShapePath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lq3/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "c"
.end annotation


# instance fields
.field private final c:Lq3/m$e;

.field private final d:F

.field private final e:F


# direct methods
.method public constructor <init>(Lq3/m$e;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lq3/m$g;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lq3/m$c;->c:Lq3/m$e;

    .line 5
    .line 6
    iput p2, p0, Lq3/m$c;->d:F

    .line 7
    .line 8
    iput p3, p0, Lq3/m$c;->e:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Matrix;Lp3/a;ILandroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lq3/m$c;->c:Lq3/m$e;

    .line 2
    .line 3
    invoke-static {v0}, Lq3/m$e;->d(Lq3/m$e;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lq3/m$c;->e:F

    .line 8
    .line 9
    sub-float/2addr v0, v1

    .line 10
    iget-object v1, p0, Lq3/m$c;->c:Lq3/m$e;

    .line 11
    .line 12
    invoke-static {v1}, Lq3/m$e;->b(Lq3/m$e;)F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget v2, p0, Lq3/m$c;->d:F

    .line 17
    .line 18
    sub-float/2addr v1, v2

    .line 19
    new-instance v2, Landroid/graphics/RectF;

    .line 20
    .line 21
    float-to-double v3, v0

    .line 22
    float-to-double v0, v1

    .line 23
    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->hypot(DD)D

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    double-to-float v0, v0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-direct {v2, v1, v1, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lq3/m$g;->a:Landroid/graphics/Matrix;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lq3/m$g;->a:Landroid/graphics/Matrix;

    .line 38
    .line 39
    iget v0, p0, Lq3/m$c;->d:F

    .line 40
    .line 41
    iget v1, p0, Lq3/m$c;->e:F

    .line 42
    .line 43
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lq3/m$g;->a:Landroid/graphics/Matrix;

    .line 47
    .line 48
    invoke-virtual {p0}, Lq3/m$c;->c()F

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lq3/m$g;->a:Landroid/graphics/Matrix;

    .line 56
    .line 57
    invoke-virtual {p2, p4, p0, v2, p3}, Lp3/a;->b(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Landroid/graphics/RectF;I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method c()F
    .locals 2

    .line 1
    iget-object v0, p0, Lq3/m$c;->c:Lq3/m$e;

    .line 2
    .line 3
    invoke-static {v0}, Lq3/m$e;->d(Lq3/m$e;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lq3/m$c;->e:F

    .line 8
    .line 9
    sub-float/2addr v0, v1

    .line 10
    iget-object v1, p0, Lq3/m$c;->c:Lq3/m$e;

    .line 11
    .line 12
    invoke-static {v1}, Lq3/m$e;->b(Lq3/m$e;)F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget p0, p0, Lq3/m$c;->d:F

    .line 17
    .line 18
    sub-float/2addr v1, p0

    .line 19
    div-float/2addr v0, v1

    .line 20
    float-to-double v0, v0

    .line 21
    invoke-static {v0, v1}, Ljava/lang/Math;->atan(D)D

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    double-to-float p0, v0

    .line 30
    return p0
.end method
