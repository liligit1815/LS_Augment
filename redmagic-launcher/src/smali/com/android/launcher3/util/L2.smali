.class public Lcom/android/launcher3/util/L2;
.super Landroid/view/TouchDelegate;
.source "TransformingTouchDelegate.java"


# static fields
.field private static final g:Landroid/graphics/Rect;


# instance fields
.field private final a:Landroid/graphics/RectF;

.field private final b:Landroid/graphics/RectF;

.field private c:F

.field private d:Z

.field private e:Landroid/view/View;

.field private f:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/util/L2;->g:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/L2;->g:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/util/L2;->e:Landroid/view/View;

    .line 7
    .line 8
    new-instance p1, Landroid/graphics/RectF;

    .line 9
    .line 10
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/launcher3/util/L2;->a:Landroid/graphics/RectF;

    .line 14
    .line 15
    new-instance p1, Landroid/graphics/RectF;

    .line 16
    .line 17
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/android/launcher3/util/L2;->b:Landroid/graphics/RectF;

    .line 21
    .line 22
    return-void
.end method

.method private b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/L2;->b:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/util/L2;->a:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/util/L2;->b:Landroid/graphics/RectF;

    .line 9
    .line 10
    iget p0, p0, Lcom/android/launcher3/util/L2;->c:F

    .line 11
    .line 12
    neg-float v1, p0

    .line 13
    neg-float p0, p0

    .line 14
    invoke-virtual {v0, v1, p0}, Landroid/graphics/RectF;->inset(FF)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a(IIII)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/L2;->a:Landroid/graphics/RectF;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    int-to-float p2, p2

    .line 5
    int-to-float p3, p3

    .line 6
    int-to-float p4, p4

    .line 7
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/util/L2;->b()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x3

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-boolean v1, p0, Lcom/android/launcher3/util/L2;->f:Z

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    iget-boolean v1, p0, Lcom/android/launcher3/util/L2;->f:Z

    .line 22
    .line 23
    iput-boolean v2, p0, Lcom/android/launcher3/util/L2;->f:Z

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/util/L2;->b:Landroid/graphics/RectF;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    invoke-virtual {v0, v3, v4}, Landroid/graphics/RectF;->contains(FF)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput-boolean v0, p0, Lcom/android/launcher3/util/L2;->f:Z

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/util/L2;->a:Landroid/graphics/RectF;

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    invoke-virtual {v0, v3, v4}, Landroid/graphics/RectF;->contains(FF)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    xor-int/2addr v0, v1

    .line 59
    iput-boolean v0, p0, Lcom/android/launcher3/util/L2;->d:Z

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    :goto_0
    move v1, v2

    .line 63
    :goto_1
    if-eqz v1, :cond_5

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    iget-boolean v2, p0, Lcom/android/launcher3/util/L2;->d:Z

    .line 74
    .line 75
    if-eqz v2, :cond_4

    .line 76
    .line 77
    iget-object v2, p0, Lcom/android/launcher3/util/L2;->a:Landroid/graphics/RectF;

    .line 78
    .line 79
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    iget-object v3, p0, Lcom/android/launcher3/util/L2;->a:Landroid/graphics/RectF;

    .line 84
    .line 85
    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-virtual {p1, v2, v3}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_4
    iget-object v2, p0, Lcom/android/launcher3/util/L2;->a:Landroid/graphics/RectF;

    .line 94
    .line 95
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 96
    .line 97
    neg-float v3, v3

    .line 98
    iget v2, v2, Landroid/graphics/RectF;->top:F

    .line 99
    .line 100
    neg-float v2, v2

    .line 101
    invoke-virtual {p1, v3, v2}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 102
    .line 103
    .line 104
    :goto_2
    iget-object p0, p0, Lcom/android/launcher3/util/L2;->e:Landroid/view/View;

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 111
    .line 112
    .line 113
    return p0

    .line 114
    :cond_5
    return v2
.end method
