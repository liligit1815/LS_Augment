.class public final Lcom/android/launcher3/util/g1;
.super Ljava/lang/Object;
.source "LayoutImportExportHelper.kt"


# static fields
.field public static final a:Lcom/android/launcher3/util/g1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/g1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/g1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/util/g1;->a:Lcom/android/launcher3/util/g1;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/g1;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/g1;->p(Lcom/android/launcher3/D3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lu4/l;Landroid/content/Context;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/launcher3/util/g1;->i(Lu4/l;Landroid/content/Context;Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/g1;->o(Lcom/android/launcher3/D3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Landroid/content/ContentResolver;[BLcom/android/launcher3/D3;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/util/g1;->n(Landroid/content/ContentResolver;[BLcom/android/launcher3/D3;Ljava/lang/Integer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ljava/util/concurrent/CompletableFuture;Ljava/lang/String;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/util/g1;->k(Ljava/util/concurrent/CompletableFuture;Ljava/lang/String;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final g(Lcom/android/launcher3/util/Z0$b;Landroid/content/Context;Lcom/android/launcher3/model/data/y;)V
    .locals 8

    .line 1
    sget-object p0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LD1/t;

    .line 8
    .line 9
    iget-object v0, p3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget p0, p0, Lcom/android/launcher3/util/N2;->b:I

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    const/4 v1, 0x2

    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    if-eq p0, v1, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    :goto_0
    move-object v7, p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    const-string p0, "cloned"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string p0, "work"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :goto_1
    iget p0, p3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 33
    .line 34
    const-string v0, "getPackageName(...)"

    .line 35
    .line 36
    if-eqz p0, :cond_7

    .line 37
    .line 38
    if-eq p0, v1, :cond_4

    .line 39
    .line 40
    const/4 p2, 0x4

    .line 41
    if-eq p0, p2, :cond_3

    .line 42
    .line 43
    const/4 p2, 0x6

    .line 44
    if-eq p0, p2, :cond_2

    .line 45
    .line 46
    goto/16 :goto_3

    .line 47
    .line 48
    :cond_2
    invoke-static {p3}, LN1/e;->d(Lcom/android/launcher3/model/data/y;)LN1/e;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, LN1/e;->f()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, LN1/e;->e()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p3, "getId(...)"

    .line 64
    .line 65
    invoke-static {p0, p3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p2, p0, v7}, Lcom/android/launcher3/util/Z0$b;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/Z0;

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_3
    const-string p0, "null cannot be cast to non-null type com.android.launcher3.model.data.LauncherAppWidgetInfo"

    .line 73
    .line 74
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    move-object p0, p3

    .line 78
    check-cast p0, Lcom/android/launcher3/model/data/A;

    .line 79
    .line 80
    iget-object p2, p0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 81
    .line 82
    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-static {v3, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    const-string p0, "getClassName(...)"

    .line 96
    .line 97
    invoke-static {v4, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget v5, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 101
    .line 102
    iget v6, p3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 103
    .line 104
    move-object v2, p1

    .line 105
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/util/Z0$b;->g(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)Lcom/android/launcher3/util/Z0;

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_4
    move-object v2, p1

    .line 110
    const-string p0, "null cannot be cast to non-null type com.android.launcher3.model.data.FolderInfo"

    .line 111
    .line 112
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    check-cast p3, Lcom/android/launcher3/model/data/p;

    .line 116
    .line 117
    iget-object p0, p3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 118
    .line 119
    if-eqz p0, :cond_5

    .line 120
    .line 121
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    if-nez p0, :cond_6

    .line 126
    .line 127
    :cond_5
    const-string p0, ""

    .line 128
    .line 129
    :cond_6
    invoke-virtual {v2, p0}, Lcom/android/launcher3/util/Z0$b;->d(Ljava/lang/String;)Lcom/android/launcher3/util/Z0$a;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    const-string p3, "getContents(...)"

    .line 138
    .line 139
    invoke-static {p1, p3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 147
    .line 148
    .line 149
    move-result p3

    .line 150
    if-eqz p3, :cond_8

    .line 151
    .line 152
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object p3

    .line 156
    check-cast p3, Lcom/android/launcher3/model/data/y;

    .line 157
    .line 158
    sget-object v0, Lcom/android/launcher3/util/g1;->a:Lcom/android/launcher3/util/g1;

    .line 159
    .line 160
    invoke-static {p3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    invoke-direct {v0, p0, p2, p3}, Lcom/android/launcher3/util/g1;->g(Lcom/android/launcher3/util/Z0$b;Landroid/content/Context;Lcom/android/launcher3/model/data/y;)V

    .line 164
    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_7
    move-object v2, p1

    .line 168
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    if-eqz p0, :cond_8

    .line 173
    .line 174
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-virtual {v2, p1, p0, v7}, Lcom/android/launcher3/util/Z0$b;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/Z0;

    .line 186
    .line 187
    .line 188
    :cond_8
    :goto_3
    return-void
.end method

.method private static final i(Lu4/l;Landroid/content/Context;Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 3

    .line 1
    const-string v0, "<unused var>"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p2, "dataModel"

    .line 7
    .line 8
    invoke-static {p3, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p2, Lcom/android/launcher3/util/Z0;

    .line 15
    .line 16
    invoke-direct {p2}, Lcom/android/launcher3/util/Z0;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object p3, p3, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 20
    .line 21
    const-string p4, "itemsIdMap"

    .line 22
    .line 23
    invoke-static {p3, p4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result p4

    .line 34
    if-eqz p4, :cond_2

    .line 35
    .line 36
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p4

    .line 40
    check-cast p4, Lcom/android/launcher3/model/data/y;

    .line 41
    .line 42
    iget v0, p4, Lcom/android/launcher3/model/data/y;->container:I

    .line 43
    .line 44
    const/16 v1, -0x65

    .line 45
    .line 46
    if-eq v0, v1, :cond_1

    .line 47
    .line 48
    const/16 v1, -0x64

    .line 49
    .line 50
    if-eq v0, v1, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iget v0, p4, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 54
    .line 55
    iget v1, p4, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 56
    .line 57
    iget v2, p4, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 58
    .line 59
    invoke-virtual {p2, v0, v1, v2}, Lcom/android/launcher3/util/Z0;->c(III)Lcom/android/launcher3/util/Z0$b;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    iget v0, p4, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 65
    .line 66
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/Z0;->b(I)Lcom/android/launcher3/util/Z0$b;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :goto_1
    sget-object v1, Lcom/android/launcher3/util/g1;->a:Lcom/android/launcher3/util/g1;

    .line 71
    .line 72
    invoke-static {p4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    invoke-direct {v1, v0, p1, p4}, Lcom/android/launcher3/util/g1;->g(Lcom/android/launcher3/util/Z0$b;Landroid/content/Context;Lcom/android/launcher3/model/data/y;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z0;->d()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method private static final k(Ljava/util/concurrent/CompletableFuture;Ljava/lang/String;)Lh4/t;
    .locals 1

    .line 1
    const-string v0, "xmlString"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CompletableFuture;->complete(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 10
    .line 11
    return-object p0
.end method

.method private static final n(Landroid/content/ContentResolver;[BLcom/android/launcher3/D3;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/T3;->a([B)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string p3, "launcher3.layout.provider"

    .line 6
    .line 7
    invoke-static {p0, p3, p1}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    sget-object p1, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/util/d1;

    .line 13
    .line 14
    invoke-direct {v0, p2}, Lcom/android/launcher3/util/d1;-><init>(Lcom/android/launcher3/D3;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 25
    .line 26
    new-instance v1, Lcom/android/launcher3/util/e1;

    .line 27
    .line 28
    invoke-direct {v1, p2}, Lcom/android/launcher3/util/e1;-><init>(Lcom/android/launcher3/D3;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-interface {p2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    new-instance p2, Lcom/android/launcher3/util/f1;

    .line 39
    .line 40
    invoke-direct {p2}, Lcom/android/launcher3/util/f1;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, p2}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x0

    .line 51
    invoke-static {p0, p3, p1}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private static final o(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lz1/k2;->j()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static final p(Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final q()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final h(Landroid/content/Context;Lu4/l;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lu4/l<",
            "-",
            "Ljava/lang/String;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "callback"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Lcom/android/launcher3/util/c1;

    .line 22
    .line 23
    invoke-direct {v0, p2, p1}, Lcom/android/launcher3/util/c1;-><init>(Lu4/l;Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final j(Landroid/content/Context;)Ljava/util/concurrent/CompletableFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/concurrent/CompletableFuture<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/concurrent/CompletableFuture;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/concurrent/CompletableFuture;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/util/b1;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Lcom/android/launcher3/util/b1;-><init>(Ljava/util/concurrent/CompletableFuture;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/util/g1;->h(Landroid/content/Context;Lu4/l;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public final l(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "xmlString"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 12
    .line 13
    const-string v1, "UTF_8"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    const-string v0, "getBytes(...)"

    .line 23
    .line 24
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/g1;->m(Landroid/content/Context;[B)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final m(Landroid/content/Context;[B)V
    .locals 7

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "data"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "SHA-256"

    .line 22
    .line 23
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, p2}, Ljava/security/MessageDigest;->digest([B)[B

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "ignore"

    .line 32
    .line 33
    const-string v2, "launcher-layout"

    .line 34
    .line 35
    const-wide/16 v3, 0x0

    .line 36
    .line 37
    invoke-static {v0, v2, v3, v4, v1}, Landroid/app/blob/BlobHandle;->createWithSha256([BLjava/lang/CharSequence;JLjava/lang/String;)Landroid/app/blob/BlobHandle;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "createWithSha256(...)"

    .line 42
    .line 43
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const-class v2, Landroid/app/blob/BlobStoreManager;

    .line 47
    .line 48
    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    check-cast v2, Landroid/app/blob/BlobStoreManager;

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {v2, v1}, Landroid/app/blob/BlobStoreManager;->createSession(Landroid/app/blob/BlobHandle;)J

    .line 62
    .line 63
    .line 64
    move-result-wide v5

    .line 65
    invoke-virtual {v2, v5, v6}, Landroid/app/blob/BlobStoreManager;->openSession(J)Landroid/app/blob/BlobStoreManager$Session;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    :try_start_0
    new-instance v2, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;

    .line 70
    .line 71
    const-wide/16 v5, -0x1

    .line 72
    .line 73
    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/app/blob/BlobStoreManager$Session;->openWrite(JJ)Landroid/os/ParcelFileDescriptor;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-direct {v2, v3}, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    .line 79
    .line 80
    :try_start_1
    invoke-virtual {v2, p2}, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;->write([B)V

    .line 81
    .line 82
    .line 83
    sget-object p2, Lh4/t;->a:Lh4/t;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 84
    .line 85
    const/4 p2, 0x0

    .line 86
    :try_start_2
    invoke-static {v2, p2}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1}, Landroid/app/blob/BlobStoreManager$Session;->allowPublicAccess()V

    .line 90
    .line 91
    .line 92
    sget-object v2, Lcom/android/launcher3/util/m0;->d:Lcom/android/launcher3/util/p1;

    .line 93
    .line 94
    new-instance v3, Lcom/android/launcher3/util/a1;

    .line 95
    .line 96
    invoke-direct {v3, p1, v0, p0}, Lcom/android/launcher3/util/a1;-><init>(Landroid/content/ContentResolver;[BLcom/android/launcher3/D3;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v2, v3}, Landroid/app/blob/BlobStoreManager$Session;->commit(Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 100
    .line 101
    .line 102
    invoke-static {v1, p2}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :catchall_0
    move-exception p0

    .line 107
    goto :goto_0

    .line 108
    :catchall_1
    move-exception p0

    .line 109
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 110
    :catchall_2
    move-exception p1

    .line 111
    :try_start_4
    invoke-static {v2, p0}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 112
    .line 113
    .line 114
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 115
    :goto_0
    :try_start_5
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 116
    :catchall_3
    move-exception p1

    .line 117
    invoke-static {v1, p0}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 118
    .line 119
    .line 120
    throw p1
.end method
