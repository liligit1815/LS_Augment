.class public Lcom/android/launcher3/model/data/B;
.super Lcom/android/launcher3/model/data/z;
.source "PackageItemInfo.java"


# instance fields
.field public final k:Ljava/lang/String;

.field public final l:I


# direct methods
.method public constructor <init>(Lcom/android/launcher3/model/data/B;)V
    .locals 1

    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/model/data/z;-><init>()V

    .line 8
    iget-object v0, p1, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 9
    iget v0, p1, Lcom/android/launcher3/model/data/B;->l:I

    iput v0, p0, Lcom/android/launcher3/model/data/B;->l:I

    .line 10
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    iput-object p1, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    const/4 p1, -0x1

    .line 11
    iput p1, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILandroid/os/UserHandle;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Lcom/android/launcher3/model/data/z;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 4
    iput p2, p0, Lcom/android/launcher3/model/data/B;->l:I

    .line 5
    iput-object p3, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    const/4 p1, -0x1

    .line 6
    iput p1, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 1

    const/4 v0, -0x1

    .line 1
    invoke-direct {p0, p1, v0, p2}, Lcom/android/launcher3/model/data/B;-><init>(Ljava/lang/String;ILandroid/os/UserHandle;)V

    return-void
.end method


# virtual methods
.method public N()Lcom/android/launcher3/model/data/B;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/B;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/model/data/B;-><init>(Lcom/android/launcher3/model/data/B;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/B;->N()Lcom/android/launcher3/model/data/B;

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
    const-string v1, " packageName="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Lcom/android/launcher3/model/data/B;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, p1, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 34
    .line 35
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    iget p0, p0, Lcom/android/launcher3/model/data/B;->l:I

    .line 42
    .line 43
    iget p1, p1, Lcom/android/launcher3/model/data/B;->l:I

    .line 44
    .line 45
    if-ne p0, p1, :cond_2

    .line 46
    .line 47
    return v0

    .line 48
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/model/data/B;->l:I

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public bridge synthetic v()Lcom/android/launcher3/model/data/z;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/B;->N()Lcom/android/launcher3/model/data/B;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
