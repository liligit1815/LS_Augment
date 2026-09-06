.class public LC1/a;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "PinchToOverviewListener.java"

# interfaces
.implements Lcom/android/launcher3/util/G2;


# instance fields
.field private g:Landroid/view/ScaleGestureDetector;

.field private h:Lcom/android/launcher3/C2;

.field private i:Lcom/android/launcher3/Workspace;

.field private j:Z

.field private k:Z

.field private l:Z

.field private m:Z

.field private final n:I

.field private o:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, LC1/a;->i:Lcom/android/launcher3/Workspace;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, LC1/a;->j:Z

    .line 9
    .line 10
    iput-boolean v0, p0, LC1/a;->k:Z

    .line 11
    .line 12
    iput-boolean v0, p0, LC1/a;->l:Z

    .line 13
    .line 14
    iput-boolean v0, p0, LC1/a;->m:Z

    .line 15
    .line 16
    const/16 v1, 0x50

    .line 17
    .line 18
    iput v1, p0, LC1/a;->n:I

    .line 19
    .line 20
    iput-boolean v0, p0, LC1/a;->o:Z

    .line 21
    .line 22
    iput-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    new-instance p1, Landroid/view/ScaleGestureDetector;

    .line 25
    .line 26
    iget-object v0, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-direct {p1, v0, p0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, LC1/a;->g:Landroid/view/ScaleGestureDetector;

    .line 32
    .line 33
    return-void
.end method

.method private a()V
    .locals 2

    .line 1
    iget-boolean v0, p0, LC1/a;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, LC1/a;->j:Z

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, LC1/a;->k:Z

    .line 11
    .line 12
    iput-boolean v0, p0, LC1/a;->l:Z

    .line 13
    .line 14
    iput-boolean v0, p0, LC1/a;->m:Z

    .line 15
    .line 16
    iput-boolean v0, p0, LC1/a;->o:Z

    .line 17
    .line 18
    return-void
.end method

.method private b(FF)Z
    .locals 2

    .line 1
    const/high16 v0, 0x42a00000    # 80.0f

    .line 2
    .line 3
    cmpg-float v1, p1, v0

    .line 4
    .line 5
    if-ltz v1, :cond_1

    .line 6
    .line 7
    iget-object v1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget v1, v1, Lcom/android/launcher3/h0;->T0:I

    .line 14
    .line 15
    add-int/lit8 v1, v1, -0x50

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    cmpl-float p1, p1, v1

    .line 19
    .line 20
    if-gtz p1, :cond_1

    .line 21
    .line 22
    cmpg-float p1, p2, v0

    .line 23
    .line 24
    if-ltz p1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 33
    .line 34
    add-int/lit8 p0, p0, -0x50

    .line 35
    .line 36
    int-to-float p0, p0

    .line 37
    cmpl-float p0, p2, p0

    .line 38
    .line 39
    if-lez p0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method private c()Z
    .locals 3

    .line 1
    iget-object v0, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->v2()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v1, :cond_2

    .line 15
    .line 16
    iget-object v1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->O0:Z

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getNormalChildHeight()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-lez v1, :cond_2

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getIsDragOccuring()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    iget-object v0, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    iget-object p0, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_2

    .line 68
    .line 69
    :cond_1
    const/4 p0, 0x1

    .line 70
    return p0

    .line 71
    :cond_2
    :goto_0
    return v2
.end method

.method private d()V
    .locals 2

    .line 1
    iget-object v0, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    iget-boolean v1, p0, LC1/a;->m:Z

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0}, Lcom/android/launcher3/globalsearch/s;->b()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    :cond_0
    sget-boolean p0, Lcom/android/launcher3/W3;->A:Z

    .line 40
    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    const-string p0, "PinchToOverviewListener"

    .line 44
    .line 45
    const-string v1, "onScaleEnd: open hide folder."

    .line 46
    .line 47
    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->animateOpen()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    iget-boolean v0, p0, LC1/a;->l:Z

    .line 61
    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    iget-object v0, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 65
    .line 66
    const/4 v1, 0x1

    .line 67
    invoke-static {v0, v1}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;Z)V

    .line 68
    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    iput-boolean v0, p0, LC1/a;->l:Z

    .line 72
    .line 73
    :cond_2
    return-void
.end method


