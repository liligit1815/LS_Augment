.class public Ld1/a;
.super Ljava/lang/Object;
.source "CloudApps.java"


# direct methods
.method public static a(Lcom/android/launcher3/folder/Folder;)Z
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget p0, p0, Lcom/android/launcher3/model/data/p;->j:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    sub-int/2addr p0, v1

    .line 11
    const/4 v2, 0x5

    .line 12
    if-ne v2, p0, :cond_1

    .line 13
    .line 14
    return v1

    .line 15
    :cond_1
    return v0
.end method

.method public static b(Lcom/android/launcher3/folder/Folder;)Z
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget p0, p0, Lcom/android/launcher3/model/data/p;->j:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    sub-int/2addr p0, v1

    .line 11
    const/4 v2, 0x7

    .line 12
    if-ne v2, p0, :cond_1

    .line 13
    .line 14
    return v1

    .line 15
    :cond_1
    return v0
.end method

.method public static c(Lcom/android/launcher3/folder/Folder;)Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget p0, p0, Lcom/android/launcher3/model/data/p;->j:I

    .line 8
    .line 9
    add-int/lit8 v1, p0, -0x1

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x2

    .line 13
    if-eq v3, v1, :cond_2

    .line 14
    .line 15
    add-int/lit8 v1, p0, -0x1

    .line 16
    .line 17
    const/4 v3, 0x6

    .line 18
    if-eq v3, v1, :cond_2

    .line 19
    .line 20
    const/16 v1, 0x8

    .line 21
    .line 22
    sub-int/2addr p0, v2

    .line 23
    if-ne v1, p0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return v0

    .line 27
    :cond_2
    :goto_0
    return v2
.end method

.method public static d(Lcom/android/launcher3/folder/Folder;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    invoke-static {p0}, Ld1/a;->e(Lcom/android/launcher3/folder/Folder;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_2

    .line 14
    .line 15
    invoke-static {p0}, Ld1/a;->c(Lcom/android/launcher3/folder/Folder;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    invoke-static {p0}, Ld1/a;->f(Lcom/android/launcher3/folder/Folder;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    invoke-static {p0}, Ld1/a;->a(Lcom/android/launcher3/folder/Folder;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    invoke-static {p0}, Ld1/a;->b(Lcom/android/launcher3/folder/Folder;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return v0

    .line 41
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_3
    :goto_1
    return v0
.end method

.method public static e(Lcom/android/launcher3/folder/Folder;)Z
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget p0, p0, Lcom/android/launcher3/model/data/p;->j:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    sub-int/2addr p0, v1

    .line 11
    const/4 v2, 0x3

    .line 12
    if-ne v2, p0, :cond_1

    .line 13
    .line 14
    return v1

    .line 15
    :cond_1
    return v0
.end method

.method public static f(Lcom/android/launcher3/folder/Folder;)Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget p0, p0, Lcom/android/launcher3/model/data/p;->j:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    sub-int/2addr p0, v1

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    return v0
.end method

.method public static g(I)I
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    const/16 v1, 0x8

    .line 7
    .line 8
    if-eq p0, v1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    return v0

    .line 13
    :cond_1
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public static h(I)I
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x2

    .line 7
    return p0
.end method
