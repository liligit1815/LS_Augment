.class public Lz1/J3;
.super Ljava/lang/Object;
.source "ModelWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/J3$f;,
        Lz1/J3$c;,
        Lz1/J3$g;,
        Lz1/J3$d;,
        Lz1/J3$e;
    }
.end annotation


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Lcom/android/launcher3/D3;

.field private final c:Lz1/y0;

.field private final d:Lcom/android/launcher3/util/p1;

.field private final e:Lz1/y0$b;

.field private final f:Z

.field private final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lz1/J3$c;",
            ">;"
        }
    .end annotation
.end field

.field private h:Z

.field private final i:Lc1/c;

.field private j:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/D3;Lz1/y0;ZLc1/c;Lz1/y0$b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lz1/J3;->g:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance v0, Lz1/J3$b;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Lz1/J3$b;-><init>(Lz1/J3;)V

    .line 22
    .line 23
    .line 24
    :goto_0
    iput-object v0, p0, Lz1/J3;->j:Ljava/lang/Runnable;

    .line 25
    .line 26
    iput-object p1, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 27
    .line 28
    iput-object p2, p0, Lz1/J3;->b:Lcom/android/launcher3/D3;

    .line 29
    .line 30
    iput-object p3, p0, Lz1/J3;->c:Lz1/y0;

    .line 31
    .line 32
    iput-boolean p4, p0, Lz1/J3;->f:Z

    .line 33
    .line 34
    iput-object p6, p0, Lz1/J3;->e:Lz1/y0$b;

    .line 35
    .line 36
    iput-object p5, p0, Lz1/J3;->i:Lc1/c;

    .line 37
    .line 38
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 39
    .line 40
    iput-object p1, p0, Lz1/J3;->d:Lcom/android/launcher3/util/p1;

    .line 41
    .line 42
    return-void
.end method

