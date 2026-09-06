.class public abstract Lcom/android/launcher3/dragndrop/v;
.super Landroid/widget/FrameLayout;
.source "DragView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/dragndrop/v$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Landroid/widget/FrameLayout;"
    }
.end annotation


# static fields
.field public static volatile c0:Z


# instance fields
.field final A:Landroid/animation/ValueAnimator;

.field private B:Z

.field private C:Z

.field private D:Ljava/lang/Runnable;

.field private E:Ljava/lang/Runnable;

.field private F:I

.field private G:I

.field private H:I

.field private I:I

.field private J:Landroid/graphics/drawable/Drawable;

.field private K:Landroid/graphics/drawable/Drawable;

.field private L:Lcom/android/launcher3/dragndrop/v$d;

.field private M:Lcom/android/launcher3/dragndrop/v$d;

.field private N:Landroid/graphics/Path;

.field private O:Landroid/graphics/drawable/Drawable;

.field private P:Z

.field private Q:Z

.field public R:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;"
        }
    .end annotation
.end field

.field private S:Lcom/android/launcher3/iconarrange/g;

.field private T:Lcom/android/launcher3/iconarrange/h;

.field private U:F

.field private V:F

.field public W:Z

.field private a0:Z

.field private b0:F

.field private final g:Landroid/view/View;

.field private h:Landroid/view/ViewGroup$LayoutParams;

.field private i:Landroid/view/ViewGroup;

.field private j:I

.field private final k:I

.field private final l:I

.field private final m:I

.field protected final n:I

.field protected final o:I

.field private final p:F

.field private final q:F

.field protected final r:F

.field protected final s:[I

.field private final t:Lcom/android/launcher3/util/Y1;

.field private u:Z

.field private v:Landroid/graphics/Rect;

.field protected final w:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final x:Lcom/android/launcher3/views/BaseDragLayer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/views/BaseDragLayer<",
            "TT;>;"
        }
    .end annotation
.end field

.field private y:Z

