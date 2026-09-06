.class public Lz1/I4;
.super Ljava/lang/Object;
.source "UserLockStateChangedTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# instance fields
.field private final a:Landroid/os/UserHandle;

.field private b:Z


# direct methods
.method public constructor <init>(Landroid/os/UserHandle;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/I4;->a:Landroid/os/UserHandle;

    .line 5
    .line 6
    iput-boolean p2, p0, Lz1/I4;->b:Z

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Lz1/I4;Ljava/util/HashMap;Ljava/util/HashSet;Landroid/content/Context;Lz1/o3;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lz1/I4;->c(Ljava/util/HashMap;Ljava/util/HashSet;Landroid/content/Context;Lz1/o3;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c(Ljava/util/HashMap;Ljava/util/HashSet;Landroid/content/Context;Lz1/o3;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    iget v0, p6, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    if-ne v0, v1, :cond_2

    .line 5
    .line 6
    iget-boolean p0, p0, Lz1/I4;->b:Z

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-static {p6}, LN1/e;->d(Lcom/android/launcher3/model/data/y;)LN1/e;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Landroid/content/pm/ShortcutInfo;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p2, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget p0, p6, Lcom/android/launcher3/model/data/z;->h:I

    .line 27
    .line 28
    and-int/lit8 p0, p0, -0x21

    .line 29
    .line 30
    iput p0, p6, Lcom/android/launcher3/model/data/z;->h:I

    .line 31
    .line 32
    invoke-virtual {p6, p1, p3}, Lcom/android/launcher3/model/data/I;->i0(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p4}, Lz1/o3;->W()Ls1/P;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0, p6, p1}, Ls1/P;->A0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/ShortcutInfo;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget p0, p6, Lcom/android/launcher3/model/data/z;->h:I

    .line 44
    .line 45
    or-int/lit8 p0, p0, 0x20

    .line 46
    .line 47
    iput p0, p6, Lcom/android/launcher3/model/data/z;->h:I

    .line 48
    .line 49
    :goto_0
    invoke-virtual {p5, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    new-instance v2, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-boolean p3, p0, Lz1/I4;->b:Z

    .line 11
    .line 12
    if-eqz p3, :cond_3

    .line 13
    .line 14
    invoke-virtual {p1}, Lz1/o3;->X()Lcom/android/launcher3/D3;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-virtual {p3}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    invoke-static {}, Lx1/O;->W3()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p3}, Lz1/k2;->W()V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {p3}, Lz1/k2;->E()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v1, "UserLockStateChangedTask"

    .line 36
    .line 37
    new-instance v3, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v5, "need pinned Ai Shortcuts after clear cache:"

    .line 43
    .line 44
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    invoke-virtual {p3}, Lz1/k2;->V()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p3, v1}, Lz1/k2;->g0(Z)V

    .line 64
    .line 65
    .line 66
    :cond_1
    new-instance p3, LN1/f;

    .line 67
    .line 68
    iget-object v0, p0, Lz1/I4;->a:Landroid/os/UserHandle;

    .line 69
    .line 70
    invoke-direct {p3, v4, v0}, LN1/f;-><init>(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 71
    .line 72
    .line 73
    const/4 v0, 0x2

    .line 74
    invoke-virtual {p3, v0}, LN1/f;->d(I)LN1/f$a;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    invoke-virtual {p3}, LN1/f$a;->m()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_2

    .line 83
    .line 84
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_3

    .line 93
    .line 94
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Landroid/content/pm/ShortcutInfo;

    .line 99
    .line 100
    invoke-static {v0}, LN1/e;->b(Landroid/content/pm/ShortcutInfo;)LN1/e;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_2
    iput-boolean v1, p0, Lz1/I4;->b:Z

    .line 109
    .line 110
    const-string p3, "UserLockStateChangedTask"

    .line 111
    .line 112
    const-string v0, "UserLockStateChangedTask, shortcuts.wasSuccess() is fail"

    .line 113
    .line 114
    invoke-static {p3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    :cond_3
    new-instance v6, Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .line 121
    .line 122
    new-instance v3, Ljava/util/HashSet;

    .line 123
    .line 124
    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 125
    .line 126
    .line 127
    monitor-enter p2

    .line 128
    :try_start_0
    iget-object p3, p0, Lz1/I4;->a:Landroid/os/UserHandle;

    .line 129
    .line 130
    new-instance v0, Lz1/H4;

    .line 131
    .line 132
    move-object v1, p0

    .line 133
    move-object v5, p1

    .line 134
    invoke-direct/range {v0 .. v6}, Lz1/H4;-><init>(Lz1/I4;Ljava/util/HashMap;Ljava/util/HashSet;Landroid/content/Context;Lz1/o3;Ljava/util/ArrayList;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p2, p3, v0}, Lz1/y0;->p(Landroid/os/UserHandle;Ljava/util/function/Consumer;)V

    .line 138
    .line 139
    .line 140
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    invoke-virtual {v5, v6}, Lz1/o3;->G(Ljava/util/Collection;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v3}, Ljava/util/HashSet;->isEmpty()Z

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    if-nez p0, :cond_4

    .line 149
    .line 150
    invoke-static {v3}, Lcom/android/launcher3/util/P0;->v(Ljava/util/Set;)Ljava/util/function/Predicate;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    const-string p1, "removed during unlock because it\'s no longer available (possibly due to clear data)"

    .line 155
    .line 156
    invoke-virtual {v5, p0, p1}, Lz1/o3;->P(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    :cond_4
    iget-object p0, p2, Lz1/y0;->c:Ljava/util/HashMap;

    .line 160
    .line 161
    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    :cond_5
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-eqz p1, :cond_6

    .line 174
    .line 175
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    check-cast p1, Lcom/android/launcher3/util/E;

    .line 180
    .line 181
    iget-object p1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 182
    .line 183
    iget-object p3, v1, Lz1/I4;->a:Landroid/os/UserHandle;

    .line 184
    .line 185
    invoke-virtual {p1, p3}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-eqz p1, :cond_5

    .line 190
    .line 191
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 192
    .line 193
    .line 194
    goto :goto_1

    .line 195
    :cond_6
    iget-boolean p0, v1, Lz1/I4;->b:Z

    .line 196
    .line 197
    if-eqz p0, :cond_7

    .line 198
    .line 199
    iget-object p0, v1, Lz1/I4;->a:Landroid/os/UserHandle;

    .line 200
    .line 201
    new-instance p1, LN1/f;

    .line 202
    .line 203
    invoke-direct {p1, v4, p0}, LN1/f;-><init>(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 204
    .line 205
    .line 206
    const/16 p3, 0xb

    .line 207
    .line 208
    invoke-virtual {p1, p3}, LN1/f;->d(I)LN1/f$a;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    const/4 p3, 0x0

    .line 213
    invoke-virtual {p2, p3, p0, p1}, Lz1/y0;->v(Ljava/lang/String;Landroid/os/UserHandle;Ljava/util/List;)V

    .line 214
    .line 215
    .line 216
    :cond_7
    invoke-virtual {v5, p2}, Lz1/o3;->A(Lz1/y0;)V

    .line 217
    .line 218
    .line 219
    return-void

    .line 220
    :catchall_0
    move-exception v0

    .line 221
    move-object p0, v0

    .line 222
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 223
    throw p0
.end method
