.class public Lcom/android/launcher3/anim/F;
.super Landroid/animation/ValueAnimator;
.source "BoomAnimator.java"


# instance fields
.field private g:[[LV0/a;

.field private h:Landroid/graphics/Paint;

.field private i:Landroid/view/View;

.field private j:LS0/a;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/Rect;LS0/a;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p4, p0, Lcom/android/launcher3/anim/F;->j:LS0/a;

    .line 5
    .line 6
    new-instance p4, Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-direct {p4}, Landroid/graphics/Paint;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p4, p0, Lcom/android/launcher3/anim/F;->h:Landroid/graphics/Paint;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/launcher3/anim/F;->i:Landroid/view/View;

    .line 14
    .line 15
    const/4 p1, 0x2

    .line 16
    new-array p1, p1, [F

    .line 17
    .line 18
    fill-array-data p1, :array_0

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 22
    .line 23
    .line 24
    const-wide/16 v0, 0x500

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/anim/F;->j:LS0/a;

    .line 30
    .line 31
    invoke-virtual {p1, p2, p3}, LS0/a;->a(Landroid/graphics/Bitmap;Landroid/graphics/Rect;)[[LV0/a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/android/launcher3/anim/F;->g:[[LV0/a;

    .line 36
    .line 37
    return-void

    .line 38
    nop

    .line 39
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public a(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isStarted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/anim/F;->g:[[LV0/a;

    .line 9
    .line 10
    array-length v1, v0

    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    :goto_0
    if-ge v3, v1, :cond_2

    .line 14
    .line 15
    aget-object v4, v0, v3

    .line 16
    .line 17
    array-length v5, v4

    .line 18
    move v6, v2

    .line 19
    :goto_1
    if-ge v6, v5, :cond_1

    .line 20
    .line 21
    aget-object v7, v4, v6

    .line 22
    .line 23
    iget-object v8, p0, Lcom/android/launcher3/anim/F;->h:Landroid/graphics/Paint;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v9

    .line 29
    check-cast v9, Ljava/lang/Float;

    .line 30
    .line 31
    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result v9

    .line 35
    invoke-virtual {v7, p1, v8, v9}, LV0/a;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;F)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 v6, v6, 0x1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/anim/F;->i:Landroid/view/View;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public start()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/anim/F;->i:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
