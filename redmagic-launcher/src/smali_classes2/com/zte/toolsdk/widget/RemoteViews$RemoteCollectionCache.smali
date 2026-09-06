.class Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;
.super Ljava/lang/Object;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RemoteCollectionCache"
.end annotation


# instance fields
.field private final mIdToUriMapping:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mUriToCollectionMapping:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/zte/toolsdk/widget/RemoteViews;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 3
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mUriToCollectionMapping:Ljava/util/Map;

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V
    .locals 7

    .line 11
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 13
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mUriToCollectionMapping:Ljava/util/Map;

    .line 14
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 15
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->l(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    move-result-object v2

    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->h(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    move-result-object v3

    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->q(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/Map;

    move-result-object p1

    invoke-direct {v1, v2, p0, v3, p1}, Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;Ljava/util/Map;)V

    const/4 p1, 0x0

    move v2, p1

    :goto_0
    if-ge v2, v0, :cond_0

    .line 16
    :try_start_0
    const-string v3, "android.os.Parcel"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 17
    const-string v4, "readString8"

    new-array v5, p1, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 18
    new-array v4, p1, [Ljava/lang/Object;

    invoke-virtual {v3, p2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 19
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 20
    new-instance v5, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    invoke-direct {v5, p2, v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;-><init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 21
    iget-object v6, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    invoke-virtual {v6, v4, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 22
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mUriToCollectionMapping:Ljava/util/Map;

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    .line 23
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "RemoteCollectionCache from parcel error: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "RemoteViews"

    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;)V
    .locals 3

    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 6
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mUriToCollectionMapping:Ljava/util/Map;

    const/4 p1, 0x0

    .line 7
    :goto_0
    iget-object v0, p2, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 8
    iget-object v0, p2, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 9
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    iget-object v2, p2, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 10
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mUriToCollectionMapping:Ljava/util/Map;

    iget-object v2, p2, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mUriToCollectionMapping:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;Ljava/lang/String;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->lambda$connectAllUniqueIntents$0(Ljava/lang/String;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(I)[Ljava/util/concurrent/CompletableFuture;
    .locals 0

    .line 1
    new-array p0, p0, [Ljava/util/concurrent/CompletableFuture;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;)Landroid/util/SparseArray;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 2
    .line 3
    return-object p0
.end method

.method private collectAllIntentsInternal(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/util/SparseArray;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            "Landroid/util/SparseArray<",
            "Landroid/content/Intent;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->H(Lcom/zte/toolsdk/widget/RemoteViews;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->w(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_9

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 26
    .line 27
    invoke-direct {p0, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->collectAllIntentsInternal(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/util/SparseArray;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->F(Lcom/zte/toolsdk/widget/RemoteViews;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->u(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-direct {p0, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->collectAllIntentsInternal(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/util/SparseArray;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->v(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->collectAllIntentsInternal(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/util/SparseArray;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->g(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    if-eqz v0, :cond_9

    .line 57
    .line 58
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->g(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/ArrayList;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_9

    .line 71
    .line 72
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 77
    .line 78
    instance-of v1, v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;

    .line 79
    .line 80
    if-eqz v1, :cond_8

    .line 81
    .line 82
    check-cast v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;

    .line 83
    .line 84
    iget v1, v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 85
    .line 86
    const/4 v2, -0x1

    .line 87
    if-eq v1, v2, :cond_3

    .line 88
    .line 89
    iget-boolean v3, v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIsReplacedIntoAction:Z

    .line 90
    .line 91
    if-nez v3, :cond_3

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    const/4 v3, 0x0

    .line 95
    const/4 v4, 0x0

    .line 96
    if-eq v1, v2, :cond_5

    .line 97
    .line 98
    iget-boolean v5, v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIsReplacedIntoAction:Z

    .line 99
    .line 100
    if-eqz v5, :cond_5

    .line 101
    .line 102
    iput-boolean v4, v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIsReplacedIntoAction:Z

    .line 103
    .line 104
    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->contains(I)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-eqz v1, :cond_4

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_4
    iget v1, v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 112
    .line 113
    iget-object v2, v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mServiceIntent:Landroid/content/Intent;

    .line 114
    .line 115
    invoke-virtual {p2, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v0, v3}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->b(Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_5
    iget-object v1, v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mServiceIntent:Landroid/content/Intent;

    .line 123
    .line 124
    if-eqz v1, :cond_7

    .line 125
    .line 126
    invoke-virtual {v1, v4}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 131
    .line 132
    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->indexOfValueByValue(Ljava/lang/Object;)I

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    if-ne v4, v2, :cond_6

    .line 137
    .line 138
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 139
    .line 140
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    iput v2, v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 145
    .line 146
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 147
    .line 148
    invoke-virtual {v4, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    iget v1, v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 152
    .line 153
    iget-object v2, v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mServiceIntent:Landroid/content/Intent;

    .line 154
    .line 155
    invoke-virtual {p2, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    invoke-static {v0, v3}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->b(Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_6
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 163
    .line 164
    invoke-virtual {v1, v4}, Landroid/util/SparseArray;->keyAt(I)I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    iput v1, v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 169
    .line 170
    invoke-static {v0, v3}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->b(Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V

    .line 171
    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_7
    invoke-static {v0}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->a(Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-static {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->a(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)[Lcom/zte/toolsdk/widget/RemoteViews;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    array-length v1, v0

    .line 183
    :goto_2
    if-ge v4, v1, :cond_2

    .line 184
    .line 185
    aget-object v2, v0, v4

    .line 186
    .line 187
    invoke-direct {p0, v2, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->collectAllIntentsInternal(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/util/SparseArray;)V

    .line 188
    .line 189
    .line 190
    add-int/lit8 v4, v4, 0x1

    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_8
    instance-of v1, v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;

    .line 194
    .line 195
    if-eqz v1, :cond_2

    .line 196
    .line 197
    check-cast v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;

    .line 198
    .line 199
    invoke-static {v0}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->d(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    if-eqz v1, :cond_2

    .line 204
    .line 205
    invoke-static {v0}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->d(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-direct {p0, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->collectAllIntentsInternal(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/util/SparseArray;)V

    .line 210
    .line 211
    .line 212
    goto/16 :goto_1

    .line 213
    .line 214
    :cond_9
    return-void
.end method

.method private connectAllUniqueIntents(ILandroid/util/SparseArray;)Ljava/util/concurrent/CompletableFuture;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/util/SparseArray<",
            "Landroid/content/Intent;",
            ">;)",
            "Ljava/util/concurrent/CompletableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p2}, Landroid/util/SparseArray;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 14
    .line 15
    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Landroid/content/Intent;

    .line 30
    .line 31
    invoke-static {v3, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->getItemsFutureFromIntentWithTimeout(Landroid/content/Intent;I)Ljava/util/concurrent/CompletableFuture;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    new-instance v4, Lcom/zte/toolsdk/widget/h;

    .line 36
    .line 37
    invoke-direct {v4, p0, v2}, Lcom/zte/toolsdk/widget/h;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v4}, Ljava/util/concurrent/CompletableFuture;->thenAccept(Ljava/util/function/Consumer;)Ljava/util/concurrent/CompletableFuture;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    new-instance p0, Lcom/zte/toolsdk/widget/i;

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/i;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-interface {v0, p0}, Ljava/util/List;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, [Ljava/util/concurrent/CompletableFuture;

    .line 60
    .line 61
    invoke-static {p0}, Ljava/util/concurrent/CompletableFuture;->allOf([Ljava/util/concurrent/CompletableFuture;)Ljava/util/concurrent/CompletableFuture;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method private static getItemsFutureFromIntentWithTimeout(Landroid/content/Intent;I)Ljava/util/concurrent/CompletableFuture;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "I)",
            "Ljava/util/concurrent/CompletableFuture<",
            "Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, "RemoteViews"

    .line 4
    .line 5
    const-string p1, "Null intent received when generating adapter future"

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->build()Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ljava/util/concurrent/CompletableFuture;->completedFuture(Ljava/lang/Object;)Ljava/util/concurrent/CompletableFuture;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;

    .line 25
    .line 26
    .line 27
    new-instance p0, Ljava/util/concurrent/CompletableFuture;

    .line 28
    .line 29
    invoke-direct {p0}, Ljava/util/concurrent/CompletableFuture;-><init>()V

    .line 30
    .line 31
    .line 32
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    .line 33
    .line 34
    invoke-direct {p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->build()Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-wide/16 v0, 0x4e20

    .line 42
    .line 43
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 44
    .line 45
    invoke-virtual {p0, p1, v0, v1, v2}, Ljava/util/concurrent/CompletableFuture;->completeOnTimeout(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/CompletableFuture;

    .line 46
    .line 47
    .line 48
    return-object p0
.end method

.method private synthetic lambda$connectAllUniqueIntents$0(Ljava/lang/String;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/toolsdk/widget/RemoteViews;->B(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mUriToCollectionMapping:Ljava/util/Map;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public collectAllIntentsNoComplete(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/concurrent/CompletableFuture;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            ")",
            "Ljava/util/concurrent/CompletableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->collectAllIntentsInternal(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/util/SparseArray;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const-string p0, "RemoteViews"

    .line 16
    .line 17
    const-string p1, "Possibly notifying updates for nonexistent view Id"

    .line 18
    .line 19
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    invoke-static {p0}, Ljava/util/concurrent/CompletableFuture;->completedFuture(Ljava/lang/Object;)Ljava/util/concurrent/CompletableFuture;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->this$0:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-static {v2, v1, v3, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->K(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;ILandroid/util/SparseArray;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/os/Parcel;->dataSize()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    const v4, 0xc3500

    .line 43
    .line 44
    .line 45
    sub-int/2addr v4, v2

    .line 46
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 47
    .line 48
    .line 49
    if-gez v4, :cond_1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    div-int v3, v4, p1

    .line 53
    .line 54
    :goto_0
    invoke-direct {p0, v3, v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->connectAllUniqueIntents(ILandroid/util/SparseArray;)Ljava/util/concurrent/CompletableFuture;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method getItemsForId(I)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mUriToCollectionMapping:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 16
    .line 17
    return-object p0
.end method

.method setHierarchyDataForId(ILcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mUriToCollectionMapping:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance p0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string p2, "Error setting hierarchy data for id="

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "RemoteViews"

    .line 35
    .line 36
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mUriToCollectionMapping:Ljava/util/Map;

    .line 41
    .line 42
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 47
    .line 48
    invoke-virtual {p0, p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;ILandroid/util/SparseArray;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Parcel;",
            "I",
            "Landroid/util/SparseArray<",
            "Landroid/content/Intent;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    :goto_0
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ge v1, v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz p3, :cond_0

    .line 27
    .line 28
    invoke-virtual {p3, v2}, Landroid/util/SparseArray;->contains(I)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_0

    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_0
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mIdToUriMapping:Landroid/util/SparseArray;

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Ljava/lang/String;

    .line 45
    .line 46
    :try_start_0
    const-string v3, "android.os.Parcel"

    .line 47
    .line 48
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const-string v4, "writeString8"

    .line 53
    .line 54
    const-class v5, Ljava/lang/String;

    .line 55
    .line 56
    filled-new-array {v5}, [Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v3, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :catch_0
    move-exception v3

    .line 73
    new-instance v4, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v5, "RemoteCollectionCache writeToParcel error: "

    .line 79
    .line 80
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    const-string v4, "RemoteViews"

    .line 95
    .line 96
    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    :goto_1
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->mUriToCollectionMapping:Ljava/util/Map;

    .line 100
    .line 101
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    check-cast v2, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    .line 106
    .line 107
    invoke-static {v2, p1, p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;->e(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Landroid/os/Parcel;IZ)V

    .line 108
    .line 109
    .line 110
    :goto_2
    add-int/2addr v1, v0

    .line 111
    goto :goto_0

    .line 112
    :cond_1
    return-void
.end method
