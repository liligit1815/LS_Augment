.class Lcom/android/launcher3/globalsearch/b;
.super Ljava/lang/Object;
.source "GSAppData.java"


# instance fields
.field private a:Landroid/content/Context;

.field b:Lcom/android/launcher3/globalsearch/g;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/b;->a:Landroid/content/Context;

    .line 5
    .line 6
    new-instance p1, Lcom/android/launcher3/globalsearch/g;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/b;->a:Landroid/content/Context;

    .line 9
    .line 10
    invoke-direct {p1, v0}, Lcom/android/launcher3/globalsearch/g;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/b;->b:Lcom/android/launcher3/globalsearch/g;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    return p0
.end method

.method private c(Landroid/content/ComponentName;Landroid/os/UserHandle;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance p0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    invoke-static {p0, p2}, Lcom/android/launcher3/util/P0;->p(Ljava/util/HashSet;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string p2, ""

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    return-object p2

    .line 22
    :cond_0
    iget-object p1, p1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/lang/Iterable;->spliterator()Ljava/util/Spliterator;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-static {p1, v0}, Ljava/util/stream/StreamSupport;->stream(Ljava/util/Spliterator;Z)Ljava/util/stream/Stream;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1, p0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ljava/util/Collection;

    .line 46
    .line 47
    if-eqz p0, :cond_b

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_1

    .line 54
    .line 55
    goto :goto_3

    .line 56
    :cond_1
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const/4 p1, 0x0

    .line 61
    move-object p2, p1

    .line 62
    :cond_2
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 73
    .line 74
    iget v1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 75
    .line 76
    if-nez v1, :cond_2

    .line 77
    .line 78
    move-object p2, v0

    .line 79
    goto :goto_0

    .line 80
    :cond_3
    iget p0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 81
    .line 82
    if-gez p0, :cond_4

    .line 83
    .line 84
    return-object p1

    .line 85
    :cond_4
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iget-object p0, p0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    new-instance v0, Lcom/android/launcher3/globalsearch/a;

    .line 96
    .line 97
    invoke-direct {v0}, Lcom/android/launcher3/globalsearch/a;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-interface {p0}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    if-eqz p0, :cond_a

    .line 109
    .line 110
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_5

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    :cond_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_7

    .line 126
    .line 127
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 132
    .line 133
    iget v1, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 134
    .line 135
    iget v2, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 136
    .line 137
    if-ne v1, v2, :cond_6

    .line 138
    .line 139
    check-cast v0, Lcom/android/launcher3/model/data/p;

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_7
    move-object v0, p1

    .line 143
    :goto_1
    if-nez v0, :cond_8

    .line 144
    .line 145
    return-object p1

    .line 146
    :cond_8
    iget-object p0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 147
    .line 148
    if-nez p0, :cond_9

    .line 149
    .line 150
    return-object p1

    .line 151
    :cond_9
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    return-object p0

    .line 156
    :cond_a
    :goto_2
    return-object p1

    .line 157
    :cond_b
    :goto_3
    return-object p2
.end method

.method private f(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method b(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/globalsearch/GSearchItem;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/globalsearch/b;->g(Ljava/lang/String;Z)Ljava/util/ArrayList;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/android/launcher3/globalsearch/GSearchItem;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/launcher3/globalsearch/b;->a:Landroid/content/Context;

    .line 30
    .line 31
    const v3, 0x7f140092

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Lcom/android/launcher3/globalsearch/GSearchItem;->setDesStr(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Landroid/content/Intent;

    .line 42
    .line 43
    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v3, "showAppDetailsForProfile"

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/android/launcher3/globalsearch/GSearchItem;->getComponentName()Landroid/content/ComponentName;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v2}, Lcom/android/launcher3/globalsearch/GSearchItem;->setIntent(Landroid/content/Intent;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    :goto_1
    return-object p1
.end method

.method d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/b;->b:Lcom/android/launcher3/globalsearch/g;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/g;->j()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/b;->b:Lcom/android/launcher3/globalsearch/g;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/globalsearch/g;->m()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method g(Ljava/lang/String;Z)Ljava/util/ArrayList;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/globalsearch/GSearchItem;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "%"

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v3, " queryApps searchItem "

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    move-object/from16 v4, p1

    .line 16
    .line 17
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v5, "Global_Search_GSAppData"

    .line 25
    .line 26
    invoke-static {v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/globalsearch/b;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v9

    .line 33
    new-instance v2, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-eqz v4, :cond_0

    .line 47
    .line 48
    goto/16 :goto_6

    .line 49
    .line 50
    :cond_0
    const/4 v4, 0x0

    .line 51
    :try_start_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    invoke-virtual {v9, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    const-string v12, "is_quick_app =? AND (pinyin_full LIKE? OR pinyin_header LIKE?  OR label LIKE? )"

    .line 60
    .line 61
    const/16 v16, 0x0

    .line 62
    .line 63
    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    new-instance v8, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    new-instance v10, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v6

    .line 103
    new-instance v10, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    filled-new-array {v7, v8, v6, v0}, [Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v13

    .line 125
    iget-object v10, v1, Lcom/android/launcher3/globalsearch/b;->b:Lcom/android/launcher3/globalsearch/g;

    .line 126
    .line 127
    const-string v14, "lastUpdated desc "

    .line 128
    .line 129
    const-string v15, "0,10"

    .line 130
    .line 131
    const/4 v11, 0x0

    .line 132
    invoke-virtual/range {v10 .. v15}, Lcom/android/launcher3/globalsearch/g;->q([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    new-instance v6, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 143
    .line 144
    .line 145
    const-string v7, " queryApps total "

    .line 146
    .line 147
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    new-instance v12, Lcom/android/launcher3/f;

    .line 161
    .line 162
    iget-object v0, v1, Lcom/android/launcher3/globalsearch/b;->a:Landroid/content/Context;

    .line 163
    .line 164
    invoke-direct {v12, v0}, Lcom/android/launcher3/f;-><init>(Landroid/content/Context;)V

    .line 165
    .line 166
    .line 167
    :cond_1
    :goto_0
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_5

    .line 172
    .line 173
    const-string v0, "label"

    .line 174
    .line 175
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    const-string v0, "componentName"

    .line 183
    .line 184
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    invoke-interface {v4, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    iget-object v6, v1, Lcom/android/launcher3/globalsearch/b;->b:Lcom/android/launcher3/globalsearch/g;

    .line 193
    .line 194
    invoke-virtual {v6, v0}, Lcom/android/launcher3/globalsearch/g;->o(Ljava/lang/String;)J

    .line 195
    .line 196
    .line 197
    move-result-wide v6

    .line 198
    sget-object v8, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 199
    .line 200
    iget-object v10, v1, Lcom/android/launcher3/globalsearch/b;->a:Landroid/content/Context;

    .line 201
    .line 202
    invoke-virtual {v8, v10}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v8

    .line 206
    check-cast v8, LD1/t;

    .line 207
    .line 208
    invoke-virtual {v8, v6, v7}, LD1/t;->n(J)Landroid/os/UserHandle;

    .line 209
    .line 210
    .line 211
    move-result-object v13

    .line 212
    iget-object v6, v1, Lcom/android/launcher3/globalsearch/b;->b:Lcom/android/launcher3/globalsearch/g;

    .line 213
    .line 214
    invoke-virtual {v6, v0}, Lcom/android/launcher3/globalsearch/g;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-static {v0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 219
    .line 220
    .line 221
    move-result-object v14

    .line 222
    invoke-direct {v1, v14, v13}, Lcom/android/launcher3/globalsearch/b;->c(Landroid/content/ComponentName;Landroid/os/UserHandle;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 226
    :try_start_1
    iget-object v0, v1, Lcom/android/launcher3/globalsearch/b;->a:Landroid/content/Context;

    .line 227
    .line 228
    const-class v6, Landroid/content/pm/LauncherApps;

    .line 229
    .line 230
    invoke-virtual {v0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 235
    .line 236
    invoke-virtual {v0, v14, v13}, Landroid/content/pm/LauncherApps;->isActivityEnabled(Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    .line 237
    .line 238
    .line 239
    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 240
    goto :goto_1

    .line 241
    :catchall_0
    move-exception v0

    .line 242
    goto/16 :goto_7

    .line 243
    .line 244
    :catch_0
    move-exception v0

    .line 245
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 246
    .line 247
    .line 248
    move/from16 v0, v16

    .line 249
    .line 250
    :goto_1
    if-eqz v0, :cond_1

    .line 251
    .line 252
    iget-object v0, v1, Lcom/android/launcher3/globalsearch/b;->a:Landroid/content/Context;

    .line 253
    .line 254
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {v12, v0, v14, v13}, Lcom/android/launcher3/f;->b(Lcom/android/launcher3/P2;Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    if-eqz v0, :cond_2

    .line 263
    .line 264
    goto :goto_0

    .line 265
    :cond_2
    new-instance v0, Landroid/content/Intent;

    .line 266
    .line 267
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0, v14}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 271
    .line 272
    .line 273
    invoke-static {}, Lcom/android/launcher3/globalsearch/p;->u()Lcom/android/launcher3/globalsearch/p;

    .line 274
    .line 275
    .line 276
    move-result-object v6

    .line 277
    invoke-virtual {v6, v0, v13}, Lcom/android/launcher3/globalsearch/p;->t(Landroid/content/Intent;Landroid/os/UserHandle;)LI/d;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    if-nez v0, :cond_3

    .line 282
    .line 283
    goto :goto_0

    .line 284
    :cond_3
    iget-object v6, v0, LI/d;->a:Ljava/lang/Object;

    .line 285
    .line 286
    check-cast v6, Ljava/lang/CharSequence;

    .line 287
    .line 288
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 289
    .line 290
    .line 291
    move-result v6

    .line 292
    if-nez v6, :cond_4

    .line 293
    .line 294
    iget-object v6, v0, LI/d;->a:Ljava/lang/Object;

    .line 295
    .line 296
    check-cast v6, Ljava/lang/String;

    .line 297
    .line 298
    :goto_2
    move-object v7, v6

    .line 299
    goto :goto_3

    .line 300
    :catch_1
    move-exception v0

    .line 301
    goto :goto_5

    .line 302
    :cond_4
    invoke-virtual {v14}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v6

    .line 306
    goto :goto_2

    .line 307
    :goto_3
    new-instance v6, Lcom/android/launcher3/globalsearch/GSearchItem;

    .line 308
    .line 309
    iget-object v8, v1, Lcom/android/launcher3/globalsearch/b;->a:Landroid/content/Context;

    .line 310
    .line 311
    iget-object v0, v0, LI/d;->b:Ljava/lang/Object;

    .line 312
    .line 313
    check-cast v0, Landroid/graphics/Bitmap;

    .line 314
    .line 315
    invoke-static {v8, v0}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 316
    .line 317
    .line 318
    move-result-object v11

    .line 319
    const/4 v8, 0x0

    .line 320
    invoke-direct/range {v6 .. v11}, Lcom/android/launcher3/globalsearch/GSearchItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 321
    .line 322
    .line 323
    invoke-virtual {v6, v14}, Lcom/android/launcher3/globalsearch/GSearchItem;->setComponentName(Landroid/content/ComponentName;)V

    .line 324
    .line 325
    .line 326
    iget-object v0, v1, Lcom/android/launcher3/globalsearch/b;->b:Lcom/android/launcher3/globalsearch/g;

    .line 327
    .line 328
    invoke-virtual {v0, v14}, Lcom/android/launcher3/globalsearch/g;->g(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    invoke-virtual {v6, v0}, Lcom/android/launcher3/globalsearch/GSearchItem;->setIntent(Landroid/content/Intent;)V

    .line 333
    .line 334
    .line 335
    invoke-virtual {v6, v13}, Lcom/android/launcher3/globalsearch/GSearchItem;->setUserHandle(Landroid/os/UserHandle;)V

    .line 336
    .line 337
    .line 338
    new-instance v0, Ljava/lang/StringBuilder;

    .line 339
    .line 340
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 341
    .line 342
    .line 343
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v6}, Lcom/android/launcher3/globalsearch/GSearchItem;->toString()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v7

    .line 350
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    .line 359
    .line 360
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 361
    .line 362
    .line 363
    goto/16 :goto_0

    .line 364
    .line 365
    :cond_5
    :goto_4
    invoke-static {v4}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 366
    .line 367
    .line 368
    goto :goto_6

    .line 369
    :goto_5
    :try_start_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 370
    .line 371
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 372
    .line 373
    .line 374
    const-string v3, " queryApps exception "

    .line 375
    .line 376
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v3

    .line 383
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v1

    .line 390
    invoke-static {v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    .line 392
    .line 393
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 394
    .line 395
    .line 396
    goto :goto_4

    .line 397
    :goto_6
    return-object v2

    .line 398
    :goto_7
    invoke-static {v4}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 399
    .line 400
    .line 401
    throw v0
.end method

.method h(I)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/globalsearch/GSearchItem;",
            ">;"
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
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/b;->b:Lcom/android/launcher3/globalsearch/g;

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/globalsearch/g;->u(Ljava/util/ArrayList;I)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
