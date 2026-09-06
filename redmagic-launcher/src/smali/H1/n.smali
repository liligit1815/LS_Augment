.class public final LH1/n;
.super Ljava/lang/Object;
.source "ResponsiveSpecsParser.kt"


# instance fields
.field private final a:Lcom/android/launcher3/util/W1;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/util/W1;)V
    .locals 1

    .line 1
    const-string v0, "resourceHelper"

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
    iput-object p1, p0, LH1/n;->a:Lcom/android/launcher3/util/W1;

    .line 10
    .line 11
    return-void
.end method

.method private final a(Landroid/content/res/XmlResourceParser;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getEventType()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 p1, 0x3

    .line 16
    if-ne p0, p1, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method private final b(Landroid/content/res/XmlResourceParser;)Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/XmlResourceParser;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "LH1/q;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->next()I

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    :goto_0
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getEventType()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x1

    .line 18
    if-eq v2, v3, :cond_1

    .line 19
    .line 20
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-nez v2, :cond_1

    .line 29
    .line 30
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getEventType()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    const/4 v3, 0x2

    .line 35
    if-ne v2, v3, :cond_0

    .line 36
    .line 37
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    sget-object v3, LH1/q;->f:LH1/q$a;

    .line 42
    .line 43
    iget-object v4, p0, LH1/n;->a:Lcom/android/launcher3/util/W1;

    .line 44
    .line 45
    invoke-static {p1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    const-string v6, "asAttributeSet(...)"

    .line 50
    .line 51
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3, v4, v5}, LH1/q$a;->a(Lcom/android/launcher3/util/W1;Landroid/util/AttributeSet;)LH1/q;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    :cond_0
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->next()I

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    return-object v1
.end method

.method private final d(Landroid/content/res/XmlResourceParser;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getEventType()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 p1, 0x2

    .line 16
    if-ne p0, p1, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method


# virtual methods
.method public final c(LH1/j$a$a;Lu4/q;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "LH1/g;",
            ">(",
            "LH1/j$a$a;",
            "Lu4/q<",
            "-",
            "LH1/j$a$a;",
            "-",
            "Landroid/content/res/TypedArray;",
            "-",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "LH1/q;",
            ">;+TT;>;)",
            "Ljava/util/List<",
            "LH1/m<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    const-string v0, "specs"

    .line 2
    .line 3
    const-string v1, "responsiveSpecType"

    .line 4
    .line 5
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "map"

    .line 9
    .line 10
    invoke-static {p2, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, LH1/n;->a:Lcom/android/launcher3/util/W1;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/util/W1;->a()Landroid/content/res/XmlResourceParser;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v3, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getEventType()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    const/4 v5, 0x0

    .line 34
    move-object v6, v5

    .line 35
    :goto_0
    const/4 v7, 0x1

    .line 36
    if-eq v4, v7, :cond_4

    .line 37
    .line 38
    invoke-direct {p0, v1, v0}, LH1/n;->d(Landroid/content/res/XmlResourceParser;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    const-string v7, "asAttributeSet(...)"

    .line 43
    .line 44
    if-eqz v4, :cond_0

    .line 45
    .line 46
    :try_start_1
    iget-object v4, p0, LH1/n;->a:Lcom/android/launcher3/util/W1;

    .line 47
    .line 48
    invoke-static {v1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    invoke-static {v6, v7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sget-object v7, Lcom/android/launcher3/x5;->B2:[I

    .line 56
    .line 57
    const-string v8, "ResponsiveSpecGroup"

    .line 58
    .line 59
    invoke-static {v7, v8}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v4, v6, v7}, Lcom/android/launcher3/util/W1;->b(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    goto :goto_1

    .line 67
    :catchall_0
    move-exception p0

    .line 68
    goto/16 :goto_4

    .line 69
    .line 70
    :catch_0
    move-exception p0

    .line 71
    goto/16 :goto_2

    .line 72
    .line 73
    :cond_0
    invoke-direct {p0, v1, v0}, LH1/n;->a(Landroid/content/res/XmlResourceParser;Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-eqz v4, :cond_2

    .line 78
    .line 79
    if-eqz v6, :cond_1

    .line 80
    .line 81
    sget-object v4, LH1/m;->d:LH1/m$a;

    .line 82
    .line 83
    invoke-virtual {v4, v6, v3}, LH1/m$a;->a(Landroid/content/res/TypedArray;Ljava/util/List;)LH1/m;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-interface {v2, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V

    .line 94
    .line 95
    .line 96
    move-object v6, v5

    .line 97
    goto :goto_1

    .line 98
    :cond_1
    const-string p0, "Required value was null."

    .line 99
    .line 100
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 101
    .line 102
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    throw p1

    .line 106
    :cond_2
    invoke-virtual {p1}, LH1/j$a$a;->c()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-direct {p0, v1, v4}, LH1/n;->d(Landroid/content/res/XmlResourceParser;Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    if-eqz v4, :cond_3

    .line 115
    .line 116
    iget-object v4, p0, LH1/n;->a:Lcom/android/launcher3/util/W1;

    .line 117
    .line 118
    invoke-static {v1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 119
    .line 120
    .line 121
    move-result-object v8

    .line 122
    invoke-static {v8, v7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    sget-object v7, Lcom/android/launcher3/x5;->A2:[I

    .line 126
    .line 127
    const-string v9, "ResponsiveSpec"

    .line 128
    .line 129
    invoke-static {v7, v9}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v4, v8, v7}, Lcom/android/launcher3/util/W1;->b(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    invoke-direct {p0, v1}, LH1/n;->b(Landroid/content/res/XmlResourceParser;)Ljava/util/Map;

    .line 137
    .line 138
    .line 139
    move-result-object v7

    .line 140
    invoke-interface {p2, p1, v4, v7}, Lu4/q;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    invoke-interface {v3, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 148
    .line 149
    .line 150
    :cond_3
    :goto_1
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->next()I

    .line 151
    .line 152
    .line 153
    move-result v4

    .line 154
    goto :goto_0

    .line 155
    :cond_4
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 156
    .line 157
    .line 158
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 159
    .line 160
    .line 161
    move-result p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 162
    if-eqz p0, :cond_5

    .line 163
    .line 164
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 165
    .line 166
    .line 167
    return-object v2

    .line 168
    :cond_5
    :try_start_2
    new-instance p0, LH1/h;

    .line 169
    .line 170
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    new-instance p2, Ljava/lang/StringBuilder;

    .line 175
    .line 176
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    .line 178
    .line 179
    const-string v0, "Invalid XML. "

    .line 180
    .line 181
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string p1, " specs not linked to a group."

    .line 188
    .line 189
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-direct {p0, p1}, LH1/h;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 200
    :goto_2
    :try_start_3
    instance-of p1, p0, Ljava/lang/NoSuchFieldException;

    .line 201
    .line 202
    if-nez p1, :cond_7

    .line 203
    .line 204
    instance-of p1, p0, Ljava/io/IOException;

    .line 205
    .line 206
    if-nez p1, :cond_7

    .line 207
    .line 208
    instance-of p1, p0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 209
    .line 210
    if-eqz p1, :cond_6

    .line 211
    .line 212
    goto :goto_3

    .line 213
    :cond_6
    throw p0

    .line 214
    :cond_7
    :goto_3
    new-instance p1, Ljava/lang/RuntimeException;

    .line 215
    .line 216
    const-string p2, "Failure parsing specs file."

    .line 217
    .line 218
    invoke-direct {p1, p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 219
    .line 220
    .line 221
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 222
    :goto_4
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 223
    .line 224
    .line 225
    throw p0
.end method
