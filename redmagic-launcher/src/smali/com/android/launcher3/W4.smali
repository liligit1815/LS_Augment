.class public Lcom/android/launcher3/W4;
.super Lcom/android/launcher3/model/data/z;
.source "PendingAddItemInfo.java"


# instance fields
.field public k:Landroid/content/ComponentName;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/model/data/z;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public N()Lcom/android/launcher3/W4;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/W4;->O()Lcom/android/launcher3/W4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public O()Lcom/android/launcher3/W4;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/W4;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/W4;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/android/launcher3/model/data/y;->copyFrom(Lcom/android/launcher3/model/data/y;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/W4;->k:Landroid/content/ComponentName;

    .line 10
    .line 11
    iput-object p0, v0, Lcom/android/launcher3/W4;->k:Landroid/content/ComponentName;

    .line 12
    .line 13
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/W4;->N()Lcom/android/launcher3/W4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method protected dumpProperties()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/android/launcher3/model/data/z;->dumpProperties()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " componentName="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/W4;->k:Landroid/content/ComponentName;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public getTargetComponent()Landroid/content/ComponentName;
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/W4;->k:Landroid/content/ComponentName;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/content/ComponentName;

    .line 16
    .line 17
    return-object p0
.end method

.method public bridge synthetic makeShallowCopy()Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/W4;->O()Lcom/android/launcher3/W4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic v()Lcom/android/launcher3/model/data/z;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/W4;->N()Lcom/android/launcher3/W4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