.method private synthetic G(Lcom/android/launcher3/model/data/y;[Ljava/lang/StackTraceElement;Lz1/J3$d;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/G;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/y;->onAddToDatabase(Lcom/android/launcher3/util/G;)V

    .line 9
    .line 10
    .line 11
    const-string v1, "_id"

    .line 12
    .line 13
    iget v2, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 14
    .line 15
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lz1/J3;->b:Lcom/android/launcher3/D3;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/G;->c(Landroid/content/Context;)Landroid/content/ContentValues;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Lz1/k2;->J(Landroid/content/ContentValues;)I

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lz1/J3;->c:Lz1/y0;

    .line 38
    .line 39
    monitor-enter v1

    .line 40
    :try_start_0
    iget v2, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 41
    .line 42
    invoke-direct {p0, v2, p1, p2}, Lz1/J3;->y(ILcom/android/launcher3/model/data/y;[Ljava/lang/StackTraceElement;)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Lz1/J3;->c:Lz1/y0;

    .line 46
    .line 47
    iget-object p0, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 48
    .line 49
    const/4 v2, 0x1

    .line 50
    invoke-virtual {p2, p0, p1, v2}, Lz1/y0;->k(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Z)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p3}, Lz1/J3$d;->c()V

    .line 54
    .line 55
    .line 56
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    instance-of p0, p1, Lcom/android/launcher3/model/data/I;

    .line 58
    .line 59
    if-eqz p0, :cond_0

    .line 60
    .line 61
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 62
    .line 63
    iget-object p0, p1, Lcom/android/launcher3/model/data/I;->u:Landroid/graphics/Bitmap;

    .line 64
    .line 65
    if-eqz p0, :cond_0

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-nez p2, :cond_0

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 74
    .line 75
    .line 76
    const/4 p0, 0x0

    .line 77
    iput-object p0, p1, Lcom/android/launcher3/model/data/I;->u:Landroid/graphics/Bitmap;

    .line 78
    .line 79
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Lcom/android/launcher3/util/G;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :catch_0
    move-exception p0

    .line 84
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :catchall_0
    move-exception p0

    .line 89
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 90
    throw p0
.end method

.method private synthetic H(Lcom/android/launcher3/model/data/m;Lz1/J3$d;)V
    .locals 4

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Lcom/android/launcher3/model/data/p;

    .line 8
    .line 9
    const/16 v2, 0x20

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/m;->y()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 38
    .line 39
    invoke-static {v0}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    invoke-static {}, Lx1/Y;->h()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    const-string v0, "ModelWriter"

    .line 52
    .line 53
    const-string v2, "deleteCollectionAndContentsFromDatabase: not delete the only icon that drag from privateFolder!"

    .line 54
    .line 55
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget-object v0, p0, Lz1/J3;->b:Lcom/android/launcher3/D3;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v2, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    const-string v3, "container="

    .line 71
    .line 72
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget v3, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 76
    .line 77
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v0, v2, v1}, Lz1/k2;->m(Ljava/lang/String;[Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lz1/J3;->c:Lz1/y0;

    .line 88
    .line 89
    iget-object v2, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/m;->y()Ljava/util/ArrayList;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-virtual {v0, v2, v3}, Lz1/y0;->t(Landroid/content/Context;Ljava/util/List;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/m;->y()Ljava/util/ArrayList;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 103
    .line 104
    .line 105
    :goto_0
    iget-object v0, p0, Lz1/J3;->b:Lcom/android/launcher3/D3;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v2, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v3, "_id="

    .line 117
    .line 118
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget v3, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 122
    .line 123
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {v0, v2, v1}, Lz1/k2;->m(Ljava/lang/String;[Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lz1/J3;->c:Lz1/y0;

    .line 134
    .line 135
    iget-object p0, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 136
    .line 137
    const/4 v1, 0x1

    .line 138
    new-array v1, v1, [Lcom/android/launcher3/model/data/y;

    .line 139
    .line 140
    const/4 v2, 0x0

    .line 141
    aput-object p1, v1, v2

    .line 142
    .line 143
    invoke-virtual {v0, p0, v1}, Lz1/y0;->u(Landroid/content/Context;[Lcom/android/launcher3/model/data/y;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p2}, Lz1/J3$d;->c()V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method private synthetic I(Ljava/util/Collection;Lz1/J3$d;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 21
    .line 22
    iget-object v2, p0, Lz1/J3;->b:Lcom/android/launcher3/D3;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget v3, v1, Lcom/android/launcher3/model/data/y;->id:I

    .line 29
    .line 30
    invoke-static {v3}, LE1/a;->c(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const/4 v4, 0x0

    .line 35
    invoke-virtual {v2, v3, v4}, Lz1/k2;->m(Ljava/lang/String;[Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    new-instance v2, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v3, "item.itemType:"

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v3, v1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v3, " item:"

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v3, "\n"

    .line 62
    .line 63
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    iget-object v2, p0, Lz1/J3;->c:Lz1/y0;

    .line 74
    .line 75
    iget-object v3, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 76
    .line 77
    filled-new-array {v1}, [Lcom/android/launcher3/model/data/y;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v2, v3, v1}, Lz1/y0;->u(Landroid/content/Context;[Lcom/android/launcher3/model/data/y;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2}, Lz1/J3$d;->c()V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string p1, "deleteItemsFromDatabase: "

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-string p1, "ModelWriter"

    .line 110
    .line 111
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method private synthetic J(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/G;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget p0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 9
    .line 10
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v1, "container"

    .line 15
    .line 16
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget v0, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 21
    .line 22
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "cellX"

    .line 27
    .line 28
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget v0, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 33
    .line 34
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "cellY"

    .line 39
    .line 40
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget v0, p1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "rank"

    .line 51
    .line 52
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget v0, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 57
    .line 58
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "spanX"

    .line 63
    .line 64
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    iget v0, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 69
    .line 70
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const-string v1, "spanY"

    .line 75
    .line 76
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iget p1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 81
    .line 82
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const-string v0, "screen"

    .line 87
    .line 88
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method private synthetic K(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/G;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget p0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 9
    .line 10
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v1, "container"

    .line 15
    .line 16
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget v0, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 21
    .line 22
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "cellX"

    .line 27
    .line 28
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget v0, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 33
    .line 34
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "cellY"

    .line 39
    .line 40
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget v0, p1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "rank"

    .line 51
    .line 52
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget v0, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 57
    .line 58
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "spanX"

    .line 63
    .line 64
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    iget v0, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 69
    .line 70
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const-string v1, "spanY"

    .line 75
    .line 76
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iget p1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 81
    .line 82
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const-string v0, "screen"

    .line 87
    .line 88
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method private synthetic L(I)Lcom/android/launcher3/util/G;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/G;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "appWidgetId"

    .line 13
    .line 14
    invoke-virtual {v0, p1, p0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method private synthetic M(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/G;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget p0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 9
    .line 10
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v1, "container"

    .line 15
    .line 16
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget v0, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 21
    .line 22
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "cellX"

    .line 27
    .line 28
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget v0, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 33
    .line 34
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "cellY"

    .line 39
    .line 40
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget v0, p1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "rank"

    .line 51
    .line 52
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget p1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 57
    .line 58
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string v0, "screen"

    .line 63
    .line 64
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method private synthetic N(Lcom/android/launcher3/D3$a;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lz1/J3;->b:Lcom/android/launcher3/D3;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    array-length v1, v0

    .line 8
    const/4 v2, 0x0

    .line 9
    :goto_0
    if-ge v2, v1, :cond_1

    .line 10
    .line 11
    aget-object v3, v0, v2

    .line 12
    .line 13
    iget-object v4, p0, Lz1/J3;->e:Lz1/y0$b;

    .line 14
    .line 15
    if-eq v3, v4, :cond_0

    .line 16
    .line 17
    invoke-interface {p1, v3}, Lcom/android/launcher3/D3$a;->a(Lz1/y0$b;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    return-void
.end method

.method private synthetic O(Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/util/G;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "innerGridX"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ":"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget v2, p1, Lcom/android/launcher3/model/data/p;->k:I

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, ";"

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v3, "innerGridY"

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v3, p1, Lcom/android/launcher3/model/data/p;->l:I

    .line 35
    .line 36
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v3, "backgroundColor"

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget p1, p1, Lcom/android/launcher3/model/data/p;->o:I

    .line 51
    .line 52
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    new-instance p1, Lcom/android/launcher3/util/G;

    .line 67
    .line 68
    iget-object p0, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 69
    .line 70
    invoke-direct {p1, p0}, Lcom/android/launcher3/util/G;-><init>(Landroid/content/Context;)V

    .line 71
    .line 72
    .line 73
    const-string p0, "appWidgetProvider"

    .line 74
    .line 75
    invoke-virtual {p1, p0, v0}, Lcom/android/launcher3/util/G;->g(Ljava/lang/String;Ljava/lang/CharSequence;)Lcom/android/launcher3/util/G;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0
.end method

.method private synthetic P(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/G;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/y;->onAddToDatabase(Lcom/android/launcher3/util/G;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method private W(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/w3;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lz1/w3;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lz1/J3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private X()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lz1/J3;->j:Ljava/lang/Runnable;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "suggest_widget_delay_runnable_token"

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object p0, p0, Lz1/J3;->j:Ljava/lang/Runnable;

    .line 34
    .line 35
    const-wide/16 v3, 0xc8

    .line 36
    .line 37
    invoke-virtual {v0, p0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    return-void
.end method

.method private Z(Lcom/android/launcher3/D3$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/J3;->e:Lz1/y0$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lz1/J3;->d:Lcom/android/launcher3/util/p1;

    .line 7
    .line 8
    new-instance v1, Lz1/y3;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Lz1/y3;-><init>(Lz1/J3;Lcom/android/launcher3/D3$a;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lz1/J3;Lcom/android/launcher3/model/data/m;Lz1/J3$d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/J3;->H(Lcom/android/launcher3/model/data/m;Lz1/J3$d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/model/data/y;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1, p0}, Lz1/y0$b;->B(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Lz1/J3;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/J3;->P(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private c0(Lcom/android/launcher3/model/data/y;IIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/J3;->i:Lc1/c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p4, p5, p3, p2}, Lc1/c;->b(IIII)Lc1/c$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iput p2, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 10
    .line 11
    iget p2, p0, Lc1/c$a;->a:I

    .line 12
    .line 13
    iput p2, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 14
    .line 15
    iget p2, p0, Lc1/c$a;->b:I

    .line 16
    .line 17
    iput p2, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 18
    .line 19
    iget p0, p0, Lc1/c$a;->c:I

    .line 20
    .line 21
    iput p0, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static synthetic d(Lz1/J3;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/J3;->M(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lz1/J3;I)Lcom/android/launcher3/util/G;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/J3;->L(I)Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Lz1/J3;Ljava/util/Collection;Lz1/J3$d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/J3;->I(Ljava/util/Collection;Lz1/J3$d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/model/data/y;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic h(Lz1/J3;Lcom/android/launcher3/model/data/y;[Ljava/lang/StackTraceElement;Lz1/J3$d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lz1/J3;->G(Lcom/android/launcher3/model/data/y;[Ljava/lang/StackTraceElement;Lz1/J3$d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ljava/util/ArrayList;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->B(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lz1/J3;Lcom/android/launcher3/D3$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/J3;->N(Lcom/android/launcher3/D3$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ljava/util/Collection;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/P0;->s(Ljava/util/Collection;)Ljava/util/function/Predicate;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1, p0}, Lz1/y0$b;->I(Ljava/util/function/Predicate;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic l(Lz1/J3;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/J3;->J(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m(Lcom/android/launcher3/model/data/y;Lz1/y0$b;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p1, p0, v0}, Lz1/y0$b;->L(Ljava/util/List;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic n(Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/model/data/A;)V
    .locals 0

    .line 1
    iget p1, p1, Lcom/android/launcher3/model/data/A;->g:I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/l0;->x(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic o(Lz1/J3;Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/util/G;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/J3;->O(Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic p(Lz1/J3;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/J3;->K(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic q(Lz1/J3;)Lz1/y0;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/J3;->c:Lz1/y0;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic r(Lz1/J3;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic s(Lz1/J3;)Lcom/android/launcher3/D3;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/J3;->b:Lcom/android/launcher3/D3;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic t(Lz1/J3;)Lcom/android/launcher3/util/p1;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/J3;->d:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic u(Lz1/J3;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lz1/J3;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic v(Lz1/J3;ILcom/android/launcher3/model/data/y;[Ljava/lang/StackTraceElement;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lz1/J3;->y(ILcom/android/launcher3/model/data/y;[Ljava/lang/StackTraceElement;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private y(ILcom/android/launcher3/model/data/y;[Ljava/lang/StackTraceElement;)V
    .locals 4

    .line 1
    iget-object p0, p0, Lz1/J3;->c:Lz1/y0;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    if-eqz p0, :cond_8

    .line 12
    .line 13
    if-eq p2, p0, :cond_8

    .line 14
    .line 15
    instance-of p1, p0, Lcom/android/launcher3/model/data/I;

    .line 16
    .line 17
    const-string p3, "ModelWriter"

    .line 18
    .line 19
    if-eqz p1, :cond_4

    .line 20
    .line 21
    instance-of p1, p2, Lcom/android/launcher3/model/data/I;

    .line 22
    .line 23
    if-eqz p1, :cond_4

    .line 24
    .line 25
    move-object p1, p0

    .line 26
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 27
    .line 28
    move-object v0, p2

    .line 29
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v2, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 38
    .line 39
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    iget-object v1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 50
    .line 51
    iget-object v2, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Landroid/content/Intent;->filterEquals(Landroid/content/Intent;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    iget v1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 60
    .line 61
    iget v2, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 62
    .line 63
    if-ne v1, v2, :cond_0

    .line 64
    .line 65
    iget v1, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 66
    .line 67
    iget v2, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 68
    .line 69
    if-ne v1, v2, :cond_0

    .line 70
    .line 71
    iget v1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 72
    .line 73
    iget v2, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 74
    .line 75
    if-ne v1, v2, :cond_0

    .line 76
    .line 77
    iget v1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 78
    .line 79
    iget v2, v0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 80
    .line 81
    if-ne v1, v2, :cond_0

    .line 82
    .line 83
    iget v1, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 84
    .line 85
    iget v2, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 86
    .line 87
    if-ne v1, v2, :cond_0

    .line 88
    .line 89
    iget v1, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 90
    .line 91
    iget v2, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 92
    .line 93
    if-ne v1, v2, :cond_0

    .line 94
    .line 95
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 96
    .line 97
    iget v2, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 98
    .line 99
    if-ne v1, v2, :cond_0

    .line 100
    .line 101
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 102
    .line 103
    iget v2, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 104
    .line 105
    if-ne v1, v2, :cond_0

    .line 106
    .line 107
    const-string p0, "checkItemInfoLocked--For all intents and purposes, this is the same object"

    .line 108
    .line 109
    invoke-static {p3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_0
    iget-object v1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 114
    .line 115
    iget-object v2, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Landroid/content/Intent;->filterEquals(Landroid/content/Intent;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_1

    .line 122
    .line 123
    iget v1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 124
    .line 125
    iget v2, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 126
    .line 127
    if-ne v1, v2, :cond_1

    .line 128
    .line 129
    iget v1, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 130
    .line 131
    iget v2, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 132
    .line 133
    if-ne v1, v2, :cond_1

    .line 134
    .line 135
    iget v1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 136
    .line 137
    iget v2, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 138
    .line 139
    if-ne v1, v2, :cond_1

    .line 140
    .line 141
    if-lez v1, :cond_1

    .line 142
    .line 143
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 144
    .line 145
    iget v2, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 146
    .line 147
    if-ne v1, v2, :cond_1

    .line 148
    .line 149
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 150
    .line 151
    iget v2, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 152
    .line 153
    if-ne v1, v2, :cond_1

    .line 154
    .line 155
    new-instance p0, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 158
    .line 159
    .line 160
    const-string p2, "checkItemInfoLocked--container > 0--modelShortcut.intent="

    .line 161
    .line 162
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    iget-object p1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 166
    .line 167
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-static {p3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_1
    iget-object v1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 179
    .line 180
    iget-object v2, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 181
    .line 182
    invoke-virtual {v1, v2}, Landroid/content/Intent;->filterEquals(Landroid/content/Intent;)Z

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    if-eqz v1, :cond_2

    .line 187
    .line 188
    iget v1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 189
    .line 190
    iget v2, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 191
    .line 192
    if-ne v1, v2, :cond_2

    .line 193
    .line 194
    iget v1, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 195
    .line 196
    iget v2, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 197
    .line 198
    if-ne v1, v2, :cond_2

    .line 199
    .line 200
    iget v1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 201
    .line 202
    iget v2, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 203
    .line 204
    if-ne v1, v2, :cond_2

    .line 205
    .line 206
    iget v1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 207
    .line 208
    iget v2, v0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 209
    .line 210
    if-ne v1, v2, :cond_2

    .line 211
    .line 212
    iget v1, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 213
    .line 214
    iget v2, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 215
    .line 216
    if-ne v1, v2, :cond_2

    .line 217
    .line 218
    iget v1, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 219
    .line 220
    iget v2, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 221
    .line 222
    if-ne v1, v2, :cond_2

    .line 223
    .line 224
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 225
    .line 226
    iget v2, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 227
    .line 228
    if-ne v1, v2, :cond_2

    .line 229
    .line 230
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 231
    .line 232
    iget v2, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 233
    .line 234
    if-ne v1, v2, :cond_2

    .line 235
    .line 236
    new-instance p0, Ljava/lang/StringBuilder;

    .line 237
    .line 238
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 239
    .line 240
    .line 241
    const-string p2, "checkItemInfoLocked--title is different language--modelShortcut:"

    .line 242
    .line 243
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 247
    .line 248
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    const-string p1, "--"

    .line 256
    .line 257
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    iget-object p1, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 261
    .line 262
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    invoke-static {p3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 274
    .line 275
    .line 276
    return-void

    .line 277
    :cond_2
    iget-object v1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 278
    .line 279
    iget-object v2, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 280
    .line 281
    invoke-virtual {v1, v2}, Landroid/content/Intent;->filterEquals(Landroid/content/Intent;)Z

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    const/16 v2, -0x65

    .line 286
    .line 287
    if-eqz v1, :cond_3

    .line 288
    .line 289
    iget v1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 290
    .line 291
    iget v3, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 292
    .line 293
    if-ne v1, v3, :cond_3

    .line 294
    .line 295
    iget v1, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 296
    .line 297
    iget v3, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 298
    .line 299
    if-ne v1, v3, :cond_3

    .line 300
    .line 301
    iget v1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 302
    .line 303
    iget v3, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 304
    .line 305
    if-ne v1, v3, :cond_3

    .line 306
    .line 307
    if-ne v1, v2, :cond_3

    .line 308
    .line 309
    iget v1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 310
    .line 311
    iget v3, v0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 312
    .line 313
    if-ne v1, v3, :cond_3

    .line 314
    .line 315
    iget v1, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 316
    .line 317
    iget v3, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 318
    .line 319
    if-ne v1, v3, :cond_3

    .line 320
    .line 321
    iget v1, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 322
    .line 323
    iget v3, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 324
    .line 325
    if-ne v1, v3, :cond_3

    .line 326
    .line 327
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 328
    .line 329
    iget v3, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 330
    .line 331
    if-ne v1, v3, :cond_3

    .line 332
    .line 333
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 334
    .line 335
    iget v3, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 336
    .line 337
    if-ne v1, v3, :cond_3

    .line 338
    .line 339
    const-string p0, "checkItemInfoLocked--title is different language or container==CONTAINER_HOTSEAT--A.cellX == B.cellY--A.cellY == B.cellX,or,title is different"

    .line 340
    .line 341
    invoke-static {p3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    .line 343
    .line 344
    invoke-static {}, Lx1/O;->Z3()V

    .line 345
    .line 346
    .line 347
    return-void

    .line 348
    :cond_3
    iget v1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 349
    .line 350
    iget v3, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 351
    .line 352
    if-ne v1, v3, :cond_4

    .line 353
    .line 354
    iget v1, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 355
    .line 356
    iget v3, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 357
    .line 358
    if-ne v1, v3, :cond_4

    .line 359
    .line 360
    iget v1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 361
    .line 362
    iget v3, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 363
    .line 364
    if-ne v1, v3, :cond_4

    .line 365
    .line 366
    if-ne v1, v2, :cond_4

    .line 367
    .line 368
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 369
    .line 370
    iget v2, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 371
    .line 372
    if-ne v1, v2, :cond_4

    .line 373
    .line 374
    iget v1, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 375
    .line 376
    iget v2, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 377
    .line 378
    if-ne v1, v2, :cond_4

    .line 379
    .line 380
    new-instance p0, Ljava/lang/StringBuilder;

    .line 381
    .line 382
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 383
    .line 384
    .line 385
    const-string p2, "checkItemInfoLocked--modelShortcut.intent:"

    .line 386
    .line 387
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    .line 389
    .line 390
    iget-object p1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 391
    .line 392
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    const-string p1, "--shortcut.intent:"

    .line 396
    .line 397
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    iget-object p1, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 401
    .line 402
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object p0

    .line 409
    invoke-static {p3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 410
    .line 411
    .line 412
    invoke-static {}, Lx1/O;->Z3()V

    .line 413
    .line 414
    .line 415
    return-void

    .line 416
    :cond_4
    instance-of p1, p2, Lcom/android/launcher3/model/data/A;

    .line 417
    .line 418
    if-eqz p1, :cond_5

    .line 419
    .line 420
    iget p1, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 421
    .line 422
    const/4 v0, 0x4

    .line 423
    if-ne p1, v0, :cond_5

    .line 424
    .line 425
    iget v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 426
    .line 427
    if-ne v0, p1, :cond_5

    .line 428
    .line 429
    iget p1, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 430
    .line 431
    iget v0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 432
    .line 433
    if-ne p1, v0, :cond_5

    .line 434
    .line 435
    iget p1, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 436
    .line 437
    iget v0, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 438
    .line 439
    if-ne p1, v0, :cond_5

    .line 440
    .line 441
    iget p1, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 442
    .line 443
    iget v0, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 444
    .line 445
    if-ne p1, v0, :cond_5

    .line 446
    .line 447
    iget p1, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 448
    .line 449
    iget v0, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 450
    .line 451
    if-ne p1, v0, :cond_5

    .line 452
    .line 453
    iget p1, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 454
    .line 455
    iget v0, p2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 456
    .line 457
    if-ne p1, v0, :cond_5

    .line 458
    .line 459
    iget p1, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 460
    .line 461
    iget v0, p2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 462
    .line 463
    if-ne p1, v0, :cond_5

    .line 464
    .line 465
    const-string p0, "checkItemInfoLocked--LauncherAppWidgetInfo--Error: ItemInfo passed to checkItemInfo doesn\'t match original"

    .line 466
    .line 467
    invoke-static {p3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    .line 469
    .line 470
    return-void

    .line 471
    :cond_5
    instance-of p1, p2, Lcom/android/launcher3/model/data/p;

    .line 472
    .line 473
    if-eqz p1, :cond_6

    .line 474
    .line 475
    iget p1, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 476
    .line 477
    const/4 v0, 0x2

    .line 478
    if-ne p1, v0, :cond_6

    .line 479
    .line 480
    iget v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 481
    .line 482
    if-ne v0, p1, :cond_6

    .line 483
    .line 484
    iget p1, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 485
    .line 486
    iget v0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 487
    .line 488
    if-ne p1, v0, :cond_6

    .line 489
    .line 490
    iget p1, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 491
    .line 492
    iget v0, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 493
    .line 494
    if-ne p1, v0, :cond_6

    .line 495
    .line 496
    iget p1, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 497
    .line 498
    iget v0, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 499
    .line 500
    if-ne p1, v0, :cond_6

    .line 501
    .line 502
    iget p1, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 503
    .line 504
    iget v0, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 505
    .line 506
    if-ne p1, v0, :cond_6

    .line 507
    .line 508
    const-string p0, "checkItemInfoLocked--FolderInfo--Error: ItemInfo passed to checkItemInfo doesn\'t match original"

    .line 509
    .line 510
    invoke-static {p3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    .line 512
    .line 513
    return-void

    .line 514
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 515
    .line 516
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 517
    .line 518
    .line 519
    const-string v0, "item: "

    .line 520
    .line 521
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 522
    .line 523
    .line 524
    if-eqz p2, :cond_7

    .line 525
    .line 526
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->toString()Ljava/lang/String;

    .line 527
    .line 528
    .line 529
    move-result-object p2

    .line 530
    goto :goto_0

    .line 531
    :cond_7
    const-string p2, "null"

    .line 532
    .line 533
    :goto_0
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    .line 535
    .line 536
    const-string p2, "modelItem: "

    .line 537
    .line 538
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 539
    .line 540
    .line 541
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->toString()Ljava/lang/String;

    .line 542
    .line 543
    .line 544
    move-result-object p0

    .line 545
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 546
    .line 547
    .line 548
    const-string p0, "Error: ItemInfo passed to checkItemInfo doesn\'t match original"

    .line 549
    .line 550
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 551
    .line 552
    .line 553
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 554
    .line 555
    .line 556
    move-result-object p0

    .line 557
    new-instance p1, Ljava/lang/StringBuilder;

    .line 558
    .line 559
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 560
    .line 561
    .line 562
    const-string p2, "checkItemInfoLocked--msg:"

    .line 563
    .line 564
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 565
    .line 566
    .line 567
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 568
    .line 569
    .line 570
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object p0

    .line 574
    invoke-static {p3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 575
    .line 576
    .line 577
    invoke-static {}, Lx1/O;->Z3()V

    .line 578
    .line 579
    .line 580
    :cond_8
    return-void
.end method


# virtual methods
.method public A(Lcom/android/launcher3/model/data/m;)V
    .locals 2

    .line 1
    new-instance v0, Lz1/J3$d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lz1/J3$d;-><init>(Lz1/J3;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {p0, v1}, Lz1/J3;->W(Ljava/util/Collection;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lz1/J3;->X()V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lz1/G3;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1, v0}, Lz1/G3;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/m;Lz1/J3$d;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Lz1/J3;->V(Ljava/lang/Runnable;)Lz1/J3$c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lz1/J3;->F(Lz1/J3$c;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public B(Lcom/android/launcher3/model/data/y;Ljava/lang/String;)V
    .locals 0

    .line 1
    filled-new-array {p1}, [Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1, p2}, Lz1/J3;->C(Ljava/util/Collection;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public C(Ljava/util/Collection;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/J3$d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lz1/J3$d;-><init>(Lz1/J3;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "removing items from db "

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    new-instance v3, Lz1/s3;

    .line 21
    .line 22
    invoke-direct {v3}, Lz1/s3;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, ","

    .line 30
    .line 31
    invoke-static {v3}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v2, ". Reason: ["

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_0

    .line 54
    .line 55
    const-string p2, "unknown"

    .line 56
    .line 57
    :cond_0
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string p2, "]"

    .line 61
    .line 62
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    const-string v1, "ModelWriter"

    .line 70
    .line 71
    invoke-static {v1, p2}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0, p1}, Lz1/J3;->W(Ljava/util/Collection;)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0}, Lz1/J3;->X()V

    .line 78
    .line 79
    .line 80
    new-instance p2, Lz1/A3;

    .line 81
    .line 82
    invoke-direct {p2, p0, p1, v0}, Lz1/A3;-><init>(Lz1/J3;Ljava/util/Collection;Lz1/J3$d;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, p2}, Lz1/J3;->V(Ljava/lang/Runnable;)Lz1/J3$c;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0, p1}, Lz1/J3;->F(Lz1/J3$c;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public D(Ljava/util/function/Predicate;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/J3;->c:Lz1/y0;

    .line 2
    .line 3
    iget-object v0, v0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/lang/Iterable;->spliterator()Ljava/util/Spliterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ljava/util/stream/StreamSupport;->stream(Ljava/util/Spliterator;Z)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0, p1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ljava/util/Collection;

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Lz1/J3;->C(Ljava/util/Collection;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public E(Lcom/android/launcher3/model/data/A;Lcom/android/launcher3/widget/l0;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->G0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v1, "deleteWidgetInfo items:"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    new-instance v1, Ljava/lang/Throwable;

    .line 31
    .line 32
    const-string v2, "deleteWidgetInfo"

    .line 33
    .line 34
    invoke-direct {v1, v2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v1, " reason:"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "ModelWriter"

    .line 57
    .line 58
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    :cond_0
    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-direct {p0, v0}, Lz1/J3;->W(Ljava/util/Collection;)V

    .line 66
    .line 67
    .line 68
    invoke-direct {p0}, Lz1/J3;->X()V

    .line 69
    .line 70
    .line 71
    if-eqz p2, :cond_1

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/A;->z()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_1

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/A;->A()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    new-instance v0, Lz1/u3;

    .line 86
    .line 87
    invoke-direct {v0, p2, p1}, Lz1/u3;-><init>(Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/model/data/A;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, v0}, Lz1/J3;->V(Ljava/lang/Runnable;)Lz1/J3$c;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p0, p2}, Lz1/J3;->F(Lz1/J3$c;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    invoke-virtual {p0, p1, p3}, Lz1/J3;->B(Lcom/android/launcher3/model/data/y;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public F(Lz1/J3$c;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lz1/J3;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lz1/J3;->g:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p1}, Lz1/J3$c;->a()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Q(Lcom/android/launcher3/model/data/y;IIIIIIIZ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lz1/J3;->c0(Lcom/android/launcher3/model/data/y;IIII)V

    .line 2
    .line 3
    .line 4
    const/16 p3, -0x65

    .line 5
    .line 6
    if-ne p2, p3, :cond_1

    .line 7
    .line 8
    if-eqz p9, :cond_0

    .line 9
    .line 10
    sub-int/2addr p8, p5

    .line 11
    add-int/lit8 p4, p8, -0x1

    .line 12
    .line 13
    :cond_0
    iput p4, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 14
    .line 15
    :cond_1
    iput p6, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 16
    .line 17
    iput p7, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lz1/J3;->Y(Lcom/android/launcher3/model/data/y;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lz1/J3;->X()V

    .line 23
    .line 24
    .line 25
    new-instance p2, Lz1/J3$f;

    .line 26
    .line 27
    new-instance p3, Lz1/v3;

    .line 28
    .line 29
    invoke-direct {p3, p0, p1}, Lz1/v3;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/y;)V

    .line 30
    .line 31
    .line 32
    sget-object p4, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 33
    .line 34
    invoke-direct {p2, p0, p1, p3, p4}, Lz1/J3$f;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/y;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2}, Lz1/J3$c;->a()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public R(Lcom/android/launcher3/model/data/y;IIIIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lz1/J3;->c0(Lcom/android/launcher3/model/data/y;IIII)V

    .line 2
    .line 3
    .line 4
    iput p6, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 5
    .line 6
    iput p7, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lz1/J3;->Y(Lcom/android/launcher3/model/data/y;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lz1/J3;->X()V

    .line 12
    .line 13
    .line 14
    new-instance p2, Lz1/J3$f;

    .line 15
    .line 16
    new-instance p3, Lz1/D3;

    .line 17
    .line 18
    invoke-direct {p3, p0, p1}, Lz1/D3;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/y;)V

    .line 19
    .line 20
    .line 21
    sget-object p4, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {p2, p0, p1, p3, p4}, Lz1/J3$f;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/y;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Lz1/J3$c;->a()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public S(Lcom/android/launcher3/model/data/A;II)V
    .locals 2

    .line 1
    sget-object p2, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v0, Lz1/J3$f;

    .line 4
    .line 5
    new-instance v1, Lz1/z3;

    .line 6
    .line 7
    invoke-direct {v1, p0, p3}, Lz1/z3;-><init>(Lz1/J3;I)V

    .line 8
    .line 9
    .line 10
    sget-object p3, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1, v1, p3}, Lz1/J3$f;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/y;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public T(Lcom/android/launcher3/model/data/y;IIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lz1/J3;->c0(Lcom/android/launcher3/model/data/y;IIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lz1/J3;->Y(Lcom/android/launcher3/model/data/y;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lz1/J3;->X()V

    .line 8
    .line 9
    .line 10
    new-instance p2, Lz1/J3$f;

    .line 11
    .line 12
    new-instance p3, Lz1/E3;

    .line 13
    .line 14
    invoke-direct {p3, p0, p1}, Lz1/E3;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/y;)V

    .line 15
    .line 16
    .line 17
    sget-object p4, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-direct {p2, p0, p1, p3, p4}, Lz1/J3$f;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/y;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lz1/J3;->F(Lz1/J3$c;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public U(Ljava/util/ArrayList;II)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;II)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    new-instance v2, Lz1/t3;

    .line 11
    .line 12
    invoke-direct {v2, p1}, Lz1/t3;-><init>(Ljava/util/ArrayList;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, v2}, Lz1/J3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lz1/J3;->X()V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    :goto_0
    if-ge v2, v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    move-object v5, v3

    .line 29
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 30
    .line 31
    iget v8, v5, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 32
    .line 33
    iget v9, v5, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 34
    .line 35
    move-object v4, p0

    .line 36
    move v6, p2

    .line 37
    move v7, p3

    .line 38
    invoke-direct/range {v4 .. v9}, Lz1/J3;->c0(Lcom/android/launcher3/model/data/y;IIII)V

    .line 39
    .line 40
    .line 41
    new-instance p0, Landroid/content/ContentValues;

    .line 42
    .line 43
    invoke-direct {p0}, Landroid/content/ContentValues;-><init>()V

    .line 44
    .line 45
    .line 46
    iget p2, v5, Lcom/android/launcher3/model/data/y;->container:I

    .line 47
    .line 48
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    const-string p3, "container"

    .line 53
    .line 54
    invoke-virtual {p0, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 55
    .line 56
    .line 57
    iget p2, v5, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 58
    .line 59
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    const-string p3, "cellX"

    .line 64
    .line 65
    invoke-virtual {p0, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 66
    .line 67
    .line 68
    iget p2, v5, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 69
    .line 70
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    const-string p3, "cellY"

    .line 75
    .line 76
    invoke-virtual {p0, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 77
    .line 78
    .line 79
    iget p2, v5, Lcom/android/launcher3/model/data/y;->rank:I

    .line 80
    .line 81
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    const-string p3, "rank"

    .line 86
    .line 87
    invoke-virtual {p0, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 88
    .line 89
    .line 90
    iget p2, v5, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 91
    .line 92
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    const-string p3, "screen"

    .line 97
    .line 98
    invoke-virtual {p0, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    add-int/lit8 v2, v2, 0x1

    .line 105
    .line 106
    move-object p0, v4

    .line 107
    move p2, v6

    .line 108
    move p3, v7

    .line 109
    goto :goto_0

    .line 110
    :cond_0
    move-object v4, p0

    .line 111
    new-instance p0, Lz1/J3$g;

    .line 112
    .line 113
    sget-object p2, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 114
    .line 115
    invoke-direct {p0, v4, p1, v0, p2}, Lz1/J3$g;-><init>(Lz1/J3;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v4, p0}, Lz1/J3;->F(Lz1/J3$c;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public V(Ljava/lang/Runnable;)Lz1/J3$c;
    .locals 1

    .line 1
    new-instance v0, Lz1/J3$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lz1/J3$a;-><init>(Lz1/J3;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public Y(Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    new-instance v0, Lz1/I3;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lz1/I3;-><init>(Lcom/android/launcher3/model/data/y;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lz1/J3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public a0(Lcom/android/launcher3/model/data/p;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lz1/J3$f;

    .line 4
    .line 5
    new-instance v2, Lz1/H3;

    .line 6
    .line 7
    invoke-direct {v2, p0, p1}, Lz1/H3;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/p;)V

    .line 8
    .line 9
    .line 10
    sget-object v3, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1, v2, v3}, Lz1/J3$f;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/y;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public b0(Lcom/android/launcher3/model/data/y;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lz1/J3;->Y(Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lz1/J3$f;

    .line 5
    .line 6
    new-instance v1, Lz1/F3;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1}, Lz1/F3;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/y;)V

    .line 9
    .line 10
    .line 11
    sget-object v2, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1, v1, v2}, Lz1/J3$f;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/y;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Lz1/J3$c;->a()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public w(Lcom/android/launcher3/model/data/y;IIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lz1/J3;->c0(Lcom/android/launcher3/model/data/y;IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lz1/J3;->b:Lcom/android/launcher3/D3;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p2}, Lz1/k2;->y()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    iput p2, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 15
    .line 16
    new-instance p2, Lz1/B3;

    .line 17
    .line 18
    invoke-direct {p2, p1}, Lz1/B3;-><init>(Lcom/android/launcher3/model/data/y;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, p2}, Lz1/J3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Lz1/J3;->X()V

    .line 25
    .line 26
    .line 27
    iget p2, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 28
    .line 29
    const/4 p3, 0x1

    .line 30
    if-ne p2, p3, :cond_0

    .line 31
    .line 32
    iget-object p2, p0, Lz1/J3;->a:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {p2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iget p3, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 43
    .line 44
    iget-object p4, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 45
    .line 46
    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p4

    .line 50
    const/4 p5, 0x0

    .line 51
    invoke-virtual {p2, p3, p5, p4}, Lcom/android/launcher3/H5;->p1(IILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    new-instance p2, Lz1/J3$d;

    .line 55
    .line 56
    invoke-direct {p2, p0}, Lz1/J3$d;-><init>(Lz1/J3;)V

    .line 57
    .line 58
    .line 59
    new-instance p3, Ljava/lang/Throwable;

    .line 60
    .line 61
    invoke-direct {p3}, Ljava/lang/Throwable;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p3}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    new-instance p4, Lz1/C3;

    .line 69
    .line 70
    invoke-direct {p4, p0, p1, p3, p2}, Lz1/C3;-><init>(Lz1/J3;Lcom/android/launcher3/model/data/y;[Ljava/lang/StackTraceElement;Lz1/J3$d;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, p4}, Lz1/J3;->V(Ljava/lang/Runnable;)Lz1/J3$c;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lz1/J3$c;->a()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public x(Lcom/android/launcher3/model/data/y;IIII)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual/range {p0 .. p5}, Lz1/J3;->w(Lcom/android/launcher3/model/data/y;IIII)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual/range {p0 .. p5}, Lz1/J3;->T(Lcom/android/launcher3/model/data/y;IIII)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public z()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lz1/J3;->h:Z

    .line 3
    .line 4
    iget-object v0, p0, Lz1/J3;->g:Ljava/util/List;

    .line 5
    .line 6
    new-instance v1, Lz1/x3;

    .line 7
    .line 8
    invoke-direct {v1}, Lz1/x3;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lz1/J3;->g:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 17
    .line 18
    .line 19
    return-void
.end method
