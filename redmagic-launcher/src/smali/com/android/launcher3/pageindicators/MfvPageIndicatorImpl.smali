.class public Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;
.super Lcom/android/launcher3/pageindicators/c;
.source "MfvPageIndicatorImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;
    }
.end annotation


# instance fields
.field private final A:F

.field private final B:F

.field private C:Lcom/android/quickstep/util/animation/SpringAnimationImpl;

.field private q:F

.field private r:F

.field private final s:F

.field private final t:F

.field private final u:F

.field private v:Landroid/view/ViewGroup;

.field private w:I

.field private x:Z

.field public y:Z

.field private z:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/pageindicators/c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const v0, 0x7fffffff

    .line 3
    iput v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->w:I

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->x:Z

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->y:Z

    const/4 v1, 0x0

    .line 6
    iput v1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->z:F

    const/high16 v2, 0x3f800000    # 1.0f

    .line 7
    iput v2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->B:F

    .line 8
    sget-object v2, Lcom/android/launcher3/x5;->b2:[I

    invoke-virtual {p1, p2, v2, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 p3, -0x1

    .line 9
    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    .line 10
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v2, 0x7f0709bb

    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iput p2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v2, 0x7f0709b9

    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iput p2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    .line 13
    invoke-static {}, Lx1/O;->k1()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v2, 0x7f0709bc

    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iput p2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v2, 0x7f0709ba

    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iput p2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    :cond_0
    if-ltz p3, :cond_1

    int-to-float p2, p3

    .line 16
    iput p2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    .line 17
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0709b8

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iput p2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->s:F

    .line 18
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0709d1

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->t:F

    .line 19
    iget-object p3, p0, Lcom/android/launcher3/pageindicators/c;->h:Landroid/graphics/Paint;

    invoke-virtual {p3, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 20
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0709d2

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->A:F

    .line 21
    iget-object p3, p0, Lcom/android/launcher3/pageindicators/c;->i:Landroid/graphics/Paint;

    invoke-virtual {p3, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 22
    new-instance p2, Lcom/android/launcher3/pageindicators/c$a;

    sget-object p3, Lcom/android/launcher3/pageindicators/b;->g:Lcom/android/launcher3/pageindicators/b;

    invoke-direct {p2, p0, p3}, Lcom/android/launcher3/pageindicators/c$a;-><init>(Lcom/android/launcher3/pageindicators/c;Lcom/android/launcher3/pageindicators/b;)V

    iput-object p2, p0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    .line 23
    iget p3, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    const/high16 v2, 0x40800000    # 4.0f

    div-float/2addr p3, v2

    const/high16 v2, 0x40400000    # 3.0f

    mul-float/2addr p3, v2

    iput p3, p2, Lcom/android/launcher3/pageindicators/c$a;->b:F

    .line 24
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-static {}, Lx1/O;->k1()Z

    move-result p2

    if-nez p2, :cond_2

    .line 25
    iget-object p2, p0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    iget p3, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    const v2, 0x3f8f5c29    # 1.12f

    mul-float/2addr p3, v2

    iput p3, p2, Lcom/android/launcher3/pageindicators/c$a;->b:F

    .line 26
    :cond_2
    iget p2, p0, Lcom/android/launcher3/pageindicators/c;->k:I

    const/4 p3, 0x1

    if-ne p2, p3, :cond_3

    move p2, v1

    goto :goto_0

    :cond_3
    iget p2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr p2, v2

    :goto_0
    iput p2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->z:F

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result p2

    const v2, 0x7f0b03c3

    if-ne p2, v2, :cond_4

    .line 28
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/launcher3/resource/B;->s()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    move-result-object p2

    iget-boolean p2, p2, Lcom/android/launcher3/r4;->G:Z

    if-eqz p2, :cond_4

    move v0, p3

    :cond_4
    iput-boolean v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->y:Z

    if-eqz v0, :cond_5

    const/4 p2, 0x2

    .line 30
    iput p2, p0, Lcom/android/launcher3/pageindicators/c;->k:I

    .line 31
    iput v1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->z:F

    .line 32
    :cond_5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0709d0

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->u:F

    .line 33
    new-instance p1, Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    invoke-direct {p1, p0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->C:Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    return-void
.end method

.method private getPageViewChildCount()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->v:Landroid/view/ViewGroup;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/android/launcher3/V4;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/android/launcher3/V4;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    check-cast p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;

    .line 19
    .line 20
    invoke-interface {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;->getPageViewChildCount()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private getPageViewCurrentPageIndex()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->v:Landroid/view/ViewGroup;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/android/launcher3/V4;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/android/launcher3/V4;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    check-cast p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;

    .line 19
    .line 20
    invoke-interface {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;->getPageViewCurrentPageIndex()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private getPageViewNormalChildWidth()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->v:Landroid/view/ViewGroup;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/android/launcher3/V4;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/android/launcher3/V4;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNormalChildWidth()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    check-cast p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;

    .line 19
    .line 20
    invoke-interface {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;->getPageViewNormalChildWidth()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private getPageViewPageCount()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->v:Landroid/view/ViewGroup;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/android/launcher3/V4;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/android/launcher3/V4;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    check-cast p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;

    .line 19
    .line 20
    invoke-interface {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;->getPageViewPageCount()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private getPageViewScrollX()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->v:Landroid/view/ViewGroup;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/android/launcher3/V4;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/android/launcher3/V4;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    check-cast p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;

    .line 19
    .line 20
    invoke-interface {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl$a;->getPageViewScrollX()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private h(I)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/c;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/lit8 p0, p0, -0x1

    .line 12
    .line 13
    sub-int/2addr p0, p1

    .line 14
    return p0

    .line 15
    :cond_0
    return p1
.end method

.method private i([F[F)F
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    aget v0, p1, p0

    .line 3
    .line 4
    aget p0, p2, p0

    .line 5
    .line 6
    sub-float/2addr v0, p0

    .line 7
    const/4 p0, 0x1

    .line 8
    aget p1, p1, p0

    .line 9
    .line 10
    aget p0, p2, p0

    .line 11
    .line 12
    sub-float/2addr p1, p0

    .line 13
    mul-float/2addr v0, v0

    .line 14
    mul-float/2addr p1, p1

    .line 15
    add-float/2addr v0, p1

    .line 16
    float-to-double p0, v0

    .line 17
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 18
    .line 19
    .line 20
    move-result-wide p0

    .line 21
    double-to-float p0, p0

    .line 22
    return p0
.end method

.method private j([F)F
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    aget p0, p1, p0

    .line 3
    .line 4
    mul-float/2addr p0, p0

    .line 5
    const/4 v0, 0x1

    .line 6
    aget p1, p1, v0

    .line 7
    .line 8
    mul-float/2addr p1, p1

    .line 9
    add-float/2addr p0, p1

    .line 10
    float-to-double p0, p0

    .line 11
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 12
    .line 13
    .line 14
    move-result-wide p0

    .line 15
    double-to-float p0, p0

    .line 16
    return p0
.end method

.method private k(I)I
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getPageViewChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/android/launcher3/pageindicators/c;->k:I

    .line 6
    .line 7
    if-gt v0, v1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->h(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    if-le v0, v1, :cond_3

    .line 15
    .line 16
    div-int/lit8 v2, v1, 0x2

    .line 17
    .line 18
    sub-int/2addr v0, v2

    .line 19
    add-int/lit8 v0, v0, -0x1

    .line 20
    .line 21
    if-lt p1, v2, :cond_1

    .line 22
    .line 23
    if-gt p1, v0, :cond_1

    .line 24
    .line 25
    div-int/lit8 v1, v1, 0x2

    .line 26
    .line 27
    return v1

    .line 28
    :cond_1
    if-ge p1, v2, :cond_2

    .line 29
    .line 30
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->h(I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_2
    if-le p1, v0, :cond_3

    .line 36
    .line 37
    sub-int/2addr v0, v2

    .line 38
    sub-int/2addr p1, v0

    .line 39
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->h(I)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0

    .line 44
    :cond_3
    const p0, 0x7fffffff

    .line 45
    .line 46
    .line 47
    return p0
.end method

.method private l(FF)[F
    .locals 4

    .line 1
    float-to-double p0, p1

    .line 2
    invoke-static {p0, p1}, Ljava/lang/Math;->cos(D)D

    .line 3
    .line 4
    .line 5
    move-result-wide v0

    .line 6
    float-to-double v2, p2

    .line 7
    mul-double/2addr v0, v2

    .line 8
    double-to-float p2, v0

    .line 9
    invoke-static {p0, p1}, Ljava/lang/Math;->sin(D)D

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    mul-double/2addr p0, v2

    .line 14
    double-to-float p0, p0

    .line 15
    const/4 p1, 0x2

    .line 16
    new-array p1, p1, [F

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    aput p2, p1, v0

    .line 20
    .line 21
    const/4 p2, 0x1

    .line 22
    aput p0, p1, p2

    .line 23
    .line 24
    return-object p1
.end method

.method private m()V
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    move v3, v2

    .line 5
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v4

    .line 11
    if-ge v3, v4, :cond_7

    .line 12
    .line 13
    iget-object v4, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    check-cast v4, Lcom/android/launcher3/pageindicators/c$a;

    .line 20
    .line 21
    iget v5, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 22
    .line 23
    iput v5, v4, Lcom/android/launcher3/pageindicators/c$a;->b:F

    .line 24
    .line 25
    iget-object v6, v4, Lcom/android/launcher3/pageindicators/c$a;->c:Lcom/android/launcher3/pageindicators/b;

    .line 26
    .line 27
    sget-object v7, Lcom/android/launcher3/pageindicators/b;->h:Lcom/android/launcher3/pageindicators/b;

    .line 28
    .line 29
    const/4 v8, 0x0

    .line 30
    const/high16 v9, 0x40000000    # 2.0f

    .line 31
    .line 32
    if-ne v6, v7, :cond_2

    .line 33
    .line 34
    iget v6, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->t:F

    .line 35
    .line 36
    add-float v7, v5, v6

    .line 37
    .line 38
    mul-float/2addr v7, v9

    .line 39
    iget v10, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    .line 40
    .line 41
    add-float/2addr v7, v10

    .line 42
    int-to-float v10, v3

    .line 43
    mul-float/2addr v7, v10

    .line 44
    add-float/2addr v5, v6

    .line 45
    add-float/2addr v7, v5

    .line 46
    invoke-static {}, Lx1/O;->k1()Z

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    if-eqz v5, :cond_0

    .line 51
    .line 52
    iget v8, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_0
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    if-eqz v5, :cond_1

    .line 60
    .line 61
    iget v5, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    .line 62
    .line 63
    div-float v8, v5, v9

    .line 64
    .line 65
    :cond_1
    :goto_1
    add-float/2addr v7, v8

    .line 66
    iget v5, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 67
    .line 68
    iget v6, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->t:F

    .line 69
    .line 70
    add-float/2addr v5, v6

    .line 71
    mul-float/2addr v5, v9

    .line 72
    new-array v6, v0, [F

    .line 73
    .line 74
    aput v7, v6, v2

    .line 75
    .line 76
    aput v5, v6, v1

    .line 77
    .line 78
    iput-object v6, v4, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_2
    mul-float v6, v5, v9

    .line 82
    .line 83
    iget v7, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    .line 84
    .line 85
    add-float/2addr v6, v7

    .line 86
    int-to-float v7, v3

    .line 87
    mul-float/2addr v6, v7

    .line 88
    add-float/2addr v6, v5

    .line 89
    invoke-static {}, Lx1/O;->k1()Z

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    if-eqz v5, :cond_3

    .line 94
    .line 95
    iget v8, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_3
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    if-eqz v5, :cond_4

    .line 103
    .line 104
    iget v5, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    .line 105
    .line 106
    div-float v8, v5, v9

    .line 107
    .line 108
    :cond_4
    :goto_2
    add-float/2addr v6, v8

    .line 109
    iget v5, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 110
    .line 111
    mul-float/2addr v5, v9

    .line 112
    new-array v7, v0, [F

    .line 113
    .line 114
    aput v6, v7, v2

    .line 115
    .line 116
    aput v5, v7, v1

    .line 117
    .line 118
    iput-object v7, v4, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 119
    .line 120
    :goto_3
    if-eqz v3, :cond_5

    .line 121
    .line 122
    iget v5, p0, Lcom/android/launcher3/pageindicators/c;->p:I

    .line 123
    .line 124
    if-ne v3, v5, :cond_6

    .line 125
    .line 126
    :cond_5
    iget-object v5, p0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    .line 127
    .line 128
    iget-object v4, v4, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 129
    .line 130
    aget v6, v4, v2

    .line 131
    .line 132
    aget v4, v4, v1

    .line 133
    .line 134
    new-array v7, v0, [F

    .line 135
    .line 136
    aput v6, v7, v2

    .line 137
    .line 138
    aput v4, v7, v1

    .line 139
    .line 140
    iput-object v7, v5, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 141
    .line 142
    :cond_6
    add-int/2addr v3, v1

    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :cond_7
    return-void
.end method

.method private n(FF)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 p1, 0x40400000    # 3.0f

    .line 6
    .line 7
    sub-float/2addr p2, p1

    .line 8
    cmpl-float p0, p0, p2

    .line 9
    .line 10
    if-ltz p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method private o(Landroid/graphics/Canvas;IFFF)V
    .locals 29

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v9, p3

    .line 6
    .line 7
    iget-object v2, v0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    .line 8
    .line 9
    iget-object v3, v0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 10
    .line 11
    move/from16 v4, p2

    .line 12
    .line 13
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Lcom/android/launcher3/pageindicators/c$a;

    .line 18
    .line 19
    new-instance v4, Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v5, v2, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 25
    .line 26
    const/4 v10, 0x0

    .line 27
    aget v6, v5, v10

    .line 28
    .line 29
    iget v2, v2, Lcom/android/launcher3/pageindicators/c$a;->b:F

    .line 30
    .line 31
    sub-float/2addr v6, v2

    .line 32
    iput v6, v4, Landroid/graphics/RectF;->left:F

    .line 33
    .line 34
    const/4 v11, 0x1

    .line 35
    aget v5, v5, v11

    .line 36
    .line 37
    sub-float/2addr v5, v2

    .line 38
    iput v5, v4, Landroid/graphics/RectF;->top:F

    .line 39
    .line 40
    const/high16 v12, 0x40000000    # 2.0f

    .line 41
    .line 42
    mul-float v7, v2, v12

    .line 43
    .line 44
    add-float/2addr v6, v7

    .line 45
    iput v6, v4, Landroid/graphics/RectF;->right:F

    .line 46
    .line 47
    mul-float/2addr v2, v12

    .line 48
    add-float/2addr v5, v2

    .line 49
    iput v5, v4, Landroid/graphics/RectF;->bottom:F

    .line 50
    .line 51
    new-instance v7, Landroid/graphics/RectF;

    .line 52
    .line 53
    invoke-direct {v7}, Landroid/graphics/RectF;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object v2, v3, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 57
    .line 58
    aget v5, v2, v10

    .line 59
    .line 60
    iget v6, v3, Lcom/android/launcher3/pageindicators/c$a;->b:F

    .line 61
    .line 62
    sub-float/2addr v5, v6

    .line 63
    iput v5, v7, Landroid/graphics/RectF;->left:F

    .line 64
    .line 65
    aget v2, v2, v11

    .line 66
    .line 67
    sub-float/2addr v2, v6

    .line 68
    iput v2, v7, Landroid/graphics/RectF;->top:F

    .line 69
    .line 70
    mul-float v8, v6, v12

    .line 71
    .line 72
    add-float/2addr v5, v8

    .line 73
    iput v5, v7, Landroid/graphics/RectF;->right:F

    .line 74
    .line 75
    mul-float/2addr v6, v12

    .line 76
    add-float/2addr v2, v6

    .line 77
    iput v2, v7, Landroid/graphics/RectF;->bottom:F

    .line 78
    .line 79
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    const/4 v13, 0x2

    .line 88
    new-array v14, v13, [F

    .line 89
    .line 90
    aput v2, v14, v10

    .line 91
    .line 92
    aput v5, v14, v11

    .line 93
    .line 94
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerX()F

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerY()F

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    new-array v15, v13, [F

    .line 103
    .line 104
    aput v2, v15, v10

    .line 105
    .line 106
    aput v5, v15, v11

    .line 107
    .line 108
    invoke-direct {v0, v14, v15}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->i([F[F)F

    .line 109
    .line 110
    .line 111
    move-result v16

    .line 112
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    div-float v8, v2, v12

    .line 117
    .line 118
    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    div-float v17, v2, v12

    .line 123
    .line 124
    cmpl-float v18, v16, p5

    .line 125
    .line 126
    if-ltz v18, :cond_5

    .line 127
    .line 128
    iget-object v4, v3, Lcom/android/launcher3/pageindicators/c$a;->c:Lcom/android/launcher3/pageindicators/b;

    .line 129
    .line 130
    sget-object v5, Lcom/android/launcher3/pageindicators/b;->h:Lcom/android/launcher3/pageindicators/b;

    .line 131
    .line 132
    if-ne v4, v5, :cond_0

    .line 133
    .line 134
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerX()F

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerY()F

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    iget v3, v3, Lcom/android/launcher3/pageindicators/c$a;->b:F

    .line 143
    .line 144
    iget-object v6, v0, Lcom/android/launcher3/pageindicators/c;->h:Landroid/graphics/Paint;

    .line 145
    .line 146
    invoke-virtual {v1, v4, v5, v3, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 147
    .line 148
    .line 149
    move/from16 v19, v10

    .line 150
    .line 151
    move/from16 p2, v11

    .line 152
    .line 153
    const/high16 v10, 0x3f800000    # 1.0f

    .line 154
    .line 155
    :goto_0
    move v11, v8

    .line 156
    goto/16 :goto_1

    .line 157
    .line 158
    :cond_0
    sget-object v5, Lcom/android/launcher3/pageindicators/b;->i:Lcom/android/launcher3/pageindicators/b;

    .line 159
    .line 160
    if-ne v4, v5, :cond_1

    .line 161
    .line 162
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerX()F

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    iget v4, v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->s:F

    .line 167
    .line 168
    div-float/2addr v4, v12

    .line 169
    sub-float/2addr v3, v4

    .line 170
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerY()F

    .line 171
    .line 172
    .line 173
    move-result v4

    .line 174
    iget v5, v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 175
    .line 176
    sub-float/2addr v4, v5

    .line 177
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerX()F

    .line 178
    .line 179
    .line 180
    move-result v5

    .line 181
    iget v6, v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->s:F

    .line 182
    .line 183
    div-float/2addr v6, v12

    .line 184
    add-float/2addr v5, v6

    .line 185
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerY()F

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    iget v2, v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 190
    .line 191
    add-float/2addr v6, v2

    .line 192
    move v2, v3

    .line 193
    move v3, v4

    .line 194
    move v4, v5

    .line 195
    move v5, v6

    .line 196
    iget-object v6, v0, Lcom/android/launcher3/pageindicators/c;->g:Landroid/graphics/Paint;

    .line 197
    .line 198
    move/from16 v19, v10

    .line 199
    .line 200
    const/high16 v10, 0x3f800000    # 1.0f

    .line 201
    .line 202
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerX()F

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    iget v2, v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 210
    .line 211
    sub-float v2, v1, v2

    .line 212
    .line 213
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerY()F

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    iget v3, v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->s:F

    .line 218
    .line 219
    div-float/2addr v3, v12

    .line 220
    sub-float v3, v1, v3

    .line 221
    .line 222
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerX()F

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    iget v4, v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 227
    .line 228
    add-float/2addr v4, v1

    .line 229
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerY()F

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    iget v5, v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->s:F

    .line 234
    .line 235
    div-float/2addr v5, v12

    .line 236
    add-float/2addr v5, v1

    .line 237
    iget-object v6, v0, Lcom/android/launcher3/pageindicators/c;->g:Landroid/graphics/Paint;

    .line 238
    .line 239
    move-object/from16 v1, p1

    .line 240
    .line 241
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 242
    .line 243
    .line 244
    move/from16 p2, v11

    .line 245
    .line 246
    goto :goto_0

    .line 247
    :cond_1
    move/from16 v19, v10

    .line 248
    .line 249
    const/high16 v10, 0x3f800000    # 1.0f

    .line 250
    .line 251
    sget-object v1, Lcom/android/launcher3/pageindicators/b;->j:Lcom/android/launcher3/pageindicators/b;

    .line 252
    .line 253
    if-ne v4, v1, :cond_2

    .line 254
    .line 255
    iget v2, v7, Landroid/graphics/RectF;->left:F

    .line 256
    .line 257
    iget v3, v7, Landroid/graphics/RectF;->top:F

    .line 258
    .line 259
    iget v4, v7, Landroid/graphics/RectF;->right:F

    .line 260
    .line 261
    iget v5, v7, Landroid/graphics/RectF;->bottom:F

    .line 262
    .line 263
    const/high16 v7, 0x3f800000    # 1.0f

    .line 264
    .line 265
    move v1, v8

    .line 266
    iget-object v8, v0, Lcom/android/launcher3/pageindicators/c;->i:Landroid/graphics/Paint;

    .line 267
    .line 268
    const/high16 v6, 0x3f800000    # 1.0f

    .line 269
    .line 270
    move/from16 p2, v11

    .line 271
    .line 272
    move v11, v1

    .line 273
    move-object/from16 v1, p1

    .line 274
    .line 275
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 276
    .line 277
    .line 278
    goto :goto_1

    .line 279
    :cond_2
    move-object/from16 v1, p1

    .line 280
    .line 281
    move/from16 p2, v11

    .line 282
    .line 283
    move v11, v8

    .line 284
    sget-object v2, Lcom/android/launcher3/pageindicators/b;->k:Lcom/android/launcher3/pageindicators/b;

    .line 285
    .line 286
    if-ne v4, v2, :cond_3

    .line 287
    .line 288
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerX()F

    .line 289
    .line 290
    .line 291
    move-result v2

    .line 292
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerY()F

    .line 293
    .line 294
    .line 295
    move-result v4

    .line 296
    iget v3, v3, Lcom/android/launcher3/pageindicators/c$a;->b:F

    .line 297
    .line 298
    iget-object v5, v0, Lcom/android/launcher3/pageindicators/c;->j:Landroid/graphics/Paint;

    .line 299
    .line 300
    invoke-virtual {v1, v2, v4, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 301
    .line 302
    .line 303
    goto :goto_1

    .line 304
    :cond_3
    sget-object v2, Lcom/android/launcher3/pageindicators/b;->l:Lcom/android/launcher3/pageindicators/b;

    .line 305
    .line 306
    if-ne v4, v2, :cond_4

    .line 307
    .line 308
    iget v2, v7, Landroid/graphics/RectF;->left:F

    .line 309
    .line 310
    iget v3, v7, Landroid/graphics/RectF;->top:F

    .line 311
    .line 312
    iget v4, v7, Landroid/graphics/RectF;->right:F

    .line 313
    .line 314
    iget v5, v7, Landroid/graphics/RectF;->bottom:F

    .line 315
    .line 316
    iget v6, v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->u:F

    .line 317
    .line 318
    iget-object v8, v0, Lcom/android/launcher3/pageindicators/c;->j:Landroid/graphics/Paint;

    .line 319
    .line 320
    move v7, v6

    .line 321
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 322
    .line 323
    .line 324
    :cond_4
    :goto_1
    move-object/from16 v1, p1

    .line 325
    .line 326
    move/from16 v20, v12

    .line 327
    .line 328
    move/from16 v12, v17

    .line 329
    .line 330
    goto/16 :goto_5

    .line 331
    .line 332
    :cond_5
    move/from16 v19, v10

    .line 333
    .line 334
    move/from16 p2, v11

    .line 335
    .line 336
    const/high16 v10, 0x3f800000    # 1.0f

    .line 337
    .line 338
    move v11, v8

    .line 339
    iget-object v1, v3, Lcom/android/launcher3/pageindicators/c$a;->c:Lcom/android/launcher3/pageindicators/b;

    .line 340
    .line 341
    sget-object v2, Lcom/android/launcher3/pageindicators/b;->k:Lcom/android/launcher3/pageindicators/b;

    .line 342
    .line 343
    if-eq v1, v2, :cond_7

    .line 344
    .line 345
    invoke-static {}, Lx1/O;->k1()Z

    .line 346
    .line 347
    .line 348
    move-result v1

    .line 349
    if-eqz v1, :cond_6

    .line 350
    .line 351
    iget-object v1, v3, Lcom/android/launcher3/pageindicators/c$a;->c:Lcom/android/launcher3/pageindicators/b;

    .line 352
    .line 353
    sget-object v2, Lcom/android/launcher3/pageindicators/b;->l:Lcom/android/launcher3/pageindicators/b;

    .line 354
    .line 355
    if-eq v1, v2, :cond_7

    .line 356
    .line 357
    sget-object v2, Lcom/android/launcher3/pageindicators/b;->i:Lcom/android/launcher3/pageindicators/b;

    .line 358
    .line 359
    if-ne v1, v2, :cond_6

    .line 360
    .line 361
    goto :goto_3

    .line 362
    :cond_6
    div-float v1, v16, p5

    .line 363
    .line 364
    sub-float v2, v10, v1

    .line 365
    .line 366
    const v1, 0x3e99999a    # 0.3f

    .line 367
    .line 368
    .line 369
    mul-float/2addr v2, v1

    .line 370
    add-float/2addr v2, v10

    .line 371
    mul-float v1, v17, v2

    .line 372
    .line 373
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 378
    .line 379
    .line 380
    move-result-object v2

    .line 381
    const v4, 0x7f0709bd

    .line 382
    .line 383
    .line 384
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 385
    .line 386
    .line 387
    move-result v2

    .line 388
    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    .line 389
    .line 390
    .line 391
    move-result v1

    .line 392
    :goto_2
    move/from16 v17, v1

    .line 393
    .line 394
    goto :goto_4

    .line 395
    :cond_7
    :goto_3
    iget v1, v3, Lcom/android/launcher3/pageindicators/c$a;->b:F

    .line 396
    .line 397
    goto :goto_2

    .line 398
    :goto_4
    invoke-static {}, Lx1/O;->k1()Z

    .line 399
    .line 400
    .line 401
    move-result v1

    .line 402
    if-eqz v1, :cond_8

    .line 403
    .line 404
    iget-object v1, v3, Lcom/android/launcher3/pageindicators/c$a;->c:Lcom/android/launcher3/pageindicators/b;

    .line 405
    .line 406
    sget-object v2, Lcom/android/launcher3/pageindicators/b;->l:Lcom/android/launcher3/pageindicators/b;

    .line 407
    .line 408
    if-ne v1, v2, :cond_8

    .line 409
    .line 410
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 411
    .line 412
    .line 413
    move-result-object v1

    .line 414
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 415
    .line 416
    .line 417
    move-result-object v1

    .line 418
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 419
    .line 420
    .line 421
    move-result-object v1

    .line 422
    invoke-virtual {v1}, Lcom/android/launcher3/r4;->e()Z

    .line 423
    .line 424
    .line 425
    move-result v1

    .line 426
    if-eqz v1, :cond_8

    .line 427
    .line 428
    iget v2, v7, Landroid/graphics/RectF;->left:F

    .line 429
    .line 430
    iget v3, v7, Landroid/graphics/RectF;->top:F

    .line 431
    .line 432
    iget v4, v7, Landroid/graphics/RectF;->right:F

    .line 433
    .line 434
    iget v5, v7, Landroid/graphics/RectF;->bottom:F

    .line 435
    .line 436
    iget v6, v0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->u:F

    .line 437
    .line 438
    iget-object v8, v0, Lcom/android/launcher3/pageindicators/c;->g:Landroid/graphics/Paint;

    .line 439
    .line 440
    move v7, v6

    .line 441
    move-object/from16 v1, p1

    .line 442
    .line 443
    move/from16 v20, v12

    .line 444
    .line 445
    move/from16 v12, v17

    .line 446
    .line 447
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 448
    .line 449
    .line 450
    goto :goto_5

    .line 451
    :cond_8
    move-object/from16 v1, p1

    .line 452
    .line 453
    move/from16 v20, v12

    .line 454
    .line 455
    move/from16 v12, v17

    .line 456
    .line 457
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerX()F

    .line 458
    .line 459
    .line 460
    move-result v2

    .line 461
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerY()F

    .line 462
    .line 463
    .line 464
    move-result v3

    .line 465
    iget-object v4, v0, Lcom/android/launcher3/pageindicators/c;->g:Landroid/graphics/Paint;

    .line 466
    .line 467
    invoke-virtual {v1, v2, v3, v12, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 468
    .line 469
    .line 470
    :goto_5
    const/4 v2, 0x0

    .line 471
    cmpl-float v3, v11, v2

    .line 472
    .line 473
    if-eqz v3, :cond_c

    .line 474
    .line 475
    cmpl-float v3, v12, v2

    .line 476
    .line 477
    if-nez v3, :cond_9

    .line 478
    .line 479
    goto/16 :goto_7

    .line 480
    .line 481
    :cond_9
    if-gtz v18, :cond_c

    .line 482
    .line 483
    sub-float v8, v11, v12

    .line 484
    .line 485
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    .line 486
    .line 487
    .line 488
    move-result v3

    .line 489
    cmpg-float v3, v16, v3

    .line 490
    .line 491
    if-gtz v3, :cond_a

    .line 492
    .line 493
    goto/16 :goto_7

    .line 494
    .line 495
    :cond_a
    add-float v3, v11, v12

    .line 496
    .line 497
    cmpg-float v4, v16, v3

    .line 498
    .line 499
    if-gez v4, :cond_b

    .line 500
    .line 501
    mul-float v2, v11, v11

    .line 502
    .line 503
    mul-float v4, v16, v16

    .line 504
    .line 505
    add-float v5, v2, v4

    .line 506
    .line 507
    mul-float v6, v12, v12

    .line 508
    .line 509
    sub-float/2addr v5, v6

    .line 510
    mul-float v7, v11, v20

    .line 511
    .line 512
    mul-float v7, v7, v16

    .line 513
    .line 514
    div-float/2addr v5, v7

    .line 515
    move/from16 v17, v11

    .line 516
    .line 517
    float-to-double v10, v5

    .line 518
    invoke-static {v10, v11}, Ljava/lang/Math;->acos(D)D

    .line 519
    .line 520
    .line 521
    move-result-wide v10

    .line 522
    double-to-float v5, v10

    .line 523
    add-float/2addr v6, v4

    .line 524
    sub-float/2addr v6, v2

    .line 525
    mul-float v2, v12, v20

    .line 526
    .line 527
    mul-float v2, v2, v16

    .line 528
    .line 529
    div-float/2addr v6, v2

    .line 530
    float-to-double v10, v6

    .line 531
    invoke-static {v10, v11}, Ljava/lang/Math;->acos(D)D

    .line 532
    .line 533
    .line 534
    move-result-wide v10

    .line 535
    double-to-float v2, v10

    .line 536
    move v4, v2

    .line 537
    move v2, v5

    .line 538
    goto :goto_6

    .line 539
    :cond_b
    move/from16 v17, v11

    .line 540
    .line 541
    move v4, v2

    .line 542
    :goto_6
    aget v5, v15, v19

    .line 543
    .line 544
    aget v6, v14, v19

    .line 545
    .line 546
    sub-float/2addr v5, v6

    .line 547
    aget v6, v15, p2

    .line 548
    .line 549
    aget v10, v14, p2

    .line 550
    .line 551
    sub-float/2addr v6, v10

    .line 552
    new-array v10, v13, [F

    .line 553
    .line 554
    aput v5, v10, v19

    .line 555
    .line 556
    aput v6, v10, p2

    .line 557
    .line 558
    aget v5, v10, p2

    .line 559
    .line 560
    float-to-double v5, v5

    .line 561
    aget v10, v10, v19

    .line 562
    .line 563
    float-to-double v10, v10

    .line 564
    invoke-static {v5, v6, v10, v11}, Ljava/lang/Math;->atan2(DD)D

    .line 565
    .line 566
    .line 567
    move-result-wide v5

    .line 568
    double-to-float v5, v5

    .line 569
    div-float v8, v8, v16

    .line 570
    .line 571
    float-to-double v10, v8

    .line 572
    invoke-static {v10, v11}, Ljava/lang/Math;->acos(D)D

    .line 573
    .line 574
    .line 575
    move-result-wide v10

    .line 576
    double-to-float v6, v10

    .line 577
    add-float v8, v5, v2

    .line 578
    .line 579
    sub-float v10, v6, v2

    .line 580
    .line 581
    mul-float/2addr v10, v9

    .line 582
    add-float/2addr v8, v10

    .line 583
    sub-float v2, v5, v2

    .line 584
    .line 585
    sub-float/2addr v2, v10

    .line 586
    float-to-double v10, v5

    .line 587
    const-wide v21, 0x400921fb54442d18L    # Math.PI

    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    add-double v23, v10, v21

    .line 593
    .line 594
    float-to-double v4, v4

    .line 595
    sub-double v23, v23, v4

    .line 596
    .line 597
    sub-double v25, v21, v4

    .line 598
    .line 599
    move-object/from16 v27, v14

    .line 600
    .line 601
    float-to-double v13, v6

    .line 602
    sub-double v25, v25, v13

    .line 603
    .line 604
    float-to-double v13, v9

    .line 605
    mul-double v25, v25, v13

    .line 606
    .line 607
    sub-double v13, v23, v25

    .line 608
    .line 609
    double-to-float v6, v13

    .line 610
    sub-double v10, v10, v21

    .line 611
    .line 612
    add-double/2addr v10, v4

    .line 613
    add-double v10, v10, v25

    .line 614
    .line 615
    double-to-float v4, v10

    .line 616
    move/from16 v11, v17

    .line 617
    .line 618
    invoke-direct {v0, v8, v11}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->l(FF)[F

    .line 619
    .line 620
    .line 621
    move-result-object v5

    .line 622
    invoke-direct {v0, v2, v11}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->l(FF)[F

    .line 623
    .line 624
    .line 625
    move-result-object v10

    .line 626
    invoke-direct {v0, v6, v12}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->l(FF)[F

    .line 627
    .line 628
    .line 629
    move-result-object v13

    .line 630
    invoke-direct {v0, v4, v12}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->l(FF)[F

    .line 631
    .line 632
    .line 633
    move-result-object v14

    .line 634
    aget v17, v5, v19

    .line 635
    .line 636
    aget v21, v27, v19

    .line 637
    .line 638
    add-float v17, v17, v21

    .line 639
    .line 640
    aget v5, v5, p2

    .line 641
    .line 642
    aget v22, v27, p2

    .line 643
    .line 644
    add-float v5, v5, v22

    .line 645
    .line 646
    move/from16 v18, v2

    .line 647
    .line 648
    const/4 v7, 0x2

    .line 649
    new-array v2, v7, [F

    .line 650
    .line 651
    aput v17, v2, v19

    .line 652
    .line 653
    aput v5, v2, p2

    .line 654
    .line 655
    aget v5, v10, v19

    .line 656
    .line 657
    add-float v5, v5, v21

    .line 658
    .line 659
    aget v10, v10, p2

    .line 660
    .line 661
    add-float v10, v10, v22

    .line 662
    .line 663
    move-object/from16 v17, v2

    .line 664
    .line 665
    new-array v2, v7, [F

    .line 666
    .line 667
    aput v5, v2, v19

    .line 668
    .line 669
    aput v10, v2, p2

    .line 670
    .line 671
    aget v5, v13, v19

    .line 672
    .line 673
    aget v10, v15, v19

    .line 674
    .line 675
    add-float/2addr v5, v10

    .line 676
    aget v13, v13, p2

    .line 677
    .line 678
    aget v15, v15, p2

    .line 679
    .line 680
    add-float/2addr v13, v15

    .line 681
    move-object/from16 v21, v2

    .line 682
    .line 683
    new-array v2, v7, [F

    .line 684
    .line 685
    aput v5, v2, v19

    .line 686
    .line 687
    aput v13, v2, p2

    .line 688
    .line 689
    aget v5, v14, v19

    .line 690
    .line 691
    add-float/2addr v5, v10

    .line 692
    aget v10, v14, p2

    .line 693
    .line 694
    add-float/2addr v10, v15

    .line 695
    new-array v13, v7, [F

    .line 696
    .line 697
    aput v5, v13, v19

    .line 698
    .line 699
    aput v10, v13, p2

    .line 700
    .line 701
    aget v5, v17, v19

    .line 702
    .line 703
    aget v10, v2, v19

    .line 704
    .line 705
    sub-float/2addr v5, v10

    .line 706
    aget v10, v17, p2

    .line 707
    .line 708
    aget v14, v2, p2

    .line 709
    .line 710
    sub-float/2addr v10, v14

    .line 711
    new-array v7, v7, [F

    .line 712
    .line 713
    aput v5, v7, v19

    .line 714
    .line 715
    aput v10, v7, p2

    .line 716
    .line 717
    mul-float v5, v9, p4

    .line 718
    .line 719
    invoke-direct {v0, v7}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->j([F)F

    .line 720
    .line 721
    .line 722
    move-result v7

    .line 723
    div-float/2addr v7, v3

    .line 724
    invoke-static {v5, v7}, Ljava/lang/Math;->min(FF)F

    .line 725
    .line 726
    .line 727
    move-result v5

    .line 728
    mul-float v16, v16, v20

    .line 729
    .line 730
    div-float v3, v16, v3

    .line 731
    .line 732
    const/high16 v10, 0x3f800000    # 1.0f

    .line 733
    .line 734
    invoke-static {v10, v3}, Ljava/lang/Math;->min(FF)F

    .line 735
    .line 736
    .line 737
    move-result v3

    .line 738
    mul-float/2addr v5, v3

    .line 739
    mul-float v3, v11, v5

    .line 740
    .line 741
    mul-float/2addr v12, v5

    .line 742
    const v5, 0x3fc90fdb

    .line 743
    .line 744
    .line 745
    sub-float/2addr v8, v5

    .line 746
    invoke-direct {v0, v8, v3}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->l(FF)[F

    .line 747
    .line 748
    .line 749
    move-result-object v7

    .line 750
    add-float/2addr v6, v5

    .line 751
    invoke-direct {v0, v6, v12}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->l(FF)[F

    .line 752
    .line 753
    .line 754
    move-result-object v6

    .line 755
    sub-float/2addr v4, v5

    .line 756
    invoke-direct {v0, v4, v12}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->l(FF)[F

    .line 757
    .line 758
    .line 759
    move-result-object v4

    .line 760
    add-float v5, v18, v5

    .line 761
    .line 762
    invoke-direct {v0, v5, v3}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->l(FF)[F

    .line 763
    .line 764
    .line 765
    move-result-object v3

    .line 766
    new-instance v5, Landroid/graphics/Path;

    .line 767
    .line 768
    invoke-direct {v5}, Landroid/graphics/Path;-><init>()V

    .line 769
    .line 770
    .line 771
    aget v8, v17, v19

    .line 772
    .line 773
    aget v9, v17, p2

    .line 774
    .line 775
    invoke-virtual {v5, v8, v9}, Landroid/graphics/Path;->moveTo(FF)V

    .line 776
    .line 777
    .line 778
    aget v8, v17, v19

    .line 779
    .line 780
    aget v9, v7, v19

    .line 781
    .line 782
    add-float v23, v8, v9

    .line 783
    .line 784
    aget v8, v17, p2

    .line 785
    .line 786
    aget v7, v7, p2

    .line 787
    .line 788
    add-float v24, v8, v7

    .line 789
    .line 790
    aget v27, v2, v19

    .line 791
    .line 792
    aget v7, v6, v19

    .line 793
    .line 794
    add-float v25, v27, v7

    .line 795
    .line 796
    aget v28, v2, p2

    .line 797
    .line 798
    aget v2, v6, p2

    .line 799
    .line 800
    add-float v26, v28, v2

    .line 801
    .line 802
    move-object/from16 v22, v5

    .line 803
    .line 804
    invoke-virtual/range {v22 .. v28}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 805
    .line 806
    .line 807
    move-object/from16 v2, v22

    .line 808
    .line 809
    aget v5, v13, v19

    .line 810
    .line 811
    aget v6, v13, p2

    .line 812
    .line 813
    invoke-virtual {v2, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 814
    .line 815
    .line 816
    aget v5, v13, v19

    .line 817
    .line 818
    aget v6, v4, v19

    .line 819
    .line 820
    add-float v23, v5, v6

    .line 821
    .line 822
    aget v5, v13, p2

    .line 823
    .line 824
    aget v4, v4, p2

    .line 825
    .line 826
    add-float v24, v5, v4

    .line 827
    .line 828
    aget v27, v21, v19

    .line 829
    .line 830
    aget v4, v3, v19

    .line 831
    .line 832
    add-float v25, v27, v4

    .line 833
    .line 834
    aget v28, v21, p2

    .line 835
    .line 836
    aget v3, v3, p2

    .line 837
    .line 838
    add-float v26, v28, v3

    .line 839
    .line 840
    invoke-virtual/range {v22 .. v28}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 841
    .line 842
    .line 843
    aget v3, v17, v19

    .line 844
    .line 845
    aget v4, v17, p2

    .line 846
    .line 847
    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 848
    .line 849
    .line 850
    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 851
    .line 852
    .line 853
    iget-object v0, v0, Lcom/android/launcher3/pageindicators/c;->g:Landroid/graphics/Paint;

    .line 854
    .line 855
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 856
    .line 857
    .line 858
    :cond_c
    :goto_7
    return-void
.end method

.method private t(Lcom/android/launcher3/pageindicators/b;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/pageindicators/c;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/android/launcher3/pageindicators/c$a;

    .line 15
    .line 16
    iput-object p1, v0, Lcom/android/launcher3/pageindicators/c$a;->c:Lcom/android/launcher3/pageindicators/b;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private u(Lcom/android/launcher3/pageindicators/b;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/pageindicators/c;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 8
    .line 9
    iget v1, p0, Lcom/android/launcher3/pageindicators/c;->k:I

    .line 10
    .line 11
    add-int/lit8 v1, v1, -0x1

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/pageindicators/c$a;

    .line 18
    .line 19
    iput-object p1, v0, Lcom/android/launcher3/pageindicators/c$a;->c:Lcom/android/launcher3/pageindicators/b;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private w(Lcom/android/launcher3/pageindicators/b;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/pageindicators/c;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/c;->l:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->t(Lcom/android/launcher3/pageindicators/b;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->u(Lcom/android/launcher3/pageindicators/b;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method


# virtual methods
.method public e(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/pageindicators/b;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/android/launcher3/pageindicators/b;

    .line 24
    .line 25
    const v1, 0x7fffffff

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->f(ILcom/android/launcher3/pageindicators/b;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public f(ILcom/android/launcher3/pageindicators/b;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/pageindicators/c;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p2}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->w(Lcom/android/launcher3/pageindicators/b;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {p0, p2}, Lcom/android/launcher3/pageindicators/c;->a(Lcom/android/launcher3/pageindicators/b;)Lcom/android/launcher3/pageindicators/c$a;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-boolean v1, p0, Lcom/android/launcher3/pageindicators/c;->l:Z

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {p1, v0, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {v1, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->m()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 49
    .line 50
    .line 51
    iget-boolean p1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->x:Z

    .line 52
    .line 53
    if-eqz p1, :cond_2

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    const/4 p2, 0x1

    .line 66
    if-le p1, p2, :cond_3

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_3
    const/16 v0, 0x8

    .line 70
    .line 71
    :goto_1
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public g(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->v:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-void
.end method

.method public getMarkerCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->C:Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto/16 :goto_3

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    .line 17
    .line 18
    if-eqz v0, :cond_6

    .line 19
    .line 20
    iget-object v0, v0, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 21
    .line 22
    if-eqz v0, :cond_6

    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->x:Z

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getPageViewChildCount()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-ne v0, v1, :cond_1

    .line 34
    .line 35
    goto/16 :goto_3

    .line 36
    .line 37
    :cond_1
    new-instance v0, Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    .line 43
    .line 44
    iget-object v3, v2, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 45
    .line 46
    const/4 v4, 0x0

    .line 47
    aget v5, v3, v4

    .line 48
    .line 49
    iget v2, v2, Lcom/android/launcher3/pageindicators/c$a;->b:F

    .line 50
    .line 51
    sub-float/2addr v5, v2

    .line 52
    iput v5, v0, Landroid/graphics/RectF;->left:F

    .line 53
    .line 54
    aget v3, v3, v1

    .line 55
    .line 56
    sub-float/2addr v3, v2

    .line 57
    iput v3, v0, Landroid/graphics/RectF;->top:F

    .line 58
    .line 59
    const/high16 v6, 0x40000000    # 2.0f

    .line 60
    .line 61
    mul-float v7, v2, v6

    .line 62
    .line 63
    add-float/2addr v5, v7

    .line 64
    iput v5, v0, Landroid/graphics/RectF;->right:F

    .line 65
    .line 66
    mul-float/2addr v2, v6

    .line 67
    add-float/2addr v3, v2

    .line 68
    iput v3, v0, Landroid/graphics/RectF;->bottom:F

    .line 69
    .line 70
    iget-object v2, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    move v3, v4

    .line 77
    :goto_0
    if-ge v3, v2, :cond_4

    .line 78
    .line 79
    iget-object v5, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    check-cast v5, Lcom/android/launcher3/pageindicators/c$a;

    .line 86
    .line 87
    iget-object v6, v5, Lcom/android/launcher3/pageindicators/c$a;->c:Lcom/android/launcher3/pageindicators/b;

    .line 88
    .line 89
    sget-object v7, Lcom/android/launcher3/pageindicators/b;->k:Lcom/android/launcher3/pageindicators/b;

    .line 90
    .line 91
    if-eq v6, v7, :cond_2

    .line 92
    .line 93
    invoke-static {}, Lx1/O;->k1()Z

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    if-eqz v6, :cond_3

    .line 98
    .line 99
    iget-object v6, v5, Lcom/android/launcher3/pageindicators/c$a;->c:Lcom/android/launcher3/pageindicators/b;

    .line 100
    .line 101
    sget-object v7, Lcom/android/launcher3/pageindicators/b;->l:Lcom/android/launcher3/pageindicators/b;

    .line 102
    .line 103
    if-ne v6, v7, :cond_3

    .line 104
    .line 105
    :cond_2
    iget-object v5, v5, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 106
    .line 107
    aget v5, v5, v4

    .line 108
    .line 109
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    sub-float/2addr v5, v6

    .line 114
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    const v6, 0x3dcccccd    # 0.1f

    .line 119
    .line 120
    .line 121
    cmpg-float v5, v5, v6

    .line 122
    .line 123
    if-gtz v5, :cond_3

    .line 124
    .line 125
    move v1, v4

    .line 126
    goto :goto_1

    .line 127
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_4
    :goto_1
    iget v2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->z:F

    .line 131
    .line 132
    const/4 v3, 0x0

    .line 133
    cmpl-float v2, v2, v3

    .line 134
    .line 135
    if-eqz v2, :cond_5

    .line 136
    .line 137
    if-eqz v1, :cond_5

    .line 138
    .line 139
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    iget-object v2, p0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    .line 148
    .line 149
    iget v2, v2, Lcom/android/launcher3/pageindicators/c$a;->b:F

    .line 150
    .line 151
    iget-object v3, p0, Lcom/android/launcher3/pageindicators/c;->g:Landroid/graphics/Paint;

    .line 152
    .line 153
    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 154
    .line 155
    .line 156
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 157
    .line 158
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    move v7, v4

    .line 163
    :goto_2
    if-ge v7, v0, :cond_6

    .line 164
    .line 165
    const/high16 v9, 0x40000000    # 2.0f

    .line 166
    .line 167
    iget v10, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->z:F

    .line 168
    .line 169
    const/high16 v8, 0x3f800000    # 1.0f

    .line 170
    .line 171
    move-object v5, p0

    .line 172
    move-object v6, p1

    .line 173
    invoke-direct/range {v5 .. v10}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->o(Landroid/graphics/Canvas;IFFF)V

    .line 174
    .line 175
    .line 176
    add-int/lit8 v7, v7, 0x1

    .line 177
    .line 178
    goto :goto_2

    .line 179
    :cond_6
    :goto_3
    return-void
.end method

.method protected onMeasure(II)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 10
    .line 11
    const/high16 v1, 0x40000000    # 2.0f

    .line 12
    .line 13
    mul-float/2addr v0, v1

    .line 14
    iget-object v2, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/android/launcher3/pageindicators/c$a;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/android/launcher3/pageindicators/c$a;->c:Lcom/android/launcher3/pageindicators/b;

    .line 24
    .line 25
    sget-object v4, Lcom/android/launcher3/pageindicators/b;->h:Lcom/android/launcher3/pageindicators/b;

    .line 26
    .line 27
    if-ne v2, v4, :cond_0

    .line 28
    .line 29
    iget v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 30
    .line 31
    iget v2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->t:F

    .line 32
    .line 33
    add-float/2addr v0, v2

    .line 34
    mul-float/2addr v0, v1

    .line 35
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    int-to-float v1, v1

    .line 42
    iget v2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    .line 43
    .line 44
    add-float/2addr v2, v0

    .line 45
    mul-float/2addr v1, v2

    .line 46
    invoke-static {}, Lx1/O;->k1()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    iget v2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const/4 v2, 0x0

    .line 56
    :goto_0
    add-float/2addr v1, v2

    .line 57
    float-to-int v1, v1

    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    const v4, 0x7f0b03c3

    .line 63
    .line 64
    .line 65
    if-eq v2, v4, :cond_2

    .line 66
    .line 67
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-nez v2, :cond_2

    .line 72
    .line 73
    iget-object v1, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    int-to-float v1, v1

    .line 80
    mul-float/2addr v1, v0

    .line 81
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/lit8 v0, v0, -0x1

    .line 88
    .line 89
    int-to-float v0, v0

    .line 90
    iget v2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    .line 91
    .line 92
    mul-float/2addr v0, v2

    .line 93
    add-float/2addr v1, v0

    .line 94
    float-to-int v1, v1

    .line 95
    :cond_2
    invoke-static {v1, p1, v3}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    const/high16 v0, 0x40800000    # 4.0f

    .line 100
    .line 101
    iget v1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 102
    .line 103
    mul-float/2addr v1, v0

    .line 104
    float-to-int v0, v1

    .line 105
    invoke-static {v0, p2, v3}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_3
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x8

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public q(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/pageindicators/c;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/pageindicators/c;->d(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-object p1, Lcom/android/launcher3/pageindicators/b;->k:Lcom/android/launcher3/pageindicators/b;

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->u(Lcom/android/launcher3/pageindicators/b;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/pageindicators/c;->d(I)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    sget-object p1, Lcom/android/launcher3/pageindicators/b;->k:Lcom/android/launcher3/pageindicators/b;

    .line 24
    .line 25
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->u(Lcom/android/launcher3/pageindicators/b;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/pageindicators/c;->d(I)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getPageViewChildCount()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/lit8 v0, v0, -0x1

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/android/launcher3/pageindicators/c;->d(I)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-lez v0, :cond_3

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    add-int/lit8 v0, v0, -0x1

    .line 63
    .line 64
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->k(I)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->m()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 86
    .line 87
    .line 88
    :cond_3
    :goto_0
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getPageViewScrollX()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->w:I

    .line 6
    .line 7
    return-void
.end method

.method public s()V
    .locals 13

    .line 1
    iget v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->w:I

    .line 2
    .line 3
    const v1, 0x7fffffff

    .line 4
    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    goto/16 :goto_0

    .line 9
    .line 10
    :cond_0
    iget v0, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->q:F

    .line 11
    .line 12
    const/high16 v2, 0x40000000    # 2.0f

    .line 13
    .line 14
    mul-float/2addr v0, v2

    .line 15
    iget v2, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r:F

    .line 16
    .line 17
    add-float/2addr v0, v2

    .line 18
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getPageViewNormalChildWidth()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    int-to-float v2, v2

    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getPageViewCurrentPageIndex()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-direct {p0, v3}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->k(I)I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    iget-object v5, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    if-ge v4, v5, :cond_c

    .line 38
    .line 39
    if-ltz v4, :cond_c

    .line 40
    .line 41
    iget-object v5, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    if-eqz v5, :cond_c

    .line 48
    .line 49
    iget v5, p0, Lcom/android/launcher3/pageindicators/c;->p:I

    .line 50
    .line 51
    sub-int v5, v4, v5

    .line 52
    .line 53
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    const/4 v6, 0x1

    .line 58
    if-le v5, v6, :cond_1

    .line 59
    .line 60
    goto/16 :goto_0

    .line 61
    .line 62
    :cond_1
    iget-object v5, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    check-cast v5, Lcom/android/launcher3/pageindicators/c$a;

    .line 69
    .line 70
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getPageViewScrollX()I

    .line 71
    .line 72
    .line 73
    move-result v7

    .line 74
    iget v8, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->w:I

    .line 75
    .line 76
    sub-int/2addr v7, v8

    .line 77
    if-nez v4, :cond_2

    .line 78
    .line 79
    if-gez v7, :cond_2

    .line 80
    .line 81
    iput v1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->w:I

    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getPageViewChildCount()I

    .line 85
    .line 86
    .line 87
    move-result v8

    .line 88
    iget v9, p0, Lcom/android/launcher3/pageindicators/c;->k:I

    .line 89
    .line 90
    if-le v8, v9, :cond_6

    .line 91
    .line 92
    div-int/lit8 v9, v9, 0x2

    .line 93
    .line 94
    sub-int/2addr v8, v9

    .line 95
    sub-int/2addr v8, v6

    .line 96
    if-lez v7, :cond_4

    .line 97
    .line 98
    iget-boolean v10, p0, Lcom/android/launcher3/pageindicators/c;->l:Z

    .line 99
    .line 100
    if-eqz v10, :cond_3

    .line 101
    .line 102
    if-ne v4, v9, :cond_6

    .line 103
    .line 104
    if-le v3, v9, :cond_6

    .line 105
    .line 106
    goto/16 :goto_0

    .line 107
    .line 108
    :cond_3
    if-ne v4, v9, :cond_6

    .line 109
    .line 110
    if-ge v3, v8, :cond_6

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :cond_4
    iget-boolean v10, p0, Lcom/android/launcher3/pageindicators/c;->l:Z

    .line 115
    .line 116
    if-eqz v10, :cond_5

    .line 117
    .line 118
    if-ne v4, v9, :cond_6

    .line 119
    .line 120
    if-ge v3, v8, :cond_6

    .line 121
    .line 122
    goto/16 :goto_0

    .line 123
    .line 124
    :cond_5
    if-ne v4, v9, :cond_6

    .line 125
    .line 126
    if-le v3, v9, :cond_6

    .line 127
    .line 128
    goto/16 :goto_0

    .line 129
    .line 130
    :cond_6
    iget-object v3, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 131
    .line 132
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    sub-int/2addr v3, v6

    .line 137
    if-ne v4, v3, :cond_7

    .line 138
    .line 139
    if-lez v7, :cond_7

    .line 140
    .line 141
    iput v1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->w:I

    .line 142
    .line 143
    return-void

    .line 144
    :cond_7
    const/4 v3, 0x0

    .line 145
    if-nez v7, :cond_8

    .line 146
    .line 147
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    .line 148
    .line 149
    iget-object v0, v0, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 150
    .line 151
    iget-object v1, v5, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 152
    .line 153
    aget v2, v1, v3

    .line 154
    .line 155
    aput v2, v0, v3

    .line 156
    .line 157
    aget v1, v1, v6

    .line 158
    .line 159
    aput v1, v0, v6

    .line 160
    .line 161
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_8
    if-lez v7, :cond_a

    .line 166
    .line 167
    div-float v8, v0, v2

    .line 168
    .line 169
    int-to-float v9, v7

    .line 170
    mul-float/2addr v8, v9

    .line 171
    iget-object v10, p0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    .line 172
    .line 173
    iget-object v10, v10, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 174
    .line 175
    iget-object v11, v5, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 176
    .line 177
    aget v12, v11, v3

    .line 178
    .line 179
    add-float/2addr v12, v8

    .line 180
    aput v12, v10, v3

    .line 181
    .line 182
    aget v8, v11, v6

    .line 183
    .line 184
    aput v8, v10, v6

    .line 185
    .line 186
    invoke-direct {p0, v9, v2}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->n(FF)Z

    .line 187
    .line 188
    .line 189
    move-result v8

    .line 190
    if-eqz v8, :cond_9

    .line 191
    .line 192
    add-int/lit8 v8, v4, 0x1

    .line 193
    .line 194
    iget-object v9, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 195
    .line 196
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 197
    .line 198
    .line 199
    move-result v9

    .line 200
    if-ge v8, v9, :cond_9

    .line 201
    .line 202
    iget-object v9, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 203
    .line 204
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v8

    .line 208
    check-cast v8, Lcom/android/launcher3/pageindicators/c$a;

    .line 209
    .line 210
    iget-object v9, p0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    .line 211
    .line 212
    iget-object v9, v9, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 213
    .line 214
    iget-object v8, v8, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 215
    .line 216
    aget v10, v8, v3

    .line 217
    .line 218
    aput v10, v9, v3

    .line 219
    .line 220
    aget v8, v8, v6

    .line 221
    .line 222
    aput v8, v9, v6

    .line 223
    .line 224
    iput v1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->w:I

    .line 225
    .line 226
    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 227
    .line 228
    .line 229
    :cond_a
    if-gez v7, :cond_c

    .line 230
    .line 231
    div-float/2addr v0, v2

    .line 232
    int-to-float v7, v7

    .line 233
    mul-float/2addr v0, v7

    .line 234
    iget-object v8, p0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    .line 235
    .line 236
    iget-object v8, v8, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 237
    .line 238
    iget-object v5, v5, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 239
    .line 240
    aget v9, v5, v3

    .line 241
    .line 242
    add-float/2addr v9, v0

    .line 243
    aput v9, v8, v3

    .line 244
    .line 245
    aget v0, v5, v6

    .line 246
    .line 247
    aput v0, v8, v6

    .line 248
    .line 249
    invoke-direct {p0, v7, v2}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->n(FF)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-eqz v0, :cond_b

    .line 254
    .line 255
    sub-int/2addr v4, v6

    .line 256
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 257
    .line 258
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    if-ge v4, v0, :cond_b

    .line 263
    .line 264
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 265
    .line 266
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    check-cast v0, Lcom/android/launcher3/pageindicators/c$a;

    .line 271
    .line 272
    iget-object v2, p0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    .line 273
    .line 274
    iget-object v2, v2, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 275
    .line 276
    iget-object v0, v0, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 277
    .line 278
    aget v4, v0, v3

    .line 279
    .line 280
    aput v4, v2, v3

    .line 281
    .line 282
    aget v0, v0, v6

    .line 283
    .line 284
    aput v0, v2, v6

    .line 285
    .line 286
    iput v1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->w:I

    .line 287
    .line 288
    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 289
    .line 290
    .line 291
    :cond_c
    :goto_0
    return-void
.end method

.method public setActiveMarker(I)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->k(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-ltz p1, :cond_2

    .line 8
    .line 9
    iget-object v2, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-lt p1, v2, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/android/launcher3/pageindicators/c$a;

    .line 25
    .line 26
    iput p1, p0, Lcom/android/launcher3/pageindicators/c;->p:I

    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/c;->o:Lcom/android/launcher3/pageindicators/c$a;

    .line 29
    .line 30
    iget-object v3, p1, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 31
    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    iget-object v2, v2, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 35
    .line 36
    aget v3, v2, v0

    .line 37
    .line 38
    aget v2, v2, v1

    .line 39
    .line 40
    const/4 v4, 0x2

    .line 41
    new-array v4, v4, [F

    .line 42
    .line 43
    aput v3, v4, v0

    .line 44
    .line 45
    aput v2, v4, v1

    .line 46
    .line 47
    iput-object v4, p1, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iget-object p1, v2, Lcom/android/launcher3/pageindicators/c$a;->a:[F

    .line 51
    .line 52
    aget v2, p1, v0

    .line 53
    .line 54
    aput v2, v3, v0

    .line 55
    .line 56
    aget p1, p1, v1

    .line 57
    .line 58
    aput p1, v3, v1

    .line 59
    .line 60
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    const-string v1, "setActiveMarker, index error: "

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p1, ", circle path size: "

    .line 78
    .line 79
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const-string p1, "MfvPageIndic"

    .line 96
    .line 97
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public setMiboardEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->x:Z

    .line 2
    .line 3
    return-void
.end method

.method public v(ILcom/android/launcher3/pageindicators/b;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->k(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, -0x1

    .line 6
    if-le p1, v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-ge p1, v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/android/launcher3/pageindicators/c$a;

    .line 23
    .line 24
    iput-object p2, p1, Lcom/android/launcher3/pageindicators/c$a;->c:Lcom/android/launcher3/pageindicators/b;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public x()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->getPageViewPageCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-le v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/16 v0, 0x8

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
