.class public Lcom/zte/toolsdk/utils/RemoteViewsUtil;
.super Ljava/lang/Object;
.source "RemoteViewsUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static createChildItems(Landroid/content/Context;Lcom/zte/toolsdk/producer/ExpandableItemAdapter;Ljava/util/List;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Lcom/zte/toolsdk/producer/ExpandableItemAdapter<",
            "TT;TU;>;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "TU;>;>;)",
            "Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/zte/toolsdk/utils/a;

    .line 6
    .line 7
    invoke-direct {v1}, Lcom/zte/toolsdk/utils/a;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ljava/util/stream/IntStream;->sum()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    new-instance v1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    new-array v0, v0, [J

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    move v7, v2

    .line 27
    move v9, v7

    .line 28
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-ge v7, v3, :cond_1

    .line 33
    .line 34
    invoke-interface {p2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    move-object v10, v3

    .line 39
    check-cast v10, Ljava/util/List;

    .line 40
    .line 41
    move v8, v2

    .line 42
    :goto_1
    invoke-interface {v10}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-ge v8, v3, :cond_0

    .line 47
    .line 48
    invoke-interface {v10, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    new-instance v5, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ExpandableItemAdapter;->getChildLayoutId()I

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    invoke-direct {v5, v4, v6}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v5, v3}, Lcom/zte/toolsdk/producer/ExpandableItemAdapter;->bindChild(Lcom/zte/toolsdk/widget/RemoteViews;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    new-instance v6, Landroid/content/Intent;

    .line 69
    .line 70
    invoke-direct {v6}, Landroid/content/Intent;-><init>()V

    .line 71
    .line 72
    .line 73
    move-object v4, p0

    .line 74
    move-object v3, p1

    .line 75
    invoke-virtual/range {v3 .. v8}, Lcom/zte/toolsdk/producer/ExpandableItemAdapter;->bindListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;II)V

    .line 76
    .line 77
    .line 78
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    add-int/lit8 v8, v8, 0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_0
    move-object v4, p0

    .line 85
    move-object v3, p1

    .line 86
    invoke-interface {v10}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    add-int/2addr v9, p0

    .line 91
    int-to-long p0, v9

    .line 92
    aput-wide p0, v0, v7

    .line 93
    .line 94
    add-int/lit8 v7, v7, 0x1

    .line 95
    .line 96
    move-object p1, v3

    .line 97
    move-object p0, v4

    .line 98
    goto :goto_0

    .line 99
    :cond_1
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 100
    .line 101
    new-array p1, v2, [Lcom/zte/toolsdk/widget/RemoteViews;

    .line 102
    .line 103
    invoke-interface {v1, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, [Lcom/zte/toolsdk/widget/RemoteViews;

    .line 108
    .line 109
    const/4 p2, 0x1

    .line 110
    invoke-direct {p0, v0, p1, p2, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;-><init>([J[Lcom/zte/toolsdk/widget/RemoteViews;ZI)V

    .line 111
    .line 112
    .line 113
    return-object p0
.end method

.method private static createGroupItems(Landroid/content/Context;Lcom/zte/toolsdk/producer/ExpandableItemAdapter;Ljava/util/List;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Lcom/zte/toolsdk/producer/ExpandableItemAdapter<",
            "TT;TU;>;",
            "Ljava/util/List<",
            "TT;>;)",
            "Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->setHasStableIds(Z)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_0

    .line 16
    .line 17
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    new-instance v3, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ExpandableItemAdapter;->getGroupLayoutId()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    invoke-direct {v3, v4, v5}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v3, v2}, Lcom/zte/toolsdk/producer/ExpandableItemAdapter;->bindGroup(Lcom/zte/toolsdk/widget/RemoteViews;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    int-to-long v4, v1

    .line 38
    invoke-virtual {v0, v4, v5, v3}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->addItem(JLcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    .line 39
    .line 40
    .line 41
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->build()Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method private static createItems(Landroid/content/Context;Lcom/zte/toolsdk/producer/ItemAdapter;Ljava/util/List;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Lcom/zte/toolsdk/producer/ItemAdapter;",
            "Ljava/util/List<",
            "TT;>;)",
            "Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->setHasStableIds(Z)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_0

    .line 16
    .line 17
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    new-instance v3, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ItemAdapter;->getLayoutId()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    invoke-direct {v3, v4, v5}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v3, v2}, Lcom/zte/toolsdk/producer/ItemAdapter;->bindData(Lcom/zte/toolsdk/widget/RemoteViews;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Landroid/content/Intent;

    .line 38
    .line 39
    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p0, v3, v2, v1}, Lcom/zte/toolsdk/producer/ItemAdapter;->bindListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V

    .line 43
    .line 44
    .line 45
    int-to-long v4, v1

    .line 46
    invoke-virtual {v0, v4, v5, v3}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->addItem(JLcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    .line 47
    .line 48
    .line 49
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->build()Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public static loopLottieAnimation(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/Boolean;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string v0, "loop"

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setBoolean(ILjava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static pauseLottieAnimation(Lcom/zte/toolsdk/widget/RemoteViews;I)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string v0, "pauseAnimation"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->setVoid(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static playLottieAnimation(Lcom/zte/toolsdk/widget/RemoteViews;I)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string v0, "playAnimation"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->setVoid(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static setAdapter(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/producer/ItemAdapter;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            "I",
            "Lcom/zte/toolsdk/producer/ItemAdapter;",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p0, p3, p4}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->createItems(Landroid/content/Context;Lcom/zte/toolsdk/producer/ItemAdapter;Ljava/util/List;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p2, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->setRemoteAdapter(ILcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static setBoolean(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;Z)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setBoolean(ILjava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setByte(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;B)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setByte(ILjava/lang/String;B)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setChar(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;C)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setChar(ILjava/lang/String;C)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setCharSequence(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setCharSequence(ILjava/lang/String;Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setChronometer(Lcom/zte/toolsdk/widget/RemoteViews;IJLjava/lang/String;Z)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/zte/toolsdk/widget/RemoteViews;->setChronometer(IJLjava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setChronometerCountDown(Lcom/zte/toolsdk/widget/RemoteViews;IZ)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setChronometerCountDown(IZ)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setDouble(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;D)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/zte/toolsdk/widget/RemoteViews;->setDouble(ILjava/lang/String;D)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setExpandableListAdapter(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/producer/ExpandableItemAdapter;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            "I",
            "Lcom/zte/toolsdk/producer/ExpandableItemAdapter<",
            "TT;TU;>;",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "TU;>;>;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p0, p3, p4}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->createGroupItems(Landroid/content/Context;Lcom/zte/toolsdk/producer/ExpandableItemAdapter;Ljava/util/List;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    invoke-static {p0, p3, p5}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->createChildItems(Landroid/content/Context;Lcom/zte/toolsdk/producer/ExpandableItemAdapter;Ljava/util/List;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p2, p4, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->setRemoteExpandableListAdapter(ILcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static setFloat(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;F)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setFloat(ILjava/lang/String;F)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setImageViewBitmap(Lcom/zte/toolsdk/widget/RemoteViews;ILandroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setImageViewResource(Lcom/zte/toolsdk/widget/RemoteViews;II)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setImageViewResource(II)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setInt(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;I)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setLong(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;J)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/zte/toolsdk/widget/RemoteViews;->setLong(ILjava/lang/String;J)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setLottieAnimation(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string v0, "setAnimation"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setString(ILjava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static setOnCheckedChangeListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V
    .locals 1

    const/4 v0, -0x1

    .line 1
    invoke-static {p0, p1, p2, v0, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setOnCheckedChangeListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;II)V

    return-void
.end method

.method public static setOnCheckedChangeListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;II)V
    .locals 1

    if-eqz p1, :cond_0

    .line 2
    const-string v0, "position"

    invoke-virtual {p2, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 3
    const-string p3, "viewId"

    invoke-virtual {p2, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/high16 p3, 0xa000000

    .line 4
    invoke-static {p0, p4, p2, p3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->fromPendingIntent(Landroid/app/PendingIntent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    move-result-object p0

    invoke-virtual {p1, p4, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->setOnCheckedChangeResponse(ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V

    :cond_0
    return-void
.end method

.method public static setOnClickFillInIntentListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;II)V
    .locals 0

    if-eqz p1, :cond_0

    .line 1
    const-string p0, "position"

    invoke-virtual {p2, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 2
    const-string p0, "viewId"

    invoke-virtual {p2, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 3
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-virtual {p1, p4, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->setOnClickFillInIntent(ILandroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public static setOnClickFillInIntentListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;III)V
    .locals 0

    if-eqz p1, :cond_0

    .line 4
    const-string p0, "position"

    invoke-virtual {p2, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 5
    const-string p0, "viewId"

    invoke-virtual {p2, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 6
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-virtual {p1, p5, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->setOnClickFillInIntent(ILandroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public static setOnClickListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V
    .locals 1

    const/4 v0, -0x1

    .line 1
    invoke-static {p0, p1, p2, v0, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setOnClickListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;II)V

    return-void
.end method

.method public static setOnClickListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;II)V
    .locals 1

    if-eqz p1, :cond_0

    .line 2
    const-string v0, "position"

    invoke-virtual {p2, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 3
    const-string p3, "viewId"

    invoke-virtual {p2, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/high16 p3, 0xa000000

    .line 4
    invoke-static {p0, p4, p2, p3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    .line 5
    invoke-virtual {p1, p4, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    :cond_0
    return-void
.end method

.method public static setOnGroupCollapseListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "viewId"

    .line 4
    .line 5
    invoke-virtual {p2, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    const/high16 v1, 0xa000000

    .line 10
    .line 11
    invoke-static {p0, v0, p2, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p3, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->setOnGroupCollapsePendingIntent(ILandroid/app/PendingIntent;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static setOnGroupExpandListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "viewId"

    .line 4
    .line 5
    invoke-virtual {p2, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    const/high16 v1, 0xa000000

    .line 10
    .line 11
    invoke-static {p0, v0, p2, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p3, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->setOnGroupExpandPendingIntent(ILandroid/app/PendingIntent;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static setOnLongClickMenuListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;II[Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    array-length p0, p5

    .line 6
    if-lez p0, :cond_0

    .line 7
    .line 8
    const-string p0, "position"

    .line 9
    .line 10
    invoke-virtual {p2, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "viewId"

    .line 14
    .line 15
    invoke-virtual {p2, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    new-instance p0, Landroid/content/Intent;

    .line 19
    .line 20
    invoke-direct {p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p4, p0, p5}, Lcom/zte/toolsdk/widget/RemoteViews;->setOnLongClickFillInIntent(ILandroid/content/Intent;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static setOnSeekBarChangeListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V
    .locals 1

    const/4 v0, -0x1

    .line 1
    invoke-static {p0, p1, p2, v0, p3}, Lcom/zte/toolsdk/utils/RemoteViewsUtil;->setOnSeekBarChangeListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;II)V

    return-void
.end method

.method public static setOnSeekBarChangeListener(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;II)V
    .locals 1

    if-eqz p1, :cond_0

    .line 2
    const-string v0, "position"

    invoke-virtual {p2, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 3
    const-string p3, "viewId"

    invoke-virtual {p2, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/high16 p3, 0xa000000

    .line 4
    invoke-static {p0, p4, p2, p3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    .line 5
    invoke-virtual {p1, p4, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->setOnSeekBarChangeResponse(ILandroid/app/PendingIntent;)V

    :cond_0
    return-void
.end method

.method public static setPendingIntentTemplate(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Intent;I)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/high16 v1, 0xa000000

    .line 5
    .line 6
    invoke-static {p0, v0, p2, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p3, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->setPendingIntentTemplate(ILandroid/app/PendingIntent;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static setProgress(Lcom/zte/toolsdk/widget/RemoteViews;II)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string v0, "setProgress"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static setRadioButtonState(Lcom/zte/toolsdk/widget/RemoteViews;IZ)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setCompoundButtonChecked(IZ)V

    .line 4
    .line 5
    .line 6
    const-string p2, "setButtonDrawable"

    .line 7
    .line 8
    sget v0, LR3/f;->d:I

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static setShort(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;S)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setShort(ILjava/lang/String;S)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setString(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setString(ILjava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setSwitchState(Lcom/zte/toolsdk/widget/RemoteViews;IZ)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setCompoundButtonChecked(IZ)V

    .line 4
    .line 5
    .line 6
    const-string p2, "setThumbResource"

    .line 7
    .line 8
    sget v0, LR3/f;->K:I

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    const-string p2, "setTrackResource"

    .line 14
    .line 15
    sget v0, LR3/f;->L:I

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static setTextColor(Lcom/zte/toolsdk/widget/RemoteViews;II)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setTextColor(II)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setTextViewText(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setViewLayoutHeight(Lcom/zte/toolsdk/widget/RemoteViews;IFI)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setViewLayoutHeight(IFI)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setViewLayoutMargin(Lcom/zte/toolsdk/widget/RemoteViews;IIFI)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/zte/toolsdk/widget/RemoteViews;->setViewLayoutMargin(IIFI)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setViewLayoutWidth(Lcom/zte/toolsdk/widget/RemoteViews;IFI)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setViewLayoutWidth(IFI)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setViewPadding(Lcom/zte/toolsdk/widget/RemoteViews;IIIII)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/zte/toolsdk/widget/RemoteViews;->setViewPadding(IIIII)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setViewVisibility(Lcom/zte/toolsdk/widget/RemoteViews;II)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setViewVisibility(II)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static setVoid(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setVoid(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method
