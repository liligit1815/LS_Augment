.class public LO/c;
.super Ljava/lang/Object;
.source "ViewDragHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LO/c$c;
    }
.end annotation


# static fields
.field private static final x:Landroid/view/animation/Interpolator;


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:[F

.field private e:[F

.field private f:[F

.field private g:[F

.field private h:[I

.field private i:[I

.field private j:[I

.field private k:I

.field private l:Landroid/view/VelocityTracker;

.field private m:F

.field private n:F

.field private o:I

.field private final p:I

.field private q:I

.field private r:Landroid/widget/OverScroller;

.field private final s:LO/c$c;

.field private t:Landroid/view/View;

.field private u:Z

.field private final v:Landroid/view/ViewGroup;

.field private final w:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LO/c$a;

    .line 2
    .line 3
    invoke-direct {v0}, LO/c$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LO/c;->x:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;LO/c$c;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, LO/c;->c:I

    .line 6
    .line 7
    new-instance v0, LO/c$b;

    .line 8
    .line 9
    invoke-direct {v0, p0}, LO/c$b;-><init>(LO/c;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, LO/c;->w:Ljava/lang/Runnable;

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    iput-object p2, p0, LO/c;->v:Landroid/view/ViewGroup;

    .line 19
    .line 20
    iput-object p3, p0, LO/c;->s:LO/c$c;

    .line 21
    .line 22
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    iget p3, p3, Landroid/util/DisplayMetrics;->density:F

    .line 35
    .line 36
    const/high16 v0, 0x41a00000    # 20.0f

    .line 37
    .line 38
    mul-float/2addr p3, v0

    .line 39
    const/high16 v0, 0x3f000000    # 0.5f

    .line 40
    .line 41
    add-float/2addr p3, v0

    .line 42
    float-to-int p3, p3

    .line 43
    iput p3, p0, LO/c;->p:I

    .line 44
    .line 45
    iput p3, p0, LO/c;->o:I

    .line 46
    .line 47
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    iput p3, p0, LO/c;->b:I

    .line 52
    .line 53
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    int-to-float p3, p3

    .line 58
    iput p3, p0, LO/c;->m:F

    .line 59
    .line 60
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    int-to-float p2, p2

    .line 65
    iput p2, p0, LO/c;->n:F

    .line 66
    .line 67
    new-instance p2, Landroid/widget/OverScroller;

    .line 68
    .line 69
    sget-object p3, LO/c;->x:Landroid/view/animation/Interpolator;

    .line 70
    .line 71
    invoke-direct {p2, p1, p3}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    .line 72
    .line 73
    .line 74
    iput-object p2, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 78
    .line 79
    const-string p1, "Callback may not be null"

    .line 80
    .line 81
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    throw p0

    .line 85
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 86
    .line 87
    const-string p1, "Parent view may not be null"

    .line 88
    .line 89
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    throw p0
.end method

.method private A(I)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, LO/c;->z(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "Ignoring pointerId="

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p1, " because ACTION_DOWN was not received for this pointer before ACTION_MOVE. It likely happened because  ViewDragHelper did not receive all the events in the event stream."

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "ViewDragHelper"

    .line 30
    .line 31
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method private D()V
    .locals 4

    .line 1
    iget-object v0, p0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    const/16 v1, 0x3e8

    .line 4
    .line 5
    iget v2, p0, LO/c;->m:F

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 11
    .line 12
    iget v1, p0, LO/c;->c:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v1, p0, LO/c;->n:F

    .line 19
    .line 20
    iget v2, p0, LO/c;->m:F

    .line 21
    .line 22
    invoke-direct {p0, v0, v1, v2}, LO/c;->f(FFF)F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v1, p0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 27
    .line 28
    iget v2, p0, LO/c;->c:I

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iget v2, p0, LO/c;->n:F

    .line 35
    .line 36
    iget v3, p0, LO/c;->m:F

    .line 37
    .line 38
    invoke-direct {p0, v1, v2, v3}, LO/c;->f(FFF)F

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-direct {p0, v0, v1}, LO/c;->o(FF)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private E(FFI)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, LO/c;->d(FFII)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x4

    .line 7
    invoke-direct {p0, p2, p1, p3, v1}, LO/c;->d(FFII)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    or-int/lit8 v0, v0, 0x4

    .line 14
    .line 15
    :cond_0
    const/4 v1, 0x2

    .line 16
    invoke-direct {p0, p1, p2, p3, v1}, LO/c;->d(FFII)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    or-int/lit8 v0, v0, 0x2

    .line 23
    .line 24
    :cond_1
    const/16 v1, 0x8

    .line 25
    .line 26
    invoke-direct {p0, p2, p1, p3, v1}, LO/c;->d(FFII)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    or-int/lit8 v0, v0, 0x8

    .line 33
    .line 34
    :cond_2
    if-eqz v0, :cond_3

    .line 35
    .line 36
    iget-object p1, p0, LO/c;->i:[I

    .line 37
    .line 38
    aget p2, p1, p3

    .line 39
    .line 40
    or-int/2addr p2, v0

    .line 41
    aput p2, p1, p3

    .line 42
    .line 43
    iget-object p0, p0, LO/c;->s:LO/c$c;

    .line 44
    .line 45
    invoke-virtual {p0, v0, p3}, LO/c$c;->f(II)V

    .line 46
    .line 47
    .line 48
    :cond_3
    return-void
.end method

.method private F(FFI)V
    .locals 2

    .line 1
    invoke-direct {p0, p3}, LO/c;->r(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LO/c;->d:[F

    .line 5
    .line 6
    iget-object v1, p0, LO/c;->f:[F

    .line 7
    .line 8
    aput p1, v1, p3

    .line 9
    .line 10
    aput p1, v0, p3

    .line 11
    .line 12
    iget-object v0, p0, LO/c;->e:[F

    .line 13
    .line 14
    iget-object v1, p0, LO/c;->g:[F

    .line 15
    .line 16
    aput p2, v1, p3

    .line 17
    .line 18
    aput p2, v0, p3

    .line 19
    .line 20
    iget-object v0, p0, LO/c;->h:[I

    .line 21
    .line 22
    float-to-int p1, p1

    .line 23
    float-to-int p2, p2

    .line 24
    invoke-direct {p0, p1, p2}, LO/c;->v(II)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    aput p1, v0, p3

    .line 29
    .line 30
    iget p1, p0, LO/c;->k:I

    .line 31
    .line 32
    const/4 p2, 0x1

    .line 33
    shl-int/2addr p2, p3

    .line 34
    or-int/2addr p1, p2

    .line 35
    iput p1, p0, LO/c;->k:I

    .line 36
    .line 37
    return-void
.end method

.method private G(Landroid/view/MotionEvent;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-direct {p0, v2}, LO/c;->A(I)Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-nez v3, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    iget-object v5, p0, LO/c;->f:[F

    .line 28
    .line 29
    aput v3, v5, v2

    .line 30
    .line 31
    iget-object v3, p0, LO/c;->g:[F

    .line 32
    .line 33
    aput v4, v3, v2

    .line 34
    .line 35
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method private d(FFII)Z
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    iget-object v0, p0, LO/c;->h:[I

    .line 10
    .line 11
    aget v0, v0, p3

    .line 12
    .line 13
    and-int/2addr v0, p4

    .line 14
    const/4 v1, 0x0

    .line 15
    if-ne v0, p4, :cond_2

    .line 16
    .line 17
    iget v0, p0, LO/c;->q:I

    .line 18
    .line 19
    and-int/2addr v0, p4

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, LO/c;->j:[I

    .line 23
    .line 24
    aget v0, v0, p3

    .line 25
    .line 26
    and-int/2addr v0, p4

    .line 27
    if-eq v0, p4, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, LO/c;->i:[I

    .line 30
    .line 31
    aget v0, v0, p3

    .line 32
    .line 33
    and-int/2addr v0, p4

    .line 34
    if-eq v0, p4, :cond_2

    .line 35
    .line 36
    iget v0, p0, LO/c;->b:I

    .line 37
    .line 38
    int-to-float v2, v0

    .line 39
    cmpg-float v2, p1, v2

    .line 40
    .line 41
    if-gtz v2, :cond_0

    .line 42
    .line 43
    int-to-float v0, v0

    .line 44
    cmpg-float v0, p2, v0

    .line 45
    .line 46
    if-gtz v0, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/high16 v0, 0x3f000000    # 0.5f

    .line 50
    .line 51
    mul-float/2addr p2, v0

    .line 52
    cmpg-float p2, p1, p2

    .line 53
    .line 54
    if-gez p2, :cond_1

    .line 55
    .line 56
    iget-object p2, p0, LO/c;->s:LO/c$c;

    .line 57
    .line 58
    invoke-virtual {p2, p4}, LO/c$c;->g(I)Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_1

    .line 63
    .line 64
    iget-object p0, p0, LO/c;->j:[I

    .line 65
    .line 66
    aget p1, p0, p3

    .line 67
    .line 68
    or-int/2addr p1, p4

    .line 69
    aput p1, p0, p3

    .line 70
    .line 71
    return v1

    .line 72
    :cond_1
    iget-object p2, p0, LO/c;->i:[I

    .line 73
    .line 74
    aget p2, p2, p3

    .line 75
    .line 76
    and-int/2addr p2, p4

    .line 77
    if-nez p2, :cond_2

    .line 78
    .line 79
    iget p0, p0, LO/c;->b:I

    .line 80
    .line 81
    int-to-float p0, p0

    .line 82
    cmpl-float p0, p1, p0

    .line 83
    .line 84
    if-lez p0, :cond_2

    .line 85
    .line 86
    const/4 p0, 0x1

    .line 87
    return p0

    .line 88
    :cond_2
    :goto_0
    return v1
.end method

.method private e(Landroid/view/View;FF)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, LO/c;->s:LO/c$c;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, LO/c$c;->d(Landroid/view/View;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-lez v1, :cond_1

    .line 13
    .line 14
    move v1, v2

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    move v1, v0

    .line 17
    :goto_0
    iget-object v3, p0, LO/c;->s:LO/c$c;

    .line 18
    .line 19
    invoke-virtual {v3, p1}, LO/c$c;->e(Landroid/view/View;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-lez p1, :cond_2

    .line 24
    .line 25
    move p1, v2

    .line 26
    goto :goto_1

    .line 27
    :cond_2
    move p1, v0

    .line 28
    :goto_1
    if-eqz v1, :cond_4

    .line 29
    .line 30
    if-eqz p1, :cond_4

    .line 31
    .line 32
    mul-float/2addr p2, p2

    .line 33
    mul-float/2addr p3, p3

    .line 34
    add-float/2addr p2, p3

    .line 35
    iget p0, p0, LO/c;->b:I

    .line 36
    .line 37
    mul-int/2addr p0, p0

    .line 38
    int-to-float p0, p0

    .line 39
    cmpl-float p0, p2, p0

    .line 40
    .line 41
    if-lez p0, :cond_3

    .line 42
    .line 43
    return v2

    .line 44
    :cond_3
    return v0

    .line 45
    :cond_4
    if-eqz v1, :cond_6

    .line 46
    .line 47
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iget p0, p0, LO/c;->b:I

    .line 52
    .line 53
    int-to-float p0, p0

    .line 54
    cmpl-float p0, p1, p0

    .line 55
    .line 56
    if-lez p0, :cond_5

    .line 57
    .line 58
    return v2

    .line 59
    :cond_5
    return v0

    .line 60
    :cond_6
    if-eqz p1, :cond_7

    .line 61
    .line 62
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iget p0, p0, LO/c;->b:I

    .line 67
    .line 68
    int-to-float p0, p0

    .line 69
    cmpl-float p0, p1, p0

    .line 70
    .line 71
    if-lez p0, :cond_7

    .line 72
    .line 73
    return v2

    .line 74
    :cond_7
    return v0
.end method

.method private f(FFF)F
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    cmpg-float p2, p0, p2

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-gez p2, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    cmpl-float p0, p0, p3

    .line 12
    .line 13
    if-lez p0, :cond_2

    .line 14
    .line 15
    cmpl-float p0, p1, v0

    .line 16
    .line 17
    if-lez p0, :cond_1

    .line 18
    .line 19
    return p3

    .line 20
    :cond_1
    neg-float p0, p3

    .line 21
    return p0

    .line 22
    :cond_2
    return p1
.end method

.method private g(III)I
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ge p0, p2, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    if-le p0, p3, :cond_2

    .line 10
    .line 11
    if-lez p1, :cond_1

    .line 12
    .line 13
    return p3

    .line 14
    :cond_1
    neg-int p0, p3

    .line 15
    return p0

    .line 16
    :cond_2
    return p1
.end method

.method private h()V
    .locals 2

    .line 1
    iget-object v0, p0, LO/c;->d:[F

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, LO/c;->e:[F

    .line 11
    .line 12
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, LO/c;->f:[F

    .line 16
    .line 17
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, LO/c;->g:[F

    .line 21
    .line 22
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, LO/c;->h:[I

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, LO/c;->i:[I

    .line 32
    .line 33
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, LO/c;->j:[I

    .line 37
    .line 38
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 39
    .line 40
    .line 41
    iput v1, p0, LO/c;->k:I

    .line 42
    .line 43
    return-void
.end method

.method private i(I)V
    .locals 2

    .line 1
    iget-object v0, p0, LO/c;->d:[F

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0, p1}, LO/c;->z(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, LO/c;->d:[F

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    aput v1, v0, p1

    .line 16
    .line 17
    iget-object v0, p0, LO/c;->e:[F

    .line 18
    .line 19
    aput v1, v0, p1

    .line 20
    .line 21
    iget-object v0, p0, LO/c;->f:[F

    .line 22
    .line 23
    aput v1, v0, p1

    .line 24
    .line 25
    iget-object v0, p0, LO/c;->g:[F

    .line 26
    .line 27
    aput v1, v0, p1

    .line 28
    .line 29
    iget-object v0, p0, LO/c;->h:[I

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    aput v1, v0, p1

    .line 33
    .line 34
    iget-object v0, p0, LO/c;->i:[I

    .line 35
    .line 36
    aput v1, v0, p1

    .line 37
    .line 38
    iget-object v0, p0, LO/c;->j:[I

    .line 39
    .line 40
    aput v1, v0, p1

    .line 41
    .line 42
    iget v0, p0, LO/c;->k:I

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    shl-int p1, v1, p1

    .line 46
    .line 47
    not-int p1, p1

    .line 48
    and-int/2addr p1, v0

    .line 49
    iput p1, p0, LO/c;->k:I

    .line 50
    .line 51
    :cond_1
    :goto_0
    return-void
.end method

.method private j(III)I
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object v0, p0, LO/c;->v:Landroid/view/ViewGroup;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    div-int/lit8 v1, v0, 0x2

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    int-to-float v2, v2

    .line 18
    int-to-float v0, v0

    .line 19
    div-float/2addr v2, v0

    .line 20
    const/high16 v0, 0x3f800000    # 1.0f

    .line 21
    .line 22
    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    int-to-float v1, v1

    .line 27
    invoke-direct {p0, v2}, LO/c;->p(F)F

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    mul-float/2addr p0, v1

    .line 32
    add-float/2addr v1, p0

    .line 33
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-lez p0, :cond_1

    .line 38
    .line 39
    int-to-float p0, p0

    .line 40
    div-float/2addr v1, p0

    .line 41
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    const/high16 p1, 0x447a0000    # 1000.0f

    .line 46
    .line 47
    mul-float/2addr p0, p1

    .line 48
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    mul-int/lit8 p0, p0, 0x4

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    int-to-float p0, p0

    .line 60
    int-to-float p1, p3

    .line 61
    div-float/2addr p0, p1

    .line 62
    add-float/2addr p0, v0

    .line 63
    const/high16 p1, 0x43800000    # 256.0f

    .line 64
    .line 65
    mul-float/2addr p0, p1

    .line 66
    float-to-int p0, p0

    .line 67
    :goto_0
    const/16 p1, 0x258

    .line 68
    .line 69
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    return p0
.end method

.method private k(Landroid/view/View;IIII)I
    .locals 6

    .line 1
    iget v0, p0, LO/c;->n:F

    .line 2
    .line 3
    float-to-int v0, v0

    .line 4
    iget v1, p0, LO/c;->m:F

    .line 5
    .line 6
    float-to-int v1, v1

    .line 7
    invoke-direct {p0, p4, v0, v1}, LO/c;->g(III)I

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    iget v0, p0, LO/c;->n:F

    .line 12
    .line 13
    float-to-int v0, v0

    .line 14
    iget v1, p0, LO/c;->m:F

    .line 15
    .line 16
    float-to-int v1, v1

    .line 17
    invoke-direct {p0, p5, v0, v1}, LO/c;->g(III)I

    .line 18
    .line 19
    .line 20
    move-result p5

    .line 21
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    add-int v4, v2, v3

    .line 38
    .line 39
    add-int v5, v0, v1

    .line 40
    .line 41
    if-eqz p4, :cond_0

    .line 42
    .line 43
    int-to-float v0, v2

    .line 44
    int-to-float v2, v4

    .line 45
    :goto_0
    div-float/2addr v0, v2

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    int-to-float v0, v0

    .line 48
    int-to-float v2, v5

    .line 49
    goto :goto_0

    .line 50
    :goto_1
    if-eqz p5, :cond_1

    .line 51
    .line 52
    int-to-float v1, v3

    .line 53
    int-to-float v2, v4

    .line 54
    :goto_2
    div-float/2addr v1, v2

    .line 55
    goto :goto_3

    .line 56
    :cond_1
    int-to-float v1, v1

    .line 57
    int-to-float v2, v5

    .line 58
    goto :goto_2

    .line 59
    :goto_3
    iget-object v2, p0, LO/c;->s:LO/c$c;

    .line 60
    .line 61
    invoke-virtual {v2, p1}, LO/c$c;->d(Landroid/view/View;)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-direct {p0, p2, p4, v2}, LO/c;->j(III)I

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    iget-object p4, p0, LO/c;->s:LO/c$c;

    .line 70
    .line 71
    invoke-virtual {p4, p1}, LO/c$c;->e(Landroid/view/View;)I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-direct {p0, p3, p5, p1}, LO/c;->j(III)I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    int-to-float p1, p2

    .line 80
    mul-float/2addr p1, v0

    .line 81
    int-to-float p0, p0

    .line 82
    mul-float/2addr p0, v1

    .line 83
    add-float/2addr p1, p0

    .line 84
    float-to-int p0, p1

    .line 85
    return p0
.end method

.method public static m(Landroid/view/ViewGroup;FLO/c$c;)LO/c;
    .locals 1

    .line 1
    invoke-static {p0, p2}, LO/c;->n(Landroid/view/ViewGroup;LO/c$c;)LO/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p2, p0, LO/c;->b:I

    .line 6
    .line 7
    int-to-float p2, p2

    .line 8
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    div-float/2addr v0, p1

    .line 11
    mul-float/2addr p2, v0

    .line 12
    float-to-int p1, p2

    .line 13
    iput p1, p0, LO/c;->b:I

    .line 14
    .line 15
    return-object p0
.end method

.method public static n(Landroid/view/ViewGroup;LO/c$c;)LO/c;
    .locals 2

    .line 1
    new-instance v0, LO/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1, p0, p1}, LO/c;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;LO/c$c;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method private o(FF)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, LO/c;->u:Z

    .line 3
    .line 4
    iget-object v1, p0, LO/c;->s:LO/c$c;

    .line 5
    .line 6
    iget-object v2, p0, LO/c;->t:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {v1, v2, p1, p2}, LO/c$c;->l(Landroid/view/View;FF)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, LO/c;->u:Z

    .line 13
    .line 14
    iget p2, p0, LO/c;->a:I

    .line 15
    .line 16
    if-ne p2, v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p1}, LO/c;->H(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private p(F)F
    .locals 0

    .line 1
    const/high16 p0, 0x3f000000    # 0.5f

    .line 2
    .line 3
    sub-float/2addr p1, p0

    .line 4
    const p0, 0x3ef1463b

    .line 5
    .line 6
    .line 7
    mul-float/2addr p1, p0

    .line 8
    float-to-double p0, p1

    .line 9
    invoke-static {p0, p1}, Ljava/lang/Math;->sin(D)D

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    double-to-float p0, p0

    .line 14
    return p0
.end method

.method private q(IIII)V
    .locals 10

    .line 1
    iget-object v0, p0, LO/c;->t:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, LO/c;->t:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, LO/c;->s:LO/c$c;

    .line 16
    .line 17
    iget-object v3, p0, LO/c;->t:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {v2, v3, p1, p3}, LO/c$c;->a(Landroid/view/View;II)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget-object v2, p0, LO/c;->t:Landroid/view/View;

    .line 24
    .line 25
    sub-int v3, p1, v0

    .line 26
    .line 27
    invoke-static {v2, v3}, LJ/I;->T(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    move v6, p1

    .line 31
    if-eqz p4, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, LO/c;->s:LO/c$c;

    .line 34
    .line 35
    iget-object v2, p0, LO/c;->t:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p1, v2, p2, p4}, LO/c$c;->b(Landroid/view/View;II)I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    iget-object p1, p0, LO/c;->t:Landroid/view/View;

    .line 42
    .line 43
    sub-int v2, p2, v1

    .line 44
    .line 45
    invoke-static {p1, v2}, LJ/I;->U(Landroid/view/View;I)V

    .line 46
    .line 47
    .line 48
    :cond_1
    move v7, p2

    .line 49
    if-nez p3, :cond_3

    .line 50
    .line 51
    if-eqz p4, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    return-void

    .line 55
    :cond_3
    :goto_0
    sub-int v8, v6, v0

    .line 56
    .line 57
    sub-int v9, v7, v1

    .line 58
    .line 59
    iget-object v4, p0, LO/c;->s:LO/c$c;

    .line 60
    .line 61
    iget-object v5, p0, LO/c;->t:Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual/range {v4 .. v9}, LO/c$c;->k(Landroid/view/View;IIII)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private r(I)V
    .locals 9

    .line 1
    iget-object v0, p0, LO/c;->d:[F

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    array-length v1, v0

    .line 6
    if-gt v1, p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    return-void

    .line 10
    :cond_1
    :goto_0
    add-int/lit8 p1, p1, 0x1

    .line 11
    .line 12
    new-array v1, p1, [F

    .line 13
    .line 14
    new-array v2, p1, [F

    .line 15
    .line 16
    new-array v3, p1, [F

    .line 17
    .line 18
    new-array v4, p1, [F

    .line 19
    .line 20
    new-array v5, p1, [I

    .line 21
    .line 22
    new-array v6, p1, [I

    .line 23
    .line 24
    new-array p1, p1, [I

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    array-length v7, v0

    .line 29
    const/4 v8, 0x0

    .line 30
    invoke-static {v0, v8, v1, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, LO/c;->e:[F

    .line 34
    .line 35
    array-length v7, v0

    .line 36
    invoke-static {v0, v8, v2, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, LO/c;->f:[F

    .line 40
    .line 41
    array-length v7, v0

    .line 42
    invoke-static {v0, v8, v3, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, LO/c;->g:[F

    .line 46
    .line 47
    array-length v7, v0

    .line 48
    invoke-static {v0, v8, v4, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, LO/c;->h:[I

    .line 52
    .line 53
    array-length v7, v0

    .line 54
    invoke-static {v0, v8, v5, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, LO/c;->i:[I

    .line 58
    .line 59
    array-length v7, v0

    .line 60
    invoke-static {v0, v8, v6, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, LO/c;->j:[I

    .line 64
    .line 65
    array-length v7, v0

    .line 66
    invoke-static {v0, v8, p1, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 67
    .line 68
    .line 69
    :cond_2
    iput-object v1, p0, LO/c;->d:[F

    .line 70
    .line 71
    iput-object v2, p0, LO/c;->e:[F

    .line 72
    .line 73
    iput-object v3, p0, LO/c;->f:[F

    .line 74
    .line 75
    iput-object v4, p0, LO/c;->g:[F

    .line 76
    .line 77
    iput-object v5, p0, LO/c;->h:[I

    .line 78
    .line 79
    iput-object v6, p0, LO/c;->i:[I

    .line 80
    .line 81
    iput-object p1, p0, LO/c;->j:[I

    .line 82
    .line 83
    return-void
.end method

.method private t(IIII)Z
    .locals 10

    .line 1
    iget-object v0, p0, LO/c;->t:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    iget-object v0, p0, LO/c;->t:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    sub-int v4, p1, v2

    .line 14
    .line 15
    sub-int v5, p2, v3

    .line 16
    .line 17
    if-nez v4, :cond_0

    .line 18
    .line 19
    if-nez v5, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, p1}, LO/c;->H(I)V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :cond_0
    move v7, v5

    .line 32
    iget-object v5, p0, LO/c;->t:Landroid/view/View;

    .line 33
    .line 34
    move v8, p3

    .line 35
    move v9, p4

    .line 36
    move v6, v4

    .line 37
    move-object v4, p0

    .line 38
    invoke-direct/range {v4 .. v9}, LO/c;->k(Landroid/view/View;IIII)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    move-object p1, v4

    .line 43
    move v4, v6

    .line 44
    iget-object v1, p1, LO/c;->r:Landroid/widget/OverScroller;

    .line 45
    .line 46
    move v6, p0

    .line 47
    move v5, v7

    .line 48
    invoke-virtual/range {v1 .. v6}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x2

    .line 52
    invoke-virtual {p1, p0}, LO/c;->H(I)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0
.end method

.method private v(II)I
    .locals 3

    .line 1
    iget-object v0, p0, LO/c;->v:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLeft()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, LO/c;->o:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    if-ge p1, v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    iget-object v1, p0, LO/c;->v:Landroid/view/ViewGroup;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTop()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget v2, p0, LO/c;->o:I

    .line 22
    .line 23
    add-int/2addr v1, v2

    .line 24
    if-ge p2, v1, :cond_1

    .line 25
    .line 26
    or-int/lit8 v0, v0, 0x4

    .line 27
    .line 28
    :cond_1
    iget-object v1, p0, LO/c;->v:Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getRight()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iget v2, p0, LO/c;->o:I

    .line 35
    .line 36
    sub-int/2addr v1, v2

    .line 37
    if-le p1, v1, :cond_2

    .line 38
    .line 39
    or-int/lit8 v0, v0, 0x2

    .line 40
    .line 41
    :cond_2
    iget-object p1, p0, LO/c;->v:Landroid/view/ViewGroup;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getBottom()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iget p0, p0, LO/c;->o:I

    .line 48
    .line 49
    sub-int/2addr p1, p0

    .line 50
    if-le p2, p1, :cond_3

    .line 51
    .line 52
    or-int/lit8 p0, v0, 0x8

    .line 53
    .line 54
    return p0

    .line 55
    :cond_3
    return v0
.end method


# virtual methods
.method public B(Landroid/view/View;II)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lt p2, v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-ge p2, v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-lt p3, p2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-ge p3, p1, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    :cond_1
    return p0
.end method

.method public C(Landroid/view/MotionEvent;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, LO/c;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v2, p0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 15
    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iput-object v2, p0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 23
    .line 24
    :cond_1
    iget-object v2, p0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 25
    .line 26
    invoke-virtual {v2, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 27
    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v0, :cond_14

    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    if-eq v0, v3, :cond_12

    .line 34
    .line 35
    const/4 v4, 0x2

    .line 36
    if-eq v0, v4, :cond_b

    .line 37
    .line 38
    const/4 v4, 0x3

    .line 39
    if-eq v0, v4, :cond_9

    .line 40
    .line 41
    const/4 v4, 0x5

    .line 42
    if-eq v0, v4, :cond_7

    .line 43
    .line 44
    const/4 v4, 0x6

    .line 45
    if-eq v0, v4, :cond_2

    .line 46
    .line 47
    goto/16 :goto_6

    .line 48
    .line 49
    :cond_2
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget v1, p0, LO/c;->a:I

    .line 54
    .line 55
    if-ne v1, v3, :cond_6

    .line 56
    .line 57
    iget v1, p0, LO/c;->c:I

    .line 58
    .line 59
    if-ne v0, v1, :cond_6

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    :goto_0
    const/4 v3, -0x1

    .line 66
    if-ge v2, v1, :cond_5

    .line 67
    .line 68
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    iget v5, p0, LO/c;->c:I

    .line 73
    .line 74
    if-ne v4, v5, :cond_3

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    float-to-int v5, v5

    .line 86
    float-to-int v6, v6

    .line 87
    invoke-virtual {p0, v5, v6}, LO/c;->s(II)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    iget-object v6, p0, LO/c;->t:Landroid/view/View;

    .line 92
    .line 93
    if-ne v5, v6, :cond_4

    .line 94
    .line 95
    invoke-virtual {p0, v6, v4}, LO/c;->O(Landroid/view/View;I)Z

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    if-eqz v4, :cond_4

    .line 100
    .line 101
    iget p1, p0, LO/c;->c:I

    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_4
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_5
    move p1, v3

    .line 108
    :goto_2
    if-ne p1, v3, :cond_6

    .line 109
    .line 110
    invoke-direct {p0}, LO/c;->D()V

    .line 111
    .line 112
    .line 113
    :cond_6
    invoke-direct {p0, v0}, LO/c;->i(I)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_7
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    invoke-direct {p0, v2, p1, v0}, LO/c;->F(FFI)V

    .line 130
    .line 131
    .line 132
    iget v1, p0, LO/c;->a:I

    .line 133
    .line 134
    if-nez v1, :cond_8

    .line 135
    .line 136
    float-to-int v1, v2

    .line 137
    float-to-int p1, p1

    .line 138
    invoke-virtual {p0, v1, p1}, LO/c;->s(II)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {p0, p1, v0}, LO/c;->O(Landroid/view/View;I)Z

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, LO/c;->h:[I

    .line 146
    .line 147
    aget p1, p1, v0

    .line 148
    .line 149
    iget v1, p0, LO/c;->q:I

    .line 150
    .line 151
    and-int v2, p1, v1

    .line 152
    .line 153
    if-eqz v2, :cond_15

    .line 154
    .line 155
    iget-object p0, p0, LO/c;->s:LO/c$c;

    .line 156
    .line 157
    and-int/2addr p1, v1

    .line 158
    invoke-virtual {p0, p1, v0}, LO/c$c;->h(II)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_8
    float-to-int v1, v2

    .line 163
    float-to-int p1, p1

    .line 164
    invoke-virtual {p0, v1, p1}, LO/c;->y(II)Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-eqz p1, :cond_15

    .line 169
    .line 170
    iget-object p1, p0, LO/c;->t:Landroid/view/View;

    .line 171
    .line 172
    invoke-virtual {p0, p1, v0}, LO/c;->O(Landroid/view/View;I)Z

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_9
    iget p1, p0, LO/c;->a:I

    .line 177
    .line 178
    if-ne p1, v3, :cond_a

    .line 179
    .line 180
    const/4 p1, 0x0

    .line 181
    invoke-direct {p0, p1, p1}, LO/c;->o(FF)V

    .line 182
    .line 183
    .line 184
    :cond_a
    invoke-virtual {p0}, LO/c;->b()V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_b
    iget v0, p0, LO/c;->a:I

    .line 189
    .line 190
    if-ne v0, v3, :cond_d

    .line 191
    .line 192
    iget v0, p0, LO/c;->c:I

    .line 193
    .line 194
    invoke-direct {p0, v0}, LO/c;->A(I)Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-nez v0, :cond_c

    .line 199
    .line 200
    goto/16 :goto_6

    .line 201
    .line 202
    :cond_c
    iget v0, p0, LO/c;->c:I

    .line 203
    .line 204
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    iget-object v2, p0, LO/c;->f:[F

    .line 217
    .line 218
    iget v3, p0, LO/c;->c:I

    .line 219
    .line 220
    aget v2, v2, v3

    .line 221
    .line 222
    sub-float/2addr v1, v2

    .line 223
    float-to-int v1, v1

    .line 224
    iget-object v2, p0, LO/c;->g:[F

    .line 225
    .line 226
    aget v2, v2, v3

    .line 227
    .line 228
    sub-float/2addr v0, v2

    .line 229
    float-to-int v0, v0

    .line 230
    iget-object v2, p0, LO/c;->t:Landroid/view/View;

    .line 231
    .line 232
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    add-int/2addr v2, v1

    .line 237
    iget-object v3, p0, LO/c;->t:Landroid/view/View;

    .line 238
    .line 239
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    .line 240
    .line 241
    .line 242
    move-result v3

    .line 243
    add-int/2addr v3, v0

    .line 244
    invoke-direct {p0, v2, v3, v1, v0}, LO/c;->q(IIII)V

    .line 245
    .line 246
    .line 247
    invoke-direct {p0, p1}, LO/c;->G(Landroid/view/MotionEvent;)V

    .line 248
    .line 249
    .line 250
    return-void

    .line 251
    :cond_d
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    :goto_3
    if-ge v2, v0, :cond_11

    .line 256
    .line 257
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    invoke-direct {p0, v1}, LO/c;->A(I)Z

    .line 262
    .line 263
    .line 264
    move-result v4

    .line 265
    if-nez v4, :cond_e

    .line 266
    .line 267
    goto :goto_4

    .line 268
    :cond_e
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    .line 269
    .line 270
    .line 271
    move-result v4

    .line 272
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    .line 273
    .line 274
    .line 275
    move-result v5

    .line 276
    iget-object v6, p0, LO/c;->d:[F

    .line 277
    .line 278
    aget v6, v6, v1

    .line 279
    .line 280
    sub-float v6, v4, v6

    .line 281
    .line 282
    iget-object v7, p0, LO/c;->e:[F

    .line 283
    .line 284
    aget v7, v7, v1

    .line 285
    .line 286
    sub-float v7, v5, v7

    .line 287
    .line 288
    invoke-direct {p0, v6, v7, v1}, LO/c;->E(FFI)V

    .line 289
    .line 290
    .line 291
    iget v8, p0, LO/c;->a:I

    .line 292
    .line 293
    if-ne v8, v3, :cond_f

    .line 294
    .line 295
    goto :goto_5

    .line 296
    :cond_f
    float-to-int v4, v4

    .line 297
    float-to-int v5, v5

    .line 298
    invoke-virtual {p0, v4, v5}, LO/c;->s(II)Landroid/view/View;

    .line 299
    .line 300
    .line 301
    move-result-object v4

    .line 302
    invoke-direct {p0, v4, v6, v7}, LO/c;->e(Landroid/view/View;FF)Z

    .line 303
    .line 304
    .line 305
    move-result v5

    .line 306
    if-eqz v5, :cond_10

    .line 307
    .line 308
    invoke-virtual {p0, v4, v1}, LO/c;->O(Landroid/view/View;I)Z

    .line 309
    .line 310
    .line 311
    move-result v1

    .line 312
    if-eqz v1, :cond_10

    .line 313
    .line 314
    goto :goto_5

    .line 315
    :cond_10
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 316
    .line 317
    goto :goto_3

    .line 318
    :cond_11
    :goto_5
    invoke-direct {p0, p1}, LO/c;->G(Landroid/view/MotionEvent;)V

    .line 319
    .line 320
    .line 321
    return-void

    .line 322
    :cond_12
    iget p1, p0, LO/c;->a:I

    .line 323
    .line 324
    if-ne p1, v3, :cond_13

    .line 325
    .line 326
    invoke-direct {p0}, LO/c;->D()V

    .line 327
    .line 328
    .line 329
    :cond_13
    invoke-virtual {p0}, LO/c;->b()V

    .line 330
    .line 331
    .line 332
    return-void

    .line 333
    :cond_14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 334
    .line 335
    .line 336
    move-result v0

    .line 337
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 342
    .line 343
    .line 344
    move-result p1

    .line 345
    float-to-int v2, v0

    .line 346
    float-to-int v3, v1

    .line 347
    invoke-virtual {p0, v2, v3}, LO/c;->s(II)Landroid/view/View;

    .line 348
    .line 349
    .line 350
    move-result-object v2

    .line 351
    invoke-direct {p0, v0, v1, p1}, LO/c;->F(FFI)V

    .line 352
    .line 353
    .line 354
    invoke-virtual {p0, v2, p1}, LO/c;->O(Landroid/view/View;I)Z

    .line 355
    .line 356
    .line 357
    iget-object v0, p0, LO/c;->h:[I

    .line 358
    .line 359
    aget v0, v0, p1

    .line 360
    .line 361
    iget v1, p0, LO/c;->q:I

    .line 362
    .line 363
    and-int v2, v0, v1

    .line 364
    .line 365
    if-eqz v2, :cond_15

    .line 366
    .line 367
    iget-object p0, p0, LO/c;->s:LO/c$c;

    .line 368
    .line 369
    and-int/2addr v0, v1

    .line 370
    invoke-virtual {p0, v0, p1}, LO/c$c;->h(II)V

    .line 371
    .line 372
    .line 373
    :cond_15
    :goto_6
    return-void
.end method

.method H(I)V
    .locals 2

    .line 1
    iget-object v0, p0, LO/c;->v:Landroid/view/ViewGroup;

    .line 2
    .line 3
    iget-object v1, p0, LO/c;->w:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    iget v0, p0, LO/c;->a:I

    .line 9
    .line 10
    if-eq v0, p1, :cond_0

    .line 11
    .line 12
    iput p1, p0, LO/c;->a:I

    .line 13
    .line 14
    iget-object v0, p0, LO/c;->s:LO/c$c;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, LO/c$c;->j(I)V

    .line 17
    .line 18
    .line 19
    iget p1, p0, LO/c;->a:I

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    iput-object p1, p0, LO/c;->t:Landroid/view/View;

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public I(I)V
    .locals 0

    .line 1
    iput p1, p0, LO/c;->o:I

    .line 2
    .line 3
    return-void
.end method

.method public J(I)V
    .locals 0

    .line 1
    iput p1, p0, LO/c;->q:I

    .line 2
    .line 3
    return-void
.end method

.method public K(F)V
    .locals 0

    .line 1
    iput p1, p0, LO/c;->n:F

    .line 2
    .line 3
    return-void
.end method

.method public L(II)Z
    .locals 3

    .line 1
    iget-boolean v0, p0, LO/c;->u:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 6
    .line 7
    iget v1, p0, LO/c;->c:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    float-to-int v0, v0

    .line 14
    iget-object v1, p0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 15
    .line 16
    iget v2, p0, LO/c;->c:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    float-to-int v1, v1

    .line 23
    invoke-direct {p0, p1, p2, v0, v1}, LO/c;->t(IIII)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 29
    .line 30
    const-string p1, "Cannot settleCapturedViewAt outside of a call to Callback#onViewReleased"

    .line 31
    .line 32
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw p0
.end method

.method public M(Landroid/view/MotionEvent;)Z
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, LO/c;->b()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v4, v0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 19
    .line 20
    if-nez v4, :cond_1

    .line 21
    .line 22
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    iput-object v4, v0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 27
    .line 28
    :cond_1
    iget-object v4, v0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 29
    .line 30
    invoke-virtual {v4, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 31
    .line 32
    .line 33
    const/4 v4, 0x2

    .line 34
    const/4 v6, 0x1

    .line 35
    if-eqz v2, :cond_f

    .line 36
    .line 37
    if-eq v2, v6, :cond_e

    .line 38
    .line 39
    if-eq v2, v4, :cond_5

    .line 40
    .line 41
    const/4 v7, 0x3

    .line 42
    if-eq v2, v7, :cond_e

    .line 43
    .line 44
    const/4 v7, 0x5

    .line 45
    if-eq v2, v7, :cond_3

    .line 46
    .line 47
    const/4 v4, 0x6

    .line 48
    if-eq v2, v4, :cond_2

    .line 49
    .line 50
    goto/16 :goto_4

    .line 51
    .line 52
    :cond_2
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-direct {v0, v1}, LO/c;->i(I)V

    .line 57
    .line 58
    .line 59
    goto/16 :goto_4

    .line 60
    .line 61
    :cond_3
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getX(I)F

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getY(I)F

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-direct {v0, v7, v1, v2}, LO/c;->F(FFI)V

    .line 74
    .line 75
    .line 76
    iget v3, v0, LO/c;->a:I

    .line 77
    .line 78
    if-nez v3, :cond_4

    .line 79
    .line 80
    iget-object v1, v0, LO/c;->h:[I

    .line 81
    .line 82
    aget v1, v1, v2

    .line 83
    .line 84
    iget v3, v0, LO/c;->q:I

    .line 85
    .line 86
    and-int v4, v1, v3

    .line 87
    .line 88
    if-eqz v4, :cond_11

    .line 89
    .line 90
    iget-object v4, v0, LO/c;->s:LO/c$c;

    .line 91
    .line 92
    and-int/2addr v1, v3

    .line 93
    invoke-virtual {v4, v1, v2}, LO/c$c;->h(II)V

    .line 94
    .line 95
    .line 96
    goto/16 :goto_4

    .line 97
    .line 98
    :cond_4
    if-ne v3, v4, :cond_11

    .line 99
    .line 100
    float-to-int v3, v7

    .line 101
    float-to-int v1, v1

    .line 102
    invoke-virtual {v0, v3, v1}, LO/c;->s(II)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    iget-object v3, v0, LO/c;->t:Landroid/view/View;

    .line 107
    .line 108
    if-ne v1, v3, :cond_11

    .line 109
    .line 110
    invoke-virtual {v0, v1, v2}, LO/c;->O(Landroid/view/View;I)Z

    .line 111
    .line 112
    .line 113
    goto/16 :goto_4

    .line 114
    .line 115
    :cond_5
    iget-object v2, v0, LO/c;->d:[F

    .line 116
    .line 117
    if-eqz v2, :cond_11

    .line 118
    .line 119
    iget-object v2, v0, LO/c;->e:[F

    .line 120
    .line 121
    if-nez v2, :cond_6

    .line 122
    .line 123
    goto/16 :goto_4

    .line 124
    .line 125
    :cond_6
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    const/4 v3, 0x0

    .line 130
    :goto_0
    if-ge v3, v2, :cond_d

    .line 131
    .line 132
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    invoke-direct {v0, v4}, LO/c;->A(I)Z

    .line 137
    .line 138
    .line 139
    move-result v7

    .line 140
    if-nez v7, :cond_7

    .line 141
    .line 142
    goto/16 :goto_2

    .line 143
    .line 144
    :cond_7
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getX(I)F

    .line 145
    .line 146
    .line 147
    move-result v7

    .line 148
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getY(I)F

    .line 149
    .line 150
    .line 151
    move-result v8

    .line 152
    iget-object v9, v0, LO/c;->d:[F

    .line 153
    .line 154
    aget v9, v9, v4

    .line 155
    .line 156
    sub-float v9, v7, v9

    .line 157
    .line 158
    iget-object v10, v0, LO/c;->e:[F

    .line 159
    .line 160
    aget v10, v10, v4

    .line 161
    .line 162
    sub-float v10, v8, v10

    .line 163
    .line 164
    float-to-int v7, v7

    .line 165
    float-to-int v8, v8

    .line 166
    invoke-virtual {v0, v7, v8}, LO/c;->s(II)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v7

    .line 170
    if-eqz v7, :cond_8

    .line 171
    .line 172
    invoke-direct {v0, v7, v9, v10}, LO/c;->e(Landroid/view/View;FF)Z

    .line 173
    .line 174
    .line 175
    move-result v8

    .line 176
    if-eqz v8, :cond_8

    .line 177
    .line 178
    move v8, v6

    .line 179
    goto :goto_1

    .line 180
    :cond_8
    const/4 v8, 0x0

    .line 181
    :goto_1
    if-eqz v8, :cond_a

    .line 182
    .line 183
    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    .line 184
    .line 185
    .line 186
    move-result v11

    .line 187
    float-to-int v12, v9

    .line 188
    add-int v13, v11, v12

    .line 189
    .line 190
    iget-object v14, v0, LO/c;->s:LO/c$c;

    .line 191
    .line 192
    invoke-virtual {v14, v7, v13, v12}, LO/c$c;->a(Landroid/view/View;II)I

    .line 193
    .line 194
    .line 195
    move-result v12

    .line 196
    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    .line 197
    .line 198
    .line 199
    move-result v13

    .line 200
    float-to-int v14, v10

    .line 201
    add-int v15, v13, v14

    .line 202
    .line 203
    iget-object v5, v0, LO/c;->s:LO/c$c;

    .line 204
    .line 205
    invoke-virtual {v5, v7, v15, v14}, LO/c$c;->b(Landroid/view/View;II)I

    .line 206
    .line 207
    .line 208
    move-result v5

    .line 209
    iget-object v14, v0, LO/c;->s:LO/c$c;

    .line 210
    .line 211
    invoke-virtual {v14, v7}, LO/c$c;->d(Landroid/view/View;)I

    .line 212
    .line 213
    .line 214
    move-result v14

    .line 215
    iget-object v15, v0, LO/c;->s:LO/c$c;

    .line 216
    .line 217
    invoke-virtual {v15, v7}, LO/c$c;->e(Landroid/view/View;)I

    .line 218
    .line 219
    .line 220
    move-result v15

    .line 221
    if-eqz v14, :cond_9

    .line 222
    .line 223
    if-lez v14, :cond_a

    .line 224
    .line 225
    if-ne v12, v11, :cond_a

    .line 226
    .line 227
    :cond_9
    if-eqz v15, :cond_d

    .line 228
    .line 229
    if-lez v15, :cond_a

    .line 230
    .line 231
    if-ne v5, v13, :cond_a

    .line 232
    .line 233
    goto :goto_3

    .line 234
    :cond_a
    invoke-direct {v0, v9, v10, v4}, LO/c;->E(FFI)V

    .line 235
    .line 236
    .line 237
    iget v5, v0, LO/c;->a:I

    .line 238
    .line 239
    if-ne v5, v6, :cond_b

    .line 240
    .line 241
    goto :goto_3

    .line 242
    :cond_b
    if-eqz v8, :cond_c

    .line 243
    .line 244
    invoke-virtual {v0, v7, v4}, LO/c;->O(Landroid/view/View;I)Z

    .line 245
    .line 246
    .line 247
    move-result v4

    .line 248
    if-eqz v4, :cond_c

    .line 249
    .line 250
    goto :goto_3

    .line 251
    :cond_c
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 252
    .line 253
    goto :goto_0

    .line 254
    :cond_d
    :goto_3
    invoke-direct/range {p0 .. p1}, LO/c;->G(Landroid/view/MotionEvent;)V

    .line 255
    .line 256
    .line 257
    goto :goto_4

    .line 258
    :cond_e
    invoke-virtual {v0}, LO/c;->b()V

    .line 259
    .line 260
    .line 261
    goto :goto_4

    .line 262
    :cond_f
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getX()F

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getY()F

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    const/4 v5, 0x0

    .line 271
    invoke-virtual {v1, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    invoke-direct {v0, v2, v3, v1}, LO/c;->F(FFI)V

    .line 276
    .line 277
    .line 278
    float-to-int v2, v2

    .line 279
    float-to-int v3, v3

    .line 280
    invoke-virtual {v0, v2, v3}, LO/c;->s(II)Landroid/view/View;

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    iget-object v3, v0, LO/c;->t:Landroid/view/View;

    .line 285
    .line 286
    if-ne v2, v3, :cond_10

    .line 287
    .line 288
    iget v3, v0, LO/c;->a:I

    .line 289
    .line 290
    if-ne v3, v4, :cond_10

    .line 291
    .line 292
    invoke-virtual {v0, v2, v1}, LO/c;->O(Landroid/view/View;I)Z

    .line 293
    .line 294
    .line 295
    :cond_10
    iget-object v2, v0, LO/c;->h:[I

    .line 296
    .line 297
    aget v2, v2, v1

    .line 298
    .line 299
    iget v3, v0, LO/c;->q:I

    .line 300
    .line 301
    and-int v4, v2, v3

    .line 302
    .line 303
    if-eqz v4, :cond_11

    .line 304
    .line 305
    iget-object v4, v0, LO/c;->s:LO/c$c;

    .line 306
    .line 307
    and-int/2addr v2, v3

    .line 308
    invoke-virtual {v4, v2, v1}, LO/c$c;->h(II)V

    .line 309
    .line 310
    .line 311
    :cond_11
    :goto_4
    iget v0, v0, LO/c;->a:I

    .line 312
    .line 313
    if-ne v0, v6, :cond_12

    .line 314
    .line 315
    return v6

    .line 316
    :cond_12
    const/16 v16, 0x0

    .line 317
    .line 318
    return v16
.end method

.method public N(Landroid/view/View;II)Z
    .locals 0

    .line 1
    iput-object p1, p0, LO/c;->t:Landroid/view/View;

    .line 2
    .line 3
    const/4 p1, -0x1

    .line 4
    iput p1, p0, LO/c;->c:I

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-direct {p0, p2, p3, p1, p1}, LO/c;->t(IIII)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget p2, p0, LO/c;->a:I

    .line 14
    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    iget-object p2, p0, LO/c;->t:Landroid/view/View;

    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    const/4 p2, 0x0

    .line 22
    iput-object p2, p0, LO/c;->t:Landroid/view/View;

    .line 23
    .line 24
    :cond_0
    return p1
.end method

.method O(Landroid/view/View;I)Z
    .locals 2

    .line 1
    iget-object v0, p0, LO/c;->t:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    iget v0, p0, LO/c;->c:I

    .line 7
    .line 8
    if-ne v0, p2, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, LO/c;->s:LO/c$c;

    .line 14
    .line 15
    invoke-virtual {v0, p1, p2}, LO/c$c;->m(Landroid/view/View;I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iput p2, p0, LO/c;->c:I

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, LO/c;->c(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public a()V
    .locals 9

    .line 1
    invoke-virtual {p0}, LO/c;->b()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, LO/c;->a:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/widget/OverScroller;->getCurrY()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget-object v2, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroid/widget/OverScroller;->getCurrX()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    iget-object v2, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/widget/OverScroller;->getCurrY()I

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    iget-object v3, p0, LO/c;->s:LO/c$c;

    .line 39
    .line 40
    iget-object v4, p0, LO/c;->t:Landroid/view/View;

    .line 41
    .line 42
    sub-int v7, v5, v0

    .line 43
    .line 44
    sub-int v8, v6, v1

    .line 45
    .line 46
    invoke-virtual/range {v3 .. v8}, LO/c$c;->k(Landroid/view/View;IIII)V

    .line 47
    .line 48
    .line 49
    :cond_0
    const/4 v0, 0x0

    .line 50
    invoke-virtual {p0, v0}, LO/c;->H(I)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, LO/c;->c:I

    .line 3
    .line 4
    invoke-direct {p0}, LO/c;->h()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, LO/c;->l:Landroid/view/VelocityTracker;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public c(Landroid/view/View;I)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, LO/c;->v:Landroid/view/ViewGroup;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, LO/c;->t:Landroid/view/View;

    .line 10
    .line 11
    iput p2, p0, LO/c;->c:I

    .line 12
    .line 13
    iget-object v0, p0, LO/c;->s:LO/c$c;

    .line 14
    .line 15
    invoke-virtual {v0, p1, p2}, LO/c$c;->i(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, LO/c;->H(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 24
    .line 25
    new-instance p2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v0, "captureChildView: parameter must be a descendant of the ViewDragHelper\'s tracked parent view ("

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, LO/c;->v:Landroid/view/ViewGroup;

    .line 36
    .line 37
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p0, ")"

    .line 41
    .line 42
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw p1
.end method

.method public l(Z)Z
    .locals 10

    .line 1
    iget v0, p0, LO/c;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x2

    .line 5
    if-ne v0, v2, :cond_6

    .line 6
    .line 7
    iget-object v0, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v3, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 14
    .line 15
    invoke-virtual {v3}, Landroid/widget/OverScroller;->getCurrX()I

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    iget-object v3, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 20
    .line 21
    invoke-virtual {v3}, Landroid/widget/OverScroller;->getCurrY()I

    .line 22
    .line 23
    .line 24
    move-result v7

    .line 25
    iget-object v3, p0, LO/c;->t:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    sub-int v8, v6, v3

    .line 32
    .line 33
    iget-object v3, p0, LO/c;->t:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    sub-int v9, v7, v3

    .line 40
    .line 41
    if-eqz v8, :cond_0

    .line 42
    .line 43
    iget-object v3, p0, LO/c;->t:Landroid/view/View;

    .line 44
    .line 45
    invoke-static {v3, v8}, LJ/I;->T(Landroid/view/View;I)V

    .line 46
    .line 47
    .line 48
    :cond_0
    if-eqz v9, :cond_1

    .line 49
    .line 50
    iget-object v3, p0, LO/c;->t:Landroid/view/View;

    .line 51
    .line 52
    invoke-static {v3, v9}, LJ/I;->U(Landroid/view/View;I)V

    .line 53
    .line 54
    .line 55
    :cond_1
    if-nez v8, :cond_2

    .line 56
    .line 57
    if-eqz v9, :cond_3

    .line 58
    .line 59
    :cond_2
    iget-object v4, p0, LO/c;->s:LO/c$c;

    .line 60
    .line 61
    iget-object v5, p0, LO/c;->t:Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual/range {v4 .. v9}, LO/c$c;->k(Landroid/view/View;IIII)V

    .line 64
    .line 65
    .line 66
    :cond_3
    if-eqz v0, :cond_4

    .line 67
    .line 68
    iget-object v3, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 69
    .line 70
    invoke-virtual {v3}, Landroid/widget/OverScroller;->getFinalX()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-ne v6, v3, :cond_4

    .line 75
    .line 76
    iget-object v3, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 77
    .line 78
    invoke-virtual {v3}, Landroid/widget/OverScroller;->getFinalY()I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-ne v7, v3, :cond_4

    .line 83
    .line 84
    iget-object v0, p0, LO/c;->r:Landroid/widget/OverScroller;

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 87
    .line 88
    .line 89
    move v0, v1

    .line 90
    :cond_4
    if-nez v0, :cond_6

    .line 91
    .line 92
    if-eqz p1, :cond_5

    .line 93
    .line 94
    iget-object p1, p0, LO/c;->v:Landroid/view/ViewGroup;

    .line 95
    .line 96
    iget-object v0, p0, LO/c;->w:Ljava/lang/Runnable;

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_5
    invoke-virtual {p0, v1}, LO/c;->H(I)V

    .line 103
    .line 104
    .line 105
    :cond_6
    :goto_0
    iget p0, p0, LO/c;->a:I

    .line 106
    .line 107
    if-ne p0, v2, :cond_7

    .line 108
    .line 109
    const/4 p0, 0x1

    .line 110
    return p0

    .line 111
    :cond_7
    return v1
.end method

.method public s(II)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, LO/c;->v:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, LO/c;->v:Landroid/view/ViewGroup;

    .line 12
    .line 13
    iget-object v2, p0, LO/c;->s:LO/c$c;

    .line 14
    .line 15
    invoke-virtual {v2, v0}, LO/c$c;->c(I)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-lt p1, v2, :cond_0

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-ge p1, v2, :cond_0

    .line 34
    .line 35
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-lt p2, v2, :cond_0

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-ge p2, v2, :cond_0

    .line 46
    .line 47
    return-object v1

    .line 48
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const/4 p0, 0x0

    .line 52
    return-object p0
.end method

.method public u()I
    .locals 0

    .line 1
    iget p0, p0, LO/c;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public w()I
    .locals 0

    .line 1
    iget p0, p0, LO/c;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public x()I
    .locals 0

    .line 1
    iget p0, p0, LO/c;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public y(II)Z
    .locals 1

    .line 1
    iget-object v0, p0, LO/c;->t:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, LO/c;->B(Landroid/view/View;II)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public z(I)Z
    .locals 1

    .line 1
    iget p0, p0, LO/c;->k:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    shl-int p1, v0, p1

    .line 5
    .line 6
    and-int/2addr p0, p1

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method
