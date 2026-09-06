.class public Ld4/e;
.super Ljava/lang/Object;
.source "RecyclerViewOverScrollDecorAdapter.java"

# interfaces
.implements Ld4/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ld4/e$b;,
        Ld4/e$a;,
        Ld4/e$c;
    }
.end annotation


# instance fields
.field protected final a:Landroidx/recyclerview/widget/RecyclerView;

.field protected final b:Ld4/e$a;

.field protected c:Z


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ld4/e;->c:Z

    .line 6
    .line 7
    iput-object p1, p0, Ld4/e;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    instance-of v0, p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->G()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    instance-of v0, p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    check-cast p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->G()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    instance-of v0, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    check-cast p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 p1, 0x1

    .line 47
    :goto_0
    if-nez p1, :cond_3

    .line 48
    .line 49
    new-instance p1, Ld4/e$b;

    .line 50
    .line 51
    invoke-direct {p1, p0}, Ld4/e$b;-><init>(Ld4/e;)V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Ld4/e;->b:Ld4/e$a;

    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    new-instance p1, Ld4/e$c;

    .line 58
    .line 59
    invoke-direct {p1, p0}, Ld4/e$c;-><init>(Ld4/e;)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Ld4/e;->b:Ld4/e$a;

    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ld4/e;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ld4/e;->b:Ld4/e$a;

    .line 6
    .line 7
    invoke-interface {p0}, Ld4/e$a;->a()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

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

.method public b()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ld4/e;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ld4/e;->b:Ld4/e$a;

    .line 6
    .line 7
    invoke-interface {p0}, Ld4/e$a;->b()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

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

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ld4/e;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    return-object p0
.end method
