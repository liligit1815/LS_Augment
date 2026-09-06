.class public Lcom/zte/mifavor/widget/ProgressDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ProgressDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/ProgressDrawable$d;,
        Lcom/zte/mifavor/widget/ProgressDrawable$b;,
        Lcom/zte/mifavor/widget/ProgressDrawable$c;
    }
.end annotation


# static fields
.field private static final CIRCLE_DISTANCE:F = 360.0f

.field private static final CIRCLE_INTERVAL:I = 0xa0

.field private static final CIRCLE_NUMBER:I = 0x6

.field private static final CIRCLE_PERIOD:I = 0x5dc

.field private static final CIRCLE_PRE:I = 0x28

.field private static final CIRCLE_START_END:I = 0x28

.field private static final CIRCLE_TOTAL_TIME:I = 0x8fc

.field private static final PROGRESS_SPEED:I = 0x78

.field private static final TAG:Ljava/lang/String; = "ProgressDrawable"


# instance fields
.field private curEndX:I

.field private curEndY:I

.field private curStartEndRadius:I

.field private mCircleRadiusDelay:I

.field private mCircleRadiusRun:I

.field private mCircles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/zte/mifavor/widget/ProgressDrawable$d;",
            ">;"
        }
    .end annotation
.end field

.field private mMetaBall:Lcom/zte/mifavor/widget/n;

.field private mPaint:Landroid/graphics/Paint;

.field private mProgressPoint:F

.field private mProgressRadius:I

.field private mProgressX:I

.field private mProgressY:I

.field private mRect:Landroid/graphics/RectF;

.field private mStarted:Z

.field private mTimeAnimator:Landroid/animation/TimeAnimator;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->curEndX:I

    .line 6
    .line 7
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->curEndY:I

    .line 8
    .line 9
    iput v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->curStartEndRadius:I

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mCircles:Ljava/util/ArrayList;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mStarted:Z

    .line 20
    .line 21
    new-instance v1, Lcom/zte/mifavor/widget/n;

    .line 22
    .line 23
    invoke-direct {v1}, Lcom/zte/mifavor/widget/n;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mMetaBall:Lcom/zte/mifavor/widget/n;

    .line 27
    .line 28
    new-instance v1, Landroid/graphics/Paint;

    .line 29
    .line 30
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mPaint:Landroid/graphics/Paint;

    .line 34
    .line 35
    const/high16 v2, -0x1000000

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mPaint:Landroid/graphics/Paint;

    .line 41
    .line 42
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mPaint:Landroid/graphics/Paint;

    .line 48
    .line 49
    const/high16 v2, 0x40a00000    # 5.0f

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 52
    .line 53
    .line 54
    :goto_0
    const/4 v1, 0x6

    .line 55
    if-ge v0, v1, :cond_0

    .line 56
    .line 57
    iget-object v1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mCircles:Ljava/util/ArrayList;

    .line 58
    .line 59
    new-instance v2, Lcom/zte/mifavor/widget/ProgressDrawable$d;

    .line 60
    .line 61
    invoke-direct {v2, p0, v0}, Lcom/zte/mifavor/widget/ProgressDrawable$d;-><init>(Lcom/zte/mifavor/widget/ProgressDrawable;I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    add-int/lit8 v0, v0, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/ProgressDrawable;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->curEndX:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/ProgressDrawable;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->curEndY:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/widget/ProgressDrawable;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->curStartEndRadius:I

    .line 2
    .line 3
    return p0
.end method

.method private clipSquare(Landroid/graphics/Rect;)Landroid/graphics/RectF;
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    div-int/lit8 p0, p0, 0x2

    .line 22
    .line 23
    new-instance v1, Landroid/graphics/RectF;

    .line 24
    .line 25
    sub-int v2, v0, p0

    .line 26
    .line 27
    int-to-float v2, v2

    .line 28
    sub-int v3, p1, p0

    .line 29
    .line 30
    int-to-float v3, v3

    .line 31
    add-int/2addr v0, p0

    .line 32
    int-to-float v0, v0

    .line 33
    add-int/2addr p1, p0

    .line 34
    int-to-float p0, p1

    .line 35
    invoke-direct {v1, v2, v3, v0, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 36
    .line 37
    .line 38
    return-object v1
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/ProgressDrawable;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mCircleRadiusDelay:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/widget/ProgressDrawable;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mCircleRadiusRun:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/zte/mifavor/widget/ProgressDrawable;)Lcom/zte/mifavor/widget/n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mMetaBall:Lcom/zte/mifavor/widget/n;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/zte/mifavor/widget/ProgressDrawable;)Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    return-object p0
.end method

