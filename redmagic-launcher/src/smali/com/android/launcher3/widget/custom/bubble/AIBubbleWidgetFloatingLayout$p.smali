.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "AIBubbleWidgetFloatingLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "p"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$q;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;Lcom/android/launcher3/widget/custom/bubble/y;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)V

    return-void
.end method


# virtual methods
.method public f(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$q;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->l(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->l(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    instance-of v0, v0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->l(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const v2, 0x7f0b008a

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v2, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->t(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->t(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Ljava/util/ArrayList;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    const/4 v1, 0x1

    .line 67
    sub-int/2addr v0, v1

    .line 68
    if-ne p2, v0, :cond_1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    const/4 v1, 0x0

    .line 72
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 73
    .line 74
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->t(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Ljava/util/ArrayList;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, v1, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$q;->a(ZLjava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public g(Landroid/view/ViewGroup;I)Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$q;
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    if-ne p2, p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$n;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const v1, 0x7f0e003d

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$n;-><init>(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    new-instance p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$o;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    const v1, 0x7f0e003e

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$o;-><init>(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    return-object p0
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->t(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->t(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    instance-of p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x2

    .line 18
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$q;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;->f(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$q;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$p;->g(Landroid/view/ViewGroup;I)Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$q;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
