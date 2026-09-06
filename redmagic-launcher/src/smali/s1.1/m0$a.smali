.class public Ls1/m0$a;
.super Ljava/lang/Object;
.source "ShadowGenerator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ls1/m0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/graphics/RectF;

.field public final b:I

.field public c:I

.field public d:F

.field public e:F

.field public f:I

.field public g:F


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ls1/m0$a;->a:Landroid/graphics/RectF;

    .line 10
    .line 11
    const/16 v0, 0x19

    .line 12
    .line 13
    iput v0, p0, Ls1/m0$a;->c:I

    .line 14
    .line 15
    const/4 v0, 0x7

    .line 16
    iput v0, p0, Ls1/m0$a;->f:I

    .line 17
    .line 18
    iput p1, p0, Ls1/m0$a;->b:I

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a(II)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    int-to-float v0, p2

    .line 2
    const/high16 v1, 0x40000000    # 2.0f

    .line 3
    .line 4
    div-float/2addr v0, v1

    .line 5
    invoke-virtual {p0, p1, p2, v0}, Ls1/m0$a;->b(IIF)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public b(IIF)Landroid/graphics/Bitmap;
    .locals 4

    .line 1
    iput p3, p0, Ls1/m0$a;->g:F

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    const/high16 p3, 0x40000000    # 2.0f

    .line 5
    .line 6
    div-float v0, p1, p3

    .line 7
    .line 8
    iget v1, p0, Ls1/m0$a;->d:F

    .line 9
    .line 10
    add-float/2addr v1, v0

    .line 11
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget v2, p0, Ls1/m0$a;->g:F

    .line 16
    .line 17
    iget v3, p0, Ls1/m0$a;->d:F

    .line 18
    .line 19
    add-float/2addr v2, v3

    .line 20
    iget v3, p0, Ls1/m0$a;->e:F

    .line 21
    .line 22
    add-float/2addr v2, v3

    .line 23
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget-object v2, p0, Ls1/m0$a;->a:Landroid/graphics/RectF;

    .line 32
    .line 33
    int-to-float p2, p2

    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-virtual {v2, v3, v3, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ls1/m0$a;->a:Landroid/graphics/RectF;

    .line 39
    .line 40
    int-to-float v2, v1

    .line 41
    sub-float v0, v2, v0

    .line 42
    .line 43
    div-float/2addr p2, p3

    .line 44
    sub-float/2addr v2, p2

    .line 45
    invoke-virtual {p1, v0, v2}, Landroid/graphics/RectF;->offsetTo(FF)V

    .line 46
    .line 47
    .line 48
    mul-int/lit8 v1, v1, 0x2

    .line 49
    .line 50
    new-instance p1, Ls1/l0;

    .line 51
    .line 52
    invoke-direct {p1, p0}, Ls1/l0;-><init>(Ls1/m0$a;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v1, p1}, Ls1/e;->a(IILs1/e;)Landroid/graphics/Bitmap;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public c(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iget v1, p0, Ls1/m0$a;->b:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 10
    .line 11
    .line 12
    iget v1, p0, Ls1/m0$a;->b:I

    .line 13
    .line 14
    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/16 v2, 0xff

    .line 19
    .line 20
    if-ge v1, v2, :cond_0

    .line 21
    .line 22
    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    .line 23
    .line 24
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 25
    .line 26
    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 33
    .line 34
    .line 35
    const/high16 v1, -0x1000000

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ls1/m0$a;->a:Landroid/graphics/RectF;

    .line 41
    .line 42
    iget v2, p0, Ls1/m0$a;->g:F

    .line 43
    .line 44
    invoke-virtual {p1, v1, v2, v2, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 45
    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 49
    .line 50
    .line 51
    iget v1, p0, Ls1/m0$a;->b:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ls1/m0$a;->a:Landroid/graphics/RectF;

    .line 57
    .line 58
    iget p0, p0, Ls1/m0$a;->g:F

    .line 59
    .line 60
    invoke-virtual {p1, v1, p0, p0, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public d(I)Ls1/m0$a;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput p1, p0, Ls1/m0$a;->d:F

    .line 3
    .line 4
    iput p1, p0, Ls1/m0$a;->e:F

    .line 5
    .line 6
    return-object p0
.end method
