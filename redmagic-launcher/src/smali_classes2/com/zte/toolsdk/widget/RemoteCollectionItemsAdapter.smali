.class Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;
.super Landroid/widget/BaseAdapter;
.source "RemoteCollectionItemsAdapter.java"


# instance fields
.field private mColorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

.field private mInteractionHandler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

.field private mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

.field private mLayoutIdToViewType:Landroid/util/SparseIntArray;

.field private final mViewTypeCount:I


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getViewTypeCount()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mViewTypeCount:I

    .line 9
    .line 10
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mInteractionHandler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mColorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->initLayoutIdToViewType()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;I)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->lambda$initLayoutIdToViewType$0(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic b([ZI)Z
    .locals 0

    .line 1
    aget-boolean p0, p0, p1

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public static synthetic c()Ljava/lang/IllegalStateException;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    const-string v1, "RemoteCollectionItems has more distinct layout ids than its view type count"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method private static getViewToReapply(Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews;)Landroid/view/View;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    const v1, 0x1020018

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v2, v1, Ljava/lang/Integer;

    .line 13
    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_1
    invoke-virtual {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->getLayoutId()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    check-cast v1, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-ne p1, v1, :cond_2

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_2
    return-object v0
.end method

.method private initLayoutIdToViewType()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mLayoutIdToViewType:Landroid/util/SparseIntArray;

    .line 2
    .line 3
    new-instance v1, Landroid/util/SparseIntArray;

    .line 4
    .line 5
    iget v2, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mViewTypeCount:I

    .line 6
    .line 7
    invoke-direct {v1, v2}, Landroid/util/SparseIntArray;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mLayoutIdToViewType:Landroid/util/SparseIntArray;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemCount()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-static {v2, v1}, Ljava/util/stream/IntStream;->range(II)Ljava/util/stream/IntStream;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v3, Lcom/zte/toolsdk/widget/a;

    .line 24
    .line 25
    invoke-direct {v3, p0}, Lcom/zte/toolsdk/widget/a;-><init>(Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v1, v3}, Ljava/util/stream/IntStream;->map(Ljava/util/function/IntUnaryOperator;)Ljava/util/stream/IntStream;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Ljava/util/stream/IntStream;->distinct()Ljava/util/stream/IntStream;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v1}, Ljava/util/stream/IntStream;->toArray()[I

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    array-length v3, v1

    .line 41
    iget v4, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mViewTypeCount:I

    .line 42
    .line 43
    if-gt v3, v4, :cond_4

    .line 44
    .line 45
    array-length v3, v1

    .line 46
    new-array v3, v3, [Z

    .line 47
    .line 48
    new-array v4, v4, [Z

    .line 49
    .line 50
    const/4 v5, -0x1

    .line 51
    const/4 v6, 0x1

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    move v7, v2

    .line 55
    :goto_0
    array-length v8, v1

    .line 56
    if-ge v7, v8, :cond_1

    .line 57
    .line 58
    aget v8, v1, v7

    .line 59
    .line 60
    invoke-virtual {v0, v8, v5}, Landroid/util/SparseIntArray;->get(II)I

    .line 61
    .line 62
    .line 63
    move-result v9

    .line 64
    if-gez v9, :cond_0

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_0
    iget-object v10, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mLayoutIdToViewType:Landroid/util/SparseIntArray;

    .line 68
    .line 69
    invoke-virtual {v10, v8, v9}, Landroid/util/SparseIntArray;->put(II)V

    .line 70
    .line 71
    .line 72
    aput-boolean v6, v3, v7

    .line 73
    .line 74
    aput-boolean v6, v4, v9

    .line 75
    .line 76
    :goto_1
    add-int/lit8 v7, v7, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    :goto_2
    array-length v0, v1

    .line 80
    if-ge v2, v0, :cond_3

    .line 81
    .line 82
    aget-boolean v0, v3, v2

    .line 83
    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_2
    aget v0, v1, v2

    .line 88
    .line 89
    add-int/lit8 v5, v5, 0x1

    .line 90
    .line 91
    array-length v7, v1

    .line 92
    invoke-static {v5, v7}, Ljava/util/stream/IntStream;->range(II)Ljava/util/stream/IntStream;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    new-instance v7, Lcom/zte/toolsdk/widget/b;

    .line 97
    .line 98
    invoke-direct {v7, v4}, Lcom/zte/toolsdk/widget/b;-><init>([Z)V

    .line 99
    .line 100
    .line 101
    invoke-interface {v5, v7}, Ljava/util/stream/IntStream;->filter(Ljava/util/function/IntPredicate;)Ljava/util/stream/IntStream;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-interface {v5}, Ljava/util/stream/IntStream;->findFirst()Ljava/util/OptionalInt;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    new-instance v7, Lcom/zte/toolsdk/widget/c;

    .line 110
    .line 111
    invoke-direct {v7}, Lcom/zte/toolsdk/widget/c;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v5, v7}, Ljava/util/OptionalInt;->orElseThrow(Ljava/util/function/Supplier;)I

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    iget-object v7, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mLayoutIdToViewType:Landroid/util/SparseIntArray;

    .line 119
    .line 120
    invoke-virtual {v7, v0, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 121
    .line 122
    .line 123
    aput-boolean v6, v3, v2

    .line 124
    .line 125
    aput-boolean v6, v4, v5

    .line 126
    .line 127
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_3
    return-void

    .line 131
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 132
    .line 133
    new-instance v2, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    const-string v3, "Collection items uses "

    .line 139
    .line 140
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    array-length v1, v1

    .line 144
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v1, " distinct layouts, which is more than view type count of "

    .line 148
    .line 149
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mViewTypeCount:I

    .line 153
    .line 154
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    throw v0
.end method

.method private synthetic lambda$initLayoutIdToViewType$0(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemView(I)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getLayoutId()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItem(I)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemView(I)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->getItem(I)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p0

    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemId(I)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mLayoutIdToViewType:Landroid/util/SparseIntArray;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemView(I)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getLayoutId()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {v0, p0}, Landroid/util/SparseIntArray;->get(I)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->getCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lt p1, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getItemView(I)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 p1, 0x2

    .line 16
    invoke-virtual {v1, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->addFlags(I)V

    .line 17
    .line 18
    .line 19
    invoke-static {p2, v1}, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->getViewToReapply(Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    :try_start_0
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mInteractionHandler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 30
    .line 31
    iget-object v6, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mColorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 32
    .line 33
    const/4 v5, 0x0

    .line 34
    invoke-virtual/range {v1 .. v6}, Lcom/zte/toolsdk/widget/RemoteViews;->reapply(Landroid/content/Context;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    return-object v3

    .line 38
    :catch_0
    :cond_1
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mInteractionHandler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 43
    .line 44
    const/4 v5, 0x0

    .line 45
    iget-object v6, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mColorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 46
    .line 47
    move-object v3, p3

    .line 48
    invoke-virtual/range {v1 .. v6}, Lcom/zte/toolsdk/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public getViewTypeCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mViewTypeCount:I

    .line 2
    .line 3
    return p0
.end method

.method public hasStableIds()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->hasStableIds()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method setData(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mViewTypeCount:I

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->getViewTypeCount()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-lt v0, v1, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mItems:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mInteractionHandler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 12
    .line 13
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->mColorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteCollectionItemsAdapter;->initLayoutIdToViewType()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 23
    .line 24
    const-string p1, "RemoteCollectionItemsAdapter cannot increase view type count after creation"

    .line 25
    .line 26
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    throw p0
.end method
