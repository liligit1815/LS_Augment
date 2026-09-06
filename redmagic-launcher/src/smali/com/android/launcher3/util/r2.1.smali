.class public Lcom/android/launcher3/util/r2;
.super Ljava/lang/Object;
.source "ShortcutUtil.java"


# direct methods
.method public static a(Lcom/android/launcher3/model/data/y;)[Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/r2;->c(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/util/r2;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/I;->V()[Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    sget-object p0, Lcom/android/launcher3/N5;->c:[Ljava/lang/String;

    .line 21
    .line 22
    return-object p0
.end method

.method public static b(Lcom/android/launcher3/model/data/y;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/r2;->c(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/util/r2;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {p0}, LN1/e;->d(Lcom/android/launcher3/model/data/y;)LN1/e;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, LN1/e;->e()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method private static c(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->Y()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->isDisabled()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private static d(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->isDisabled()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method private static e(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private static f(Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget v0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    instance-of p0, p0, Lcom/android/launcher3/model/data/I;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private static g(Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    const/4 v1, 0x1

    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    if-eq p0, v0, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x5

    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    if-eq p0, v1, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x6

    .line 16
    if-ne p0, v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    return v1
.end method

.method public static h(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/r2;->d(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/util/r2;->e(Lcom/android/launcher3/model/data/y;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/launcher3/util/r2;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    :cond_0
    invoke-static {p0}, Lcom/android/launcher3/util/r2;->g(Lcom/android/launcher3/model/data/y;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    :cond_1
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_2
    const/4 p0, 0x0

    .line 28
    return p0
.end method
