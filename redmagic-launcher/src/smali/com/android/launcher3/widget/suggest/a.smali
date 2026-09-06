.class public Lcom/android/launcher3/widget/suggest/a;
.super Landroid/widget/ImageView;
.source "SuggestCustomIconImgView.java"

# interfaces
.implements Lcom/android/launcher3/widget/suggest/e;


# static fields
.field private static p:[I

.field private static final q:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "[I>;"
        }
    .end annotation
.end field


# instance fields
.field private g:I

.field private h:Lx1/v;

.field private i:Ljava/lang/String;

.field private j:Ljava/lang/String;

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/widget/suggest/a;->p:[I

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/widget/suggest/a$a;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/android/launcher3/widget/suggest/a$a;-><init>()V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/android/launcher3/widget/suggest/a;->q:Ljava/util/HashMap;

    .line 16
    .line 17
    return-void

    .line 18
    nop

    .line 19
    :array_0
    .array-data 4
        0xb
        0xb
        0xb
        0xb
        0xb
        0xb
        0xb
        0xb
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/suggest/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/suggest/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/android/launcher3/X3;->h(Landroid/content/Context;)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/suggest/a;->k:I

    .line 5
    iput p2, p0, Lcom/android/launcher3/widget/suggest/a;->l:I

    .line 6
    sget-object p2, Lcom/android/launcher3/widget/suggest/a;->p:[I

    iput-object p2, p0, Lcom/android/launcher3/widget/suggest/a;->o:[I

    .line 7
    invoke-virtual {p0}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f070a9d

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/suggest/a;->g:I

    .line 8
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p1

    iget p1, p1, Lcom/android/launcher3/h0;->B1:I

    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/suggest/a;->setIconSize(I)V

    :cond_0
    return-void
.end method

.method static bridge synthetic a()[I
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/suggest/a;->p:[I

    .line 2
    .line 3
    return-object v0
.end method

.method private c(Z)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Lcom/android/launcher3/r4;->N:I

    .line 10
    .line 11
    mul-int/lit8 p0, p0, 0x2

    .line 12
    .line 13
    int-to-float p0, p0

    .line 14
    invoke-static {p0}, Lcom/android/launcher3/N5;->i(F)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private d(Landroid/content/Context;II[I)[F
    .locals 4

    .line 1
    if-lez p2, :cond_0

    .line 2
    .line 3
    if-lez p3, :cond_0

    .line 4
    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    array-length p0, p4

    .line 8
    sget-object v0, Lcom/android/launcher3/widget/suggest/a;->p:[I

    .line 9
    .line 10
    array-length v0, v0

    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    :cond_0
    sget-object p4, Lcom/android/launcher3/widget/suggest/a;->p:[I

    .line 14
    .line 15
    :cond_1
    array-length p0, p4

    .line 16
    new-array p0, p0, [F

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    :goto_0
    array-length v1, p4

    .line 20
    if-ge v0, v1, :cond_7

    .line 21
    .line 22
    rem-int/lit8 v1, v0, 0x2

    .line 23
    .line 24
    if-nez v1, :cond_6

    .line 25
    .line 26
    add-int/lit8 v1, v0, 0x1

    .line 27
    .line 28
    array-length v2, p4

    .line 29
    if-lt v1, v2, :cond_2

    .line 30
    .line 31
    goto :goto_3

    .line 32
    :cond_2
    aget v2, p4, v0

    .line 33
    .line 34
    aget v3, p4, v1

    .line 35
    .line 36
    if-gez v2, :cond_3

    .line 37
    .line 38
    if-gez v3, :cond_3

    .line 39
    .line 40
    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    div-int/lit8 v2, v2, 0x2

    .line 45
    .line 46
    move v3, v2

    .line 47
    goto :goto_2

    .line 48
    :cond_3
    if-gez v2, :cond_4

    .line 49
    .line 50
    div-int/lit8 v2, p2, 0x2

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_4
    int-to-float v2, v2

    .line 54
    invoke-static {p1, v2}, Lx1/O;->F(Landroid/content/Context;F)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    :goto_1
    if-gez v3, :cond_5

    .line 59
    .line 60
    div-int/lit8 v3, p3, 0x2

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_5
    int-to-float v3, v3

    .line 64
    invoke-static {p1, v3}, Lx1/O;->F(Landroid/content/Context;F)I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    :goto_2
    int-to-float v2, v2

    .line 69
    aput v2, p0, v0

    .line 70
    .line 71
    int-to-float v2, v3

    .line 72
    aput v2, p0, v1

    .line 73
    .line 74
    :cond_6
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_7
    return-object p0
.end method

.method private e()Z
    .locals 1

    .line 1
    const v0, 0x7f0b059b

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    instance-of v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isBanner()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method


# virtual methods
.method public b(FF)Z
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/ImageView;->getRight()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    invoke-virtual {p0}, Landroid/widget/ImageView;->getBottom()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    int-to-float p0, p0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v0, v2, v2, v1, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lx1/v;->u(Landroid/view/View;Z)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/a;->h:Lx1/v;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lx1/v;

    .line 13
    .line 14
    const-string v2, "SuggestCustomIconImgView"

    .line 15
    .line 16
    invoke-direct {v1, p0, v2, v0}, Lx1/v;-><init>(Landroid/view/View;Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/android/launcher3/widget/suggest/a;->h:Lx1/v;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/a;->h:Lx1/v;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lx1/v;->g(Landroid/view/MotionEvent;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/suggest/a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/ImageView;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/ImageView;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    :goto_0
    invoke-virtual {p0}, Landroid/widget/ImageView;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-lez v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/ImageView;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    :goto_1
    new-instance v2, Landroid/graphics/Path;

    .line 38
    .line 39
    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    .line 40
    .line 41
    .line 42
    new-instance v3, Landroid/graphics/RectF;

    .line 43
    .line 44
    int-to-float v4, v0

    .line 45
    int-to-float v5, v1

    .line 46
    const/4 v6, 0x0

    .line 47
    invoke-direct {v3, v6, v6, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    iget-object v5, p0, Lcom/android/launcher3/widget/suggest/a;->o:[I

    .line 55
    .line 56
    invoke-direct {p0, v4, v0, v1, v5}, Lcom/android/launcher3/widget/suggest/a;->d(Landroid/content/Context;II[I)[F

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget-object v1, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 61
    .line 62
    invoke-virtual {v2, v3, v0, v1}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 66
    .line 67
    .line 68
    :cond_2
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method protected onMeasure(II)V
    .locals 7

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/suggest/a;->l:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/widget/suggest/a;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const v1, 0x7f0b059b

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    instance-of v2, v1, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    check-cast v1, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;

    .line 21
    .line 22
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/suggest/a;->c(Z)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    int-to-float v3, p1

    .line 36
    invoke-virtual {v1}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->getSpanX()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    sub-int/2addr v4, v0

    .line 41
    iget v5, p0, Lcom/android/launcher3/widget/suggest/a;->m:I

    .line 42
    .line 43
    mul-int/2addr v4, v5

    .line 44
    sub-int/2addr p1, v4

    .line 45
    int-to-float p1, p1

    .line 46
    const/high16 v4, 0x3f800000    # 1.0f

    .line 47
    .line 48
    mul-float/2addr p1, v4

    .line 49
    invoke-virtual {v1}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->getSpanX()I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    int-to-float v5, v5

    .line 54
    div-float/2addr p1, v5

    .line 55
    iget v5, p0, Lcom/android/launcher3/widget/suggest/a;->k:I

    .line 56
    .line 57
    sub-int/2addr v5, v2

    .line 58
    int-to-float v5, v5

    .line 59
    sub-float/2addr p1, v5

    .line 60
    sub-float/2addr v3, p1

    .line 61
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    int-to-float v3, p2

    .line 66
    invoke-virtual {v1}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->getSpanY()I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    sub-int/2addr v5, v0

    .line 71
    iget v0, p0, Lcom/android/launcher3/widget/suggest/a;->n:I

    .line 72
    .line 73
    mul-int/2addr v5, v0

    .line 74
    sub-int/2addr p2, v5

    .line 75
    int-to-float p2, p2

    .line 76
    mul-float/2addr p2, v4

    .line 77
    invoke-virtual {v1}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->getSpanY()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    int-to-float v0, v0

    .line 82
    div-float/2addr p2, v0

    .line 83
    iget v0, p0, Lcom/android/launcher3/widget/suggest/a;->k:I

    .line 84
    .line 85
    sub-int/2addr v0, v2

    .line 86
    int-to-float v0, v0

    .line 87
    sub-float/2addr p2, v0

    .line 88
    sub-float/2addr v3, p2

    .line 89
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    move v6, v0

    .line 94
    move v0, p1

    .line 95
    move p1, v6

    .line 96
    goto :goto_0

    .line 97
    :cond_0
    move p1, v0

    .line 98
    :goto_0
    const/high16 p2, 0x40000000    # 2.0f

    .line 99
    .line 100
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    invoke-super {p0, v0, p1}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public setIconSize(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/suggest/a;->k:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/android/launcher3/widget/suggest/a;->k:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/suggest/a;->c(Z)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    sub-int/2addr p1, v0

    .line 13
    iput p1, p0, Lcom/android/launcher3/widget/suggest/a;->l:I

    .line 14
    .line 15
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v0, "setIconSize mIconSize="

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget v0, p0, Lcom/android/launcher3/widget/suggest/a;->k:I

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v0, " mImageViewSize="

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget p0, p0, Lcom/android/launcher3/widget/suggest/a;->l:I

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "SuggestCustomIconImgView"

    .line 45
    .line 46
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public setTag(ILjava/lang/Object;)V
    .locals 7

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    const p2, 0x7f0b059b

    .line 5
    .line 6
    .line 7
    if-ne p1, p2, :cond_6

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/widget/suggest/a;->e()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget-object p2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object p2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0, p2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 21
    .line 22
    .line 23
    if-eqz p1, :cond_6

    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/widget/suggest/a;->i:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/widget/suggest/a;->j:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    :cond_1
    const-string p1, "persist.sys.theme_icon_name"

    .line 42
    .line 43
    const-string p2, ""

    .line 44
    .line 45
    invoke-static {p1, p2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/a;->i:Ljava/lang/String;

    .line 50
    .line 51
    const-string p1, "persist.sys.icon_config_mask"

    .line 52
    .line 53
    invoke-static {p1, p2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/a;->j:Ljava/lang/String;

    .line 58
    .line 59
    sget-object p2, Lcom/android/launcher3/widget/suggest/a;->q:Ljava/util/HashMap;

    .line 60
    .line 61
    sget-object v0, Lcom/android/launcher3/widget/suggest/a;->p:[I

    .line 62
    .line 63
    invoke-virtual {p2, p1, v0}, Ljava/util/HashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, [I

    .line 68
    .line 69
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/a;->o:[I

    .line 70
    .line 71
    iget-object p1, p0, Lcom/android/launcher3/widget/suggest/a;->i:Ljava/lang/String;

    .line 72
    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-string p2, "default_theme"

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_2

    .line 88
    .line 89
    sget-object p1, Lcom/android/launcher3/widget/suggest/a;->p:[I

    .line 90
    .line 91
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/a;->o:[I

    .line 92
    .line 93
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    const-string p2, "setTag isBanner AppIconTagData mThemeName="

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    iget-object p2, p0, Lcom/android/launcher3/widget/suggest/a;->i:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string p2, " mIconConfigMask="

    .line 109
    .line 110
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget-object p2, p0, Lcom/android/launcher3/widget/suggest/a;->j:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string p2, " mDpRadii="

    .line 119
    .line 120
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    new-instance p2, Lcom/google/gson/f;

    .line 124
    .line 125
    invoke-direct {p2}, Lcom/google/gson/f;-><init>()V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/a;->o:[I

    .line 129
    .line 130
    invoke-virtual {p2, v0}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    const-string p2, "SuggestCustomIconImgView"

    .line 142
    .line 143
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    :cond_3
    const p1, 0x7f0b059e

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->getTag(I)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    instance-of p2, p1, Lcom/android/launcher3/widget/suggest/m;

    .line 154
    .line 155
    const/4 v0, 0x0

    .line 156
    if-eqz p2, :cond_5

    .line 157
    .line 158
    check-cast p1, Lcom/android/launcher3/widget/suggest/m;

    .line 159
    .line 160
    invoke-virtual {p1}, Lcom/android/launcher3/widget/suggest/m;->F0()Z

    .line 161
    .line 162
    .line 163
    move-result p2

    .line 164
    if-eqz p2, :cond_4

    .line 165
    .line 166
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    const/4 v5, 0x2

    .line 171
    const/4 v6, 0x0

    .line 172
    const/4 v2, 0x2

    .line 173
    const/4 v3, 0x2

    .line 174
    const/4 v4, 0x2

    .line 175
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d1(Landroid/content/Context;IIIILcom/android/launcher3/model/data/p;)Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    iget-boolean p2, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->e:Z

    .line 180
    .line 181
    if-eqz p2, :cond_5

    .line 182
    .line 183
    iget-object p1, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 184
    .line 185
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 186
    .line 187
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_4
    invoke-virtual {p1}, Lcom/android/launcher3/widget/suggest/m;->G0()Z

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    if-eqz p1, :cond_5

    .line 195
    .line 196
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    const/4 v5, 0x2

    .line 201
    const/4 v6, 0x0

    .line 202
    const/4 v2, 0x4

    .line 203
    const/4 v3, 0x2

    .line 204
    const/4 v4, 0x4

    .line 205
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d1(Landroid/content/Context;IIIILcom/android/launcher3/model/data/p;)Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    iget-boolean p2, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->e:Z

    .line 210
    .line 211
    if-eqz p2, :cond_5

    .line 212
    .line 213
    iget-object p1, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->n:Landroid/graphics/Point;

    .line 214
    .line 215
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 216
    .line 217
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 218
    .line 219
    goto :goto_1

    .line 220
    :cond_5
    move p1, v0

    .line 221
    :goto_1
    iput v0, p0, Lcom/android/launcher3/widget/suggest/a;->m:I

    .line 222
    .line 223
    iput p1, p0, Lcom/android/launcher3/widget/suggest/a;->n:I

    .line 224
    .line 225
    :cond_6
    return-void
.end method
