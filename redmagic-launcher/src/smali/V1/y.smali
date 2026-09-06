.class public final LV1/y;
.super Ljava/lang/Object;
.source "BubbleBarViewAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LV1/y$a;,
        LV1/y$b;,
        LV1/y$c;,
        LV1/y$d;,
        LV1/y$e;,
        LV1/y$f;
    }
.end annotation


# static fields
.field private static final l:LV1/y$b;


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

.field private final b:LX1/b;

.field private final c:LW1/l;

.field private final d:Lcom/android/launcher3/taskbar/bubbles/y;

.field private final e:Ljava/lang/Runnable;

.field private final f:Ljava/lang/Runnable;

.field private final g:LV1/y$d;

.field private h:LV1/y$a;

.field private final i:I

.field private j:Z

.field private final k:LM2/i$f;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LV1/y$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LV1/y$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LV1/y;->l:LV1/y$b;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LX1/b;LW1/l;Lcom/android/launcher3/taskbar/bubbles/y;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 11

    .line 1
    const-string v0, "bubbleBarView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bubbleStashController"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bubbleBarFlyoutController"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bubbleBarParentViewHeightUpdateNotifier"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onExpanded"

    move-object/from16 v6, p5

    invoke-static {v6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onBubbleBarVisible"

    move-object/from16 v7, p6

    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v9, 0x40

    const/4 v10, 0x0

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v10}, LV1/y;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LX1/b;LW1/l;Lcom/android/launcher3/taskbar/bubbles/y;Ljava/lang/Runnable;Ljava/lang/Runnable;LV1/y$d;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LX1/b;LW1/l;Lcom/android/launcher3/taskbar/bubbles/y;Ljava/lang/Runnable;Ljava/lang/Runnable;LV1/y$d;)V
    .locals 1

    const-string v0, "bubbleBarView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bubbleStashController"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bubbleBarFlyoutController"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bubbleBarParentViewHeightUpdateNotifier"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onExpanded"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onBubbleBarVisible"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "scheduler"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    iput-object p2, p0, LV1/y;->b:LX1/b;

    .line 5
    iput-object p3, p0, LV1/y;->c:LW1/l;

    .line 6
    iput-object p4, p0, LV1/y;->d:Lcom/android/launcher3/taskbar/bubbles/y;

    .line 7
    iput-object p5, p0, LV1/y;->e:Ljava/lang/Runnable;

    .line 8
    iput-object p6, p0, LV1/y;->f:Ljava/lang/Runnable;

    .line 9
    iput-object p7, p0, LV1/y;->g:LV1/y$d;

    .line 10
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070156

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, LV1/y;->i:I

    .line 11
    new-instance p1, LM2/i$f;

    const/high16 p2, 0x43480000    # 200.0f

    const/high16 p3, 0x3f000000    # 0.5f

    invoke-direct {p1, p2, p3}, LM2/i$f;-><init>(FF)V

    iput-object p1, p0, LV1/y;->k:LM2/i$f;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LX1/b;LW1/l;Lcom/android/launcher3/taskbar/bubbles/y;Ljava/lang/Runnable;Ljava/lang/Runnable;LV1/y$d;ILkotlin/jvm/internal/j;)V
    .locals 9

    and-int/lit8 v0, p8, 0x40

    if-eqz v0, :cond_0

    .line 12
    new-instance v0, LV1/y$c;

    invoke-direct {v0, p1}, LV1/y$c;-><init>(Landroid/view/View;)V

    move-object v8, v0

    :goto_0
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    goto :goto_1

    :cond_0
    move-object/from16 v8, p7

    goto :goto_0

    .line 13
    :goto_1
    invoke-direct/range {v1 .. v8}, LV1/y;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LX1/b;LW1/l;Lcom/android/launcher3/taskbar/bubbles/y;Ljava/lang/Runnable;Ljava/lang/Runnable;LV1/y$d;)V

    return-void
.end method

.method private static final B()V
    .locals 0

    .line 1
    return-void
.end method

