.class public Lz1/i1;
.super Ljava/lang/Object;
.source "GridSizeMigrationDBController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/i1$a;
    }
.end annotation


# direct methods
.method public static synthetic a(Lz1/K0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->id:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic b(Lcom/android/launcher3/util/x0;Lz1/K0;)Z
    .locals 0

    .line 1
    iget p1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static synthetic c(Ljava/util/HashMap;Ljava/util/List;Lz1/K0;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    add-int/lit8 p1, p1, -0x1

    .line 27
    .line 28
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public static synthetic d(Ljava/util/HashMap;Lz1/K0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    add-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic e(Ljava/util/HashMap;Lz1/K0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    add-int/lit8 v0, v0, -0x1

    .line 17
    .line 18
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic f(ILz1/K0;)Z
    .locals 0

    .line 1
    iget p1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 2
    .line 3
    if-ge p1, p0, :cond_0

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

.method public static synthetic g(Lz1/K0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->id:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic h(Lcom/android/launcher3/util/x0;Ljava/util/Set;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lz1/Y0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lz1/Y0;-><init>(Lcom/android/launcher3/util/x0;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/Set;->forEach(Ljava/util/function/Consumer;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic i(Ljava/util/HashMap;Lcom/android/launcher3/util/x0;Lz1/K0;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-gez v0, :cond_1

    .line 12
    .line 13
    iget v0, p2, Lcom/android/launcher3/model/data/y;->id:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 16
    .line 17
    .line 18
    iget v0, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    iget-object v0, p2, Lz1/K0;->i:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Lz1/X0;

    .line 30
    .line 31
    invoke-direct {v1, p1}, Lz1/X0;-><init>(Lcom/android/launcher3/util/x0;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/Collection;->forEach(Ljava/util/function/Consumer;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Ljava/lang/Integer;

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    add-int/lit8 p1, p1, 0x1

    .line 48
    .line 49
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public static synthetic j(Lz1/K0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->id:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private static k(Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/android/launcher3/util/x0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lz1/K0;",
            ">;",
            "Ljava/util/List<",
            "Lz1/K0;",
            ">;",
            "Ljava/util/List<",
            "Lz1/K0;",
            ">;",
            "Lcom/android/launcher3/util/x0;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lz1/e1;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Lz1/e1;-><init>(Ljava/util/HashMap;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Lz1/f1;

    .line 15
    .line 16
    invoke-direct {v1, v0}, Lz1/f1;-><init>(Ljava/util/HashMap;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Lz1/g1;

    .line 23
    .line 24
    invoke-direct {v1, v0, p2}, Lz1/g1;-><init>(Ljava/util/HashMap;Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Lz1/h1;

    .line 31
    .line 32
    invoke-direct {p0, v0, p3}, Lz1/h1;-><init>(Ljava/util/HashMap;Lcom/android/launcher3/util/x0;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {p1, p0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private static l(Lz1/I0;IILjava/lang/String;Ljava/lang/String;Ljava/util/List;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/I0;",
            "II",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 v1, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v2, p1

    .line 4
    move v3, p2

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    move-object v6, p5

    .line 8
    invoke-static/range {v0 .. v6}, Lz1/i1;->m(Lz1/I0;Lz1/K0;IILjava/lang/String;Ljava/lang/String;Ljava/util/List;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private static m(Lz1/I0;Lz1/K0;IILjava/lang/String;Ljava/lang/String;Ljava/util/List;)I
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/I0;",
            "Lz1/K0;",
            "II",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "_id = \'"

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget p2, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 18
    .line 19
    :cond_0
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p2, "\'"

    .line 23
    .line 24
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const/4 v6, 0x0

    .line 32
    const/4 v7, 0x0

    .line 33
    const/4 v2, 0x0

    .line 34
    const/4 v4, 0x0

    .line 35
    const/4 v5, 0x0

    .line 36
    move-object v1, p4

    .line 37
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    const/4 p4, -0x1

    .line 42
    :goto_0
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    new-instance v0, Landroid/content/ContentValues;

    .line 49
    .line 50
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {p2, v0}, Landroid/database/DatabaseUtils;->cursorRowToContentValues(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    .line 54
    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Lz1/K0;->z(Landroid/content/ContentValues;)Landroid/content/ContentValues;

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object p4

    .line 66
    const-string v1, "container"

    .line 67
    .line 68
    invoke-virtual {v0, v1, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lz1/I0;->c()I

    .line 72
    .line 73
    .line 74
    move-result p4

    .line 75
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-interface {p6, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-nez v1, :cond_2

    .line 84
    .line 85
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const-string v2, "_id"

    .line 90
    .line 91
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    const/4 v2, 0x0

    .line 99
    invoke-virtual {v1, p5, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_3
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 104
    .line 105
    .line 106
    return p4
.end method

.method private static n(Lz1/I0;Lz1/K0;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/I0;",
            "Lz1/K0;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 v2, -0x1

    .line 2
    const/4 v3, -0x1

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v4, p2

    .line 6
    move-object v5, p3

    .line 7
    move-object v6, p4

    .line 8
    invoke-static/range {v0 .. v6}, Lz1/i1;->m(Lz1/I0;Lz1/K0;IILjava/lang/String;Ljava/lang/String;Ljava/util/List;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private static o(Lz1/K0;Landroid/graphics/Point;Landroid/graphics/Point;Lcom/android/launcher3/util/t0;I)Z
    .locals 6

    .line 1
    iget v0, p1, Landroid/graphics/Point;->y:I

    .line 2
    .line 3
    :goto_0
    iget v1, p2, Landroid/graphics/Point;->y:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ge v0, v1, :cond_4

    .line 7
    .line 8
    iget v1, p1, Landroid/graphics/Point;->x:I

    .line 9
    .line 10
    :goto_1
    iget v3, p2, Landroid/graphics/Point;->x:I

    .line 11
    .line 12
    if-ge v1, v3, :cond_3

    .line 13
    .line 14
    iget v3, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 15
    .line 16
    iget v4, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 17
    .line 18
    invoke-virtual {p3, v1, v0, v3, v4}, Lcom/android/launcher3/util/t0;->d(IIII)Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    iget v4, p0, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 23
    .line 24
    iget v5, p0, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 25
    .line 26
    invoke-virtual {p3, v1, v0, v4, v5}, Lcom/android/launcher3/util/t0;->d(IIII)Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-eqz v4, :cond_0

    .line 31
    .line 32
    iget v5, p0, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 33
    .line 34
    iput v5, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 35
    .line 36
    iget v5, p0, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 37
    .line 38
    iput v5, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 39
    .line 40
    :cond_0
    if-nez v3, :cond_2

    .line 41
    .line 42
    if-eqz v4, :cond_1

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    :goto_2
    iput p4, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 49
    .line 50
    iput v1, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 51
    .line 52
    iput v0, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 53
    .line 54
    const/4 p2, 0x1

    .line 55
    invoke-virtual {p3, p0, p2}, Lcom/android/launcher3/util/t0;->g(Lcom/android/launcher3/model/data/y;Z)V

    .line 56
    .line 57
    .line 58
    iget p0, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 59
    .line 60
    add-int/2addr v1, p0

    .line 61
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Point;->set(II)V

    .line 62
    .line 63
    .line 64
    return p2

    .line 65
    :cond_3
    iget v1, p1, Landroid/graphics/Point;->y:I

    .line 66
    .line 67
    invoke-virtual {p1, v2, v1}, Landroid/graphics/Point;->set(II)V

    .line 68
    .line 69
    .line 70
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_4
    return v2
.end method

.method public static p(II)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "%d,%d"

    .line 16
    .line 17
    invoke-static {v0, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method static q(Lz1/I0;Lz1/K0;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/I0;",
            "Lz1/K0;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lz1/i1;->n(Lz1/I0;Lz1/K0;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)I

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/16 v1, 0xa

    .line 11
    .line 12
    if-ne v0, v1, :cond_2

    .line 13
    .line 14
    :cond_0
    iget-object p1, p1, Lz1/K0;->i:Ljava/util/Map;

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/util/Set;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    move-object v0, p0

    .line 57
    move-object v3, p2

    .line 58
    move-object v4, p3

    .line 59
    move-object v5, p4

    .line 60
    invoke-static/range {v0 .. v5}, Lz1/i1;->l(Lz1/I0;IILjava/lang/String;Ljava/lang/String;Ljava/util/List;)I

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    return-void
.end method

.method protected static r(Lz1/L0;Lz1/L0;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lz1/L0;->e()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lz1/L0;->f()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-ne p0, v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Lz1/L0;->f()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/4 p1, 0x1

    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    return p1

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public static s(Landroid/content/Context;III)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "migration_src_workspace_size"

    .line 10
    .line 11
    invoke-static {p1, p2}, Lz1/i1;->p(II)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "migration_src_hotseat_count"

    .line 20
    .line 21
    invoke-interface {p0, p1, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static t(Lz1/I0;Lz1/i1$a;Lz1/i1$a;IILandroid/graphics/Point;Lz1/L0;Lz1/L0;)Z
    .locals 15

    .line 1
    move-object/from16 v2, p2

    .line 2
    .line 3
    move/from16 v0, p3

    .line 4
    .line 5
    move-object/from16 v1, p5

    .line 6
    .line 7
    invoke-virtual/range {p1 .. p1}, Lz1/i1$a;->c()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual/range {p1 .. p1}, Lz1/i1$a;->b()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v8

    .line 15
    invoke-virtual {v2}, Lz1/i1$a;->c()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    move/from16 v5, p4

    .line 20
    .line 21
    if-ge v0, v5, :cond_0

    .line 22
    .line 23
    invoke-interface {v4}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    new-instance v6, Lz1/W0;

    .line 28
    .line 29
    invoke-direct {v6, v0}, Lz1/W0;-><init>(I)V

    .line 30
    .line 31
    .line 32
    invoke-interface {v4, v6}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-interface {v0, v4}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    move-object v4, v0

    .line 45
    check-cast v4, Ljava/util/List;

    .line 46
    .line 47
    :cond_0
    invoke-virtual {v2}, Lz1/i1$a;->b()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v5, Ljava/util/ArrayList;

    .line 52
    .line 53
    const/4 v9, 0x1

    .line 54
    invoke-direct {v5, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 55
    .line 56
    .line 57
    new-instance v7, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v7, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 60
    .line 61
    .line 62
    new-instance v6, Lcom/android/launcher3/util/x0;

    .line 63
    .line 64
    invoke-direct {v6}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v3, v4, v5, v6}, Lz1/i1;->k(Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/android/launcher3/util/x0;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v8, v0, v7, v6}, Lz1/i1;->k(Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/android/launcher3/util/x0;)V

    .line 71
    .line 72
    .line 73
    iget v10, v1, Landroid/graphics/Point;->x:I

    .line 74
    .line 75
    iget v11, v1, Landroid/graphics/Point;->y:I

    .line 76
    .line 77
    new-instance v1, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v3, "Start migration:\n Source Device:"

    .line 83
    .line 84
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-interface {v8}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    new-instance v4, Lz1/Z0;

    .line 92
    .line 93
    invoke-direct {v4}, Lz1/Z0;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    const-string v4, ",\n"

    .line 101
    .line 102
    const-string v12, "["

    .line 103
    .line 104
    const-string v13, "]"

    .line 105
    .line 106
    invoke-static {v4, v12, v13}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 107
    .line 108
    .line 109
    move-result-object v14

    .line 110
    invoke-interface {v3, v14}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    check-cast v3, Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v3, "\n Target Device:"

    .line 120
    .line 121
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    new-instance v14, Lz1/Z0;

    .line 129
    .line 130
    invoke-direct {v14}, Lz1/Z0;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-interface {v3, v14}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-static {v4, v12, v13}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 138
    .line 139
    .line 140
    move-result-object v14

    .line 141
    invoke-interface {v3, v14}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    check-cast v3, Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string v3, "\n Removing Items:"

    .line 151
    .line 152
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    new-instance v3, Lz1/a1;

    .line 160
    .line 161
    invoke-direct {v3, v6}, Lz1/a1;-><init>(Lcom/android/launcher3/util/x0;)V

    .line 162
    .line 163
    .line 164
    invoke-interface {v0, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    new-instance v3, Lz1/Z0;

    .line 169
    .line 170
    invoke-direct {v3}, Lz1/Z0;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-interface {v0, v3}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-static {v4, v12, v13}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    invoke-interface {v0, v3}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    check-cast v0, Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    const-string v0, "\n Adding Workspace Items:"

    .line 191
    .line 192
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-interface {v7}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    new-instance v3, Lz1/Z0;

    .line 200
    .line 201
    invoke-direct {v3}, Lz1/Z0;-><init>()V

    .line 202
    .line 203
    .line 204
    invoke-interface {v0, v3}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-static {v4, v12, v13}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    invoke-interface {v0, v3}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    check-cast v0, Ljava/lang/String;

    .line 217
    .line 218
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    const-string v0, "\n Adding Hotseat Items:"

    .line 222
    .line 223
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-interface {v5}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    new-instance v3, Lz1/Z0;

    .line 231
    .line 232
    invoke-direct {v3}, Lz1/Z0;-><init>()V

    .line 233
    .line 234
    .line 235
    invoke-interface {v0, v3}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-static {v4, v12, v13}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    invoke-interface {v0, v3}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    check-cast v0, Ljava/lang/String;

    .line 248
    .line 249
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    const-string v12, "GridSizeMigrationDBController"

    .line 257
    .line 258
    invoke-static {v12, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    .line 260
    .line 261
    invoke-virtual {v6}, Lcom/android/launcher3/util/x0;->isEmpty()Z

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-nez v0, :cond_1

    .line 266
    .line 267
    iget-object v0, v2, Lz1/i1$a;->a:Landroid/database/sqlite/SQLiteDatabase;

    .line 268
    .line 269
    iget-object v1, v2, Lz1/i1$a;->b:Ljava/lang/String;

    .line 270
    .line 271
    invoke-static {v0, v1, v6}, Lz1/i1;->x(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/android/launcher3/util/x0;)V

    .line 272
    .line 273
    .line 274
    :cond_1
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    const/4 v13, 0x0

    .line 279
    if-eqz v0, :cond_2

    .line 280
    .line 281
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-eqz v0, :cond_2

    .line 286
    .line 287
    return v13

    .line 288
    :cond_2
    invoke-static {v5}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 289
    .line 290
    .line 291
    invoke-static {v7}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v2}, Lz1/i1$a;->c()Ljava/util/List;

    .line 295
    .line 296
    .line 297
    move-result-object v4

    .line 298
    invoke-virtual {v2}, Lz1/i1$a;->b()Ljava/util/List;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-interface {v4}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    new-instance v3, Lz1/b1;

    .line 307
    .line 308
    invoke-direct {v3}, Lz1/b1;-><init>()V

    .line 309
    .line 310
    .line 311
    invoke-interface {v1, v3}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 316
    .line 317
    .line 318
    move-result-object v3

    .line 319
    invoke-interface {v1, v3}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    move-object v6, v1

    .line 324
    check-cast v6, Ljava/util/List;

    .line 325
    .line 326
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    new-instance v1, Lz1/c1;

    .line 331
    .line 332
    invoke-direct {v1}, Lz1/c1;-><init>()V

    .line 333
    .line 334
    .line 335
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    check-cast v0, Ljava/util/Collection;

    .line 348
    .line 349
    invoke-interface {v6, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 350
    .line 351
    .line 352
    move-object v0, p0

    .line 353
    move/from16 v1, p4

    .line 354
    .line 355
    move-object v3, v2

    .line 356
    move-object/from16 v2, p1

    .line 357
    .line 358
    invoke-static/range {v0 .. v6}, Lz1/i1;->z(Lz1/I0;ILz1/i1$a;Lz1/i1$a;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 359
    .line 360
    .line 361
    move-object v2, v3

    .line 362
    new-instance v0, Ljava/util/ArrayList;

    .line 363
    .line 364
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 365
    .line 366
    .line 367
    :goto_0
    iget v1, v2, Lz1/i1$a;->d:I

    .line 368
    .line 369
    if-gt v13, v1, :cond_3

    .line 370
    .line 371
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 372
    .line 373
    .line 374
    move-result-object v1

    .line 375
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 376
    .line 377
    .line 378
    add-int/lit8 v13, v13, 0x1

    .line 379
    .line 380
    goto :goto_0

    .line 381
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 382
    .line 383
    .line 384
    move-result-object v13

    .line 385
    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    .line 386
    .line 387
    .line 388
    move-result v0

    .line 389
    if-eqz v0, :cond_5

    .line 390
    .line 391
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    check-cast v0, Ljava/lang/Integer;

    .line 396
    .line 397
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 398
    .line 399
    .line 400
    move-result v3

    .line 401
    new-instance v0, Ljava/lang/StringBuilder;

    .line 402
    .line 403
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 404
    .line 405
    .line 406
    const-string v1, "Migrating "

    .line 407
    .line 408
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    .line 410
    .line 411
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    invoke-static {v12, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    .line 420
    .line 421
    move-object v0, v7

    .line 422
    move-object v7, v6

    .line 423
    move-object v6, v0

    .line 424
    move-object v0, p0

    .line 425
    move-object/from16 v1, p1

    .line 426
    .line 427
    move v4, v10

    .line 428
    move v5, v11

    .line 429
    invoke-static/range {v0 .. v7}, Lz1/i1;->y(Lz1/I0;Lz1/i1$a;Lz1/i1$a;IIILjava/util/List;Ljava/util/List;)V

    .line 430
    .line 431
    .line 432
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    .line 433
    .line 434
    .line 435
    move-result v0

    .line 436
    if-eqz v0, :cond_4

    .line 437
    .line 438
    goto :goto_2

    .line 439
    :cond_4
    move-object v10, v7

    .line 440
    move-object v7, v6

    .line 441
    move-object v6, v10

    .line 442
    move v10, v4

    .line 443
    move v11, v5

    .line 444
    goto :goto_1

    .line 445
    :cond_5
    move-object v6, v7

    .line 446
    move v4, v10

    .line 447
    move v5, v11

    .line 448
    :goto_2
    iget v0, v2, Lz1/i1$a;->d:I

    .line 449
    .line 450
    add-int/2addr v0, v9

    .line 451
    move v3, v0

    .line 452
    :goto_3
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    .line 453
    .line 454
    .line 455
    move-result v0

    .line 456
    if-nez v0, :cond_6

    .line 457
    .line 458
    invoke-interface {v8}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 459
    .line 460
    .line 461
    move-result-object v0

    .line 462
    new-instance v1, Lz1/d1;

    .line 463
    .line 464
    invoke-direct {v1}, Lz1/d1;-><init>()V

    .line 465
    .line 466
    .line 467
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 472
    .line 473
    .line 474
    move-result-object v1

    .line 475
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 476
    .line 477
    .line 478
    move-result-object v0

    .line 479
    move-object v7, v0

    .line 480
    check-cast v7, Ljava/util/List;

    .line 481
    .line 482
    move-object v0, p0

    .line 483
    move-object/from16 v1, p1

    .line 484
    .line 485
    invoke-static/range {v0 .. v7}, Lz1/i1;->y(Lz1/I0;Lz1/i1$a;Lz1/i1$a;IIILjava/util/List;Ljava/util/List;)V

    .line 486
    .line 487
    .line 488
    add-int/2addr v3, v9

    .line 489
    move-object/from16 v2, p2

    .line 490
    .line 491
    goto :goto_3

    .line 492
    :cond_6
    return v9
.end method

.method public static u(Landroid/content/Context;Lz1/L0;Lz1/L0;Lz1/I0;Landroid/database/sqlite/SQLiteDatabase;ZLz1/m2;)Z
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v8, p1

    .line 4
    .line 5
    move-object/from16 v9, p2

    .line 6
    .line 7
    move-object/from16 v0, p4

    .line 8
    .line 9
    move-object/from16 v10, p6

    .line 10
    .line 11
    const-string v11, "Workspace migration completed in "

    .line 12
    .line 13
    const-string v12, "GridSizeMigrationDBController"

    .line 14
    .line 15
    invoke-static/range {p1 .. p2}, Lz1/i1;->w(Lz1/L0;Lz1/L0;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v13, 0x1

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    return v13

    .line 23
    :cond_0
    invoke-static {v1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 24
    .line 25
    .line 26
    move-result-object v14

    .line 27
    invoke-static {}, Lcom/android/launcher3/y0;->r0()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/4 v15, 0x0

    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    if-eqz p5, :cond_2

    .line 35
    .line 36
    :cond_1
    invoke-virtual {v8}, Lz1/L0;->c()Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v9}, Lz1/L0;->c()Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    invoke-virtual {v8}, Lz1/L0;->i()Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-virtual {v9}, Lz1/L0;->i()Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-ge v2, v3, :cond_2

    .line 67
    .line 68
    move v2, v13

    .line 69
    goto :goto_0

    .line 70
    :cond_2
    move v2, v15

    .line 71
    :goto_0
    const-string v3, "favorites_tmp"

    .line 72
    .line 73
    if-eqz v2, :cond_3

    .line 74
    .line 75
    sget-object v4, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual/range {p3 .. p3}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    sget-object v6, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v0, v4, v5, v6, v1}, LE1/a;->a(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/Context;)V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_3
    sget-object v4, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual/range {p3 .. p3}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    invoke-static {v0, v4, v5, v3, v1}, LE1/a;->a(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/Context;)V

    .line 94
    .line 95
    .line 96
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 97
    .line 98
    .line 99
    move-result-wide v16

    .line 100
    :try_start_0
    new-instance v4, LE1/a$a;

    .line 101
    .line 102
    invoke-virtual/range {p3 .. p3}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-direct {v4, v0}, LE1/a$a;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 107
    .line 108
    .line 109
    if-eqz v2, :cond_6

    .line 110
    .line 111
    :try_start_1
    invoke-static {}, Lcom/android/launcher3/y0;->r0()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_4

    .line 116
    .line 117
    invoke-virtual/range {p3 .. p3}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v9}, Lz1/L0;->i()Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    invoke-virtual {v8}, Lz1/L0;->i()Ljava/lang/Integer;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    sub-int/2addr v2, v3

    .line 138
    sget-object v3, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {v0, v2, v3}, LE1/a;->g(Landroid/database/sqlite/SQLiteDatabase;ILjava/lang/String;)V

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :catchall_0
    move-exception v0

    .line 145
    move-object v2, v0

    .line 146
    move-object/from16 v18, v4

    .line 147
    .line 148
    goto/16 :goto_6

    .line 149
    .line 150
    :cond_4
    :goto_2
    invoke-virtual {v9, v1}, Lz1/L0;->m(Landroid/content/Context;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v4}, LE1/a$a;->b()V

    .line 154
    .line 155
    .line 156
    invoke-static/range {p1 .. p2}, Lz1/i1;->r(Lz1/L0;Lz1/L0;)Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-eqz v0, :cond_5

    .line 161
    .line 162
    invoke-virtual {v14}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->a4:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 167
    .line 168
    invoke-interface {v0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 169
    .line 170
    .line 171
    :cond_5
    invoke-virtual {v14}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->Y3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 176
    .line 177
    invoke-interface {v0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 178
    .line 179
    .line 180
    :try_start_2
    invoke-virtual {v4}, LE1/a$a;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 181
    .line 182
    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    .line 187
    .line 188
    :goto_3
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 192
    .line 193
    .line 194
    move-result-wide v2

    .line 195
    sub-long v2, v2, v16

    .line 196
    .line 197
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-static {v12, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    .line 206
    .line 207
    invoke-virtual {v9, v1}, Lz1/L0;->m(Landroid/content/Context;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v10, v8, v9}, Lz1/m2;->c(Lz1/L0;Lz1/L0;)V

    .line 211
    .line 212
    .line 213
    return v13

    .line 214
    :catchall_1
    move-exception v0

    .line 215
    goto/16 :goto_9

    .line 216
    .line 217
    :catch_0
    move-exception v0

    .line 218
    goto/16 :goto_8

    .line 219
    .line 220
    :cond_6
    :try_start_3
    new-instance v0, Lz1/i1$a;

    .line 221
    .line 222
    invoke-virtual {v4}, LE1/a$a;->c()Landroid/database/sqlite/SQLiteDatabase;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    invoke-direct {v0, v2, v3, v1}, Lz1/i1$a;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/Context;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 227
    .line 228
    .line 229
    move-object v2, v4

    .line 230
    :try_start_4
    new-instance v4, Lz1/i1$a;

    .line 231
    .line 232
    invoke-virtual {v2}, LE1/a$a;->c()Landroid/database/sqlite/SQLiteDatabase;

    .line 233
    .line 234
    .line 235
    move-result-object v5

    .line 236
    sget-object v6, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 237
    .line 238
    invoke-direct {v4, v5, v6, v1}, Lz1/i1$a;-><init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/Context;)V

    .line 239
    .line 240
    .line 241
    new-instance v7, Landroid/graphics/Point;

    .line 242
    .line 243
    invoke-virtual {v9}, Lz1/L0;->c()Ljava/lang/Integer;

    .line 244
    .line 245
    .line 246
    move-result-object v5

    .line 247
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 248
    .line 249
    .line 250
    move-result v5

    .line 251
    invoke-virtual {v9}, Lz1/L0;->i()Ljava/lang/Integer;

    .line 252
    .line 253
    .line 254
    move-result-object v6

    .line 255
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 256
    .line 257
    .line 258
    move-result v6

    .line 259
    invoke-direct {v7, v5, v6}, Landroid/graphics/Point;-><init>(II)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v8}, Lz1/L0;->g()I

    .line 263
    .line 264
    .line 265
    move-result v5

    .line 266
    invoke-virtual {v9}, Lz1/L0;->g()I

    .line 267
    .line 268
    .line 269
    move-result v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 270
    move-object/from16 v18, v3

    .line 271
    .line 272
    move-object v3, v0

    .line 273
    move-object/from16 v0, v18

    .line 274
    .line 275
    move-object/from16 v18, v2

    .line 276
    .line 277
    move-object/from16 v2, p3

    .line 278
    .line 279
    :try_start_5
    invoke-static/range {v2 .. v9}, Lz1/i1;->t(Lz1/I0;Lz1/i1$a;Lz1/i1$a;IILandroid/graphics/Point;Lz1/L0;Lz1/L0;)Z

    .line 280
    .line 281
    .line 282
    invoke-virtual/range {v18 .. v18}, LE1/a$a;->c()Landroid/database/sqlite/SQLiteDatabase;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    invoke-static {v2, v0}, LE1/a;->b(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    invoke-virtual/range {v18 .. v18}, LE1/a$a;->b()V

    .line 290
    .line 291
    .line 292
    invoke-static/range {p1 .. p2}, Lz1/i1;->r(Lz1/L0;Lz1/L0;)Z

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    if-eqz v0, :cond_7

    .line 297
    .line 298
    invoke-virtual {v14}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->Z3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 303
    .line 304
    invoke-interface {v0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 305
    .line 306
    .line 307
    goto :goto_5

    .line 308
    :catchall_2
    move-exception v0

    .line 309
    :goto_4
    move-object v2, v0

    .line 310
    goto :goto_6

    .line 311
    :cond_7
    :goto_5
    invoke-virtual {v14}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->X3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 316
    .line 317
    invoke-interface {v0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 318
    .line 319
    .line 320
    :try_start_6
    invoke-virtual/range {v18 .. v18}, LE1/a$a;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 321
    .line 322
    .line 323
    new-instance v0, Ljava/lang/StringBuilder;

    .line 324
    .line 325
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 326
    .line 327
    .line 328
    goto/16 :goto_3

    .line 329
    .line 330
    :catchall_3
    move-exception v0

    .line 331
    move-object/from16 v18, v2

    .line 332
    .line 333
    goto :goto_4

    .line 334
    :catchall_4
    move-exception v0

    .line 335
    move-object/from16 v18, v4

    .line 336
    .line 337
    goto :goto_4

    .line 338
    :goto_6
    :try_start_7
    invoke-virtual/range {v18 .. v18}, LE1/a$a;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 339
    .line 340
    .line 341
    goto :goto_7

    .line 342
    :catchall_5
    move-exception v0

    .line 343
    :try_start_8
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 344
    .line 345
    .line 346
    :goto_7
    throw v2
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 347
    :goto_8
    :try_start_9
    const-string v2, "Error during grid migration"

    .line 348
    .line 349
    invoke-static {v12, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 350
    .line 351
    .line 352
    new-instance v0, Ljava/lang/StringBuilder;

    .line 353
    .line 354
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 355
    .line 356
    .line 357
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 361
    .line 362
    .line 363
    move-result-wide v2

    .line 364
    sub-long v2, v2, v16

    .line 365
    .line 366
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-static {v12, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    .line 375
    .line 376
    invoke-virtual {v9, v1}, Lz1/L0;->m(Landroid/content/Context;)V

    .line 377
    .line 378
    .line 379
    invoke-virtual {v10, v8, v9}, Lz1/m2;->c(Lz1/L0;Lz1/L0;)V

    .line 380
    .line 381
    .line 382
    return v15

    .line 383
    :goto_9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 384
    .line 385
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 386
    .line 387
    .line 388
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 392
    .line 393
    .line 394
    move-result-wide v3

    .line 395
    sub-long v3, v3, v16

    .line 396
    .line 397
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v2

    .line 404
    invoke-static {v12, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    .line 406
    .line 407
    invoke-virtual {v9, v1}, Lz1/L0;->m(Landroid/content/Context;)V

    .line 408
    .line 409
    .line 410
    invoke-virtual {v10, v8, v9}, Lz1/m2;->c(Lz1/L0;Lz1/L0;)V

    .line 411
    .line 412
    .line 413
    throw v0
.end method

.method public static v(Landroid/content/Context;Lcom/android/launcher3/F1;)Z
    .locals 1

    .line 1
    new-instance v0, Lz1/L0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lz1/L0;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lz1/L0;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lz1/L0;-><init>(Lcom/android/launcher3/F1;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, p0}, Lz1/i1;->w(Lz1/L0;Lz1/L0;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method static w(Lz1/L0;Lz1/L0;)Z
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lz1/L0;->k(Lz1/L0;)Z

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0
.end method

.method static x(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/android/launcher3/util/x0;)V
    .locals 1

    .line 1
    const-string v0, "_id"

    .line 2
    .line 3
    invoke-static {v0, p2}, Lcom/android/launcher3/N5;->g(Ljava/lang/String;Lcom/android/launcher3/util/x0;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, p2, v0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static y(Lz1/I0;Lz1/i1$a;Lz1/i1$a;IIILjava/util/List;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/I0;",
            "Lz1/i1$a;",
            "Lz1/i1$a;",
            "III",
            "Ljava/util/List<",
            "Lz1/K0;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/t0;

    .line 2
    .line 3
    invoke-direct {v0, p4, p5}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/graphics/Point;

    .line 7
    .line 8
    invoke-direct {v1, p4, p5}, Landroid/graphics/Point;-><init>(II)V

    .line 9
    .line 10
    .line 11
    new-instance v2, Landroid/graphics/Point;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-direct {v2, v3, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 15
    .line 16
    .line 17
    iget-object v3, p2, Lz1/i1$a;->e:Ljava/util/Map;

    .line 18
    .line 19
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Ljava/util/List;

    .line 28
    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    check-cast v4, Lz1/K0;

    .line 46
    .line 47
    const/4 v5, 0x1

    .line 48
    invoke-virtual {v0, v4, v5}, Lcom/android/launcher3/util/t0;->g(Lcom/android/launcher3/model/data/y;Z)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-interface {p6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object p6

    .line 56
    :cond_1
    :goto_1
    invoke-interface {p6}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_4

    .line 61
    .line 62
    invoke-interface {p6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Lz1/K0;

    .line 67
    .line 68
    iget v4, v3, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 69
    .line 70
    if-gt v4, p4, :cond_3

    .line 71
    .line 72
    iget v4, v3, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 73
    .line 74
    if-le v4, p5, :cond_2

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_2
    invoke-static {v3, v2, v1, v0, p3}, Lz1/i1;->o(Lz1/K0;Landroid/graphics/Point;Landroid/graphics/Point;Lcom/android/launcher3/util/t0;I)Z

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-eqz v4, :cond_1

    .line 82
    .line 83
    iget-object v4, p1, Lz1/i1$a;->b:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v5, p2, Lz1/i1$a;->b:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {p0, v3, v4, v5, p7}, Lz1/i1;->q(Lz1/I0;Lz1/K0;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 88
    .line 89
    .line 90
    invoke-interface {p6}, Ljava/util/Iterator;->remove()V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    :goto_2
    invoke-interface {p6}, Ljava/util/Iterator;->remove()V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_4
    return-void
.end method

.method private static z(Lz1/I0;ILz1/i1$a;Lz1/i1$a;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/I0;",
            "I",
            "Lz1/i1$a;",
            "Lz1/i1$a;",
            "Ljava/util/List<",
            "Lz1/K0;",
            ">;",
            "Ljava/util/List<",
            "Lz1/K0;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-array v0, p1, [Z

    .line 2
    .line 3
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lz1/K0;

    .line 19
    .line 20
    iget v1, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 21
    .line 22
    aput-boolean v2, v0, v1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p4, 0x0

    .line 26
    move v1, p4

    .line 27
    :goto_1
    if-ge v1, p1, :cond_2

    .line 28
    .line 29
    aget-boolean v3, v0, v1

    .line 30
    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    invoke-interface {p5}, Ljava/util/List;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-nez v3, :cond_1

    .line 38
    .line 39
    invoke-interface {p5, p4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lz1/K0;

    .line 44
    .line 45
    iput v1, v3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 46
    .line 47
    iput v1, v3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 48
    .line 49
    iput p4, v3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 50
    .line 51
    iget-object v4, p2, Lz1/i1$a;->b:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v5, p3, Lz1/i1$a;->b:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p0, v3, v4, v5, p6}, Lz1/i1;->q(Lz1/I0;Lz1/K0;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 56
    .line 57
    .line 58
    iget v3, v3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 59
    .line 60
    aput-boolean v2, v0, v3

    .line 61
    .line 62
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    return-void
.end method
