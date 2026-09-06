.class public LP0/f;
.super LP0/g;
.source "DefaultSearchAdapterProvider.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "LP0/g<",
        "Lcom/android/launcher3/views/k;",
        ">;"
    }
.end annotation


# instance fields
.field private b:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/views/k;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LP0/g;-><init>(Lcom/android/launcher3/views/k;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, LP0/f;->b:Landroid/view/View;

    .line 3
    .line 4
    return-void
.end method

.method public d(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public e()Z
    .locals 4

    .line 1
    iget-object v0, p0, LP0/f;->b:Landroid/view/View;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, LP0/f;->b:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    iget-object v1, p0, LP0/g;->a:Lcom/android/launcher3/views/k;

    .line 25
    .line 26
    iget-object p0, p0, LP0/f;->b:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-interface {v1, p0, v3, v0}, Lcom/android/launcher3/views/k;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_0
    return v2
.end method

.method public f(Lcom/android/launcher3/allapps/O$b;I)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 4
    .line 5
    iput-object p1, p0, LP0/f;->b:Landroid/view/View;

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;I)Lcom/android/launcher3/allapps/O$b;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
