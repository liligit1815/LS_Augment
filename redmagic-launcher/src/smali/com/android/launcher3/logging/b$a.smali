.class Lcom/android/launcher3/logging/b$a;
.super Ljava/lang/Object;
.source "FileLog.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logging/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private g:Ljava/lang/String;

.field private h:Ljava/io/PrintWriter;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/android/launcher3/logging/b$a;->g:Ljava/lang/String;

    .line 4
    iput-object v0, p0, Lcom/android/launcher3/logging/b$a;->h:Ljava/io/PrintWriter;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/logging/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/logging/b$a;-><init>()V

    return-void
.end method

.method private a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/logging/b$a;->h:Ljava/io/PrintWriter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/util/v0;->a(Ljava/io/Closeable;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/android/launcher3/logging/b$a;->h:Ljava/io/PrintWriter;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 10

    .line 1
    invoke-static {}, Lcom/android/launcher3/logging/b;->b()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_7

    .line 7
    .line 8
    iget v0, p1, Landroid/os/Message;->what:I

    .line 9
    .line 10
    const-string v2, "log-"

    .line 11
    .line 12
    const/4 v3, 0x4

    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v5, 0x2

    .line 15
    if-eq v0, v1, :cond_3

    .line 16
    .line 17
    if-eq v0, v5, :cond_2

    .line 18
    .line 19
    const/4 v5, 0x3

    .line 20
    if-eq v0, v5, :cond_0

    .line 21
    .line 22
    return v1

    .line 23
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/logging/b$a;->a()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p0, Landroid/util/Pair;

    .line 29
    .line 30
    iget-object p1, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 31
    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    :goto_0
    if-ge v4, v3, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast p1, Ljava/io/PrintWriter;

    .line 39
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {p1, v0}, Lcom/android/launcher3/logging/b;->c(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 v4, v4, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p0, Ljava/util/concurrent/CountDownLatch;

    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 66
    .line 67
    .line 68
    return v1

    .line 69
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/logging/b$a;->a()V

    .line 70
    .line 71
    .line 72
    return v1

    .line 73
    :cond_3
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v6, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const/4 v2, 0x6

    .line 86
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    rem-int/2addr v2, v3

    .line 91
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    iget-object v3, p0, Lcom/android/launcher3/logging/b$a;->g:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-nez v3, :cond_4

    .line 105
    .line 106
    invoke-direct {p0}, Lcom/android/launcher3/logging/b$a;->a()V

    .line 107
    .line 108
    .line 109
    :cond_4
    :try_start_0
    iget-object v3, p0, Lcom/android/launcher3/logging/b$a;->h:Ljava/io/PrintWriter;

    .line 110
    .line 111
    if-nez v3, :cond_6

    .line 112
    .line 113
    iput-object v2, p0, Lcom/android/launcher3/logging/b$a;->g:Ljava/lang/String;

    .line 114
    .line 115
    new-instance v3, Ljava/io/File;

    .line 116
    .line 117
    invoke-static {}, Lcom/android/launcher3/logging/b;->b()Ljava/io/File;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    invoke-direct {v3, v6, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_5

    .line 129
    .line 130
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    .line 135
    .line 136
    .line 137
    move-result-wide v6

    .line 138
    invoke-virtual {v2, v6, v7}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 139
    .line 140
    .line 141
    const/16 v6, 0xa

    .line 142
    .line 143
    const/16 v7, 0x24

    .line 144
    .line 145
    invoke-virtual {v2, v6, v7}, Ljava/util/Calendar;->add(II)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_5

    .line 153
    .line 154
    invoke-virtual {v3}, Ljava/io/File;->length()J

    .line 155
    .line 156
    .line 157
    move-result-wide v6

    .line 158
    const-wide/32 v8, 0x800000

    .line 159
    .line 160
    .line 161
    cmp-long v0, v6, v8

    .line 162
    .line 163
    if-gez v0, :cond_5

    .line 164
    .line 165
    move v4, v1

    .line 166
    goto :goto_1

    .line 167
    :catch_0
    move-exception p1

    .line 168
    goto :goto_2

    .line 169
    :cond_5
    :goto_1
    new-instance v0, Ljava/io/PrintWriter;

    .line 170
    .line 171
    new-instance v2, Ljava/io/FileWriter;

    .line 172
    .line 173
    invoke-direct {v2, v3, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    .line 174
    .line 175
    .line 176
    invoke-direct {v0, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 177
    .line 178
    .line 179
    iput-object v0, p0, Lcom/android/launcher3/logging/b$a;->h:Ljava/io/PrintWriter;

    .line 180
    .line 181
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/logging/b$a;->h:Ljava/io/PrintWriter;

    .line 182
    .line 183
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast p1, Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    iget-object p1, p0, Lcom/android/launcher3/logging/b$a;->h:Ljava/io/PrintWriter;

    .line 191
    .line 192
    invoke-virtual {p1}, Ljava/io/PrintWriter;->flush()V

    .line 193
    .line 194
    .line 195
    invoke-static {}, Lcom/android/launcher3/logging/b;->a()Landroid/os/Handler;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-virtual {p1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 200
    .line 201
    .line 202
    invoke-static {}, Lcom/android/launcher3/logging/b;->a()Landroid/os/Handler;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    const-wide/16 v2, 0x1388

    .line 207
    .line 208
    invoke-virtual {p1, v5, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 209
    .line 210
    .line 211
    goto :goto_3

    .line 212
    :goto_2
    const-string v0, "FileLog"

    .line 213
    .line 214
    const-string v2, "Error writing logs to file"

    .line 215
    .line 216
    invoke-static {v0, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 217
    .line 218
    .line 219
    invoke-direct {p0}, Lcom/android/launcher3/logging/b$a;->a()V

    .line 220
    .line 221
    .line 222
    :cond_7
    :goto_3
    return v1
.end method