.method private generateTimeAnimtor()V
    .locals 2

    .line 1
    new-instance v0, Landroid/animation/TimeAnimator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/TimeAnimator;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mTimeAnimator:Landroid/animation/TimeAnimator;

    .line 7
    .line 8
    new-instance v1, Lcom/zte/mifavor/widget/ProgressDrawable$a;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/zte/mifavor/widget/ProgressDrawable$a;-><init>(Lcom/zte/mifavor/widget/ProgressDrawable;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/animation/TimeAnimator;->setTimeListener(Landroid/animation/TimeAnimator$TimeListener;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method static bridge synthetic h(Lcom/zte/mifavor/widget/ProgressDrawable;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mProgressPoint:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic i(Lcom/zte/mifavor/widget/ProgressDrawable;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mProgressRadius:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic j(Lcom/zte/mifavor/widget/ProgressDrawable;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mProgressX:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic k(Lcom/zte/mifavor/widget/ProgressDrawable;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mProgressY:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic l(Lcom/zte/mifavor/widget/ProgressDrawable;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->curEndX:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic m(Lcom/zte/mifavor/widget/ProgressDrawable;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->curEndY:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic n(Lcom/zte/mifavor/widget/ProgressDrawable;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->curStartEndRadius:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic o(Lcom/zte/mifavor/widget/ProgressDrawable;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mProgressPoint:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic p(Lcom/zte/mifavor/widget/ProgressDrawable;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/ProgressDrawable;->updateCircle(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private updateCircle(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mCircles:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mCircles:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/zte/mifavor/widget/ProgressDrawable$d;

    .line 17
    .line 18
    invoke-virtual {v1, p1}, Lcom/zte/mifavor/widget/ProgressDrawable$d;->b(F)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mRect:Landroid/graphics/RectF;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0x1f

    .line 5
    .line 6
    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    iget-object v2, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mCircles:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v1, v2, :cond_0

    .line 18
    .line 19
    iget-object v2, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mCircles:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/zte/mifavor/widget/ProgressDrawable$d;

    .line 26
    .line 27
    invoke-virtual {v2, p1}, Lcom/zte/mifavor/widget/ProgressDrawable$d;->a(Landroid/graphics/Canvas;)V

    .line 28
    .line 29
    .line 30
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mTimeAnimator:Landroid/animation/TimeAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/TimeAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "ProgressDrawable"

    .line 5
    .line 6
    const-string v1, "onBoundsChange"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/ProgressDrawable;->stop()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/ProgressDrawable;->clipSquare(Landroid/graphics/Rect;)Landroid/graphics/RectF;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mRect:Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    float-to-int p1, p1

    .line 25
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mProgressX:I

    .line 26
    .line 27
    iget-object p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mRect:Landroid/graphics/RectF;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    float-to-int p1, p1

    .line 34
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mProgressY:I

    .line 35
    .line 36
    iget-object p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mRect:Landroid/graphics/RectF;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    const/high16 v0, 0x40000000    # 2.0f

    .line 43
    .line 44
    div-float/2addr p1, v0

    .line 45
    const/high16 v0, 0x40800000    # 4.0f

    .line 46
    .line 47
    mul-float/2addr p1, v0

    .line 48
    const/high16 v1, 0x40a00000    # 5.0f

    .line 49
    .line 50
    div-float/2addr p1, v1

    .line 51
    float-to-int p1, p1

    .line 52
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mProgressRadius:I

    .line 53
    .line 54
    int-to-float v2, p1

    .line 55
    mul-float/2addr v2, v1

    .line 56
    const/high16 v1, 0x42000000    # 32.0f

    .line 57
    .line 58
    div-float/2addr v2, v1

    .line 59
    float-to-int v1, v2

    .line 60
    iput v1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mCircleRadiusRun:I

    .line 61
    .line 62
    int-to-float p1, p1

    .line 63
    div-float/2addr p1, v0

    .line 64
    float-to-int p1, p1

    .line 65
    iput p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mCircleRadiusDelay:I

    .line 66
    .line 67
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ProgressDrawable;->generateTimeAnimtor()V

    .line 68
    .line 69
    .line 70
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mStarted:Z

    .line 71
    .line 72
    if-eqz p1, :cond_0

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/ProgressDrawable;->start()V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mPaint:Landroid/graphics/Paint;

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
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mPaint:Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public start()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mStarted:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mTimeAnimator:Landroid/animation/TimeAnimator;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/ProgressDrawable;->isRunning()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mTimeAnimator:Landroid/animation/TimeAnimator;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/animation/TimeAnimator;->start()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mStarted:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mTimeAnimator:Landroid/animation/TimeAnimator;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/ProgressDrawable;->isRunning()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable;->mTimeAnimator:Landroid/animation/TimeAnimator;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/animation/TimeAnimator;->end()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
