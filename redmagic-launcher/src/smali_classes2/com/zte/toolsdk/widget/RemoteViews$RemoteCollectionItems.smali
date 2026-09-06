.class public final Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;
.super Ljava/lang/Object;
.source "RemoteViews.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RemoteCollectionItems"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mHasStableIds:Z

.field private mHierarchyRootData:Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

.field private final mIds:[J

.field private final mViewTypeCount:I

.field private final mViews:[Lcom/zte/toolsdk/widget/RemoteViews;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V
    .locals 10

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    invoke-virtual {p1}, Landroid/os/Parcel;->readBoolean()Z

    move-result v0

    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mHasStableIds:Z

    .line 16
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViewTypeCount:I

    .line 17
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 18
    new-array v1, v0, [J

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mIds:[J

    .line 19
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readLongArray([J)V

    .line 20
    invoke-virtual {p1}, Landroid/os/Parcel;->readBoolean()Z

    move-result v1

    .line 21
    new-array v2, v0, [Lcom/zte/toolsdk/widget/RemoteViews;

    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViews:[Lcom/zte/toolsdk/widget/RemoteViews;

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    if-eqz p2, :cond_0

    .line 22
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mHierarchyRootData:Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    goto :goto_0

    .line 23
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Cannot unparcel a RemoteCollectionItems that was parceled as attached without providing data for a root RemoteViews"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 24
    :cond_1
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-direct {p2, p1}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Landroid/os/Parcel;)V

    aput-object p2, v2, v3

    .line 25
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews;->B(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object p2

    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mHierarchyRootData:Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    const/4 v3, 0x1

    :goto_0
    if-ge v3, v0, :cond_2

    .line 26
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViews:[Lcom/zte/toolsdk/widget/RemoteViews;

    new-instance v4, Lcom/zte/toolsdk/widget/RemoteViews;

    iget-object v6, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mHierarchyRootData:Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v7, 0x0

    move-object v5, p1

    invoke-direct/range {v4 .. v9}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;Landroid/content/pm/ApplicationInfo;ILcom/zte/toolsdk/widget/z;)V

    aput-object v4, p2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public constructor <init>([J[Lcom/zte/toolsdk/widget/RemoteViews;ZI)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mIds:[J

    .line 3
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViews:[Lcom/zte/toolsdk/widget/RemoteViews;

    .line 4
    iput-boolean p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mHasStableIds:Z

    .line 5
    iput p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViewTypeCount:I

    .line 6
    array-length p1, p1

    array-length p3, p2

    if-ne p1, p3, :cond_3

    const/4 p1, 0x1

    if-lt p4, p1, :cond_2

    .line 7
    invoke-static {p2}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object p3

    new-instance v0, Lcom/zte/toolsdk/widget/j;

    invoke-direct {v0}, Lcom/zte/toolsdk/widget/j;-><init>()V

    invoke-interface {p3, v0}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/stream/IntStream;->distinct()Ljava/util/stream/IntStream;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/stream/IntStream;->count()J

    move-result-wide v0

    long-to-int p3, v0

    if-gt p3, p4, :cond_1

    .line 8
    array-length p3, p2

    if-lez p3, :cond_0

    const/4 p3, 0x0

    .line 9
    aget-object p4, p2, p3

    invoke-static {p4}, Lcom/zte/toolsdk/widget/RemoteViews;->B(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object p4

    invoke-virtual {p0, p4}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 10
    aget-object p0, p2, p3

    invoke-static {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->x(Lcom/zte/toolsdk/widget/RemoteViews;Z)V

    :cond_0
    return-void

    .line 11
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "View type count is set to "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", but the collection contains "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " different layout ids"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 12
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "View type count must be >= 1"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 13
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "RemoteCollectionItems has different number of ids and views"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static bridge synthetic a(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)[Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViews:[Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Ljava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->visitUris(Ljava/util/function/Consumer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Landroid/os/Parcel;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->writeToParcel(Landroid/os/Parcel;IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private visitUris(Ljava/util/function/Consumer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViews:[Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-virtual {v2, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->visitUris(Ljava/util/function/Consumer;)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method private writeToParcel(Landroid/os/Parcel;IZ)V
    .locals 8

    const/4 v0, 0x1

    .line 2
    :try_start_0
    const-string v1, "android.os.Parcel"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 3
    const-string v2, "allowSquashing"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 4
    new-array v4, v3, [Ljava/lang/Object;

    invoke-virtual {v2, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 5
    iget-boolean v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mHasStableIds:Z

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeBoolean(Z)V

    .line 6
    iget v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViewTypeCount:I

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 7
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mIds:[J

    array-length v4, v4

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 8
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mIds:[J

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeLongArray([J)V

    if-eqz p3, :cond_1

    .line 9
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mHierarchyRootData:Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    if-eqz v4, :cond_0

    goto :goto_0

    .line 10
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Cannot call writeToParcelAttached for a RemoteCollectionItems without first calling setHierarchyRootData()"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 11
    :cond_1
    :goto_0
    invoke-virtual {p1, p3}, Landroid/os/Parcel;->writeBoolean(Z)V

    if-nez p3, :cond_2

    .line 12
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViews:[Lcom/zte/toolsdk/widget/RemoteViews;

    array-length v4, p3

    if-lez v4, :cond_2

    aget-object p3, p3, v3

    invoke-static {p3}, Lcom/zte/toolsdk/widget/RemoteViews;->t(Lcom/zte/toolsdk/widget/RemoteViews;)Z

    move-result p3

    if-nez p3, :cond_2

    .line 13
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViews:[Lcom/zte/toolsdk/widget/RemoteViews;

    aget-object p3, p3, v3

    invoke-static {p3, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->x(Lcom/zte/toolsdk/widget/RemoteViews;Z)V

    move p3, v0

    goto :goto_1

    :cond_2
    move p3, v3

    .line 14
    :goto_1
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViews:[Lcom/zte/toolsdk/widget/RemoteViews;

    array-length v5, v4

    move v6, v3

    :goto_2
    if-ge v6, v5, :cond_3

    aget-object v7, v4, v6

    .line 15
    invoke-virtual {v7, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->writeToParcel(Landroid/os/Parcel;I)V

    add-int/2addr v6, v0

    goto :goto_2

    :cond_3
    if-eqz p3, :cond_4

    .line 16
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViews:[Lcom/zte/toolsdk/widget/RemoteViews;

    aget-object p0, p0, v3

    invoke-static {p0, v3}, Lcom/zte/toolsdk/widget/RemoteViews;->x(Lcom/zte/toolsdk/widget/RemoteViews;Z)V

    .line 17
    :cond_4
    const-string p0, "restoreAllowSquashing"

    sget-object p2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {p2}, [Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {v1, p0, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    .line 18
    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "remote collection items write to parcel error: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "RemoteViews"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mIds:[J

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mIds:[J

    .line 2
    .line 3
    aget-wide p0, p0, p1

    .line 4
    .line 5
    return-wide p0
.end method

.method public getItemView(I)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViews:[Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public getViewTypeCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViewTypeCount:I

    .line 2
    .line 3
    return p0
.end method

.method public hasStableIds()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mHasStableIds:Z

    .line 2
    .line 3
    return p0
.end method

.method setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mHierarchyRootData:Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->mViews:[Lcom/zte/toolsdk/widget/RemoteViews;

    .line 4
    .line 5
    array-length v0, p0

    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    if-ge v1, v0, :cond_0

    .line 8
    .line 9
    aget-object v2, p0, v1

    .line 10
    .line 11
    invoke-static {v2, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->z(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 12
    .line 13
    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->writeToParcel(Landroid/os/Parcel;IZ)V

    return-void
.end method
