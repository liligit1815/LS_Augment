.class final Lz1/u5$a;
.super Ljava/lang/Object;
.source "WidgetsModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/u5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# instance fields
.field private final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/L1;",
            "Lcom/android/launcher3/model/data/B;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Lo/a;

    invoke-direct {v0}, Lo/a;-><init>()V

    iput-object v0, p0, Lz1/u5$a;->a:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lz1/v5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lz1/u5$a;-><init>()V

    return-void
.end method


# virtual methods
.method a(Lcom/android/launcher3/util/L1;)Lcom/android/launcher3/model/data/B;
    .locals 4

    .line 1
    iget-object v0, p0, Lz1/u5$a;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/model/data/B;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/model/data/B;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 14
    .line 15
    iget v2, p1, Lcom/android/launcher3/util/L1;->b:I

    .line 16
    .line 17
    iget-object v3, p1, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 18
    .line 19
    invoke-direct {v0, v1, v2, v3}, Lcom/android/launcher3/model/data/B;-><init>(Ljava/lang/String;ILandroid/os/UserHandle;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p1, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 25
    .line 26
    iget-object p0, p0, Lz1/u5$a;->a:Ljava/util/Map;

    .line 27
    .line 28
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    :cond_0
    return-object v0
.end method

.method b()Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/android/launcher3/model/data/B;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lz1/u5$a;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
