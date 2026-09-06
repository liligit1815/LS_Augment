.class public final Lm2/h;
.super Lm2/g;
.source "WidgetsListContentEntry.java"


# instance fields
.field private final g:I


# direct methods
.method public constructor <init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/B;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, p3, v0}, Lm2/h;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;I)V

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/B;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;I)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lm2/g;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;)V

    .line 3
    iput p4, p0, Lm2/h;->g:I

    return-void
.end method


# virtual methods
.method public d()Lm2/g;
    .locals 4

    .line 1
    new-instance v0, Lm2/h;

    .line 2
    .line 3
    iget-object v1, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 4
    .line 5
    iget-object v2, p0, Lm2/g;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lm2/g;->c:Ljava/util/List;

    .line 8
    .line 9
    iget p0, p0, Lm2/h;->g:I

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, p0}, Lm2/h;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;I)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lm2/h;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lm2/h;

    .line 8
    .line 9
    iget-object v0, p0, Lm2/g;->c:Ljava/util/List;

    .line 10
    .line 11
    iget-object v2, p1, Lm2/g;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, v2}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 20
    .line 21
    iget-object v2, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Lcom/android/launcher3/model/data/B;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lm2/g;->b:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p1, Lm2/g;->b:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget p0, p0, Lm2/h;->g:I

    .line 40
    .line 41
    iget p1, p1, Lm2/h;->g:I

    .line 42
    .line 43
    if-ne p0, p1, :cond_1

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    return v1
.end method

.method public n()I
    .locals 0

    .line 1
    iget p0, p0, Lm2/h;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public o(I)Lm2/h;
    .locals 3

    .line 1
    iget v0, p0, Lm2/h;->g:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance v0, Lm2/h;

    .line 7
    .line 8
    iget-object v1, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 9
    .line 10
    iget-object v2, p0, Lm2/g;->b:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p0, p0, Lm2/g;->c:Ljava/util/List;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2, p0, p1}, Lm2/h;-><init>(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Content:"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, ":"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lm2/g;->c:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, " maxSpanSize: "

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget p0, p0, Lm2/h;->g:I

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method
