.class public Lcom/android/launcher3/widget/picker/f0;
.super Ljava/lang/Object;
.source "WidgetsSpaceViewHolderBinder.java"

# interfaces
.implements LG1/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LG1/e<",
        "Lm2/a;",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Ljava/util/function/IntSupplier;


# direct methods
.method public constructor <init>(Ljava/util/function/IntSupplier;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/f0;->a:Ljava/util/function/IntSupplier;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/picker/f0$a;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/views/StickyHeaderLayout$b;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {v1, p1}, Lcom/android/launcher3/views/StickyHeaderLayout$b;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/widget/picker/f0$a;-><init>(Lcom/android/launcher3/widget/picker/f0;Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public bridge synthetic c(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Ljava/lang/Object;ILjava/util/List;)V
    .locals 0

    .line 1
    check-cast p2, Lm2/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/picker/f0;->d(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Lm2/a;ILjava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Lm2/a;ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
            "Lm2/a;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/views/StickyHeaderLayout$b;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/f0;->a:Ljava/util/function/IntSupplier;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/function/IntSupplier;->getAsInt()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {p1, p0}, Lcom/android/launcher3/views/StickyHeaderLayout$b;->d(I)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
