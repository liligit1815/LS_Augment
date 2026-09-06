.class Lcom/zte/mifavor/widget/ProgressDrawable$b;
.super Ljava/lang/Object;
.source "ProgressDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/ProgressDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field a:F

.field b:F

.field private c:I

.field private d:Landroid/view/animation/Interpolator;

.field final synthetic e:Lcom/zte/mifavor/widget/ProgressDrawable;


# direct methods
.method public constructor <init>(Lcom/zte/mifavor/widget/ProgressDrawable;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->e:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->c:I

    .line 7
    .line 8
    int-to-float p1, p2

    .line 9
    const/high16 p2, 0x43200000    # 160.0f

    .line 10
    .line 11
    mul-float/2addr p1, p2

    .line 12
    const p2, 0x450fc000    # 2300.0f

    .line 13
    .line 14
    .line 15
    div-float/2addr p1, p2

    .line 16
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->a:F

    .line 17
    .line 18
    const p1, 0x3f26f4df

    .line 19
    .line 20
    .line 21
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->b:F

    .line 22
    .line 23
    new-instance p1, Landroid/view/animation/LinearInterpolator;

    .line 24
    .line 25
    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->d:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public a(F)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->c:I

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    const p1, 0x3dcccccd    # 0.1f

    .line 5
    .line 6
    .line 7
    mul-float/2addr p0, p1

    .line 8
    const/high16 p1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    sub-float/2addr p1, p0

    .line 11
    const/high16 p0, 0x3f000000    # 0.5f

    .line 12
    .line 13
    mul-float/2addr p1, p0

    .line 14
    const/high16 p0, 0x437f0000    # 255.0f

    .line 15
    .line 16
    mul-float/2addr p1, p0

    .line 17
    return p1
.end method

.method public b(F)F
    .locals 4

    .line 1
    iget v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->a:F

    .line 2
    .line 3
    cmpg-float v1, p1, v0

    .line 4
    .line 5
    if-gtz v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget v1, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->b:F

    .line 10
    .line 11
    add-float v2, v1, v0

    .line 12
    .line 13
    cmpl-float v2, p1, v2

    .line 14
    .line 15
    const/high16 v3, 0x43b40000    # 360.0f

    .line 16
    .line 17
    if-ltz v2, :cond_1

    .line 18
    .line 19
    return v3

    .line 20
    :cond_1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->d:Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    sub-float/2addr p1, v0

    .line 23
    div-float/2addr p1, v1

    .line 24
    invoke-interface {p0, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    mul-float/2addr p0, v3

    .line 29
    return p0
.end method

.method public c(F)F
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/ProgressDrawable$b;->b(F)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/high16 v0, 0x438c0000    # 280.0f

    .line 6
    .line 7
    cmpg-float v1, p1, v0

    .line 8
    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    if-gez v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v2}, Lcom/zte/mifavor/widget/ProgressDrawable$b;->a(F)F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    cmpl-float v1, p1, v0

    .line 19
    .line 20
    if-ltz v1, :cond_1

    .line 21
    .line 22
    const/high16 v1, 0x43a00000    # 320.0f

    .line 23
    .line 24
    cmpg-float v1, p1, v1

    .line 25
    .line 26
    if-gtz v1, :cond_1

    .line 27
    .line 28
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 29
    .line 30
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 31
    .line 32
    .line 33
    sub-float/2addr p1, v0

    .line 34
    const/high16 v0, 0x42200000    # 40.0f

    .line 35
    .line 36
    div-float/2addr p1, v0

    .line 37
    invoke-virtual {v1, p1}, Landroid/view/animation/LinearInterpolator;->getInterpolation(F)F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {p0, v2}, Lcom/zte/mifavor/widget/ProgressDrawable$b;->d(F)F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {p0, v2}, Lcom/zte/mifavor/widget/ProgressDrawable$b;->a(F)F

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    sub-float/2addr v0, v1

    .line 50
    mul-float/2addr p1, v0

    .line 51
    invoke-virtual {p0, v2}, Lcom/zte/mifavor/widget/ProgressDrawable$b;->a(F)F

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    add-float/2addr p1, p0

    .line 56
    return p1

    .line 57
    :cond_1
    invoke-virtual {p0, v2}, Lcom/zte/mifavor/widget/ProgressDrawable$b;->d(F)F

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0
.end method

.method public d(F)F
    .locals 2

    .line 1
    const p0, 0x3eef4dea

    .line 2
    .line 3
    .line 4
    cmpg-float v0, p1, p0

    .line 5
    .line 6
    if-gtz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 11
    .line 12
    .line 13
    const/high16 v1, 0x3f000000    # 0.5f

    .line 14
    .line 15
    mul-float/2addr p1, v1

    .line 16
    div-float/2addr p1, p0

    .line 17
    const/high16 p0, 0x3f800000    # 1.0f

    .line 18
    .line 19
    sub-float/2addr p0, p1

    .line 20
    invoke-virtual {v0, p0}, Landroid/view/animation/LinearInterpolator;->getInterpolation(F)F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    mul-float/2addr p0, v1

    .line 25
    const/high16 p1, 0x437f0000    # 255.0f

    .line 26
    .line 27
    mul-float/2addr p0, p1

    .line 28
    return p0

    .line 29
    :cond_0
    const/high16 p0, 0x42ff0000    # 127.5f

    .line 30
    .line 31
    return p0
.end method

.method public e(F)F
    .locals 3

    .line 1
    const v0, 0x3ed5b450

    .line 2
    .line 3
    .line 4
    cmpg-float v1, p1, v0

    .line 5
    .line 6
    if-gtz v1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->e:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->e(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    int-to-float v1, v1

    .line 15
    iget-object v2, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->e:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/zte/mifavor/widget/ProgressDrawable;->d(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->e:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/zte/mifavor/widget/ProgressDrawable;->e(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    sub-int/2addr v2, p0

    .line 28
    int-to-float p0, v2

    .line 29
    sub-float p1, v0, p1

    .line 30
    .line 31
    mul-float/2addr p0, p1

    .line 32
    div-float/2addr p0, v0

    .line 33
    :goto_0
    add-float/2addr v1, p0

    .line 34
    return v1

    .line 35
    :cond_0
    const v1, 0x3f1525d8

    .line 36
    .line 37
    .line 38
    cmpl-float v1, p1, v1

    .line 39
    .line 40
    if-ltz v1, :cond_1

    .line 41
    .line 42
    iget-object v1, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->e:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->e(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    int-to-float v1, v1

    .line 49
    iget-object v2, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->e:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 50
    .line 51
    invoke-static {v2}, Lcom/zte/mifavor/widget/ProgressDrawable;->d(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->e:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 56
    .line 57
    invoke-static {p0}, Lcom/zte/mifavor/widget/ProgressDrawable;->e(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    sub-int/2addr v2, p0

    .line 62
    int-to-float p0, v2

    .line 63
    const/high16 v2, 0x3f800000    # 1.0f

    .line 64
    .line 65
    sub-float p1, v2, p1

    .line 66
    .line 67
    div-float/2addr p1, v0

    .line 68
    sub-float/2addr v2, p1

    .line 69
    mul-float/2addr p0, v2

    .line 70
    goto :goto_0

    .line 71
    :cond_1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$b;->e:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 72
    .line 73
    invoke-static {p0}, Lcom/zte/mifavor/widget/ProgressDrawable;->e(Lcom/zte/mifavor/widget/ProgressDrawable;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    int-to-float p0, p0

    .line 78
    return p0
.end method
