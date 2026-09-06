.class public final LG1/d;
.super Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;
.source "AllAppsRecyclerViewPool.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LG1/d$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;"
    }
.end annotation


# static fields
.field public static final c:LG1/d$a;


# instance fields
.field private a:Z

.field private b:Lcom/android/launcher3/util/w;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/w<",
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LG1/d$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LG1/d$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LG1/d;->c:LG1/d$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(LG1/d;Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, LG1/d;->g(LG1/d;Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic b(Lu4/a;LG1/d;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LG1/d;->i(Lu4/a;LG1/d;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(ILkotlin/jvm/internal/C;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;I)Ljava/util/List;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, LG1/d;->h(ILkotlin/jvm/internal/C;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;I)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final g(LG1/d;Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LG1/d;->d(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static final h(ILkotlin/jvm/internal/C;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;I)Ljava/util/List;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    if-ge v1, p0, :cond_2

    .line 8
    .line 9
    iget-object v2, p1, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v2, Lcom/android/launcher3/util/w;

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/android/launcher3/util/w;->f()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x1

    .line 20
    if-ne v2, v3, :cond_0

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 30
    .line 31
    .line 32
    return-object v0

    .line 33
    :cond_1
    :try_start_0
    invoke-virtual {p3, p2, p4}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->createViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/view/InflateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catch_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-object v0
.end method

.method private static final i(Lu4/a;LG1/d;Ljava/util/List;)V
    .locals 2

    .line 1
    const-string v0, "viewHolders"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/Number;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    const/4 v0, 0x0

    .line 25
    :goto_0
    if-ge v0, p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->putRecycledView(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 34
    .line 35
    .line 36
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->clear()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, LG1/d;->b:Lcom/android/launcher3/util/w;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/util/w;->e()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final d(Landroid/content/Context;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
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
    move-object v0, p1

    .line 7
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v0, v0, Lcom/android/launcher3/h0;->M2:I

    .line 14
    .line 15
    mul-int/lit8 v0, v0, 0x4

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    add-int/2addr v0, v1

    .line 19
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->z0()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget p1, p1, Lcom/android/launcher3/h0;->M2:I

    .line 34
    .line 35
    mul-int/2addr v2, p1

    .line 36
    add-int/2addr v0, v2

    .line 37
    iget-boolean p1, p0, LG1/d;->a:Z

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    mul-int/lit8 v0, v0, 0x2

    .line 42
    .line 43
    :cond_0
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->getRecycledViewCount(I)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    sub-int/2addr v0, p0

    .line 48
    return v0
.end method

.method public final e(Landroid/content/Context;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
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
    move-object v0, p1

    .line 7
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    if-nez v4, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-virtual {p0, p1}, LG1/d;->d(Landroid/content/Context;)I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    if-gtz v5, :cond_2

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_2
    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    sget-object p0, Lcom/android/launcher3/N;->b:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    const-string p1, "activeRv\'s layoutManager should not be null"

    .line 43
    .line 44
    if-nez p0, :cond_3

    .line 45
    .line 46
    const-string p0, "AllAppsRecyclerViewPool"

    .line 47
    .line 48
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 53
    .line 54
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    throw p0

    .line 58
    :cond_4
    new-instance v0, Landroid/view/ContextThemeWrapper;

    .line 59
    .line 60
    invoke-static {p1}, Lcom/android/launcher3/util/F2;->a(Landroid/content/Context;)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-direct {v0, p1, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Landroid/view/ContextThemeWrapper;->applyOverrideConfiguration(Landroid/content/res/Configuration;)V

    .line 76
    .line 77
    .line 78
    move-object v1, p1

    .line 79
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 80
    .line 81
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v1, v0}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    new-instance v2, LG1/d$b;

    .line 94
    .line 95
    invoke-direct {v2, p1, v0}, LG1/d$b;-><init>(Landroid/content/Context;Landroid/view/LayoutInflater;)V

    .line 96
    .line 97
    .line 98
    new-instance v6, LG1/a;

    .line 99
    .line 100
    invoke-direct {v6, p0, p1}, LG1/a;-><init>(LG1/d;Landroid/content/Context;)V

    .line 101
    .line 102
    .line 103
    const/4 v3, 0x2

    .line 104
    move-object v1, p0

    .line 105
    invoke-virtual/range {v1 .. v6}, LG1/d;->f(Landroidx/recyclerview/widget/RecyclerView$Adapter;ILandroidx/recyclerview/widget/RecyclerView;ILu4/a;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final f(Landroidx/recyclerview/widget/RecyclerView$Adapter;ILandroidx/recyclerview/widget/RecyclerView;ILu4/a;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "*>;I",
            "Landroidx/recyclerview/widget/RecyclerView;",
            "I",
            "Lu4/a<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p5

    .line 2
    .line 3
    const-string v1, "adapter"

    .line 4
    .line 5
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "activeRv"

    .line 9
    .line 10
    invoke-static {p3, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v1, "preInflationCountProvider"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    if-gtz p4, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v1, p0, LG1/d;->b:Lcom/android/launcher3/util/w;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/android/launcher3/util/w;->e()V

    .line 26
    .line 27
    .line 28
    :cond_1
    new-instance v4, Lkotlin/jvm/internal/C;

    .line 29
    .line 30
    invoke-direct {v4}, Lkotlin/jvm/internal/C;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v1, Lcom/android/launcher3/util/w;

    .line 34
    .line 35
    new-instance v2, LG1/b;

    .line 36
    .line 37
    move-object v6, p1

    .line 38
    move v7, p2

    .line 39
    move-object v5, p3

    .line 40
    move/from16 v3, p4

    .line 41
    .line 42
    invoke-direct/range {v2 .. v7}, LG1/b;-><init>(ILkotlin/jvm/internal/C;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;I)V

    .line 43
    .line 44
    .line 45
    sget-object v7, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 46
    .line 47
    const-string p1, "MAIN_EXECUTOR"

    .line 48
    .line 49
    invoke-static {v7, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance v8, LG1/c;

    .line 53
    .line 54
    invoke-direct {v8, v0, p0}, LG1/c;-><init>(Lu4/a;LG1/d;)V

    .line 55
    .line 56
    .line 57
    const/16 v10, 0x8

    .line 58
    .line 59
    const/4 v11, 0x0

    .line 60
    const/4 v9, 0x0

    .line 61
    move-object v5, v1

    .line 62
    move-object v6, v2

    .line 63
    invoke-direct/range {v5 .. v11}, Lcom/android/launcher3/util/w;-><init>(Ljava/util/function/Supplier;Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;Ljava/lang/Runnable;ILkotlin/jvm/internal/j;)V

    .line 64
    .line 65
    .line 66
    iput-object v5, v4, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 67
    .line 68
    iput-object v5, p0, LG1/d;->b:Lcom/android/launcher3/util/w;

    .line 69
    .line 70
    sget-object p0, Lcom/android/launcher3/util/m0;->g:Ljava/util/concurrent/ExecutorService;

    .line 71
    .line 72
    invoke-interface {p0, v5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final j(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LG1/d;->a:Z

    .line 2
    .line 3
    return-void
.end method
