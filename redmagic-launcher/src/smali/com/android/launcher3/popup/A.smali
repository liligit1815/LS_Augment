.class public Lcom/android/launcher3/popup/A;
.super Landroid/graphics/drawable/Drawable;
.source "RoundedArrowDrawable.java"


# instance fields
.field private final a:Landroid/graphics/Path;

.field private final b:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(FFFFFFFFZZI)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    move v0, p3

    move p3, p4

    move p4, p5

    move p5, p6

    move p6, p7

    move p7, p8

    .line 2
    new-instance p8, Landroid/graphics/Path;

    invoke-direct {p8}, Landroid/graphics/Path;-><init>()V

    iput-object p8, p0, Lcom/android/launcher3/popup/A;->a:Landroid/graphics/Path;

    .line 3
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/popup/A;->b:Landroid/graphics/Paint;

    .line 4
    invoke-virtual {v1, p11}, Landroid/graphics/Paint;->setColor(I)V

    .line 5
    sget-object p0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, p0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 p0, 0x1

    .line 6
    invoke-virtual {v1, p0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 7
    invoke-static {p1, p2, v0, p8}, Lcom/android/launcher3/popup/A;->a(FFFLandroid/graphics/Path;)V

    .line 8
    invoke-static/range {p3 .. p8}, Lcom/android/launcher3/popup/A;->b(FFFFFLandroid/graphics/Path;)V

    .line 9
    new-instance p0, Landroid/graphics/Matrix;

    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    const/high16 p3, -0x40800000    # -1.0f

    const/high16 p4, 0x3f800000    # 1.0f

    if-eqz p10, :cond_0

    move p5, p4

    goto :goto_0

    :cond_0
    move p5, p3

    :goto_0
    if-eqz p9, :cond_1

    goto :goto_1

    :cond_1
    move p3, p4

    :goto_1
    const/high16 p4, 0x3f000000    # 0.5f

    mul-float/2addr p1, p4

    mul-float/2addr p2, p4

    .line 10
    invoke-virtual {p0, p5, p3, p1, p2}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 11
    invoke-virtual {p8, p0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    return-void
.end method

.method private constructor <init>(FFFZZI)V
    .locals 2

    .line 12
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 13
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/popup/A;->a:Landroid/graphics/Path;

    .line 14
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/popup/A;->b:Landroid/graphics/Paint;

    .line 15
    invoke-virtual {v1, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 16
    sget-object p0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, p0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 p0, 0x1

    .line 17
    invoke-virtual {v1, p0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 18
    invoke-static {p1, p2, p3, v0}, Lcom/android/launcher3/popup/A;->a(FFFLandroid/graphics/Path;)V

    if-nez p4, :cond_1

    if-eqz p5, :cond_0

    goto :goto_0

    :cond_0
    return-void

    .line 19
    :cond_1
    :goto_0
    new-instance p0, Landroid/graphics/Matrix;

    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    if-eqz p4, :cond_3

    if-eqz p5, :cond_2

    const/16 p3, 0x5a

    goto :goto_1

    :cond_2
    const/16 p3, -0x5a

    goto :goto_1

    :cond_3
    const/16 p3, 0xb4

    :goto_1
    int-to-float p3, p3

    const/high16 p4, 0x3f000000    # 0.5f

    mul-float/2addr p1, p4

    mul-float/2addr p2, p4

    .line 20
    invoke-virtual {p0, p3, p1, p2}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 21
    invoke-virtual {v0, p0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    return-void
.end method

.method public static a(FFFLandroid/graphics/Path;)V
    .locals 14

    .line 1
    move/from16 v1, p2

    .line 2
    .line 3
    move-object/from16 v2, p3

    .line 4
    .line 5
    const/high16 v3, 0x40000000    # 2.0f

    .line 6
    .line 7
    mul-float v4, p1, v3

    .line 8
    .line 9
    div-float v4, p0, v4

    .line 10
    .line 11
    float-to-double v5, v4

    .line 12
    invoke-static {v5, v6}, Ljava/lang/Math;->atan(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide v5

    .line 16
    double-to-float v5, v5

    .line 17
    float-to-double v6, p1

    .line 18
    float-to-double v8, v1

    .line 19
    float-to-double v10, v5

    .line 20
    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    .line 21
    .line 22
    .line 23
    move-result-wide v12

    .line 24
    div-double/2addr v8, v12

    .line 25
    sub-double v8, v6, v8

    .line 26
    .line 27
    double-to-float v0, v8

    .line 28
    div-float v4, v1, v4

    .line 29
    .line 30
    float-to-double v4, v4

    .line 31
    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    .line 32
    .line 33
    .line 34
    move-result-wide v8

    .line 35
    mul-double/2addr v8, v4

    .line 36
    double-to-float v8, v8

    .line 37
    invoke-static {v10, v11}, Ljava/lang/Math;->cos(D)D

    .line 38
    .line 39
    .line 40
    move-result-wide v12

    .line 41
    mul-double/2addr v4, v12

    .line 42
    sub-double/2addr v6, v4

    .line 43
    double-to-float v4, v6

    .line 44
    div-float v5, p0, v3

    .line 45
    .line 46
    invoke-static {v10, v11}, Ljava/lang/Math;->toDegrees(D)D

    .line 47
    .line 48
    .line 49
    move-result-wide v6

    .line 50
    double-to-float v6, v6

    .line 51
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 52
    .line 53
    .line 54
    const/4 v9, 0x0

    .line 55
    invoke-virtual {v2, v9, v9}, Landroid/graphics/Path;->moveTo(FF)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, p0, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 59
    .line 60
    .line 61
    add-float/2addr v8, v5

    .line 62
    invoke-virtual {v2, v8, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 63
    .line 64
    .line 65
    sub-float v1, v5, p2

    .line 66
    .line 67
    sub-float v2, v0, p2

    .line 68
    .line 69
    add-float v5, v5, p2

    .line 70
    .line 71
    add-float v4, v0, p2

    .line 72
    .line 73
    const/high16 p0, 0x43340000    # 180.0f

    .line 74
    .line 75
    mul-float/2addr v3, v6

    .line 76
    sub-float/2addr p0, v3

    .line 77
    const/4 v7, 0x0

    .line 78
    move-object/from16 v0, p3

    .line 79
    .line 80
    move v3, v5

    .line 81
    move v5, v6

    .line 82
    move v6, p0

    .line 83
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v9, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method private static b(FFFFFLandroid/graphics/Path;)V
    .locals 8

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    sget-object v7, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    move v6, p0

    .line 11
    move v5, p0

    .line 12
    move v3, p1

    .line 13
    move v4, p2

    .line 14
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 15
    .line 16
    .line 17
    neg-float p0, p3

    .line 18
    neg-float p1, v4

    .line 19
    add-float/2addr p1, p4

    .line 20
    const/high16 p2, 0x3f000000    # 0.5f

    .line 21
    .line 22
    sub-float/2addr p1, p2

    .line 23
    invoke-virtual {v0, p0, p1}, Landroid/graphics/Path;->offset(FF)V

    .line 24
    .line 25
    .line 26
    sget-object p0, Landroid/graphics/Path$Op;->DIFFERENCE:Landroid/graphics/Path$Op;

    .line 27
    .line 28
    invoke-virtual {p5, v0, p0}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static c(FFFZI)Lcom/android/launcher3/popup/A;
    .locals 7

    .line 1
    new-instance v0, Lcom/android/launcher3/popup/A;

    .line 2
    .line 3
    const/4 v4, 0x1

    .line 4
    move v1, p0

    .line 5
    move v2, p1

    .line 6
    move v3, p2

    .line 7
    move v5, p3

    .line 8
    move v6, p4

    .line 9
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/popup/A;-><init>(FFFZZI)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/A;->a:Landroid/graphics/Path;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/popup/A;->b:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public getOutline(Landroid/graphics/Outline;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/A;->a:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/graphics/Outline;->setPath(Landroid/graphics/Path;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/A;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/A;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    return-void
.end method
