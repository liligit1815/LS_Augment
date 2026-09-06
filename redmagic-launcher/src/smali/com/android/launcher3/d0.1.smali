.class public Lcom/android/launcher3/d0;
.super Ljava/lang/Object;
.source "DevicePaddings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/d0$b;,
        Lcom/android/launcher3/d0$a;
    }
.end annotation


# instance fields
.field a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/d0$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "DevicePaddings"

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v3, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v3, v0, Lcom/android/launcher3/d0;->a:Ljava/util/ArrayList;

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    move/from16 v4, p2

    .line 22
    .line 23
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 24
    .line 25
    .line 26
    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    :try_start_1
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    :cond_0
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->next()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    const/4 v6, 0x3

    .line 36
    if-ne v5, v6, :cond_1

    .line 37
    .line 38
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    if-le v7, v4, :cond_a

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception v0

    .line 46
    move-object v1, v0

    .line 47
    goto/16 :goto_5

    .line 48
    .line 49
    :cond_1
    :goto_0
    const/4 v7, 0x1

    .line 50
    if-eq v5, v7, :cond_a

    .line 51
    .line 52
    const/4 v8, 0x2

    .line 53
    if-ne v5, v8, :cond_0

    .line 54
    .line 55
    const-string v5, "device-paddings"

    .line 56
    .line 57
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v9

    .line 61
    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    if-eqz v5, :cond_0

    .line 66
    .line 67
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    :cond_2
    :goto_1
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->next()I

    .line 72
    .line 73
    .line 74
    move-result v9

    .line 75
    if-ne v9, v6, :cond_3

    .line 76
    .line 77
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 78
    .line 79
    .line 80
    move-result v10

    .line 81
    if-le v10, v5, :cond_0

    .line 82
    .line 83
    :cond_3
    if-eq v9, v7, :cond_0

    .line 84
    .line 85
    if-ne v9, v8, :cond_2

    .line 86
    .line 87
    const-string v9, "device-padding"

    .line 88
    .line 89
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v10

    .line 93
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v9

    .line 97
    if-eqz v9, :cond_2

    .line 98
    .line 99
    invoke-static {v3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 100
    .line 101
    .line 102
    move-result-object v9

    .line 103
    sget-object v10, Lcom/android/launcher3/x5;->s0:[I

    .line 104
    .line 105
    invoke-virtual {v1, v9, v10}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 106
    .line 107
    .line 108
    move-result-object v9

    .line 109
    const/4 v10, 0x0

    .line 110
    invoke-virtual {v9, v10, v10}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 111
    .line 112
    .line 113
    move-result v10

    .line 114
    invoke-virtual {v9}, Landroid/content/res/TypedArray;->recycle()V

    .line 115
    .line 116
    .line 117
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 118
    .line 119
    .line 120
    move-result v9

    .line 121
    const/4 v11, 0x0

    .line 122
    move-object v12, v11

    .line 123
    move-object v13, v12

    .line 124
    :goto_2
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->next()I

    .line 125
    .line 126
    .line 127
    move-result v14

    .line 128
    if-ne v14, v6, :cond_4

    .line 129
    .line 130
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 131
    .line 132
    .line 133
    move-result v15

    .line 134
    if-le v15, v9, :cond_8

    .line 135
    .line 136
    :cond_4
    if-eq v14, v7, :cond_8

    .line 137
    .line 138
    invoke-static {v3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 139
    .line 140
    .line 141
    move-result-object v15

    .line 142
    if-ne v14, v8, :cond_7

    .line 143
    .line 144
    const-string v14, "workspaceTopPadding"

    .line 145
    .line 146
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v6

    .line 150
    invoke-virtual {v14, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v6

    .line 154
    if-eqz v6, :cond_5

    .line 155
    .line 156
    new-instance v6, Lcom/android/launcher3/d0$b;

    .line 157
    .line 158
    invoke-direct {v6, v1, v15}, Lcom/android/launcher3/d0$b;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 159
    .line 160
    .line 161
    move-object v11, v6

    .line 162
    goto :goto_3

    .line 163
    :cond_5
    const-string v6, "workspaceBottomPadding"

    .line 164
    .line 165
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v14

    .line 169
    invoke-virtual {v6, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v6

    .line 173
    if-eqz v6, :cond_6

    .line 174
    .line 175
    new-instance v6, Lcom/android/launcher3/d0$b;

    .line 176
    .line 177
    invoke-direct {v6, v1, v15}, Lcom/android/launcher3/d0$b;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 178
    .line 179
    .line 180
    move-object v12, v6

    .line 181
    goto :goto_3

    .line 182
    :cond_6
    const-string v6, "hotseatBottomPadding"

    .line 183
    .line 184
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v14

    .line 188
    invoke-virtual {v6, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v6

    .line 192
    if-eqz v6, :cond_7

    .line 193
    .line 194
    new-instance v6, Lcom/android/launcher3/d0$b;

    .line 195
    .line 196
    invoke-direct {v6, v1, v15}, Lcom/android/launcher3/d0$b;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 197
    .line 198
    .line 199
    move-object v13, v6

    .line 200
    :cond_7
    :goto_3
    const/4 v6, 0x3

    .line 201
    goto :goto_2

    .line 202
    :cond_8
    new-instance v6, Lcom/android/launcher3/d0$a;

    .line 203
    .line 204
    invoke-direct {v6, v10, v11, v12, v13}, Lcom/android/launcher3/d0$a;-><init>(ILcom/android/launcher3/d0$b;Lcom/android/launcher3/d0$b;Lcom/android/launcher3/d0$b;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v6}, Lcom/android/launcher3/d0$a;->f()Z

    .line 208
    .line 209
    .line 210
    move-result v9

    .line 211
    if-eqz v9, :cond_9

    .line 212
    .line 213
    iget-object v9, v0, Lcom/android/launcher3/d0;->a:Ljava/util/ArrayList;

    .line 214
    .line 215
    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    goto :goto_4

    .line 219
    :cond_9
    const-string v6, "Invalid device padding found."

    .line 220
    .line 221
    invoke-static {v2, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 222
    .line 223
    .line 224
    :goto_4
    const/4 v6, 0x3

    .line 225
    goto/16 :goto_1

    .line 226
    .line 227
    :cond_a
    :try_start_2
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0

    .line 228
    .line 229
    .line 230
    iget-object v0, v0, Lcom/android/launcher3/d0;->a:Ljava/util/ArrayList;

    .line 231
    .line 232
    new-instance v1, Lcom/android/launcher3/c0;

    .line 233
    .line 234
    invoke-direct {v1}, Lcom/android/launcher3/c0;-><init>()V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    .line 238
    .line 239
    .line 240
    return-void

    .line 241
    :catch_0
    move-exception v0

    .line 242
    goto :goto_7

    .line 243
    :goto_5
    if-eqz v3, :cond_b

    .line 244
    .line 245
    :try_start_3
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 246
    .line 247
    .line 248
    goto :goto_6

    .line 249
    :catchall_1
    move-exception v0

    .line 250
    :try_start_4
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 251
    .line 252
    .line 253
    :cond_b
    :goto_6
    throw v1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_0

    .line 254
    :goto_7
    const-string v1, "Failure parsing device padding layout."

    .line 255
    .line 256
    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 257
    .line 258
    .line 259
    new-instance v1, Ljava/lang/RuntimeException;

    .line 260
    .line 261
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 262
    .line 263
    .line 264
    throw v1
.end method

.method public static synthetic a(Lcom/android/launcher3/d0$a;Lcom/android/launcher3/d0$a;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/d0$a;->a(Lcom/android/launcher3/d0$a;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/d0$a;->a(Lcom/android/launcher3/d0$a;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method


# virtual methods
.method public b(I)Lcom/android/launcher3/d0$a;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/d0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/android/launcher3/d0$a;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/android/launcher3/d0$a;->a(Lcom/android/launcher3/d0$a;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-gt p1, v2, :cond_0

    .line 24
    .line 25
    return-object v1

    .line 26
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/d0;->a:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    add-int/lit8 p1, p1, -0x1

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Lcom/android/launcher3/d0$a;

    .line 39
    .line 40
    return-object p0
.end method
