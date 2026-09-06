.class public Lcom/android/launcher3/widget/picker/Y;
.super Ljava/lang/Object;
.source "WidgetsListExpandActionViewHolderBinder.java"

# interfaces
.implements LG1/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LG1/e<",
        "Lm2/k;",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field a:Landroid/view/View$OnClickListener;

.field private final b:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Landroid/view/LayoutInflater;Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/Y;->b:Landroid/view/LayoutInflater;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/picker/Y;->a:Landroid/view/View$OnClickListener;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/picker/Y$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/Y;->b:Landroid/view/LayoutInflater;

    .line 4
    .line 5
    const v2, 0x7f0e0269

    .line 6
    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/widget/picker/Y$a;-><init>(Lcom/android/launcher3/widget/picker/Y;Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public bridge synthetic c(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Ljava/lang/Object;ILjava/util/List;)V
    .locals 0

    .line 1
    check-cast p2, Lm2/k;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/picker/Y;->d(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Lm2/k;ILjava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Lm2/k;ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
            "Lm2/k;",
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
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/Y;->a:Landroid/view/View$OnClickListener;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
