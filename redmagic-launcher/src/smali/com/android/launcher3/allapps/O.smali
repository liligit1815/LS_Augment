.class public abstract Lcom/android/launcher3/allapps/O;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "BaseAllAppsAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/allapps/O$b;,
        Lcom/android/launcher3/allapps/O$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/android/launcher3/allapps/O$b;",
        ">;"
    }
.end annotation


# instance fields
.field protected final a:LP0/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LP0/g<",
            "*>;"
        }
    .end annotation
.end field

.field protected final b:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected final c:Lcom/android/launcher3/allapps/M;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/M<",
            "TT;>;"
        }
    .end annotation
.end field

.field protected d:I

.field protected final e:Landroid/view/LayoutInflater;

.field protected final f:Landroid/view/View$OnClickListener;

.field protected final g:Landroid/view/View$OnLongClickListener;

.field protected h:Landroid/view/View$OnFocusChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/LayoutInflater;Lcom/android/launcher3/allapps/M;LP0/g;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/view/LayoutInflater;",
            "Lcom/android/launcher3/allapps/M<",
            "TT;>;",
            "LP0/g<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p3, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/android/launcher3/allapps/O;->e:Landroid/view/LayoutInflater;

    .line 9
    .line 10
    move-object p2, p1

    .line 11
    check-cast p2, Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iput-object p2, p0, Lcom/android/launcher3/allapps/O;->f:Landroid/view/View$OnClickListener;

    .line 18
    .line 19
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 20
    .line 21
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/android/launcher3/allapps/O;->g:Landroid/view/View$OnLongClickListener;

    .line 26
    .line 27
    iput-object p4, p0, Lcom/android/launcher3/allapps/O;->a:LP0/g;

    .line 28
    .line 29
    return-void
.end method