.field final z:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/graphics/drawable/Drawable;IIFFF)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/graphics/drawable/Drawable;",
            "IIFFF)V"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p2}, Lcom/android/launcher3/dragndrop/v;->t(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)Landroid/widget/ImageView;

    move-result-object v2

    .line 2
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    move-object v0, p0

    move-object v1, p1

    move v5, p3

    move v6, p4

    move v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    .line 3
    invoke-direct/range {v0 .. v9}, Lcom/android/launcher3/dragndrop/v;-><init>(Landroid/content/Context;Landroid/view/View;IIIIFFF)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;IIIIFFF)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/view/View;",
            "IIIIFFF)V"
        }
    .end annotation

    .line 4
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/launcher3/dragndrop/v;->j:I

    const/4 v0, 0x2

    .line 6
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/android/launcher3/dragndrop/v;->s:[I

    .line 7
    new-instance v1, Lcom/android/launcher3/util/Y1;

    invoke-direct {v1}, Lcom/android/launcher3/util/Y1;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/dragndrop/v;->t:Lcom/android/launcher3/util/Y1;

    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lcom/android/launcher3/dragndrop/v;->v:Landroid/graphics/Rect;

    const/4 v1, 0x0

    .line 9
    iput-boolean v1, p0, Lcom/android/launcher3/dragndrop/v;->y:Z

    .line 10
    iput-boolean v1, p0, Lcom/android/launcher3/dragndrop/v;->P:Z

    .line 11
    iput-boolean v1, p0, Lcom/android/launcher3/dragndrop/v;->Q:Z

    .line 12
    iput-boolean v1, p0, Lcom/android/launcher3/dragndrop/v;->W:Z

    .line 13
    iput-boolean v1, p0, Lcom/android/launcher3/dragndrop/v;->a0:Z

    const/4 v2, 0x0

    .line 14
    iput v2, p0, Lcom/android/launcher3/dragndrop/v;->b0:F

    .line 15
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 16
    move-object v2, p1

    check-cast v2, Lcom/android/launcher3/views/k;

    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    move-result-object v2

    iput-object v2, p0, Lcom/android/launcher3/dragndrop/v;->x:Lcom/android/launcher3/views/BaseDragLayer;

    .line 17
    iput-object p2, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 18
    iput p3, p0, Lcom/android/launcher3/dragndrop/v;->k:I

    .line 19
    iput p4, p0, Lcom/android/launcher3/dragndrop/v;->l:I

    .line 20
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iput-object v2, p0, Lcom/android/launcher3/dragndrop/v;->h:Landroid/view/ViewGroup$LayoutParams;

    .line 21
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_0

    .line 22
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/android/launcher3/dragndrop/v;->i:Landroid/view/ViewGroup;

    .line 23
    invoke-virtual {v2, p2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    iput v2, p0, Lcom/android/launcher3/dragndrop/v;->j:I

    .line 24
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/v;->i:Landroid/view/ViewGroup;

    invoke-virtual {v2, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 25
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getScaleX()F

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v3

    if-nez v2, :cond_1

    invoke-virtual {p2}, Landroid/view/View;->getScaleY()F

    move-result v2

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_2

    .line 26
    :cond_1
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    .line 27
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    .line 28
    :cond_2
    iput p9, p0, Lcom/android/launcher3/dragndrop/v;->q:F

    .line 29
    iput p9, p0, Lcom/android/launcher3/dragndrop/v;->V:F

    .line 30
    iput p7, p0, Lcom/android/launcher3/dragndrop/v;->U:F

    .line 31
    instance-of p9, p1, Lcom/android/launcher3/C2;

    if-eqz p9, :cond_3

    .line 32
    move-object p9, p1

    check-cast p9, Lcom/android/launcher3/C2;

    invoke-virtual {p9}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    move-result-object p9

    invoke-virtual {p9}, Lcom/android/launcher3/G4;->q()Z

    move-result p9

    goto :goto_0

    :cond_3
    move p9, v1

    :goto_0
    if-nez p9, :cond_4

    .line 33
    new-instance p9, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p9, p3, p4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p2, p9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    invoke-virtual {p0, p7}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 35
    invoke-virtual {p0, p7}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 36
    :cond_4
    new-array p2, v0, [F

    fill-array-data p2, :array_0

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/dragndrop/v;->z:Landroid/animation/ValueAnimator;

    const-wide/16 v4, 0x96

    .line 37
    invoke-virtual {p2, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 38
    new-instance p9, Lcom/android/launcher3/dragndrop/t;

    invoke-direct {p9, p0, p7}, Lcom/android/launcher3/dragndrop/t;-><init>(Lcom/android/launcher3/dragndrop/v;F)V

    invoke-virtual {p2, p9}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 39
    new-instance p9, Lcom/android/launcher3/dragndrop/v$a;

    invoke-direct {p9, p0}, Lcom/android/launcher3/dragndrop/v$a;-><init>(Lcom/android/launcher3/dragndrop/v;)V

    invoke-virtual {p2, p9}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 40
    new-array p2, v0, [F

    fill-array-data p2, :array_1

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/dragndrop/v;->A:Landroid/animation/ValueAnimator;

    .line 41
    new-instance p9, Lcom/android/launcher3/dragndrop/v$b;

    invoke-direct {p9, p0}, Lcom/android/launcher3/dragndrop/v$b;-><init>(Lcom/android/launcher3/dragndrop/v;)V

    invoke-virtual {p2, p9}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 42
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2, v1, v1, p3, p4}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p0, p2}, Lcom/android/launcher3/dragndrop/v;->setDragRegion(Landroid/graphics/Rect;)V

    .line 43
    iput p5, p0, Lcom/android/launcher3/dragndrop/v;->n:I

    .line 44
    iput p6, p0, Lcom/android/launcher3/dragndrop/v;->o:I

    .line 45
    iput p7, p0, Lcom/android/launcher3/dragndrop/v;->p:F

    .line 46
    iput p8, p0, Lcom/android/launcher3/dragndrop/v;->r:F

    const/high16 p2, 0x40000000    # 2.0f

    .line 47
    invoke-static {p3, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p3

    invoke-static {p4, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-virtual {p0, p3, p2}, Landroid/widget/FrameLayout;->measure(II)V

    .line 48
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f070144

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/dragndrop/v;->m:I

    .line 49
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0702c0

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setElevation(F)V

    .line 50
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setWillNotDraw(Z)V

    .line 51
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    move-result-object p2

    iget-boolean p2, p2, Lcom/android/launcher3/r4;->Y:Z

    if-nez p2, :cond_5

    invoke-static {}, Lm1/a;->a()Z

    move-result p2

    if-eqz p2, :cond_6

    :cond_5
    const/4 v1, 0x1

    :cond_6
    iput-boolean v1, p0, Lcom/android/launcher3/dragndrop/v;->P:Z

    .line 52
    instance-of p2, p1, Lcom/android/launcher3/C2;

    if-eqz p2, :cond_7

    .line 53
    move-object p2, p1

    check-cast p2, Lcom/android/launcher3/C2;

    invoke-virtual {p2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 54
    :cond_7
    instance-of p2, p1, Lcom/android/launcher3/C2;

    if-eqz p2, :cond_8

    move-object p2, p1

    check-cast p2, Lcom/android/launcher3/C2;

    invoke-virtual {p2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/launcher3/G4;->q()Z

    move-result p2

    if-eqz p2, :cond_8

    .line 55
    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 56
    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 57
    new-instance p2, Lcom/android/launcher3/iconarrange/g;

    check-cast p1, Lcom/android/launcher3/C2;

    iget-object p3, p0, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    invoke-direct {p2, p1, p3}, Lcom/android/launcher3/iconarrange/g;-><init>(Lcom/android/launcher3/C2;Ljava/util/ArrayList;)V

    iput-object p2, p0, Lcom/android/launcher3/dragndrop/v;->S:Lcom/android/launcher3/iconarrange/g;

    .line 58
    new-instance p1, Lcom/android/launcher3/iconarrange/h;

    iget-object p2, p0, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Lcom/android/launcher3/iconarrange/h;-><init>(Ljava/util/ArrayList;)V

    iput-object p1, p0, Lcom/android/launcher3/dragndrop/v;->T:Lcom/android/launcher3/iconarrange/h;

    :cond_8
    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private synthetic A(Lcom/android/launcher3/model/data/y;)V
    .locals 12

    .line 1
    sget-object v0, Ln1/C;->g:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ln1/C;

    .line 12
    .line 13
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->k:I

    .line 14
    .line 15
    iget v2, p0, Lcom/android/launcher3/dragndrop/v;->l:I

    .line 16
    .line 17
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {v0}, Ln1/C;->m()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v3, p1, v1, v2, v0}, Lcom/android/launcher3/N5;->o(Landroid/content/Context;Lcom/android/launcher3/model/data/y;IIZ)Landroid/util/Pair;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 28
    .line 29
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 30
    .line 31
    .line 32
    move-result-object v8

    .line 33
    if-eqz v0, :cond_9

    .line 34
    .line 35
    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 36
    .line 37
    instance-of v4, v3, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 38
    .line 39
    if-eqz v4, :cond_9

    .line 40
    .line 41
    move-object v7, v3

    .line 42
    check-cast v7, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 45
    .line 46
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const v4, 0x7f070144

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    float-to-int v3, v3

    .line 58
    div-int/lit8 v3, v3, 0x2

    .line 59
    .line 60
    new-instance v4, Landroid/graphics/Rect;

    .line 61
    .line 62
    const/4 v5, 0x0

    .line 63
    invoke-direct {v4, v5, v5, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v4, v3, v3}, Landroid/graphics/Rect;->inset(II)V

    .line 67
    .line 68
    .line 69
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast v0, Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/v;->O:Landroid/graphics/drawable/Drawable;

    .line 74
    .line 75
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 76
    .line 77
    invoke-static {v0}, Lx1/O;->q1(Landroid/os/UserHandle;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_0

    .line 82
    .line 83
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->O:Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    invoke-static {v0, v4}, Ls1/o;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    invoke-virtual {v8}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget v0, v0, Lcom/android/launcher3/F1;->N0:I

    .line 94
    .line 95
    iget-object v6, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 96
    .line 97
    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    new-instance v9, Lcom/android/launcher3/N5$a;

    .line 102
    .line 103
    invoke-direct {v9, v0}, Lcom/android/launcher3/N5$a;-><init>(I)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 107
    .line 108
    invoke-virtual {v6, v9, v0}, Landroid/content/pm/PackageManager;->getUserBadgedIcon(Landroid/graphics/drawable/Drawable;Landroid/os/UserHandle;)Landroid/graphics/drawable/Drawable;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/v;->O:Landroid/graphics/drawable/Drawable;

    .line 113
    .line 114
    new-instance v0, Landroid/graphics/Rect;

    .line 115
    .line 116
    invoke-direct {v0, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 117
    .line 118
    .line 119
    iget-object v6, p0, Lcom/android/launcher3/dragndrop/v;->O:Landroid/graphics/drawable/Drawable;

    .line 120
    .line 121
    invoke-virtual {v6, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 122
    .line 123
    .line 124
    :goto_0
    const v0, 0x3f6b851f    # 0.92f

    .line 125
    .line 126
    .line 127
    invoke-static {v4, v0}, Lcom/android/launcher3/N5;->Z(Landroid/graphics/Rect;F)V

    .line 128
    .line 129
    .line 130
    new-instance v0, Landroid/graphics/Rect;

    .line 131
    .line 132
    invoke-direct {v0, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 133
    .line 134
    .line 135
    invoke-static {}, Lx1/O;->C3()Z

    .line 136
    .line 137
    .line 138
    move-result v6

    .line 139
    const/high16 v9, 0x3f800000    # 1.0f

    .line 140
    .line 141
    if-eqz v6, :cond_1

    .line 142
    .line 143
    move v6, v9

    .line 144
    goto :goto_1

    .line 145
    :cond_1
    const v6, 0x3f7ae148    # 0.98f

    .line 146
    .line 147
    .line 148
    :goto_1
    invoke-static {v0, v6}, Lcom/android/launcher3/N5;->Z(Landroid/graphics/Rect;F)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v7, v0}, Landroid/graphics/drawable/AdaptiveIconDrawable;->setBounds(Landroid/graphics/Rect;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v7}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getIconMask()Landroid/graphics/Path;

    .line 155
    .line 156
    .line 157
    move-result-object v6

    .line 158
    new-instance v0, Lcom/android/launcher3/dragndrop/v$d;

    .line 159
    .line 160
    int-to-float v10, v1

    .line 161
    invoke-static {}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getExtraInsetFraction()F

    .line 162
    .line 163
    .line 164
    move-result v11

    .line 165
    mul-float/2addr v10, v11

    .line 166
    invoke-direct {v0, p0, v10}, Lcom/android/launcher3/dragndrop/v$d;-><init>(Landroid/view/View;F)V

    .line 167
    .line 168
    .line 169
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/v;->L:Lcom/android/launcher3/dragndrop/v$d;

    .line 170
    .line 171
    new-instance v0, Lcom/android/launcher3/dragndrop/v$d;

    .line 172
    .line 173
    int-to-float v10, v2

    .line 174
    invoke-static {}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getExtraInsetFraction()F

    .line 175
    .line 176
    .line 177
    move-result v11

    .line 178
    mul-float/2addr v10, v11

    .line 179
    invoke-direct {v0, p0, v10}, Lcom/android/launcher3/dragndrop/v$d;-><init>(Landroid/view/View;F)V

    .line 180
    .line 181
    .line 182
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/v;->M:Lcom/android/launcher3/dragndrop/v$d;

    .line 183
    .line 184
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    neg-int v0, v0

    .line 189
    int-to-float v0, v0

    .line 190
    invoke-static {}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getExtraInsetFraction()F

    .line 191
    .line 192
    .line 193
    move-result v10

    .line 194
    mul-float/2addr v0, v10

    .line 195
    float-to-int v0, v0

    .line 196
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    .line 197
    .line 198
    .line 199
    move-result v10

    .line 200
    neg-int v10, v10

    .line 201
    int-to-float v10, v10

    .line 202
    invoke-static {}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getExtraInsetFraction()F

    .line 203
    .line 204
    .line 205
    move-result v11

    .line 206
    mul-float/2addr v10, v11

    .line 207
    float-to-int v10, v10

    .line 208
    invoke-virtual {v4, v0, v10}, Landroid/graphics/Rect;->inset(II)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v7}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 216
    .line 217
    if-nez v0, :cond_2

    .line 218
    .line 219
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 220
    .line 221
    invoke-direct {v0, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 222
    .line 223
    .line 224
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 225
    .line 226
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 227
    .line 228
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v7}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/v;->K:Landroid/graphics/drawable/Drawable;

    .line 236
    .line 237
    if-nez v0, :cond_3

    .line 238
    .line 239
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 240
    .line 241
    invoke-direct {v0, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 242
    .line 243
    .line 244
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/v;->K:Landroid/graphics/drawable/Drawable;

    .line 245
    .line 246
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->K:Landroid/graphics/drawable/Drawable;

    .line 247
    .line 248
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 249
    .line 250
    .line 251
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 252
    .line 253
    instance-of v0, v0, Landroid/graphics/drawable/ColorDrawable;

    .line 254
    .line 255
    if-nez v0, :cond_6

    .line 256
    .line 257
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->K:Landroid/graphics/drawable/Drawable;

    .line 258
    .line 259
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    iget-object v10, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 264
    .line 265
    invoke-virtual {v10}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 266
    .line 267
    .line 268
    move-result v10

    .line 269
    if-eq v0, v10, :cond_6

    .line 270
    .line 271
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 272
    .line 273
    const/4 v10, 0x6

    .line 274
    if-eq v0, v10, :cond_6

    .line 275
    .line 276
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->K:Landroid/graphics/drawable/Drawable;

    .line 277
    .line 278
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 279
    .line 280
    .line 281
    move-result v0

    .line 282
    int-to-float v0, v0

    .line 283
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 284
    .line 285
    .line 286
    move-result-object v10

    .line 287
    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 288
    .line 289
    .line 290
    move-result-object v10

    .line 291
    invoke-virtual {v10}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 292
    .line 293
    .line 294
    move-result-object v10

    .line 295
    iget v10, v10, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 296
    .line 297
    invoke-static {v0, v10}, Lcom/android/launcher3/N5;->j(FI)F

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    iget-object v10, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 302
    .line 303
    invoke-virtual {v10}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 304
    .line 305
    .line 306
    move-result v10

    .line 307
    int-to-float v10, v10

    .line 308
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 309
    .line 310
    .line 311
    move-result-object v11

    .line 312
    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 313
    .line 314
    .line 315
    move-result-object v11

    .line 316
    invoke-virtual {v11}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 317
    .line 318
    .line 319
    move-result-object v11

    .line 320
    iget v11, v11, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 321
    .line 322
    invoke-static {v10, v11}, Lcom/android/launcher3/N5;->j(FI)F

    .line 323
    .line 324
    .line 325
    move-result v10

    .line 326
    div-float/2addr v10, v0

    .line 327
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 328
    .line 329
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 330
    .line 331
    .line 332
    move-result v0

    .line 333
    int-to-float v0, v0

    .line 334
    mul-float/2addr v0, v9

    .line 335
    iget-object v9, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 336
    .line 337
    check-cast v9, Lcom/android/launcher3/views/k;

    .line 338
    .line 339
    invoke-interface {v9}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 340
    .line 341
    .line 342
    move-result-object v9

    .line 343
    iget v9, v9, Lcom/android/launcher3/h0;->B1:I

    .line 344
    .line 345
    int-to-float v9, v9

    .line 346
    div-float/2addr v0, v9

    .line 347
    mul-float/2addr v0, v10

    .line 348
    iget-object v9, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 349
    .line 350
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 351
    .line 352
    .line 353
    move-result v9

    .line 354
    iget-object v10, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 355
    .line 356
    invoke-virtual {v10}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 357
    .line 358
    .line 359
    move-result-object v10

    .line 360
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    .line 361
    .line 362
    .line 363
    move-result v10

    .line 364
    if-eq v9, v10, :cond_4

    .line 365
    .line 366
    const v0, 0x3fbd70a4    # 1.48f

    .line 367
    .line 368
    .line 369
    :cond_4
    iget-object v9, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 370
    .line 371
    check-cast v9, Lcom/android/launcher3/views/k;

    .line 372
    .line 373
    invoke-interface {v9}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 374
    .line 375
    .line 376
    move-result-object v9

    .line 377
    invoke-virtual {v9}, Lcom/android/launcher3/h0;->T0()Z

    .line 378
    .line 379
    .line 380
    move-result v9

    .line 381
    if-eqz v9, :cond_5

    .line 382
    .line 383
    const v0, 0x3ff5c28f    # 1.92f

    .line 384
    .line 385
    .line 386
    :cond_5
    new-instance v9, Ljava/lang/StringBuilder;

    .line 387
    .line 388
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 389
    .line 390
    .line 391
    const-string v10, "final scale is "

    .line 392
    .line 393
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    .line 395
    .line 396
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v9

    .line 403
    const-string v10, "DragView"

    .line 404
    .line 405
    invoke-static {v10, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    .line 407
    .line 408
    new-instance v9, Landroid/graphics/Rect;

    .line 409
    .line 410
    invoke-direct {v9, v5, v5, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 411
    .line 412
    .line 413
    invoke-virtual {v4, v3, v3}, Landroid/graphics/Rect;->inset(II)V

    .line 414
    .line 415
    .line 416
    invoke-static {v9, v0}, Lcom/android/launcher3/N5;->Z(Landroid/graphics/Rect;F)V

    .line 417
    .line 418
    .line 419
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 420
    .line 421
    invoke-virtual {v0, v9}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 422
    .line 423
    .line 424
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->K:Landroid/graphics/drawable/Drawable;

    .line 425
    .line 426
    invoke-virtual {v0, v9}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 427
    .line 428
    .line 429
    goto :goto_2

    .line 430
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 431
    .line 432
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 433
    .line 434
    .line 435
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->K:Landroid/graphics/drawable/Drawable;

    .line 436
    .line 437
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 438
    .line 439
    .line 440
    :goto_2
    iget-boolean v0, p1, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 441
    .line 442
    if-nez v0, :cond_7

    .line 443
    .line 444
    iget-boolean v0, p1, Lcom/android/launcher3/model/data/y;->isAppVdmcLimited:Z

    .line 445
    .line 446
    if-eqz v0, :cond_8

    .line 447
    .line 448
    :cond_7
    const/4 v0, 0x1

    .line 449
    iput-boolean v0, p0, Lcom/android/launcher3/dragndrop/v;->a0:Z

    .line 450
    .line 451
    :cond_8
    new-instance v0, Landroid/os/Handler;

    .line 452
    .line 453
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 454
    .line 455
    .line 456
    move-result-object v1

    .line 457
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 458
    .line 459
    .line 460
    new-instance v4, Lcom/android/launcher3/dragndrop/r;

    .line 461
    .line 462
    move-object v5, p0

    .line 463
    move-object v9, p1

    .line 464
    invoke-direct/range {v4 .. v9}, Lcom/android/launcher3/dragndrop/r;-><init>(Lcom/android/launcher3/dragndrop/v;Landroid/graphics/Path;Landroid/graphics/drawable/AdaptiveIconDrawable;Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/y;)V

    .line 465
    .line 466
    .line 467
    invoke-virtual {v0, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 468
    .line 469
    .line 470
    :cond_9
    return-void
.end method

.method public static E(Lcom/android/launcher3/views/k;)V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/android/launcher3/dragndrop/v;->c0:Z

    .line 2
    .line 3
    const-string v1, "DragView"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "drag notification, removeAllViews return"

    .line 8
    .line 9
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    if-nez p0, :cond_1

    .line 14
    .line 15
    const-string p0, "activity is null, removeAllViews return"

    .line 16
    .line 17
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    const-string p0, "dragLayer is null, removeAllViews return"

    .line 28
    .line 29
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/lit8 v0, v0, -0x1

    .line 38
    .line 39
    :goto_0
    if-ltz v0, :cond_4

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    instance-of v2, v1, Lcom/android/launcher3/dragndrop/v;

    .line 46
    .line 47
    if-eqz v2, :cond_3

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    :cond_3
    add-int/lit8 v0, v0, -0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_4
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/dragndrop/v;FLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/dragndrop/v;->x(FLandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/dragndrop/v;Landroid/graphics/Path;Landroid/graphics/drawable/AdaptiveIconDrawable;Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/dragndrop/v;->y(Landroid/graphics/Path;Landroid/graphics/drawable/AdaptiveIconDrawable;Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/dragndrop/v;Landroid/graphics/Path;Landroid/graphics/drawable/AdaptiveIconDrawable;Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/dragndrop/v;->z(Landroid/graphics/Path;Landroid/graphics/drawable/AdaptiveIconDrawable;Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/dragndrop/v;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/v;->A(Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/dragndrop/v;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->D:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/dragndrop/v;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->E:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/dragndrop/v;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/dragndrop/v;->H:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h(Lcom/android/launcher3/dragndrop/v;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/dragndrop/v;->I:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/android/launcher3/dragndrop/v;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/dragndrop/v;->B:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j(Lcom/android/launcher3/dragndrop/v;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/dragndrop/v;->C:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic k(Lcom/android/launcher3/dragndrop/v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/v;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private n()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/dragndrop/v;->F:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->n:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->H:I

    .line 7
    .line 8
    add-int/2addr v0, v1

    .line 9
    int-to-float v0, v0

    .line 10
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Lcom/android/launcher3/dragndrop/v;->G:I

    .line 14
    .line 15
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->o:I

    .line 16
    .line 17
    sub-int/2addr v0, v1

    .line 18
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->I:I

    .line 19
    .line 20
    add-int/2addr v0, v1

    .line 21
    int-to-float v0, v0

    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private s(II)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/android/launcher3/dragndrop/v;->F:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/dragndrop/v;->G:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->T:Lcom/android/launcher3/iconarrange/h;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/iconarrange/h;->b(II)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/v;->S:Lcom/android/launcher3/iconarrange/g;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Lcom/android/launcher3/iconarrange/g;->f(Lcom/android/launcher3/dragndrop/v;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private static t(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)Landroid/widget/ImageView;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v1, v1, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 28
    .line 29
    instance-of v0, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    new-instance v0, Lcom/android/launcher3/blur/a;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/blur/a;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/blur/a;->a()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p1}, Lcom/android/launcher3/blur/a;->setDragViewContentImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 43
    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_0
    new-instance v0, Landroid/widget/ImageView;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    return-object v0
.end method

.method private v()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 20
    .line 21
    check-cast p0, Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/menu/c;->j()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method private synthetic x(FLandroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->q:F

    .line 12
    .line 13
    invoke-static {v0, p1, v1}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 18
    .line 19
    .line 20
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->q:F

    .line 21
    .line 22
    invoke-static {v0, p1, v1}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isAttachedToWindow()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method private synthetic y(Landroid/graphics/Path;Landroid/graphics/drawable/AdaptiveIconDrawable;Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/v;->N:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->removeAllViewsInLayout()V

    .line 4
    .line 5
    .line 6
    instance-of p1, p2, Lcom/android/launcher3/dragndrop/E;

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    new-instance p1, Landroid/graphics/RectF;

    .line 11
    .line 12
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/v;->N:Landroid/graphics/Path;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p2, p1, v0}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    const/4 v0, 0x0

    .line 26
    cmpl-float p2, p2, v0

    .line 27
    .line 28
    if-lez p2, :cond_1

    .line 29
    .line 30
    invoke-virtual {p3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iget-object p3, p2, Lcom/android/launcher3/F1;->L0:[F

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    aget p3, p3, v0

    .line 38
    .line 39
    iget v0, p2, Lcom/android/launcher3/r4;->N:I

    .line 40
    .line 41
    mul-int/lit8 v0, v0, 0x2

    .line 42
    .line 43
    int-to-float v0, v0

    .line 44
    sub-float/2addr p3, v0

    .line 45
    const/high16 v0, 0x40000000    # 2.0f

    .line 46
    .line 47
    sub-float/2addr p3, v0

    .line 48
    invoke-static {p3}, Lcom/android/launcher3/N5;->i(F)I

    .line 49
    .line 50
    .line 51
    move-result p3

    .line 52
    int-to-float p3, p3

    .line 53
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 54
    .line 55
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 56
    .line 57
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 62
    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 66
    .line 67
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 68
    .line 69
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 76
    .line 77
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 78
    .line 79
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->z()Lcom/android/launcher3/n0$a;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    if-eqz v0, :cond_0

    .line 88
    .line 89
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 90
    .line 91
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 92
    .line 93
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->z()Lcom/android/launcher3/n0$a;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 102
    .line 103
    instance-of v1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 104
    .line 105
    if-eqz v1, :cond_0

    .line 106
    .line 107
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 108
    .line 109
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->n0()Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_0

    .line 114
    .line 115
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    int-to-float v0, v0

    .line 120
    const/high16 v1, 0x3f800000    # 1.0f

    .line 121
    .line 122
    mul-float/2addr v0, v1

    .line 123
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 124
    .line 125
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 126
    .line 127
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iget v1, v1, Lcom/android/launcher3/h0;->B1:I

    .line 132
    .line 133
    int-to-float v1, v1

    .line 134
    div-float/2addr v0, v1

    .line 135
    mul-float/2addr p3, v0

    .line 136
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    div-float/2addr p3, v0

    .line 141
    iput p3, p0, Lcom/android/launcher3/dragndrop/v;->b0:F

    .line 142
    .line 143
    invoke-static {}, Lx1/O;->C3()Z

    .line 144
    .line 145
    .line 146
    move-result p3

    .line 147
    if-eqz p3, :cond_1

    .line 148
    .line 149
    iget-object p3, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 150
    .line 151
    check-cast p3, Lcom/android/launcher3/views/k;

    .line 152
    .line 153
    invoke-interface {p3}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 154
    .line 155
    .line 156
    move-result-object p3

    .line 157
    if-eqz p3, :cond_1

    .line 158
    .line 159
    iget-object p3, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 160
    .line 161
    check-cast p3, Lcom/android/launcher3/views/k;

    .line 162
    .line 163
    invoke-interface {p3}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 164
    .line 165
    .line 166
    move-result-object p3

    .line 167
    invoke-virtual {p3}, Lcom/android/launcher3/dragndrop/j;->z()Lcom/android/launcher3/n0$a;

    .line 168
    .line 169
    .line 170
    move-result-object p3

    .line 171
    if-eqz p3, :cond_1

    .line 172
    .line 173
    iget-object p3, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 174
    .line 175
    check-cast p3, Lcom/android/launcher3/views/k;

    .line 176
    .line 177
    invoke-interface {p3}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 178
    .line 179
    .line 180
    move-result-object p3

    .line 181
    invoke-virtual {p3}, Lcom/android/launcher3/dragndrop/j;->z()Lcom/android/launcher3/n0$a;

    .line 182
    .line 183
    .line 184
    move-result-object p3

    .line 185
    iget-object p3, p3, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 186
    .line 187
    instance-of v0, p3, Landroid/view/View;

    .line 188
    .line 189
    if-eqz v0, :cond_1

    .line 190
    .line 191
    check-cast p3, Landroid/view/View;

    .line 192
    .line 193
    invoke-static {p3}, Lp1/f;->x(Landroid/view/View;)Z

    .line 194
    .line 195
    .line 196
    move-result p3

    .line 197
    if-eqz p3, :cond_1

    .line 198
    .line 199
    iget p3, p0, Lcom/android/launcher3/dragndrop/v;->k:I

    .line 200
    .line 201
    iget p2, p2, Lcom/android/launcher3/r4;->N:I

    .line 202
    .line 203
    mul-int/lit8 p2, p2, 0x2

    .line 204
    .line 205
    add-int/lit8 p2, p2, 0x2

    .line 206
    .line 207
    int-to-float p2, p2

    .line 208
    invoke-static {p2}, Lcom/android/launcher3/N5;->i(F)I

    .line 209
    .line 210
    .line 211
    move-result p2

    .line 212
    sub-int/2addr p3, p2

    .line 213
    int-to-float p2, p3

    .line 214
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    div-float/2addr p2, p1

    .line 219
    iput p2, p0, Lcom/android/launcher3/dragndrop/v;->b0:F

    .line 220
    .line 221
    :cond_1
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/y;->isDisabled()Z

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    if-eqz p1, :cond_2

    .line 226
    .line 227
    invoke-static {}, Ls1/o;->g()Landroid/graphics/ColorFilter;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 232
    .line 233
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 234
    .line 235
    .line 236
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/v;->K:Landroid/graphics/drawable/Drawable;

    .line 237
    .line 238
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 239
    .line 240
    .line 241
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/v;->O:Landroid/graphics/drawable/Drawable;

    .line 242
    .line 243
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 244
    .line 245
    .line 246
    :cond_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 247
    .line 248
    .line 249
    return-void
.end method

.method private synthetic z(Landroid/graphics/Path;Landroid/graphics/drawable/AdaptiveIconDrawable;Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/y;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->t:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/dragndrop/u;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move-object v3, p1

    .line 7
    move-object v4, p2

    .line 8
    move-object v5, p3

    .line 9
    move-object v6, p4

    .line 10
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/dragndrop/u;-><init>(Lcom/android/launcher3/dragndrop/v;Landroid/graphics/Path;Landroid/graphics/drawable/AdaptiveIconDrawable;Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/y;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public B(II)V
    .locals 3

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    if-lez p2, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/android/launcher3/dragndrop/v;->F:I

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->G:I

    .line 10
    .line 11
    if-lez v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/v;->N:Landroid/graphics/Path;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/v;->L:Lcom/android/launcher3/dragndrop/v$d;

    .line 18
    .line 19
    sub-int/2addr v0, p1

    .line 20
    int-to-float v0, v0

    .line 21
    invoke-virtual {v1, v0}, Lcom/android/launcher3/dragndrop/v$d;->d(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->M:Lcom/android/launcher3/dragndrop/v$d;

    .line 25
    .line 26
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->G:I

    .line 27
    .line 28
    sub-int/2addr v1, p2

    .line 29
    int-to-float v1, v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/android/launcher3/dragndrop/v$d;->d(F)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 34
    .line 35
    instance-of v1, v0, Lcom/android/launcher3/C2;

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    check-cast v0, Lcom/android/launcher3/C2;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->T:Lcom/android/launcher3/iconarrange/h;

    .line 52
    .line 53
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->F:I

    .line 54
    .line 55
    iget v2, p0, Lcom/android/launcher3/dragndrop/v;->G:I

    .line 56
    .line 57
    invoke-virtual {v0, p0, v1, v2}, Lcom/android/launcher3/iconarrange/h;->c(Lcom/android/launcher3/dragndrop/v;II)V

    .line 58
    .line 59
    .line 60
    iput p1, p0, Lcom/android/launcher3/dragndrop/v;->F:I

    .line 61
    .line 62
    iput p2, p0, Lcom/android/launcher3/dragndrop/v;->G:I

    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    iput p1, p0, Lcom/android/launcher3/dragndrop/v;->F:I

    .line 66
    .line 67
    iput p2, p0, Lcom/android/launcher3/dragndrop/v;->G:I

    .line 68
    .line 69
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/v;->n()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public C()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->t:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/Y1;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/android/launcher3/dragndrop/v;->c0:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/v;->o()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 8
    .line 9
    instance-of v1, v0, Lcom/android/launcher3/C2;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    check-cast v0, Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/android/launcher3/BubbleTextView;->getDragonDrawable()Lcom/android/launcher3/iconarrange/a;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    invoke-virtual {v2}, Lcom/android/launcher3/iconarrange/a;->m()V

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-virtual {v1}, Lcom/android/launcher3/BubbleTextView;->L()V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->x:Lcom/android/launcher3/views/BaseDragLayer;

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void
.end method

.method public F(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->x:Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 7
    .line 8
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->k:I

    .line 9
    .line 10
    iget v2, p0, Lcom/android/launcher3/dragndrop/v;->l:I

    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;-><init>(II)V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->d:Z

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/v;->getHasDragOffset()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 33
    .line 34
    const/4 v2, 0x4

    .line 35
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/dragndrop/v;->B(II)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 48
    .line 49
    instance-of v2, v0, Lcom/android/launcher3/C2;

    .line 50
    .line 51
    if-eqz v2, :cond_2

    .line 52
    .line 53
    check-cast v0, Lcom/android/launcher3/C2;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/dragndrop/v;->s(II)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    iget-boolean p1, p0, Lcom/android/launcher3/dragndrop/v;->W:Z

    .line 70
    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 74
    .line 75
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 76
    .line 77
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/j;->z()Lcom/android/launcher3/n0$a;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 86
    .line 87
    instance-of p2, p1, Landroid/view/View;

    .line 88
    .line 89
    if-eqz p2, :cond_3

    .line 90
    .line 91
    check-cast p1, Landroid/view/View;

    .line 92
    .line 93
    invoke-static {p1, v1}, Lx1/v;->u(Landroid/view/View;Z)Z

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    if-eqz p2, :cond_3

    .line 98
    .line 99
    iget p2, p0, Lcom/android/launcher3/dragndrop/v;->V:F

    .line 100
    .line 101
    invoke-static {p0, p1, p2}, Lx1/v;->i(Landroid/view/View;Landroid/view/View;F)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/v;->z:Landroid/animation/ValueAnimator;

    .line 106
    .line 107
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    new-instance p2, Lcom/android/launcher3/dragndrop/s;

    .line 111
    .line 112
    invoke-direct {p2, p1}, Lcom/android/launcher3/dragndrop/s;-><init>(Landroid/animation/ValueAnimator;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/dragndrop/v;->y:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/v;->v()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 14
    .line 15
    instance-of v1, v0, Lcom/android/launcher3/C2;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    check-cast v0, Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/c;->g(Landroid/graphics/Canvas;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 30
    .line 31
    instance-of v1, v0, Lcom/android/launcher3/C2;

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    check-cast v0, Lcom/android/launcher3/C2;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->S:Lcom/android/launcher3/iconarrange/g;

    .line 48
    .line 49
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->F:I

    .line 50
    .line 51
    iget v2, p0, Lcom/android/launcher3/dragndrop/v;->G:I

    .line 52
    .line 53
    invoke-virtual {v0, p1, v1, v2}, Lcom/android/launcher3/iconarrange/g;->d(Landroid/graphics/Canvas;II)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->T:Lcom/android/launcher3/iconarrange/h;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/android/launcher3/iconarrange/h;->a(Landroid/graphics/Canvas;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->N:Landroid/graphics/Path;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->b0:F

    .line 71
    .line 72
    const/4 v2, 0x0

    .line 73
    cmpl-float v2, v1, v2

    .line 74
    .line 75
    if-lez v2, :cond_2

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    int-to-float v2, v2

    .line 82
    const/high16 v3, 0x40000000    # 2.0f

    .line 83
    .line 84
    div-float/2addr v2, v3

    .line 85
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    int-to-float v4, v4

    .line 90
    div-float/2addr v4, v3

    .line 91
    invoke-virtual {p1, v1, v1, v2, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 92
    .line 93
    .line 94
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/v;->N:Landroid/graphics/Path;

    .line 95
    .line 96
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/v;->J:Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/v;->L:Lcom/android/launcher3/dragndrop/v$d;

    .line 105
    .line 106
    invoke-static {v1}, Lcom/android/launcher3/dragndrop/v$d;->a(Lcom/android/launcher3/dragndrop/v$d;)F

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/v;->M:Lcom/android/launcher3/dragndrop/v$d;

    .line 111
    .line 112
    invoke-static {v2}, Lcom/android/launcher3/dragndrop/v$d;->a(Lcom/android/launcher3/dragndrop/v$d;)F

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/v;->K:Landroid/graphics/drawable/Drawable;

    .line 120
    .line 121
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 122
    .line 123
    .line 124
    iget-boolean v1, p0, Lcom/android/launcher3/dragndrop/v;->a0:Z

    .line 125
    .line 126
    if-eqz v1, :cond_3

    .line 127
    .line 128
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    const v2, 0x7f060258

    .line 133
    .line 134
    .line 135
    invoke-static {v1, v2}, Lz/a;->c(Landroid/content/Context;I)I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 140
    .line 141
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 142
    .line 143
    .line 144
    :cond_3
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->O:Landroid/graphics/drawable/Drawable;

    .line 148
    .line 149
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 150
    .line 151
    .line 152
    :cond_4
    return-void
.end method

.method public getBlurSizeOutline()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/dragndrop/v;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getContentView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentViewParent()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->i:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDragRegion()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->v:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDragRegionHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->v:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getDragRegionTop()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->v:Landroid/graphics/Rect;

    .line 2
    .line 3
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 4
    .line 5
    return p0
.end method

.method public getDragRegionWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->v:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getEndScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/dragndrop/v;->q:F

    .line 2
    .line 3
    return p0
.end method

.method public getHasDragOffset()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/dragndrop/v;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIconConvergeAnim()Lcom/android/launcher3/iconarrange/g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->S:Lcom/android/launcher3/iconarrange/g;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInitScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/dragndrop/v;->U:F

    .line 2
    .line 3
    return p0
.end method

.method public getInitialScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/dragndrop/v;->p:F

    .line 2
    .line 3
    return p0
.end method

.method public getLastTouchX()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/dragndrop/v;->F:I

    .line 2
    .line 3
    return p0
.end method

.method public getLastTouchY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/dragndrop/v;->G:I

    .line 2
    .line 3
    return p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public l(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->A:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    :cond_1
    iput p1, p0, Lcom/android/launcher3/dragndrop/v;->H:I

    .line 19
    .line 20
    iput p2, p0, Lcom/android/launcher3/dragndrop/v;->I:I

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/v;->n()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->A:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    new-instance v1, Lcom/android/launcher3/dragndrop/v$c;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/dragndrop/v$c;-><init>(Lcom/android/launcher3/dragndrop/v;II)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->A:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public abstract m(IILjava/lang/Runnable;I)V
.end method

.method public o()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->z:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->z:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 2
    .line 3
    instance-of p2, p1, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/G4;->q()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/v;->x:Lcom/android/launcher3/views/BaseDragLayer;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/v;->x:Lcom/android/launcher3/views/BaseDragLayer;

    .line 26
    .line 27
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget p1, p0, Lcom/android/launcher3/dragndrop/v;->k:I

    .line 36
    .line 37
    const/high16 p2, 0x40000000    # 2.0f

    .line 38
    .line 39
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iget v0, p0, Lcom/android/launcher3/dragndrop/v;->l:I

    .line 44
    .line 45
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 50
    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    instance-of p0, p0, Lcom/android/launcher3/widget/T;

    .line 58
    .line 59
    return-void
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 2
    .line 3
    instance-of p0, p0, Landroid/appwidget/AppWidgetHostView;

    .line 4
    .line 5
    return p0
.end method

.method public q(Landroid/graphics/drawable/Drawable;I)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1, p1}, Lcom/android/launcher3/dragndrop/v;->t(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)Landroid/widget/ImageView;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 22
    .line 23
    .line 24
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->k:I

    .line 25
    .line 26
    const/high16 v2, 0x40000000    # 2.0f

    .line 27
    .line 28
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iget v3, p0, Lcom/android/launcher3/dragndrop/v;->l:I

    .line 33
    .line 34
    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {p1, v1, v2}, Landroid/widget/ImageView;->measure(II)V

    .line 39
    .line 40
    .line 41
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->k:I

    .line 42
    .line 43
    iget v2, p0, Lcom/android/launcher3/dragndrop/v;->l:I

    .line 44
    .line 45
    invoke-virtual {p1, v0, v0, v1, v2}, Landroid/widget/ImageView;->layout(IIII)V

    .line 46
    .line 47
    .line 48
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 49
    .line 50
    iget v2, p0, Lcom/android/launcher3/dragndrop/v;->k:I

    .line 51
    .line 52
    iget v3, p0, Lcom/android/launcher3/dragndrop/v;->l:I

    .line 53
    .line 54
    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1, v0, v1}, Landroid/widget/FrameLayout;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Z

    .line 58
    .line 59
    .line 60
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 61
    .line 62
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 63
    .line 64
    .line 65
    sget-object v2, Lcom/android/launcher3/G2;->k:Landroid/util/FloatProperty;

    .line 66
    .line 67
    const/4 v3, 0x2

    .line 68
    new-array v3, v3, [F

    .line 69
    .line 70
    fill-array-data v3, :array_0

    .line 71
    .line 72
    .line 73
    invoke-static {p1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {v1, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 81
    .line 82
    const/4 p1, 0x1

    .line 83
    new-array p1, p1, [F

    .line 84
    .line 85
    const/4 v3, 0x0

    .line 86
    aput v3, p1, v0

    .line 87
    .line 88
    invoke-static {p0, v2, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {v1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 93
    .line 94
    .line 95
    int-to-long p0, p2

    .line 96
    invoke-virtual {v1, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    sget-object p1, LJ0/h;->J:Landroid/view/animation/Interpolator;

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public r(Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->i:Landroid/view/ViewGroup;

    .line 6
    .line 7
    if-eqz v0, :cond_7

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/dragndrop/v;->j:I

    .line 10
    .line 11
    if-ltz v0, :cond_7

    .line 12
    .line 13
    new-instance v0, Landroid/graphics/Picture;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/Picture;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 19
    .line 20
    iget v2, p0, Lcom/android/launcher3/dragndrop/v;->k:I

    .line 21
    .line 22
    iget v3, p0, Lcom/android/launcher3/dragndrop/v;->l:I

    .line 23
    .line 24
    invoke-virtual {v0, v2, v3}, Landroid/graphics/Picture;->beginRecording(II)Landroid/graphics/Canvas;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/graphics/Picture;->endRecording()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 41
    .line 42
    instance-of v2, v1, Lcom/android/launcher3/widget/T;

    .line 43
    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    check-cast v1, Lcom/android/launcher3/widget/T;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/android/launcher3/widget/h;->w()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_0

    .line 53
    .line 54
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 55
    .line 56
    instance-of v1, v1, Lcom/android/launcher3/widget/group/f;

    .line 57
    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    :cond_0
    new-instance v1, Lcom/android/launcher3/blur/a;

    .line 61
    .line 62
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 63
    .line 64
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 65
    .line 66
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/blur/a;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    new-instance v2, Landroid/graphics/drawable/PictureDrawable;

    .line 70
    .line 71
    invoke-direct {v2, v0}, Landroid/graphics/drawable/PictureDrawable;-><init>(Landroid/graphics/Picture;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1, v2}, Lcom/android/launcher3/blur/a;->setDragViewContentImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    new-instance v1, Landroid/view/View;

    .line 79
    .line 80
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/v;->w:Landroid/content/Context;

    .line 81
    .line 82
    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 83
    .line 84
    .line 85
    new-instance v2, Landroid/graphics/drawable/PictureDrawable;

    .line 86
    .line 87
    invoke-direct {v2, v0}, Landroid/graphics/drawable/PictureDrawable;-><init>(Landroid/graphics/Picture;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 91
    .line 92
    .line 93
    :goto_0
    iget v0, p0, Lcom/android/launcher3/dragndrop/v;->k:I

    .line 94
    .line 95
    const/high16 v2, 0x40000000    # 2.0f

    .line 96
    .line 97
    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iget v3, p0, Lcom/android/launcher3/dragndrop/v;->l:I

    .line 102
    .line 103
    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    invoke-virtual {v1, v0, v2}, Landroid/view/View;->measure(II)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 117
    .line 118
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 123
    .line 124
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    iget-object v4, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 129
    .line 130
    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 135
    .line 136
    .line 137
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_3

    .line 142
    .line 143
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 144
    .line 145
    instance-of v2, v0, Lcom/android/launcher3/widget/T;

    .line 146
    .line 147
    if-eqz v2, :cond_3

    .line 148
    .line 149
    instance-of v2, v1, Lcom/android/launcher3/blur/a;

    .line 150
    .line 151
    if-eqz v2, :cond_3

    .line 152
    .line 153
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/android/launcher3/widget/T;->getBgBlurImageView()Lcom/android/launcher3/blur/a;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    if-eqz v0, :cond_3

    .line 160
    .line 161
    new-instance v2, Landroid/graphics/Rect;

    .line 162
    .line 163
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLeft()I

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    invoke-virtual {v0}, Landroid/widget/ImageView;->getTop()I

    .line 168
    .line 169
    .line 170
    move-result v4

    .line 171
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 172
    .line 173
    .line 174
    move-result v5

    .line 175
    invoke-virtual {v0}, Landroid/widget/ImageView;->getRight()I

    .line 176
    .line 177
    .line 178
    move-result v6

    .line 179
    sub-int/2addr v5, v6

    .line 180
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 181
    .line 182
    .line 183
    move-result v6

    .line 184
    invoke-virtual {v0}, Landroid/widget/ImageView;->getBottom()I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    sub-int/2addr v6, v0

    .line 189
    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 190
    .line 191
    .line 192
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 193
    .line 194
    instance-of v3, v0, Lcom/android/launcher3/widget/group/f;

    .line 195
    .line 196
    if-eqz v3, :cond_2

    .line 197
    .line 198
    check-cast v0, Lcom/android/launcher3/widget/group/f;

    .line 199
    .line 200
    invoke-interface {v0}, Lcom/android/launcher3/widget/group/f;->getGroupWidgetContainerOffsetRect()Landroid/graphics/Rect;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {v2, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 205
    .line 206
    .line 207
    :cond_2
    move-object v0, v1

    .line 208
    check-cast v0, Lcom/android/launcher3/blur/a;

    .line 209
    .line 210
    invoke-virtual {v0, v2}, Lcom/android/launcher3/blur/a;->setBlurBgOffsetRect(Landroid/graphics/Rect;)V

    .line 211
    .line 212
    .line 213
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 214
    .line 215
    instance-of v2, v0, Lcom/android/launcher3/widget/T;

    .line 216
    .line 217
    const/4 v3, 0x1

    .line 218
    if-eqz v2, :cond_4

    .line 219
    .line 220
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 221
    .line 222
    invoke-virtual {v0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-eqz v0, :cond_4

    .line 227
    .line 228
    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 229
    .line 230
    .line 231
    goto :goto_1

    .line 232
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 233
    .line 234
    invoke-virtual {v0}, Landroid/view/View;->getClipToOutline()Z

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 239
    .line 240
    .line 241
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 242
    .line 243
    invoke-virtual {v0}, Landroid/view/View;->getOutlineProvider()Landroid/view/ViewOutlineProvider;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 248
    .line 249
    .line 250
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 251
    .line 252
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 257
    .line 258
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    invoke-virtual {p0, v1, v0, v2, v3}, Landroid/widget/FrameLayout;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 263
    .line 264
    .line 265
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 266
    .line 267
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->removeViewInLayout(Landroid/view/View;)V

    .line 268
    .line 269
    .line 270
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 271
    .line 272
    const/4 v1, 0x4

    .line 273
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 274
    .line 275
    .line 276
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 277
    .line 278
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/v;->h:Landroid/view/ViewGroup$LayoutParams;

    .line 279
    .line 280
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 281
    .line 282
    .line 283
    if-eqz p1, :cond_6

    .line 284
    .line 285
    iget p1, p0, Lcom/android/launcher3/dragndrop/v;->j:I

    .line 286
    .line 287
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->i:Landroid/view/ViewGroup;

    .line 288
    .line 289
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    if-le p1, v0, :cond_5

    .line 294
    .line 295
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/v;->i:Landroid/view/ViewGroup;

    .line 296
    .line 297
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    iput p1, p0, Lcom/android/launcher3/dragndrop/v;->j:I

    .line 302
    .line 303
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/v;->i:Landroid/view/ViewGroup;

    .line 304
    .line 305
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 306
    .line 307
    iget v1, p0, Lcom/android/launcher3/dragndrop/v;->j:I

    .line 308
    .line 309
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 310
    .line 311
    .line 312
    :cond_6
    const/4 p1, 0x0

    .line 313
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/v;->i:Landroid/view/ViewGroup;

    .line 314
    .line 315
    const/4 p1, -0x1

    .line 316
    iput p1, p0, Lcom/android/launcher3/dragndrop/v;->j:I

    .line 317
    .line 318
    :cond_7
    return-void
.end method

.method public setDragRegion(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/v;->v:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-void
.end method

.method public setHasDragOffset(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/dragndrop/v;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public setItemInfo(Lcom/android/launcher3/model/data/y;)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/dragndrop/v;->P:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Lcom/android/launcher3/dragndrop/q;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/dragndrop/q;-><init>(Lcom/android/launcher3/dragndrop/v;Lcom/android/launcher3/model/data/y;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setOnScaleAnimEndCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/v;->D:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public setOnShiftAnimEndCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/v;->E:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method protected setOriginViewForTransformFolderIcon(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    instance-of v0, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->g:Landroid/view/View;

    .line 19
    .line 20
    instance-of v0, p0, Lcom/android/launcher3/blur/a;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    check-cast p0, Lcom/android/launcher3/blur/a;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/android/launcher3/blur/a;->setOriginViewInDragView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public u()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/dragndrop/v;->y:Z

    .line 2
    .line 3
    return p0
.end method

.method public w()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/dragndrop/v;->B:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v;->z:Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method
