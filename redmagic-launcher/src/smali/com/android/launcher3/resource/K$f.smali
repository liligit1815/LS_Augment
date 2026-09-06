.class Lcom/android/launcher3/resource/K$f;
.super Lcom/android/launcher3/resource/K$e;
.source "MenuResource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/K;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "f"
.end annotation


# instance fields
.field private h:Ljava/lang/String;

.field private i:I

.field private j:I

.field private k:I

.field private l:Ljava/lang/String;

.field private m:[I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/K$e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/resource/K$f;->i:I

    .line 6
    .line 7
    iput v0, p0, Lcom/android/launcher3/resource/K$f;->j:I

    .line 8
    .line 9
    iput v0, p0, Lcom/android/launcher3/resource/K$f;->k:I

    .line 10
    .line 11
    return-void
.end method

.method static bridge synthetic V(Lcom/android/launcher3/resource/K$f;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$f;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method A(Landroid/database/Cursor;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/resource/K$e;->A(Landroid/database/Cursor;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "foreColor"

    .line 5
    .line 6
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/android/launcher3/resource/K$f;->i:I

    .line 15
    .line 16
    const-string v0, "mainColor"

    .line 17
    .line 18
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lcom/android/launcher3/resource/K$f;->j:I

    .line 27
    .line 28
    const-string v0, "statusForeColor"

    .line 29
    .line 30
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lcom/android/launcher3/resource/K$f;->k:I

    .line 39
    .line 40
    const-string v0, "finger"

    .line 41
    .line 42
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/android/launcher3/resource/K$f;->l:Ljava/lang/String;

    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eq v0, v1, :cond_0

    .line 58
    .line 59
    const/4 v0, -0x1

    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-ne v0, v1, :cond_1

    .line 65
    .line 66
    :cond_0
    const-string v0, "background"

    .line 67
    .line 68
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    if-eqz p1, :cond_1

    .line 77
    .line 78
    invoke-static {p1}, Lx1/O;->s([B)Landroid/graphics/drawable/Drawable;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/K$e;->C(Landroid/graphics/drawable/Drawable;)V

    .line 83
    .line 84
    .line 85
    :cond_1
    return-void
.end method

.method E(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/resource/K$f;->i:I

    .line 2
    .line 3
    int-to-long v0, p1

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/resource/K$e;->O(J)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method H(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/resource/K$f;->j:I

    .line 2
    .line 3
    int-to-long v0, p1

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/resource/K$e;->P(J)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method J(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/resource/K$f;->k:I

    .line 2
    .line 3
    int-to-long v0, p1

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/resource/K$e;->Q(J)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method L([I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/K$f;->m:[I

    .line 2
    .line 3
    return-void
.end method

.method M(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/K$f;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/K$e;->R(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method W()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/ContentValues;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "itemId"

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "itemType"

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->q()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "srcType"

    .line 33
    .line 34
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->m()Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->m()Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v1}, Lx1/O;->I(Landroid/graphics/drawable/Drawable;)[B

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, "background"

    .line 66
    .line 67
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 68
    .line 69
    .line 70
    :cond_0
    iget v1, p0, Lcom/android/launcher3/resource/K$f;->i:I

    .line 71
    .line 72
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const-string v2, "foreColor"

    .line 77
    .line 78
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 79
    .line 80
    .line 81
    iget v1, p0, Lcom/android/launcher3/resource/K$f;->j:I

    .line 82
    .line 83
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const-string v2, "mainColor"

    .line 88
    .line 89
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 90
    .line 91
    .line 92
    iget v1, p0, Lcom/android/launcher3/resource/K$f;->k:I

    .line 93
    .line 94
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    const-string v2, "statusForeColor"

    .line 99
    .line 100
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 101
    .line 102
    .line 103
    const-string v1, "finger"

    .line 104
    .line 105
    iget-object p0, p0, Lcom/android/launcher3/resource/K$f;->l:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v0, v1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    sget-object v1, Lcom/android/launcher3/resource/ResourceDatabaseProvider$e;->a:Landroid/net/Uri;

    .line 115
    .line 116
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->b(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public X()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/resource/K$f;->i:I

    .line 2
    .line 3
    return p0
.end method

.method Y()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/resource/K$f;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public Z()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/resource/K$f;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public a0()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$f;->m:[I

    .line 2
    .line 3
    return-object p0
.end method

.method b0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$f;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$f;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method d0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/K$f;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method e0()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "R-Loader"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "syncColor: item id is null."

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string v5, "itemId=?"

    .line 16
    .line 17
    filled-new-array {v0}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    const/4 v8, 0x0

    .line 22
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    sget-object v3, Lcom/android/launcher3/resource/ResourceDatabaseProvider$e;->a:Landroid/net/Uri;

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    const/4 v7, 0x0

    .line 30
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 31
    .line 32
    .line 33
    move-result-object v8

    .line 34
    if-eqz v8, :cond_2

    .line 35
    .line 36
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    .line 37
    .line 38
    .line 39
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    invoke-static {v8}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v8}, Lcom/android/launcher3/resource/K$f;->A(Landroid/database/Cursor;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception v0

    .line 54
    move-object p0, v0

    .line 55
    goto :goto_2

    .line 56
    :catch_0
    move-exception v0

    .line 57
    move-object p0, v0

    .line 58
    goto :goto_1

    .line 59
    :cond_2
    :goto_0
    invoke-static {v8}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :goto_1
    :try_start_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string v2, " syncColor Exception occor !!"

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 85
    .line 86
    .line 87
    invoke-static {v8}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :goto_2
    invoke-static {v8}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 92
    .line 93
    .line 94
    throw p0
.end method
