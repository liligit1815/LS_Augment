.class Lcom/android/quickstep/util/TaskKeyLruCache$MyLinkedHashMap;
.super Ljava/util/LinkedHashMap;
.source "TaskKeyLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/TaskKeyLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MyLinkedHashMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/LinkedHashMap<",
        "Ljava/lang/Integer;",
        "Lcom/android/quickstep/util/TaskKeyCache$Entry<",
        "TV;>;>;"
    }
.end annotation


# instance fields
.field private final mMaxSize:I


# direct methods
.method constructor <init>(I)V
    .locals 3

    .line 1
    const/high16 v0, 0x3f400000    # 0.75f

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {p0, v2, v0, v1}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    .line 6
    .line 7
    .line 8
    iput p1, p0, Lcom/android/quickstep/util/TaskKeyLruCache$MyLinkedHashMap;->mMaxSize:I

    .line 9
    .line 10
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/TaskKeyLruCache$MyLinkedHashMap;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/TaskKeyLruCache$MyLinkedHashMap;->mMaxSize:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Integer;",
            "Lcom/android/quickstep/util/TaskKeyCache$Entry<",
            "TV;>;>;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->size()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget p0, p0, Lcom/android/quickstep/util/TaskKeyLruCache$MyLinkedHashMap;->mMaxSize:I

    .line 6
    .line 7
    if-le p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method
