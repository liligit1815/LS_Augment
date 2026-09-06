.class public Lcom/android/launcher3/s$e;
.super Ljava/lang/Object;
.source "AutoInstallsLayout.java"

# interfaces
.implements Lcom/android/launcher3/s$i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "e"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/s;


# direct methods
.method protected constructor <init>(Lcom/android/launcher3/s;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/s$e;->a:Lcom/android/launcher3/s;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/content/res/XmlResourceParser;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/s$e;->b(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/s$e;->c(Lorg/xmlpull/v1/XmlPullParser;)Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "AutoInstalls"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "Skipping invalid <appwidget> with no component"

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    const/4 p0, -0x1

    .line 15
    return p0

    .line 16
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/s$e;->a:Lcom/android/launcher3/s;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 19
    .line 20
    const-string v3, "spanX"

    .line 21
    .line 22
    invoke-static {p1, v3}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/launcher3/s$e;->a:Lcom/android/launcher3/s;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 32
    .line 33
    const-string v3, "spanY"

    .line 34
    .line 35
    invoke-static {p1, v3}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/android/launcher3/s$e;->a:Lcom/android/launcher3/s;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 45
    .line 46
    const/4 v3, 0x4

    .line 47
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    const-string v4, "itemType"

    .line 52
    .line 53
    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 54
    .line 55
    .line 56
    new-instance v2, Landroid/os/Bundle;

    .line 57
    .line 58
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    const/4 v5, 0x3

    .line 70
    if-ne v4, v5, :cond_4

    .line 71
    .line 72
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    if-le v5, v3, :cond_1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_1
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/s$e;->d(Landroid/content/ComponentName;Landroid/os/Bundle;)I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    const/4 v2, -0x2

    .line 84
    if-ne p1, v2, :cond_2

    .line 85
    .line 86
    iget-object v2, p0, Lcom/android/launcher3/s$e;->a:Lcom/android/launcher3/s;

    .line 87
    .line 88
    iget-object v2, v2, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 89
    .line 90
    const-string v3, "appWidgetProvider"

    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    new-instance v2, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    const-string v3, "PendingWidgetParser parseAndAdd 2 cn.flattenToString()\uff1a"

    .line 105
    .line 106
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/s$e;->a:Lcom/android/launcher3/s;

    .line 124
    .line 125
    iget-object p0, p0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 126
    .line 127
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->l0:Z

    .line 132
    .line 133
    if-eqz p0, :cond_3

    .line 134
    .line 135
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0, v0}, Lcom/android/launcher3/H5;->b(Landroid/content/ComponentName;)V

    .line 140
    .line 141
    .line 142
    :cond_3
    return p1

    .line 143
    :cond_4
    :goto_1
    const/4 v5, 0x2

    .line 144
    if-eq v4, v5, :cond_5

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_5
    const-string v4, "extra"

    .line 148
    .line 149
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    if-eqz v4, :cond_7

    .line 158
    .line 159
    const-string v4, "key"

    .line 160
    .line 161
    invoke-static {p1, v4}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    const-string v5, "value"

    .line 166
    .line 167
    invoke-static {p1, v5}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    if-eqz v4, :cond_6

    .line 172
    .line 173
    if-eqz v5, :cond_6

    .line 174
    .line 175
    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_6
    new-instance p0, Ljava/lang/RuntimeException;

    .line 180
    .line 181
    const-string p1, "Widget extras must have a key and value"

    .line 182
    .line 183
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    throw p0

    .line 187
    :cond_7
    new-instance p0, Ljava/lang/RuntimeException;

    .line 188
    .line 189
    const-string p1, "Widgets can contain only extras"

    .line 190
    .line 191
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    throw p0
.end method

.method public c(Lorg/xmlpull/v1/XmlPullParser;)Landroid/content/ComponentName;
    .locals 2

    .line 1
    const-string v0, "packageName"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "className"

    .line 8
    .line 9
    invoke-static {p1, v1}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Lcom/android/launcher3/s$e;->a:Lcom/android/launcher3/s;

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/android/launcher3/s;->b(Lcom/android/launcher3/s;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    new-instance p0, Landroid/content/ComponentName;

    .line 32
    .line 33
    invoke-direct {p0, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method protected d(Landroid/content/ComponentName;Landroid/os/Bundle;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/s$e;->a:Lcom/android/launcher3/s;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 4
    .line 5
    const-string v1, "appWidgetProvider"

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/s$e;->a:Lcom/android/launcher3/s;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 17
    .line 18
    const/16 v0, 0x23

    .line 19
    .line 20
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "restored"

    .line 25
    .line 26
    invoke-virtual {p1, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/s$e;->a:Lcom/android/launcher3/s;

    .line 30
    .line 31
    iget-object v0, p1, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 34
    .line 35
    invoke-interface {p1}, Lcom/android/launcher3/s$d;->c()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v1, "_id"

    .line 44
    .line 45
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Landroid/os/Bundle;->isEmpty()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/launcher3/s$e;->a:Lcom/android/launcher3/s;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 57
    .line 58
    new-instance v0, Landroid/content/Intent;

    .line 59
    .line 60
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, p2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    const/4 v0, 0x0

    .line 68
    invoke-virtual {p2, v0}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    const-string v0, "intent"

    .line 73
    .line 74
    invoke-virtual {p1, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/s$e;->a:Lcom/android/launcher3/s;

    .line 78
    .line 79
    iget-object p1, p0, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 80
    .line 81
    iget-object p2, p0, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 84
    .line 85
    invoke-interface {p1, p2, p0}, Lcom/android/launcher3/s$d;->b(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)I

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-gez p0, :cond_2

    .line 90
    .line 91
    const/4 p1, -0x2

    .line 92
    if-ne p0, p1, :cond_1

    .line 93
    .line 94
    return p1

    .line 95
    :cond_1
    const/4 p0, -0x1

    .line 96
    :cond_2
    return p0
.end method