.method private static final D(LV1/y;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, LV1/y;->c0()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p1, p0, LV1/y;->b:LX1/b;

    .line 8
    .line 9
    invoke-interface {p1}, LX1/b;->x()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 13
    .line 14
    invoke-interface {p0}, LX1/b;->n()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private final E()Ljava/lang/Runnable;
    .locals 1

    .line 1
    new-instance v0, LV1/x;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LV1/x;-><init>(LV1/y;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static final F(LV1/y;)V
    .locals 6

    .line 1
    sget-object v0, LV1/y$a$a;->h:LV1/y$a$a;

    .line 2
    .line 3
    invoke-direct {p0, v0}, LV1/y;->l0(LV1/y$a$a;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LV1/y;->b:LX1/b;

    .line 7
    .line 8
    invoke-interface {v0}, LX1/b;->b()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    sget-object v1, LM2/i;->n:LM2/i$b;

    .line 13
    .line 14
    iget-object v2, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, LM2/i$b;->a(Ljava/lang/Object;)LM2/i;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, LV1/y;->k:LM2/i$f;

    .line 21
    .line 22
    invoke-virtual {v1, v2}, LM2/i;->z(LM2/i$f;)V

    .line 23
    .line 24
    .line 25
    sget-object v2, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 26
    .line 27
    const-string v3, "TRANSLATION_Y"

    .line 28
    .line 29
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v2, v0}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 33
    .line 34
    .line 35
    new-instance v2, LV1/o;

    .line 36
    .line 37
    invoke-direct {v2, p0}, LV1/o;-><init>(LV1/y;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, LM2/i;->h(LM2/i$c;)LM2/i;

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 44
    .line 45
    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 46
    .line 47
    iget v4, p0, LV1/y;->i:I

    .line 48
    .line 49
    int-to-float v4, v4

    .line 50
    sub-float/2addr v0, v4

    .line 51
    const/4 v4, 0x1

    .line 52
    new-array v4, v4, [F

    .line 53
    .line 54
    const/4 v5, 0x0

    .line 55
    aput v0, v4, v5

    .line 56
    .line 57
    invoke-static {v2, v3, v4}, Ly/s;->R(Ljava/lang/Object;Landroid/util/Property;[F)Ly/s;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v2, "ofFloat(...)"

    .line 62
    .line 63
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    const-wide/16 v2, 0xfa

    .line 67
    .line 68
    invoke-direct {p0, v0, v2, v3}, LV1/y;->x0(Ly/s;J)Ly/s;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v2, LV1/p;

    .line 73
    .line 74
    invoke-direct {v2, v1, p0}, LV1/p;-><init>(LM2/i;LV1/y;)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0, v0, v2}, LV1/y;->y0(Ly/s;Lu4/a;)Ly/s;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Ly/s;->L()V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method private static final G(LV1/y;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 0

    .line 1
    const-string p3, "<unused var>"

    .line 2
    .line 3
    invoke-static {p1, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, LV1/y;->h:LV1/y$a;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, LV1/y$a;->d()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/4 p2, 0x1

    .line 18
    if-ne p1, p2, :cond_0

    .line 19
    .line 20
    invoke-direct {p0}, LV1/y;->e0()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, LV1/y;->Z()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-direct {p0}, LV1/y;->p0()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private static final H(LM2/i;LV1/y;)Lh4/t;
    .locals 1

    .line 1
    invoke-virtual {p0}, LM2/i;->F()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p1, LV1/y;->h:LV1/y$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, LV1/y$a;->d()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const/4 v0, 0x1

    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    invoke-direct {p1}, LV1/y;->e0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 19
    .line 20
    return-object p0
.end method

.method private final I()Ljava/lang/Runnable;
    .locals 1

    .line 1
    new-instance v0, LV1/f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LV1/f;-><init>(LV1/y;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static final J(LV1/y;)V
    .locals 4

    .line 1
    sget-object v0, LV1/y$a$a;->h:LV1/y$a$a;

    .line 2
    .line 3
    invoke-direct {p0, v0}, LV1/y;->l0(LV1/y$a$a;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, LV1/y;->f:Ljava/lang/Runnable;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 28
    .line 29
    const/high16 v1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setBackgroundScaleX(F)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setBackgroundScaleY(F)V

    .line 52
    .line 53
    .line 54
    new-instance v0, LV1/y$e;

    .line 55
    .line 56
    iget-object v1, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 57
    .line 58
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-direct {v0, p0, v1}, LV1/y$e;-><init>(LV1/y;F)V

    .line 63
    .line 64
    .line 65
    sget-object v1, LM2/i;->n:LM2/i$b;

    .line 66
    .line 67
    iget-object v2, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 68
    .line 69
    invoke-virtual {v1, v2}, LM2/i$b;->a(Ljava/lang/Object;)LM2/i;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object v2, p0, LV1/y;->k:LM2/i$f;

    .line 74
    .line 75
    invoke-virtual {v1, v2}, LM2/i;->z(LM2/i$f;)V

    .line 76
    .line 77
    .line 78
    sget-object v2, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 79
    .line 80
    const-string v3, "TRANSLATION_Y"

    .line 81
    .line 82
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object v3, p0, LV1/y;->b:LX1/b;

    .line 86
    .line 87
    invoke-interface {v3}, LX1/b;->b()F

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    invoke-virtual {v1, v2, v3}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 92
    .line 93
    .line 94
    new-instance v2, LV1/l;

    .line 95
    .line 96
    invoke-direct {v2, v0, p0}, LV1/l;-><init>(LV1/y$e;LV1/y;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v2}, LM2/i;->i(LM2/i$g;)LM2/i;

    .line 100
    .line 101
    .line 102
    new-instance v0, LV1/m;

    .line 103
    .line 104
    invoke-direct {v0, p0}, LV1/m;-><init>(LV1/y;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1, v0}, LM2/i;->h(LM2/i$c;)LM2/i;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, LM2/i;->F()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method private static final K(LV1/y;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 0

    .line 1
    const-string p3, "<unused var>"

    .line 2
    .line 3
    invoke-static {p1, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, LV1/y;->h:LV1/y$a;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, LV1/y$a;->d()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/4 p2, 0x1

    .line 18
    if-ne p1, p2, :cond_0

    .line 19
    .line 20
    invoke-direct {p0}, LV1/y;->Z()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-direct {p0}, LV1/y;->p0()V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 28
    .line 29
    invoke-interface {p0}, LX1/b;->n()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private static final L(LV1/y$e;LV1/y;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/util/ArrayMap;)V
    .locals 1

    .line 1
    const-string v0, "<unused var>"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p2, "values"

    .line 7
    .line 8
    invoke-static {p3, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p2, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 12
    .line 13
    invoke-virtual {p3, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, LM2/i$a;

    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p2}, LM2/i$a;->a()F

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-virtual {p0, p2}, LV1/y$e;->a(F)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p1, LV1/y;->b:LX1/b;

    .line 29
    .line 30
    invoke-interface {p0}, LX1/b;->n()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private final M()Ljava/lang/Runnable;
    .locals 1

    .line 1
    new-instance v0, LV1/e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LV1/e;-><init>(LV1/y;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static final N(LV1/y;)V
    .locals 6

    .line 1
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v0, LV1/y$a$a;->j:LV1/y$a$a;

    .line 7
    .line 8
    invoke-direct {p0, v0}, LV1/y;->l0(LV1/y$a$a;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, LV1/y;->b:LX1/b;

    .line 12
    .line 13
    invoke-interface {v0}, LX1/b;->i()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, LV1/y;->b:LX1/b;

    .line 18
    .line 19
    invoke-interface {v1}, LX1/b;->y()F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget-object v2, p0, LV1/y;->b:LX1/b;

    .line 24
    .line 25
    invoke-interface {v2}, LX1/b;->l()F

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-float/2addr v2, v0

    .line 30
    iget-object v3, p0, LV1/y;->b:LX1/b;

    .line 31
    .line 32
    invoke-interface {v3, v2}, LX1/b;->A(F)V

    .line 33
    .line 34
    .line 35
    iget-object v3, p0, LV1/y;->b:LX1/b;

    .line 36
    .line 37
    invoke-interface {v3}, LX1/b;->s()LM2/i;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    :goto_0
    return-void

    .line 44
    :cond_1
    iget-object v4, p0, LV1/y;->k:LM2/i$f;

    .line 45
    .line 46
    invoke-virtual {v3, v4}, LM2/i;->z(LM2/i$f;)V

    .line 47
    .line 48
    .line 49
    sget-object v4, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 50
    .line 51
    const-string v5, "TRANSLATION_Y"

    .line 52
    .line 53
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 v5, 0x0

    .line 57
    invoke-virtual {v3, v4, v5}, LM2/i;->A(Landroidx/dynamicanimation/animation/g;F)LM2/i;

    .line 58
    .line 59
    .line 60
    new-instance v4, LV1/i;

    .line 61
    .line 62
    invoke-direct {v4, v1, p0, v0, v2}, LV1/i;-><init>(FLV1/y;FF)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3, v4}, LM2/i;->i(LM2/i$g;)LM2/i;

    .line 66
    .line 67
    .line 68
    new-instance v0, LV1/j;

    .line 69
    .line 70
    invoke-direct {v0, p0}, LV1/j;-><init>(LV1/y;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3, v0}, LM2/i;->h(LM2/i$c;)LM2/i;

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 77
    .line 78
    const/4 v1, 0x0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    invoke-virtual {v0}, LV1/y$a;->c()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    goto :goto_1

    .line 92
    :cond_2
    move-object v0, v1

    .line 93
    :goto_1
    instance-of v2, v0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 94
    .line 95
    if-eqz v2, :cond_3

    .line 96
    .line 97
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_3
    move-object v0, v1

    .line 101
    :goto_2
    if-eqz v0, :cond_4

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/b;->f()LW1/m;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    :cond_4
    if-eqz v1, :cond_5

    .line 108
    .line 109
    iget-object v0, p0, LV1/y;->c:LW1/l;

    .line 110
    .line 111
    new-instance v1, LV1/k;

    .line 112
    .line 113
    invoke-direct {v1, p0, v3}, LV1/k;-><init>(LV1/y;LM2/i;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, LW1/l;->p(Lu4/a;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_5
    invoke-virtual {v3}, LM2/i;->F()V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method private static final O(FLV1/y;FFLandroid/view/View;Landroid/util/ArrayMap;)V
    .locals 1

    .line 1
    const-string v0, "handle"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "values"

    .line 7
    .line 8
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 12
    .line 13
    invoke-virtual {p5, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p5

    .line 17
    check-cast p5, LM2/i$a;

    .line 18
    .line 19
    if-eqz p5, :cond_3

    .line 20
    .line 21
    invoke-virtual {p5}, LM2/i$a;->a()F

    .line 22
    .line 23
    .line 24
    move-result p5

    .line 25
    cmpg-float v0, p5, p0

    .line 26
    .line 27
    if-gtz v0, :cond_0

    .line 28
    .line 29
    iget-object p4, p1, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 30
    .line 31
    sub-float p2, p5, p2

    .line 32
    .line 33
    invoke-virtual {p4, p2}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 34
    .line 35
    .line 36
    sub-float p2, p3, p5

    .line 37
    .line 38
    sub-float/2addr p3, p0

    .line 39
    div-float/2addr p2, p3

    .line 40
    iget-object p0, p1, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 41
    .line 42
    const/4 p3, 0x1

    .line 43
    int-to-float p3, p3

    .line 44
    sub-float p4, p3, p2

    .line 45
    .line 46
    invoke-virtual {p0, p4}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p1, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 50
    .line 51
    const p4, 0x3f333333    # 0.7f

    .line 52
    .line 53
    .line 54
    mul-float/2addr p2, p4

    .line 55
    sub-float/2addr p3, p2

    .line 56
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    const/high16 p2, 0x3f000000    # 0.5f

    .line 66
    .line 67
    cmpl-float p0, p0, p2

    .line 68
    .line 69
    if-lez p0, :cond_3

    .line 70
    .line 71
    iget-object p0, p1, LV1/y;->b:LX1/b;

    .line 72
    .line 73
    invoke-interface {p0}, LX1/b;->n()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    const/4 p2, 0x0

    .line 78
    cmpg-float p3, p5, p2

    .line 79
    .line 80
    const/high16 v0, 0x3f800000    # 1.0f

    .line 81
    .line 82
    if-gtz p3, :cond_2

    .line 83
    .line 84
    iget-object p1, p1, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p4}, Landroid/view/View;->getAlpha()F

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    cmpg-float p1, p1, v0

    .line 94
    .line 95
    if-nez p1, :cond_1

    .line 96
    .line 97
    return-void

    .line 98
    :cond_1
    sub-float p1, p0, p5

    .line 99
    .line 100
    div-float/2addr p1, p0

    .line 101
    invoke-virtual {p4, p1}, Landroid/view/View;->setAlpha(F)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_2
    invoke-virtual {p4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 106
    .line 107
    .line 108
    :cond_3
    return-void
.end method

.method private static final P(LV1/y;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 0

    .line 1
    const-string p3, "<unused var>"

    .line 2
    .line 3
    invoke-static {p1, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, LV1/y;->h:LV1/y$a;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, LV1/y$a;->g()LV1/y$a$a;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    :goto_0
    sget-object p2, LV1/y$a$a;->j:LV1/y$a$a;

    .line 20
    .line 21
    if-eq p1, p2, :cond_1

    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-boolean p1, p0, LV1/y;->j:Z

    .line 25
    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, LV1/y;->j:Z

    .line 30
    .line 31
    iget-object p1, p0, LV1/y;->g:LV1/y$d;

    .line 32
    .line 33
    invoke-static {p6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-direct {p0, p2}, LV1/y;->R(Ljava/lang/Float;)Ljava/lang/Runnable;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p1, p0}, LV1/y$d;->c(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-direct {p0}, LV1/y;->b0()V

    .line 46
    .line 47
    .line 48
    if-nez p4, :cond_3

    .line 49
    .line 50
    iget-object p1, p0, LV1/y;->b:LX1/b;

    .line 51
    .line 52
    invoke-interface {p1}, LX1/b;->q()V

    .line 53
    .line 54
    .line 55
    :cond_3
    iget-object p1, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 56
    .line 57
    const/high16 p2, 0x3f800000    # 1.0f

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setRelativePivotY(F)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 68
    .line 69
    invoke-interface {p0}, LX1/b;->n()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method private static final Q(LV1/y;LM2/i;)Lh4/t;
    .locals 0

    .line 1
    invoke-direct {p0}, LV1/y;->m0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, LM2/i;->F()V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 8
    .line 9
    return-object p0
.end method

.method private final R(Ljava/lang/Float;)Ljava/lang/Runnable;
    .locals 1

    .line 1
    new-instance v0, LV1/w;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, LV1/w;-><init>(LV1/y;Ljava/lang/Float;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method static synthetic S(LV1/y;Ljava/lang/Float;ILjava/lang/Object;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1}, LV1/y;->R(Ljava/lang/Float;)Ljava/lang/Runnable;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private static final T(LV1/y;Ljava/lang/Float;)V
    .locals 13

    .line 1
    sget-object v0, LV1/y$a$a;->h:LV1/y$a$a;

    .line 2
    .line 3
    invoke-direct {p0, v0}, LV1/y;->l0(LV1/y$a$a;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 16
    .line 17
    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 21
    .line 22
    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 26
    .line 27
    const/high16 v3, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 33
    .line 34
    const v4, 0x3e99999a    # 0.3f

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setBackgroundScaleX(F)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setBackgroundScaleY(F)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 51
    .line 52
    const/high16 v3, 0x3f000000    # 0.5f

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setRelativePivotY(F)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v2, p0, LV1/y;->b:LX1/b;

    .line 58
    .line 59
    invoke-interface {v2}, LX1/b;->i()F

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    iget-object v2, p0, LV1/y;->b:LX1/b;

    .line 64
    .line 65
    invoke-interface {v2}, LX1/b;->y()F

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    iget-object v3, p0, LV1/y;->b:LX1/b;

    .line 70
    .line 71
    invoke-interface {v3}, LX1/b;->j()Ljava/lang/Float;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    if-eqz v3, :cond_3

    .line 76
    .line 77
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    new-instance v5, LV1/y$e;

    .line 82
    .line 83
    invoke-direct {v5, p0, v3}, LV1/y$e;-><init>(LV1/y;F)V

    .line 84
    .line 85
    .line 86
    iget-object v3, p0, LV1/y;->b:LX1/b;

    .line 87
    .line 88
    invoke-interface {v3}, LX1/b;->l()F

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    add-float/2addr v3, v4

    .line 93
    iget-object v6, p0, LV1/y;->b:LX1/b;

    .line 94
    .line 95
    invoke-interface {v6}, LX1/b;->s()LM2/i;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    if-nez v6, :cond_1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    iget-object v7, p0, LV1/y;->k:LM2/i$f;

    .line 103
    .line 104
    invoke-virtual {v6, v7}, LM2/i;->z(LM2/i$f;)V

    .line 105
    .line 106
    .line 107
    sget-object v7, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 108
    .line 109
    const-string v8, "TRANSLATION_Y"

    .line 110
    .line 111
    invoke-static {v7, v8}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    if-eqz p1, :cond_2

    .line 115
    .line 116
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    :cond_2
    move v9, v0

    .line 121
    const/16 v11, 0x8

    .line 122
    .line 123
    const/4 v12, 0x0

    .line 124
    const/4 v10, 0x0

    .line 125
    move v8, v3

    .line 126
    invoke-static/range {v6 .. v12}, LM2/i;->E(LM2/i;Landroidx/dynamicanimation/animation/g;FFLM2/i$f;ILjava/lang/Object;)LM2/i;

    .line 127
    .line 128
    .line 129
    new-instance v0, LV1/g;

    .line 130
    .line 131
    move-object v1, p0

    .line 132
    invoke-direct/range {v0 .. v5}, LV1/g;-><init>(LV1/y;FFFLV1/y$e;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v6, v0}, LM2/i;->i(LM2/i$g;)LM2/i;

    .line 136
    .line 137
    .line 138
    new-instance v0, LV1/h;

    .line 139
    .line 140
    invoke-direct {v0, p0}, LV1/h;-><init>(LV1/y;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v6, v0}, LM2/i;->h(LM2/i$c;)LM2/i;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v6}, LM2/i;->F()V

    .line 147
    .line 148
    .line 149
    :cond_3
    :goto_0
    return-void
.end method

.method private static final U(LV1/y;FFFLV1/y$e;Landroid/view/View;Landroid/util/ArrayMap;)V
    .locals 2

    .line 1
    const-string v0, "handle"

    .line 2
    .line 3
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "values"

    .line 7
    .line 8
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 12
    .line 13
    invoke-virtual {p6, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p6

    .line 17
    check-cast p6, LM2/i$a;

    .line 18
    .line 19
    if-eqz p6, :cond_5

    .line 20
    .line 21
    invoke-virtual {p6}, LM2/i$a;->a()F

    .line 22
    .line 23
    .line 24
    move-result p6

    .line 25
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    cmpl-float v0, p6, p1

    .line 31
    .line 32
    if-ltz v0, :cond_1

    .line 33
    .line 34
    div-float p0, p6, p1

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    int-to-float p1, p1

    .line 38
    sub-float/2addr p1, p0

    .line 39
    invoke-virtual {p5, p1}, Landroid/view/View;->setAlpha(F)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    cmpl-float v0, p6, p2

    .line 44
    .line 45
    const/high16 v1, 0x3f800000    # 1.0f

    .line 46
    .line 47
    if-ltz v0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    invoke-virtual {p5, v0}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    iget-object p5, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 54
    .line 55
    sub-float p3, p6, p3

    .line 56
    .line 57
    invoke-virtual {p5, p3}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 58
    .line 59
    .line 60
    iget-object p3, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 61
    .line 62
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    cmpg-float p3, p3, v1

    .line 67
    .line 68
    if-nez p3, :cond_2

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    sub-float p3, p6, p1

    .line 72
    .line 73
    sub-float/2addr p2, p1

    .line 74
    div-float/2addr p3, p2

    .line 75
    iget-object p1, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 76
    .line 77
    invoke-virtual {p1, p3}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 81
    .line 82
    const p2, 0x3f333333    # 0.7f

    .line 83
    .line 84
    .line 85
    mul-float/2addr p3, p2

    .line 86
    const p2, 0x3e99999a    # 0.3f

    .line 87
    .line 88
    .line 89
    add-float/2addr p3, p2

    .line 90
    invoke-virtual {p1, p3}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    const/high16 p2, 0x3f000000    # 0.5f

    .line 100
    .line 101
    cmpl-float p1, p1, p2

    .line 102
    .line 103
    if-lez p1, :cond_4

    .line 104
    .line 105
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 106
    .line 107
    invoke-interface {p0}, LX1/b;->n()V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_3
    iget-object p1, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 112
    .line 113
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 117
    .line 118
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 122
    .line 123
    sub-float p2, p6, p3

    .line 124
    .line 125
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 129
    .line 130
    invoke-interface {p0}, LX1/b;->n()V

    .line 131
    .line 132
    .line 133
    :cond_4
    :goto_0
    invoke-virtual {p4, p6}, LV1/y$e;->a(F)V

    .line 134
    .line 135
    .line 136
    :cond_5
    :goto_1
    return-void
.end method

.method private static final V(LV1/y;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 0

    .line 1
    const-string p3, "<unused var>"

    .line 2
    .line 3
    invoke-static {p1, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    if-nez p4, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, LV1/y;->h:LV1/y$a;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, LV1/y$a;->d()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 p2, 0x1

    .line 20
    if-ne p1, p2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-direct {p0}, LV1/y;->p0()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 27
    .line 28
    invoke-interface {p0}, LX1/b;->n()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :goto_0
    invoke-direct {p0}, LV1/y;->Z()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private final W()V
    .locals 3

    .line 1
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, LV1/y$a;->g()LV1/y$a$a;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget-object v2, LV1/y$a$a;->g:LV1/y$a$a;

    .line 11
    .line 12
    if-eq v1, v2, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    iget-object v1, p0, LV1/y;->g:LV1/y$d;

    .line 16
    .line 17
    invoke-virtual {v0}, LV1/y$a;->f()Ljava/lang/Runnable;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v1, v2}, LV1/y$d;->b(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, LV1/y;->g:LV1/y$d;

    .line 25
    .line 26
    invoke-virtual {v0}, LV1/y$a;->e()Ljava/lang/Runnable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {p0, v0}, LV1/y$d;->b(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private final X()V
    .locals 2

    .line 1
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, LV1/y$a;->c()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->A(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, LV1/y;->c:LW1/l;

    .line 16
    .line 17
    new-instance v1, LV1/q;

    .line 18
    .line 19
    invoke-direct {v1, p0}, LV1/q;-><init>(LV1/y;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, LW1/l;->m(Lu4/a;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private static final Y(LV1/y;)Lh4/t;
    .locals 0

    .line 1
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 2
    .line 3
    invoke-interface {p0}, LX1/b;->n()V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 7
    .line 8
    return-object p0
.end method

.method private final Z()V
    .locals 2

    .line 1
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, LV1/y$a;->e()Ljava/lang/Runnable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v1, p0, LV1/y;->g:LV1/y$d;

    .line 13
    .line 14
    invoke-interface {v1, v0}, LV1/y$d;->b(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, LV1/y;->b0()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 21
    .line 22
    const/high16 v1, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setRelativePivotY(F)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 28
    .line 29
    invoke-interface {p0}, LX1/b;->x()V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic a(LV1/y;)V
    .locals 0

    .line 1
    invoke-static {p0}, LV1/y;->N(LV1/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final a0(LM2/i;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LM2/i<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, LM2/i;->x()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, LM2/i;->k()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, LV1/y;->q0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final b0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 3
    .line 4
    iget-object p0, p0, LV1/y;->d:Lcom/android/launcher3/taskbar/bubbles/y;

    .line 5
    .line 6
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/bubbles/y;->a()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic c(LV1/y;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LV1/y;->T(LV1/y;Ljava/lang/Float;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final c0()V
    .locals 2

    .line 1
    sget-object v0, LV1/y$a$a;->j:LV1/y$a$a;

    .line 2
    .line 3
    invoke-direct {p0, v0}, LV1/y;->l0(LV1/y$a$a;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LV1/y;->c:LW1/l;

    .line 7
    .line 8
    new-instance v1, LV1/u;

    .line 9
    .line 10
    invoke-direct {v1, p0}, LV1/u;-><init>(LV1/y;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, LW1/l;->p(Lu4/a;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic d(LV1/y;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, LV1/y;->d0(LV1/y;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final d0(LV1/y;)Lh4/t;
    .locals 0

    .line 1
    invoke-direct {p0}, LV1/y;->m0()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, LV1/y;->b0()V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 8
    .line 9
    return-object p0
.end method

.method public static synthetic e(LV1/y;)V
    .locals 0

    .line 1
    invoke-static {p0}, LV1/y;->z(LV1/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final e0()V
    .locals 2

    .line 1
    iget-object v0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setExpanded(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, LV1/y;->e:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic f(FLV1/y;FFLandroid/view/View;Landroid/util/ArrayMap;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, LV1/y;->O(FLV1/y;FFLandroid/view/View;Landroid/util/ArrayMap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(LV1/y;)V
    .locals 0

    .line 1
    invoke-static {p0}, LV1/y;->F(LV1/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(LV1/y;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, LV1/y;->V(LV1/y;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final h0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, LV1/y$a;->g()LV1/y$a$a;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget-object v2, LV1/y$f;->a:[I

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    aget v1, v2, v1

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    if-eq v1, v2, :cond_4

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    if-eq v1, v2, :cond_3

    .line 23
    .line 24
    const/4 v2, 0x3

    .line 25
    if-eq v1, v2, :cond_2

    .line 26
    .line 27
    const/4 v2, 0x4

    .line 28
    if-ne v1, v2, :cond_1

    .line 29
    .line 30
    invoke-direct {p0, v0, p1, p2}, LV1/y;->t0(LV1/y$a;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    new-instance p0, Lh4/j;

    .line 35
    .line 36
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 37
    .line 38
    .line 39
    throw p0

    .line 40
    :cond_2
    invoke-direct {p0, v0, p1, p2}, LV1/y;->v0(LV1/y$a;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_3
    invoke-direct {p0, v0, p1, p2}, LV1/y;->s0(LV1/y$a;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V

    .line 45
    .line 46
    .line 47
    :cond_4
    :goto_0
    return-void
.end method

.method public static synthetic i(LV1/y;LM2/i;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LV1/y;->Q(LV1/y;LM2/i;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic j(LM2/i;LV1/y;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LV1/y;->H(LM2/i;LV1/y;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k(LV1/y;FFFLV1/y$e;Landroid/view/View;Landroid/util/ArrayMap;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p6}, LV1/y;->U(LV1/y;FFFLV1/y$e;Landroid/view/View;Landroid/util/ArrayMap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(LV1/y;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LV1/y;->D(LV1/y;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final l0(LV1/y$a$a;)V
    .locals 8

    .line 1
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/16 v6, 0xf

    .line 7
    .line 8
    const/4 v7, 0x0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    const/4 v4, 0x0

    .line 13
    move-object v5, p1

    .line 14
    invoke-static/range {v0 .. v7}, LV1/y$a;->b(LV1/y$a;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;ILjava/lang/Object;)LV1/y$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, LV1/y;->h:LV1/y$a;

    .line 19
    .line 20
    sget-object p1, LV1/y$a$a;->h:LV1/y$a$a;

    .line 21
    .line 22
    if-ne v5, p1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, LV1/y;->d:Lcom/android/launcher3/taskbar/bubbles/y;

    .line 25
    .line 26
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/bubbles/y;->a()V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic m(LV1/y;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, LV1/y;->P(LV1/y;Landroid/view/View;Landroidx/dynamicanimation/animation/g;ZZFFZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final m0()V
    .locals 2

    .line 1
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, LV1/y$a;->c()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->A(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 16
    .line 17
    invoke-interface {p0}, LX1/b;->n()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic n(LV1/y;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, LV1/y;->K(LV1/y;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroidx/dynamicanimation/animation/g;ZZFFZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(LV1/y;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, LV1/y;->u0(LV1/y;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final o0()V
    .locals 2

    .line 1
    iget-object v0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setRelativePivotY(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic p(LV1/y;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroidx/dynamicanimation/animation/g;ZZFFZ)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, LV1/y;->G(LV1/y;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroidx/dynamicanimation/animation/g;ZZFFZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final p0()V
    .locals 6

    .line 1
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, LV1/y$a;->c()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v0, v1

    .line 12
    :goto_0
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    move-object v2, v1

    .line 20
    :goto_1
    instance-of v3, v2, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 21
    .line 22
    if-eqz v3, :cond_2

    .line 23
    .line 24
    check-cast v2, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 25
    .line 26
    goto :goto_2

    .line 27
    :cond_2
    move-object v2, v1

    .line 28
    :goto_2
    if-eqz v2, :cond_3

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/bubbles/b;->f()LW1/m;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    :cond_3
    if-eqz v1, :cond_4

    .line 35
    .line 36
    iget-object v2, p0, LV1/y;->c:LW1/l;

    .line 37
    .line 38
    new-instance v3, LW1/m;

    .line 39
    .line 40
    invoke-virtual {v1}, LW1/m;->a()Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v1}, LW1/m;->c()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-virtual {v1}, LW1/m;->b()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-direct {v3, v4, v5, v1}, LW1/m;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    new-instance v1, LV1/c;

    .line 56
    .line 57
    invoke-direct {v1, v0}, LV1/c;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 58
    .line 59
    .line 60
    new-instance v0, LV1/n;

    .line 61
    .line 62
    invoke-direct {v0, p0}, LV1/n;-><init>(LV1/y;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, v3, v1, v0}, LW1/l;->y(LW1/m;Lu4/a;Lu4/a;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_4
    sget-object v0, LV1/y$a$a;->i:LV1/y$a$a;

    .line 70
    .line 71
    invoke-direct {p0, v0}, LV1/y;->l0(LV1/y$a$a;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public static synthetic q()V
    .locals 0

    .line 1
    invoke-static {}, LV1/y;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final q0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)Lh4/t;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->z()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 5
    .line 6
    return-object p0
.end method

.method public static synthetic r(LV1/y;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, LV1/y;->r0(LV1/y;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final r0(LV1/y;)Lh4/t;
    .locals 1

    .line 1
    sget-object v0, LV1/y$a$a;->i:LV1/y$a$a;

    .line 2
    .line 3
    invoke-direct {p0, v0}, LV1/y;->l0(LV1/y$a$a;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 7
    .line 8
    invoke-interface {p0}, LX1/b;->n()V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 12
    .line 13
    return-object p0
.end method

.method public static synthetic s(LV1/y$e;LV1/y;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/util/ArrayMap;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, LV1/y;->L(LV1/y$e;LV1/y;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/util/ArrayMap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final s0(LV1/y$a;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V
    .locals 8

    .line 1
    const/16 v6, 0x16

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    const/4 v5, 0x0

    .line 7
    move-object v0, p1

    .line 8
    move-object v1, p2

    .line 9
    move v4, p3

    .line 10
    invoke-static/range {v0 .. v7}, LV1/y$a;->b(LV1/y$a;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;ILjava/lang/Object;)LV1/y$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, LV1/y;->h:LV1/y$a;

    .line 15
    .line 16
    iget-object p1, p0, LV1/y;->c:LW1/l;

    .line 17
    .line 18
    invoke-virtual {p1}, LW1/l;->u()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 25
    .line 26
    invoke-interface {p0}, LX1/b;->c()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    xor-int/lit8 p0, p0, 0x1

    .line 31
    .line 32
    invoke-virtual {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->D(Z)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    instance-of p2, p1, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 41
    .line 42
    const/4 p3, 0x0

    .line 43
    if-eqz p2, :cond_1

    .line 44
    .line 45
    check-cast p1, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    move-object p1, p3

    .line 49
    :goto_0
    if-eqz p1, :cond_2

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->f()LW1/m;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    :cond_2
    if-eqz p3, :cond_3

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->z()V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, LV1/y;->c:LW1/l;

    .line 61
    .line 62
    invoke-virtual {p0, p3}, LW1/l;->I(LW1/m;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    invoke-direct {p0}, LV1/y;->X()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static synthetic t(LV1/y;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, LV1/y;->w0(LV1/y;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final t0(LV1/y$a;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V
    .locals 10

    .line 1
    invoke-virtual {p1}, LV1/y$a;->c()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->A(Z)V

    .line 7
    .line 8
    .line 9
    const/16 v8, 0x16

    .line 10
    .line 11
    const/4 v9, 0x0

    .line 12
    const/4 v4, 0x0

    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v7, 0x0

    .line 15
    move-object v2, p1

    .line 16
    move-object v3, p2

    .line 17
    move v6, p3

    .line 18
    invoke-static/range {v2 .. v9}, LV1/y$a;->b(LV1/y$a;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;ILjava/lang/Object;)LV1/y$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, LV1/y;->h:LV1/y$a;

    .line 23
    .line 24
    invoke-virtual {v2}, LV1/y$a;->e()Ljava/lang/Runnable;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p2, p0, LV1/y;->g:LV1/y$d;

    .line 29
    .line 30
    const-wide/16 v0, 0xbb8

    .line 31
    .line 32
    invoke-interface {p2, v0, v1, p1}, LV1/y$d;->a(JLjava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    instance-of p2, p1, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 40
    .line 41
    const/4 p3, 0x0

    .line 42
    if-eqz p2, :cond_0

    .line 43
    .line 44
    check-cast p1, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    move-object p1, p3

    .line 48
    :goto_0
    if-eqz p1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->f()LW1/m;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    :cond_1
    iget-object p1, p0, LV1/y;->c:LW1/l;

    .line 55
    .line 56
    invoke-virtual {p1}, LW1/l;->u()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    if-eqz p3, :cond_2

    .line 63
    .line 64
    sget-object p1, LV1/y$a$a;->h:LV1/y$a$a;

    .line 65
    .line 66
    invoke-direct {p0, p1}, LV1/y;->l0(LV1/y$a$a;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->z()V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, LV1/y;->c:LW1/l;

    .line 73
    .line 74
    new-instance p2, LV1/v;

    .line 75
    .line 76
    invoke-direct {p2, p0}, LV1/v;-><init>(LV1/y;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, p3, p2}, LW1/l;->G(LW1/m;Lu4/a;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    invoke-direct {p0}, LV1/y;->X()V

    .line 84
    .line 85
    .line 86
    sget-object p1, LV1/y$a$a;->i:LV1/y$a$a;

    .line 87
    .line 88
    invoke-direct {p0, p1}, LV1/y;->l0(LV1/y$a$a;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_3
    iget-object p1, p0, LV1/y;->b:LX1/b;

    .line 93
    .line 94
    invoke-interface {p1}, LX1/b;->s()LM2/i;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    invoke-virtual {p1}, LM2/i;->x()Z

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    if-eqz p2, :cond_4

    .line 105
    .line 106
    const/4 p2, 0x1

    .line 107
    iput-boolean p2, p0, LV1/y;->j:Z

    .line 108
    .line 109
    invoke-virtual {p1}, LM2/i;->k()V

    .line 110
    .line 111
    .line 112
    :cond_4
    return-void
.end method

.method public static synthetic u(LV1/y;)V
    .locals 0

    .line 1
    invoke-static {p0}, LV1/y;->J(LV1/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final u0(LV1/y;)Lh4/t;
    .locals 1

    .line 1
    sget-object v0, LV1/y$a$a;->i:LV1/y$a$a;

    .line 2
    .line 3
    invoke-direct {p0, v0}, LV1/y;->l0(LV1/y$a$a;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 7
    .line 8
    invoke-interface {p0}, LX1/b;->n()V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 12
    .line 13
    return-object p0
.end method

.method public static synthetic v(LV1/y;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, LV1/y;->Y(LV1/y;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final v0(LV1/y$a;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V
    .locals 10

    .line 1
    invoke-virtual {p1}, LV1/y$a;->c()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->A(Z)V

    .line 7
    .line 8
    .line 9
    const/16 v8, 0x16

    .line 10
    .line 11
    const/4 v9, 0x0

    .line 12
    const/4 v4, 0x0

    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v7, 0x0

    .line 15
    move-object v2, p1

    .line 16
    move-object v3, p2

    .line 17
    move v6, p3

    .line 18
    invoke-static/range {v2 .. v9}, LV1/y$a;->b(LV1/y$a;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;ILjava/lang/Object;)LV1/y$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, LV1/y;->h:LV1/y$a;

    .line 23
    .line 24
    invoke-virtual {v2}, LV1/y$a;->e()Ljava/lang/Runnable;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p2, p0, LV1/y;->g:LV1/y$d;

    .line 29
    .line 30
    invoke-interface {p2, p1}, LV1/y$d;->b(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, LV1/y;->g:LV1/y$d;

    .line 34
    .line 35
    const-wide/16 v0, 0xbb8

    .line 36
    .line 37
    invoke-interface {p2, v0, v1, p1}, LV1/y$d;->a(JLjava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    instance-of p2, p1, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 45
    .line 46
    const/4 p3, 0x0

    .line 47
    if-eqz p2, :cond_0

    .line 48
    .line 49
    check-cast p1, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move-object p1, p3

    .line 53
    :goto_0
    if-eqz p1, :cond_1

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->f()LW1/m;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    :cond_1
    if-eqz p3, :cond_2

    .line 60
    .line 61
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->z()V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, LV1/y;->c:LW1/l;

    .line 65
    .line 66
    new-instance p2, LV1/d;

    .line 67
    .line 68
    invoke-direct {p2, p0}, LV1/d;-><init>(LV1/y;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p3, p2}, LW1/l;->D(LW1/m;Lu4/a;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    invoke-direct {p0}, LV1/y;->X()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static final synthetic w(LV1/y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LV1/y;->e0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final w0(LV1/y;)Lh4/t;
    .locals 0

    .line 1
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 2
    .line 3
    invoke-interface {p0}, LX1/b;->n()V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 7
    .line 8
    return-object p0
.end method

.method public static final synthetic x(LV1/y;)LV1/y$a;
    .locals 0

    .line 1
    iget-object p0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    return-object p0
.end method

.method private final x0(Ly/s;J)Ly/s;
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, Ly/s;->S(J)Ly/s;

    .line 2
    .line 3
    .line 4
    return-object p1
.end method

.method private final y0(Ly/s;Lu4/a;)Ly/s;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ly/s;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)",
            "Ly/s;"
        }
    .end annotation

    .line 1
    new-instance p0, LV1/y$g;

    .line 2
    .line 3
    invoke-direct {p0, p2}, LV1/y$g;-><init>(Lu4/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Ly/d;->b(Ly/d$a;)V

    .line 7
    .line 8
    .line 9
    return-object p1
.end method

.method private static final z(LV1/y;)V
    .locals 1

    .line 1
    invoke-direct {p0}, LV1/y;->c0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LV1/y;->b:LX1/b;

    .line 5
    .line 6
    invoke-interface {v0}, LX1/b;->x()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, LV1/y;->b:LX1/b;

    .line 10
    .line 11
    invoke-interface {p0}, LX1/b;->n()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final A(Lcom/android/launcher3/taskbar/bubbles/b;Z)V
    .locals 8

    .line 1
    const-string v0, "b"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, LV1/y;->k0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {p0, p1, p2}, LV1/y;->h0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-direct {p0}, LV1/y;->W()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget-object p1, LM2/i;->n:LM2/i$b;

    .line 28
    .line 29
    invoke-virtual {p1, v1}, LM2/i$b;->a(Ljava/lang/Object;)LM2/i;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, LM2/i;->x()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p1}, LM2/i;->k()V

    .line 40
    .line 41
    .line 42
    :cond_1
    const/4 p1, 0x1

    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-static {p0, v0, p1, v0}, LV1/y;->S(LV1/y;Ljava/lang/Float;ILjava/lang/Object;)Ljava/lang/Runnable;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    if-eqz p2, :cond_2

    .line 49
    .line 50
    new-instance p1, LV1/r;

    .line 51
    .line 52
    invoke-direct {p1}, LV1/r;-><init>()V

    .line 53
    .line 54
    .line 55
    :goto_0
    move-object v3, p1

    .line 56
    goto :goto_1

    .line 57
    :cond_2
    invoke-direct {p0}, LV1/y;->M()Ljava/lang/Runnable;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    goto :goto_0

    .line 62
    :goto_1
    new-instance v0, LV1/y$a;

    .line 63
    .line 64
    const/16 v6, 0x10

    .line 65
    .line 66
    const/4 v7, 0x0

    .line 67
    const/4 v5, 0x0

    .line 68
    move v4, p2

    .line 69
    invoke-direct/range {v0 .. v7}, LV1/y$a;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;ILkotlin/jvm/internal/j;)V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 73
    .line 74
    iget-object p1, p0, LV1/y;->g:LV1/y$d;

    .line 75
    .line 76
    invoke-interface {p1, v2}, LV1/y$d;->c(Ljava/lang/Runnable;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, LV1/y;->g:LV1/y$d;

    .line 80
    .line 81
    const-wide/16 p1, 0xbb8

    .line 82
    .line 83
    invoke-interface {p0, p1, p2, v3}, LV1/y$d;->a(JLjava/lang/Runnable;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final C(Lcom/android/launcher3/taskbar/bubbles/b;ZZZ)V
    .locals 9

    .line 1
    const-string v0, "b"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    sget-object p1, LM2/i;->n:LM2/i$b;

    .line 11
    .line 12
    invoke-virtual {p1, v2}, LM2/i$b;->a(Ljava/lang/Object;)LM2/i;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, LM2/i;->x()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, LM2/i;->k()V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-direct {p0}, LV1/y;->I()Ljava/lang/Runnable;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    if-nez p3, :cond_1

    .line 32
    .line 33
    if-nez p4, :cond_1

    .line 34
    .line 35
    invoke-direct {p0}, LV1/y;->M()Ljava/lang/Runnable;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    :goto_0
    move-object v4, p1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    new-instance p1, LV1/t;

    .line 42
    .line 43
    invoke-direct {p1, p0, p4}, LV1/t;-><init>(LV1/y;Z)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :goto_1
    new-instance v1, LV1/y$a;

    .line 48
    .line 49
    const/16 v7, 0x10

    .line 50
    .line 51
    const/4 v8, 0x0

    .line 52
    const/4 v6, 0x0

    .line 53
    move v5, p3

    .line 54
    invoke-direct/range {v1 .. v8}, LV1/y$a;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;ILkotlin/jvm/internal/j;)V

    .line 55
    .line 56
    .line 57
    iput-object v1, p0, LV1/y;->h:LV1/y$a;

    .line 58
    .line 59
    iget-object p1, p0, LV1/y;->g:LV1/y$d;

    .line 60
    .line 61
    invoke-interface {p1, v3}, LV1/y$d;->c(Ljava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, LV1/y;->g:LV1/y$d;

    .line 65
    .line 66
    const-wide/16 p1, 0xbb8

    .line 67
    .line 68
    invoke-interface {p0, p1, p2, v4}, LV1/y$d;->a(JLjava/lang/Runnable;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final f0()V
    .locals 8

    .line 1
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/16 v6, 0x17

    .line 7
    .line 8
    const/4 v7, 0x0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    const/4 v4, 0x1

    .line 13
    const/4 v5, 0x0

    .line 14
    invoke-static/range {v0 .. v7}, LV1/y$a;->b(LV1/y$a;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;ILjava/lang/Object;)LV1/y$a;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, LV1/y;->h:LV1/y$a;

    .line 19
    .line 20
    invoke-virtual {v0}, LV1/y$a;->g()LV1/y$a$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v1, LV1/y$a$a;->i:LV1/y$a$a;

    .line 25
    .line 26
    if-ne v0, v1, :cond_1

    .line 27
    .line 28
    invoke-direct {p0}, LV1/y;->X()V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, LV1/y;->e0()V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, LV1/y;->Z()V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method

.method public final g0()Z
    .locals 0

    .line 1
    iget-object p0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final i0()V
    .locals 2

    .line 1
    invoke-direct {p0}, LV1/y;->X()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, LV1/y$a;->e()Ljava/lang/Runnable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v1, p0, LV1/y;->g:LV1/y$d;

    .line 16
    .line 17
    invoke-interface {v1, v0}, LV1/y$d;->b(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 22
    .line 23
    iget-object v0, p0, LV1/y;->b:LX1/b;

    .line 24
    .line 25
    invoke-interface {v0}, LX1/b;->s()LM2/i;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-direct {p0, v0}, LV1/y;->a0(LM2/i;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, LV1/y;->o0()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, LV1/y;->b:LX1/b;

    .line 36
    .line 37
    iget-object p0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-interface {v0, v1, p0}, LX1/b;->e(ZF)V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method

.method public final j0()V
    .locals 2

    .line 1
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, LV1/y$a;->e()Ljava/lang/Runnable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, LV1/y;->g:LV1/y$d;

    .line 12
    .line 13
    invoke-interface {v1, v0}, LV1/y$d;->b(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object v0, LM2/i;->n:LM2/i$b;

    .line 17
    .line 18
    iget-object v1, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, LM2/i$b;->a(Ljava/lang/Object;)LM2/i;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-direct {p0, v0}, LV1/y;->a0(LM2/i;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, LV1/y;->b:LX1/b;

    .line 28
    .line 29
    invoke-interface {v0}, LX1/b;->s()LM2/i;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-direct {p0, v0}, LV1/y;->a0(LM2/i;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, LV1/y;->X()V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, LV1/y;->o0()V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0}, LV1/y;->b0()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final k0()Z
    .locals 2

    .line 1
    iget-object p0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p0}, LV1/y$a;->g()LV1/y$a$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v1, LV1/y$a$a;->g:LV1/y$a$a;

    .line 12
    .line 13
    if-eq p0, v1, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    return v0
.end method

.method public final n0()V
    .locals 2

    .line 1
    iget-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, LV1/y$a;->e()Ljava/lang/Runnable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, LV1/y;->g:LV1/y$d;

    .line 12
    .line 13
    invoke-interface {v1, v0}, LV1/y$d;->b(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-direct {p0}, LV1/y;->X()V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, LV1/y;->b0()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, LV1/y;->b:LX1/b;

    .line 23
    .line 24
    invoke-interface {v0}, LX1/b;->s()LM2/i;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-direct {p0, v0}, LV1/y;->a0(LM2/i;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, LV1/y;->o0()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, LV1/y;->b:LX1/b;

    .line 35
    .line 36
    invoke-interface {v0}, LX1/b;->c()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget-object p0, p0, LV1/y;->a:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-interface {v0, v1, p0}, LX1/b;->e(ZF)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final y(Lcom/android/launcher3/taskbar/bubbles/b;Z)V
    .locals 8

    .line 1
    const-string v0, "b"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, LV1/y;->k0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {p0, p1, p2}, LV1/y;->h0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-direct {p0}, LV1/y;->W()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget-object p1, LM2/i;->n:LM2/i$b;

    .line 28
    .line 29
    invoke-virtual {p1, v1}, LM2/i$b;->a(Ljava/lang/Object;)LM2/i;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, LM2/i;->x()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p1}, LM2/i;->k()V

    .line 40
    .line 41
    .line 42
    :cond_1
    invoke-direct {p0}, LV1/y;->E()Ljava/lang/Runnable;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    new-instance v3, LV1/s;

    .line 47
    .line 48
    invoke-direct {v3, p0}, LV1/s;-><init>(LV1/y;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, LV1/y$a;

    .line 52
    .line 53
    const/16 v6, 0x10

    .line 54
    .line 55
    const/4 v7, 0x0

    .line 56
    const/4 v5, 0x0

    .line 57
    move v4, p2

    .line 58
    invoke-direct/range {v0 .. v7}, LV1/y$a;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;Ljava/lang/Runnable;ZLV1/y$a$a;ILkotlin/jvm/internal/j;)V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, LV1/y;->h:LV1/y$a;

    .line 62
    .line 63
    iget-object p1, p0, LV1/y;->g:LV1/y$d;

    .line 64
    .line 65
    invoke-interface {p1, v2}, LV1/y$d;->c(Ljava/lang/Runnable;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, LV1/y;->g:LV1/y$d;

    .line 69
    .line 70
    const-wide/16 p1, 0xbb8

    .line 71
    .line 72
    invoke-interface {p0, p1, p2, v3}, LV1/y$d;->a(JLjava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
