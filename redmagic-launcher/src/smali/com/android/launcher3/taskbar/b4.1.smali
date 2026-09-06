.class public final Lcom/android/launcher3/taskbar/b4;
.super Ljava/lang/Object;
.source "TaskbarStashViaTouchController.kt"

# interfaces
.implements Lcom/android/launcher3/util/G2;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/R1;

.field private final h:Lcom/android/launcher3/taskbar/I1;

.field private final i:Z

.field private final j:Lcom/android/launcher3/touch/H;

.field private final k:Lcom/android/launcher3/taskbar/j4$b;

.field private final l:Landroid/view/animation/Interpolator;

.field private final m:F

.field private final n:F

.field private final o:F

.field private p:F


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/R1;)V
    .locals 3

    .line 1
    const-string v0, "controllers"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/taskbar/b4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    const-string v1, "taskbarActivityContext"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/launcher3/taskbar/b4;->h:Lcom/android/launcher3/taskbar/I1;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/b4;->i:Z

    .line 25
    .line 26
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->t:Lcom/android/launcher3/taskbar/j4;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/j4;->p()Lcom/android/launcher3/taskbar/j4$b;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/android/launcher3/taskbar/b4;->k:Lcom/android/launcher3/taskbar/j4$b;

    .line 33
    .line 34
    sget-object p1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/android/launcher3/taskbar/b4;->l:Landroid/view/animation/Interpolator;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const v1, 0x7f070c1d

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    int-to-float p1, p1

    .line 50
    iput p1, p0, Lcom/android/launcher3/taskbar/b4;->m:F

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget v1, v1, Lcom/android/launcher3/h0;->r3:I

    .line 57
    .line 58
    int-to-float v1, v1

    .line 59
    add-float/2addr p1, v1

    .line 60
    iput p1, p0, Lcom/android/launcher3/taskbar/b4;->n:F

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const v1, 0x7f070bbf

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    int-to-float p1, p1

    .line 74
    iput p1, p0, Lcom/android/launcher3/taskbar/b4;->o:F

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/b4;->i()V

    .line 77
    .line 78
    .line 79
    new-instance p1, Lcom/android/launcher3/touch/H;

    .line 80
    .line 81
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/b4;->g()Lcom/android/launcher3/taskbar/b4$a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    sget-object v2, Lcom/android/launcher3/touch/H;->w:Lcom/android/launcher3/touch/H$c;

    .line 86
    .line 87
    invoke-direct {p1, v0, v1, v2}, Lcom/android/launcher3/touch/H;-><init>(Landroid/content/Context;Lcom/android/launcher3/touch/H$d;Lcom/android/launcher3/touch/H$c;)V

    .line 88
    .line 89
    .line 90
    iput-object p1, p0, Lcom/android/launcher3/taskbar/b4;->j:Lcom/android/launcher3/touch/H;

    .line 91
    .line 92
    const/4 p0, 0x2

    .line 93
    const/4 v0, 0x0

    .line 94
    invoke-virtual {p1, p0, v0}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public static final synthetic a(Lcom/android/launcher3/taskbar/b4;)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b4;->l:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic b(Lcom/android/launcher3/taskbar/b4;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/b4;->n:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic c(Lcom/android/launcher3/taskbar/b4;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/b4;->m:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic d(Lcom/android/launcher3/taskbar/b4;)Lcom/android/launcher3/touch/H;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b4;->j:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic e(Lcom/android/launcher3/taskbar/b4;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/b4;->o:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic f(Lcom/android/launcher3/taskbar/b4;)Lcom/android/launcher3/taskbar/j4$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b4;->k:Lcom/android/launcher3/taskbar/j4$b;

    .line 2
    .line 3
    return-object p0
.end method

.method private final g()Lcom/android/launcher3/taskbar/b4$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/b4$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/b4$a;-><init>(Lcom/android/launcher3/taskbar/b4;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final h()Lcom/android/launcher3/taskbar/R1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/b4;->i:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b4;->h:Lcom/android/launcher3/taskbar/I1;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "navigation_bar_gesture_height"

    .line 13
    .line 14
    invoke-static {v1, v0}, Lc2/a;->d(Ljava/lang/String;Landroid/content/res/Resources;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Lcom/android/launcher3/taskbar/b4;->h:Lcom/android/launcher3/taskbar/I1;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 25
    .line 26
    sub-int/2addr v1, v0

    .line 27
    int-to-float v0, v1

    .line 28
    iput v0, p0, Lcom/android/launcher3/taskbar/b4;->p:F

    .line 29
    .line 30
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    const-string v0, "ev"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/b4;->i:Z

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v0, v2}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v2, v0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/bubbles/g0;->D0()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v2, v0, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 37
    .line 38
    invoke-interface {v2}, LX1/b;->c()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_3

    .line 43
    .line 44
    :cond_2
    iget-object v2, p0, Lcom/android/launcher3/taskbar/b4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 47
    .line 48
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/a4;->g0()Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_3

    .line 53
    .line 54
    return v1

    .line 55
    :cond_3
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    invoke-virtual {v2, v3, v4}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    const/4 v4, 0x4

    .line 75
    const/4 v5, 0x1

    .line 76
    if-ne v3, v4, :cond_4

    .line 77
    .line 78
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 81
    .line 82
    invoke-virtual {p0, v5}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    iget-object v3, p0, Lcom/android/launcher3/taskbar/b4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 87
    .line 88
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 89
    .line 90
    invoke-virtual {v3, v2}, Lcom/android/launcher3/taskbar/W4;->e0(Landroid/view/MotionEvent;)Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-eqz v3, :cond_5

    .line 95
    .line 96
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b4;->j:Lcom/android/launcher3/touch/H;

    .line 97
    .line 98
    invoke-virtual {v0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b4;->j:Lcom/android/launcher3/touch/H;

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->f()Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_7

    .line 108
    .line 109
    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    .line 110
    .line 111
    .line 112
    return v5

    .line 113
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_7

    .line 118
    .line 119
    if-eqz v0, :cond_6

    .line 120
    .line 121
    iget-object p1, v0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 122
    .line 123
    invoke-virtual {p1, v2}, Lcom/android/launcher3/taskbar/bubbles/g0;->B0(Landroid/view/MotionEvent;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_6

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_6
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getY()F

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    iget v0, p0, Lcom/android/launcher3/taskbar/b4;->p:F

    .line 135
    .line 136
    cmpg-float p1, p1, v0

    .line 137
    .line 138
    if-gez p1, :cond_7

    .line 139
    .line 140
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b4;->g:Lcom/android/launcher3/taskbar/R1;

    .line 141
    .line 142
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 143
    .line 144
    invoke-virtual {p0, v5}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 145
    .line 146
    .line 147
    :cond_7
    :goto_0
    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    .line 148
    .line 149
    .line 150
    return v1
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    const-string v0, "ev"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b4;->j:Lcom/android/launcher3/touch/H;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method
