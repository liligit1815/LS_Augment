.class public final Lcom/android/launcher3/taskbar/b0$a;
.super LR2/b;
.source "ManageWindowsTaskbarShortcut.kt"

# interfaces
.implements Lcom/android/launcher3/util/G2;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/b0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field private final k:Landroid/view/View;

.field private final l:La2/a;

.field private final m:Lcom/android/launcher3/taskbar/R1;

.field private final n:Lcom/android/launcher3/taskbar/I1;


# direct methods
.method public constructor <init>(Landroid/view/View;La2/a;Ljava/util/ArrayList;Lu4/l;Lu4/a;Lcom/android/launcher3/taskbar/R1;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "La2/a;",
            "Ljava/util/ArrayList<",
            "Lh4/l<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            ">;>;",
            "Lu4/l<",
            "-",
            "Ljava/lang/Integer;",
            "Lh4/t;",
            ">;",
            "Lu4/a<",
            "Lh4/t;",
            ">;",
            "Lcom/android/launcher3/taskbar/R1;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "originalView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "taskbarOverlayContext"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "snapshotList"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "onIconClickListener"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "onOutsideClickListener"

    .line 22
    .line 23
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "controllers"

    .line 27
    .line 28
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "getContext(...)"

    .line 36
    .line 37
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const v2, 0x7f06045b

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-direct {p0, v0, v1}, LR2/b;-><init>(Landroid/content/Context;I)V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Lcom/android/launcher3/taskbar/b0$a;->k:Landroid/view/View;

    .line 55
    .line 56
    iput-object p2, p0, Lcom/android/launcher3/taskbar/b0$a;->l:La2/a;

    .line 57
    .line 58
    iput-object p6, p0, Lcom/android/launcher3/taskbar/b0$a;->m:Lcom/android/launcher3/taskbar/R1;

    .line 59
    .line 60
    iget-object p1, p6, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/android/launcher3/taskbar/b0$a;->n:Lcom/android/launcher3/taskbar/I1;

    .line 63
    .line 64
    invoke-virtual {p0, p3, p4, p5}, LR2/b;->f(Ljava/util/List;Lu4/l;Lu4/a;)LR2/b$b;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, La2/a;->n()La2/h;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1, p0}, La2/h;->c(Lcom/android/launcher3/util/G2;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, LR2/b;->e()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method private final k()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b0$a;->n:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, LR2/b;->g()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const v2, 0x7f070b9f

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {p0}, LR2/b;->h()LR2/b$b;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, LR2/b$b;->p()Landroid/widget/LinearLayout;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget v3, v0, Lcom/android/launcher3/h0;->W0:I

    .line 31
    .line 32
    invoke-virtual {p0}, LR2/b;->h()LR2/b$b;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v4}, LR2/b$b;->n()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    sub-int/2addr v3, v4

    .line 41
    iget-object v4, p0, Lcom/android/launcher3/taskbar/b0$a;->m:Lcom/android/launcher3/taskbar/R1;

    .line 42
    .line 43
    iget-object v4, v4, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 44
    .line 45
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/a4;->W()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    sub-int/2addr v3, v4

    .line 50
    int-to-float v3, v3

    .line 51
    sub-float/2addr v3, v1

    .line 52
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setY(F)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, LR2/b;->h()LR2/b$b;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2}, LR2/b$b;->p()Landroid/widget/LinearLayout;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p0}, LR2/b;->g()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-static {v3}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-eqz v3, :cond_0

    .line 76
    .line 77
    iget v0, v0, Lcom/android/launcher3/h0;->V0:I

    .line 78
    .line 79
    invoke-virtual {p0}, LR2/b;->h()LR2/b$b;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, LR2/b$b;->o()I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    sub-int/2addr v0, p0

    .line 88
    neg-int p0, v0

    .line 89
    int-to-float p0, p0

    .line 90
    const/high16 v0, 0x40000000    # 2.0f

    .line 91
    .line 92
    div-float/2addr p0, v0

    .line 93
    goto :goto_0

    .line 94
    :cond_0
    iget v0, v0, Lcom/android/launcher3/h0;->V0:I

    .line 95
    .line 96
    invoke-virtual {p0}, LR2/b;->h()LR2/b$b;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v3}, LR2/b$b;->o()I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    sub-int/2addr v0, v3

    .line 105
    int-to-float v0, v0

    .line 106
    sub-float/2addr v0, v1

    .line 107
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b0$a;->k:Landroid/view/View;

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    invoke-static {p0, v0}, Ljava/lang/Math;->min(FF)F

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    :goto_0
    invoke-virtual {v2, p0}, Landroid/widget/LinearLayout;->setTranslationX(F)V

    .line 118
    .line 119
    .line 120
    return-void
.end method


# virtual methods
.method public b(LR2/b$b;)V
    .locals 3

    .line 1
    const-string v0, "menuView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/b0$a;->k()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b0$a;->m:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 12
    .line 13
    const/16 v1, 0x80

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/K1;->g(IZ)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b0$a;->n:Lcom/android/launcher3/taskbar/I1;

    .line 20
    .line 21
    const/high16 v1, 0x100000

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/android/launcher3/a;->closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, LR2/b$b;->p()Landroid/widget/LinearLayout;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1}, LR2/b$b;->n()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, LR2/b$b;->p()Landroid/widget/LinearLayout;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1}, LR2/b$b;->o()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setMinimumWidth(I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b0$a;->l:La2/a;

    .line 49
    .line 50
    invoke-virtual {p0}, La2/a;->n()La2/h;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    if-eqz p0, :cond_0

    .line 55
    .line 56
    invoke-virtual {p1}, LR2/b$b;->p()Landroid/widget/LinearLayout;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    invoke-virtual {p1}, LR2/b$b;->p()Landroid/widget/LinearLayout;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestFocus()Z

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b0$a;->m:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 4
    .line 5
    const/16 v1, 0x80

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/K1;->g(IZ)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b0$a;->l:La2/a;

    .line 12
    .line 13
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, LR2/b;->h()LR2/b$b;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, LR2/b$b;->p()Landroid/widget/LinearLayout;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b0$a;->l:La2/a;

    .line 31
    .line 32
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p0}, La2/h;->d(Lcom/android/launcher3/util/G2;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b0$a;->m:Lcom/android/launcher3/taskbar/R1;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/z3;->i()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b0$a;->l:La2/a;

    .line 10
    .line 11
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, LR2/b;->h()LR2/b$b;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, LR2/b$b;->p()Landroid/widget/LinearLayout;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, LR2/b;->c()V

    .line 30
    .line 31
    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
