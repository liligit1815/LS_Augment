.class public final Lcom/android/launcher3/widget/picker/X;
.super Ljava/lang/Object;
.source "WidgetsListEnterViewHolderBinder.java"

# interfaces
.implements LG1/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LG1/e<",
        "Lm2/j;",
        "Lcom/android/launcher3/widget/picker/V;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Landroid/view/LayoutInflater;

.field private final b:Lcom/android/launcher3/widget/picker/b;

.field private c:Z

.field private d:Z


# direct methods
.method public constructor <init>(Landroid/view/LayoutInflater;Lcom/android/launcher3/widget/picker/b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/widget/picker/X;->c:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/widget/picker/X;->d:Z

    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/X;->a:Landroid/view/LayoutInflater;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/android/launcher3/widget/picker/X;->b:Lcom/android/launcher3/widget/picker/b;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/widget/picker/X;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/X;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/X;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/widget/picker/X;->c:Z

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/android/launcher3/widget/picker/V;

    .line 14
    .line 15
    iget-boolean v1, p0, Lcom/android/launcher3/widget/picker/X;->d:Z

    .line 16
    .line 17
    xor-int/2addr v0, v1

    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v2, "onEnterRowClick: should expand: "

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "WidgetsListEnterViewHolderBinder"

    .line 36
    .line 37
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/picker/X;->h(Lcom/android/launcher3/widget/picker/V;Z)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/X;->b:Lcom/android/launcher3/widget/picker/b;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-interface {p1, v0, v1}, Lcom/android/launcher3/widget/picker/b;->d(ZLcom/android/launcher3/util/L1;)V

    .line 49
    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    iput-boolean p1, p0, Lcom/android/launcher3/widget/picker/X;->c:Z

    .line 53
    .line 54
    return-void
.end method

.method private h(Lcom/android/launcher3/widget/picker/V;Z)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/android/launcher3/widget/picker/X;->d:Z

    .line 2
    .line 3
    iget-object p0, p1, Lcom/android/launcher3/widget/picker/V;->b:Landroid/widget/ImageView;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const p1, 0x7f080b54

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const p1, 0x7f080b56

    .line 12
    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 15
    .line 16
    .line 17
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public bridge synthetic b(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/X;->f(Landroid/view/ViewGroup;)Lcom/android/launcher3/widget/picker/V;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic c(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Ljava/lang/Object;ILjava/util/List;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/picker/V;

    .line 2
    .line 3
    check-cast p2, Lm2/j;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/picker/X;->e(Lcom/android/launcher3/widget/picker/V;Lm2/j;ILjava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e(Lcom/android/launcher3/widget/picker/V;Lm2/j;ILjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/widget/picker/V;",
            "Lm2/j;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p3, p0, Lcom/android/launcher3/widget/picker/X;->d:Z

    .line 7
    .line 8
    if-eqz p4, :cond_1

    .line 9
    .line 10
    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p4

    .line 20
    :cond_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    instance-of v1, v0, Ljava/lang/Boolean;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    check-cast v0, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    iput-boolean p3, p0, Lcom/android/launcher3/widget/picker/X;->d:Z

    .line 41
    .line 42
    :cond_1
    invoke-direct {p0, p1, p3}, Lcom/android/launcher3/widget/picker/X;->h(Lcom/android/launcher3/widget/picker/V;Z)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/V;->b:Landroid/widget/ImageView;

    .line 46
    .line 47
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    new-instance p1, Lcom/android/launcher3/widget/picker/W;

    .line 55
    .line 56
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/picker/W;-><init>(Lcom/android/launcher3/widget/picker/X;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public f(Landroid/view/ViewGroup;)Lcom/android/launcher3/widget/picker/V;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/picker/V;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/X;->a:Landroid/view/LayoutInflater;

    .line 4
    .line 5
    const v1, 0x7f0e014f

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/picker/V;-><init>(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method
