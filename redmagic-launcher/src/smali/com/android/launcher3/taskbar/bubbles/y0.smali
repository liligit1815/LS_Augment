.class public final Lcom/android/launcher3/taskbar/bubbles/y0;
.super LN2/f;
.source "BubblePinController.kt"


# instance fields
.field private final j:Landroid/content/Context;

.field private final k:Landroid/widget/FrameLayout;

.field private l:Landroid/graphics/Point;

.field private m:Lcom/android/launcher3/taskbar/bubbles/g0;

.field private n:LX1/b;

.field private o:F

.field private p:F

.field private q:Landroid/view/View;

.field private r:I

.field private s:I

.field private t:I


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
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->j:Landroid/content/Context;

    .line 20
    .line 21
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->k:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method protected B(LN2/h;)V
    .locals 5
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
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->k:Landroid/widget/FrameLayout;

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
    move-result p1

    .line 16
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->m:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string v0, "bubbleBarViewController"

    .line 22
    .line 23
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    move-object v0, v1

    .line 27
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->W()Landroid/graphics/Rect;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->q:Landroid/view/View;

    .line 32
    .line 33
    if-eqz v2, :cond_6

    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    if-eqz v3, :cond_5

    .line 40
    .line 41
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    const/4 p1, 0x3

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 p1, 0x5

    .line 48
    :goto_0
    or-int/lit8 p1, p1, 0x50

    .line 49
    .line 50
    iput p1, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 51
    .line 52
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->l:Landroid/graphics/Point;

    .line 53
    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    iget v4, p1, Landroid/graphics/Point;->x:I

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    iget v4, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->r:I

    .line 60
    .line 61
    :goto_1
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 62
    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_3
    iget p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->s:I

    .line 69
    .line 70
    :goto_2
    iput p1, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 71
    .line 72
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->n:LX1/b;

    .line 73
    .line 74
    if-nez p1, :cond_4

    .line 75
    .line 76
    const-string p1, "bubbleStashController"

    .line 77
    .line 78
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_4
    move-object v1, p1

    .line 83
    :goto_3
    invoke-interface {v1}, LX1/b;->b()F

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    float-to-int p1, p1

    .line 88
    neg-int p1, p1

    .line 89
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p1, v0

    .line 94
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->t:I

    .line 95
    .line 96
    add-int/2addr p1, p0

    .line 97
    iput p1, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 98
    .line 99
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    new-instance p0, Ljava/lang/NullPointerException;

    .line 104
    .line 105
    const-string p1, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 106
    .line 107
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    throw p0

    .line 111
    :cond_6
    return-void
.end method

.method public final C(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 1

    .line 1
    const-string v0, "bubbleControllers"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->m:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->n:LX1/b;

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->j:Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const v0, 0x7f07015d

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->o:F

    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->j:Landroid/content/Context;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const v0, 0x7f07015c

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->p:F

    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->j:Landroid/content/Context;

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const v0, 0x7f070152

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->r:I

    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->j:Landroid/content/Context;

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const v0, 0x7f070151

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->s:I

    .line 73
    .line 74
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->j:Landroid/content/Context;

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    const v0, 0x7f070153

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->t:I

    .line 88
    .line 89
    return-void
.end method

.method public final D(Landroid/graphics/Point;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->l:Landroid/graphics/Point;

    .line 2
    .line 3
    return-void
.end method

.method protected k()Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->j:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->k:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const v3, 0x7f0e007e

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v3, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->q:Landroid/view/View;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->k:Landroid/widget/FrameLayout;

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
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->q:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method protected n()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->p:F

    .line 2
    .line 3
    return p0
.end method

.method protected o()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->o:F

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
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->k:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/y0;->q:Landroid/view/View;

    .line 13
    .line 14
    return-void
.end method
