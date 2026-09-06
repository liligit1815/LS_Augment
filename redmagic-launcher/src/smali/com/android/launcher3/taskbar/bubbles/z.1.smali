.class public final Lcom/android/launcher3/taskbar/bubbles/z;
.super LN2/f;
.source "BubbleBarPinController.kt"


# instance fields
.field private final j:Landroid/content/Context;

.field private final k:Landroid/widget/FrameLayout;

.field private l:Lcom/android/launcher3/taskbar/bubbles/g0;

.field private m:LX1/b;

.field private n:Lcom/android/launcher3/taskbar/bubbles/t$a;

.field private o:F

.field private p:F

.field private q:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/FrameLayout;Lu4/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/widget/FrameLayout;",
            "Lu4/a<",
            "+",
            "Landroid/graphics/Point;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "container"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "screenSizeProvider"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, p3}, LN2/f;-><init>(Lu4/a;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/z;->j:Landroid/content/Context;

    .line 20
    .line 21
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/z;->k:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method protected B(LN2/h;)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded"
        }
    .end annotation

    .line 1
    const-string v0, "location"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/z;->k:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p1, v0}, LN2/h;->e(Z)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/z;->l:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 17
    .line 18
    const-string v2, "bubbleBarViewController"

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    move-object v1, v3

    .line 27
    :cond_0
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->W()Landroid/graphics/Rect;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/z;->l:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 32
    .line 33
    if-nez v4, :cond_1

    .line 34
    .line 35
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    move-object v4, v3

    .line 39
    :cond_1
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/bubbles/g0;->t0()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/z;->n:Lcom/android/launcher3/taskbar/bubbles/t$a;

    .line 44
    .line 45
    if-nez v4, :cond_2

    .line 46
    .line 47
    const-string v4, "bubbleBarLocationListener"

    .line 48
    .line 49
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    move-object v4, v3

    .line 53
    :cond_2
    invoke-interface {v4, p1}, Lcom/android/launcher3/taskbar/bubbles/t$a;->c(LN2/h;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/z;->q:Landroid/view/View;

    .line 57
    .line 58
    if-eqz p1, :cond_6

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    if-eqz v4, :cond_5

    .line 65
    .line 66
    check-cast v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    iput v5, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 73
    .line 74
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 79
    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    const/4 v0, 0x3

    .line 83
    goto :goto_0

    .line 84
    :cond_3
    const/4 v0, 0x5

    .line 85
    :goto_0
    or-int/lit8 v0, v0, 0x50

    .line 86
    .line 87
    iput v0, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 88
    .line 89
    iput v2, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 90
    .line 91
    iput v2, v4, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 92
    .line 93
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/z;->m:LX1/b;

    .line 94
    .line 95
    if-nez p0, :cond_4

    .line 96
    .line 97
    const-string p0, "bubbleStashController"

    .line 98
    .line 99
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    move-object v3, p0

    .line 104
    :goto_1
    invoke-interface {v3}, LX1/b;->b()F

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    float-to-int p0, p0

    .line 109
    neg-int p0, p0

    .line 110
    iput p0, v4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 111
    .line 112
    invoke-virtual {p1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_5
    new-instance p0, Ljava/lang/NullPointerException;

    .line 117
    .line 118
    const-string p1, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 119
    .line 120
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    throw p0

    .line 124
    :cond_6
    return-void
.end method

.method public final C(Lcom/android/launcher3/taskbar/bubbles/m0;Lcom/android/launcher3/taskbar/bubbles/t$a;)V
    .locals 1

    .line 1
    const-string v0, "bubbleControllers"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "bubbleBarLocationListener"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/z;->n:Lcom/android/launcher3/taskbar/bubbles/t$a;

    .line 12
    .line 13
    iget-object p2, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 14
    .line 15
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/z;->l:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/z;->m:LX1/b;

    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/z;->j:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const p2, 0x7f07015d

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/z;->o:F

    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/z;->j:Landroid/content/Context;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const p2, 0x7f07015c

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/z;->p:F

    .line 50
    .line 51
    return-void
.end method

.method protected k()Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/z;->j:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/z;->k:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const v3, 0x7f0e007c

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v3, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/z;->q:Landroid/view/View;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/z;->k:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    const-string p0, "also(...)"

    .line 25
    .line 26
    invoke-static {v0, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method protected l()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/z;->q:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method protected n()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/z;->p:F

    .line 2
    .line 3
    return p0
.end method

.method protected o()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/z;->o:F

    .line 2
    .line 3
    return p0
.end method

.method protected x(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/z;->k:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/z;->q:Landroid/view/View;

    .line 13
    .line 14
    return-void
.end method
