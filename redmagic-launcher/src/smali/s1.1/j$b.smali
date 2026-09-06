.class Ls1/j$b;
.super Ls1/d;
.source "ClockDrawableWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ls1/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "b"
.end annotation


# instance fields
.field public final j:F

.field public final k:Ls1/j$a;

.field public final l:Landroid/graphics/Bitmap;

.field public final m:Ls1/j$a;

.field public final n:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;IFLs1/j$a;Landroid/graphics/Bitmap;Ls1/j$a;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ls1/d;-><init>(Landroid/graphics/Bitmap;I)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    sub-float/2addr p1, p3

    .line 7
    const/high16 p2, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr p1, p2

    .line 10
    const p2, 0x3d0f5c29    # 0.035f

    .line 11
    .line 12
    .line 13
    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Ls1/j$b;->j:F

    .line 18
    .line 19
    iput-object p4, p0, Ls1/j$b;->k:Ls1/j$a;

    .line 20
    .line 21
    iput-object p5, p0, Ls1/j$b;->l:Landroid/graphics/Bitmap;

    .line 22
    .line 23
    iput-object p6, p0, Ls1/j$b;->m:Ls1/j$a;

    .line 24
    .line 25
    iput-object p7, p0, Ls1/j$b;->n:Landroid/graphics/Bitmap;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c()Ls1/d;
    .locals 8

    .line 1
    new-instance v0, Ls1/j$b;

    .line 2
    .line 3
    iget-object v1, p0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iget v2, p0, Ls1/d;->b:I

    .line 6
    .line 7
    const/high16 v3, 0x40000000    # 2.0f

    .line 8
    .line 9
    iget v4, p0, Ls1/j$b;->j:F

    .line 10
    .line 11
    mul-float/2addr v4, v3

    .line 12
    const/high16 v3, 0x3f800000    # 1.0f

    .line 13
    .line 14
    sub-float/2addr v3, v4

    .line 15
    iget-object v4, p0, Ls1/j$b;->k:Ls1/j$a;

    .line 16
    .line 17
    iget-object v5, p0, Ls1/j$b;->l:Landroid/graphics/Bitmap;

    .line 18
    .line 19
    iget-object v6, p0, Ls1/j$b;->m:Ls1/j$a;

    .line 20
    .line 21
    iget-object v7, p0, Ls1/j$b;->n:Landroid/graphics/Bitmap;

    .line 22
    .line 23
    invoke-direct/range {v0 .. v7}, Ls1/j$b;-><init>(Landroid/graphics/Bitmap;IFLs1/j$a;Landroid/graphics/Bitmap;Ls1/j$a;Landroid/graphics/Bitmap;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ls1/d;->d(Ls1/d;)Ls1/d;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ls1/j$b;->c()Ls1/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o(Landroid/content/Context;ILandroid/graphics/Path;)Ls1/o;
    .locals 11
    .annotation build Landroid/annotation/TargetApi;
        value = 0x21
    .end annotation

    .line 1
    and-int/lit8 p3, p2, 0x1

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    iget-object p3, p0, Ls1/j$b;->m:Ls1/j$a;

    .line 7
    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Lu1/c;->v(Landroid/content/Context;)[I

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    iget-object v1, p0, Ls1/j$b;->m:Ls1/j$a;

    .line 15
    .line 16
    iget-object v1, v1, Ls1/j$a;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x1

    .line 27
    aget v2, p3, v2

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Ls1/j$b;->m:Ls1/j$a;

    .line 33
    .line 34
    invoke-virtual {v3, v1}, Ls1/j$a;->b(Landroid/graphics/drawable/Drawable;)Ls1/j$a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v3, p0, Ls1/j$b;->n:Landroid/graphics/Bitmap;

    .line 39
    .line 40
    new-instance v4, Landroid/graphics/BlendModeColorFilter;

    .line 41
    .line 42
    const/4 v5, 0x0

    .line 43
    aget p3, p3, v5

    .line 44
    .line 45
    sget-object v5, Landroid/graphics/BlendMode;->SRC_IN:Landroid/graphics/BlendMode;

    .line 46
    .line 47
    invoke-direct {v4, p3, v5}, Landroid/graphics/BlendModeColorFilter;-><init>(ILandroid/graphics/BlendMode;)V

    .line 48
    .line 49
    .line 50
    move-object v10, v4

    .line 51
    :goto_0
    move-object v8, v1

    .line 52
    move v6, v2

    .line 53
    move-object v9, v3

    .line 54
    goto :goto_1

    .line 55
    :cond_0
    iget-object v1, p0, Ls1/j$b;->k:Ls1/j$a;

    .line 56
    .line 57
    iget-object v3, p0, Ls1/j$b;->l:Landroid/graphics/Bitmap;

    .line 58
    .line 59
    const/4 v2, -0x1

    .line 60
    move-object v10, v0

    .line 61
    goto :goto_0

    .line 62
    :goto_1
    if-nez v8, :cond_1

    .line 63
    .line 64
    invoke-super {p0, p1, p2}, Ls1/d;->n(Landroid/content/Context;I)Ls1/o;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_1
    new-instance v4, Ls1/j$c$a;

    .line 70
    .line 71
    iget v7, p0, Ls1/j$b;->j:F

    .line 72
    .line 73
    move-object v5, p0

    .line 74
    invoke-direct/range {v4 .. v10}, Ls1/j$c$a;-><init>(Ls1/d;IFLs1/j$a;Landroid/graphics/Bitmap;Landroid/graphics/ColorFilter;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v4}, Ls1/o$b;->c()Ls1/o;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v5, p1, p0, p2, v0}, Ls1/d;->a(Landroid/content/Context;Ls1/o;ILandroid/graphics/Path;)V

    .line 82
    .line 83
    .line 84
    return-object p0
.end method
