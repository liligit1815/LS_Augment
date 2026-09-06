.class public Lz1/p4;
.super Ljava/lang/Object;
.source "PredictionUpdateTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# static fields
.field public static final c:Lcom/android/launcher3/X;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/X<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/app/prediction/AppTarget;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lz1/w4$a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/r0;->g:Lcom/android/launcher3/r0;

    .line 4
    .line 5
    const-string v2, "last_prediction_enabled_state"

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Lcom/android/launcher3/J3;->p(Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;)Lcom/android/launcher3/X;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lz1/p4;->c:Lcom/android/launcher3/X;

    .line 12
    .line 13
    return-void
.end method

.method constructor <init>(Lz1/w4$a;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/w4$a;",
            "Ljava/util/List<",
            "Landroid/app/prediction/AppTarget;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/p4;->b:Lz1/w4$a;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/p4;->a:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Landroid/os/UserHandle;Landroid/content/ComponentName;Lcom/android/launcher3/model/data/d;)Z
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p2, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static synthetic c(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    const/4 v0, 0x6

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public static synthetic d(Lcom/android/launcher3/model/data/y;)Landroid/os/UserHandle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lz1/y0;Landroid/content/Context;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lz1/y0;->x(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Landroid/content/Context;Landroid/content/ComponentName;Landroid/os/UserHandle;Ls1/P;)Lcom/android/launcher3/model/data/I;
    .locals 1

    .line 1
    const-class v0, Landroid/content/pm/LauncherApps;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/android/launcher3/model/data/d;->Q(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p1, p2}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_0
    new-instance v0, Lcom/android/launcher3/model/data/d;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;Landroid/os/UserHandle;)V

    .line 24
    .line 25
    .line 26
    sget-object p2, Lt1/g;->d:Lt1/g;

    .line 27
    .line 28
    invoke-virtual {p3, v0, p1, p2}, Ls1/P;->F0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lt1/g;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p0}, Lcom/android/launcher3/model/data/d;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic g(Lz1/p4;Ls1/P;Landroid/content/Context;Lcom/android/launcher3/model/data/d;)Lcom/android/launcher3/model/data/I;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lz1/p4;->h(Ls1/P;Landroid/content/Context;Lcom/android/launcher3/model/data/d;)Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic h(Ls1/P;Landroid/content/Context;Lcom/android/launcher3/model/data/d;)Lcom/android/launcher3/model/data/I;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/p4;->b:Lz1/w4$a;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/w4$a;->d:Lt1/g;

    .line 4
    .line 5
    invoke-virtual {p1, p3, p0}, Ls1/P;->H0(Lcom/android/launcher3/model/data/z;Lt1/g;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3, p2}, Lcom/android/launcher3/model/data/d;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Lz1/o3;->W()Ls1/P;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    sget-object v3, Lz1/p4;->c:Lcom/android/launcher3/X;

    .line 14
    .line 15
    iget-object v4, p0, Lz1/p4;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    xor-int/lit8 v4, v4, 0x1

    .line 22
    .line 23
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {v2, v3, v4}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p2, Lz1/y0;->b:Lcom/android/launcher3/util/A0;

    .line 31
    .line 32
    iget-object v3, p0, Lz1/p4;->b:Lz1/w4$a;

    .line 33
    .line 34
    iget v3, v3, Lz1/w4$a;->a:I

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lz1/y0$c;

    .line 41
    .line 42
    iget-object v2, v2, Lz1/y0$c;->b:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    new-instance v3, Lz1/j4;

    .line 49
    .line 50
    invoke-direct {v3}, Lz1/j4;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    new-instance v3, Lz1/k4;

    .line 58
    .line 59
    invoke-direct {v3}, Lz1/k4;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Ljava/util/Set;

    .line 75
    .line 76
    new-instance v3, Ljava/util/ArrayList;

    .line 77
    .line 78
    iget-object v4, p0, Lz1/p4;->a:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 85
    .line 86
    .line 87
    iget-object v4, p0, Lz1/p4;->a:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    if-eqz v5, :cond_3

    .line 98
    .line 99
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    check-cast v5, Landroid/app/prediction/AppTarget;

    .line 104
    .line 105
    invoke-virtual {v5}, Landroid/app/prediction/AppTarget;->getShortcutInfo()Landroid/content/pm/ShortcutInfo;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    if-eqz v6, :cond_0

    .line 110
    .line 111
    invoke-virtual {v6}, Landroid/content/pm/ShortcutInfo;->getUserHandle()Landroid/os/UserHandle;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    invoke-interface {v2, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    new-instance v5, Lcom/android/launcher3/model/data/I;

    .line 119
    .line 120
    invoke-direct {v5, v6, v1}, Lcom/android/launcher3/model/data/I;-><init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v5, v6}, Ls1/P;->A0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/ShortcutInfo;)V

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_0
    invoke-virtual {v5}, Landroid/app/prediction/AppTarget;->getClassName()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    const-string v7, "@instantapp"

    .line 132
    .line 133
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v7

    .line 137
    if-eqz v7, :cond_1

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_1
    new-instance v7, Landroid/content/ComponentName;

    .line 141
    .line 142
    invoke-virtual {v5}, Landroid/app/prediction/AppTarget;->getPackageName()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v8

    .line 146
    invoke-direct {v7, v8, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v5}, Landroid/app/prediction/AppTarget;->getUser()Landroid/os/UserHandle;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    iget-object v6, p3, Lz1/m;->a:Ljava/util/ArrayList;

    .line 154
    .line 155
    invoke-virtual {v6}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 156
    .line 157
    .line 158
    move-result-object v6

    .line 159
    new-instance v8, Lz1/l4;

    .line 160
    .line 161
    invoke-direct {v8, v5, v7}, Lz1/l4;-><init>(Landroid/os/UserHandle;Landroid/content/ComponentName;)V

    .line 162
    .line 163
    .line 164
    invoke-interface {v6, v8}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 165
    .line 166
    .line 167
    move-result-object v6

    .line 168
    new-instance v8, Lz1/m4;

    .line 169
    .line 170
    invoke-direct {v8, p0, v0, v1}, Lz1/m4;-><init>(Lz1/p4;Ls1/P;Landroid/content/Context;)V

    .line 171
    .line 172
    .line 173
    invoke-interface {v6, v8}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 174
    .line 175
    .line 176
    move-result-object v6

    .line 177
    invoke-interface {v6}, Ljava/util/stream/Stream;->findAny()Ljava/util/Optional;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    new-instance v8, Lz1/n4;

    .line 182
    .line 183
    invoke-direct {v8, v1, v7, v5, v0}, Lz1/n4;-><init>(Landroid/content/Context;Landroid/content/ComponentName;Landroid/os/UserHandle;Ls1/P;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v6, v8}, Ljava/util/Optional;->orElseGet(Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v5

    .line 190
    check-cast v5, Lcom/android/launcher3/model/data/I;

    .line 191
    .line 192
    if-nez v5, :cond_2

    .line 193
    .line 194
    goto :goto_0

    .line 195
    :cond_2
    :goto_1
    iget-object v6, p0, Lz1/p4;->b:Lz1/w4$a;

    .line 196
    .line 197
    iget v6, v6, Lz1/w4$a;->a:I

    .line 198
    .line 199
    iput v6, v5, Lcom/android/launcher3/model/data/y;->container:I

    .line 200
    .line 201
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    goto :goto_0

    .line 205
    :cond_3
    new-instance p3, Lz1/y0$c;

    .line 206
    .line 207
    iget-object v0, p0, Lz1/p4;->b:Lz1/w4$a;

    .line 208
    .line 209
    iget v0, v0, Lz1/w4$a;->a:I

    .line 210
    .line 211
    invoke-direct {p3, v0, v3}, Lz1/y0$c;-><init>(ILjava/util/List;)V

    .line 212
    .line 213
    .line 214
    iget-object v0, p2, Lz1/y0;->b:Lcom/android/launcher3/util/A0;

    .line 215
    .line 216
    iget v3, p3, Lz1/y0$c;->a:I

    .line 217
    .line 218
    invoke-virtual {v0, v3, p3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p1, p3}, Lz1/o3;->C(Lz1/y0$c;)V

    .line 222
    .line 223
    .line 224
    new-instance p1, Lz1/o4;

    .line 225
    .line 226
    invoke-direct {p1, p2, v1}, Lz1/o4;-><init>(Lz1/y0;Landroid/content/Context;)V

    .line 227
    .line 228
    .line 229
    invoke-interface {v2, p1}, Ljava/util/Set;->forEach(Ljava/util/function/Consumer;)V

    .line 230
    .line 231
    .line 232
    iget-object p0, p0, Lz1/p4;->b:Lz1/w4$a;

    .line 233
    .line 234
    iget-object p0, p0, Lz1/w4$a;->b:Lcom/android/launcher3/util/R1;

    .line 235
    .line 236
    iget-object p1, p3, Lz1/y0$c;->b:Ljava/util/List;

    .line 237
    .line 238
    const/4 p2, 0x0

    .line 239
    invoke-virtual {p0, v1, p1, p2}, Lcom/android/launcher3/util/R1;->d(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    return-void
.end method
