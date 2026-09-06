.class public Ln1/n;
.super Ljava/lang/Object;
.source "GridCustomizationsProxy.java"

# interfaces
.implements Lcom/android/launcher3/util/F$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ln1/n$b;
    }
.end annotation


# instance fields
.field private final a:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ln1/n$b;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Landroid/content/Context;

.field private final c:Ln1/C;

.field private final d:Lcom/android/launcher3/J3;

.field private final e:Lcom/android/launcher3/F1;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Ln1/C;Lcom/android/launcher3/J3;Lcom/android/launcher3/F1;Lcom/android/launcher3/util/K;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ln1/n;->a:Ljava/util/Set;

    .line 14
    .line 15
    iput-object p1, p0, Ln1/n;->b:Landroid/content/Context;

    .line 16
    .line 17
    iput-object p2, p0, Ln1/n;->c:Ln1/C;

    .line 18
    .line 19
    iput-object p3, p0, Ln1/n;->d:Lcom/android/launcher3/J3;

    .line 20
    .line 21
    iput-object p4, p0, Ln1/n;->e:Lcom/android/launcher3/F1;

    .line 22
    .line 23
    new-instance p1, Ln1/i;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Ln1/i;-><init>(Ln1/n;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p5, p1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic f(Ljava/lang/String;LM1/a;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, LM1/a;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static synthetic g(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Ln1/n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ln1/n;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/D3;Lz1/y0$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/D3;->P(Lz1/y0$b;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic j(Lcom/android/launcher3/D3;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/D3;->O0(Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k()V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic l()V
    .locals 1

    .line 1
    iget-object p0, p0, Ln1/n;->a:Ljava/util/Set;

    .line 2
    .line 3
    new-instance v0, Ln1/m;

    .line 4
    .line 5
    invoke-direct {v0}, Ln1/m;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/Set;->forEach(Ljava/util/function/Consumer;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private m(Landroid/content/Context;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->a()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ln1/n$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ln1/n$a;-><init>(Ln1/n;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 18
    .line 19
    new-instance v1, Ln1/j;

    .line 20
    .line 21
    invoke-direct {v1, p0, v0}, Ln1/j;-><init>(Lcom/android/launcher3/D3;Lz1/y0$b;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v1}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    sget-object v1, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 32
    .line 33
    new-instance v2, Ln1/k;

    .line 34
    .line 35
    invoke-direct {v2}, Ln1/k;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    new-instance v1, Ln1/l;

    .line 46
    .line 47
    invoke-direct {v1, p0, v0}, Ln1/l;-><init>(Lcom/android/launcher3/D3;Lz1/y0$b;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v1}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 2

    .line 1
    iget-object p0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object p2

    .line 7
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "call method: "

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "GridCustomizationsProvider"

    .line 25
    .line 26
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    const-string v0, "get_preview"

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    const-string p2, "switchLauncherMode"

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    return-object p3

    .line 49
    :cond_1
    invoke-static {p0, p3}, LK1/q;->e(Landroid/content/Context;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_2
    return-object p2
.end method

.method public d(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 9

    .line 1
    const/4 p3, 0x1

    .line 2
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p4

    .line 6
    const/4 v0, 0x0

    .line 7
    if-nez p4, :cond_0

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const-string v1, "shape_key"

    .line 11
    .line 12
    const-string v2, ""

    .line 13
    .line 14
    const-string v3, "update: "

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    const-string v5, "boolean_value"

    .line 18
    .line 19
    const-string v6, "GridCustomizationsProvider"

    .line 20
    .line 21
    const/4 v7, -0x1

    .line 22
    invoke-virtual {p4}, Ljava/lang/String;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result v8

    .line 26
    sparse-switch v8, :sswitch_data_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :sswitch_0
    const-string v8, "/set_icon_no_title"

    .line 31
    .line 32
    invoke-virtual {p4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p4

    .line 36
    if-nez p4, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v7, 0x6

    .line 40
    goto :goto_0

    .line 41
    :sswitch_1
    const-string v8, "/shape"

    .line 42
    .line 43
    invoke-virtual {p4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p4

    .line 47
    if-nez p4, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const/4 v7, 0x5

    .line 51
    goto :goto_0

    .line 52
    :sswitch_2
    const-string v8, "/icon_themed"

    .line 53
    .line 54
    invoke-virtual {p4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p4

    .line 58
    if-nez p4, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    const/4 v7, 0x4

    .line 62
    goto :goto_0

    .line 63
    :sswitch_3
    const-string v8, "/set_concise_desktop_clock"

    .line 64
    .line 65
    invoke-virtual {p4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p4

    .line 69
    if-nez p4, :cond_4

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    const/4 v7, 0x3

    .line 73
    goto :goto_0

    .line 74
    :sswitch_4
    const-string v8, "/set_icon_size_percentage"

    .line 75
    .line 76
    invoke-virtual {p4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p4

    .line 80
    if-nez p4, :cond_5

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    const/4 v7, 0x2

    .line 84
    goto :goto_0

    .line 85
    :sswitch_5
    const-string v8, "/set_icon_themed"

    .line 86
    .line 87
    invoke-virtual {p4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p4

    .line 91
    if-nez p4, :cond_6

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    move v7, p3

    .line 95
    goto :goto_0

    .line 96
    :sswitch_6
    const-string v8, "/default_grid"

    .line 97
    .line 98
    invoke-virtual {p4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p4

    .line 102
    if-nez p4, :cond_7

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    move v7, v0

    .line 106
    :goto_0
    packed-switch v7, :pswitch_data_0

    .line 107
    .line 108
    .line 109
    return v0

    .line 110
    :pswitch_0
    iget-object p4, p0, Ln1/n;->b:Landroid/content/Context;

    .line 111
    .line 112
    invoke-static {p4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 113
    .line 114
    .line 115
    move-result-object p4

    .line 116
    invoke-virtual {p4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 117
    .line 118
    .line 119
    move-result-object p4

    .line 120
    iget-object v0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 121
    .line 122
    invoke-virtual {p2, v5}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-virtual {p4, v0, v1}, Lcom/android/launcher3/r4;->I(Landroid/content/Context;Z)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 134
    .line 135
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0, p1, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 140
    .line 141
    .line 142
    new-instance p0, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string p1, ", icon no title: "

    .line 158
    .line 159
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p2, v5}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    return p3

    .line 177
    :pswitch_1
    invoke-static {}, Lcom/android/systemui/shared/Flags;->newCustomizationPickerUi()Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    if-eqz p1, :cond_8

    .line 182
    .line 183
    iget-object p0, p0, Ln1/n;->d:Lcom/android/launcher3/J3;

    .line 184
    .line 185
    sget-object p1, Ln1/C;->i:Lcom/android/launcher3/X;

    .line 186
    .line 187
    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p2

    .line 191
    invoke-static {p2, v2}, Ljava/util/Objects;->requireNonNullElse(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object p2

    .line 195
    check-cast p2, Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 198
    .line 199
    .line 200
    :cond_8
    return p3

    .line 201
    :pswitch_2
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 202
    .line 203
    .line 204
    move-result-object p4

    .line 205
    invoke-virtual {p4}, Lcom/android/launcher3/resource/B;->p()Z

    .line 206
    .line 207
    .line 208
    move-result p4

    .line 209
    if-nez p4, :cond_9

    .line 210
    .line 211
    const-string p0, "update clock: not concise mode, return!"

    .line 212
    .line 213
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    .line 215
    .line 216
    return v0

    .line 217
    :cond_9
    iget-object p4, p0, Ln1/n;->b:Landroid/content/Context;

    .line 218
    .line 219
    invoke-static {p4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 220
    .line 221
    .line 222
    move-result-object p4

    .line 223
    invoke-virtual {p4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 224
    .line 225
    .line 226
    move-result-object p4

    .line 227
    iget-object v0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 228
    .line 229
    invoke-virtual {p2, v5}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    invoke-virtual {p4, v0, v1, v2}, Lcom/android/launcher3/r4;->G(Landroid/content/Context;ZLjava/lang/String;)V

    .line 238
    .line 239
    .line 240
    iget-object p0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 241
    .line 242
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-virtual {p0, p1, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 247
    .line 248
    .line 249
    new-instance p0, Ljava/lang/StringBuilder;

    .line 250
    .line 251
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 252
    .line 253
    .line 254
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    const-string p1, ", concise clock state: "

    .line 265
    .line 266
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {p2, v5}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    .line 282
    .line 283
    return p3

    .line 284
    :pswitch_3
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 285
    .line 286
    .line 287
    move-result-object p4

    .line 288
    invoke-virtual {p4}, Lcom/android/launcher3/resource/B;->s()Z

    .line 289
    .line 290
    .line 291
    move-result p4

    .line 292
    if-eqz p4, :cond_a

    .line 293
    .line 294
    const-string p0, "update: can not change icon size, return!"

    .line 295
    .line 296
    invoke-static {v6, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    .line 298
    .line 299
    return v0

    .line 300
    :cond_a
    const-string p4, "float_value"

    .line 301
    .line 302
    invoke-virtual {p2, p4}, Landroid/content/ContentValues;->getAsFloat(Ljava/lang/String;)Ljava/lang/Float;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 307
    .line 308
    .line 309
    move-result v1

    .line 310
    invoke-virtual {p2, p4}, Landroid/content/ContentValues;->getAsFloat(Ljava/lang/String;)Ljava/lang/Float;

    .line 311
    .line 312
    .line 313
    move-result-object v2

    .line 314
    if-eqz v2, :cond_d

    .line 315
    .line 316
    const/4 v2, 0x0

    .line 317
    cmpg-float v2, v1, v2

    .line 318
    .line 319
    if-ltz v2, :cond_d

    .line 320
    .line 321
    const/high16 v2, 0x40000000    # 2.0f

    .line 322
    .line 323
    cmpl-float v2, v1, v2

    .line 324
    .line 325
    if-lez v2, :cond_b

    .line 326
    .line 327
    goto :goto_1

    .line 328
    :cond_b
    iget-object v0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 329
    .line 330
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    if-eqz v0, :cond_c

    .line 343
    .line 344
    iget-object v0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 345
    .line 346
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    iget-object p0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 359
    .line 360
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/b0;->d(Landroid/content/Context;F)V

    .line 361
    .line 362
    .line 363
    :cond_c
    new-instance p0, Ljava/lang/StringBuilder;

    .line 364
    .line 365
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 366
    .line 367
    .line 368
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object p1

    .line 375
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    const-string p1, ", iconSizePercentage: "

    .line 379
    .line 380
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    invoke-virtual {p2, p4}, Landroid/content/ContentValues;->getAsFloat(Ljava/lang/String;)Ljava/lang/Float;

    .line 384
    .line 385
    .line 386
    move-result-object p1

    .line 387
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 388
    .line 389
    .line 390
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object p0

    .line 394
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 395
    .line 396
    .line 397
    return p3

    .line 398
    :cond_d
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 399
    .line 400
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 401
    .line 402
    .line 403
    const-string p1, "update: icon size Percentage wrong, return! "

    .line 404
    .line 405
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 409
    .line 410
    .line 411
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object p0

    .line 415
    invoke-static {v6, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    .line 417
    .line 418
    return v0

    .line 419
    :pswitch_4
    invoke-virtual {p2, v5}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 420
    .line 421
    .line 422
    iget-object p4, p0, Ln1/n;->c:Ln1/C;

    .line 423
    .line 424
    invoke-virtual {p2, v5}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 429
    .line 430
    .line 431
    move-result v0

    .line 432
    invoke-virtual {p4, v0}, Ln1/C;->q(Z)V

    .line 433
    .line 434
    .line 435
    iget-object p0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 436
    .line 437
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 438
    .line 439
    .line 440
    move-result-object p0

    .line 441
    invoke-virtual {p0, p1, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 442
    .line 443
    .line 444
    new-instance p0, Ljava/lang/StringBuilder;

    .line 445
    .line 446
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 447
    .line 448
    .line 449
    const-string p4, "update :"

    .line 450
    .line 451
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 452
    .line 453
    .line 454
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object p1

    .line 458
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    const-string p1, "  isThemedIconEnabled: "

    .line 462
    .line 463
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    invoke-virtual {p2, v5}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 467
    .line 468
    .line 469
    move-result-object p1

    .line 470
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 471
    .line 472
    .line 473
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 474
    .line 475
    .line 476
    move-result-object p0

    .line 477
    invoke-static {v6, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    .line 479
    .line 480
    return p3

    .line 481
    :pswitch_5
    invoke-static {}, Lcom/android/systemui/shared/Flags;->newCustomizationPickerUi()Z

    .line 482
    .line 483
    .line 484
    move-result p4

    .line 485
    if-eqz p4, :cond_e

    .line 486
    .line 487
    iget-object p4, p0, Ln1/n;->d:Lcom/android/launcher3/J3;

    .line 488
    .line 489
    sget-object v3, Ln1/C;->i:Lcom/android/launcher3/X;

    .line 490
    .line 491
    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    .line 492
    .line 493
    .line 494
    move-result-object v1

    .line 495
    invoke-static {v1, v2}, Ljava/util/Objects;->requireNonNullElse(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    move-result-object v1

    .line 499
    check-cast v1, Ljava/lang/String;

    .line 500
    .line 501
    invoke-virtual {p4, v3, v1}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 502
    .line 503
    .line 504
    :cond_e
    const-string p4, "name"

    .line 505
    .line 506
    invoke-virtual {p2, p4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    .line 507
    .line 508
    .line 509
    move-result-object p2

    .line 510
    iget-object p4, p0, Ln1/n;->e:Lcom/android/launcher3/F1;

    .line 511
    .line 512
    iget-object v1, p0, Ln1/n;->b:Landroid/content/Context;

    .line 513
    .line 514
    invoke-virtual {p4, v1}, Lcom/android/launcher3/F1;->N0(Landroid/content/Context;)Ljava/util/List;

    .line 515
    .line 516
    .line 517
    move-result-object p4

    .line 518
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 519
    .line 520
    .line 521
    move-result-object p4

    .line 522
    :cond_f
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 523
    .line 524
    .line 525
    move-result v1

    .line 526
    if-eqz v1, :cond_10

    .line 527
    .line 528
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 529
    .line 530
    .line 531
    move-result-object v1

    .line 532
    check-cast v1, Lcom/android/launcher3/F1$b;

    .line 533
    .line 534
    iget-object v2, v1, Lcom/android/launcher3/F1$b;->a:Ljava/lang/String;

    .line 535
    .line 536
    if-eqz v2, :cond_f

    .line 537
    .line 538
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 539
    .line 540
    .line 541
    move-result v2

    .line 542
    if-eqz v2, :cond_f

    .line 543
    .line 544
    goto :goto_2

    .line 545
    :cond_10
    move-object v1, v4

    .line 546
    :goto_2
    if-nez v1, :cond_11

    .line 547
    .line 548
    return v0

    .line 549
    :cond_11
    iget-object p4, p0, Ln1/n;->e:Lcom/android/launcher3/F1;

    .line 550
    .line 551
    iget-object v0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 552
    .line 553
    invoke-virtual {p4, v0, p2}, Lcom/android/launcher3/F1;->Q0(Landroid/content/Context;Ljava/lang/String;)V

    .line 554
    .line 555
    .line 556
    invoke-static {}, Lcom/android/systemui/shared/Flags;->newCustomizationPickerUi()Z

    .line 557
    .line 558
    .line 559
    move-result p2

    .line 560
    if-eqz p2, :cond_12

    .line 561
    .line 562
    :try_start_0
    iget-object p2, p0, Ln1/n;->b:Landroid/content/Context;

    .line 563
    .line 564
    invoke-direct {p0, p2}, Ln1/n;->m(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 565
    .line 566
    .line 567
    goto :goto_3

    .line 568
    :catch_0
    move-exception p2

    .line 569
    const-string p4, "Fail to load model"

    .line 570
    .line 571
    invoke-static {v6, p4, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 572
    .line 573
    .line 574
    :cond_12
    :goto_3
    iget-object p0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 575
    .line 576
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 577
    .line 578
    .line 579
    move-result-object p0

    .line 580
    invoke-virtual {p0, p1, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 581
    .line 582
    .line 583
    return p3

    .line 584
    nop

    .line 585
    :sswitch_data_0
    .sparse-switch
        -0x5cb99fcd -> :sswitch_6
        -0x49eef22b -> :sswitch_5
        0x431f00be -> :sswitch_4
        0x482902fa -> :sswitch_3
        0x4d8a16b2 -> :sswitch_2
        0x56b914d2 -> :sswitch_1
        0x6f3129f4 -> :sswitch_0
    .end sparse-switch

    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public e(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 8

    .line 1
    const/4 p2, 0x0

    .line 2
    const/4 p3, 0x1

    .line 3
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    const/4 p5, 0x0

    .line 8
    if-nez p4, :cond_0

    .line 9
    .line 10
    return-object p5

    .line 11
    :cond_0
    const-string v0, "is_default"

    .line 12
    .line 13
    const-string v1, "query: "

    .line 14
    .line 15
    const-string v2, "GridCustomizationsProvider"

    .line 16
    .line 17
    const-string v3, "boolean_value"

    .line 18
    .line 19
    const/4 v4, -0x1

    .line 20
    invoke-virtual {p4}, Ljava/lang/String;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    sparse-switch v5, :sswitch_data_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :sswitch_0
    const-string v5, "/get_icon_themed"

    .line 29
    .line 30
    invoke-virtual {p4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p4

    .line 34
    if-nez p4, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v4, 0x6

    .line 38
    goto :goto_0

    .line 39
    :sswitch_1
    const-string v5, "/get_icon_size_percentage"

    .line 40
    .line 41
    invoke-virtual {p4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p4

    .line 45
    if-nez p4, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v4, 0x5

    .line 49
    goto :goto_0

    .line 50
    :sswitch_2
    const-string v5, "/icon_themed"

    .line 51
    .line 52
    invoke-virtual {p4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p4

    .line 56
    if-nez p4, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 v4, 0x4

    .line 60
    goto :goto_0

    .line 61
    :sswitch_3
    const-string v5, "/list_options"

    .line 62
    .line 63
    invoke-virtual {p4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p4

    .line 67
    if-nez p4, :cond_4

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    const/4 v4, 0x3

    .line 71
    goto :goto_0

    .line 72
    :sswitch_4
    const-string v5, "/get_concise_desktop_clock"

    .line 73
    .line 74
    invoke-virtual {p4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p4

    .line 78
    if-nez p4, :cond_5

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    const/4 v4, 0x2

    .line 82
    goto :goto_0

    .line 83
    :sswitch_5
    const-string v5, "/shape_options"

    .line 84
    .line 85
    invoke-virtual {p4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p4

    .line 89
    if-nez p4, :cond_6

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_6
    move v4, p3

    .line 93
    goto :goto_0

    .line 94
    :sswitch_6
    const-string v5, "/get_icon_no_title"

    .line 95
    .line 96
    invoke-virtual {p4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p4

    .line 100
    if-nez p4, :cond_7

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_7
    move v4, p2

    .line 104
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 105
    .line 106
    .line 107
    return-object p5

    .line 108
    :pswitch_0
    new-instance p2, Landroid/database/MatrixCursor;

    .line 109
    .line 110
    const-string p3, "float_value"

    .line 111
    .line 112
    filled-new-array {p3}, [Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p4

    .line 116
    invoke-direct {p2, p4}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 120
    .line 121
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p0}, Lcom/android/launcher3/r4;->p()F

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    invoke-virtual {p2}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    .line 134
    .line 135
    .line 136
    move-result-object p4

    .line 137
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 138
    .line 139
    .line 140
    move-result-object p5

    .line 141
    invoke-virtual {p4, p3, p5}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 142
    .line 143
    .line 144
    new-instance p3, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string p1, ", iconSizePercentage: "

    .line 160
    .line 161
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    .line 173
    .line 174
    return-object p2

    .line 175
    :pswitch_1
    new-instance p2, Landroid/database/MatrixCursor;

    .line 176
    .line 177
    filled-new-array {v3}, [Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p3

    .line 181
    invoke-direct {p2, p3}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p2}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    .line 185
    .line 186
    .line 187
    move-result-object p3

    .line 188
    iget-object p4, p0, Ln1/n;->c:Ln1/C;

    .line 189
    .line 190
    invoke-virtual {p4}, Ln1/C;->n()Z

    .line 191
    .line 192
    .line 193
    move-result p4

    .line 194
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 195
    .line 196
    .line 197
    move-result-object p4

    .line 198
    invoke-virtual {p3, v3, p4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 199
    .line 200
    .line 201
    new-instance p3, Ljava/lang/StringBuilder;

    .line 202
    .line 203
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 204
    .line 205
    .line 206
    const-string p4, "query :"

    .line 207
    .line 208
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    const-string p1, "   isThemedIconEnabled:"

    .line 219
    .line 220
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    sget-object p1, Ln1/C;->g:Lcom/android/launcher3/util/I;

    .line 224
    .line 225
    iget-object p0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 226
    .line 227
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    check-cast p0, Ln1/C;

    .line 232
    .line 233
    invoke-virtual {p0}, Ln1/C;->n()Z

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    return-object p2

    .line 248
    :pswitch_2
    new-instance p1, Landroid/database/MatrixCursor;

    .line 249
    .line 250
    const-string v6, "is_default"

    .line 251
    .line 252
    const-string v7, "grid_icon_id"

    .line 253
    .line 254
    const-string v1, "name"

    .line 255
    .line 256
    const-string v2, "grid_title"

    .line 257
    .line 258
    const-string v3, "rows"

    .line 259
    .line 260
    const-string v4, "cols"

    .line 261
    .line 262
    const-string v5, "preview_count"

    .line 263
    .line 264
    filled-new-array/range {v1 .. v7}, [Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p4

    .line 268
    invoke-direct {p1, p4}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    iget-object p4, p0, Ln1/n;->e:Lcom/android/launcher3/F1;

    .line 272
    .line 273
    iget-object p5, p0, Ln1/n;->b:Landroid/content/Context;

    .line 274
    .line 275
    invoke-virtual {p4, p5}, Lcom/android/launcher3/F1;->N0(Landroid/content/Context;)Ljava/util/List;

    .line 276
    .line 277
    .line 278
    move-result-object p4

    .line 279
    invoke-static {}, Lcom/android/launcher3/y0;->r0()Z

    .line 280
    .line 281
    .line 282
    move-result p5

    .line 283
    if-eqz p5, :cond_8

    .line 284
    .line 285
    new-instance p5, Ln1/h;

    .line 286
    .line 287
    invoke-direct {p5}, Ln1/h;-><init>()V

    .line 288
    .line 289
    .line 290
    invoke-static {p5}, Ljava/util/Comparator;->comparingInt(Ljava/util/function/ToIntFunction;)Ljava/util/Comparator;

    .line 291
    .line 292
    .line 293
    move-result-object p5

    .line 294
    invoke-interface {p5}, Ljava/util/Comparator;->reversed()Ljava/util/Comparator;

    .line 295
    .line 296
    .line 297
    move-result-object p5

    .line 298
    invoke-interface {p4, p5}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 299
    .line 300
    .line 301
    :cond_8
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 302
    .line 303
    .line 304
    move-result-object p4

    .line 305
    :goto_1
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 306
    .line 307
    .line 308
    move-result p5

    .line 309
    if-eqz p5, :cond_a

    .line 310
    .line 311
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object p5

    .line 315
    check-cast p5, Lcom/android/launcher3/F1$b;

    .line 316
    .line 317
    invoke-virtual {p1}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    iget-object v2, p5, Lcom/android/launcher3/F1$b;->a:Ljava/lang/String;

    .line 322
    .line 323
    const-string v3, "name"

    .line 324
    .line 325
    invoke-virtual {v1, v3, v2}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    const-string v2, "grid_title"

    .line 330
    .line 331
    iget-object v3, p5, Lcom/android/launcher3/F1$b;->b:Ljava/lang/String;

    .line 332
    .line 333
    invoke-virtual {v1, v2, v3}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    iget v2, p5, Lcom/android/launcher3/F1$b;->d:I

    .line 338
    .line 339
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 340
    .line 341
    .line 342
    move-result-object v2

    .line 343
    const-string v3, "rows"

    .line 344
    .line 345
    invoke-virtual {v1, v3, v2}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 346
    .line 347
    .line 348
    move-result-object v1

    .line 349
    iget v2, p5, Lcom/android/launcher3/F1$b;->e:I

    .line 350
    .line 351
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 352
    .line 353
    .line 354
    move-result-object v2

    .line 355
    const-string v3, "cols"

    .line 356
    .line 357
    invoke-virtual {v1, v3, v2}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 358
    .line 359
    .line 360
    move-result-object v1

    .line 361
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 362
    .line 363
    .line 364
    move-result-object v2

    .line 365
    const-string v3, "preview_count"

    .line 366
    .line 367
    invoke-virtual {v1, v3, v2}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    iget-object v2, p0, Ln1/n;->e:Lcom/android/launcher3/F1;

    .line 372
    .line 373
    iget v3, v2, Lcom/android/launcher3/F1;->H0:I

    .line 374
    .line 375
    iget v4, p5, Lcom/android/launcher3/F1$b;->e:I

    .line 376
    .line 377
    if-ne v3, v4, :cond_9

    .line 378
    .line 379
    iget v2, v2, Lcom/android/launcher3/F1;->G0:I

    .line 380
    .line 381
    iget v3, p5, Lcom/android/launcher3/F1$b;->d:I

    .line 382
    .line 383
    if-ne v2, v3, :cond_9

    .line 384
    .line 385
    move v2, p3

    .line 386
    goto :goto_2

    .line 387
    :cond_9
    move v2, p2

    .line 388
    :goto_2
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 389
    .line 390
    .line 391
    move-result-object v2

    .line 392
    invoke-virtual {v1, v0, v2}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    iget p5, p5, Lcom/android/launcher3/F1$b;->c:I

    .line 397
    .line 398
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 399
    .line 400
    .line 401
    move-result-object p5

    .line 402
    const-string v2, "grid_icon_id"

    .line 403
    .line 404
    invoke-virtual {v1, v2, p5}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 405
    .line 406
    .line 407
    goto :goto_1

    .line 408
    :cond_a
    return-object p1

    .line 409
    :pswitch_3
    new-instance p2, Landroid/database/MatrixCursor;

    .line 410
    .line 411
    filled-new-array {v3}, [Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object p3

    .line 415
    invoke-direct {p2, p3}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    iget-object p0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 419
    .line 420
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 421
    .line 422
    .line 423
    move-result-object p0

    .line 424
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 425
    .line 426
    .line 427
    move-result-object p0

    .line 428
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->l:Z

    .line 429
    .line 430
    invoke-virtual {p2}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    .line 431
    .line 432
    .line 433
    move-result-object p3

    .line 434
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 435
    .line 436
    .line 437
    move-result-object p4

    .line 438
    invoke-virtual {p3, v3, p4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 439
    .line 440
    .line 441
    new-instance p3, Ljava/lang/StringBuilder;

    .line 442
    .line 443
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 444
    .line 445
    .line 446
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 447
    .line 448
    .line 449
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object p1

    .line 453
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 454
    .line 455
    .line 456
    const-string p1, ", conciseDesktopClock: "

    .line 457
    .line 458
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 462
    .line 463
    .line 464
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object p0

    .line 468
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 469
    .line 470
    .line 471
    return-object p2

    .line 472
    :pswitch_4
    invoke-static {}, Lcom/android/systemui/shared/Flags;->newCustomizationPickerUi()Z

    .line 473
    .line 474
    .line 475
    move-result p1

    .line 476
    if-eqz p1, :cond_d

    .line 477
    .line 478
    new-instance p1, Landroid/database/MatrixCursor;

    .line 479
    .line 480
    const-string p4, "shape_key"

    .line 481
    .line 482
    const-string p5, "shape_title"

    .line 483
    .line 484
    const-string v1, "path"

    .line 485
    .line 486
    filled-new-array {p4, p5, v1, v0}, [Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v2

    .line 490
    invoke-direct {p1, v2}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 491
    .line 492
    .line 493
    iget-object p0, p0, Ln1/n;->c:Ln1/C;

    .line 494
    .line 495
    invoke-virtual {p0}, Ln1/C;->k()Ln1/C$c;

    .line 496
    .line 497
    .line 498
    move-result-object p0

    .line 499
    invoke-virtual {p0}, Ln1/C$c;->c()Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object p0

    .line 503
    sget-object v2, LM1/b;->a:LM1/b;

    .line 504
    .line 505
    invoke-virtual {v2}, LM1/b;->a()[LM1/a;

    .line 506
    .line 507
    .line 508
    move-result-object v3

    .line 509
    invoke-static {v3}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 510
    .line 511
    .line 512
    move-result-object v3

    .line 513
    new-instance v4, Ln1/g;

    .line 514
    .line 515
    invoke-direct {v4, p0}, Ln1/g;-><init>(Ljava/lang/String;)V

    .line 516
    .line 517
    .line 518
    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 519
    .line 520
    .line 521
    move-result-object p0

    .line 522
    invoke-interface {p0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 523
    .line 524
    .line 525
    move-result-object p0

    .line 526
    invoke-static {p0}, Ln1/f;->a(Ljava/util/Optional;)Z

    .line 527
    .line 528
    .line 529
    move-result v3

    .line 530
    if-eqz v3, :cond_b

    .line 531
    .line 532
    invoke-virtual {v2}, LM1/b;->a()[LM1/a;

    .line 533
    .line 534
    .line 535
    move-result-object p0

    .line 536
    invoke-static {p0}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 537
    .line 538
    .line 539
    move-result-object p0

    .line 540
    invoke-interface {p0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 541
    .line 542
    .line 543
    move-result-object p0

    .line 544
    invoke-virtual {p0}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 545
    .line 546
    .line 547
    move-result-object p0

    .line 548
    check-cast p0, LM1/a;

    .line 549
    .line 550
    invoke-static {p0}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    .line 551
    .line 552
    .line 553
    move-result-object p0

    .line 554
    :cond_b
    invoke-virtual {v2}, LM1/b;->a()[LM1/a;

    .line 555
    .line 556
    .line 557
    move-result-object v2

    .line 558
    array-length v3, v2

    .line 559
    :goto_3
    if-ge p2, v3, :cond_c

    .line 560
    .line 561
    aget-object v4, v2, p2

    .line 562
    .line 563
    invoke-virtual {p1}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    .line 564
    .line 565
    .line 566
    move-result-object v5

    .line 567
    invoke-virtual {v4}, LM1/a;->c()Ljava/lang/String;

    .line 568
    .line 569
    .line 570
    move-result-object v6

    .line 571
    invoke-virtual {v5, p4, v6}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 572
    .line 573
    .line 574
    move-result-object v5

    .line 575
    invoke-virtual {v4}, LM1/a;->e()Ljava/lang/String;

    .line 576
    .line 577
    .line 578
    move-result-object v6

    .line 579
    invoke-virtual {v5, p5, v6}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 580
    .line 581
    .line 582
    move-result-object v5

    .line 583
    invoke-virtual {v4}, LM1/a;->d()Ljava/lang/String;

    .line 584
    .line 585
    .line 586
    move-result-object v6

    .line 587
    invoke-virtual {v5, v1, v6}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 588
    .line 589
    .line 590
    move-result-object v5

    .line 591
    invoke-virtual {p0}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 592
    .line 593
    .line 594
    move-result-object v6

    .line 595
    invoke-virtual {v4, v6}, LM1/a;->equals(Ljava/lang/Object;)Z

    .line 596
    .line 597
    .line 598
    move-result v4

    .line 599
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 600
    .line 601
    .line 602
    move-result-object v4

    .line 603
    invoke-virtual {v5, v0, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 604
    .line 605
    .line 606
    add-int/2addr p2, p3

    .line 607
    goto :goto_3

    .line 608
    :cond_c
    return-object p1

    .line 609
    :cond_d
    return-object p5

    .line 610
    :pswitch_5
    new-instance p2, Landroid/database/MatrixCursor;

    .line 611
    .line 612
    filled-new-array {v3}, [Ljava/lang/String;

    .line 613
    .line 614
    .line 615
    move-result-object p3

    .line 616
    invoke-direct {p2, p3}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 617
    .line 618
    .line 619
    iget-object p0, p0, Ln1/n;->b:Landroid/content/Context;

    .line 620
    .line 621
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 622
    .line 623
    .line 624
    move-result-object p0

    .line 625
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 626
    .line 627
    .line 628
    move-result-object p0

    .line 629
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->k:Z

    .line 630
    .line 631
    invoke-virtual {p2}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    .line 632
    .line 633
    .line 634
    move-result-object p3

    .line 635
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 636
    .line 637
    .line 638
    move-result-object p4

    .line 639
    invoke-virtual {p3, v3, p4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 640
    .line 641
    .line 642
    new-instance p3, Ljava/lang/StringBuilder;

    .line 643
    .line 644
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 645
    .line 646
    .line 647
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 648
    .line 649
    .line 650
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 651
    .line 652
    .line 653
    move-result-object p1

    .line 654
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 655
    .line 656
    .line 657
    const-string p1, ", iconNoTitleMode: "

    .line 658
    .line 659
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 660
    .line 661
    .line 662
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 663
    .line 664
    .line 665
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 666
    .line 667
    .line 668
    move-result-object p0

    .line 669
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 670
    .line 671
    .line 672
    return-object p2

    .line 673
    :sswitch_data_0
    .sparse-switch
        -0x58c53e18 -> :sswitch_6
        -0x3761afcf -> :sswitch_5
        0x15e566ee -> :sswitch_4
        0x48e391ac -> :sswitch_3
        0x4d8a16b2 -> :sswitch_2
        0x730c4e4a -> :sswitch_1
        0x7fc812c9 -> :sswitch_0
    .end sparse-switch

    .line 674
    .line 675
    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    .line 687
    .line 688
    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