# virtual methods
.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-direct {p0, v0, v1}, LC1/a;->b(FF)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput-boolean v0, p0, LC1/a;->o:Z

    .line 28
    .line 29
    :cond_0
    iget-boolean v0, p0, LC1/a;->o:Z

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v1, 0x5

    .line 38
    if-ne v0, v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-direct {p0, v0, v1}, LC1/a;->b(FF)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput-boolean v0, p0, LC1/a;->o:Z

    .line 61
    .line 62
    :cond_1
    iget-object v0, p0, LC1/a;->g:Landroid/view/ScaleGestureDetector;

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 65
    .line 66
    .line 67
    iget-boolean p0, p0, LC1/a;->j:Z

    .line 68
    .line 69
    return p0
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, LC1/a;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x2

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, LC1/a;->g:Landroid/view/ScaleGestureDetector;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    invoke-direct {p0}, LC1/a;->a()V

    .line 20
    .line 21
    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 6

    .line 1
    iget-object v0, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->l()V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getPreviousSpan()F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    sub-float/2addr v0, p1

    .line 31
    const/4 p1, 0x0

    .line 32
    invoke-static {p1, v0}, Ljava/lang/Float;->compare(FF)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v2, 0x1

    .line 37
    if-nez v1, :cond_2

    .line 38
    .line 39
    iget-boolean v1, p0, LC1/a;->l:Z

    .line 40
    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    iget-boolean v1, p0, LC1/a;->m:Z

    .line 44
    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    :cond_1
    return v2

    .line 48
    :cond_2
    cmpg-float v1, v0, p1

    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    if-gez v1, :cond_3

    .line 52
    .line 53
    iget-object v4, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 54
    .line 55
    sget-object v5, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 56
    .line 57
    invoke-interface {v4, v5}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-eqz v4, :cond_3

    .line 62
    .line 63
    return v3

    .line 64
    :cond_3
    cmpl-float p1, v0, p1

    .line 65
    .line 66
    if-lez p1, :cond_4

    .line 67
    .line 68
    iget-object v0, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    sget-object v4, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 71
    .line 72
    invoke-interface {v0, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_4

    .line 77
    .line 78
    iget-boolean v0, p0, LC1/a;->o:Z

    .line 79
    .line 80
    if-nez v0, :cond_4

    .line 81
    .line 82
    iput-boolean v2, p0, LC1/a;->m:Z

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    iput-boolean v3, p0, LC1/a;->m:Z

    .line 86
    .line 87
    :goto_0
    if-gez v1, :cond_5

    .line 88
    .line 89
    iget-object v0, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 90
    .line 91
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 92
    .line 93
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_5

    .line 98
    .line 99
    iput-boolean v2, p0, LC1/a;->l:Z

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_5
    if-lez p1, :cond_6

    .line 103
    .line 104
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 105
    .line 106
    sget-object v0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 107
    .line 108
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_6

    .line 113
    .line 114
    iput-boolean v3, p0, LC1/a;->l:Z

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_6
    iput-boolean v3, p0, LC1/a;->l:Z

    .line 118
    .line 119
    :goto_1
    return v2
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 12
    .line 13
    invoke-interface {p1, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->d3()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    return v0

    .line 29
    :cond_2
    iget-object p1, p0, LC1/a;->i:Lcom/android/launcher3/Workspace;

    .line 30
    .line 31
    if-nez p1, :cond_3

    .line 32
    .line 33
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, LC1/a;->i:Lcom/android/launcher3/Workspace;

    .line 40
    .line 41
    :cond_3
    iget-object p1, p0, LC1/a;->i:Lcom/android/launcher3/Workspace;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    return v0

    .line 50
    :cond_4
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 51
    .line 52
    invoke-static {p1}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    if-eqz p1, :cond_6

    .line 57
    .line 58
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    if-eqz p1, :cond_5

    .line 65
    .line 66
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    if-eqz p1, :cond_6

    .line 73
    .line 74
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p1}, Lcom/android/launcher3/a;->isOpen()Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-nez p1, :cond_6

    .line 85
    .line 86
    :cond_5
    return v0

    .line 87
    :cond_6
    invoke-direct {p0}, LC1/a;->c()Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-nez p1, :cond_7

    .line 92
    .line 93
    return v0

    .line 94
    :cond_7
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 95
    .line 96
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 97
    .line 98
    invoke-interface {p1, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_9

    .line 103
    .line 104
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 105
    .line 106
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 107
    .line 108
    invoke-interface {p1, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_8

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_8
    const/4 p1, 0x1

    .line 116
    iput-boolean p1, p0, LC1/a;->j:Z

    .line 117
    .line 118
    iget-object p0, p0, LC1/a;->i:Lcom/android/launcher3/Workspace;

    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->y2()V

    .line 121
    .line 122
    .line 123
    return p1

    .line 124
    :cond_9
    :goto_0
    return v0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 3

    .line 1
    const-string v0, "PinchToOverviewListener"

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;->onScaleEnd(Landroid/view/ScaleGestureDetector;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 9
    .line 10
    invoke-interface {p1, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_2

    .line 15
    .line 16
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 19
    .line 20
    invoke-interface {p1, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_2

    .line 25
    .line 26
    iget-boolean p1, p0, LC1/a;->m:Z

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/android/launcher3/resource/h1;->f0(Landroid/content/Context;)Ljava/lang/Boolean;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    sget-boolean p1, Lcom/android/launcher3/W3;->A:Z

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-interface {p1}, Lcom/android/launcher3/globalsearch/s;->b()Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-nez p1, :cond_1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_0
    move-exception p1

    .line 78
    goto :goto_1

    .line 79
    :catch_1
    move-exception p1

    .line 80
    goto :goto_2

    .line 81
    :cond_0
    :goto_0
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 82
    .line 83
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->n0()Lcom/android/launcher3/resource/h1;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    if-eqz p1, :cond_2

    .line 96
    .line 97
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-nez v1, :cond_2

    .line 106
    .line 107
    iget-object v1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 108
    .line 109
    invoke-virtual {p1, v1}, Lcom/android/launcher3/resource/h1;->D0(Landroid/content/Context;)V

    .line 110
    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_1
    invoke-static {}, Lx1/O;->L()Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-eqz p1, :cond_2

    .line 118
    .line 119
    invoke-direct {p0}, LC1/a;->d()V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .line 121
    .line 122
    goto :goto_3

    .line 123
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    const-string v2, "onScaleEnd: startThirdHiddenActivity error = "

    .line 129
    .line 130
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    goto :goto_3

    .line 148
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    const-string v2, "onScaleEnd: thirdHiddenApps activity not found e = "

    .line 154
    .line 155
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1}, Landroid/content/ActivityNotFoundException;->getMessage()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    :cond_2
    :goto_3
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 173
    .line 174
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 175
    .line 176
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    const/4 v0, 0x0

    .line 181
    if-nez p1, :cond_4

    .line 182
    .line 183
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 184
    .line 185
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 186
    .line 187
    invoke-interface {p1, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    if-nez p1, :cond_4

    .line 192
    .line 193
    iget-boolean p1, p0, LC1/a;->l:Z

    .line 194
    .line 195
    if-eqz p1, :cond_4

    .line 196
    .line 197
    iget-boolean p1, p0, LC1/a;->j:Z

    .line 198
    .line 199
    if-eqz p1, :cond_4

    .line 200
    .line 201
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    if-nez p1, :cond_4

    .line 210
    .line 211
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    if-eqz p1, :cond_3

    .line 216
    .line 217
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    invoke-virtual {p1}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    invoke-interface {p1}, Lcom/android/launcher3/globalsearch/s;->b()Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-nez p1, :cond_4

    .line 230
    .line 231
    :cond_3
    sget-boolean p1, Lcom/android/launcher3/W3;->A:Z

    .line 232
    .line 233
    if-nez p1, :cond_4

    .line 234
    .line 235
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->y()Z

    .line 236
    .line 237
    .line 238
    move-result p1

    .line 239
    if-nez p1, :cond_4

    .line 240
    .line 241
    invoke-static {}, Lh1/a;->O()V

    .line 242
    .line 243
    .line 244
    iget-object p1, p0, LC1/a;->h:Lcom/android/launcher3/C2;

    .line 245
    .line 246
    sget-object v1, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 247
    .line 248
    invoke-virtual {p1, v1}, Lcom/android/launcher3/C2;->H4(Lcom/android/launcher3/q4$a;)V

    .line 249
    .line 250
    .line 251
    iget-object p1, p0, LC1/a;->i:Lcom/android/launcher3/Workspace;

    .line 252
    .line 253
    const/4 v1, 0x1

    .line 254
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->performHapticFeedback(II)Z

    .line 255
    .line 256
    .line 257
    :cond_4
    iget-object p1, p0, LC1/a;->i:Lcom/android/launcher3/Workspace;

    .line 258
    .line 259
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->v2()V

    .line 260
    .line 261
    .line 262
    iput-boolean v0, p0, LC1/a;->j:Z

    .line 263
    .line 264
    iput-boolean v0, p0, LC1/a;->k:Z

    .line 265
    .line 266
    iput-boolean v0, p0, LC1/a;->l:Z

    .line 267
    .line 268
    iput-boolean v0, p0, LC1/a;->m:Z

    .line 269
    .line 270
    iput-boolean v0, p0, LC1/a;->o:Z

    .line 271
    .line 272
    return-void
.end method
