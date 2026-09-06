.class public Lcom/android/launcher3/widget/picker/WidgetsFullSheet;
.super Lcom/android/launcher3/widget/o;
.source "WidgetsFullSheet.java"

# interfaces
.implements Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip$a;
.implements Lcom/android/launcher3/widget/picker/WidgetsRecyclerView$a;
.implements Lp2/a;
.implements Lcom/android/launcher3/widget/picker/T$b;
.implements Lcom/android/launcher3/menu/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;,
        Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;
    }
.end annotation


# instance fields
.field protected A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

.field protected B0:Landroid/widget/LinearLayout;

.field protected C0:Landroid/view/View;

.field protected D0:Landroid/view/View;

.field protected E0:Lcom/android/launcher3/widget/picker/search/b;

.field protected F0:Landroid/widget/TextView;

.field protected G0:Lcom/android/launcher3/views/RecyclerViewFastScroller;

.field protected H0:I

.field protected I0:Landroid/view/View;

.field private final b0:LD1/t;

.field private final c0:Lz1/L4;

.field private final d0:Landroid/os/UserHandle;

.field private final e0:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Lm2/g;",
            ">;"
        }
    .end annotation
.end field

.field private final f0:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Lm2/g;",
            ">;"
        }
    .end annotation
.end field

.field protected final g0:Z

.field protected h0:I

.field private i0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation
.end field

.field private j0:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/launcher3/widget/picker/d;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;>;"
        }
    .end annotation
.end field

.field protected k0:I

.field protected final l0:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;",
            ">;"
        }
    .end annotation
.end field

.field private final m0:Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;

.field private final n0:F

.field private final o0:Landroid/view/View$OnAttachStateChangeListener;

.field private final p0:I

.field private q0:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

.field private r0:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

.field s0:Lcom/android/launcher3/workprofile/a;

.field protected t0:Z

.field private u0:Z

.field protected v0:I

.field protected w0:Lcom/android/launcher3/h0;

.field protected x0:Landroid/widget/TextView;

.field protected y0:Landroid/widget/LinearLayout;

