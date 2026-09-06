.class public final Lu1/a;
.super Ljava/lang/Object;
.source "MonoIconThemeController.kt"

# interfaces
.implements Ls1/U;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x21
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lu1/a$b;
    }
.end annotation


# instance fields
.field private final a:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Landroid/content/Context;",
            "[I>;"
        }
    .end annotation
.end field

.field private final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lu4/l;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-",
            "Landroid/content/Context;",
            "[I>;)V"
        }
    .end annotation

    const-string v0, "colorProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lu1/a;->a:Lu4/l;

    .line 3
    const-string p1, "with-theme"

    iput-object p1, p0, Lu1/a;->b:Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Lu4/l;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 4
    new-instance p1, Lu1/a$a;

    sget-object p2, Lu1/c;->G:Lu1/c$a;

    invoke-direct {p1, p2}, Lu1/a$a;-><init>(Ljava/lang/Object;)V

    .line 5
    :cond_0
    invoke-direct {p0, p1}, Lu1/a;-><init>(Lu4/l;)V

    return-void
.end method

.method private final e(Landroid/graphics/drawable/AdaptiveIconDrawable;Ls1/d;Landroid/graphics/Path;FZZ)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getMonochrome()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p1, Lu1/a$b;

    .line 8
    .line 9
    invoke-direct {p1, p0, p3, p4}, Lu1/a$b;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/Path;F)V

    .line 10
    .line 11
    .line 12
    return-object p1

    .line 13
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->k0()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    if-eqz p6, :cond_1

    .line 20
    .line 21
    if-nez p5, :cond_1

    .line 22
    .line 23
    new-instance p0, Ls1/b0;

    .line 24
    .line 25
    iget-object p2, p2, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 26
    .line 27
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-direct {p0, p2}, Ls1/b0;-><init>(I)V

    .line 32
    .line 33
    .line 34
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p0, p1, p3, p2}, Ls1/b0;->c(Landroid/graphics/drawable/AdaptiveIconDrawable;Landroid/graphics/Path;Ljava/lang/Float;)Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_1
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/graphics/drawable/AdaptiveIconDrawable;Ls1/d;)Landroid/graphics/drawable/AdaptiveIconDrawable;
    .locals 2

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "originalIcon"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lu1/a;->a:Lu4/l;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, [I

    .line 18
    .line 19
    invoke-virtual {p2}, Landroid/graphics/drawable/AdaptiveIconDrawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getMonochrome()Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 p2, 0x0

    .line 27
    const/4 v0, 0x1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    aget v1, p0, v0

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object p1, p2

    .line 37
    :goto_0
    if-nez p1, :cond_1

    .line 38
    .line 39
    if-eqz p3, :cond_1

    .line 40
    .line 41
    invoke-virtual {p3}, Ls1/d;->j()Ls1/p0;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    if-eqz p3, :cond_1

    .line 46
    .line 47
    instance-of v1, p3, Lu1/b;

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 52
    .line 53
    check-cast p3, Lu1/b;

    .line 54
    .line 55
    invoke-virtual {p3}, Lu1/b;->b()Landroid/graphics/Bitmap;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-direct {p1, p3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 60
    .line 61
    .line 62
    new-instance p3, Landroid/graphics/BlendModeColorFilter;

    .line 63
    .line 64
    aget v0, p0, v0

    .line 65
    .line 66
    sget-object v1, Landroid/graphics/BlendMode;->SRC_IN:Landroid/graphics/BlendMode;

    .line 67
    .line 68
    invoke-direct {p3, v0, v1}, Landroid/graphics/BlendModeColorFilter;-><init>(ILandroid/graphics/BlendMode;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p3}, Landroid/graphics/drawable/BitmapDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getExtraInsetFraction()F

    .line 75
    .line 76
    .line 77
    move-result p3

    .line 78
    const/4 v0, 0x2

    .line 79
    int-to-float v0, v0

    .line 80
    div-float/2addr p3, v0

    .line 81
    new-instance v0, Landroid/graphics/drawable/InsetDrawable;

    .line 82
    .line 83
    invoke-direct {v0, p1, p3}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;F)V

    .line 84
    .line 85
    .line 86
    move-object p1, v0

    .line 87
    :cond_1
    if-eqz p1, :cond_2

    .line 88
    .line 89
    new-instance p2, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 90
    .line 91
    new-instance p3, Landroid/graphics/drawable/ColorDrawable;

    .line 92
    .line 93
    const/4 v0, 0x0

    .line 94
    aget p0, p0, v0

    .line 95
    .line 96
    invoke-direct {p3, p0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 97
    .line 98
    .line 99
    invoke-direct {p2, p3, p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    return-object p2
.end method

.method public b([BLs1/d;Ls1/b;Ls1/n0;)Ls1/p0;
    .locals 2

    .line 1
    const-string v0, "data"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "info"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "factory"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "sourceHint"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p2, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 22
    .line 23
    const-string p4, "icon"

    .line 24
    .line 25
    invoke-static {p2, p4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    array-length p4, p1

    .line 29
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    mul-int/2addr v0, v1

    .line 38
    if-eq p4, v0, :cond_0

    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return-object p0

    .line 42
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result p4

    .line 46
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    sget-object v0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 51
    .line 52
    invoke-static {p4, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    const-string p4, "createBitmap(...)"

    .line 57
    .line 58
    invoke-static {p2, p4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p2, p1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 66
    .line 67
    .line 68
    new-instance p1, Lu1/b;

    .line 69
    .line 70
    invoke-virtual {p3}, Ls1/b;->b0()Landroid/graphics/Bitmap;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    const-string p4, "getWhiteShadowLayer(...)"

    .line 75
    .line 76
    invoke-static {p3, p4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lu1/a;->a:Lu4/l;

    .line 80
    .line 81
    invoke-direct {p1, p2, p3, p0}, Lu1/b;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Lu4/l;)V

    .line 82
    .line 83
    .line 84
    return-object p1
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lu1/a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/graphics/drawable/AdaptiveIconDrawable;Ls1/d;Ls1/b;Ls1/n0;)Ls1/p0;
    .locals 11

    .line 1
    const-string v0, "icon"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "info"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "factory"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Landroid/graphics/Rect;

    .line 17
    .line 18
    iget-object v1, p2, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object v2, p2, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p3, p1, v0}, Ls1/b;->T(Landroid/graphics/drawable/AdaptiveIconDrawable;Landroid/graphics/Rect;)Landroid/graphics/Path;

    .line 35
    .line 36
    .line 37
    move-result-object v7

    .line 38
    const-string v0, "getShapePath(...)"

    .line 39
    .line 40
    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p3}, Ls1/b;->L()F

    .line 44
    .line 45
    .line 46
    move-result v8

    .line 47
    if-eqz p4, :cond_0

    .line 48
    .line 49
    invoke-virtual {p4}, Ls1/n0;->c()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    :cond_0
    move v9, v3

    .line 54
    invoke-virtual {p3}, Ls1/b;->k0()Z

    .line 55
    .line 56
    .line 57
    move-result v10

    .line 58
    move-object v4, p0

    .line 59
    move-object v5, p1

    .line 60
    move-object v6, p2

    .line 61
    invoke-direct/range {v4 .. v10}, Lu1/a;->e(Landroid/graphics/drawable/AdaptiveIconDrawable;Ls1/d;Landroid/graphics/Path;FZZ)Landroid/graphics/drawable/Drawable;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    if-eqz p0, :cond_1

    .line 66
    .line 67
    new-instance p1, Lu1/b;

    .line 68
    .line 69
    const p2, 0x3f6b851f    # 0.92f

    .line 70
    .line 71
    .line 72
    const/4 p4, 0x1

    .line 73
    invoke-virtual {p3, p0, p2, p4}, Ls1/b;->n(Landroid/graphics/drawable/Drawable;FI)Landroid/graphics/Bitmap;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string p2, "createIconBitmap(...)"

    .line 78
    .line 79
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p3}, Ls1/b;->b0()Landroid/graphics/Bitmap;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    const-string p3, "getWhiteShadowLayer(...)"

    .line 87
    .line 88
    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p3, v4, Lu1/a;->a:Lu4/l;

    .line 92
    .line 93
    invoke-direct {p1, p0, p2, p3}, Lu1/b;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Lu4/l;)V

    .line 94
    .line 95
    .line 96
    return-object p1

    .line 97
    :cond_1
    const/4 p0, 0x0

    .line 98
    return-object p0
.end method
