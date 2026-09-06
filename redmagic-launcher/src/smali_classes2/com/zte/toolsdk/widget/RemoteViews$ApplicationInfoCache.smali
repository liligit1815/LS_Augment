.class Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;
.super Ljava/lang/Object;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ApplicationInfoCache"
.end annotation


# instance fields
.field private final mPackageUserToApplicationInfo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/content/pm/ApplicationInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/ArrayMap;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;->mPackageUserToApplicationInfo:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Landroid/content/pm/ApplicationInfo;Landroid/util/Pair;)Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method get(Landroid/content/pm/ApplicationInfo;)Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->Q(Landroid/content/pm/ApplicationInfo;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;->mPackageUserToApplicationInfo:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/content/pm/ApplicationInfo;

    .line 16
    .line 17
    return-object p0
.end method

.method getOrPut(Landroid/content/pm/ApplicationInfo;)Landroid/content/pm/ApplicationInfo;
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->Q(Landroid/content/pm/ApplicationInfo;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;->mPackageUserToApplicationInfo:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v1, Lcom/zte/toolsdk/widget/g;

    .line 12
    .line 13
    invoke-direct {v1, p1}, Lcom/zte/toolsdk/widget/g;-><init>(Landroid/content/pm/ApplicationInfo;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Landroid/content/pm/ApplicationInfo;

    .line 21
    .line 22
    return-object p0
.end method

.method put(Landroid/content/pm/ApplicationInfo;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->Q(Landroid/content/pm/ApplicationInfo;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;->mPackageUserToApplicationInfo:Ljava/util/Map;

    .line 9
    .line 10
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    return-void
.end method
