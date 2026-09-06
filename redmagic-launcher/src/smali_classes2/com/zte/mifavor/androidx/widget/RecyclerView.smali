.class public Lcom/zte/mifavor/androidx/widget/RecyclerView;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/androidx/widget/RecyclerView$d;,
        Lcom/zte/mifavor/androidx/widget/RecyclerView$e;,
        Lcom/zte/mifavor/androidx/widget/RecyclerView$f;
    }
.end annotation


# static fields
.field public static Q:[I

.field public static R:[I

.field private static S:Z


# instance fields
.field private A:LX3/c;

.field private B:LX3/a;

.field private C:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

.field private D:Z

.field private E:[I

.field private F:Ljava/lang/Boolean;

.field private G:I

.field private H:Ljava/lang/String;

.field private final I:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private J:Z

.field private K:I

.field protected L:I

.field private M:Z

.field private N:Z

.field private O:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;

.field private P:Z

.field g:Lb4/e;

.field private h:I

.field private i:I

.field private j:Z

.field private k:Z

.field private l:Lc4/h;

.field private m:Lc4/c;

.field private n:I

.field protected o:I

.field protected p:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

.field protected q:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

.field protected r:I

.field private s:I

.field private t:I

.field private u:I

.field private v:I

.field private w:Z

.field private x:LY3/a;

.field private y:LX3/d;

.field private z:LX3/b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    filled-new-array {v0}, [I

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    sput-object v0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->Q:[I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    filled-new-array {v0, v0, v0, v0, v0}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sput-object v1, Lcom/zte/mifavor/androidx/widget/RecyclerView;->R:[I

    .line 14
    .line 15
    sput-boolean v0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->S:Z

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 3
    iput p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->h:I

    .line 4
    iput p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->i:I

    const/4 p3, 0x1

    .line 5
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j:Z

    .line 6
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->k:Z

    .line 7
    iput p3, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->n:I

    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->p:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    .line 9
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->q:Lcom/zte/mifavor/androidx/widget/swipe/SwipeMenuLayout;

    const/4 v1, -0x1

    .line 10
    iput v1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->r:I

    .line 11
    iput p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->s:I

    .line 12
    iput p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->t:I

    .line 13
    iput p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->u:I

    .line 14
    iput p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->v:I

    .line 15
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->w:Z

    .line 16
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->C:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 17
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->D:Z

    .line 18
    filled-new-array {v1}, [I

    move-result-object v0

    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->E:[I

    .line 19
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->F:Ljava/lang/Boolean;

    .line 20
    iput v1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->G:I

    .line 21
    const-string v0, ""

    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->H:Ljava/lang/String;

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->I:Ljava/util/List;

    .line 23
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->J:Z

    .line 24
    iput p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->K:I

    .line 25
    iput p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->L:I

    .line 26
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->M:Z

    .line 27
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->N:Z

    .line 28
    new-instance v0, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;

    invoke-direct {v0, p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView$b;-><init>(Lcom/zte/mifavor/androidx/widget/RecyclerView;)V

    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->O:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;

    .line 29
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->P:Z

    .line 30
    new-instance v0, Lb4/e;

    invoke-direct {v0}, Lb4/e;-><init>()V

    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 31
    sget-object v1, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    const/high16 v2, 0x40400000    # 3.0f

    invoke-virtual {v0, p0, v1, v2}, Lb4/e;->s(Landroid/view/View;Landroidx/dynamicanimation/animation/g;F)V

    .line 32
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb4/e;->j(Landroid/content/Context;)V

    .line 33
    invoke-static {p1}, Lcom/zte/mifavor/widget/s;->d(Landroid/content/Context;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->k:Z

    .line 34
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    move p2, p3

    :cond_0
    iput-boolean p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j:Z

    .line 35
    iget-object p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    invoke-virtual {p1, p2}, Lb4/e;->B(Z)V

    .line 36
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->o:I

    .line 37
    new-instance p1, LV3/a;

    invoke-direct {p1}, LV3/a;-><init>()V

    const-wide/16 p2, 0x32

    .line 38
    invoke-virtual {p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;->setRemoveDuration(J)V

    .line 39
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 40
    invoke-virtual {p0}, Landroid/view/ViewGroup;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 41
    const-string p2, "{"

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    .line 42
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "["

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, p2, 0x1

    add-int/lit8 p2, p2, 0x7

    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "] "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->H:Ljava/lang/String;

    :cond_1
    return-void
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/androidx/widget/RecyclerView;)LX3/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->B:LX3/a;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/androidx/widget/RecyclerView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->K:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/androidx/widget/RecyclerView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->h:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/androidx/widget/RecyclerView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->i:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/zte/mifavor/androidx/widget/RecyclerView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->h:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic g(Lcom/zte/mifavor/androidx/widget/RecyclerView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->i:I

    .line 2
    .line 3
    return-void
.end method

.method private getAnimIsRunning()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget v0, LR3/g;->c:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of v0, p0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->Q0()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method private getIsFirstDownScroll()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget v0, LR3/g;->c:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of v0, p0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->T0()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method static bridge synthetic h()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->S:Z

    .line 2
    .line 3
    return v0
.end method

.method private i(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->B:LX3/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, " error,  mAdapterWrapper is null."

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "Z#SQScrollRV"

    .line 23
    .line 24
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private j()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->x:LY3/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, LY3/a;

    .line 6
    .line 7
    invoke-direct {v0}, LY3/a;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->x:LY3/a;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/h;->b(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private setApplayoutSpringDistance(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget v0, LR3/g;->c:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of v0, p0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/google/android/material/appbar/AppBarLayoutSpringBehavior;->P0(I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method private setSmartSlideOptimizationStatusOfRV(Z)V
    .locals 5

    .line 1
    const-string v0, "Z#SQScrollRV"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->J:Z

    .line 4
    .line 5
    if-ne p1, v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_5

    .line 8
    .line 9
    :cond_0
    :try_start_0
    const-class v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    const-string v2, "mViewFlinger"

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 19
    .line 20
    .line 21
    const-string v3, "androidx.recyclerview.widget.RecyclerView$ViewFlinger"

    .line 22
    .line 23
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    const-string v4, "mOverScroller"

    .line 28
    .line 29
    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v3, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    instance-of v1, v1, Landroid/widget/OverScroller;

    .line 45
    .line 46
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->J:Z

    .line 47
    .line 48
    new-instance p0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v1, "set Smart Slide Optimization Status Of RV out, bEnable="

    .line 54
    .line 55
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :catchall_0
    move-exception p0

    .line 70
    goto :goto_0

    .line 71
    :catch_0
    move-exception p0

    .line 72
    goto :goto_1

    .line 73
    :catch_1
    move-exception p0

    .line 74
    goto :goto_2

    .line 75
    :catch_2
    move-exception p0

    .line 76
    goto :goto_3

    .line 77
    :catch_3
    move-exception p0

    .line 78
    goto :goto_4

    .line 79
    :goto_0
    const-string p1, "set Smart Slide Optimization Status Of RV, Throwable"

    .line 80
    .line 81
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 82
    .line 83
    .line 84
    goto :goto_5

    .line 85
    :catch_4
    const-string p0, "set Smart Slide Optimization Status Of RV, No Such Method Error."

    .line 86
    .line 87
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    goto :goto_5

    .line 91
    :goto_1
    const-string p1, "set Smart Slide Optimization Status Of RV, ClassNotFoundException"

    .line 92
    .line 93
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 94
    .line 95
    .line 96
    goto :goto_5

    .line 97
    :goto_2
    const-string p1, "set Smart Slide Optimization Status Of RV, IllegalArgumentException"

    .line 98
    .line 99
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 100
    .line 101
    .line 102
    goto :goto_5

    .line 103
    :goto_3
    const-string p1, "set Smart Slide Optimization Status Of RV, IllegalAccessException"

    .line 104
    .line 105
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 106
    .line 107
    .line 108
    goto :goto_5

    .line 109
    :goto_4
    const-string p1, "set Smart Slide Optimization Status Of RV, NoSuchFieldException"

    .line 110
    .line 111
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 112
    .line 113
    .line 114
    :goto_5
    return-void
.end method


# virtual methods
.method public dispatchNestedFling(FFZ)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->dispatchNestedFling(FFZ)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

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
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTranslationY()F

    .line 15
    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 21
    .line 22
    invoke-virtual {v0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/e;->h()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 33
    .line 34
    invoke-virtual {v0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->C()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 42
    .line 43
    invoke-virtual {v0}, Lb4/e;->p()Landroidx/dynamicanimation/animation/j;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/j;->c()V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 51
    .line 52
    invoke-virtual {v0}, Lb4/e;->f()V

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->i:I

    .line 57
    .line 58
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->h:I

    .line 59
    .line 60
    :goto_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0
.end method

.method public fling(II)Z
    .locals 5

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->canScrollHorizontally(I)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->canScrollHorizontally(I)Z

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    if-nez v3, :cond_1

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    if-eqz v4, :cond_1

    .line 26
    .line 27
    :cond_0
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->fling(II)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_1
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->getIsBeingDragged()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const/4 v3, 0x0

    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/16 v4, 0xfa

    .line 44
    .line 45
    if-le v0, v4, :cond_4

    .line 46
    .line 47
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j:Z

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-virtual {v0, p2}, Lb4/e;->h(I)V

    .line 56
    .line 57
    .line 58
    :cond_2
    if-nez v1, :cond_3

    .line 59
    .line 60
    invoke-direct {p0, v3}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->setSmartSlideOptimizationStatusOfRV(Z)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    invoke-direct {p0, v2}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->setSmartSlideOptimizationStatusOfRV(Z)V

    .line 65
    .line 66
    .line 67
    :goto_0
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->fling(II)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    return p0

    .line 72
    :cond_4
    return v3
.end method

.method public getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, LX3/a;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, LX3/a;

    .line 14
    .line 15
    invoke-virtual {p0}, LX3/a;->i()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public getInterruptSlideDirection()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getIsBeingDragged()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->m:Lc4/c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lc4/c;->getIsBeingDragged()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getUseSpring()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public k()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lb4/e;->t()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lb4/e;->v()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lb4/e;->w()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->x:LY3/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, LY3/a;->A()LY3/c;

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "+++++++++ onItemDismiss error. mViewHolder or mItemTouchHelper is null. mViewHolder = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->C:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "Z#SQScrollRV"

    .line 28
    .line 29
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Lcom/zte/mifavor/androidx/widget/RecyclerView$c;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView$c;-><init>(Lcom/zte/mifavor/androidx/widget/RecyclerView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, -0x1

    .line 10
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    const/4 v4, 0x1

    .line 15
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->canScrollHorizontally(I)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->canScrollHorizontally(I)Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    float-to-int v0, v0

    .line 34
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->s:I

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    float-to-int p1, p1

    .line 41
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->t:I

    .line 42
    .line 43
    iget v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->s:I

    .line 44
    .line 45
    int-to-float v0, v0

    .line 46
    const/high16 v6, 0x3f000000    # 0.5f

    .line 47
    .line 48
    add-float/2addr v0, v6

    .line 49
    float-to-int v0, v0

    .line 50
    iput v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->u:I

    .line 51
    .line 52
    int-to-float p1, p1

    .line 53
    add-float/2addr p1, v6

    .line 54
    float-to-int p1, p1

    .line 55
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->v:I

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->k()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->M:Z

    .line 62
    .line 63
    :cond_0
    if-nez v3, :cond_2

    .line 64
    .line 65
    if-nez v5, :cond_2

    .line 66
    .line 67
    if-nez v2, :cond_1

    .line 68
    .line 69
    if-eqz v4, :cond_2

    .line 70
    .line 71
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->H:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string p0, "+++++++++ onInterceptTouchEvent out, isIntercepted = "

    .line 82
    .line 83
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const-string p1, "Z#SQScrollRV"

    .line 94
    .line 95
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    :cond_2
    return v1
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onNestedFling(Landroid/view/View;FFZ)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onScrollStateChanged(I)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onScrollStateChanged(I)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j:Z

    .line 5
    .line 6
    if-eqz v0, :cond_6

    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->getAnimIsRunning()Z

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->getIsFirstDownScroll()Z

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 27
    .line 28
    invoke-virtual {v2}, Lb4/e;->k()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->K:I

    .line 33
    .line 34
    const/16 v3, 0x3e8

    .line 35
    .line 36
    if-nez p1, :cond_3

    .line 37
    .line 38
    const/4 v4, 0x2

    .line 39
    if-eq v4, v2, :cond_2

    .line 40
    .line 41
    iget-boolean v4, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->P:Z

    .line 42
    .line 43
    if-eqz v4, :cond_3

    .line 44
    .line 45
    :cond_2
    const/4 v4, -0x1

    .line 46
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 47
    .line 48
    .line 49
    const/4 v5, 0x1

    .line 50
    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->canScrollHorizontally(I)Z

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->canScrollHorizontally(I)Z

    .line 57
    .line 58
    .line 59
    iget-object v4, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 60
    .line 61
    invoke-virtual {v4, v1, v3}, Lb4/e;->x(Landroid/view/View;I)V

    .line 62
    .line 63
    .line 64
    :cond_3
    if-nez p1, :cond_5

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->k()Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-nez v4, :cond_5

    .line 71
    .line 72
    const/4 v4, 0x4

    .line 73
    if-eq v4, v2, :cond_5

    .line 74
    .line 75
    iget-boolean v2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->M:Z

    .line 76
    .line 77
    if-eqz v2, :cond_5

    .line 78
    .line 79
    if-eqz v1, :cond_4

    .line 80
    .line 81
    iget-object v2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 82
    .line 83
    invoke-virtual {v2, v1, v3}, Lb4/e;->l(Landroid/view/View;I)F

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    :goto_0
    float-to-int v1, v1

    .line 88
    goto :goto_1

    .line 89
    :cond_4
    iget-object v1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 90
    .line 91
    invoke-virtual {v1, p0, v3}, Lb4/e;->l(Landroid/view/View;I)F

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    goto :goto_0

    .line 96
    :goto_1
    int-to-float v2, v1

    .line 97
    const/high16 v3, 0x42040000    # 33.0f

    .line 98
    .line 99
    cmpl-float v2, v2, v3

    .line 100
    .line 101
    if-lez v2, :cond_5

    .line 102
    .line 103
    invoke-direct {p0, v1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->setApplayoutSpringDistance(I)V

    .line 104
    .line 105
    .line 106
    :cond_5
    if-nez p1, :cond_6

    .line 107
    .line 108
    iput-boolean v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->M:Z

    .line 109
    .line 110
    :cond_6
    :goto_2
    return-void
.end method

.method public onScrolled(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->onScrolled(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->canScrollHorizontally(I)Z

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->canScrollHorizontally(I)Z

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 13
    .line 14
    .line 15
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    return p0

    .line 17
    :catch_0
    move-exception p0

    .line 18
    const-string p1, "Z#SQScrollRV"

    .line 19
    .line 20
    const-string v0, "on Touch Event error, ex="

    .line 21
    .line 22
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    .locals 1

    .line 1
    new-instance v0, Lc4/h;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lc4/h;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->l:Lc4/h;

    .line 7
    .line 8
    invoke-virtual {v0}, Lc4/h;->b()Lc4/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->m:Lc4/c;

    .line 13
    .line 14
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setDampingRatio(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "Z#SQScrollRV"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "setDampingRatio dampingRatio = "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lb4/e;->y(F)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p0

    .line 34
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public setDragAmplitude(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "Z#SQScrollRV"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "setDragAmplitude dragAmplitude = "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lb4/e;->z(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public setDuration(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "Z#SQScrollRV"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "setDuration duration = "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lb4/e;->A(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p0

    .line 34
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public setForcedSpring(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->P:Z

    .line 2
    .line 3
    return-void
.end method

.method public setInterruptSlideDirection(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->n:I

    .line 2
    .line 3
    return-void
.end method

.method public setItemViewSwipeEnabled(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->w:Z

    .line 5
    .line 6
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->x:LY3/a;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, LY3/a;->B(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    if-eqz p1, :cond_2

    .line 7
    .line 8
    sget-object v0, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    sget-object v0, Landroidx/dynamicanimation/animation/e;->n:Landroidx/dynamicanimation/animation/e$s;

    .line 23
    .line 24
    :cond_1
    iget-object v1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v1, p0, v0, v2}, Lb4/e;->E(Landroid/view/View;Landroidx/dynamicanimation/animation/g;F)V

    .line 28
    .line 29
    .line 30
    :cond_2
    instance-of v0, p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    move-object v0, p1

    .line 35
    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->F0()Landroidx/recyclerview/widget/GridLayoutManager$d;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    new-instance v2, Lcom/zte/mifavor/androidx/widget/RecyclerView$a;

    .line 42
    .line 43
    invoke-direct {v2, p0, v1}, Lcom/zte/mifavor/androidx/widget/RecyclerView$a;-><init>(Lcom/zte/mifavor/androidx/widget/RecyclerView;Landroidx/recyclerview/widget/GridLayoutManager$d;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->L0(Landroidx/recyclerview/widget/GridLayoutManager$d;)V

    .line 47
    .line 48
    .line 49
    :cond_3
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public setOnItemClickListener(LX3/b;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "Cannot set item click listener, setAdapter has already been called."

    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->i(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lcom/zte/mifavor/androidx/widget/RecyclerView$d;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView$d;-><init>(Lcom/zte/mifavor/androidx/widget/RecyclerView;LX3/b;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->z:LX3/b;

    .line 15
    .line 16
    return-void
.end method

.method public setOnItemLongClickListener(LX3/c;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "Cannot set item click listener, setAdapter has already been called."

    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->i(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lcom/zte/mifavor/androidx/widget/RecyclerView$e;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView$e;-><init>(Lcom/zte/mifavor/androidx/widget/RecyclerView;LX3/c;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->A:LX3/c;

    .line 15
    .line 16
    return-void
.end method

.method public setOnItemMenuClickListener(LX3/d;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "Cannot set menu item click listener, setAdapter has already been called."

    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->i(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lcom/zte/mifavor/androidx/widget/RecyclerView$f;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView$f;-><init>(Lcom/zte/mifavor/androidx/widget/RecyclerView;LX3/d;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->y:LX3/d;

    .line 15
    .line 16
    return-void
.end method

.method public setOnItemMoveListener(LY3/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->x:LY3/a;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, LY3/a;->C(LY3/c;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setOnItemMovementListener(LY3/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->x:LY3/a;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, LY3/a;->D(LY3/d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setOnItemStateChangedListener(LY3/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->x:LY3/a;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, LY3/a;->E(LY3/e;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setSlipAmplitude(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "Z#SQScrollRV"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "setSlipAmplitude slipAmplitude = "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lb4/e;->D(F)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p0

    .line 34
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public setStiffness(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "Z#SQScrollRV"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "setStiffness stiffness = "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lb4/e;->F(F)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p0

    .line 34
    invoke-virtual {p0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public setSwipeContentIsCard(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->N:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSwipeMenuCreator(LX3/f;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string p1, "Cannot set menu creator, setAdapter has already been called."

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/zte/mifavor/androidx/widget/RecyclerView;->i(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setUseSpring(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->k:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    :goto_0
    iput-boolean p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->g:Lb4/e;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lb4/e;->B(Z)V

    .line 17
    .line 18
    .line 19
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v0, "setUseSpring mIsUseSpring = "

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView;->j:Z

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "Z#SQScrollRV"

    .line 39
    .line 40
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return-void
.end method
