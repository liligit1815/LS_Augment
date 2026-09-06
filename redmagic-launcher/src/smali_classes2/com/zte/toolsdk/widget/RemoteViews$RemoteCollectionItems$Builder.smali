.class public final Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;
.super Ljava/lang/Object;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mHasStableIds:Z

.field private final mIds:Landroid/util/LongArray;

.field private mViewTypeCount:I

.field private final mViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/LongArray;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/LongArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mIds:Landroid/util/LongArray;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mViews:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public addItem(JLcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingGetterMatchingBuilder"
        }
    .end annotation

    .line 1
    if-eqz p3, :cond_1

    .line 2
    .line 3
    invoke-static {p3}, Lcom/zte/toolsdk/widget/RemoteViews;->G(Lcom/zte/toolsdk/widget/RemoteViews;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mIds:Landroid/util/LongArray;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Landroid/util/LongArray;->add(J)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mViews:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 21
    .line 22
    const-string p1, "RemoteViews used in a RemoteCollectionItems cannot specify separate layouts for orientations or sizes."

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    throw p0
.end method

.method public build()Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;
    .locals 5

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mViewTypeCount:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mViews:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v2, Lcom/zte/toolsdk/widget/j;

    .line 13
    .line 14
    invoke-direct {v2}, Lcom/zte/toolsdk/widget/j;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/util/stream/IntStream;->distinct()Ljava/util/stream/IntStream;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ljava/util/stream/IntStream;->count()J

    .line 26
    .line 27
    .line 28
    move-result-wide v2

    .line 29
    long-to-int v0, v2

    .line 30
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mViewTypeCount:I

    .line 31
    .line 32
    :cond_0
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mIds:Landroid/util/LongArray;

    .line 35
    .line 36
    invoke-virtual {v2}, Landroid/util/LongArray;->toArray()[J

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mViews:Ljava/util/List;

    .line 41
    .line 42
    const/4 v4, 0x0

    .line 43
    new-array v4, v4, [Lcom/zte/toolsdk/widget/RemoteViews;

    .line 44
    .line 45
    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, [Lcom/zte/toolsdk/widget/RemoteViews;

    .line 50
    .line 51
    iget-boolean v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mHasStableIds:Z

    .line 52
    .line 53
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mViewTypeCount:I

    .line 54
    .line 55
    invoke-static {p0, v1}, Ljava/lang/Math;->max(II)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-direct {v0, v2, v3, v4, p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;-><init>([J[Lcom/zte/toolsdk/widget/RemoteViews;ZI)V

    .line 60
    .line 61
    .line 62
    return-object v0
.end method

.method public setHasStableIds(Z)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mHasStableIds:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setViewTypeCount(I)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->mViewTypeCount:I

    .line 2
    .line 3
    return-object p0
.end method
