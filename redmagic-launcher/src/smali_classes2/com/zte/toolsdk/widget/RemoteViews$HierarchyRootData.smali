.class final Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;
.super Ljava/lang/Object;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "HierarchyRootData"
.end annotation


# instance fields
.field final mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

.field final mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

.field final mClassCookies:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final mRemoteCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;",
            "Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;",
            "Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;",
            "Ljava/util/Map<",
            "Ljava/lang/Class;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;->mRemoteCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;->mClassCookies:Ljava/util/Map;

    .line 11
    .line 12
    return-void
.end method
