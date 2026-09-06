.class public Ln1/t$e;
.super Ljava/lang/Object;
.source "ShapeDelegate.kt"

# interfaces
.implements Ln1/t;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ln1/t;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field private final b:F


# direct methods
.method public constructor <init>(F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ln1/t$e;->b:F

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(FFLandroid/graphics/Rect;Landroid/graphics/Rect;FLandroid/graphics/Path;)Lh4/t;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Ln1/t$e;->g(FFLandroid/graphics/Rect;Landroid/graphics/Rect;FLandroid/graphics/Path;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final g(FFLandroid/graphics/Rect;Landroid/graphics/Rect;FLandroid/graphics/Path;)Lh4/t;
    .locals 9

    .line 1
    const-string v0, "path"

    .line 2
    .line 3
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    int-to-float v0, v0

    .line 8
    sub-float/2addr v0, p4

    .line 9
    mul-float/2addr p0, v0

    .line 10
    mul-float/2addr p1, p4

    .line 11
    add-float v6, p0, p1

    .line 12
    .line 13
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 14
    .line 15
    int-to-float p0, p0

    .line 16
    mul-float/2addr p0, v0

    .line 17
    iget p1, p3, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    int-to-float p1, p1

    .line 20
    mul-float/2addr p1, p4

    .line 21
    add-float v2, p0, p1

    .line 22
    .line 23
    iget p0, p2, Landroid/graphics/Rect;->top:I

    .line 24
    .line 25
    int-to-float p0, p0

    .line 26
    mul-float/2addr p0, v0

    .line 27
    iget p1, p3, Landroid/graphics/Rect;->top:I

    .line 28
    .line 29
    int-to-float p1, p1

    .line 30
    mul-float/2addr p1, p4

    .line 31
    add-float v3, p0, p1

    .line 32
    .line 33
    iget p0, p2, Landroid/graphics/Rect;->right:I

    .line 34
    .line 35
    int-to-float p0, p0

    .line 36
    mul-float/2addr p0, v0

    .line 37
    iget p1, p3, Landroid/graphics/Rect;->right:I

    .line 38
    .line 39
    int-to-float p1, p1

    .line 40
    mul-float/2addr p1, p4

    .line 41
    add-float v4, p0, p1

    .line 42
    .line 43
    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    .line 44
    .line 45
    int-to-float p0, p0

    .line 46
    mul-float/2addr v0, p0

    .line 47
    iget p0, p3, Landroid/graphics/Rect;->bottom:I

    .line 48
    .line 49
    int-to-float p0, p0

    .line 50
    mul-float/2addr p4, p0

    .line 51
    add-float v5, v0, p4

    .line 52
    .line 53
    sget-object v8, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 54
    .line 55
    move v7, v6

    .line 56
    move-object v1, p5

    .line 57
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 61
    .line 62
    return-object p0
.end method


# virtual methods
.method public a(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;FZ)Landroid/animation/ValueAnimator;
    .locals 2
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
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v0, v0

    .line 21
    const/high16 v1, 0x40000000    # 2.0f

    .line 22
    .line 23
    div-float/2addr v0, v1

    .line 24
    iget p0, p0, Ln1/t$e;->b:F

    .line 25
    .line 26
    mul-float/2addr v0, p0

    .line 27
    new-instance p0, Ln1/t$b;

    .line 28
    .line 29
    new-instance v1, Ln1/v;

    .line 30
    .line 31
    invoke-direct {v1, v0, p4, p2, p3}, Ln1/v;-><init>(FFLandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, p1, v1}, Ln1/t$b;-><init>(Landroid/view/View;Lu4/p;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p5}, Ln1/t$b;->a(Z)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "toAnim(...)"

    .line 42
    .line 43
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-object p0
.end method

.method public c(Landroid/graphics/Path;FFF)V
    .locals 8

    .line 1
    const-string v0, "path"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    add-float/2addr p2, p4

    .line 7
    add-float/2addr p3, p4

    .line 8
    iget p0, p0, Ln1/t$e;->b:F

    .line 9
    .line 10
    mul-float v5, p4, p0

    .line 11
    .line 12
    sub-float v1, p2, p4

    .line 13
    .line 14
    sub-float v2, p3, p4

    .line 15
    .line 16
    add-float v3, p2, p4

    .line 17
    .line 18
    add-float v4, p3, p4

    .line 19
    .line 20
    sget-object v7, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 21
    .line 22
    move v6, v5

    .line 23
    move-object v0, p1

    .line 24
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public d(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V
    .locals 8

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
    add-float/2addr p2, p4

    .line 12
    add-float/2addr p3, p4

    .line 13
    iget p0, p0, Ln1/t$e;->b:F

    .line 14
    .line 15
    mul-float v5, p4, p0

    .line 16
    .line 17
    sub-float v1, p2, p4

    .line 18
    .line 19
    sub-float v2, p3, p4

    .line 20
    .line 21
    add-float v3, p2, p4

    .line 22
    .line 23
    add-float v4, p3, p4

    .line 24
    .line 25
    move v6, v5

    .line 26
    move-object v0, p1

    .line 27
    move-object v7, p5

    .line 28
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Ln1/t$e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ln1/t$e;

    .line 6
    .line 7
    iget p1, p1, Ln1/t$e;->b:F

    .line 8
    .line 9
    iget p0, p0, Ln1/t$e;->b:F

    .line 10
    .line 11
    cmpg-float p0, p1, p0

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget p0, p0, Ln1/t$e;->b:F

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
