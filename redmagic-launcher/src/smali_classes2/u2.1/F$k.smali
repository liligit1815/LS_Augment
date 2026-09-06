.class public Lu2/F$k;
.super Ljava/lang/Object;
.source "TransitionAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lu2/F;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "k"
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:F

.field private f:F

.field private final g:I

.field private h:Z


# direct methods
.method public constructor <init>(IIIIFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Lu2/F$k;->a:I

    .line 3
    iput p2, p0, Lu2/F$k;->b:I

    .line 4
    iput p3, p0, Lu2/F$k;->c:I

    .line 5
    iput p4, p0, Lu2/F$k;->d:I

    .line 6
    iput p5, p0, Lu2/F$k;->e:F

    .line 7
    iput p6, p0, Lu2/F$k;->f:F

    .line 8
    iput p1, p0, Lu2/F$k;->g:I

    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lu2/F$k;->h:Z

    return-void
.end method

.method public synthetic constructor <init>(IIIIFFILkotlin/jvm/internal/j;)V
    .locals 1

    and-int/lit8 p8, p7, 0x1

    const/4 v0, 0x0

    if-eqz p8, :cond_0

    move p1, v0

    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    move p2, v0

    :cond_1
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_2

    move p3, v0

    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    move p4, v0

    :cond_3
    and-int/lit8 p8, p7, 0x10

    const/4 v0, 0x0

    if-eqz p8, :cond_4

    move p5, v0

    :cond_4
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_5

    move p6, v0

    .line 10
    :cond_5
    invoke-direct/range {p0 .. p6}, Lu2/F$k;-><init>(IIIIFF)V

    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Lu2/F$k;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final b()F
    .locals 0

    .line 1
    iget p0, p0, Lu2/F$k;->f:F

    .line 2
    .line 3
    return p0
.end method

.method public final c()F
    .locals 2

    .line 1
    iget v0, p0, Lu2/F$k;->c:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    invoke-virtual {p0}, Lu2/F$k;->k()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    int-to-float p0, p0

    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    div-float/2addr p0, v1

    .line 12
    add-float/2addr v0, p0

    .line 13
    return v0
.end method

.method public final d()F
    .locals 2

    .line 1
    iget v0, p0, Lu2/F$k;->a:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    invoke-virtual {p0}, Lu2/F$k;->e()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    int-to-float p0, p0

    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    div-float/2addr p0, v1

    .line 12
    add-float/2addr v0, p0

    .line 13
    return v0
.end method

.method public final e()I
    .locals 1

    .line 1
    iget v0, p0, Lu2/F$k;->b:I

    .line 2
    .line 3
    iget p0, p0, Lu2/F$k;->a:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public final f()I
    .locals 0

    .line 1
    iget p0, p0, Lu2/F$k;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public final g()I
    .locals 0

    .line 1
    iget p0, p0, Lu2/F$k;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public final h()I
    .locals 0

    .line 1
    iget p0, p0, Lu2/F$k;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public final i()F
    .locals 0

    .line 1
    iget p0, p0, Lu2/F$k;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public final j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lu2/F$k;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public final k()I
    .locals 1

    .line 1
    iget v0, p0, Lu2/F$k;->d:I

    .line 2
    .line 3
    iget p0, p0, Lu2/F$k;->c:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public final l(I)V
    .locals 0

    .line 1
    iput p1, p0, Lu2/F$k;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public final m(F)V
    .locals 0

    .line 1
    iput p1, p0, Lu2/F$k;->f:F

    .line 2
    .line 3
    return-void
.end method

.method public final n(I)V
    .locals 0

    .line 1
    iput p1, p0, Lu2/F$k;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public final o(I)V
    .locals 0

    .line 1
    iput p1, p0, Lu2/F$k;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public final p(I)V
    .locals 0

    .line 1
    iput p1, p0, Lu2/F$k;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public final q(F)V
    .locals 0

    .line 1
    iput p1, p0, Lu2/F$k;->e:F

    .line 2
    .line 3
    return-void
.end method

.method public final r(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lu2/F$k;->h:Z

    .line 2
    .line 3
    return-void
.end method
