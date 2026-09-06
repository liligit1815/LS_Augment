.class public Lcom/android/launcher3/widget/v0;
.super Lcom/android/launcher3/widget/C;
.source "MoreWidgetListAdapter.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/LayoutInflater;Ls1/P;Lcom/android/launcher3/widget/ComponentsFullSheet;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/widget/C;-><init>(Landroid/content/Context;Landroid/view/LayoutInflater;Ls1/P;Lcom/android/launcher3/widget/ComponentsFullSheet;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Lcom/android/launcher3/widget/v0;Lm2/g;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/v0;->t(Lm2/g;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic t(Lm2/g;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/widget/v;

    .line 4
    .line 5
    const/4 v1, 0x3

    .line 6
    invoke-direct {v0, p1, v1}, Lcom/android/launcher3/widget/v;-><init>(Lm2/g;I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public m(Lcom/android/launcher3/widget/i;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Lcom/android/launcher3/widget/v;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, p2, p0, v0}, Lcom/android/launcher3/widget/i;->b(Lcom/android/launcher3/widget/v;Lcom/android/launcher3/widget/C;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public n(Landroid/view/ViewGroup;I)Lcom/android/launcher3/widget/i;
    .locals 2

    .line 1
    new-instance p2, Lcom/android/launcher3/widget/M0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->a:Landroid/view/LayoutInflater;

    .line 4
    .line 5
    const v0, 0x7f0e023d

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/M0;-><init>(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-object p2
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/i;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/v0;->m(Lcom/android/launcher3/widget/i;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/v0;->n(Landroid/view/ViewGroup;I)Lcom/android/launcher3/widget/i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lm2/g;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/launcher3/widget/C;->c:Ljava/util/ArrayList;

    .line 26
    .line 27
    :cond_1
    new-instance v0, Lcom/android/launcher3/widget/C$a;

    .line 28
    .line 29
    invoke-direct {v0}, Lcom/android/launcher3/widget/C$a;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Lcom/android/launcher3/widget/picker/k;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v0, v1, p1}, Lcom/android/launcher3/widget/picker/k;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-static {v0, v1}, Landroidx/recyclerview/widget/e;->b(Landroidx/recyclerview/widget/e$b;Z)Landroidx/recyclerview/widget/e$e;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/e$e;->c(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/android/launcher3/widget/C;->b:Ljava/util/ArrayList;

    .line 61
    .line 62
    new-instance v0, Lcom/android/launcher3/widget/u0;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/u0;-><init>(Lcom/android/launcher3/widget/v0;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 71
    .line 72
    .line 73
    return-void
.end method
