.class public Lcom/android/launcher3/oneshot/TransparentBorderView;
.super Landroid/view/View;
.source "TransparentBorderView.java"


# static fields
.field public static r:I = 0x1

.field public static s:I = 0x2


# instance fields
.field private final g:Ljava/lang/String;

.field private h:F

.field private i:I

.field private j:I

.field private k:Landroid/graphics/Paint;

.field private l:I

.field private m:I

.field private n:F

.field private o:F

.field private p:F

.field private q:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "TransparentBorderView"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->g:Ljava/lang/String;

    .line 7
    .line 8
    sget v0, Lcom/android/launcher3/oneshot/TransparentBorderView;->r:I

    .line 9
    .line 10
    iput v0, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->q:I

    .line 11
    .line 12
    sget-object v0, Lcom/android/launcher3/x5;->U0:[I

    .line 13
    .line 14
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p2, v0, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->q:I

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, p1}, Lcom/android/launcher3/oneshot/TransparentBorderView;->b(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private a(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v4, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v5, v0

    .line 11
    iget-object v6, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->k:Landroid/graphics/Paint;

    .line 12
    .line 13
    const/16 v7, 0x1f

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    move-object v1, p1

    .line 18
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/high16 v0, -0x1000000

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Landroid/graphics/Path;

    .line 28
    .line 29
    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 33
    .line 34
    .line 35
    iget v0, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->l:I

    .line 36
    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    :cond_0
    iget v3, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->m:I

    .line 44
    .line 45
    if-nez v3, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    :cond_1
    move v8, v3

    .line 52
    iget v3, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->i:I

    .line 53
    .line 54
    sub-int/2addr v3, v0

    .line 55
    div-int/lit8 v3, v3, 0x2

    .line 56
    .line 57
    int-to-float v3, v3

    .line 58
    iget v4, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->o:F

    .line 59
    .line 60
    add-float/2addr v3, v4

    .line 61
    iget v4, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->j:I

    .line 62
    .line 63
    sub-int/2addr v4, v8

    .line 64
    div-int/lit8 v4, v4, 0x2

    .line 65
    .line 66
    int-to-float v4, v4

    .line 67
    iget v5, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->p:F

    .line 68
    .line 69
    add-float v9, v4, v5

    .line 70
    .line 71
    iget v4, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->q:I

    .line 72
    .line 73
    sget v5, Lcom/android/launcher3/oneshot/TransparentBorderView;->s:I

    .line 74
    .line 75
    if-ne v4, v5, :cond_2

    .line 76
    .line 77
    iget v4, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->n:F

    .line 78
    .line 79
    sub-float v4, v9, v4

    .line 80
    .line 81
    int-to-float v5, v0

    .line 82
    add-float/2addr v5, v3

    .line 83
    iget v6, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->h:F

    .line 84
    .line 85
    add-float/2addr v6, v9

    .line 86
    sget-object v7, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 87
    .line 88
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    int-to-float v0, v0

    .line 92
    add-float v5, v3, v0

    .line 93
    .line 94
    int-to-float v0, v8

    .line 95
    add-float v6, v9, v0

    .line 96
    .line 97
    iget v7, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->h:F

    .line 98
    .line 99
    move v4, v9

    .line 100
    sget-object v9, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 101
    .line 102
    move v8, v7

    .line 103
    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->k:Landroid/graphics/Paint;

    .line 107
    .line 108
    new-instance v3, Landroid/graphics/PorterDuffXfermode;

    .line 109
    .line 110
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 111
    .line 112
    invoke-direct {v3, v4}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->k:Landroid/graphics/Paint;

    .line 119
    .line 120
    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->k:Landroid/graphics/Paint;

    .line 124
    .line 125
    const/4 v0, 0x0

    .line 126
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method private b(Landroid/content/Context;)V
    .locals 1

    .line 1
    new-instance p1, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->k:Landroid/graphics/Paint;

    .line 8
    .line 9
    const/high16 v0, -0x1000000

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->k:Landroid/graphics/Paint;

    .line 15
    .line 16
    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public c(FIIFFF)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->h:F

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->l:I

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->m:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->n:F

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->o:F

    .line 10
    .line 11
    iput p6, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->p:F

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public d(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->i:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/oneshot/TransparentBorderView;->j:I

    .line 4
    .line 5
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/android/launcher3/oneshot/TransparentBorderView;->a(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
