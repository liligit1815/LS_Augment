.class public Lcom/android/launcher3/views/StickyHeaderLayout;
.super Landroid/widget/LinearLayout;
.source "StickyHeaderLayout.java"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/views/StickyHeaderLayout$d;,
        Lcom/android/launcher3/views/StickyHeaderLayout$b;,
        Lcom/android/launcher3/views/StickyHeaderLayout$c;
    }
.end annotation


# static fields
.field private static final n:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/views/StickyHeaderLayout;",
            ">;"
        }
    .end annotation
.end field

.field private static final o:Lcom/android/launcher3/views/StickyHeaderLayout$c;

.field private static final p:Lcom/android/launcher3/views/StickyHeaderLayout$c;


# instance fields
.field private g:Landroidx/recyclerview/widget/RecyclerView;

.field private h:Lcom/android/launcher3/views/StickyHeaderLayout$b;

.field private i:F

.field private j:F

.field private k:Landroid/animation/Animator;

.field private l:Z

.field private m:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/views/StickyHeaderLayout$a;

    .line 2
    .line 3
    const-string v1, "scrollAnimOffset"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/views/StickyHeaderLayout$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/views/StickyHeaderLayout;->n:Landroid/util/FloatProperty;

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/views/Z;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/android/launcher3/views/Z;-><init>()V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/android/launcher3/views/StickyHeaderLayout;->o:Lcom/android/launcher3/views/StickyHeaderLayout$c;

    .line 16
    .line 17
    new-instance v0, Lcom/android/launcher3/views/a0;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/android/launcher3/views/a0;-><init>()V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/android/launcher3/views/StickyHeaderLayout;->p:Lcom/android/launcher3/views/StickyHeaderLayout$c;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/StickyHeaderLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/launcher3/views/StickyHeaderLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->i:F

    .line 5
    iput p1, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->j:F

    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->l:Z

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/views/StickyHeaderLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/views/StickyHeaderLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/views/StickyHeaderLayout;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->j:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/views/StickyHeaderLayout;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->j:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/views/StickyHeaderLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->h:Lcom/android/launcher3/views/StickyHeaderLayout$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/android/launcher3/views/StickyHeaderLayout$b;->setOnYChangeCallback(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->h:Lcom/android/launcher3/views/StickyHeaderLayout$b;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    :goto_0
    if-ge v1, v0, :cond_2

    .line 19
    .line 20
    iget-object v2, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    instance-of v3, v2, Lcom/android/launcher3/views/StickyHeaderLayout$b;

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    check-cast v2, Lcom/android/launcher3/views/StickyHeaderLayout$b;

    .line 31
    .line 32
    iput-object v2, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->h:Lcom/android/launcher3/views/StickyHeaderLayout$b;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->getHeaderHeight()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {v2, v0}, Lcom/android/launcher3/views/StickyHeaderLayout$b;->d(I)Z

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->h:Lcom/android/launcher3/views/StickyHeaderLayout$b;

    .line 42
    .line 43
    new-instance v1, Lcom/android/launcher3/views/b0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Lcom/android/launcher3/views/b0;-><init>(Lcom/android/launcher3/views/StickyHeaderLayout;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/android/launcher3/views/StickyHeaderLayout$b;->setOnYChangeCallback(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    return-void
.end method

.method private synthetic g()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->k:Landroid/animation/Animator;

    .line 3
    .line 4
    return-void
.end method

.method private getCurrentScroll()F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->h:Lcom/android/launcher3/views/StickyHeaderLayout$b;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getY()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->m:I

    .line 21
    .line 22
    neg-int v0, v0

    .line 23
    int-to-float v0, v0

    .line 24
    :goto_0
    iget p0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->j:F

    .line 25
    .line 26
    add-float/2addr p0, v0

    .line 27
    return p0
.end method

.method private h(Landroid/view/MotionEvent;Lcom/android/launcher3/views/StickyHeaderLayout$c;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLeft()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLeft()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    int-to-float v0, v0

    .line 13
    iget-object v1, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTop()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTop()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    sub-int/2addr v1, v2

    .line 24
    int-to-float v1, v1

    .line 25
    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 26
    .line 27
    .line 28
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 29
    .line 30
    invoke-interface {p2, p0, p1}, Lcom/android/launcher3/views/StickyHeaderLayout$c;->a(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z

    .line 31
    .line 32
    .line 33
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    neg-float p2, v0

    .line 35
    neg-float v0, v1

    .line 36
    invoke-virtual {p1, p2, v0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 37
    .line 38
    .line 39
    return p0

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    neg-float p2, v0

    .line 42
    neg-float v0, v1

    .line 43
    invoke-virtual {p1, p2, v0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 44
    .line 45
    .line 46
    throw p0
.end method

.method private j()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->getCurrentScroll()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->i:F

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    :goto_0
    if-ge v1, v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Lcom/android/launcher3/views/StickyHeaderLayout$d;

    .line 23
    .line 24
    iget v4, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->i:F

    .line 25
    .line 26
    iget v3, v3, Lcom/android/launcher3/views/StickyHeaderLayout$d;->b:I

    .line 27
    .line 28
    int-to-float v3, v3

    .line 29
    invoke-static {v4, v3}, Ljava/lang/Math;->max(FF)F

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 34
    .line 35
    .line 36
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/views/StickyHeaderLayout$d;

    .line 2
    .line 3
    return p0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->generateDefaultLayoutParams()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method protected generateDefaultLayoutParams()Landroid/widget/LinearLayout$LayoutParams;
    .locals 2

    .line 2
    new-instance p0, Lcom/android/launcher3/views/StickyHeaderLayout$d;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/views/StickyHeaderLayout$d;-><init>(II)V

    return-object p0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/StickyHeaderLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/StickyHeaderLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/LinearLayout$LayoutParams;
    .locals 1

    .line 4
    new-instance v0, Lcom/android/launcher3/views/StickyHeaderLayout$d;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/views/StickyHeaderLayout$d;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/LinearLayout$LayoutParams;
    .locals 1

    .line 3
    new-instance p0, Lcom/android/launcher3/views/StickyHeaderLayout$d;

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/views/StickyHeaderLayout$d;-><init>(II)V

    return-object p0
.end method

.method public getHeaderHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getStickyChildren()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    if-ge v2, v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    check-cast v4, Lcom/android/launcher3/views/StickyHeaderLayout$d;

    .line 22
    .line 23
    iget-boolean v4, v4, Lcom/android/launcher3/views/StickyHeaderLayout$d;->a:Z

    .line 24
    .line 25
    if-eqz v4, :cond_0

    .line 26
    .line 27
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-object v0
.end method

.method public i(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->k:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->k:Landroid/animation/Animator;

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->j:F

    .line 13
    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->j()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget p1, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->i:F

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->getCurrentScroll()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    sub-float/2addr p1, v1

    .line 27
    sget-object v1, Lcom/android/launcher3/views/StickyHeaderLayout;->n:Landroid/util/FloatProperty;

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    new-array v2, v2, [F

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    aput p1, v2, v3

    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    aput v0, v2, p1

    .line 37
    .line 38
    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->k:Landroid/animation/Animator;

    .line 43
    .line 44
    new-instance v0, Lcom/android/launcher3/views/Y;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Lcom/android/launcher3/views/Y;-><init>(Lcom/android/launcher3/views/StickyHeaderLayout;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->k:Landroid/animation/Animator;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public onChildViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    instance-of p1, p1, Lcom/android/launcher3/views/StickyHeaderLayout$b;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onChildViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->h:Lcom/android/launcher3/views/StickyHeaderLayout$b;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/views/StickyHeaderLayout;->o:Lcom/android/launcher3/views/StickyHeaderLayout$c;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/views/StickyHeaderLayout;->h(Landroid/view/MotionEvent;Lcom/android/launcher3/views/StickyHeaderLayout$c;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->l:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method protected onLayout(ZIIII)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 p2, 0x0

    .line 9
    move p3, p2

    .line 10
    :goto_0
    if-ge p2, p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object p5

    .line 20
    check-cast p5, Lcom/android/launcher3/views/StickyHeaderLayout$d;

    .line 21
    .line 22
    iget-boolean v0, p5, Lcom/android/launcher3/views/StickyHeaderLayout$d;->a:Z

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p4}, Landroid/view/View;->getTop()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    neg-int v0, v0

    .line 31
    add-int/2addr v0, p3

    .line 32
    iput v0, p5, Lcom/android/launcher3/views/StickyHeaderLayout$d;->b:I

    .line 33
    .line 34
    invoke-virtual {p4}, Landroid/view/View;->getHeight()I

    .line 35
    .line 36
    .line 37
    move-result p4

    .line 38
    add-int/2addr p3, p4

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    const/high16 p4, -0x80000000

    .line 41
    .line 42
    iput p4, p5, Lcom/android/launcher3/views/StickyHeaderLayout$d;->b:I

    .line 43
    .line 44
    :goto_1
    add-int/lit8 p2, p2, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->j()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method protected onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->m:I

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->h:Lcom/android/launcher3/views/StickyHeaderLayout$b;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/StickyHeaderLayout$b;->d(I)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/views/StickyHeaderLayout;->p:Lcom/android/launcher3/views/StickyHeaderLayout$c;

    .line 6
    .line 7
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/views/StickyHeaderLayout;->h(Landroid/view/MotionEvent;Lcom/android/launcher3/views/StickyHeaderLayout$c;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    :cond_1
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_2
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public setCurrentRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V

    .line 11
    .line 12
    .line 13
    :cond_1
    iput-object p1, p0, Lcom/android/launcher3/views/StickyHeaderLayout;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->f()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Lcom/android/launcher3/views/StickyHeaderLayout;->i(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
