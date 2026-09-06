.class public final Lcom/android/launcher3/widget/picker/b0;
.super Ljava/lang/Object;
.source "WidgetsListHeaderViewHolderBinder.java"

# interfaces
.implements LG1/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LG1/e<",
        "Lm2/o;",
        "Lcom/android/launcher3/widget/picker/Z;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Landroid/view/LayoutInflater;

.field private final b:Lcom/android/launcher3/widget/picker/b;

.field private final c:Z


# direct methods
.method public constructor <init>(Landroid/view/LayoutInflater;Lcom/android/launcher3/widget/picker/b;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/b0;->a:Landroid/view/LayoutInflater;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/picker/b0;->b:Lcom/android/launcher3/widget/picker/b;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/launcher3/widget/picker/b0;->c:Z

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/widget/picker/b0;Lcom/android/launcher3/widget/picker/WidgetsListHeader;Lm2/o;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/picker/b0;->f(Lcom/android/launcher3/widget/picker/WidgetsListHeader;Lm2/o;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic f(Lcom/android/launcher3/widget/picker/WidgetsListHeader;Lm2/o;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p3, p0, Lcom/android/launcher3/widget/picker/b0;->c:Z

    .line 2
    .line 3
    if-nez p3, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->d()Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p3, 0x0

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const/4 p3, 0x1

    .line 15
    :goto_1
    invoke-virtual {p1, p3}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->setExpanded(Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/b0;->b:Lcom/android/launcher3/widget/picker/b;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->d()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object p2, p2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 25
    .line 26
    invoke-static {p2}, Lcom/android/launcher3/util/L1;->d(Lcom/android/launcher3/model/data/B;)Lcom/android/launcher3/util/L1;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-interface {p0, p1, p2}, Lcom/android/launcher3/widget/picker/b;->d(ZLcom/android/launcher3/util/L1;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public bridge synthetic b(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/b0;->g(Landroid/view/ViewGroup;)Lcom/android/launcher3/widget/picker/Z;

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
    check-cast p1, Lcom/android/launcher3/widget/picker/Z;

    .line 2
    .line 3
    check-cast p2, Lm2/o;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/picker/b0;->e(Lcom/android/launcher3/widget/picker/Z;Lm2/o;ILjava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e(Lcom/android/launcher3/widget/picker/Z;Lm2/o;ILjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/widget/picker/Z;",
            "Lm2/o;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/Z;->a:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->c(Lm2/o;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Lm2/o;->u()Z

    .line 7
    .line 8
    .line 9
    move-result p4

    .line 10
    invoke-virtual {p1, p4}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->setExpanded(Z)V

    .line 11
    .line 12
    .line 13
    and-int/lit8 p4, p3, 0x1

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    const/4 v1, 0x1

    .line 17
    if-eqz p4, :cond_0

    .line 18
    .line 19
    move p4, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move p4, v0

    .line 22
    :goto_0
    and-int/lit8 p3, p3, 0x2

    .line 23
    .line 24
    if-eqz p3, :cond_1

    .line 25
    .line 26
    move v0, v1

    .line 27
    :cond_1
    invoke-static {p4, v0}, Lcom/android/launcher3/widget/picker/U;->c(ZZ)Lcom/android/launcher3/widget/picker/U;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-virtual {p1, p3}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->setListDrawableState(Lcom/android/launcher3/widget/picker/U;)V

    .line 32
    .line 33
    .line 34
    new-instance p3, Lcom/android/launcher3/widget/picker/a0;

    .line 35
    .line 36
    invoke-direct {p3, p0, p1, p2}, Lcom/android/launcher3/widget/picker/a0;-><init>(Lcom/android/launcher3/widget/picker/b0;Lcom/android/launcher3/widget/picker/WidgetsListHeader;Lm2/o;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p3}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public g(Landroid/view/ViewGroup;)Lcom/android/launcher3/widget/picker/Z;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/picker/Z;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/b0;->a:Landroid/view/LayoutInflater;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/launcher3/widget/picker/b0;->c:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const p0, 0x7f0e026c

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const p0, 0x7f0e026a

    .line 14
    .line 15
    .line 16
    :goto_0
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v1, p0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/picker/Z;-><init>(Lcom/android/launcher3/widget/picker/WidgetsListHeader;)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method
