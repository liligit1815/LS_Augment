.class public final Lcom/android/launcher3/widget/Z0;
.super Ljava/lang/Object;
.source "WidgetSections.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/Z0$a;
    }
.end annotation


# static fields
.field private static a:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/widget/Z0$a;",
            ">;"
        }
    .end annotation
.end field

.field private static b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/content/ComponentName;",
            "Lcom/android/launcher3/util/z0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static declared-synchronized a(Landroid/content/Context;)Landroid/util/SparseArray;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/widget/Z0$a;",
            ">;"
        }
    .end annotation

    .line 1
    const-class v0, Lcom/android/launcher3/widget/Z0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/android/launcher3/widget/Z0;->a:Landroid/util/SparseArray;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-object v1

    .line 10
    :cond_0
    :try_start_1
    invoke-static {p0}, Lcom/android/launcher3/widget/Z0;->c(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/android/launcher3/widget/Z0;->a:Landroid/util/SparseArray;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    .line 15
    monitor-exit v0

    .line 16
    return-object p0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 19
    throw p0
.end method

.method public static declared-synchronized b(Landroid/content/Context;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map<",
            "Landroid/content/ComponentName;",
            "Lcom/android/launcher3/util/z0;",
            ">;"
        }
    .end annotation

    .line 1
    const-class v0, Lcom/android/launcher3/widget/Z0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/android/launcher3/widget/Z0;->b:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-object v1

    .line 10
    :cond_0
    :try_start_1
    invoke-static {p0}, Lcom/android/launcher3/widget/Z0;->c(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/android/launcher3/widget/Z0;->b:Ljava/util/Map;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    .line 15
    monitor-exit v0

    .line 16
    return-object p0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 19
    throw p0
.end method

.method private static declared-synchronized c(Landroid/content/Context;)V
    .locals 14

    .line 1
    const-class v0, Lcom/android/launcher3/widget/Z0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v2, Landroid/util/ArrayMap;

    .line 10
    .line 11
    invoke-direct {v2}, Landroid/util/ArrayMap;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 12
    .line 13
    .line 14
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    const v4, 0x7f170020

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 22
    .line 23
    .line 24
    move-result-object v3
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 25
    :try_start_2
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    :cond_0
    :goto_0
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->next()I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    const/4 v6, 0x3

    .line 34
    if-ne v5, v6, :cond_1

    .line 35
    .line 36
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    if-le v7, v4, :cond_7

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto/16 :goto_4

    .line 45
    .line 46
    :cond_1
    :goto_1
    const/4 v7, 0x1

    .line 47
    if-eq v5, v7, :cond_7

    .line 48
    .line 49
    const/4 v8, 0x2

    .line 50
    if-ne v5, v8, :cond_0

    .line 51
    .line 52
    const-string v5, "section"

    .line 53
    .line 54
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v9

    .line 58
    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    if-eqz v5, :cond_0

    .line 63
    .line 64
    invoke-static {v3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    new-instance v9, Lcom/android/launcher3/widget/Z0$a;

    .line 69
    .line 70
    invoke-direct {v9, p0, v5}, Lcom/android/launcher3/widget/Z0$a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 71
    .line 72
    .line 73
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    :cond_2
    :goto_2
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->next()I

    .line 78
    .line 79
    .line 80
    move-result v10

    .line 81
    if-ne v10, v6, :cond_3

    .line 82
    .line 83
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 84
    .line 85
    .line 86
    move-result v11

    .line 87
    if-le v11, v5, :cond_6

    .line 88
    .line 89
    :cond_3
    if-eq v10, v7, :cond_6

    .line 90
    .line 91
    if-ne v10, v8, :cond_2

    .line 92
    .line 93
    const-string v10, "widget"

    .line 94
    .line 95
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v11

    .line 99
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v10

    .line 103
    if-eqz v10, :cond_2

    .line 104
    .line 105
    invoke-static {v3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 106
    .line 107
    .line 108
    move-result-object v10

    .line 109
    sget-object v11, Lcom/android/launcher3/x5;->O3:[I

    .line 110
    .line 111
    invoke-virtual {p0, v10, v11}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 112
    .line 113
    .line 114
    move-result-object v10

    .line 115
    invoke-virtual {v10, v8}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v11

    .line 119
    invoke-static {v11}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 120
    .line 121
    .line 122
    move-result-object v11

    .line 123
    const/4 v12, 0x0

    .line 124
    invoke-virtual {v10, v12, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 125
    .line 126
    .line 127
    move-result v12

    .line 128
    invoke-interface {v2, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v13

    .line 132
    if-eqz v13, :cond_4

    .line 133
    .line 134
    invoke-interface {v2, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v11

    .line 138
    check-cast v11, Lcom/android/launcher3/util/z0;

    .line 139
    .line 140
    goto :goto_3

    .line 141
    :cond_4
    new-instance v13, Lcom/android/launcher3/util/z0;

    .line 142
    .line 143
    invoke-direct {v13}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-interface {v2, v11, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-object v11, v13

    .line 150
    :goto_3
    if-eqz v12, :cond_5

    .line 151
    .line 152
    const/4 v12, -0x1

    .line 153
    invoke-virtual {v11, v12}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 154
    .line 155
    .line 156
    :cond_5
    iget v12, v9, Lcom/android/launcher3/widget/Z0$a;->a:I

    .line 157
    .line 158
    invoke-virtual {v11, v12}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v10}, Landroid/content/res/TypedArray;->recycle()V

    .line 162
    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_6
    iget v5, v9, Lcom/android/launcher3/widget/Z0$a;->a:I

    .line 166
    .line 167
    invoke-virtual {v1, v5, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 168
    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :cond_7
    sput-object v1, Lcom/android/launcher3/widget/Z0;->a:Landroid/util/SparseArray;

    .line 173
    .line 174
    sput-object v2, Lcom/android/launcher3/widget/Z0;->b:Ljava/util/Map;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 175
    .line 176
    :try_start_3
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 177
    .line 178
    .line 179
    monitor-exit v0

    .line 180
    return-void

    .line 181
    :catchall_1
    move-exception p0

    .line 182
    goto :goto_7

    .line 183
    :catch_0
    move-exception p0

    .line 184
    goto :goto_6

    .line 185
    :goto_4
    if-eqz v3, :cond_8

    .line 186
    .line 187
    :try_start_4
    invoke-interface {v3}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 188
    .line 189
    .line 190
    goto :goto_5

    .line 191
    :catchall_2
    move-exception v1

    .line 192
    :try_start_5
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    :cond_8
    :goto_5
    throw p0
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 196
    :goto_6
    :try_start_6
    new-instance v1, Ljava/lang/RuntimeException;

    .line 197
    .line 198
    invoke-direct {v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 199
    .line 200
    .line 201
    throw v1

    .line 202
    :goto_7
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 203
    throw p0
.end method
