.class public final Lu1/c;
.super Ls1/o;
.source "ThemedIconDrawable.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lu1/c$a;,
        Lu1/c$b;
    }
.end annotation


# static fields
.field public static final G:Lu1/c$a;


# instance fields
.field private final A:Landroid/graphics/Bitmap;

.field private final B:Landroid/graphics/BlendModeColorFilter;

.field private final C:Landroid/graphics/Paint;

.field private final D:Landroid/graphics/Bitmap;

.field private final E:Landroid/graphics/BlendModeColorFilter;

.field private final F:Landroid/graphics/Paint;

.field private final y:I

.field private final z:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lu1/c$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lu1/c$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lu1/c;->G:Lu1/c$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lu1/c$b;)V
    .locals 5

    .line 1
    const-string v0, "constantState"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lu1/c$b;->e()Ls1/d;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p0, v0}, Ls1/o;-><init>(Ls1/d;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lu1/c$b;->g()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lu1/c;->y:I

    .line 18
    .line 19
    invoke-virtual {p1}, Lu1/c$b;->f()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, p0, Lu1/c;->z:I

    .line 24
    .line 25
    invoke-virtual {p1}, Lu1/c$b;->h()Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iput-object v2, p0, Lu1/c;->A:Landroid/graphics/Bitmap;

    .line 30
    .line 31
    new-instance v2, Landroid/graphics/BlendModeColorFilter;

    .line 32
    .line 33
    sget-object v3, Landroid/graphics/BlendMode;->SRC_IN:Landroid/graphics/BlendMode;

    .line 34
    .line 35
    invoke-direct {v2, v0, v3}, Landroid/graphics/BlendModeColorFilter;-><init>(ILandroid/graphics/BlendMode;)V

    .line 36
    .line 37
    .line 38
    iput-object v2, p0, Lu1/c;->B:Landroid/graphics/BlendModeColorFilter;

    .line 39
    .line 40
    new-instance v0, Landroid/graphics/Paint;

    .line 41
    .line 42
    const/4 v4, 0x3

    .line 43
    invoke-direct {v0, v4}, Landroid/graphics/Paint;-><init>(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lu1/c;->C:Landroid/graphics/Paint;

    .line 50
    .line 51
    invoke-virtual {p1}, Lu1/c$b;->i()Landroid/graphics/Bitmap;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Lu1/c;->D:Landroid/graphics/Bitmap;

    .line 56
    .line 57
    new-instance p1, Landroid/graphics/BlendModeColorFilter;

    .line 58
    .line 59
    invoke-direct {p1, v1, v3}, Landroid/graphics/BlendModeColorFilter;-><init>(ILandroid/graphics/BlendMode;)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Lu1/c;->E:Landroid/graphics/BlendModeColorFilter;

    .line 63
    .line 64
    new-instance v0, Landroid/graphics/Paint;

    .line 65
    .line 66
    invoke-direct {v0, v4}, Landroid/graphics/Paint;-><init>(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Lu1/c;->F:Landroid/graphics/Paint;

    .line 73
    .line 74
    return-void
.end method

.method public static final v(Landroid/content/Context;)[I
    .locals 1

    .line 1
    sget-object v0, Lu1/c;->G:Lu1/c$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lu1/c$a;->a(Landroid/content/Context;)[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method protected c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "bounds"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lu1/c;->D:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    iget-object v1, p0, Lu1/c;->F:Landroid/graphics/Paint;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p1, v0, v2, p2, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lu1/c;->A:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    iget-object p0, p0, Lu1/c;->C:Landroid/graphics/Paint;

    .line 22
    .line 23
    invoke-virtual {p1, v0, v2, p2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public i()I
    .locals 0

    .line 1
    iget p0, p0, Lu1/c;->y:I

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public bridge synthetic m()Ls1/o$b;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lu1/c;->w()Lu1/c$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method protected u()V
    .locals 5

    .line 1
    invoke-super {p0}, Ls1/o;->u()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ls1/o;->l:Z

    .line 5
    .line 6
    const/16 v1, 0xff

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget v0, p0, Ls1/o;->m:F

    .line 11
    .line 12
    int-to-float v1, v1

    .line 13
    mul-float/2addr v0, v1

    .line 14
    float-to-int v1, v0

    .line 15
    :cond_0
    iget-object v0, p0, Lu1/c;->F:Landroid/graphics/Paint;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lu1/c;->F:Landroid/graphics/Paint;

    .line 21
    .line 22
    iget-boolean v2, p0, Ls1/o;->l:Z

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    new-instance v2, Landroid/graphics/BlendModeColorFilter;

    .line 27
    .line 28
    iget v3, p0, Lu1/c;->z:I

    .line 29
    .line 30
    invoke-static {v3}, Ls1/o;->f(I)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    sget-object v4, Landroid/graphics/BlendMode;->SRC_IN:Landroid/graphics/BlendMode;

    .line 35
    .line 36
    invoke-direct {v2, v3, v4}, Landroid/graphics/BlendModeColorFilter;-><init>(ILandroid/graphics/BlendMode;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object v2, p0, Lu1/c;->E:Landroid/graphics/BlendModeColorFilter;

    .line 41
    .line 42
    :goto_0
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lu1/c;->C:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lu1/c;->C:Landroid/graphics/Paint;

    .line 51
    .line 52
    iget-boolean v1, p0, Ls1/o;->l:Z

    .line 53
    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    new-instance v1, Landroid/graphics/BlendModeColorFilter;

    .line 57
    .line 58
    iget p0, p0, Lu1/c;->y:I

    .line 59
    .line 60
    invoke-static {p0}, Ls1/o;->f(I)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    sget-object v2, Landroid/graphics/BlendMode;->SRC_IN:Landroid/graphics/BlendMode;

    .line 65
    .line 66
    invoke-direct {v1, p0, v2}, Landroid/graphics/BlendModeColorFilter;-><init>(ILandroid/graphics/BlendMode;)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    iget-object v1, p0, Lu1/c;->B:Landroid/graphics/BlendModeColorFilter;

    .line 71
    .line 72
    :goto_1
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method protected w()Lu1/c$b;
    .locals 6

    .line 1
    new-instance v0, Lu1/c$b;

    .line 2
    .line 3
    iget-object v1, p0, Ls1/o;->h:Ls1/d;

    .line 4
    .line 5
    const-string v2, "mBitmapInfo"

    .line 6
    .line 7
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lu1/c;->A:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    iget-object v3, p0, Lu1/c;->D:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    iget v4, p0, Lu1/c;->z:I

    .line 15
    .line 16
    iget v5, p0, Lu1/c;->y:I

    .line 17
    .line 18
    invoke-direct/range {v0 .. v5}, Lu1/c$b;-><init>(Ls1/d;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method
