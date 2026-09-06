.class public Lcom/zte/mifavor/widget/n;
.super Ljava/lang/Object;
.source "MetaBall.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b([F[F)F
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

.method private c([F)F
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

.method private d(FF)[F
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


# virtual methods
.method public a(Landroid/graphics/Canvas;IIIIIILandroid/graphics/Paint;FFF)V
    .locals 27

    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p9

    .line 1
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    sub-int v5, v1, p4

    int-to-float v5, v5

    .line 2
    iput v5, v4, Landroid/graphics/RectF;->left:F

    sub-int v6, v2, p4

    int-to-float v6, v6

    .line 3
    iput v6, v4, Landroid/graphics/RectF;->top:F

    const/4 v7, 0x2

    mul-int/lit8 v8, p4, 0x2

    int-to-float v8, v8

    add-float/2addr v5, v8

    .line 4
    iput v5, v4, Landroid/graphics/RectF;->right:F

    add-float/2addr v6, v8

    .line 5
    iput v6, v4, Landroid/graphics/RectF;->bottom:F

    .line 6
    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    sub-int v6, p5, p7

    int-to-float v6, v6

    .line 7
    iput v6, v5, Landroid/graphics/RectF;->left:F

    sub-int v8, p6, p7

    int-to-float v8, v8

    .line 8
    iput v8, v5, Landroid/graphics/RectF;->top:F

    mul-int/lit8 v9, p7, 0x2

    int-to-float v9, v9

    add-float/2addr v6, v9

    .line 9
    iput v6, v5, Landroid/graphics/RectF;->right:F

    add-float/2addr v8, v9

    .line 10
    iput v8, v5, Landroid/graphics/RectF;->bottom:F

    .line 11
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    .line 12
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    move-result v8

    new-array v9, v7, [F

    const/4 v10, 0x0

    aput v6, v9, v10

    const/4 v6, 0x1

    aput v8, v9, v6

    .line 13
    invoke-virtual {v5}, Landroid/graphics/RectF;->centerX()F

    move-result v8

    .line 14
    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v11

    new-array v12, v7, [F

    aput v8, v12, v10

    aput v11, v12, v6

    .line 15
    invoke-direct {v0, v9, v12}, Lcom/zte/mifavor/widget/n;->b([F[F)F

    move-result v8

    .line 16
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v11

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v11, v13

    .line 17
    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    div-float/2addr v5, v13

    const/4 v14, 0x0

    cmpl-float v15, v11, v14

    if-eqz v15, :cond_5

    cmpl-float v15, v5, v14

    if-nez v15, :cond_0

    goto/16 :goto_1

    :cond_0
    cmpl-float v15, v8, p11

    if-gtz v15, :cond_5

    sub-float v15, v11, v5

    .line 18
    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    move-result v16

    cmpg-float v16, v8, v16

    if-gtz v16, :cond_1

    goto/16 :goto_1

    :cond_1
    add-float v16, v11, v5

    cmpg-float v17, v8, v16

    if-gez v17, :cond_2

    mul-float v14, v11, v11

    mul-float v17, v8, v8

    add-float v18, v14, v17

    mul-float v19, v5, v5

    sub-float v18, v18, v19

    mul-float v20, v11, v13

    mul-float v20, v20, v8

    move/from16 p4, v6

    div-float v6, v18, v20

    move/from16 p5, v13

    move/from16 p6, v14

    float-to-double v13, v6

    .line 19
    invoke-static {v13, v14}, Ljava/lang/Math;->acos(D)D

    move-result-wide v13

    double-to-float v14, v13

    add-float v19, v19, v17

    sub-float v19, v19, p6

    mul-float v13, v5, p5

    mul-float/2addr v13, v8

    div-float v6, v19, v13

    move/from16 p6, v10

    move/from16 p7, v11

    float-to-double v10, v6

    .line 20
    invoke-static {v10, v11}, Ljava/lang/Math;->acos(D)D

    move-result-wide v10

    double-to-float v6, v10

    goto :goto_0

    :cond_2
    move/from16 p4, v6

    move/from16 p6, v10

    move/from16 p7, v11

    move/from16 p5, v13

    move v6, v14

    .line 21
    :goto_0
    aget v10, v12, p6

    aget v11, v9, p6

    sub-float/2addr v10, v11

    aget v11, v12, p4

    aget v13, v9, p4

    sub-float/2addr v11, v13

    new-array v13, v7, [F

    aput v10, v13, p6

    aput v11, v13, p4

    .line 22
    aget v10, v13, p4

    float-to-double v10, v10

    aget v13, v13, p6

    move/from16 v18, v8

    float-to-double v7, v13

    invoke-static {v10, v11, v7, v8}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v7

    double-to-float v7, v7

    div-float v15, v15, v18

    float-to-double v10, v15

    .line 23
    invoke-static {v10, v11}, Ljava/lang/Math;->acos(D)D

    move-result-wide v10

    double-to-float v8, v10

    add-float v10, v7, v14

    sub-float v11, v8, v14

    mul-float/2addr v11, v3

    add-float/2addr v10, v11

    sub-float v13, v7, v14

    sub-float/2addr v13, v11

    float-to-double v14, v7

    const-wide v19, 0x400921fb54442d18L    # Math.PI

    add-double v21, v14, v19

    float-to-double v6, v6

    sub-double v21, v21, v6

    sub-double v23, v19, v6

    move-wide/from16 v25, v6

    float-to-double v6, v8

    sub-double v23, v23, v6

    float-to-double v6, v3

    mul-double v23, v23, v6

    sub-double v6, v21, v23

    double-to-float v6, v6

    sub-double v14, v14, v19

    add-double v14, v14, v25

    add-double v14, v14, v23

    double-to-float v7, v14

    move/from16 v11, p7

    .line 24
    invoke-direct {v0, v10, v11}, Lcom/zte/mifavor/widget/n;->d(FF)[F

    move-result-object v8

    .line 25
    invoke-direct {v0, v13, v11}, Lcom/zte/mifavor/widget/n;->d(FF)[F

    move-result-object v14

    .line 26
    invoke-direct {v0, v6, v5}, Lcom/zte/mifavor/widget/n;->d(FF)[F

    move-result-object v15

    .line 27
    invoke-direct {v0, v7, v5}, Lcom/zte/mifavor/widget/n;->d(FF)[F

    move-result-object v19

    .line 28
    aget v20, v8, p6

    aget v21, v9, p6

    add-float v20, v20, v21

    aget v8, v8, p4

    aget v9, v9, p4

    add-float/2addr v8, v9

    move/from16 p7, v5

    const/4 v3, 0x2

    new-array v5, v3, [F

    aput v20, v5, p6

    aput v8, v5, p4

    .line 29
    aget v8, v14, p6

    add-float v8, v8, v21

    aget v14, v14, p4

    add-float/2addr v14, v9

    new-array v9, v3, [F

    aput v8, v9, p6

    aput v14, v9, p4

    .line 30
    aget v8, v15, p6

    aget v14, v12, p6

    add-float/2addr v8, v14

    aget v15, v15, p4

    aget v12, v12, p4

    add-float/2addr v15, v12

    move-object/from16 v17, v5

    new-array v5, v3, [F

    aput v8, v5, p6

    aput v15, v5, p4

    .line 31
    aget v8, v19, p6

    add-float/2addr v8, v14

    aget v14, v19, p4

    add-float/2addr v14, v12

    new-array v12, v3, [F

    aput v8, v12, p6

    aput v14, v12, p4

    .line 32
    aget v8, v17, p6

    aget v14, v5, p6

    sub-float/2addr v8, v14

    aget v14, v17, p4

    aget v15, v5, p4

    sub-float/2addr v14, v15

    new-array v3, v3, [F

    aput v8, v3, p6

    aput v14, v3, p4

    mul-float v8, p9, p10

    .line 33
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/n;->c([F)F

    move-result v3

    div-float v3, v3, v16

    invoke-static {v8, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    mul-float v8, v18, p5

    div-float v8, v8, v16

    const/high16 v14, 0x3f800000    # 1.0f

    .line 34
    invoke-static {v14, v8}, Ljava/lang/Math;->min(FF)F

    move-result v8

    mul-float/2addr v3, v8

    mul-float/2addr v11, v3

    mul-float v3, v3, p7

    const v8, 0x3fc90fdb

    sub-float/2addr v10, v8

    .line 35
    invoke-direct {v0, v10, v11}, Lcom/zte/mifavor/widget/n;->d(FF)[F

    move-result-object v10

    add-float/2addr v6, v8

    .line 36
    invoke-direct {v0, v6, v3}, Lcom/zte/mifavor/widget/n;->d(FF)[F

    move-result-object v6

    sub-float/2addr v7, v8

    .line 37
    invoke-direct {v0, v7, v3}, Lcom/zte/mifavor/widget/n;->d(FF)[F

    move-result-object v3

    add-float/2addr v13, v8

    .line 38
    invoke-direct {v0, v13, v11}, Lcom/zte/mifavor/widget/n;->d(FF)[F

    move-result-object v0

    .line 39
    aget v7, v9, p4

    int-to-float v2, v2

    sub-float/2addr v7, v2

    aget v8, v9, p6

    div-float/2addr v7, v8

    int-to-float v1, v1

    sub-float/2addr v7, v1

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->atan(D)D

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v7

    double-to-float v7, v7

    .line 40
    aget v8, v12, p4

    sub-float/2addr v8, v2

    aget v2, v12, p6

    div-float/2addr v8, v2

    sub-float/2addr v8, v1

    float-to-double v1, v8

    invoke-static {v1, v2}, Ljava/lang/Math;->atan(D)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v1

    double-to-float v1, v1

    const/high16 v2, 0x43340000    # 180.0f

    cmpl-float v8, v7, v2

    const/high16 v11, 0x42b40000    # 90.0f

    if-lez v8, :cond_3

    sub-float/2addr v7, v11

    :cond_3
    cmpl-float v2, v1, v2

    if-lez v2, :cond_4

    sub-float v7, v1, v11

    .line 41
    :cond_4
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    .line 42
    aget v8, v17, p6

    aget v13, v17, p4

    invoke-virtual {v2, v8, v13}, Landroid/graphics/Path;->moveTo(FF)V

    .line 43
    aget v8, v17, p6

    aget v13, v10, p6

    add-float v19, v8, v13

    aget v8, v17, p4

    aget v10, v10, p4

    add-float v20, v8, v10

    aget v23, v5, p6

    aget v8, v6, p6

    add-float v21, v23, v8

    aget v24, v5, p4

    aget v5, v6, p4

    add-float v22, v24, v5

    move-object/from16 v18, v2

    invoke-virtual/range {v18 .. v24}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 44
    aget v5, v12, p6

    aget v6, v12, p4

    invoke-virtual {v2, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 45
    aget v5, v12, p6

    aget v6, v3, p6

    add-float v19, v5, v6

    aget v5, v12, p4

    aget v3, v3, p4

    add-float v20, v5, v3

    aget v23, v9, p6

    aget v3, v0, p6

    add-float v21, v23, v3

    aget v24, v9, p4

    aget v0, v0, p4

    add-float v22, v24, v0

    invoke-virtual/range {v18 .. v24}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    sub-float/2addr v7, v11

    sub-float/2addr v1, v11

    .line 46
    invoke-virtual {v2, v4, v7, v1}, Landroid/graphics/Path;->addArc(Landroid/graphics/RectF;FF)V

    .line 47
    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    move-object/from16 v0, p1

    move-object/from16 v1, p8

    .line 48
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_5
    :goto_1
    return-void
.end method
