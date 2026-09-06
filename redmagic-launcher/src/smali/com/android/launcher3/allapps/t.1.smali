.class public Lcom/android/launcher3/allapps/t;
.super Ljava/lang/Object;
.source "AllAppsFastScrollHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/allapps/t$a;
    }
.end annotation


# instance fields
.field private a:I

.field private b:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

.field private c:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/allapps/AllAppsRecyclerView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/launcher3/allapps/t;->a:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/allapps/t;->b:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 8
    .line 9
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/allapps/t;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/t;->c:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/allapps/t;)Lcom/android/launcher3/allapps/AllAppsRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/t;->b:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/allapps/t;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/t;->a:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/allapps/t;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/t;->c:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/allapps/t;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/t;->h(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h(Z)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/t;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public g()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/android/launcher3/allapps/t;->a:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/t;->h(Z)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/allapps/t;->c:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 10
    .line 11
    return-void
.end method

.method public i(Lcom/android/launcher3/allapps/M$a;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/t;->a:I

    .line 2
    .line 3
    iget p1, p1, Lcom/android/launcher3/allapps/M$a;->b:I

    .line 4
    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/android/launcher3/allapps/t;->a:I

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/allapps/t;->b:Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Lcom/android/launcher3/allapps/t$a;

    .line 17
    .line 18
    iget v1, p0, Lcom/android/launcher3/allapps/t;->a:I

    .line 19
    .line 20
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/allapps/t$a;-><init>(Lcom/android/launcher3/allapps/t;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->startSmoothScroll(Landroidx/recyclerview/widget/RecyclerView$SmoothScroller;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
