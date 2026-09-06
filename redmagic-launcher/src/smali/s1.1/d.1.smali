.class public Ls1/d;
.super Ljava/lang/Object;
.source "BitmapInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ls1/d$a;
    }
.end annotation


# static fields
.field public static final h:Landroid/graphics/Bitmap;

.field public static final i:Ls1/d;


# instance fields
.field public final a:Landroid/graphics/Bitmap;

.field public final b:I

.field private c:Ls1/p0;

.field public d:I

.field public e:I

.field private f:Ls1/d;

.field private g:Landroid/graphics/drawable/Drawable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    sget-object v1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 3
    .line 4
    invoke-static {v0, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Ls1/d;->h:Landroid/graphics/Bitmap;

    .line 9
    .line 10
    invoke-static {v0}, Ls1/d;->e(Landroid/graphics/Bitmap;)Ls1/d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Ls1/d;->i:Ls1/d;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    iput p2, p0, Ls1/d;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public static e(Landroid/graphics/Bitmap;)Ls1/d;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ls1/d;->p(Landroid/graphics/Bitmap;I)Ls1/d;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method private g(Landroid/content/Context;ZZLandroid/graphics/Path;)Landroid/graphics/drawable/Drawable;
    .locals 8

    .line 1
    iget-object v0, p0, Ls1/d;->f:Ls1/d;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    or-int/lit8 p2, p2, 0x4

    .line 8
    .line 9
    :cond_0
    invoke-virtual {v0, p1, p2, p4}, Ls1/d;->o(Landroid/content/Context;ILandroid/graphics/Path;)Ls1/o;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_1
    const/4 v0, 0x0

    .line 15
    if-eqz p3, :cond_2

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_2
    iget p0, p0, Ls1/d;->d:I

    .line 19
    .line 20
    and-int/lit8 p3, p0, 0x2

    .line 21
    .line 22
    if-eqz p3, :cond_3

    .line 23
    .line 24
    new-instance v1, Ls1/q0;

    .line 25
    .line 26
    sget v3, Ls1/i0;->f:I

    .line 27
    .line 28
    sget v4, Ls1/g0;->b:I

    .line 29
    .line 30
    move-object v2, p1

    .line 31
    move v5, p2

    .line 32
    move-object v6, p4

    .line 33
    invoke-direct/range {v1 .. v6}, Ls1/q0;-><init>(Landroid/content/Context;IIZLandroid/graphics/Path;)V

    .line 34
    .line 35
    .line 36
    return-object v1

    .line 37
    :cond_3
    move-object v3, p1

    .line 38
    move v6, p2

    .line 39
    move-object v7, p4

    .line 40
    and-int/lit8 p1, p0, 0x1

    .line 41
    .line 42
    if-eqz p1, :cond_4

    .line 43
    .line 44
    new-instance v2, Ls1/q0;

    .line 45
    .line 46
    sget v4, Ls1/i0;->j:I

    .line 47
    .line 48
    sget v5, Ls1/g0;->d:I

    .line 49
    .line 50
    invoke-direct/range {v2 .. v7}, Ls1/q0;-><init>(Landroid/content/Context;IIZLandroid/graphics/Path;)V

    .line 51
    .line 52
    .line 53
    return-object v2

    .line 54
    :cond_4
    and-int/lit8 p1, p0, 0x4

    .line 55
    .line 56
    if-eqz p1, :cond_6

    .line 57
    .line 58
    and-int/lit16 p0, p0, 0x400

    .line 59
    .line 60
    if-eqz p0, :cond_5

    .line 61
    .line 62
    return-object v0

    .line 63
    :cond_5
    new-instance v2, Ls1/q0;

    .line 64
    .line 65
    sget v4, Ls1/i0;->a:I

    .line 66
    .line 67
    sget v5, Ls1/g0;->a:I

    .line 68
    .line 69
    invoke-direct/range {v2 .. v7}, Ls1/q0;-><init>(Landroid/content/Context;IIZLandroid/graphics/Path;)V

    .line 70
    .line 71
    .line 72
    return-object v2

    .line 73
    :cond_6
    and-int/lit8 p0, p0, 0x8

    .line 74
    .line 75
    if-eqz p0, :cond_7

    .line 76
    .line 77
    new-instance v2, Ls1/q0;

    .line 78
    .line 79
    sget v4, Ls1/i0;->g:I

    .line 80
    .line 81
    sget v5, Ls1/g0;->c:I

    .line 82
    .line 83
    invoke-direct/range {v2 .. v7}, Ls1/q0;-><init>(Landroid/content/Context;IIZLandroid/graphics/Path;)V

    .line 84
    .line 85
    .line 86
    return-object v2

    .line 87
    :cond_7
    return-object v0
.end method

.method public static p(Landroid/graphics/Bitmap;I)Ls1/d;
    .locals 1

    .line 1
    new-instance v0, Ls1/d;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ls1/d;-><init>(Landroid/graphics/Bitmap;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method protected a(Landroid/content/Context;Ls1/o;ILandroid/graphics/Path;)V
    .locals 3

    .line 1
    iput p3, p0, Ls1/d;->e:I

    .line 2
    .line 3
    sget v0, Ls1/e0;->a:I

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-static {p1, v0, v1}, Ls1/q;->f(Landroid/content/Context;IF)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p2, Ls1/o;->m:F

    .line 12
    .line 13
    iput p3, p2, Ls1/o;->n:I

    .line 14
    .line 15
    and-int/lit8 v0, p3, 0x2

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    and-int/lit8 v0, p3, 0x1

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    const/4 v2, 0x1

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    move v0, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v0, v1

    .line 28
    :goto_0
    and-int/lit8 p3, p3, 0x4

    .line 29
    .line 30
    if-eqz p3, :cond_1

    .line 31
    .line 32
    move v1, v2

    .line 33
    :cond_1
    invoke-direct {p0, p1, v0, v1, p4}, Ls1/d;->g(Landroid/content/Context;ZZLandroid/graphics/Path;)Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    invoke-virtual {p2, p0}, Ls1/o;->o(Landroid/graphics/drawable/Drawable;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ls1/d;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public c()Ls1/d;
    .locals 3

    .line 1
    new-instance v0, Ls1/d;

    .line 2
    .line 3
    iget-object v1, p0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iget v2, p0, Ls1/d;->b:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ls1/d;-><init>(Landroid/graphics/Bitmap;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ls1/d;->d(Ls1/d;)Ls1/d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ls1/d;->c()Ls1/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method protected d(Ls1/d;)Ls1/d;
    .locals 1

    .line 1
    invoke-static {}, Ls1/b;->M()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ls1/d;->c:Ls1/p0;

    .line 8
    .line 9
    iput-object v0, p1, Ls1/d;->c:Ls1/p0;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ls1/d;->g:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    iput-object v0, p1, Ls1/d;->g:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    :goto_0
    iget v0, p0, Ls1/d;->d:I

    .line 17
    .line 18
    iput v0, p1, Ls1/d;->d:I

    .line 19
    .line 20
    iget-object p0, p0, Ls1/d;->f:Ls1/d;

    .line 21
    .line 22
    iput-object p0, p1, Ls1/d;->f:Ls1/d;

    .line 23
    .line 24
    return-object p1
.end method

.method public f(Landroid/content/Context;ZLandroid/graphics/Path;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0, p3}, Ls1/d;->g(Landroid/content/Context;ZZLandroid/graphics/Path;)Landroid/graphics/drawable/Drawable;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public h()Lt1/g;
    .locals 1

    .line 1
    sget-object v0, Lt1/g;->d:Lt1/g;

    .line 2
    .line 3
    invoke-virtual {p0}, Ls1/d;->k()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {v0, p0}, Lt1/g;->k(Z)Lt1/g;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public i()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/d;->g:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Ls1/p0;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/d;->c:Ls1/p0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k()Z
    .locals 1

    .line 1
    sget-object v0, Ls1/d;->h:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    iget-object p0, p0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    if-ne v0, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final l()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    sget-object v0, Ls1/d;->h:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public m(Landroid/content/Context;)Ls1/o;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ls1/d;->n(Landroid/content/Context;I)Ls1/o;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public n(Landroid/content/Context;I)Ls1/o;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ls1/d;->o(Landroid/content/Context;ILandroid/graphics/Path;)Ls1/o;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public o(Landroid/content/Context;ILandroid/graphics/Path;)Ls1/o;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ls1/d;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ls1/d0;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ls1/d0;-><init>(Ls1/d;Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    and-int/lit8 v0, p2, 0x1

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ls1/d;->c:Ls1/p0;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {v0, p0, p1}, Ls1/p0;->a(Ls1/d;Landroid/content/Context;)Ls1/o;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    new-instance v0, Ls1/o;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ls1/o;-><init>(Ls1/d;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    invoke-virtual {p0, p1, v0, p2, p3}, Ls1/d;->a(Landroid/content/Context;Ls1/o;ILandroid/graphics/Path;)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public q(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ls1/d;->g:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-void
.end method

.method public r(Ls1/p0;)V
    .locals 1

    .line 1
    invoke-static {}, Ls1/b;->M()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-object p1, p0, Ls1/d;->c:Ls1/p0;

    .line 9
    .line 10
    return-void
.end method

.method public s(Ls1/d;)Ls1/d;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ls1/d;->c()Ls1/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p1, p0, Ls1/d;->f:Ls1/d;

    .line 6
    .line 7
    return-object p0
.end method

.method public t(Lcom/android/launcher3/util/p0;)Ls1/d;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/p0;->a:Lcom/android/launcher3/util/p0;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ls1/d;->c()Ls1/d;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget v0, p0, Ls1/d;->d:I

    .line 11
    .line 12
    invoke-interface {p1, v0}, Lcom/android/launcher3/util/p0;->apply(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Ls1/d;->d:I

    .line 17
    .line 18
    return-object p0
.end method
