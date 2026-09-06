.class public Lcom/android/launcher3/allapps/r$e;
.super Ljava/lang/Object;
.source "ActivityAllAppsContainerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/allapps/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field private final a:I

.field public final b:Lcom/android/launcher3/allapps/O;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/O<",
            "TT;>;"
        }
    .end annotation
.end field

.field final c:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

.field final d:Lcom/android/launcher3/allapps/M;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/M<",
            "TT;>;"
        }
    .end annotation
.end field

.field final e:Landroid/graphics/Rect;

.field f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

.field private g:Landroid/view/View$OnFocusChangeListener;

.field final synthetic h:Lcom/android/launcher3/allapps/r;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/r;ILcom/android/launcher3/allapps/M;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/android/launcher3/allapps/M<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/allapps/r$e;->e:Landroid/graphics/Rect;

    .line 12
    .line 13
    iput p2, p0, Lcom/android/launcher3/allapps/r$e;->a:I

    .line 14
    .line 15
    iput-object p3, p0, Lcom/android/launcher3/allapps/r$e;->d:Lcom/android/launcher3/allapps/M;

    .line 16
    .line 17
    invoke-virtual {p1, p3}, Lcom/android/launcher3/allapps/r;->K(Lcom/android/launcher3/allapps/M;)Lcom/android/launcher3/allapps/O;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/android/launcher3/allapps/r$e;->b:Lcom/android/launcher3/allapps/O;

    .line 22
    .line 23
    invoke-virtual {p3, p1}, Lcom/android/launcher3/allapps/M;->p(Lcom/android/launcher3/allapps/O;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/O;->i()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/android/launcher3/allapps/r$e;->c:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/allapps/O$a;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 2
    .line 3
    const/16 v0, 0x40

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

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

.method static bridge synthetic b(Lcom/android/launcher3/allapps/r$e;)Landroid/view/View$OnFocusChangeListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->g:Landroid/view/View$OnFocusChangeListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private d()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/r$e;->a:I

    .line 2
    .line 3
    if-nez p0, :cond_0

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

.method private e()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/r$e;->a:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private f()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/r$e;->a:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method


# virtual methods
.method c()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r$e;->f()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/y0;->w()Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/android/launcher3/allapps/r;->z(Lcom/android/launcher3/allapps/r;)Landroid/graphics/Rect;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 29
    .line 30
    iget-object v2, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/android/launcher3/allapps/r;->l:Lcom/android/launcher3/allapps/y0;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/y0;->w()Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    add-int/2addr v0, v2

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r$e;->d()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/android/launcher3/allapps/r;->m:Lcom/android/launcher3/allapps/i0;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/allapps/r$e;->d:Lcom/android/launcher3/allapps/M;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v2, Lcom/android/launcher3/allapps/s;

    .line 67
    .line 68
    invoke-direct {v2}, Lcom/android/launcher3/allapps/s;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    iget-object v0, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 86
    .line 87
    invoke-static {v0}, Lcom/android/launcher3/allapps/r;->A(Lcom/android/launcher3/allapps/r;)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    goto :goto_0

    .line 92
    :cond_1
    move v0, v1

    .line 93
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 94
    .line 95
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/r;->X()Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_2

    .line 100
    .line 101
    iget-object v2, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 102
    .line 103
    iget-object v2, v2, Lcom/android/launcher3/allapps/r;->H:Landroid/view/View;

    .line 104
    .line 105
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    add-int/2addr v0, v2

    .line 110
    :cond_2
    iget-object v2, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 111
    .line 112
    iget-object v2, v2, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 113
    .line 114
    check-cast v2, Lcom/android/launcher3/views/k;

    .line 115
    .line 116
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->P0:Z

    .line 121
    .line 122
    if-eqz v2, :cond_3

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 126
    .line 127
    iget-object v1, v1, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 128
    .line 129
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 130
    .line 131
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    iget-object v1, v1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 136
    .line 137
    iget v1, v1, Lcom/android/launcher3/r4;->R:I

    .line 138
    .line 139
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$e;->e:Landroid/graphics/Rect;

    .line 142
    .line 143
    iget v3, p0, Landroid/graphics/Rect;->left:I

    .line 144
    .line 145
    iget v4, p0, Landroid/graphics/Rect;->top:I

    .line 146
    .line 147
    iget v5, p0, Landroid/graphics/Rect;->right:I

    .line 148
    .line 149
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 150
    .line 151
    add-int/2addr p0, v0

    .line 152
    add-int/2addr p0, v1

    .line 153
    invoke-virtual {v2, v3, v4, v5, p0}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 154
    .line 155
    .line 156
    :cond_4
    return-void
.end method

.method g(Landroid/view/View;Ljava/util/function/Predicate;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/r$e;->d:Lcom/android/launcher3/allapps/M;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lcom/android/launcher3/allapps/M;->t(Ljava/util/function/Predicate;)V

    .line 4
    .line 5
    .line 6
    check-cast p1, Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 9
    .line 10
    iget-object p2, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 11
    .line 12
    iget-object p2, p2, Lcom/android/launcher3/allapps/r;->F:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 13
    .line 14
    sget-object v0, Lcom/android/launcher3/views/RecyclerViewFastScroller$c;->i:Lcom/android/launcher3/views/RecyclerViewFastScroller$c;

    .line 15
    .line 16
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/s0;->b(Lcom/android/launcher3/views/RecyclerViewFastScroller;Lcom/android/launcher3/views/RecyclerViewFastScroller$c;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 20
    .line 21
    iget-object p2, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/android/launcher3/views/SpringRelativeLayout;->g()Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setEdgeEffectFactory(Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 31
    .line 32
    iget-object p2, p0, Lcom/android/launcher3/allapps/r$e;->d:Lcom/android/launcher3/allapps/M;

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->setApps(Lcom/android/launcher3/allapps/M;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 38
    .line 39
    iget-object p2, p0, Lcom/android/launcher3/allapps/r$e;->c:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 45
    .line 46
    iget-object p2, p0, Lcom/android/launcher3/allapps/r$e;->b:Lcom/android/launcher3/allapps/O;

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/android/launcher3/allapps/r$e;->b:Lcom/android/launcher3/allapps/O;

    .line 52
    .line 53
    iget-object p2, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Lcom/android/launcher3/allapps/O;->v(Lcom/android/launcher3/allapps/AllAppsRecyclerView;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 59
    .line 60
    const/4 p2, 0x1

    .line 61
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 65
    .line 66
    const/4 p2, 0x0

    .line 67
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/allapps/r$e;->h:Lcom/android/launcher3/allapps/r;

    .line 71
    .line 72
    iget-object p2, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 73
    .line 74
    invoke-virtual {p1, p2}, Lcom/android/launcher3/allapps/r;->m0(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0}, Lcom/android/launcher3/allapps/r$e;->e()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_0

    .line 82
    .line 83
    new-instance p1, Lv1/b;

    .line 84
    .line 85
    new-instance p2, Lcom/android/launcher3/keyboard/b;

    .line 86
    .line 87
    iget-object v0, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 88
    .line 89
    invoke-direct {p2, v0}, Lcom/android/launcher3/keyboard/b;-><init>(Landroid/view/View;)V

    .line 90
    .line 91
    .line 92
    invoke-direct {p1, p2}, Lv1/b;-><init>(Lv1/a;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_0
    new-instance p1, Lv1/b;

    .line 97
    .line 98
    iget-object p2, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 99
    .line 100
    invoke-direct {p1, p2}, Lv1/b;-><init>(Landroid/view/View;)V

    .line 101
    .line 102
    .line 103
    :goto_0
    iget-object p2, p0, Lcom/android/launcher3/allapps/r$e;->f:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 104
    .line 105
    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Lv1/b;->a()Landroid/view/View$OnFocusChangeListener;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iput-object p1, p0, Lcom/android/launcher3/allapps/r$e;->g:Landroid/view/View$OnFocusChangeListener;

    .line 113
    .line 114
    iget-object p2, p0, Lcom/android/launcher3/allapps/r$e;->b:Lcom/android/launcher3/allapps/O;

    .line 115
    .line 116
    invoke-virtual {p2, p1}, Lcom/android/launcher3/allapps/O;->setIconFocusListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r$e;->c()V

    .line 120
    .line 121
    .line 122
    return-void
.end method