.method private f(Lcom/android/launcher3/allapps/O$b;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lcom/android/launcher3/allapps/O$a;

    .line 12
    .line 13
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 14
    .line 15
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->B0()V

    .line 18
    .line 19
    .line 20
    iget-object p2, p2, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Lcom/android/launcher3/BubbleTextView;->v(Lcom/android/launcher3/model/data/d;)V

    .line 23
    .line 24
    .line 25
    const/4 p2, 0x1

    .line 26
    invoke-virtual {p1, p2}, Lcom/android/launcher3/BubbleTextView;->setIsAllAppRecommend(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Lcom/android/launcher3/allapps/O;->h:Landroid/view/View$OnFocusChangeListener;

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 32
    .line 33
    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/O;->t(Landroid/widget/TextView;Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private g(Lcom/android/launcher3/allapps/O$b;I)V
    .locals 0

    .line 1
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 2
    .line 3
    check-cast p1, Landroid/widget/TextView;

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/O;->t(Landroid/widget/TextView;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private h(Landroid/view/ViewGroup;)Lcom/android/launcher3/allapps/O$b;
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->h0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/android/launcher3/J3;->e:Lcom/android/launcher3/X;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/X;->g(Landroid/content/Context;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const v0, 0x7f0e0065

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const v0, 0x7f0e0064

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/allapps/O;->e:Landroid/view/LayoutInflater;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {v1, v0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 42
    .line 43
    const/high16 v0, 0x3f800000    # 1.0f

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/android/launcher3/BubbleTextView;->setLongPressTimeoutFactor(F)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->h:Landroid/view/View$OnFocusChangeListener;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->f:Landroid/view/View$OnClickListener;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->g:Landroid/view/View$OnLongClickListener;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 68
    .line 69
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 70
    .line 71
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget p0, p0, Lcom/android/launcher3/h0;->H2:I

    .line 76
    .line 77
    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 78
    .line 79
    new-instance p0, Lcom/android/launcher3/allapps/O$b;

    .line 80
    .line 81
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/O$b;-><init>(Landroid/view/View;)V

    .line 82
    .line 83
    .line 84
    return-object p0
.end method

.method public static j(I)Z
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/android/launcher3/allapps/O;->n(II)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static k(I)Z
    .locals 1

    .line 1
    const/16 v0, 0x402

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/android/launcher3/allapps/O;->n(II)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static l(I)Z
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/android/launcher3/allapps/O;->n(II)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static m(I)Z
    .locals 1

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/android/launcher3/allapps/O;->n(II)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method protected static n(II)Z
    .locals 0

    .line 1
    and-int/2addr p0, p1

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method private t(Landroid/widget/TextView;Z)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Lx1/O;->t()Ljava/lang/Boolean;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 16
    .line 17
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-ne v1, v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const v2, 0x7f06004d

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-virtual {v0, v2}, Landroid/content/Context;->getColor(I)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const v2, 0x7f06004c

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :goto_1
    if-eqz p2, :cond_2

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 49
    .line 50
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 51
    .line 52
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    :goto_2
    invoke-virtual {p1}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eq p0, v0, :cond_4

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 63
    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 67
    .line 68
    const p2, 0x7f06003e

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p2}, Landroid/content/Context;->getColor(I)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    .line 77
    .line 78
    :cond_4
    :goto_3
    invoke-virtual {p1}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-ne v1, p0, :cond_5

    .line 83
    .line 84
    const/4 p0, 0x1

    .line 85
    goto :goto_4

    .line 86
    :cond_5
    const/4 p0, 0x0

    .line 87
    :goto_4
    invoke-static {p1, p0}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 88
    .line 89
    .line 90
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

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
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/android/launcher3/allapps/O$a;

    .line 12
    .line 13
    iget p0, p0, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 14
    .line 15
    return p0
.end method

.method public abstract i()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
.end method

.method public o(Lcom/android/launcher3/allapps/O$b;I)V
    .locals 9

    .line 1
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getItemViewType()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x2

    .line 13
    const/4 v4, 0x1

    .line 14
    sparse-switch v0, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->a:LP0/g;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getItemViewType()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v1}, LP0/g;->d(I)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_b

    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->a:LP0/g;

    .line 30
    .line 31
    invoke-virtual {p0, p1, p2}, LP0/g;->f(Lcom/android/launcher3/allapps/O$b;I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :sswitch_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/O;->g(Lcom/android/launcher3/allapps/O$b;I)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :sswitch_1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/O;->f(Lcom/android/launcher3/allapps/O$b;I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :sswitch_2
    iget-object p1, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Lcom/android/launcher3/allapps/O$a;

    .line 54
    .line 55
    iget-object p2, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/android/launcher3/allapps/M;->l()Lcom/android/launcher3/allapps/i0;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p2}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-ne p2, v3, :cond_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    new-instance v2, Lcom/android/launcher3/allapps/r0;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 71
    .line 72
    invoke-direct {v2, p0, v1, v4}, Lcom/android/launcher3/allapps/r0;-><init>(Landroid/content/Context;IZ)V

    .line 73
    .line 74
    .line 75
    :goto_0
    iput-object v2, p1, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 76
    .line 77
    return-void

    .line 78
    :sswitch_3
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 79
    .line 80
    const v0, 0x7f0b04a3

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 88
    .line 89
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->l()Lcom/android/launcher3/allapps/i0;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0, p1}, Lcom/android/launcher3/allapps/i0;->V(Landroid/widget/RelativeLayout;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    check-cast p1, Lcom/android/launcher3/allapps/O$a;

    .line 109
    .line 110
    iget-object p2, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 111
    .line 112
    invoke-virtual {p2}, Lcom/android/launcher3/allapps/M;->l()Lcom/android/launcher3/allapps/i0;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    invoke-virtual {p2}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    if-ne p2, v3, :cond_1

    .line 121
    .line 122
    const/16 p2, 0x1e

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_1
    const/4 p2, 0x6

    .line 126
    :goto_1
    new-instance v0, Lcom/android/launcher3/allapps/r0;

    .line 127
    .line 128
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 129
    .line 130
    invoke-direct {v0, p0, p2, v1}, Lcom/android/launcher3/allapps/r0;-><init>(Landroid/content/Context;IZ)V

    .line 131
    .line 132
    .line 133
    iput-object v0, p1, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 134
    .line 135
    return-void

    .line 136
    :sswitch_4
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 137
    .line 138
    check-cast p0, Lcom/android/launcher3/allapps/WorkEduCard;

    .line 139
    .line 140
    invoke-virtual {p0, p2}, Lcom/android/launcher3/allapps/WorkEduCard;->setPosition(I)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :sswitch_5
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 145
    .line 146
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    check-cast p2, Lcom/android/launcher3/allapps/O$a;

    .line 155
    .line 156
    iget-object p2, p2, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 157
    .line 158
    if-eqz p2, :cond_b

    .line 159
    .line 160
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 161
    .line 162
    check-cast v0, Landroid/widget/TextView;

    .line 163
    .line 164
    iget-object v1, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 165
    .line 166
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 167
    .line 168
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    const v2, 0x7f140070

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1, v2, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 180
    .line 181
    .line 182
    invoke-static {}, Lx1/O;->t()Ljava/lang/Boolean;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    if-eqz p2, :cond_2

    .line 191
    .line 192
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 193
    .line 194
    check-cast p2, Landroid/widget/TextView;

    .line 195
    .line 196
    invoke-virtual {p2}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 201
    .line 202
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 203
    .line 204
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-eq p2, v0, :cond_b

    .line 209
    .line 210
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 211
    .line 212
    check-cast p1, Landroid/widget/TextView;

    .line 213
    .line 214
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 215
    .line 216
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 217
    .line 218
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 219
    .line 220
    .line 221
    move-result p0

    .line 222
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 223
    .line 224
    .line 225
    return-void

    .line 226
    :cond_2
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 227
    .line 228
    check-cast p2, Landroid/widget/TextView;

    .line 229
    .line 230
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 231
    .line 232
    const v0, 0x7f06003e

    .line 233
    .line 234
    .line 235
    invoke-virtual {p0, v0}, Landroid/content/Context;->getColor(I)I

    .line 236
    .line 237
    .line 238
    move-result p0

    .line 239
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 240
    .line 241
    .line 242
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 243
    .line 244
    check-cast p0, Landroid/widget/TextView;

    .line 245
    .line 246
    invoke-static {p0, v4}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :sswitch_6
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 251
    .line 252
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object p2

    .line 260
    check-cast p2, Lcom/android/launcher3/allapps/O$a;

    .line 261
    .line 262
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 263
    .line 264
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 265
    .line 266
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->B0()V

    .line 267
    .line 268
    .line 269
    iget-object v0, p2, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 270
    .line 271
    invoke-virtual {p1, v0}, Lcom/android/launcher3/BubbleTextView;->v(Lcom/android/launcher3/model/data/d;)V

    .line 272
    .line 273
    .line 274
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->h:Landroid/view/View$OnFocusChangeListener;

    .line 275
    .line 276
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 277
    .line 278
    .line 279
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 280
    .line 281
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->l()Lcom/android/launcher3/allapps/i0;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    if-eqz v0, :cond_8

    .line 286
    .line 287
    invoke-virtual {v0, p2}, Lcom/android/launcher3/allapps/i0;->j0(Lcom/android/launcher3/allapps/O$a;)Z

    .line 288
    .line 289
    .line 290
    move-result v5

    .line 291
    invoke-virtual {p1}, Landroid/widget/TextView;->getAlpha()F

    .line 292
    .line 293
    .line 294
    move-result v6

    .line 295
    const/4 v7, 0x0

    .line 296
    cmpl-float v6, v6, v7

    .line 297
    .line 298
    const/high16 v8, 0x3f800000    # 1.0f

    .line 299
    .line 300
    if-eqz v6, :cond_3

    .line 301
    .line 302
    invoke-virtual {p1}, Landroid/widget/TextView;->getAlpha()F

    .line 303
    .line 304
    .line 305
    move-result v6

    .line 306
    cmpl-float v6, v6, v8

    .line 307
    .line 308
    if-nez v6, :cond_6

    .line 309
    .line 310
    :cond_3
    if-eqz v5, :cond_5

    .line 311
    .line 312
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/i0;->m0()Z

    .line 313
    .line 314
    .line 315
    move-result v6

    .line 316
    if-eqz v6, :cond_5

    .line 317
    .line 318
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/i0;->l0()Z

    .line 319
    .line 320
    .line 321
    move-result v6

    .line 322
    if-nez v6, :cond_4

    .line 323
    .line 324
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/i0;->g0()Z

    .line 325
    .line 326
    .line 327
    move-result v6

    .line 328
    if-eqz v6, :cond_5

    .line 329
    .line 330
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 331
    .line 332
    .line 333
    move-result v6

    .line 334
    if-ne v6, v4, :cond_5

    .line 335
    .line 336
    goto :goto_2

    .line 337
    :cond_5
    move v7, v8

    .line 338
    :goto_2
    invoke-virtual {p1, v7}, Landroid/widget/TextView;->setAlpha(F)V

    .line 339
    .line 340
    .line 341
    :cond_6
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    if-ne v0, v3, :cond_7

    .line 346
    .line 347
    if-eqz v5, :cond_7

    .line 348
    .line 349
    iput-object v2, p2, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 350
    .line 351
    const/16 p2, 0x8

    .line 352
    .line 353
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 354
    .line 355
    .line 356
    :cond_7
    if-eqz v5, :cond_8

    .line 357
    .line 358
    invoke-virtual {p1, v4}, Lcom/android/launcher3/BubbleTextView;->setPrivateSpaceItem(Z)V

    .line 359
    .line 360
    .line 361
    iget-object p2, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 362
    .line 363
    const v0, 0x7f06046a

    .line 364
    .line 365
    .line 366
    invoke-virtual {p2, v0}, Landroid/content/Context;->getColor(I)I

    .line 367
    .line 368
    .line 369
    move-result p2

    .line 370
    invoke-virtual {p1, p2}, Lcom/android/launcher3/BubbleTextView;->setTextColor(I)V

    .line 371
    .line 372
    .line 373
    :cond_8
    invoke-virtual {p1}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 374
    .line 375
    .line 376
    move-result p2

    .line 377
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 378
    .line 379
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 380
    .line 381
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 382
    .line 383
    .line 384
    move-result v0

    .line 385
    if-eq p2, v0, :cond_9

    .line 386
    .line 387
    iget-object p2, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 388
    .line 389
    check-cast p2, Lcom/android/launcher3/views/k;

    .line 390
    .line 391
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 392
    .line 393
    .line 394
    move-result p2

    .line 395
    invoke-virtual {p1, p2}, Lcom/android/launcher3/BubbleTextView;->setTextColor(I)V

    .line 396
    .line 397
    .line 398
    :cond_9
    const/4 p2, -0x1

    .line 399
    invoke-virtual {p1}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 400
    .line 401
    .line 402
    move-result v0

    .line 403
    if-ne p2, v0, :cond_a

    .line 404
    .line 405
    move v1, v4

    .line 406
    :cond_a
    invoke-static {p1, v1}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 407
    .line 408
    .line 409
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 410
    .line 411
    .line 412
    move-result p2

    .line 413
    if-eqz p2, :cond_b

    .line 414
    .line 415
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 416
    .line 417
    .line 418
    move-result-object p2

    .line 419
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 420
    .line 421
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 422
    .line 423
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    iget v0, v0, Lcom/android/launcher3/h0;->H2:I

    .line 428
    .line 429
    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 430
    .line 431
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 432
    .line 433
    .line 434
    move-result-object p1

    .line 435
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 436
    .line 437
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 438
    .line 439
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 440
    .line 441
    .line 442
    move-result-object p0

    .line 443
    iget p0, p0, Lcom/android/launcher3/h0;->I2:I

    .line 444
    .line 445
    iput p0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 446
    .line 447
    :cond_b
    :sswitch_7
    return-void

    .line 448
    nop

    .line 449
    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_6
        0x4 -> :sswitch_5
        0x8 -> :sswitch_7
        0x10 -> :sswitch_4
        0x20 -> :sswitch_7
        0x40 -> :sswitch_3
        0x80 -> :sswitch_2
        0x100 -> :sswitch_7
        0x400 -> :sswitch_1
        0x800 -> :sswitch_0
        0x1000 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/allapps/O$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/allapps/O;->o(Lcom/android/launcher3/allapps/O$b;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/allapps/O;->p(Landroid/view/ViewGroup;I)Lcom/android/launcher3/allapps/O$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic onFailedToRecycleView(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/allapps/O$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/O;->q(Lcom/android/launcher3/allapps/O$b;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/allapps/O$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/O;->r(Lcom/android/launcher3/allapps/O$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onViewRecycled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/allapps/O$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/O;->s(Lcom/android/launcher3/allapps/O$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Lcom/android/launcher3/allapps/O$b;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sparse-switch p2, :sswitch_data_0

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->a:LP0/g;

    .line 6
    .line 7
    invoke-virtual {v0, p2}, LP0/g;->d(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/allapps/O;->a:LP0/g;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->e:Landroid/view/LayoutInflater;

    .line 16
    .line 17
    invoke-virtual {v0, p0, p1, p2}, LP0/g;->g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;I)Lcom/android/launcher3/allapps/O$b;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 23
    .line 24
    new-instance p1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v0, "Unexpected view type"

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw p0

    .line 45
    :sswitch_0
    new-instance p2, Lcom/android/launcher3/allapps/O$b;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->e:Landroid/view/LayoutInflater;

    .line 48
    .line 49
    const v1, 0x7f0e0058

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-direct {p2, p0}, Lcom/android/launcher3/allapps/O$b;-><init>(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    return-object p2

    .line 60
    :sswitch_1
    new-instance p2, Lcom/android/launcher3/allapps/O$b;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->e:Landroid/view/LayoutInflater;

    .line 63
    .line 64
    const v1, 0x7f0e0057

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-direct {p2, p0}, Lcom/android/launcher3/allapps/O$b;-><init>(Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    return-object p2

    .line 75
    :sswitch_2
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/O;->h(Landroid/view/ViewGroup;)Lcom/android/launcher3/allapps/O$b;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0

    .line 80
    :sswitch_3
    new-instance p1, Lcom/android/launcher3/allapps/O$b;

    .line 81
    .line 82
    new-instance p2, Landroid/view/View;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 85
    .line 86
    invoke-direct {p2, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 87
    .line 88
    .line 89
    invoke-direct {p1, p2}, Lcom/android/launcher3/allapps/O$b;-><init>(Landroid/view/View;)V

    .line 90
    .line 91
    .line 92
    return-object p1

    .line 93
    :sswitch_4
    new-instance p2, Lcom/android/launcher3/allapps/O$b;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->e:Landroid/view/LayoutInflater;

    .line 96
    .line 97
    const v1, 0x7f0e01ca

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-direct {p2, p0}, Lcom/android/launcher3/allapps/O$b;-><init>(Landroid/view/View;)V

    .line 105
    .line 106
    .line 107
    return-object p2

    .line 108
    :sswitch_5
    new-instance p2, Lcom/android/launcher3/allapps/O$b;

    .line 109
    .line 110
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->e:Landroid/view/LayoutInflater;

    .line 111
    .line 112
    const v1, 0x7f0e027b

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-direct {p2, p0}, Lcom/android/launcher3/allapps/O$b;-><init>(Landroid/view/View;)V

    .line 120
    .line 121
    .line 122
    return-object p2

    .line 123
    :sswitch_6
    new-instance p2, Lcom/android/launcher3/allapps/O$b;

    .line 124
    .line 125
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->e:Landroid/view/LayoutInflater;

    .line 126
    .line 127
    const v1, 0x7f0e0279

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-direct {p2, p0}, Lcom/android/launcher3/allapps/O$b;-><init>(Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    return-object p2

    .line 138
    :sswitch_7
    new-instance p2, Lcom/android/launcher3/allapps/O$b;

    .line 139
    .line 140
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->e:Landroid/view/LayoutInflater;

    .line 141
    .line 142
    const v1, 0x7f0e01c9

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-direct {p2, p0}, Lcom/android/launcher3/allapps/O$b;-><init>(Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    return-object p2

    .line 153
    :sswitch_8
    new-instance p2, Lcom/android/launcher3/allapps/O$b;

    .line 154
    .line 155
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->e:Landroid/view/LayoutInflater;

    .line 156
    .line 157
    const v1, 0x7f0e0062

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-direct {p2, p0}, Lcom/android/launcher3/allapps/O$b;-><init>(Landroid/view/View;)V

    .line 165
    .line 166
    .line 167
    return-object p2

    .line 168
    :sswitch_9
    iget-object p2, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 169
    .line 170
    check-cast p2, Lcom/android/launcher3/views/k;

    .line 171
    .line 172
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    iget-object p2, p2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 177
    .line 178
    iget-boolean p2, p2, Lcom/android/launcher3/F1;->B1:Z

    .line 179
    .line 180
    if-eqz p2, :cond_1

    .line 181
    .line 182
    const p2, 0x7f0e0065

    .line 183
    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_1
    const p2, 0x7f0e0064

    .line 187
    .line 188
    .line 189
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/allapps/O;->e:Landroid/view/LayoutInflater;

    .line 190
    .line 191
    invoke-virtual {v1, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 196
    .line 197
    const/high16 p2, 0x3f800000    # 1.0f

    .line 198
    .line 199
    invoke-virtual {p1, p2}, Lcom/android/launcher3/BubbleTextView;->setLongPressTimeoutFactor(F)V

    .line 200
    .line 201
    .line 202
    iget-object p2, p0, Lcom/android/launcher3/allapps/O;->h:Landroid/view/View$OnFocusChangeListener;

    .line 203
    .line 204
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 205
    .line 206
    .line 207
    iget-object p2, p0, Lcom/android/launcher3/allapps/O;->f:Landroid/view/View$OnClickListener;

    .line 208
    .line 209
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 210
    .line 211
    .line 212
    iget-object p2, p0, Lcom/android/launcher3/allapps/O;->g:Landroid/view/View$OnLongClickListener;

    .line 213
    .line 214
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 218
    .line 219
    .line 220
    move-result-object p2

    .line 221
    iget-object p0, p0, Lcom/android/launcher3/allapps/O;->b:Landroid/content/Context;

    .line 222
    .line 223
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 224
    .line 225
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    iget p0, p0, Lcom/android/launcher3/h0;->H2:I

    .line 230
    .line 231
    iput p0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 232
    .line 233
    new-instance p0, Lcom/android/launcher3/allapps/O$b;

    .line 234
    .line 235
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/O$b;-><init>(Landroid/view/View;)V

    .line 236
    .line 237
    .line 238
    return-object p0

    .line 239
    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_9
        0x4 -> :sswitch_8
        0x8 -> :sswitch_7
        0x10 -> :sswitch_6
        0x20 -> :sswitch_5
        0x40 -> :sswitch_4
        0x80 -> :sswitch_7
        0x100 -> :sswitch_3
        0x400 -> :sswitch_2
        0x800 -> :sswitch_1
        0x1000 -> :sswitch_0
    .end sparse-switch
.end method

.method public q(Lcom/android/launcher3/allapps/O$b;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public r(Lcom/android/launcher3/allapps/O$b;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getItemViewType()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    if-ne v0, p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 12
    .line 13
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    instance-of p1, p1, Lcom/android/launcher3/model/data/y;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/BubbleTextView;->u(Lcom/android/launcher3/model/data/y;Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public s(Lcom/android/launcher3/allapps/O$b;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getItemViewType()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 9
    .line 10
    instance-of v1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 15
    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setScaleX(F)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setScaleY(F)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewRecycled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public setIconFocusListener(Landroid/view/View$OnFocusChangeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/O;->h:Landroid/view/View$OnFocusChangeListener;

    .line 2
    .line 3
    return-void
.end method

.method public abstract u(I)V
.end method

.method public v(Lcom/android/launcher3/allapps/AllAppsRecyclerView;)V
    .locals 0

    .line 1
    return-void
.end method
