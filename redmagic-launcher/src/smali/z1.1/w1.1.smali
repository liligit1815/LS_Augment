.class public Lz1/w1;
.super Ljava/lang/Object;
.source "LayoutParserFactory.kt"


# instance fields
.field private final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lz1/w1;->a:Landroid/content/Context;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lorg/xmlpull/v1/XmlPullParser;)Lorg/xmlpull/v1/XmlPullParser;
    .locals 0

    .line 1
    invoke-static {p0}, Lz1/w1;->f(Lorg/xmlpull/v1/XmlPullParser;)Lorg/xmlpull/v1/XmlPullParser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final c(Lcom/android/launcher3/widget/l0;Lz1/I0;)Lcom/android/launcher3/s;
    .locals 12

    .line 1
    iget-object v1, p0, Lz1/w1;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "launcher3.layout.provider"

    .line 8
    .line 9
    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v7, 0x0

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    return-object v7

    .line 21
    :cond_0
    iget-object v2, p0, Lz1/w1;->a:Landroid/content/Context;

    .line 22
    .line 23
    const-class v3, Landroid/app/blob/BlobStoreManager;

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroid/app/blob/BlobStoreManager;

    .line 30
    .line 31
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    const-string v3, "blob://"

    .line 35
    .line 36
    const/4 v4, 0x2

    .line 37
    const/4 v5, 0x0

    .line 38
    invoke-static {v1, v3, v5, v4, v7}, LD4/g;->v(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    const-string v4, "toByteArray(...)"

    .line 43
    .line 44
    const-string v8, "LayoutParserFactory"

    .line 45
    .line 46
    if-eqz v3, :cond_1

    .line 47
    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    const/4 v3, 0x7

    .line 51
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v3, "substring(...)"

    .line 56
    .line 57
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :try_start_0
    new-instance v9, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    .line 61
    .line 62
    const/4 v3, 0x3

    .line 63
    invoke-static {v1, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const-string v3, "launcher-layout"

    .line 68
    .line 69
    const-string v5, "ignore"

    .line 70
    .line 71
    const-wide/16 v10, 0x0

    .line 72
    .line 73
    invoke-static {v1, v3, v10, v11, v5}, Landroid/app/blob/BlobHandle;->createWithSha256([BLjava/lang/CharSequence;JLjava/lang/String;)Landroid/app/blob/BlobHandle;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v2, v1}, Landroid/app/blob/BlobStoreManager;->openBlob(Landroid/app/blob/BlobHandle;)Landroid/os/ParcelFileDescriptor;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-direct {v9, v1}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    .line 84
    :try_start_1
    invoke-static {v9}, Lcom/android/launcher3/util/v0;->d(Ljava/io/InputStream;)[B

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {v1, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    new-instance v3, Ljava/lang/String;

    .line 92
    .line 93
    sget-object v2, LD4/d;->b:Ljava/nio/charset/Charset;

    .line 94
    .line 95
    invoke-direct {v3, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 96
    .line 97
    .line 98
    const/16 v5, 0x8

    .line 99
    .line 100
    const/4 v6, 0x0

    .line 101
    const/4 v4, 0x0

    .line 102
    move-object v0, p0

    .line 103
    move-object v1, p1

    .line 104
    move-object v2, p2

    .line 105
    invoke-static/range {v0 .. v6}, Lz1/w1;->e(Lz1/w1;Lcom/android/launcher3/widget/l0;Lz1/I0;Ljava/lang/String;Lcom/android/launcher3/s$h;ILjava/lang/Object;)Lcom/android/launcher3/s;

    .line 106
    .line 107
    .line 108
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 109
    :try_start_2
    invoke-static {v9, v7}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 110
    .line 111
    .line 112
    return-object v0

    .line 113
    :catch_0
    move-exception v0

    .line 114
    goto :goto_0

    .line 115
    :catchall_0
    move-exception v0

    .line 116
    move-object v1, v0

    .line 117
    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 118
    :catchall_1
    move-exception v0

    .line 119
    :try_start_4
    invoke-static {v9, v1}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 120
    .line 121
    .line 122
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 123
    :goto_0
    const-string v1, "Error getting layout from blob handle"

    .line 124
    .line 125
    invoke-static {v8, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 126
    .line 127
    .line 128
    return-object v7

    .line 129
    :cond_1
    iget-object v2, p0, Lz1/w1;->a:Landroid/content/Context;

    .line 130
    .line 131
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v2, v1, v5}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    if-nez v3, :cond_2

    .line 140
    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .line 145
    .line 146
    const-string v2, "No provider found for authority "

    .line 147
    .line 148
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-static {v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    return-object v7

    .line 162
    :cond_2
    iget-object v5, p0, Lz1/w1;->a:Landroid/content/Context;

    .line 163
    .line 164
    invoke-static {v1, v5}, Lz1/k2;->D(Ljava/lang/String;Landroid/content/Context;)Landroid/net/Uri;

    .line 165
    .line 166
    .line 167
    move-result-object v5

    .line 168
    :try_start_5
    iget-object v6, p0, Lz1/w1;->a:Landroid/content/Context;

    .line 169
    .line 170
    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    invoke-virtual {v6, v5}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    .line 175
    .line 176
    .line 177
    move-result-object v5
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 178
    if-eqz v5, :cond_3

    .line 179
    .line 180
    :try_start_6
    new-instance v6, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 183
    .line 184
    .line 185
    const-string v9, "Loading layout from "

    .line 186
    .line 187
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v6

    .line 197
    invoke-static {v8, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    iget-object v3, v3, Landroid/content/pm/ProviderInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 201
    .line 202
    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Landroid/content/pm/ApplicationInfo;)Landroid/content/res/Resources;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    const-string v3, "getResourcesForApplication(...)"

    .line 207
    .line 208
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    invoke-static {v5}, Lcom/android/launcher3/util/v0;->d(Ljava/io/InputStream;)[B

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    new-instance v4, Ljava/lang/String;

    .line 219
    .line 220
    sget-object v6, LD4/d;->b:Ljava/nio/charset/Charset;

    .line 221
    .line 222
    invoke-direct {v4, v3, v6}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 223
    .line 224
    .line 225
    invoke-static {v2}, Lcom/android/launcher3/s$h;->b(Landroid/content/res/Resources;)Lcom/android/launcher3/s$h;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    const-string v3, "wrap(...)"

    .line 230
    .line 231
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p0, p1, p2, v4, v2}, Lz1/w1;->d(Lcom/android/launcher3/widget/l0;Lz1/I0;Ljava/lang/String;Lcom/android/launcher3/s$h;)Lcom/android/launcher3/s;

    .line 235
    .line 236
    .line 237
    move-result-object v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 238
    :try_start_7
    invoke-static {v5, v7}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    .line 239
    .line 240
    .line 241
    return-object v0

    .line 242
    :catch_1
    move-exception v0

    .line 243
    goto :goto_1

    .line 244
    :catchall_2
    move-exception v0

    .line 245
    move-object v2, v0

    .line 246
    :try_start_8
    throw v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 247
    :catchall_3
    move-exception v0

    .line 248
    :try_start_9
    invoke-static {v5, v2}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 249
    .line 250
    .line 251
    throw v0
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    .line 252
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 253
    .line 254
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 255
    .line 256
    .line 257
    const-string v3, "Error getting layout stream from: "

    .line 258
    .line 259
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-static {v8, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 270
    .line 271
    .line 272
    :cond_3
    return-object v7
.end method

.method public static synthetic e(Lz1/w1;Lcom/android/launcher3/widget/l0;Lz1/I0;Ljava/lang/String;Lcom/android/launcher3/s$h;ILjava/lang/Object;)Lcom/android/launcher3/s;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    if-nez p6, :cond_1

    .line 2
    .line 3
    and-int/lit8 p5, p5, 0x8

    .line 4
    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    new-instance p4, Lz1/w1$a;

    .line 8
    .line 9
    invoke-direct {p4}, Lz1/w1$a;-><init>()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lz1/w1;->d(Lcom/android/launcher3/widget/l0;Lz1/I0;Ljava/lang/String;Lcom/android/launcher3/s$h;)Lcom/android/launcher3/s;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 18
    .line 19
    const-string p1, "Super calls with default arguments not supported in this target, function: getAutoInstallsLayoutFromIS"

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p0
.end method

.method private static final f(Lorg/xmlpull/v1/XmlPullParser;)Lorg/xmlpull/v1/XmlPullParser;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public b(Lcom/android/launcher3/widget/l0;Lz1/I0;)Lcom/android/launcher3/s;
    .locals 8

    .line 1
    const-string v0, "widgetHolder"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "openHelper"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1, p2}, Lz1/w1;->c(Lcom/android/launcher3/widget/l0;Lz1/I0;)Lcom/android/launcher3/s;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    iget-object v0, p0, Lz1/w1;->a:Landroid/content/Context;

    .line 19
    .line 20
    invoke-static {v0, p1, p2}, Lcom/android/launcher3/s;->k(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/s$d;)Lcom/android/launcher3/s;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_1
    iget-object v0, p0, Lz1/w1;->a:Landroid/content/Context;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/android/launcher3/util/N1;->b(Landroid/content/pm/PackageManager;)Lcom/android/launcher3/util/N1;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    const-string v1, "partner_default_layout"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/N1;->f(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    if-eqz v7, :cond_2

    .line 46
    .line 47
    new-instance v2, Lcom/android/launcher3/Z;

    .line 48
    .line 49
    iget-object v3, p0, Lz1/w1;->a:Landroid/content/Context;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/util/N1;->e()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    move-object v4, p1

    .line 56
    move-object v5, p2

    .line 57
    invoke-direct/range {v2 .. v7}, Lcom/android/launcher3/Z;-><init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/s$d;Landroid/content/res/Resources;I)V

    .line 58
    .line 59
    .line 60
    return-object v2

    .line 61
    :cond_2
    const/4 p0, 0x0

    .line 62
    return-object p0
.end method

.method protected final d(Lcom/android/launcher3/widget/l0;Lz1/I0;Ljava/lang/String;Lcom/android/launcher3/s$h;)Lcom/android/launcher3/s;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const-string v0, "widgetHolder"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "openHelper"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "xml"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "res"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ljava/io/StringReader;

    .line 26
    .line 27
    invoke-direct {v1, p3}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 31
    .line 32
    .line 33
    new-instance v2, Lcom/android/launcher3/s;

    .line 34
    .line 35
    iget-object v3, p0, Lz1/w1;->a:Landroid/content/Context;

    .line 36
    .line 37
    new-instance v7, Lz1/v1;

    .line 38
    .line 39
    invoke-direct {v7, v0}, Lz1/v1;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 40
    .line 41
    .line 42
    const-string v8, "workspace"

    .line 43
    .line 44
    move-object v4, p1

    .line 45
    move-object v5, p2

    .line 46
    move-object v6, p4

    .line 47
    invoke-direct/range {v2 .. v8}, Lcom/android/launcher3/s;-><init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/s$d;Lcom/android/launcher3/s$h;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-object v2
.end method
