.class public final Ln1/t$d;
.super Ljava/lang/Object;
.source "ShapeDelegate.kt"

# interfaces
.implements Ln1/t;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ln1/t;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# instance fields
.field private final b:Ljava/lang/String;

.field private final c:LU/x;

.field private final d:Landroid/graphics/Path;

.field private final e:Landroid/graphics/Path;

.field private final f:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 8

    .line 1
    const-string v0, "pathString"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ln1/t$d;->b:Ljava/lang/String;

    .line 10
    .line 11
    sget-object v0, LU/B;->d:LU/B$b;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, LU/B$b;->b(Ljava/lang/String;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/high16 v0, 0x42480000    # 50.0f

    .line 18
    .line 19
    invoke-static {p1, v0, v0}, LU/y;->a(Ljava/util/List;FF)LU/x;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Ln1/t$d;->c:LU/x;

    .line 24
    .line 25
    new-instance v0, Landroid/graphics/Path;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance v1, LU/o;

    .line 31
    .line 32
    sget-object v2, Ln1/t;->a:Ln1/t$c;

    .line 33
    .line 34
    const/high16 v6, 0x42c80000    # 100.0f

    .line 35
    .line 36
    const/high16 v7, 0x41c80000    # 25.0f

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    const/4 v4, 0x0

    .line 40
    const/high16 v5, 0x42c80000    # 100.0f

    .line 41
    .line 42
    invoke-virtual/range {v2 .. v7}, Ln1/t$c;->d(FFFFF)LU/x;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-direct {v1, p1, v2}, LU/o;-><init>(LU/x;LU/x;)V

    .line 47
    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    invoke-static {v1, p1, v0}, LU/A;->b(LU/o;FLandroid/graphics/Path;)Landroid/graphics/Path;

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ln1/t$d;->d:Landroid/graphics/Path;

    .line 54
    .line 55
    new-instance p1, Landroid/graphics/Path;

    .line 56
    .line 57
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Ln1/t$d;->e:Landroid/graphics/Path;

    .line 61
    .line 62
    new-instance p1, Landroid/graphics/Matrix;

    .line 63
    .line 64
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Ln1/t$d;->f:Landroid/graphics/Matrix;

    .line 68
    .line 69
    return-void
.end method

.method private final f(Landroid/graphics/Path;FFFLandroid/graphics/Matrix;)V
    .locals 1

    .line 1
    const/16 v0, 0x32

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    div-float/2addr p4, v0

    .line 5
    invoke-virtual {p5, p4, p4}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p5, p2, p3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ln1/t$d;->d:Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-virtual {p0, p5, p1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;FZ)Landroid/animation/ValueAnimator;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ":",
            "Lcom/android/launcher3/views/u;",
            ">(TT;",
            "Landroid/graphics/Rect;",
            "Landroid/graphics/Rect;",
            "FZ)",
            "Landroid/animation/ValueAnimator;"
        }
    .end annotation

    .line 1
    const-string v0, "target"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "startRect"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "endRect"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ln1/t$d;->c:LU/x;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/Matrix;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v1, Landroid/graphics/RectF;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    const/high16 v3, 0x42c80000    # 100.0f

    .line 27
    .line 28
    invoke-direct {v1, v2, v2, v3, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Landroid/graphics/RectF;

    .line 32
    .line 33
    invoke-direct {v2, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 34
    .line 35
    .line 36
    sget-object p2, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2, p2}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 39
    .line 40
    .line 41
    invoke-static {p0, v0}, LU/A;->c(LU/x;Landroid/graphics/Matrix;)LU/x;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget-object v0, Ln1/t;->a:Ln1/t$c;

    .line 46
    .line 47
    iget p2, p3, Landroid/graphics/Rect;->left:I

    .line 48
    .line 49
    int-to-float v1, p2

    .line 50
    iget p2, p3, Landroid/graphics/Rect;->top:I

    .line 51
    .line 52
    int-to-float v2, p2

    .line 53
    iget p2, p3, Landroid/graphics/Rect;->right:I

    .line 54
    .line 55
    int-to-float v3, p2

    .line 56
    iget p2, p3, Landroid/graphics/Rect;->bottom:I

    .line 57
    .line 58
    int-to-float v4, p2

    .line 59
    move v5, p4

    .line 60
    invoke-virtual/range {v0 .. v5}, Ln1/t$c;->d(FFFFF)LU/x;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    new-instance p3, LU/o;

    .line 65
    .line 66
    invoke-direct {p3, p0, p2}, LU/o;-><init>(LU/x;LU/x;)V

    .line 67
    .line 68
    .line 69
    new-instance p0, Ln1/t$b;

    .line 70
    .line 71
    new-instance p2, Ln1/t$d$a;

    .line 72
    .line 73
    invoke-direct {p2, p3}, Ln1/t$d$a;-><init>(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-direct {p0, p1, p2}, Ln1/t$b;-><init>(Landroid/view/View;Lu4/p;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p5}, Ln1/t$b;->a(Z)Landroid/animation/ValueAnimator;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p1, "toAnim(...)"

    .line 84
    .line 85
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-object p0
.end method

.method public c(Landroid/graphics/Path;FFF)V
    .locals 7

    .line 1
    const-string v0, "path"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v6, Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-direct {v6}, Landroid/graphics/Matrix;-><init>()V

    .line 9
    .line 10
    .line 11
    move-object v1, p0

    .line 12
    move-object v2, p1

    .line 13
    move v3, p2

    .line 14
    move v4, p3

    .line 15
    move v5, p4

    .line 16
    invoke-direct/range {v1 .. v6}, Ln1/t$d;->f(Landroid/graphics/Path;FFFLandroid/graphics/Matrix;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public d(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V
    .locals 7

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "paint"

    .line 7
    .line 8
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ln1/t$d;->e:Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Ln1/t$d;->e:Landroid/graphics/Path;

    .line 17
    .line 18
    iget-object v6, p0, Ln1/t$d;->f:Landroid/graphics/Matrix;

    .line 19
    .line 20
    move-object v1, p0

    .line 21
    move v3, p2

    .line 22
    move v4, p3

    .line 23
    move v5, p4

    .line 24
    invoke-direct/range {v1 .. v6}, Ln1/t$d;->f(Landroid/graphics/Path;FFFLandroid/graphics/Matrix;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, v1, Ln1/t$d;->e:Landroid/graphics/Path;

    .line 28
    .line 29
    invoke-virtual {p1, p0, p5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ln1/t$d;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Ln1/t$d;

    .line 12
    .line 13
    iget-object p0, p0, Ln1/t$d;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p1, p1, Ln1/t$d;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    return v0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ln1/t$d;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Ln1/t$d;->b:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "GenericPathShape(pathString="

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p0, ")"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
