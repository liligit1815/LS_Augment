.class public Lcom/android/launcher3/widget/picker/T;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "WidgetsListAdapter.java"

# interfaces
.implements Lcom/android/launcher3/widget/picker/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/picker/T$c;,
        Lcom/android/launcher3/widget/picker/T$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;",
        "Lcom/android/launcher3/widget/picker/b;"
    }
.end annotation


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "LG1/e;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lcom/android/launcher3/widget/picker/T$c;

.field private d:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;

.field private final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lm2/g;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lm2/g;",
            ">;"
        }
    .end annotation
.end field

.field private g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lm2/g;",
            ">;"
        }
    .end annotation
.end field

.field private h:Lcom/android/launcher3/util/L1;

.field private i:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Lm2/g;",
            ">;"
        }
    .end annotation
.end field

.field private j:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Lm2/g;",
            ">;"
        }
    .end annotation
.end field

.field private k:Landroidx/recyclerview/widget/RecyclerView;

.field private l:Lcom/android/launcher3/util/L1;

.field private m:I

.field private n:Z

.field private o:Z

.field private p:Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/LayoutInflater;Ljava/util/function/IntSupplier;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;Lcom/android/launcher3/widget/picker/T$b;Z)V
    .locals 4

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/T;->b:Landroid/util/SparseArray;

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/widget/picker/T$c;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/android/launcher3/widget/picker/T$c;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/android/launcher3/widget/picker/T;->c:Lcom/android/launcher3/widget/picker/T$c;

    .line 17
    .line 18
    new-instance v1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/android/launcher3/widget/picker/T;->e:Ljava/util/List;

    .line 24
    .line 25
    new-instance v1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/android/launcher3/widget/picker/T;->f:Ljava/util/List;

    .line 31
    .line 32
    new-instance v1, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    iput-object v1, p0, Lcom/android/launcher3/widget/picker/T;->h:Lcom/android/launcher3/util/L1;

    .line 41
    .line 42
    new-instance v2, Lcom/android/launcher3/widget/picker/G;

    .line 43
    .line 44
    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/picker/G;-><init>(Lcom/android/launcher3/widget/picker/T;)V

    .line 45
    .line 46
    .line 47
    iput-object v2, p0, Lcom/android/launcher3/widget/picker/T;->i:Ljava/util/function/Predicate;

    .line 48
    .line 49
    iput-object v1, p0, Lcom/android/launcher3/widget/picker/T;->j:Ljava/util/function/Predicate;

    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    iput-boolean v1, p0, Lcom/android/launcher3/widget/picker/T;->n:Z

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    iput-boolean v2, p0, Lcom/android/launcher3/widget/picker/T;->o:Z

    .line 56
    .line 57
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/T;->a:Landroid/content/Context;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Lcom/android/launcher3/views/k;

    .line 64
    .line 65
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    const/4 v3, 0x4

    .line 70
    invoke-static {v2, v3, v1}, Lr2/b;->e(Lcom/android/launcher3/h0;II)Landroid/util/Size;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    iput v1, p0, Lcom/android/launcher3/widget/picker/T;->m:I

    .line 79
    .line 80
    new-instance v1, Lcom/android/launcher3/widget/picker/d0;

    .line 81
    .line 82
    invoke-direct {v1, p1, p2, p4, p5}, Lcom/android/launcher3/widget/picker/d0;-><init>(Landroid/content/Context;Landroid/view/LayoutInflater;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V

    .line 83
    .line 84
    .line 85
    const p1, 0x7f0b0674

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    new-instance p1, Lcom/android/launcher3/widget/picker/b0;

    .line 92
    .line 93
    invoke-direct {p1, p2, p0, p7}, Lcom/android/launcher3/widget/picker/b0;-><init>(Landroid/view/LayoutInflater;Lcom/android/launcher3/widget/picker/b;Z)V

    .line 94
    .line 95
    .line 96
    const p4, 0x7f0b0673

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p4, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    new-instance p1, Lcom/android/launcher3/widget/picker/f0;

    .line 103
    .line 104
    invoke-direct {p1, p3}, Lcom/android/launcher3/widget/picker/f0;-><init>(Ljava/util/function/IntSupplier;)V

    .line 105
    .line 106
    .line 107
    const p3, 0x7f0b0676

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, p3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    new-instance p1, Lcom/android/launcher3/widget/picker/Y;

    .line 114
    .line 115
    invoke-static {p6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    new-instance p3, Lcom/android/launcher3/widget/picker/H;

    .line 119
    .line 120
    invoke-direct {p3, p6}, Lcom/android/launcher3/widget/picker/H;-><init>(Lcom/android/launcher3/widget/picker/T$b;)V

    .line 121
    .line 122
    .line 123
    invoke-direct {p1, p2, p3}, Lcom/android/launcher3/widget/picker/Y;-><init>(Landroid/view/LayoutInflater;Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    const p3, 0x7f0b0675

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, p3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    new-instance p1, Lm2/i;

    .line 133
    .line 134
    invoke-direct {p1, p2}, Lm2/i;-><init>(Landroid/view/LayoutInflater;)V

    .line 135
    .line 136
    .line 137
    const p3, 0x7f0b0671

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, p3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    new-instance p1, Lcom/android/launcher3/widget/picker/X;

    .line 144
    .line 145
    invoke-direct {p1, p2, p0}, Lcom/android/launcher3/widget/picker/X;-><init>(Landroid/view/LayoutInflater;Lcom/android/launcher3/widget/picker/b;)V

    .line 146
    .line 147
    .line 148
    const p0, 0x7f0b0672

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, p0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method private A(Ljava/util/OptionalInt;)Ljava/util/OptionalInt;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/util/OptionalInt;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ljava/util/OptionalInt;->empty()Ljava/util/OptionalInt;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    invoke-virtual {p1}, Ljava/util/OptionalInt;->getAsInt()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    invoke-static {}, Ljava/util/OptionalInt;->empty()Ljava/util/OptionalInt;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_2
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-static {p0}, Ljava/util/OptionalInt;->of(I)Ljava/util/OptionalInt;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_3
    :goto_0
    invoke-static {}, Ljava/util/OptionalInt;->empty()Ljava/util/OptionalInt;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method private B()Ljava/util/OptionalInt;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v1, v0}, Ljava/util/stream/IntStream;->range(II)Ljava/util/stream/IntStream;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Lcom/android/launcher3/widget/picker/Q;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/picker/Q;-><init>(Lcom/android/launcher3/widget/picker/T;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/stream/IntStream;->filter(Ljava/util/function/IntPredicate;)Ljava/util/stream/IntStream;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/util/stream/IntStream;->findFirst()Ljava/util/OptionalInt;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method private C(Lcom/android/launcher3/util/L1;)Ljava/util/OptionalInt;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v1, v0}, Ljava/util/stream/IntStream;->range(II)Ljava/util/stream/IntStream;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Lcom/android/launcher3/widget/picker/N;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/widget/picker/N;-><init>(Lcom/android/launcher3/widget/picker/T;Lcom/android/launcher3/util/L1;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/stream/IntStream;->filter(Ljava/util/function/IntPredicate;)Ljava/util/stream/IntStream;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/util/stream/IntStream;->findFirst()Ljava/util/OptionalInt;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method private static F(Lm2/g;Lcom/android/launcher3/util/L1;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lm2/o;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/picker/T;->Q(Lm2/g;Lcom/android/launcher3/util/L1;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private synthetic H(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of p0, p0, Lm2/j;

    .line 8
    .line 9
    return p0
.end method

.method private synthetic I(Lcom/android/launcher3/util/L1;I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lm2/g;

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/picker/T;->F(Lm2/g;Lcom/android/launcher3/util/L1;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private synthetic J(Lm2/g;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lm2/o;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p1, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/android/launcher3/util/L1;->d(Lcom/android/launcher3/model/data/B;)Lcom/android/launcher3/util/L1;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->h:Lcom/android/launcher3/util/L1;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/L1;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method private synthetic K(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sub-int/2addr p1, v0

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollBy(II)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method private synthetic L(Lm2/g;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/util/L1;->d(Lcom/android/launcher3/model/data/B;)Lcom/android/launcher3/util/L1;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/widget/picker/T;->d(ZLcom/android/launcher3/util/L1;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic M(Lm2/g;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->j:Ljava/util/function/Predicate;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->i:Ljava/util/function/Predicate;

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    :cond_1
    instance-of v0, p1, Lm2/a;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    instance-of v0, p1, Lm2/j;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    instance-of v0, p1, Lm2/k;

    .line 28
    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->d:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;

    .line 32
    .line 33
    if-eqz p0, :cond_4

    .line 34
    .line 35
    instance-of p0, p1, Lm2/h;

    .line 36
    .line 37
    if-nez p0, :cond_3

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_3
    const/4 p0, 0x0

    .line 41
    return p0

    .line 42
    :cond_4
    :goto_0
    const/4 p0, 0x1

    .line 43
    return p0
.end method

.method private synthetic N(Lm2/g;)Lm2/g;
    .locals 1

    .line 1
    instance-of v0, p1, Lm2/o;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->h:Lcom/android/launcher3/util/L1;

    .line 6
    .line 7
    invoke-static {p1, v0}, Lcom/android/launcher3/widget/picker/T;->Q(Lm2/g;Lcom/android/launcher3/util/L1;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p1, Lm2/o;

    .line 14
    .line 15
    invoke-virtual {p1}, Lm2/o;->w()Lm2/o;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    instance-of v0, p1, Lm2/h;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    check-cast p1, Lm2/h;

    .line 25
    .line 26
    iget p0, p0, Lcom/android/launcher3/widget/picker/T;->m:I

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Lm2/h;->o(I)Lm2/h;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    return-object p1
.end method

.method private synthetic O()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->B()Ljava/util/OptionalInt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/OptionalInt;->isPresent()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/OptionalInt;->getAsInt()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-boolean v1, p0, Lcom/android/launcher3/widget/picker/T;->o:Z

    .line 16
    .line 17
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private synthetic P(Ljava/util/OptionalInt;Ljava/util/OptionalInt;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/picker/T;->U(Ljava/util/OptionalInt;Ljava/util/OptionalInt;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static Q(Lm2/g;Lcom/android/launcher3/util/L1;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v2, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 18
    .line 19
    iget v1, p0, Lcom/android/launcher3/model/data/B;->l:I

    .line 20
    .line 21
    iget v2, p1, Lcom/android/launcher3/util/L1;->b:I

    .line 22
    .line 23
    if-ne v1, v2, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    return v0
.end method

.method private T()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->B()Ljava/util/OptionalInt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/OptionalInt;->isPresent()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/OptionalInt;->getAsInt()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 20
    .line 21
    new-instance v2, Lcom/android/launcher3/widget/picker/P;

    .line 22
    .line 23
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/widget/picker/P;-><init>(Lcom/android/launcher3/widget/picker/T;I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private U(Ljava/util/OptionalInt;Ljava/util/OptionalInt;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/util/OptionalInt;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Ljava/util/OptionalInt;->getAsInt()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p2, v1}, Ljava/util/OptionalInt;->orElse(I)I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    sub-int/2addr p2, p0

    .line 39
    invoke-virtual {v0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->T(II)V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void
.end method

.method private c0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->l:Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/picker/T;->C(Lcom/android/launcher3/util/L1;)Ljava/util/OptionalInt;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/picker/T;->A(Ljava/util/OptionalInt;)Ljava/util/OptionalInt;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->y()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-boolean v2, p0, Lcom/android/launcher3/widget/picker/T;->o:Z

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    goto :goto_2

    .line 21
    :cond_0
    move v2, v3

    .line 22
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const/4 v5, -0x1

    .line 27
    if-ge v2, v4, :cond_2

    .line 28
    .line 29
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    instance-of v4, v4, Lm2/j;

    .line 34
    .line 35
    if-eqz v4, :cond_1

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    move v2, v5

    .line 42
    :goto_1
    if-ne v2, v5, :cond_3

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_3
    new-instance v4, Ljava/util/ArrayList;

    .line 46
    .line 47
    add-int/lit8 v2, v2, 0x1

    .line 48
    .line 49
    invoke-interface {v1, v3, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-direct {v4, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 54
    .line 55
    .line 56
    move-object v1, v4

    .line 57
    :goto_2
    invoke-interface {v1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v2, Lcom/android/launcher3/widget/picker/B;

    .line 62
    .line 63
    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/picker/B;-><init>(Lcom/android/launcher3/widget/picker/T;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    new-instance v2, Lcom/android/launcher3/widget/picker/I;

    .line 71
    .line 72
    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/picker/I;-><init>(Lcom/android/launcher3/widget/picker/T;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Ljava/util/List;

    .line 88
    .line 89
    new-instance v2, Lcom/android/launcher3/widget/picker/k;

    .line 90
    .line 91
    iget-object v4, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {v2, v4, v1}, Lcom/android/launcher3/widget/picker/k;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v2, v3}, Landroidx/recyclerview/widget/e;->b(Landroidx/recyclerview/widget/e$b;Z)Landroidx/recyclerview/widget/e$e;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 103
    .line 104
    .line 105
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/e$e;->c(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 114
    .line 115
    if-eqz v1, :cond_4

    .line 116
    .line 117
    new-instance v2, Lcom/android/launcher3/widget/picker/J;

    .line 118
    .line 119
    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/picker/J;-><init>(Lcom/android/launcher3/widget/picker/T;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 123
    .line 124
    .line 125
    :cond_4
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/T;->l:Lcom/android/launcher3/util/L1;

    .line 126
    .line 127
    if-eqz v1, :cond_5

    .line 128
    .line 129
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 130
    .line 131
    if-eqz v2, :cond_5

    .line 132
    .line 133
    invoke-direct {p0, v1}, Lcom/android/launcher3/widget/picker/T;->C(Lcom/android/launcher3/util/L1;)Ljava/util/OptionalInt;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 138
    .line 139
    new-instance v3, Lcom/android/launcher3/widget/picker/K;

    .line 140
    .line 141
    invoke-direct {v3, p0, v1, v0}, Lcom/android/launcher3/widget/picker/K;-><init>(Lcom/android/launcher3/widget/picker/T;Ljava/util/OptionalInt;Ljava/util/OptionalInt;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 145
    .line 146
    .line 147
    const/4 v0, 0x0

    .line 148
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/T;->l:Lcom/android/launcher3/util/L1;

    .line 149
    .line 150
    :cond_5
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/widget/picker/T;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/T;->K(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lm2/g;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lm2/o;

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Lcom/android/launcher3/widget/picker/T;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->O()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/widget/picker/T;Lm2/g;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/T;->J(Lm2/g;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic j(Lcom/android/launcher3/widget/picker/T;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/T;->H(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic k(Lcom/android/launcher3/widget/picker/T;Lm2/g;)Lm2/g;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/T;->N(Lm2/g;)Lm2/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic l(Lcom/android/launcher3/widget/picker/T;Lm2/g;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/T;->L(Lm2/g;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/util/L1;Lm2/h;)Z
    .locals 0

    .line 1
    iget-object p1, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/util/L1;->d(Lcom/android/launcher3/model/data/B;)Lcom/android/launcher3/util/L1;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/L1;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static synthetic n(Lm2/g;)Lm2/h;
    .locals 0

    .line 1
    check-cast p0, Lm2/h;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Lm2/g;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lm2/h;

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic p(Lcom/android/launcher3/widget/picker/T;Ljava/util/OptionalInt;Ljava/util/OptionalInt;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/picker/T;->P(Ljava/util/OptionalInt;Ljava/util/OptionalInt;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Lcom/android/launcher3/widget/picker/T;Lm2/g;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/T;->M(Lm2/g;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic r(Lcom/android/launcher3/widget/picker/T;Lcom/android/launcher3/util/L1;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/picker/T;->I(Lcom/android/launcher3/util/L1;I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic s(Lm2/g;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lm2/j;

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic t(Lcom/android/launcher3/widget/picker/T;)Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->p:Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic u(Lcom/android/launcher3/widget/picker/T;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic v(Lcom/android/launcher3/widget/picker/T;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private w()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/widget/picker/T;->o:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->c0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private x()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/widget/picker/T;->o:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->c0()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->T()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private y()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lm2/g;",
            ">;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/T;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->f:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->f:Ljava/util/List;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->e:Ljava/util/List;

    .line 17
    .line 18
    return-object p0
.end method


# virtual methods
.method public D(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lm2/g;

    .line 8
    .line 9
    iget-object p0, p0, Lm2/g;->b:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public E()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/T;->getItemCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-le p0, v0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public G()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Lcom/android/launcher3/widget/picker/C;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/android/launcher3/widget/picker/C;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->noneMatch(Ljava/util/function/Predicate;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public R()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->h:Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/T;->h:Lcom/android/launcher3/util/L1;

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->c0()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public S(Lcom/android/launcher3/widget/picker/T;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Lcom/android/launcher3/widget/picker/T;->n:Z

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/android/launcher3/widget/picker/T;->n:Z

    .line 4
    .line 5
    return-void
.end method

.method V()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/launcher3/widget/picker/L;

    .line 8
    .line 9
    invoke-direct {v1}, Lcom/android/launcher3/widget/picker/L;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lcom/android/launcher3/widget/picker/M;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/picker/M;-><init>(Lcom/android/launcher3/widget/picker/T;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public W(Ljava/util/function/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lm2/g;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/T;->j:Ljava/util/function/Predicate;

    .line 2
    .line 3
    return-void
.end method

.method public X(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/T;->d:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;

    .line 2
    .line 3
    return-void
.end method

.method public Y(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/picker/T;->m:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->c0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method Z(Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/T;->p:Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->setAdapter(Lcom/android/launcher3/widget/picker/T;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/T;->p:Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/widget/picker/T$a;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/picker/T$a;-><init>(Lcom/android/launcher3/widget/picker/T;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public a0(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lm2/g;",
            ">;",
            "Ljava/util/List<",
            "Lm2/g;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/T;->G()Z

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->e:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Lm2/a;

    .line 12
    .line 13
    invoke-direct {v1}, Lm2/a;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->c:Lcom/android/launcher3/widget/picker/T$c;

    .line 24
    .line 25
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->e:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    new-instance v1, Lcom/android/launcher3/widget/picker/O;

    .line 35
    .line 36
    invoke-direct {v1, v0}, Lcom/android/launcher3/widget/picker/O;-><init>(Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/T;->f:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 45
    .line 46
    .line 47
    iget-boolean p1, p0, Lcom/android/launcher3/widget/picker/T;->n:Z

    .line 48
    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-nez p1, :cond_0

    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/T;->f:Ljava/util/List;

    .line 58
    .line 59
    new-instance v0, Lm2/a;

    .line 60
    .line 61
    invoke-direct {v0}, Lm2/a;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    invoke-interface {p2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object p2, p0, Lcom/android/launcher3/widget/picker/T;->c:Lcom/android/launcher3/widget/picker/T$c;

    .line 72
    .line 73
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p2, p0, Lcom/android/launcher3/widget/picker/T;->f:Ljava/util/List;

    .line 78
    .line 79
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    new-instance v0, Lcom/android/launcher3/widget/picker/O;

    .line 83
    .line 84
    invoke-direct {v0, p2}, Lcom/android/launcher3/widget/picker/O;-><init>(Ljava/util/List;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/T;->f:Ljava/util/List;

    .line 91
    .line 92
    new-instance p2, Lm2/k;

    .line 93
    .line 94
    invoke-direct {p2}, Lm2/k;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->c0()V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public b0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lm2/g;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/T;->h:Lcom/android/launcher3/util/L1;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/widget/picker/T;->n:Z

    .line 6
    .line 7
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/widget/picker/T;->a0(Ljava/util/List;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public d(ZLcom/android/launcher3/util/L1;)V
    .locals 1

    .line 1
    if-nez p2, :cond_1

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->x()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->w()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    if-nez p1, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->h:Lcom/android/launcher3/util/L1;

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/L1;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->d:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->h:Lcom/android/launcher3/util/L1;

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/L1;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_3
    if-eqz p1, :cond_4

    .line 38
    .line 39
    iput-object p2, p0, Lcom/android/launcher3/widget/picker/T;->h:Lcom/android/launcher3/util/L1;

    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/T;->a:Landroid/content/Context;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 48
    .line 49
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->B:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 58
    .line 59
    invoke-interface {p1, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    const/4 p1, 0x0

    .line 64
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/T;->h:Lcom/android/launcher3/util/L1;

    .line 65
    .line 66
    :goto_0
    iput-object p2, p0, Lcom/android/launcher3/widget/picker/T;->l:Lcom/android/launcher3/util/L1;

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->c0()V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/T;->d:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;

    .line 72
    .line 73
    if-eqz p1, :cond_5

    .line 74
    .line 75
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->h:Lcom/android/launcher3/util/L1;

    .line 76
    .line 77
    if-eqz p0, :cond_5

    .line 78
    .line 79
    invoke-interface {p1, p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;->a(Lcom/android/launcher3/util/L1;)V

    .line 80
    .line 81
    .line 82
    :cond_5
    :goto_1
    return-void
.end method

.method public d0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/widget/picker/T;->n:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->h:Lcom/android/launcher3/util/L1;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/T;->l:Lcom/android/launcher3/util/L1;

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x2

    .line 18
    if-le v0, v1, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    sub-int/2addr v2, v1

    .line 27
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lm2/g;

    .line 32
    .line 33
    iget-object v0, v0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/android/launcher3/util/L1;->d(Lcom/android/launcher3/model/data/B;)Lcom/android/launcher3/util/L1;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/T;->l:Lcom/android/launcher3/util/L1;

    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemId(I)J
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lm2/g;

    .line 8
    .line 9
    iget-object v0, v0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/B;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/T;->getItemViewType(I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    int-to-long p0, p0

    .line 36
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lm2/g;

    .line 8
    .line 9
    instance-of p1, p0, Lm2/h;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const p0, 0x7f0b0674

    .line 14
    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    instance-of p1, p0, Lm2/o;

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    const p0, 0x7f0b0673

    .line 22
    .line 23
    .line 24
    return p0

    .line 25
    :cond_1
    instance-of p1, p0, Lm2/a;

    .line 26
    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    const p0, 0x7f0b0676

    .line 30
    .line 31
    .line 32
    return p0

    .line 33
    :cond_2
    instance-of p1, p0, Lm2/k;

    .line 34
    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    const p0, 0x7f0b0675

    .line 38
    .line 39
    .line 40
    return p0

    .line 41
    :cond_3
    instance-of p1, p0, Lm2/j;

    .line 42
    .line 43
    if-eqz p1, :cond_4

    .line 44
    .line 45
    const p0, 0x7f0b0672

    .line 46
    .line 47
    .line 48
    return p0

    .line 49
    :cond_4
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    .line 50
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v1, "ViewHolderBinder not found for "

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-direct {p1, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw p1
.end method

.method public onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->p:Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->d(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher3/widget/picker/T;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;ILjava/util/List;)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;ILjava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 2
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/T;->b:Landroid/util/SparseArray;

    invoke-virtual {p0, p2}, Lcom/android/launcher3/widget/picker/T;->getItemViewType(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LG1/e;

    const/4 v1, 0x1

    if-le p2, v1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    move v2, v1

    .line 3
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/T;->getItemCount()I

    move-result v3

    sub-int/2addr v3, v1

    .line 4
    iget-object v4, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lm2/k;

    if-eqz v3, :cond_1

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/T;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    goto :goto_1

    .line 6
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/T;->getItemCount()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    :goto_1
    if-ne p2, v1, :cond_2

    or-int/lit8 v2, v2, 0x2

    .line 7
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->g:Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {v0, p1, p0, v2, p3}, LG1/e;->c(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Ljava/lang/Object;ILjava/util/List;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->b:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LG1/e;

    .line 8
    .line 9
    invoke-interface {p0, p1}, LG1/e;->b(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/T;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->p:Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onFailedToRecycleView(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public onViewRecycled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T;->b:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getItemViewType()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, LG1/e;

    .line 12
    .line 13
    invoke-interface {p0, p1}, LG1/e;->a(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public z(Lcom/android/launcher3/util/L1;)Lm2/h;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Lcom/android/launcher3/widget/picker/D;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/android/launcher3/widget/picker/D;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Lcom/android/launcher3/widget/picker/E;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/android/launcher3/widget/picker/E;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v0, Lcom/android/launcher3/widget/picker/F;

    .line 28
    .line 29
    invoke-direct {v0, p1}, Lcom/android/launcher3/widget/picker/F;-><init>(Lcom/android/launcher3/util/L1;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-virtual {p0, p1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Lm2/h;

    .line 46
    .line 47
    return-object p0
.end method
