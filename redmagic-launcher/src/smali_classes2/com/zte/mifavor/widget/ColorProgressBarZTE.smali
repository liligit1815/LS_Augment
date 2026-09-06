.class public Lcom/zte/mifavor/widget/ColorProgressBarZTE;
.super Landroid/view/View;
.source "ColorProgressBarZTE.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/ColorProgressBarZTE$a;
    }
.end annotation


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private D:I

.field private E:I

.field private F:I

.field private G:I

.field private H:I

.field private I:[F

.field private J:Landroid/graphics/Path;

.field private K:F

.field private final g:Ljava/lang/String;

.field private h:Z

.field private i:F

.field private j:F

.field private k:F

.field private l:I

.field private m:I

.field private n:I

.field private o:Z

.field private p:F

.field private q:F

.field private r:F

.field private s:I

.field private t:Z

.field private u:Z

.field private v:F

.field private w:F

.field private x:Landroid/graphics/Paint;

.field private y:[I

.field private z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget v0, LR3/c;->d:I

    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 11

    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    const-string v1, "ColorProgressBarZTE"

    iput-object v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->g:Ljava/lang/String;

    const/4 v2, 0x0

    .line 4
    iput-boolean v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->h:Z

    const/4 v3, 0x1

    .line 5
    iput-boolean v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->u:Z

    .line 6
    iput v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->z:I

    .line 7
    iput v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->A:I

    .line 8
    iput v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->B:I

    .line 9
    iput v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->C:I

    .line 10
    iput v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->D:I

    const/4 v4, 0x0

    .line 11
    iput v4, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->K:F

    .line 12
    sget-object v5, LR3/m;->o0:[I

    invoke-virtual {p1, p2, v5, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 13
    sget p3, LR3/m;->v0:I

    invoke-virtual {p2, p3, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p3

    iput p3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 14
    sget p3, LR3/m;->u0:I

    const/high16 v4, 0x42c80000    # 100.0f

    invoke-virtual {p2, p3, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p3

    iput p3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 15
    sget p3, LR3/m;->w0:I

    iget v4, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    invoke-virtual {p2, p3, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p3

    iput p3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 16
    sget p3, LR3/m;->B0:I

    invoke-direct {p0, v0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->d(I)I

    move-result v4

    invoke-virtual {p2, p3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    .line 17
    sget p3, LR3/m;->z0:I

    invoke-virtual {p2, p3, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->o:Z

    .line 18
    sget p3, LR3/m;->A0:I

    const-string v4, "#FF000000"

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p2, p3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p3

    iput p3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->n:I

    .line 19
    sget p3, LR3/m;->s0:I

    sget v4, LR3/d;->k:I

    invoke-static {p1, v4}, Lz/a;->c(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {p2, p3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p3

    .line 20
    sget v4, LR3/m;->t0:I

    sget v5, LR3/d;->l:I

    invoke-static {p1, v5}, Lz/a;->c(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p2, v4, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    .line 21
    filled-new-array {p3, p1}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->y:[I

    .line 22
    sget p1, LR3/m;->p0:I

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result p3

    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->setEnabled(Z)V

    .line 23
    sget p1, LR3/m;->x0:I

    iget p3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    div-int/2addr p3, v0

    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->E:I

    .line 24
    sget p1, LR3/m;->y0:I

    iget p3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    div-int/2addr p3, v0

    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->F:I

    .line 25
    sget p1, LR3/m;->q0:I

    iget p3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    div-int/2addr p3, v0

    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->G:I

    .line 26
    sget p1, LR3/m;->r0:I

    iget p3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    div-int/2addr p3, v0

    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->H:I

    .line 27
    iget p3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->E:I

    int-to-float v4, p3

    int-to-float p3, p3

    iget v5, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->F:I

    int-to-float v6, v5

    int-to-float v5, v5

    int-to-float v7, p1

    int-to-float p1, p1

    iget v8, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->G:I

    int-to-float v9, v8

    int-to-float v8, v8

    const/16 v10, 0x8

    new-array v10, v10, [F

    aput v4, v10, v2

    aput p3, v10, v3

    aput v6, v10, v0

    const/4 p3, 0x3

    aput v5, v10, p3

    const/4 p3, 0x4

    aput v7, v10, p3

    const/4 p3, 0x5

    aput p1, v10, p3

    const/4 p1, 0x6

    aput v9, v10, p1

    const/4 p1, 0x7

    aput v8, v10, p1

    iput-object v10, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->I:[F

    .line 28
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 29
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->x:Landroid/graphics/Paint;

    .line 30
    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 31
    iget-object p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->x:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 32
    iget-object p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->x:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 33
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->f()V

    .line 34
    sget-boolean p1, Lcom/zte/mifavor/widget/u;->b:Z

    if-eqz p1, :cond_0

    .line 35
    invoke-virtual {p0, v2}, Landroid/view/View;->setForceDarkAllowed(Z)V

    .line 36
    :cond_0
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->h:Z

    if-eqz p1, :cond_1

    .line 37
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "ColorProgressBarZTE out. mTrackSize = "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", mTopLeftRadius="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->E:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", mBottomRightRadius="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->H:I

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-void
.end method

.method private a([III)Landroid/graphics/Bitmap;
    .locals 4

    .line 1
    const-string v0, "ColorProgressBarZTE"

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-gtz p2, :cond_0

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v3, "build Bitmap width error, width = "

    .line 12
    .line 13
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, v1}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->d(I)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    :cond_0
    if-gtz p3, :cond_1

    .line 31
    .line 32
    new-instance v2, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v3, "build Bitmap height error, height = "

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    invoke-static {v0, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    invoke-direct {p0, v1}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->d(I)I

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    :cond_1
    :try_start_0
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .line 57
    .line 58
    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 59
    .line 60
    .line 61
    const/4 v3, 0x0

    .line 62
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, p1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 69
    .line 70
    .line 71
    sget-object p1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 72
    .line 73
    invoke-virtual {v2, p1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 74
    .line 75
    .line 76
    iget p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    .line 77
    .line 78
    div-int/2addr p1, v1

    .line 79
    int-to-float p1, p1

    .line 80
    invoke-virtual {v2, p1}, Landroid/graphics/drawable/GradientDrawable;->setGradientRadius(F)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->I:[F

    .line 84
    .line 85
    invoke-virtual {v2, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2, v3, v3, p2, p3}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2}, Landroid/graphics/drawable/GradientDrawable;->getOpacity()I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    const/4 v3, -0x1

    .line 96
    if-eq p1, v3, :cond_2

    .line 97
    .line 98
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :catch_0
    move-exception p1

    .line 102
    goto :goto_1

    .line 103
    :cond_2
    sget-object p1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 104
    .line 105
    :goto_0
    invoke-static {p2, p3, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    new-instance p2, Landroid/graphics/Canvas;

    .line 110
    .line 111
    invoke-direct {p2, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2, p2}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    .line 116
    .line 117
    return-object p1

    .line 118
    :goto_1
    const-string p2, "build Bitmap error, e = "

    .line 119
    .line 120
    invoke-static {v0, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 121
    .line 122
    .line 123
    invoke-direct {p0, v1}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->d(I)I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    invoke-direct {p0, v1}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->d(I)I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    sget-object p2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 132
    .line 133
    invoke-static {p1, p0, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    return-object p0
.end method

.method private b()F
    .locals 2

    .line 1
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 2
    .line 3
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->v:F

    .line 4
    .line 5
    sub-float/2addr v0, v1

    .line 6
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->p:F

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->r:F

    .line 10
    .line 11
    div-float/2addr v0, v1

    .line 12
    iget p0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 13
    .line 14
    add-float/2addr v0, p0

    .line 15
    return v0
.end method

.method private declared-synchronized c(I)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->h:Z

    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const-string p1, "ColorProgressBarZTE"

    .line 7
    .line 8
    const-string v0, "doProgressRefresh error, doProgressRefresh is null."

    .line 9
    .line 10
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw p1
.end method

.method private d(I)I
    .locals 1

    .line 1
    int-to-float p0, p1

    .line 2
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {v0, p0, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    float-to-int p0, p0

    .line 16
    return p0
.end method

.method private e(F)F
    .locals 1

    .line 1
    float-to-double p0, p1

    .line 2
    :try_start_0
    invoke-static {p0, p1}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    const/4 p1, 0x1

    .line 7
    const/4 v0, 0x4

    .line 8
    invoke-virtual {p0, p1, v0}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/math/BigDecimal;->floatValue()F

    .line 13
    .line 14
    .line 15
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    return p0

    .line 17
    :catch_0
    move-exception p0

    .line 18
    new-instance p1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v0, "format Float error, e = "

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "ColorProgressBarZTE"

    .line 36
    .line 37
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method private f()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 2
    .line 3
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 4
    .line 5
    sub-float/2addr v0, v1

    .line 6
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    float-to-double v0, v0

    .line 11
    const-wide v2, 0x3f50624dd2f1a9fcL    # 0.001

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    cmpg-double v0, v0, v2

    .line 17
    .line 18
    if-gez v0, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 22
    .line 23
    const/high16 v0, 0x42c80000    # 100.0f

    .line 24
    .line 25
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 26
    .line 27
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 28
    .line 29
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 30
    .line 31
    cmpl-float v2, v0, v1

    .line 32
    .line 33
    if-lez v2, :cond_1

    .line 34
    .line 35
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 36
    .line 37
    iput v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 38
    .line 39
    :cond_1
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 40
    .line 41
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 42
    .line 43
    cmpg-float v0, v0, v1

    .line 44
    .line 45
    if-gez v0, :cond_2

    .line 46
    .line 47
    iput v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 48
    .line 49
    :cond_2
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 50
    .line 51
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 52
    .line 53
    cmpl-float v0, v0, v1

    .line 54
    .line 55
    if-lez v0, :cond_3

    .line 56
    .line 57
    iput v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 58
    .line 59
    :cond_3
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 60
    .line 61
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->l:I

    .line 66
    .line 67
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 68
    .line 69
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 70
    .line 71
    sub-float/2addr v0, v1

    .line 72
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->p:F

    .line 73
    .line 74
    return-void
.end method

.method private g(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->r:F

    .line 10
    .line 11
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->p:F

    .line 12
    .line 13
    div-float/2addr v0, v2

    .line 14
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 15
    .line 16
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 17
    .line 18
    sub-float/2addr v2, v3

    .line 19
    mul-float/2addr v0, v2

    .line 20
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->v:F

    .line 21
    .line 22
    add-float/2addr v2, v0

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    int-to-float v0, v0

    .line 28
    const/high16 v3, 0x40000000    # 2.0f

    .line 29
    .line 30
    div-float/2addr v0, v3

    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    sub-float/2addr v3, v2

    .line 36
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    sub-float/2addr v4, v2

    .line 41
    mul-float/2addr v3, v4

    .line 42
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    sub-float/2addr v2, v0

    .line 47
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    sub-float/2addr p1, v0

    .line 52
    mul-float/2addr v2, p1

    .line 53
    add-float/2addr v3, v2

    .line 54
    iget p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->v:F

    .line 55
    .line 56
    const/16 v0, 0x8

    .line 57
    .line 58
    invoke-direct {p0, v0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->d(I)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    int-to-float v2, v2

    .line 63
    add-float/2addr p1, v2

    .line 64
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->v:F

    .line 65
    .line 66
    invoke-direct {p0, v0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->d(I)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    int-to-float p0, p0

    .line 71
    add-float/2addr v2, p0

    .line 72
    mul-float/2addr p1, v2

    .line 73
    cmpg-float p0, v3, p1

    .line 74
    .line 75
    if-gtz p0, :cond_1

    .line 76
    .line 77
    const/4 p0, 0x1

    .line 78
    return p0

    .line 79
    :cond_1
    return v1
.end method

.method private h(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    int-to-float v1, v1

    .line 16
    cmpl-float v0, v0, v1

    .line 17
    .line 18
    if-ltz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    sub-int/2addr v0, p0

    .line 33
    int-to-float p0, v0

    .line 34
    cmpg-float p0, p1, p0

    .line 35
    .line 36
    if-gtz p0, :cond_0

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method private i()F
    .locals 2

    .line 1
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->h:Z

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "processProgress progress = "

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v1, "ColorProgressBarZTE"

    .line 25
    .line 26
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    :cond_0
    return v0
.end method


# virtual methods
.method public getMax()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 2
    .line 3
    return p0
.end method

.method public getMin()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 2
    .line 3
    return p0
.end method

.method public declared-synchronized getProgress()I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i()F

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    monitor-exit p0

    .line 11
    return v0

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw v0
.end method

.method public getProgressFloat()F
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->e(F)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method protected declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->x:Landroid/graphics/Paint;

    .line 6
    .line 7
    if-eqz v0, :cond_9

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_3

    .line 12
    .line 13
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 14
    .line 15
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 16
    .line 17
    cmpg-float v1, v0, v1

    .line 18
    .line 19
    if-gez v1, :cond_1

    .line 20
    .line 21
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 22
    .line 23
    const-string v0, "ColorProgressBarZTE"

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v2, "on Draw , mProgress = "

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, ", mMax = "

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception p1

    .line 59
    goto/16 :goto_4

    .line 60
    .line 61
    :cond_1
    :goto_0
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 62
    .line 63
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 64
    .line 65
    cmpg-float v0, v0, v1

    .line 66
    .line 67
    if-gez v0, :cond_2

    .line 68
    .line 69
    iput v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 70
    .line 71
    const-string v0, "ColorProgressBarZTE"

    .line 72
    .line 73
    new-instance v1, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v2, "on Draw , mProgress = "

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string v2, ", mMin = "

    .line 89
    .line 90
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    :cond_2
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 106
    .line 107
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 108
    .line 109
    sub-float/2addr v0, v1

    .line 110
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->p:F

    .line 111
    .line 112
    iget-object v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->x:Landroid/graphics/Paint;

    .line 113
    .line 114
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->n:I

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->J:Landroid/graphics/Path;

    .line 120
    .line 121
    if-eqz v0, :cond_3

    .line 122
    .line 123
    iget-object v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->x:Landroid/graphics/Paint;

    .line 124
    .line 125
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 126
    .line 127
    .line 128
    :cond_3
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->v:F

    .line 129
    .line 130
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->r:F

    .line 131
    .line 132
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->p:F

    .line 133
    .line 134
    div-float/2addr v1, v2

    .line 135
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 136
    .line 137
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 138
    .line 139
    sub-float v4, v2, v3

    .line 140
    .line 141
    mul-float/2addr v1, v4

    .line 142
    add-float/2addr v0, v1

    .line 143
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 144
    .line 145
    cmpl-float v1, v2, v3

    .line 146
    .line 147
    if-lez v1, :cond_6

    .line 148
    .line 149
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->B:I

    .line 150
    .line 151
    int-to-float v1, v1

    .line 152
    sub-float/2addr v0, v1

    .line 153
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    .line 154
    .line 155
    div-int/lit8 v1, v1, 0x2

    .line 156
    .line 157
    int-to-float v1, v1

    .line 158
    add-float/2addr v0, v1

    .line 159
    float-to-int v0, v0

    .line 160
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->s:I

    .line 161
    .line 162
    if-le v0, v1, :cond_4

    .line 163
    .line 164
    move v0, v1

    .line 165
    :cond_4
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->h:Z

    .line 166
    .line 167
    if-eqz v1, :cond_5

    .line 168
    .line 169
    const-string v1, "ColorProgressBarZTE"

    .line 170
    .line 171
    new-instance v2, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .line 175
    .line 176
    const-string v3, "on Draw +++++ , mProgress = "

    .line 177
    .line 178
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 182
    .line 183
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    const-string v3, ", mThumbCenterX = "

    .line 187
    .line 188
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 192
    .line 193
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    const-string v3, ", width = "

    .line 197
    .line 198
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    const-string v3, ", mTrackSize = "

    .line 205
    .line 206
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    .line 210
    .line 211
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    const-string v3, ", mLeftPadding = "

    .line 215
    .line 216
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->B:I

    .line 220
    .line 221
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    const-string v3, ", mDelta = "

    .line 225
    .line 226
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->p:F

    .line 230
    .line 231
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    .line 240
    .line 241
    :cond_5
    iget-object v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->x:Landroid/graphics/Paint;

    .line 242
    .line 243
    iget-object v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->y:[I

    .line 244
    .line 245
    const/4 v3, 0x0

    .line 246
    aget v2, v2, v3

    .line 247
    .line 248
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 249
    .line 250
    .line 251
    iget-object v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->y:[I

    .line 252
    .line 253
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    .line 254
    .line 255
    invoke-direct {p0, v1, v0, v2}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->a([III)Landroid/graphics/Bitmap;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->B:I

    .line 260
    .line 261
    int-to-float v1, v1

    .line 262
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->D:I

    .line 263
    .line 264
    int-to-float v2, v2

    .line 265
    iget-object v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->x:Landroid/graphics/Paint;

    .line 266
    .line 267
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 268
    .line 269
    .line 270
    goto :goto_1

    .line 271
    :cond_6
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->h:Z

    .line 272
    .line 273
    if-eqz p1, :cond_7

    .line 274
    .line 275
    const-string p1, "ColorProgressBarZTE"

    .line 276
    .line 277
    new-instance v0, Ljava/lang/StringBuilder;

    .line 278
    .line 279
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 280
    .line 281
    .line 282
    const-string v1, "on Draw +++++ , mProgress = "

    .line 283
    .line 284
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 288
    .line 289
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    const-string v1, ", mThumbCenterX = "

    .line 293
    .line 294
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 298
    .line 299
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    .line 308
    .line 309
    :cond_7
    :goto_1
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->u:Z

    .line 310
    .line 311
    if-eqz p1, :cond_8

    .line 312
    .line 313
    const/high16 p1, 0x3f800000    # 1.0f

    .line 314
    .line 315
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 316
    .line 317
    .line 318
    goto :goto_2

    .line 319
    :cond_8
    const p1, 0x3e851eb8    # 0.26f

    .line 320
    .line 321
    .line 322
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 323
    .line 324
    .line 325
    :goto_2
    monitor-exit p0

    .line 326
    return-void

    .line 327
    :cond_9
    :goto_3
    monitor-exit p0

    .line 328
    return-void

    .line 329
    :goto_4
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 330
    throw p1
.end method

.method protected declared-synchronized onMeasure(II)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    iput p2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->z:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iput p2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->A:I

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    iput p2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->C:I

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    iput p2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->B:I

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    iput p2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->D:I

    .line 34
    .line 35
    const/16 p2, 0xb4

    .line 36
    .line 37
    invoke-direct {p0, p2}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->d(I)I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-static {p2, p1}, Landroid/view/View;->resolveSize(II)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    .line 50
    .line 51
    add-int/2addr p2, v0

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    add-int/2addr p2, v0

    .line 57
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 58
    .line 59
    .line 60
    iget p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->B:I

    .line 61
    .line 62
    iget p2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    .line 63
    .line 64
    div-int/lit8 v0, p2, 0x2

    .line 65
    .line 66
    add-int/2addr p1, v0

    .line 67
    int-to-float p1, p1

    .line 68
    iput p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->v:F

    .line 69
    .line 70
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->z:I

    .line 71
    .line 72
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->C:I

    .line 73
    .line 74
    sub-int/2addr v0, v1

    .line 75
    div-int/lit8 v1, p2, 0x2

    .line 76
    .line 77
    sub-int/2addr v0, v1

    .line 78
    int-to-float v0, v0

    .line 79
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->w:F

    .line 80
    .line 81
    sub-float/2addr v0, p1

    .line 82
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->r:F

    .line 83
    .line 84
    mul-int/lit8 p2, p2, 0x2

    .line 85
    .line 86
    int-to-float p1, p2

    .line 87
    add-float/2addr v0, p1

    .line 88
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->s:I

    .line 93
    .line 94
    new-instance p1, Landroid/graphics/Path;

    .line 95
    .line 96
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->J:Landroid/graphics/Path;

    .line 100
    .line 101
    new-instance p1, Landroid/graphics/RectF;

    .line 102
    .line 103
    iget p2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->B:I

    .line 104
    .line 105
    int-to-float v0, p2

    .line 106
    iget v1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->D:I

    .line 107
    .line 108
    int-to-float v2, v1

    .line 109
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->s:I

    .line 110
    .line 111
    add-int/2addr p2, v3

    .line 112
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    .line 113
    .line 114
    sub-int/2addr p2, v3

    .line 115
    int-to-float p2, p2

    .line 116
    add-int/2addr v1, v3

    .line 117
    int-to-float v1, v1

    .line 118
    invoke-direct {p1, v0, v2, p2, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 119
    .line 120
    .line 121
    iget-object p2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->J:Landroid/graphics/Path;

    .line 122
    .line 123
    iget-object v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->I:[F

    .line 124
    .line 125
    sget-object v1, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 126
    .line 127
    invoke-virtual {p2, p1, v0, v1}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 128
    .line 129
    .line 130
    const-string p1, "ColorProgressBarZTE"

    .line 131
    .line 132
    new-instance p2, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .line 136
    .line 137
    const-string v0, "on Measure out, mViewWidth="

    .line 138
    .line 139
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->z:I

    .line 143
    .line 144
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v0, ", mViewHeight="

    .line 148
    .line 149
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->A:I

    .line 153
    .line 154
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string v0, ", mTopPadding="

    .line 158
    .line 159
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->D:I

    .line 163
    .line 164
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v0, ", mRightPadding="

    .line 168
    .line 169
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->C:I

    .line 173
    .line 174
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    const-string v0, ", mLeftPadding="

    .line 178
    .line 179
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->B:I

    .line 183
    .line 184
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string v0, ", mSBLeft="

    .line 188
    .line 189
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->v:F

    .line 193
    .line 194
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    const-string v0, ", mSBRight="

    .line 198
    .line 199
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->w:F

    .line 203
    .line 204
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v0, ", mTrackLength="

    .line 208
    .line 209
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->r:F

    .line 213
    .line 214
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    const-string v0, ", mLength="

    .line 218
    .line 219
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->s:I

    .line 223
    .line 224
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    const-string v0, "mMax="

    .line 228
    .line 229
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 233
    .line 234
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    const-string v0, ", mMin="

    .line 238
    .line 239
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 243
    .line 244
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    const-string v0, ", mDelta="

    .line 248
    .line 249
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->p:F

    .line 253
    .line 254
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    const-string v0, " mTrackSize="

    .line 258
    .line 259
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->m:I

    .line 263
    .line 264
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    const-string v0, ", mTopLeftRadius="

    .line 268
    .line 269
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->E:I

    .line 273
    .line 274
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string v0, ", mBottomRightRadius="

    .line 278
    .line 279
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->H:I

    .line 283
    .line 284
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object p2

    .line 291
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 292
    .line 293
    .line 294
    monitor-exit p0

    .line 295
    return-void

    .line 296
    :catchall_0
    move-exception p1

    .line 297
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 298
    throw p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x1

    .line 16
    if-eqz v0, :cond_6

    .line 17
    .line 18
    if-eq v0, v2, :cond_5

    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    if-eq v0, v3, :cond_1

    .line 22
    .line 23
    const/4 v3, 0x3

    .line 24
    if-eq v0, v3, :cond_5

    .line 25
    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->t:Z

    .line 29
    .line 30
    if-eqz v0, :cond_b

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->K:F

    .line 37
    .line 38
    add-float/2addr v0, v3

    .line 39
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 40
    .line 41
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->v:F

    .line 42
    .line 43
    cmpg-float v0, v0, v3

    .line 44
    .line 45
    if-gez v0, :cond_2

    .line 46
    .line 47
    iput v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 48
    .line 49
    :cond_2
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 50
    .line 51
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->w:F

    .line 52
    .line 53
    cmpl-float v0, v0, v3

    .line 54
    .line 55
    if-lez v0, :cond_3

    .line 56
    .line 57
    iput v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 58
    .line 59
    :cond_3
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->b()F

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->getProgress()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 70
    .line 71
    .line 72
    iget-boolean v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->h:Z

    .line 73
    .line 74
    if-eqz v3, :cond_4

    .line 75
    .line 76
    new-instance v3, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v4, "ACTION_MOVE invalidate, mPreProgress = "

    .line 82
    .line 83
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget v4, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->l:I

    .line 87
    .line 88
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v4, ", localPregress = "

    .line 92
    .line 93
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    const-string v4, "ColorProgressBarZTE"

    .line 104
    .line 105
    invoke-static {v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    :cond_4
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->l:I

    .line 109
    .line 110
    if-eq v3, v0, :cond_b

    .line 111
    .line 112
    invoke-direct {p0, v0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->c(I)V

    .line 113
    .line 114
    .line 115
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->l:I

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->getProgress()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-direct {p0, v0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->c(I)V

    .line 130
    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_6
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 141
    .line 142
    .line 143
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->g(Landroid/view/MotionEvent;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->t:Z

    .line 148
    .line 149
    if-eqz v0, :cond_7

    .line 150
    .line 151
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_7
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->o:Z

    .line 156
    .line 157
    if-eqz v0, :cond_a

    .line 158
    .line 159
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->h(Landroid/view/MotionEvent;)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_a

    .line 164
    .line 165
    iput-boolean v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->t:Z

    .line 166
    .line 167
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 172
    .line 173
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->v:F

    .line 174
    .line 175
    cmpg-float v0, v0, v3

    .line 176
    .line 177
    if-gez v0, :cond_8

    .line 178
    .line 179
    iput v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 180
    .line 181
    :cond_8
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 182
    .line 183
    iget v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->w:F

    .line 184
    .line 185
    cmpl-float v0, v0, v3

    .line 186
    .line 187
    if-lez v0, :cond_9

    .line 188
    .line 189
    iput v3, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 190
    .line 191
    :cond_9
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->b()F

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 196
    .line 197
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->l:I

    .line 202
    .line 203
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 204
    .line 205
    .line 206
    :cond_a
    :goto_0
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->q:F

    .line 207
    .line 208
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 209
    .line 210
    .line 211
    move-result v3

    .line 212
    sub-float/2addr v0, v3

    .line 213
    iput v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->K:F

    .line 214
    .line 215
    :cond_b
    :goto_1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->t:Z

    .line 216
    .line 217
    if-nez v0, :cond_d

    .line 218
    .line 219
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->o:Z

    .line 220
    .line 221
    if-nez v0, :cond_d

    .line 222
    .line 223
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    if-eqz p0, :cond_c

    .line 228
    .line 229
    goto :goto_2

    .line 230
    :cond_c
    return v1

    .line 231
    :cond_d
    :goto_2
    return v2
.end method

.method public setColors([I)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq v1, v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iput-object p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->y:[I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    :goto_0
    const-string p0, "ColorProgressBarZTE"

    .line 15
    .line 16
    const-string p1, "set color, the colors is error."

    .line 17
    .line 18
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setDEBUG(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEnabled(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->u:Z

    .line 5
    .line 6
    return-void
.end method

.method public setMax(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMin(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnProgressChangeListener(Lcom/zte/mifavor/widget/ColorProgressBarZTE$a;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "set OnProgress Change Listener is "

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "ColorProgressBarZTE"

    .line 19
    .line 20
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setProgress(F)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->h:Z

    .line 2
    .line 3
    const-string v1, "ColorProgressBarZTE"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "set Progress is "

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v2, ", max = "

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, ", min = "

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget v2, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 48
    .line 49
    sub-float/2addr v0, p1

    .line 50
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    float-to-double v2, v0

    .line 55
    const-wide v4, 0x3f50624dd2f1a9fcL    # 0.001

    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    cmpg-double v0, v2, v4

    .line 61
    .line 62
    if-gez v0, :cond_1

    .line 63
    .line 64
    iget p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->j:F

    .line 65
    .line 66
    :cond_1
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 67
    .line 68
    sub-float/2addr v0, p1

    .line 69
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    float-to-double v2, v0

    .line 74
    cmpg-double v0, v2, v4

    .line 75
    .line 76
    if-gez v0, :cond_2

    .line 77
    .line 78
    iget p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->i:F

    .line 79
    .line 80
    :cond_2
    iput p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 83
    .line 84
    .line 85
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->h:Z

    .line 86
    .line 87
    if-eqz p1, :cond_3

    .line 88
    .line 89
    new-instance p1, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .line 93
    .line 94
    const-string v0, "invalidate and set Progress is mProgress = "

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget v0, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    :cond_3
    iget p1, p0, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->k:F

    .line 112
    .line 113
    float-to-int p1, p1

    .line 114
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->c(I)V

    .line 115
    .line 116
    .line 117
    return-void
.end method
