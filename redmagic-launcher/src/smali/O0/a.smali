.class public LO0/a;
.super Ljava/lang/Object;
.source "AccessibleDragListenerAdapter.kt"

# interfaces
.implements Lcom/android/launcher3/dragndrop/j$b;
.implements Landroid/view/ViewGroup$OnHierarchyChangeListener;


# instance fields
.field private final g:Landroid/view/ViewGroup;

.field private final h:Ljava/util/function/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Function<",
            "Lcom/android/launcher3/CellLayout;",
            "LO0/d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Ljava/util/function/Function;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Ljava/util/function/Function<",
            "Lcom/android/launcher3/CellLayout;",
            "LO0/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "mViewGroup"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "mDelegateFactory"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, LO0/a;->g:Landroid/view/ViewGroup;

    .line 15
    .line 16
    iput-object p2, p0, LO0/a;->h:Ljava/util/function/Function;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 1

    .line 1
    const-string v0, "dragObject"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "options"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, LO0/a;->g:Landroid/view/ViewGroup;

    .line 12
    .line 13
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 14
    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    invoke-virtual {p0, p2, p1}, LO0/a;->a(ZLcom/android/launcher3/n0$a;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method protected a(ZLcom/android/launcher3/n0$a;)V
    .locals 3

    .line 1
    iget-object p2, p0, LO0/a;->g:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    if-ge v0, p2, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, LO0/a;->g:Landroid/view/ViewGroup;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "null cannot be cast to non-null type com.android.launcher3.CellLayout"

    .line 17
    .line 18
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    check-cast v1, Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    invoke-virtual {p0, v1, p1}, LO0/a;->b(Lcom/android/launcher3/CellLayout;Z)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method protected final b(Lcom/android/launcher3/CellLayout;Z)V
    .locals 1

    .line 1
    const-string v0, "layout"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, LO0/a;->h:Ljava/util/function/Function;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, LO0/d;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-virtual {p1, p0}, Lcom/android/launcher3/CellLayout;->setDragAndDropAccessibilityDelegate(LO0/d;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onChildViewAdded(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "parent"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "child"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, LO0/a;->g:Landroid/view/ViewGroup;

    .line 12
    .line 13
    if-ne p1, v0, :cond_0

    .line 14
    .line 15
    check-cast p2, Lcom/android/launcher3/CellLayout;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p2, p1}, LO0/a;->b(Lcom/android/launcher3/CellLayout;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onChildViewRemoved(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "parent"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "child"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, LO0/a;->g:Landroid/view/ViewGroup;

    .line 12
    .line 13
    if-ne p1, v0, :cond_0

    .line 14
    .line 15
    check-cast p2, Lcom/android/launcher3/CellLayout;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p2, p1}, LO0/a;->b(Lcom/android/launcher3/CellLayout;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    iget-object v0, p0, LO0/a;->g:Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, LO0/a;->a(ZLcom/android/launcher3/n0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, LO0/a;->g:Landroid/view/ViewGroup;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "null cannot be cast to non-null type com.android.launcher3.views.ActivityContext"

    .line 22
    .line 23
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 27
    .line 28
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->N(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method