.field private z0:Lcom/android/launcher3/views/StickyHeaderLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/o;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    new-instance p2, Lz1/L4;

    invoke-direct {p2}, Lz1/L4;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->c0:Lz1/L4;

    .line 3
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object p3

    iput-object p3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->d0:Landroid/os/UserHandle;

    .line 4
    new-instance p3, Lcom/android/launcher3/widget/picker/t;

    invoke-direct {p3, p0}, Lcom/android/launcher3/widget/picker/t;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    iput-object p3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->e0:Ljava/util/function/Predicate;

    .line 5
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->i0:Ljava/util/List;

    .line 6
    new-instance p3, Ljava/util/HashMap;

    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->j0:Ljava/util/Map;

    const/4 p3, 0x0

    .line 7
    iput p3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->k0:I

    .line 8
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 9
    new-instance v1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;-><init>(Lcom/android/launcher3/widget/picker/A;)V

    iput-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->m0:Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;

    .line 10
    new-instance v1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$a;

    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$a;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    iput-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->o0:Landroid/view/View$OnAttachStateChangeListener;

    .line 11
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->n0:F

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    check-cast v1, Lcom/android/launcher3/v;

    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w0:Lcom/android/launcher3/h0;

    .line 13
    sget-object v1, LD1/t;->g:Lcom/android/launcher3/util/I;

    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LD1/t;

    iput-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->b0:LD1/t;

    .line 14
    invoke-virtual {v1}, LD1/t;->p()Ljava/util/List;

    move-result-object v1

    .line 15
    invoke-interface {v1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v2, Lcom/android/launcher3/widget/picker/u;

    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/picker/u;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    .line 16
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 17
    new-instance v2, Lcom/android/launcher3/widget/picker/v;

    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/picker/v;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    iput-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->f0:Ljava/util/function/Predicate;

    .line 18
    new-instance v2, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    invoke-direct {v2, p0, p3}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;I)V

    invoke-virtual {v0, p3, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 19
    new-instance v2, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;I)V

    invoke-virtual {v0, v3, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 20
    new-instance v2, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    const/4 v3, 0x2

    invoke-direct {v2, p0, v3}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;I)V

    invoke-virtual {v0, v3, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 21
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 22
    sget-object v2, LD1/t;->g:Lcom/android/launcher3/util/I;

    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, LD1/t;

    const-class v3, Landroid/os/UserManager;

    .line 23
    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/UserManager;

    .line 24
    invoke-virtual {p2, v2, p1}, Lz1/L4;->a(LD1/t;Landroid/os/UserManager;)V

    if-eqz v1, :cond_0

    const p1, 0x7f0700cb

    .line 25
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    .line 26
    :cond_0
    iput p3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->p0:I

    return-void
.end method

.method private synthetic A1(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->k0:I

    .line 6
    .line 7
    return-void
.end method

.method private synthetic B1(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic C1(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic D1(Landroid/os/UserHandle;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->b0:LD1/t;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/util/N2;->e()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private F1(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->u1(Landroid/view/MotionEvent;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getRecyclerView()Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move-object v0, v1

    .line 20
    :goto_0
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->r0:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->r0:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getX()F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v2, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getY()F

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    neg-float v3, v0

    .line 39
    neg-float v4, v2

    .line 40
    invoke-virtual {p1, v3, v4}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 41
    .line 42
    .line 43
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->r0:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 44
    .line 45
    invoke-virtual {v3, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-virtual {p1, v0, v2}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    const/4 v3, 0x0

    .line 54
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    const/4 v2, 0x1

    .line 59
    if-eq v0, v2, :cond_4

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    const/4 v0, 0x3

    .line 66
    if-ne p1, v0, :cond_3

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_3
    return v3

    .line 70
    :cond_4
    :goto_2
    iput-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->r0:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 71
    .line 72
    return v3
.end method

.method protected static G1(Landroid/view/View;)I
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 21
    .line 22
    add-int/2addr p0, v1

    .line 23
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 24
    .line 25
    add-int/2addr p0, v0

    .line 26
    return p0

    .line 27
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method private H1(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/h1;->getInsets()Landroid/graphics/Rect;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 13
    .line 14
    if-lez p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 22
    .line 23
    check-cast p1, Lcom/android/launcher3/v;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget p1, p1, Lcom/android/launcher3/h0;->y2:I

    .line 30
    .line 31
    int-to-long v0, p1

    .line 32
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/views/f;->k0(J)Lcom/android/launcher3/anim/q;

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const v1, 0x10c000e

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 53
    .line 54
    .line 55
    new-instance v0, Lcom/android/launcher3/widget/picker/r;

    .line 56
    .line 57
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/widget/picker/r;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;Landroid/animation/Animator;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 65
    .line 66
    .line 67
    new-instance p1, Lcom/android/launcher3/widget/picker/s;

    .line 68
    .line 69
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/picker/s;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method private I1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->g()V

    .line 13
    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->g()V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->g()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->z0:Lcom/android/launcher3/views/StickyHeaderLayout;

    .line 48
    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0, v1}, Lcom/android/launcher3/views/StickyHeaderLayout;->i(Z)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method private K1(Landroid/util/SparseArray;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->contains(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Lcom/android/launcher3/widget/picker/T;->S(Lcom/android/launcher3/widget/picker/T;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/picker/T;->S(Lcom/android/launcher3/widget/picker/T;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 52
    .line 53
    const/4 v0, 0x2

    .line 54
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/T;->S(Lcom/android/launcher3/widget/picker/T;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private L1(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x2

    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->E(Z)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method private M1(Ljava/util/List;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/widget/picker/d;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->i0:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->j0:Ljava/util/Map;

    .line 4
    .line 5
    return-void
.end method

.method private N1(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p1, p0, v0, v1, p2}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private static O1(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private static P1(Landroid/view/View;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, p1, v0, p1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private Q1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const v0, 0x7f0b05b3

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/widget/Button;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 21
    .line 22
    check-cast v1, Lcom/android/launcher3/v;

    .line 23
    .line 24
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v1, v1, Lz1/G4;->m:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    const v0, 0x7f0b05b4

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/widget/Button;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 43
    .line 44
    check-cast p0, Lcom/android/launcher3/v;

    .line 45
    .line 46
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p0, p0, Lz1/G4;->l:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method private static T1(Lcom/android/launcher3/h0;Lcom/android/launcher3/h0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->K0:Z

    .line 2
    .line 3
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->K0:Z

    .line 4
    .line 5
    if-eq p0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static V1(Lcom/android/launcher3/v;Z)Lcom/android/launcher3/widget/picker/WidgetsFullSheet;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s1(Lcom/android/launcher3/v;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->T()V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 25
    .line 26
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->H1(Z)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method private W1(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getInsetsWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int/2addr p1, v0

    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->r1(I)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->v0:I

    .line 11
    .line 12
    if-eq v0, p1, :cond_1

    .line 13
    .line 14
    iput p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->v0:I

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/picker/T;->Y(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 31
    .line 32
    const/4 v1, 0x2

    .line 33
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/picker/T;->Y(I)V

    .line 42
    .line 43
    .line 44
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/picker/T;->Y(I)V

    .line 60
    .line 61
    .line 62
    :cond_0
    new-instance p1, Lcom/android/launcher3/widget/picker/l;

    .line 63
    .line 64
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/picker/l;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method public static synthetic X0(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;Landroid/os/UserHandle;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->x1(Landroid/os/UserHandle;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic Y0(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/widget/picker/e0;

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic Z0(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;Landroid/os/UserHandle;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->D1(Landroid/os/UserHandle;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic a1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->C1(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->z1(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->B1(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;Lm2/g;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->y1(Lm2/g;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic e1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A1(Ljava/lang/Integer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getViewToShowEducationTip()Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->B0:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->getViewForEducationTip()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x2

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 26
    .line 27
    if-nez p0, :cond_2

    .line 28
    .line 29
    move p0, v2

    .line 30
    goto :goto_0

    .line 31
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    :goto_0
    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->getItemCount()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-static {v2, v0}, Ljava/util/stream/IntStream;->range(II)Ljava/util/stream/IntStream;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 52
    .line 53
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    new-instance v1, Lcom/android/launcher3/widget/picker/w;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/picker/w;-><init>(Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;)V

    .line 59
    .line 60
    .line 61
    invoke-interface {v0, v1}, Ljava/util/stream/IntStream;->mapToObj(Ljava/util/function/IntFunction;)Ljava/util/stream/Stream;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance v0, Lcom/android/launcher3/widget/picker/x;

    .line 66
    .line 67
    invoke-direct {v0}, Lcom/android/launcher3/widget/picker/x;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-interface {p0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const/4 v0, 0x0

    .line 79
    invoke-virtual {p0, v0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Lcom/android/launcher3/widget/picker/e0;

    .line 84
    .line 85
    if-eqz p0, :cond_3

    .line 86
    .line 87
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/e0;->a:Lcom/android/launcher3/widget/picker/WidgetsListTableView;

    .line 88
    .line 89
    invoke-virtual {p0, v2}, Landroid/widget/TableLayout;->getChildAt(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    check-cast p0, Landroid/view/ViewGroup;

    .line 94
    .line 95
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_3
    return-object v0
.end method

.method public static synthetic h1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;Lm2/g;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w1(Lm2/g;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic i1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Landroid/view/View$OnAttachStateChangeListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->o0:Landroid/view/View$OnAttachStateChangeListener;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Ljava/util/function/Predicate;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->e0:Ljava/util/function/Predicate;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic k1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Lcom/android/launcher3/views/StickyHeaderLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->z0:Lcom/android/launcher3/views/StickyHeaderLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic l1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Ljava/util/function/Predicate;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->f0:Ljava/util/function/Predicate;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic m1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic n1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Landroid/view/ViewOutlineProvider;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->A:Landroid/view/ViewOutlineProvider;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic o1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method private p1(Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->q0:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->G0:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 6
    .line 7
    sget-object v1, Lcom/android/launcher3/views/RecyclerViewFastScroller$c;->j:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/s0;->b(Lcom/android/launcher3/views/RecyclerViewFastScroller;Lcom/android/launcher3/views/RecyclerViewFastScroller$c;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->I1()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->J1()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->q0:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->z0:Lcom/android/launcher3/views/StickyHeaderLayout;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/StickyHeaderLayout;->setCurrentRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private q1()Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const v0, 0x7f0b0497

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 24
    .line 25
    return-object p0
.end method

.method private static s1(Lcom/android/launcher3/v;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const p0, 0x7f0e0274

    .line 10
    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    const p0, 0x7f0e0266

    .line 14
    .line 15
    .line 16
    return p0
.end method

.method public static t1(Lcom/android/launcher3/v;)Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;
    .locals 1

    .line 1
    const v0, 0x7f0b0497

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 9
    .line 10
    return-object p0
.end method

.method private u1(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getY()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getRecyclerView()Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    neg-float v2, v0

    .line 18
    neg-float v3, v1

    .line 19
    invoke-virtual {p1, v2, v3}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 20
    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->k(Landroid/view/MotionEvent;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    :goto_0
    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 40
    .line 41
    .line 42
    return p0
.end method

.method private synthetic w1(Lm2/g;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->d0:Landroid/os/UserHandle;

    .line 2
    .line 3
    iget-object p1, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private synthetic x1(Landroid/os/UserHandle;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->b0:LD1/t;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/util/N2;->e()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private synthetic y1(Lm2/g;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->b0:LD1/t;

    .line 6
    .line 7
    iget-object v1, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/util/N2;->e()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->c0:Lz1/L4;

    .line 22
    .line 23
    iget-object p1, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lz1/L4;->d(Landroid/os/UserHandle;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_0

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

.method private synthetic z1(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Lcom/android/launcher3/h0;->y2:I

    .line 10
    .line 11
    int-to-long v0, v0

    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/high16 p1, 0x3f800000    # 1.0f

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-wide/16 v0, 0x96

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public B(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getCurrentAdapterHolderType()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->d0()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w()V

    .line 19
    .line 20
    .line 21
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 24
    .line 25
    check-cast v0, Lcom/android/launcher3/v;

    .line 26
    .line 27
    const v1, 0x7f140497

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 38
    .line 39
    check-cast p0, Lcom/android/launcher3/v;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->D:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 50
    .line 51
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public E(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->setViewVisibilityBasedOnSearch(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 20
    .line 21
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->p1(Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;)V

    .line 22
    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 27
    .line 28
    check-cast p0, Lcom/android/launcher3/v;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->C:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 39
    .line 40
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    return-void
.end method

.method protected E0(Lcom/android/launcher3/widget/WidgetCell;)I
    .locals 4

    .line 1
    const v0, 0x7f0b0514

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/views/StickyHeaderLayout;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    new-instance v1, Landroid/graphics/Rect;

    .line 15
    .line 16
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_3

    .line 24
    .line 25
    new-instance p1, Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->getStickyChildren()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Landroid/view/View;

    .line 49
    .line 50
    new-instance v3, Landroid/graphics/Rect;

    .line 51
    .line 52
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2, v3}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    invoke-virtual {v3, v1}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    invoke-virtual {p1, v3}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_3

    .line 76
    .line 77
    iget p0, v1, Landroid/graphics/Rect;->top:I

    .line 78
    .line 79
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 80
    .line 81
    if-ge p0, p1, :cond_3

    .line 82
    .line 83
    sub-int/2addr p1, p0

    .line 84
    return p1

    .line 85
    :cond_3
    return v0
.end method

.method public E1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->F0:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method protected J1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->R()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/T;->R()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public K(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onViewExisted-widget "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "WidgetsFullSheet"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-boolean p1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->d0()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public L()V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->j0:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 16
    .line 17
    check-cast v0, Lcom/android/launcher3/v;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ln2/c;->e()Lo2/a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lo2/a;->e()Ljava/util/Map;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->j0:Ljava/util/Map;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    move v9, v0

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v9, v1

    .line 37
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->j0:Ljava/util/Map;

    .line 40
    .line 41
    iget-object v4, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w0:Lcom/android/launcher3/h0;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getMaxAvailableHeightForRecommendations()F

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    iget v6, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->v0:I

    .line 48
    .line 49
    iget v7, p0, Lcom/android/launcher3/widget/o;->G:I

    .line 50
    .line 51
    iget v8, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->k0:I

    .line 52
    .line 53
    invoke-virtual/range {v2 .. v9}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->X(Ljava/util/Map;Lcom/android/launcher3/h0;FIIIZ)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->h0:I

    .line 58
    .line 59
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->B0:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    if-lez v0, :cond_2

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    const/16 v1, 0x8

    .line 65
    .line 66
    :goto_1
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method protected N0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->y0:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->O1(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 20
    .line 21
    invoke-static {v0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->P1(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 34
    .line 35
    invoke-static {v0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->P1(Landroid/view/View;I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 48
    .line 49
    invoke-static {v0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->P1(Landroid/view/View;I)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 53
    .line 54
    const/4 v0, 0x2

    .line 55
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 62
    .line 63
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->P1(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method protected Q0(Lcom/android/launcher3/widget/WidgetCell;I)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    if-eqz p1, :cond_3

    .line 6
    .line 7
    instance-of v0, p1, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 13
    .line 14
    invoke-virtual {p1, v1, p2}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollBy(II)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    instance-of v0, p1, Lcom/android/launcher3/views/StickyHeaderLayout;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    check-cast p1, Lcom/android/launcher3/views/StickyHeaderLayout;

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->q1()Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_3

    .line 29
    .line 30
    invoke-virtual {p0, v1, p2}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollBy(II)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    if-ne p1, p0, :cond_2

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    goto :goto_0

    .line 42
    :cond_3
    :goto_1
    return-void
.end method

.method protected R1()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const v1, 0x7f0e0267

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const v1, 0x7f0e0268

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->S1()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->y0:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    const v1, 0x7f0b0690

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/widget/LinearLayout;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->B0:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->y0:Landroid/widget/LinearLayout;

    .line 43
    .line 44
    const v1, 0x7f0b0692

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 54
    .line 55
    new-instance v1, Lcom/android/launcher3/widget/picker/y;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/picker/y;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->Q(Ljava/util/function/Consumer;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->B0:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->initParentViews(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->setWidgetCellLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 76
    .line 77
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->setWidgetCellOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->y0:Landroid/widget/LinearLayout;

    .line 81
    .line 82
    const v1, 0x7f0b060e

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Landroid/widget/TextView;

    .line 90
    .line 91
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->F0:Landroid/widget/TextView;

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method protected S1()V
    .locals 3

    .line 1
    const v0, 0x7f0b0514

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/LinearLayout;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->y0:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    instance-of v1, v0, Lcom/android/launcher3/views/StickyHeaderLayout;

    .line 13
    .line 14
    const v2, 0x7f0b0497

    .line 15
    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    check-cast v0, Lcom/android/launcher3/views/StickyHeaderLayout;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->z0:Lcom/android/launcher3/views/StickyHeaderLayout;

    .line 22
    .line 23
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/android/launcher3/views/StickyHeaderLayout;->setCurrentRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    const v0, 0x7f0b041e

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroid/widget/TextView;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->x0:Landroid/widget/TextView;

    .line 42
    .line 43
    const v0, 0x7f0b025d

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->G0:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 53
    .line 54
    const v1, 0x7f0b025e

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Landroid/widget/TextView;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setPopupView(Landroid/widget/TextView;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 74
    .line 75
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->e(Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 85
    .line 86
    const/4 v2, 0x2

    .line 87
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 92
    .line 93
    const v2, 0x7f0b052b

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    check-cast v2, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->e(Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;)V

    .line 103
    .line 104
    .line 105
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 106
    .line 107
    if-eqz v0, :cond_2

    .line 108
    .line 109
    const v0, 0x7f0b06a9

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Lcom/android/launcher3/workprofile/a;

    .line 117
    .line 118
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 119
    .line 120
    iget-object v2, p0, Lcom/android/launcher3/views/f;->A:Landroid/view/ViewOutlineProvider;

    .line 121
    .line 122
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 126
    .line 127
    const/4 v2, 0x1

    .line 128
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setClipToOutline(Z)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 137
    .line 138
    invoke-virtual {v0, p0}, Lcom/android/launcher3/workprofile/a;->initParentViews(Landroid/view/View;)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 142
    .line 143
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    if-eqz v0, :cond_1

    .line 148
    .line 149
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 150
    .line 151
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;

    .line 156
    .line 157
    invoke-virtual {v0, p0}, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->setOnActivePageChangedListener(Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip$a;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 161
    .line 162
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;

    .line 167
    .line 168
    invoke-virtual {v0, v1}, Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip;->setActiveMarker(I)V

    .line 169
    .line 170
    .line 171
    :cond_1
    const v0, 0x7f0b05b3

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    new-instance v1, Lcom/android/launcher3/widget/picker/o;

    .line 179
    .line 180
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/picker/o;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    .line 185
    .line 186
    const v0, 0x7f0b05b4

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    new-instance v1, Lcom/android/launcher3/widget/picker/p;

    .line 194
    .line 195
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/picker/p;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 202
    .line 203
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 208
    .line 209
    const v1, 0x7f0b06b5

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    check-cast v1, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 217
    .line 218
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->e(Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;)V

    .line 219
    .line 220
    .line 221
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->Q1()V

    .line 222
    .line 223
    .line 224
    goto :goto_0

    .line 225
    :cond_2
    const/4 v0, 0x0

    .line 226
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 227
    .line 228
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->y0:Landroid/widget/LinearLayout;

    .line 229
    .line 230
    const v1, 0x7f0b05b8

    .line 231
    .line 232
    .line 233
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->C0:Landroid/view/View;

    .line 238
    .line 239
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->y0:Landroid/widget/LinearLayout;

    .line 240
    .line 241
    const v1, 0x7f0b0517

    .line 242
    .line 243
    .line 244
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->D0:Landroid/view/View;

    .line 249
    .line 250
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->y0:Landroid/widget/LinearLayout;

    .line 251
    .line 252
    const v1, 0x7f0b06a2

    .line 253
    .line 254
    .line 255
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    check-cast v0, Lcom/android/launcher3/widget/picker/search/b;

    .line 260
    .line 261
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->E0:Lcom/android/launcher3/widget/picker/search/b;

    .line 262
    .line 263
    new-instance v1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$b;

    .line 264
    .line 265
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$b;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    .line 266
    .line 267
    .line 268
    invoke-interface {v0, v1, p0}, Lcom/android/launcher3/widget/picker/search/b;->a(Lcom/android/launcher3/widget/picker/search/b$a;Lp2/a;)V

    .line 269
    .line 270
    .line 271
    return-void
.end method

.method protected U1(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getRecyclerView()Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->getThumbOffsetY()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x1

    .line 14
    if-ltz v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    return v3

    .line 27
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1, v0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p1, p0}, Lcom/android/launcher3/s0;->h(Landroid/view/MotionEvent;Landroid/view/View;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    xor-int/2addr p0, v3

    .line 46
    return p0

    .line 47
    :cond_1
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method protected X1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->E()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->a:I

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    const/16 v3, 0x8

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    if-ne v1, v2, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->x0:Landroid/widget/TextView;

    .line 16
    .line 17
    const v2, 0x7f1402c7

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    move v1, v4

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v1, v3

    .line 30
    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    const/4 p1, 0x1

    .line 35
    if-ne v1, p1, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->b0:LD1/t;

    .line 38
    .line 39
    invoke-virtual {p1}, LD1/t;->p()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v1, Lcom/android/launcher3/widget/picker/m;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/picker/m;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    .line 50
    .line 51
    .line 52
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->c0:Lz1/L4;

    .line 57
    .line 58
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    new-instance v2, Lcom/android/launcher3/widget/picker/n;

    .line 62
    .line 63
    invoke-direct {v2, v1}, Lcom/android/launcher3/widget/picker/n;-><init>(Lz1/L4;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {p1, v2}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_2

    .line 71
    .line 72
    iget-object p1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 73
    .line 74
    check-cast p1, Lcom/android/launcher3/v;

    .line 75
    .line 76
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    if-eqz p1, :cond_2

    .line 81
    .line 82
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->x0:Landroid/widget/TextView;

    .line 83
    .line 84
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 85
    .line 86
    check-cast v1, Lcom/android/launcher3/v;

    .line 87
    .line 88
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-object v1, v1, Lz1/G4;->c:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->x0:Landroid/widget/TextView;

    .line 99
    .line 100
    const v1, 0x7f1402c8

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 104
    .line 105
    .line 106
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->x0:Landroid/widget/TextView;

    .line 107
    .line 108
    if-eqz v0, :cond_3

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_3
    move v3, v4

    .line 112
    :goto_2
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public addHintCloseAnim(FLandroid/view/animation/Interpolator;Lcom/android/launcher3/anim/V;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->v:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-virtual {p3, p0, p1, v0, p2}, Lcom/android/launcher3/anim/V;->q(Lcom/android/launcher3/anim/d;FFLandroid/animation/TimeInterpolator;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected d0()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/o;->d0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendStateEventToTest(Landroid/content/Context;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public f(ILandroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/high16 p2, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    int-to-long p1, p1

    .line 14
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected getAccessibilityInitialFocusView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->F0:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getAccessibilityTarget()Landroid/util/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getRecyclerView()Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-boolean p0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const p0, 0x7f140493

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const p0, 0x7f140494

    .line 18
    .line 19
    .line 20
    :goto_0
    invoke-virtual {v1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {v0, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method protected getCurrentAdapterHolderType()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public getHeaderViewHeight()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->F0:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->G1(Landroid/view/View;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->D0:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->G1(Landroid/view/View;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    add-int/2addr v0, p0

    .line 14
    return v0
.end method

.method protected getMaxAvailableHeightForRecommendations()F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w0:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget v0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 10
    .line 11
    iget p0, p0, Lcom/android/launcher3/h0;->x2:I

    .line 12
    .line 13
    sub-int/2addr v0, p0

    .line 14
    int-to-float p0, v0

    .line 15
    const v0, 0x3ee66666    # 0.45f

    .line 16
    .line 17
    .line 18
    mul-float/2addr p0, v0

    .line 19
    return p0
.end method

.method public getRecyclerView()Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 52
    .line 53
    return-object p0
.end method

.method public getSheet()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getWidgetsToDisplay()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lm2/g;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ln2/c;->e()Lo2/a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lo2/a;->c()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method protected handleClose(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Lcom/android/launcher3/h0;->z2:I

    .line 10
    .line 11
    int-to-long v0, v0

    .line 12
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/views/f;->Y(ZJ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public i(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 10
    .line 11
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->X1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->p1(Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p1, 0x10

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

.method public j()V
    .locals 0

    .line 1
    return-void
.end method

.method public n(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lm2/g;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/picker/T;->b0(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->X1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public n0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 2
    .line 3
    return p0
.end method

.method public onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/o;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->E:Landroid/graphics/Rect;

    .line 6
    .line 7
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 8
    .line 9
    iget v2, p0, Lcom/android/launcher3/widget/o;->H:I

    .line 10
    .line 11
    if-eq v1, v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->setInsets(Landroid/graphics/Rect;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p1
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/o;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onBackInvoked()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->E0:Lcom/android/launcher3/widget/picker/search/b;

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/android/launcher3/widget/picker/search/b;->reset()V

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/widget/picker/q;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/picker/q;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/a;->onBackInvoked()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Lcom/android/launcher3/views/f;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->U1(Landroid/view/MotionEvent;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput-boolean v0, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->E0:Lcom/android/launcher3/widget/picker/search/b;

    .line 23
    .line 24
    invoke-interface {v0}, Lcom/android/launcher3/widget/picker/search/b;->b()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->D0:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->m0:Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;

    .line 43
    .line 44
    iget v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->n0:F

    .line 45
    .line 46
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$d;->a(Landroid/view/MotionEvent;F)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->E0:Lcom/android/launcher3/widget/picker/search/b;

    .line 53
    .line 54
    invoke-interface {v0}, Lcom/android/launcher3/widget/picker/search/b;->c()V

    .line 55
    .line 56
    .line 57
    :cond_2
    invoke-super {p0, p1}, Lcom/android/launcher3/views/f;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/o;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->o0:Landroid/view/View$OnAttachStateChangeListener;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 18
    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->o0:Landroid/view/View$OnAttachStateChangeListener;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/o;->onDeviceProfileChanged(Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w0:Lcom/android/launcher3/h0;

    .line 5
    .line 6
    invoke-static {v0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->T1(Lcom/android/launcher3/h0;Lcom/android/launcher3/h0;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Landroid/util/SparseArray;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->saveHierarchyState(Landroid/util/SparseArray;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p0, v1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->handleClose(Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v2}, Lcom/android/launcher3/v;->fromContext(Landroid/content/Context;)Lcom/android/launcher3/v;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {v2, v1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->V1(Lcom/android/launcher3/v;Z)Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->i0:Ljava/util/List;

    .line 37
    .line 38
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->j0:Ljava/util/Map;

    .line 39
    .line 40
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->M1(Ljava/util/List;Ljava/util/Map;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->restoreHierarchyState(Landroid/util/SparseArray;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 47
    .line 48
    invoke-direct {v1, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->K1(Landroid/util/SparseArray;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getCurrentAdapterHolderType()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-direct {v1, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->L1(I)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->v1()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->I1()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->J1()V

    .line 69
    .line 70
    .line 71
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w0:Lcom/android/launcher3/h0;

    .line 72
    .line 73
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/widget/o;->onDragStart(ZF)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWindowInsetsController()Landroid/view/WindowInsetsController;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Landroid/view/WindowInsets$Type;->ime()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-interface {p0, p1}, Landroid/view/WindowInsetsController;->hide(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0187

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const v1, 0x7f08085e

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/views/f;->g0(Landroid/graphics/drawable/Drawable;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/launcher3/views/f;->A:Landroid/view/ViewOutlineProvider;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToOutline(Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->R1()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->u1(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    sub-int/2addr p4, p2

    .line 2
    sub-int/2addr p5, p3

    .line 3
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-int/2addr p4, p1

    .line 10
    iget-object p2, p0, Lcom/android/launcher3/widget/o;->E:Landroid/graphics/Rect;

    .line 11
    .line 12
    iget p3, p2, Landroid/graphics/Rect;->left:I

    .line 13
    .line 14
    sub-int/2addr p4, p3

    .line 15
    iget p2, p2, Landroid/graphics/Rect;->right:I

    .line 16
    .line 17
    sub-int/2addr p4, p2

    .line 18
    div-int/lit8 p4, p4, 0x2

    .line 19
    .line 20
    add-int/2addr p4, p3

    .line 21
    iget-object p2, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    sub-int p3, p5, p3

    .line 28
    .line 29
    add-int/2addr p1, p4

    .line 30
    invoke-virtual {p2, p4, p3, p1, p5}, Landroid/view/ViewGroup;->layout(IIII)V

    .line 31
    .line 32
    .line 33
    iget p1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->W1(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/o;->D0(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->F1(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-super {p0, p1}, Lcom/android/launcher3/a;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public p(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onViewEntered-widget "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "WidgetsFullSheet"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x1

    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/G4;->G(ZZ)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 47
    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->c()V

    .line 51
    .line 52
    .line 53
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public q()V
    .locals 0

    .line 1
    return-void
.end method

.method protected r1(I)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/o;->F:I

    .line 2
    .line 3
    mul-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    sub-int/2addr p1, p0

    .line 6
    return p1
.end method

.method public restoreHierarchyState(Landroid/util/SparseArray;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Landroid/os/Bundle;

    .line 7
    .line 8
    const-string v1, "widgetsFullSheet:mRecommendationsCurrentPage"

    .line 9
    .line 10
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->k0:I

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->V(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "widgetsFullSheet:superHierarchyState"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->restoreHierarchyState(Landroid/util/SparseArray;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public saveHierarchyState(Landroid/util/SparseArray;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "widgetsFullSheet:mRecommendationsCurrentPage"

    .line 7
    .line 8
    iget v2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->k0:I

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->W(Landroid/os/Bundle;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Landroid/util/SparseArray;

    .line 19
    .line 20
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-super {p0, v1}, Landroid/widget/LinearLayout;->saveHierarchyState(Landroid/util/SparseArray;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "widgetsFullSheet:superHierarchyState"

    .line 27
    .line 28
    invoke-virtual {v0, p0, v1}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    invoke-virtual {p1, p0, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/o;->setInsets(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 5
    .line 6
    iget v0, p0, Lcom/android/launcher3/widget/o;->H:I

    .line 7
    .line 8
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->H0:I

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 24
    .line 25
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->H0:I

    .line 26
    .line 27
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->N1(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 31
    .line 32
    const/4 v0, 0x2

    .line 33
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 40
    .line 41
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->H0:I

    .line 42
    .line 43
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->N1(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 44
    .line 45
    .line 46
    iget-boolean p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 47
    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 60
    .line 61
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->H0:I

    .line 62
    .line 63
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->N1(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->x0:Landroid/widget/TextView;

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 73
    .line 74
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->H0:I

    .line 75
    .line 76
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 77
    .line 78
    if-lez v0, :cond_1

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->T0()V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->z0()V

    .line 85
    .line 86
    .line 87
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public setUpperView(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->I0:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method protected setViewVisibilityBasedOnSearch(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    const/4 v1, 0x0

    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->B0:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-boolean p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 19
    .line 20
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->C0:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->e:Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;

    .line 51
    .line 52
    invoke-virtual {p1, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->X1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->x0:Landroid/widget/TextView;

    .line 67
    .line 68
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 81
    .line 82
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getCurrentAdapterHolderType()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 96
    .line 97
    invoke-static {p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 101
    .line 102
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 103
    .line 104
    .line 105
    new-instance p1, Lcom/android/launcher3/widget/picker/l;

    .line 106
    .line 107
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/picker/l;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w()V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->n(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->setViewVisibilityBasedOnSearch(Z)V

    .line 28
    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 48
    .line 49
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->p1(Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method protected v1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public w()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->f0()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 16
    .line 17
    check-cast v0, Lcom/android/launcher3/v;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ln2/c;->e()Lo2/a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lo2/a;->c()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0}, Lo2/a;->d()Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getWidgetsToDisplay()Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 41
    .line 42
    const/4 v3, 0x0

    .line 43
    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 48
    .line 49
    iget-object v2, v2, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 50
    .line 51
    invoke-virtual {v2, v1, v0}, Lcom/android/launcher3/widget/picker/T;->a0(Ljava/util/List;Ljava/util/List;)V

    .line 52
    .line 53
    .line 54
    iget-boolean v2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 55
    .line 56
    const/4 v4, 0x1

    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->C0:Landroid/view/View;

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 70
    .line 71
    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 76
    .line 77
    iget-object v2, v2, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 78
    .line 79
    invoke-virtual {v2, v1, v0}, Lcom/android/launcher3/widget/picker/T;->a0(Ljava/util/List;Ljava/util/List;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->s0:Lcom/android/launcher3/workprofile/a;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->i(I)V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_2
    invoke-virtual {p0, v3}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->i(I)V

    .line 93
    .line 94
    .line 95
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 96
    .line 97
    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->E()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_3

    .line 110
    .line 111
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 112
    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 116
    .line 117
    invoke-virtual {v0, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 122
    .line 123
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 124
    .line 125
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->E()Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_4

    .line 130
    .line 131
    :cond_3
    move v3, v4

    .line 132
    :cond_4
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->u0:Z

    .line 133
    .line 134
    if-eq v0, v3, :cond_5

    .line 135
    .line 136
    iput-boolean v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->u0:Z

    .line 137
    .line 138
    new-instance v0, Lcom/android/launcher3/widget/picker/l;

    .line 139
    .line 140
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/picker/l;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 144
    .line 145
    .line 146
    :cond_5
    :goto_2
    return-void
.end method
