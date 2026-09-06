.class public final Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;
.super Ljava/lang/Object;
.source "WidgetsFullSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/picker/WidgetsFullSheet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "c"
.end annotation


# instance fields
.field public final a:I

.field public final b:Lcom/android/launcher3/widget/picker/T;

.field private final c:Landroidx/recyclerview/widget/DefaultItemAnimator;

.field d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

.field e:Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;

.field final synthetic f:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;I)V
    .locals 8

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->f:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->a:I

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v0, Lcom/android/launcher3/widget/picker/T;

    .line 13
    .line 14
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    new-instance v3, Lcom/android/launcher3/widget/picker/z;

    .line 19
    .line 20
    invoke-direct {v3, p0}, Lcom/android/launcher3/widget/picker/z;-><init>(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->v1()Z

    .line 24
    .line 25
    .line 26
    move-result v7

    .line 27
    move-object v5, p1

    .line 28
    move-object v6, p1

    .line 29
    move-object v4, p1

    .line 30
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/widget/picker/T;-><init>(Landroid/content/Context;Landroid/view/LayoutInflater;Ljava/util/function/IntSupplier;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;Lcom/android/launcher3/widget/picker/T$b;Z)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->setHasStableIds(Z)V

    .line 37
    .line 38
    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    if-eq p2, p1, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-static {v4}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Ljava/util/function/Predicate;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/picker/T;->W(Ljava/util/function/Predicate;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-static {v4}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->j1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Ljava/util/function/Predicate;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/picker/T;->W(Ljava/util/function/Predicate;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    new-instance p1, Lcom/android/launcher3/widget/picker/c0;

    .line 60
    .line 61
    invoke-direct {p1}, Lcom/android/launcher3/widget/picker/c0;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->c:Landroidx/recyclerview/widget/DefaultItemAnimator;

    .line 65
    .line 66
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->c()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->f:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->k1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Lcom/android/launcher3/views/StickyHeaderLayout;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->f:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->k1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Lcom/android/launcher3/views/StickyHeaderLayout;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/views/StickyHeaderLayout;->getHeaderHeight()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method private d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method e(Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->f:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->n1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Landroid/view/ViewOutlineProvider;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToOutline(Z)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->f:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->G0:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 36
    .line 37
    sget-object v2, Lcom/android/launcher3/views/RecyclerViewFastScroller$c;->j:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    .line 38
    .line 39
    invoke-virtual {p1, v1, v2}, Lcom/android/launcher3/s0;->b(Lcom/android/launcher3/views/RecyclerViewFastScroller;Lcom/android/launcher3/views/RecyclerViewFastScroller$c;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->f:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->v1()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->c:Landroidx/recyclerview/widget/DefaultItemAnimator;

    .line 55
    .line 56
    :goto_0
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->f:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 62
    .line 63
    invoke-virtual {p1, v1}, Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;->setHeaderViewDimensionsProvider(Lcom/android/launcher3/widget/picker/WidgetsRecyclerView$a;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->f:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->v1()Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-nez p1, :cond_1

    .line 73
    .line 74
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->f:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 77
    .line 78
    invoke-static {v1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->o1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Landroid/view/ViewGroup;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Lcom/android/launcher3/views/SpringRelativeLayout;

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/android/launcher3/views/SpringRelativeLayout;->g()Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setEdgeEffectFactory(Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    iget p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->a:I

    .line 92
    .line 93
    if-eqz p1, :cond_2

    .line 94
    .line 95
    if-ne p1, v0, :cond_3

    .line 96
    .line 97
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 98
    .line 99
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->f:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 100
    .line 101
    invoke-static {v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->i1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet;)Landroid/view/View$OnAttachStateChangeListener;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 106
    .line 107
    .line 108
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 109
    .line 110
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->f:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 111
    .line 112
    iget p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->v0:I

    .line 113
    .line 114
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/picker/T;->Y(I)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public f(Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->e:Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/T;->Z(Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
