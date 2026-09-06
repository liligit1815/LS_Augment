.class public Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;
.super Landroid/widget/FrameLayout;
.source "ColorRoundRectView.java"

# interfaces
.implements LT1/c;
.implements LT1/i;


# instance fields
.field private g:Landroid/graphics/PointF;

.field private h:I

.field private i:Z

.field private j:I

.field private k:F

.field private l:F

.field private m:I

.field private n:LT1/g;

.field private o:LT1/f;

.field private p:Lcom/android/launcher3/streamer/colorpicker/c;

.field private q:Lcom/android/launcher3/streamer/colorpicker/d;

.field private r:LT1/d;

.field private s:LT1/c;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Landroid/graphics/PointF;

    invoke-direct {p2}, Landroid/graphics/PointF;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->g:Landroid/graphics/PointF;

    const p2, 0xff80404

    .line 4
    iput p2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->h:I

    .line 5
    new-instance p2, Lcom/android/launcher3/streamer/colorpicker/c;

    invoke-direct {p2}, Lcom/android/launcher3/streamer/colorpicker/c;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->p:Lcom/android/launcher3/streamer/colorpicker/c;

    .line 6
    new-instance p2, Lcom/android/launcher3/streamer/colorpicker/d;

    invoke-direct {p2, p0}, Lcom/android/launcher3/streamer/colorpicker/d;-><init>(LT1/i;)V

    iput-object p2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->q:Lcom/android/launcher3/streamer/colorpicker/d;

    .line 7
    new-instance p2, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView$a;

    invoke-direct {p2, p0}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView$a;-><init>(Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;)V

    iput-object p2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->r:LT1/d;

    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f070a71

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->m:I

    .line 9
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 p3, -0x1

    invoke-direct {p2, p3, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 10
    new-instance v0, LT1/f;

    invoke-direct {v0, p1}, LT1/f;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 11
    iget v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->m:I

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 12
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    invoke-virtual {p0, v0, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p2, p3, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 14
    new-instance p3, LT1/g;

    invoke-direct {p3, p1}, LT1/g;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->n:LT1/g;

    .line 15
    invoke-virtual {p0, p3, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static bridge synthetic b(Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;IZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->f(IZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c(I)V
    .locals 3

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    invoke-static {p1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    int-to-float p1, p1

    .line 14
    const/4 v1, 0x1

    .line 15
    aget v1, v0, v1

    .line 16
    .line 17
    iget v2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->k:F

    .line 18
    .line 19
    mul-float/2addr v1, v2

    .line 20
    add-float/2addr p1, v1

    .line 21
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    int-to-float v1, v1

    .line 28
    const/4 v2, 0x2

    .line 29
    aget v0, v0, v2

    .line 30
    .line 31
    const/high16 v2, 0x3f800000    # 1.0f

    .line 32
    .line 33
    sub-float/2addr v2, v0

    .line 34
    iget v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->l:F

    .line 35
    .line 36
    mul-float/2addr v2, v0

    .line 37
    add-float/2addr v1, v2

    .line 38
    invoke-direct {p0, p1, v1}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->g(FF)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private e(FF)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    sub-float/2addr p1, v0

    .line 9
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    sub-float/2addr p2, v0

    .line 17
    const/4 v0, 0x3

    .line 18
    new-array v0, v0, [F

    .line 19
    .line 20
    iget v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->j:I

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 23
    .line 24
    .line 25
    iget v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->k:F

    .line 26
    .line 27
    div-float/2addr p1, v1

    .line 28
    const/4 v1, 0x1

    .line 29
    aput p1, v0, v1

    .line 30
    .line 31
    iget p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->l:F

    .line 32
    .line 33
    div-float/2addr p2, p0

    .line 34
    const/high16 p0, 0x3f800000    # 1.0f

    .line 35
    .line 36
    sub-float/2addr p0, p2

    .line 37
    const/4 p1, 0x2

    .line 38
    aput p0, v0, p1

    .line 39
    .line 40
    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0
.end method

.method private f(IZZ)V
    .locals 5

    .line 1
    iput p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->j:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, LT1/f;->setBaseColor(I)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    new-array v1, v1, [F

    .line 13
    .line 14
    invoke-static {p1, v1}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    int-to-float v2, v2

    .line 24
    aget v3, v1, v0

    .line 25
    .line 26
    iget v4, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->k:F

    .line 27
    .line 28
    mul-float/2addr v3, v4

    .line 29
    add-float/2addr v2, v3

    .line 30
    iget-object v3, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 31
    .line 32
    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    int-to-float v3, v3

    .line 37
    const/4 v4, 0x2

    .line 38
    aget v1, v1, v4

    .line 39
    .line 40
    const/high16 v4, 0x3f800000    # 1.0f

    .line 41
    .line 42
    sub-float/2addr v4, v1

    .line 43
    iget v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->l:F

    .line 44
    .line 45
    mul-float/2addr v4, v1

    .line 46
    add-float/2addr v3, v4

    .line 47
    invoke-direct {p0, v2, v3}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->g(FF)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->g:Landroid/graphics/PointF;

    .line 52
    .line 53
    iget v1, p1, Landroid/graphics/PointF;->x:F

    .line 54
    .line 55
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 56
    .line 57
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->e(FF)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    :goto_0
    iput p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->h:I

    .line 62
    .line 63
    iget-boolean v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->i:Z

    .line 64
    .line 65
    if-nez v1, :cond_1

    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->p:Lcom/android/launcher3/streamer/colorpicker/c;

    .line 68
    .line 69
    invoke-virtual {v0, p1, p2, p3}, Lcom/android/launcher3/streamer/colorpicker/c;->a(IZZ)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    if-eqz p3, :cond_2

    .line 74
    .line 75
    iget-object p3, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->p:Lcom/android/launcher3/streamer/colorpicker/c;

    .line 76
    .line 77
    invoke-virtual {p3, p1, p2, v0}, Lcom/android/launcher3/streamer/colorpicker/c;->a(IZZ)V

    .line 78
    .line 79
    .line 80
    :cond_2
    :goto_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method private g(FF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->g:Landroid/graphics/PointF;

    .line 2
    .line 3
    iput p1, v0, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    iput p2, v0, Landroid/graphics/PointF;->y:F

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->n:LT1/g;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, LT1/g;->setCurrentPoint(Landroid/graphics/PointF;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public C(LT1/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->p:Lcom/android/launcher3/streamer/colorpicker/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/colorpicker/c;->C(LT1/d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a(Landroid/view/MotionEvent;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-float v2, v2

    .line 16
    cmpg-float v2, v0, v2

    .line 17
    .line 18
    if-ltz v2, :cond_4

    .line 19
    .line 20
    iget-object v2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    iget-object v3, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 27
    .line 28
    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    sub-int/2addr v2, v3

    .line 33
    int-to-float v2, v2

    .line 34
    cmpl-float v2, v0, v2

    .line 35
    .line 36
    if-gtz v2, :cond_4

    .line 37
    .line 38
    iget-object v2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    int-to-float v2, v2

    .line 45
    cmpg-float v2, v1, v2

    .line 46
    .line 47
    if-ltz v2, :cond_4

    .line 48
    .line 49
    iget-object v2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object v3, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    sub-int/2addr v2, v3

    .line 62
    int-to-float v2, v2

    .line 63
    cmpl-float v2, v1, v2

    .line 64
    .line 65
    if-lez v2, :cond_0

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    const/4 v2, 0x1

    .line 73
    if-ne p1, v2, :cond_1

    .line 74
    .line 75
    move p1, v2

    .line 76
    goto :goto_0

    .line 77
    :cond_1
    const/4 p1, 0x0

    .line 78
    :goto_0
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->e(FF)I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    iput v3, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->h:I

    .line 83
    .line 84
    iget-boolean v4, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->i:Z

    .line 85
    .line 86
    if-eqz v4, :cond_2

    .line 87
    .line 88
    if-eqz p1, :cond_3

    .line 89
    .line 90
    :cond_2
    iget-object v4, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->p:Lcom/android/launcher3/streamer/colorpicker/c;

    .line 91
    .line 92
    invoke-virtual {v4, v3, v2, p1}, Lcom/android/launcher3/streamer/colorpicker/c;->a(IZZ)V

    .line 93
    .line 94
    .line 95
    :cond_3
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->g(FF)V

    .line 96
    .line 97
    .line 98
    :cond_4
    :goto_1
    return-void
.end method

.method public d(LT1/c;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->r:LT1/d;

    .line 4
    .line 5
    invoke-interface {p1, v0}, LT1/c;->C(LT1/d;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, LT1/c;->getColor()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-direct {p0, v0, v1, v1}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->f(IZZ)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->s:LT1/c;

    .line 17
    .line 18
    return-void
.end method

.method public getColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->p:Lcom/android/launcher3/streamer/colorpicker/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/colorpicker/c;->getColor()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k(LT1/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->p:Lcom/android/launcher3/streamer/colorpicker/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/colorpicker/c;->k(LT1/d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 5
    .line 6
    invoke-virtual {p3}, Landroid/view/View;->getPaddingLeft()I

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    sub-int/2addr p1, p3

    .line 11
    iget-object p3, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 12
    .line 13
    invoke-virtual {p3}, Landroid/view/View;->getPaddingRight()I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    sub-int/2addr p1, p3

    .line 18
    int-to-float p1, p1

    .line 19
    iput p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->k:F

    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    sub-int/2addr p2, p1

    .line 28
    iget-object p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->o:LT1/f;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    sub-int/2addr p2, p1

    .line 35
    int-to-float p1, p2

    .line 36
    iput p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->l:F

    .line 37
    .line 38
    iget p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->h:I

    .line 39
    .line 40
    invoke-direct {p0, p1}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->c(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    if-eq v0, v2, :cond_1

    .line 12
    .line 13
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->a(Landroid/view/MotionEvent;)V

    .line 19
    .line 20
    .line 21
    return v1

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->q:Lcom/android/launcher3/streamer/colorpicker/d;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/colorpicker/d;->a(Landroid/view/MotionEvent;)V

    .line 25
    .line 26
    .line 27
    return v1
.end method

.method public setOnlyUpdateOnTouchEventUp(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->i:Z

    .line 2
    .line 3
    return-void
.end method
