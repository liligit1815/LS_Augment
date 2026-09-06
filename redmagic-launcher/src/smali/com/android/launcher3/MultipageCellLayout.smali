.class public Lcom/android/launcher3/MultipageCellLayout;
.super Lcom/android/launcher3/CellLayout;
.source "MultipageCellLayout.java"


# instance fields
.field private final x0:Landroid/graphics/drawable/Drawable;

.field private final y0:Landroid/graphics/drawable/Drawable;

.field private z0:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/MultipageCellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/CellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/android/launcher3/MultipageCellLayout;->z0:Z

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    const p3, 0x7f080845

    invoke-virtual {p2, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/MultipageCellLayout;->x0:Landroid/graphics/drawable/Drawable;

    .line 5
    invoke-virtual {p2, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 6
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/MultipageCellLayout;->y0:Landroid/graphics/drawable/Drawable;

    .line 8
    invoke-virtual {p2, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 9
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 10
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p1

    .line 11
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget p2, p1, Lcom/android/launcher3/F1;->H0:I

    mul-int/lit8 p2, p2, 0x2

    iput p2, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 12
    iget p1, p1, Lcom/android/launcher3/F1;->G0:I

    iput p1, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 13
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/CellLayout;->C0(II)V

    return-void
.end method

.method public static synthetic H0(Lcom/android/launcher3/MultipageCellLayout;IIIIIIZ[I[I)[I
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/MultipageCellLayout;->N0(IIIIIIZ[I[I)[I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic I0(Lcom/android/launcher3/MultipageCellLayout;IIIILandroid/view/View;[I)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/MultipageCellLayout;->O0(IIIILandroid/view/View;[I)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic J0(Lcom/android/launcher3/MultipageCellLayout;IIIILandroid/view/View;[IZ)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Lcom/android/launcher3/MultipageCellLayout;->M0(IIIILandroid/view/View;[IZ)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic M0(IIIILandroid/view/View;[IZ)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-super/range {p0 .. p7}, Lcom/android/launcher3/CellLayout;->A(IIIILandroid/view/View;[IZ)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic N0(IIIIIIZ[I[I)[I
    .locals 0

    .line 1
    invoke-super/range {p0 .. p9}, Lcom/android/launcher3/CellLayout;->F(IIIIIIZ[I[I)[I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic O0(IIIILandroid/view/View;[I)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-super/range {p0 .. p6}, Lcom/android/launcher3/CellLayout;->a0(IIIILandroid/view/View;[I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private P0()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    instance-of v2, v1, Lcom/android/launcher3/G5;

    .line 17
    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lc1/b;

    .line 26
    .line 27
    check-cast v1, Lcom/android/launcher3/G5;

    .line 28
    .line 29
    invoke-interface {v1}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p0, v2}, Lcom/android/launcher3/MultipageCellLayout;->P(Lc1/b;)F

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const/4 v3, 0x0

    .line 38
    const/4 v4, 0x3

    .line 39
    invoke-virtual {v1, v4, v2, v3}, Lcom/android/launcher3/util/z1;->c(IFF)V

    .line 40
    .line 41
    .line 42
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    return-void
.end method


# virtual methods
.method public A(IIIILandroid/view/View;[IZ)Z
    .locals 9

    .line 1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 2
    .line 3
    div-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    if-lt p1, v0, :cond_0

    .line 6
    .line 7
    add-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    :cond_0
    move v2, p1

    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/MultipageCellLayout;->K0()Lc1/j;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v0, Lcom/android/launcher3/I4;

    .line 15
    .line 16
    move-object v1, p0

    .line 17
    move v3, p2

    .line 18
    move v4, p3

    .line 19
    move v5, p4

    .line 20
    move-object v6, p5

    .line 21
    move-object v7, p6

    .line 22
    move/from16 v8, p7

    .line 23
    .line 24
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/I4;-><init>(Lcom/android/launcher3/MultipageCellLayout;IIIILandroid/view/View;[IZ)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lc1/j;->G(Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public bridge synthetic B()Lc1/p;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/MultipageCellLayout;->K0()Lc1/j;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method protected D0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/MultipageCellLayout;->x0:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/CellLayout;->Q:F

    .line 4
    .line 5
    const/high16 v2, 0x437f0000    # 255.0f

    .line 6
    .line 7
    mul-float/2addr v1, v2

    .line 8
    float-to-int v1, v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/MultipageCellLayout;->y0:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    iget p0, p0, Lcom/android/launcher3/CellLayout;->Q:F

    .line 15
    .line 16
    mul-float/2addr p0, v2

    .line 17
    float-to-int p0, p0

    .line 18
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method protected F(IIIIIIZ[I[I)[I
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/MultipageCellLayout;->K0()Lc1/j;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/launcher3/K4;

    .line 6
    .line 7
    move-object v2, p0

    .line 8
    move v3, p1

    .line 9
    move v4, p2

    .line 10
    move v5, p3

    .line 11
    move/from16 v6, p4

    .line 12
    .line 13
    move/from16 v7, p5

    .line 14
    .line 15
    move/from16 v8, p6

    .line 16
    .line 17
    move/from16 v9, p7

    .line 18
    .line 19
    move-object/from16 v10, p8

    .line 20
    .line 21
    move-object/from16 v11, p9

    .line 22
    .line 23
    invoke-direct/range {v1 .. v11}, Lcom/android/launcher3/K4;-><init>(Lcom/android/launcher3/MultipageCellLayout;IIIIIIZ[I[I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lc1/j;->G(Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, [I

    .line 31
    .line 32
    return-object p0
.end method

.method public K0()Lc1/j;
    .locals 1

    .line 1
    new-instance v0, Lc1/j;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lc1/j;-><init>(Lcom/android/launcher3/CellLayout;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public L0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/MultipageCellLayout;->z0:Z

    .line 2
    .line 3
    return p0
.end method

.method protected P(Lc1/b;)F
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->c0:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/android/launcher3/CellLayout;->Q:F

    .line 5
    .line 6
    mul-float/2addr v0, v1

    .line 7
    invoke-virtual {p1}, Lc1/b;->a()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget p0, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 12
    .line 13
    div-int/lit8 p0, p0, 0x2

    .line 14
    .line 15
    if-lt p1, p0, :cond_0

    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    neg-float p0, v0

    .line 19
    return p0
.end method

.method public a0(IIIILandroid/view/View;[I)Z
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/MultipageCellLayout;->K0()Lc1/j;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/launcher3/J4;

    .line 6
    .line 7
    move-object v2, p0

    .line 8
    move v3, p1

    .line 9
    move v4, p2

    .line 10
    move v5, p3

    .line 11
    move v6, p4

    .line 12
    move-object v7, p5

    .line 13
    move-object v8, p6

    .line 14
    invoke-direct/range {v1 .. v8}, Lcom/android/launcher3/J4;-><init>(Lcom/android/launcher3/MultipageCellLayout;IIIILandroid/view/View;[I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lc1/j;->G(Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public getUnusedHorizontalSpace()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget v1, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 16
    .line 17
    iget v2, p0, Lcom/android/launcher3/CellLayout;->h:I

    .line 18
    .line 19
    mul-int/2addr v2, v1

    .line 20
    sub-int/2addr v0, v2

    .line 21
    add-int/lit8 v1, v1, -0x1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->l:Landroid/graphics/Point;

    .line 24
    .line 25
    iget p0, p0, Landroid/graphics/Point;->x:I

    .line 26
    .line 27
    mul-int/2addr v1, p0

    .line 28
    sub-int/2addr v0, v1

    .line 29
    int-to-float p0, v0

    .line 30
    const/high16 v0, 0x40000000    # 2.0f

    .line 31
    .line 32
    div-float/2addr p0, v0

    .line 33
    float-to-double v0, p0

    .line 34
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    double-to-int p0, v0

    .line 39
    return p0
.end method

.method n0(IIIIIILandroid/view/View;[I[II)[I
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    div-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    if-lt p1, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/2addr p1, v0

    .line 14
    :cond_0
    move-object v0, p0

    .line 15
    move v1, p1

    .line 16
    move v2, p2

    .line 17
    move v3, p3

    .line 18
    move v4, p4

    .line 19
    move/from16 v5, p5

    .line 20
    .line 21
    move/from16 v6, p6

    .line 22
    .line 23
    move-object/from16 v7, p7

    .line 24
    .line 25
    move-object/from16 v8, p8

    .line 26
    .line 27
    move-object/from16 v9, p9

    .line 28
    .line 29
    move/from16 v10, p10

    .line 30
    .line 31
    invoke-super/range {v0 .. v10}, Lcom/android/launcher3/CellLayout;->n0(IIIIIILandroid/view/View;[I[II)[I

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/launcher3/CellLayout;->c0:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/android/launcher3/CellLayout;->Q:F

    .line 5
    .line 6
    mul-float/2addr v0, v1

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/MultipageCellLayout;->x0:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-lez v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 17
    .line 18
    .line 19
    neg-float v1, v0

    .line 20
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/MultipageCellLayout;->x0:Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/MultipageCellLayout;->x0:Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/MultipageCellLayout;->y0:Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-lez v1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/MultipageCellLayout;->y0:Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/launcher3/MultipageCellLayout;->y0:Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 73
    .line 74
    .line 75
    :cond_1
    invoke-super {p0, p1}, Lcom/android/launcher3/CellLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p5}, Lcom/android/launcher3/CellLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    iget-object p3, p0, Lcom/android/launcher3/MultipageCellLayout;->x0:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    iget p4, p1, Landroid/graphics/Rect;->left:I

    .line 17
    .line 18
    iget p5, p1, Landroid/graphics/Rect;->top:I

    .line 19
    .line 20
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 21
    .line 22
    invoke-virtual {p3, p4, p5, p2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/MultipageCellLayout;->y0:Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    iget p3, p1, Landroid/graphics/Rect;->top:I

    .line 28
    .line 29
    iget p4, p1, Landroid/graphics/Rect;->right:I

    .line 30
    .line 31
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 32
    .line 33
    invoke-virtual {p0, p2, p3, p4, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public setCountX(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 2
    .line 3
    return-void
.end method

.method public setCountY(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/CellLayout;->n:I

    .line 2
    .line 3
    return-void
.end method

.method public setOccupied(Lcom/android/launcher3/util/t0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/CellLayout;->s:Lcom/android/launcher3/util/t0;

    .line 2
    .line 3
    return-void
.end method

.method public setSeamWasAdded(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/MultipageCellLayout;->z0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSpaceBetweenCellLayoutsPx(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/CellLayout;->setSpaceBetweenCellLayoutsPx(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/MultipageCellLayout;->P0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setSpringLoadedProgress(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/CellLayout;->setSpringLoadedProgress(F)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/MultipageCellLayout;->P0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public y(Lc1/e;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_3

    .line 10
    .line 11
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->b0:Lcom/android/launcher3/K5;

    .line 12
    .line 13
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    check-cast v4, Lc1/b;

    .line 22
    .line 23
    invoke-virtual {v4}, Lc1/b;->a()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    iget v6, p0, Lcom/android/launcher3/CellLayout;->m:I

    .line 28
    .line 29
    div-int/lit8 v6, v6, 0x2

    .line 30
    .line 31
    if-lt v5, v6, :cond_0

    .line 32
    .line 33
    iget-boolean v5, v4, Lc1/b;->i:Z

    .line 34
    .line 35
    if-eqz v5, :cond_0

    .line 36
    .line 37
    const/4 v5, 0x1

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    move v5, v1

    .line 40
    :goto_1
    new-instance v6, Lcom/android/launcher3/util/C;

    .line 41
    .line 42
    invoke-virtual {v4}, Lc1/b;->a()I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    add-int/2addr v7, v5

    .line 47
    invoke-virtual {v4}, Lc1/b;->b()I

    .line 48
    .line 49
    .line 50
    move-result v8

    .line 51
    iget v9, v4, Lc1/b;->f:I

    .line 52
    .line 53
    iget v10, v4, Lc1/b;->g:I

    .line 54
    .line 55
    invoke-direct {v6, v7, v8, v9, v10}, Lcom/android/launcher3/util/C;-><init>(IIII)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v4}, Lc1/b;->a()I

    .line 59
    .line 60
    .line 61
    move-result v7

    .line 62
    add-int/2addr v7, v5

    .line 63
    const/4 v8, -0x1

    .line 64
    if-eq v7, v8, :cond_1

    .line 65
    .line 66
    invoke-virtual {v4}, Lc1/b;->b()I

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    if-ne v7, v8, :cond_2

    .line 71
    .line 72
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v8, "copyCurrentStateToSolution, it is error: "

    .line 78
    .line 79
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    new-instance v8, Ljava/lang/Throwable;

    .line 83
    .line 84
    new-instance v9, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .line 88
    .line 89
    const-string v10, "cellX:"

    .line 90
    .line 91
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v4}, Lc1/b;->a()I

    .line 95
    .line 96
    .line 97
    move-result v10

    .line 98
    add-int/2addr v10, v5

    .line 99
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v5, " cellY:"

    .line 103
    .line 104
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v4}, Lc1/b;->b()I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    invoke-direct {v8, v4}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v8}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    const-string v5, "CellLayout"

    .line 133
    .line 134
    invoke-static {v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    :cond_2
    invoke-virtual {p1, v3, v6}, Lc1/e;->b(Landroid/view/View;Lcom/android/launcher3/util/C;)V

    .line 138
    .line 139
    .line 140
    add-int/lit8 v2, v2, 0x1

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_3
    return-void
.end method
