.class public Lcom/android/quickstep/util/ActiveGestureLog;
.super Ljava/lang/Object;
.source "ActiveGestureLog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/ActiveGestureLog$EventLog;,
        Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;,
        Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

.field public static final INTENT_EXTRA_LOG_TRACE_ID:Ljava/lang/String; = "INTENT_EXTRA_LOG_TRACE_ID"

.field private static final MAX_GESTURES_TRACKED:I = 0xf


# instance fields
.field private final logs:[Lcom/android/quickstep/util/ActiveGestureLog$EventLog;

.field private mCurrentLogId:I

.field private mIsFullyGesturalNavMode:Z

.field private nextIndex:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureLog;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/ActiveGestureLog;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureLog;->INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x64

    .line 5
    .line 6
    iput v0, p0, Lcom/android/quickstep/util/ActiveGestureLog;->mCurrentLogId:I

    .line 7
    .line 8
    const/16 v0, 0xf

    .line 9
    .line 10
    new-array v0, v0, [Lcom/android/quickstep/util/ActiveGestureLog$EventLog;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/quickstep/util/ActiveGestureLog;->logs:[Lcom/android/quickstep/util/ActiveGestureLog$EventLog;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/android/quickstep/util/ActiveGestureLog;->nextIndex:I

    .line 16
    .line 17
    return-void
.end method

.method private isEntrySame(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->c(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->b(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;)Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-ne p0, p3, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method


# virtual methods
.method public addLog(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V
    .locals 1

    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/util/ActiveGestureLog;->addLog(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V

    return-void
.end method

.method public addLog(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V
    .locals 4

    .line 4
    iget-object v0, p0, Lcom/android/quickstep/util/ActiveGestureLog;->logs:[Lcom/android/quickstep/util/ActiveGestureLog$EventLog;

    iget v1, p0, Lcom/android/quickstep/util/ActiveGestureLog;->nextIndex:I

    array-length v2, v0

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x1

    array-length v2, v0

    rem-int/2addr v1, v2

    aget-object v0, v0, v1

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 5
    iget v2, p0, Lcom/android/quickstep/util/ActiveGestureLog;->mCurrentLogId:I

    iget v3, v0, Lcom/android/quickstep/util/ActiveGestureLog$EventLog;->logId:I

    if-eq v2, v3, :cond_0

    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/android/quickstep/util/ActiveGestureLog$EventLog;->eventEntries:Ljava/util/List;

    .line 7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;

    goto :goto_0

    :cond_1
    move-object v2, v1

    .line 9
    :goto_0
    invoke-direct {p0, v2, p1, p2}, Lcom/android/quickstep/util/ActiveGestureLog;->isEntrySame(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 10
    invoke-static {v2}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->a(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    invoke-static {v2, p0}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->e(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;I)V

    return-void

    .line 11
    :cond_2
    new-instance p0, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;

    invoke-direct {p0, v1}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;-><init>(Lcom/android/quickstep/util/a;)V

    .line 12
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->f(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V

    .line 13
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    .line 14
    :cond_3
    :goto_1
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureLog$EventLog;

    iget v2, p0, Lcom/android/quickstep/util/ActiveGestureLog;->mCurrentLogId:I

    iget-boolean v3, p0, Lcom/android/quickstep/util/ActiveGestureLog;->mIsFullyGesturalNavMode:Z

    invoke-direct {v0, v2, v3, v1}, Lcom/android/quickstep/util/ActiveGestureLog$EventLog;-><init>(IZLcom/android/quickstep/util/a;)V

    .line 15
    new-instance v2, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;

    invoke-direct {v2, v1}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;-><init>(Lcom/android/quickstep/util/a;)V

    .line 16
    invoke-static {v2, p1, p2}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->f(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V

    .line 17
    iget-object p1, v0, Lcom/android/quickstep/util/ActiveGestureLog$EventLog;->eventEntries:Ljava/util/List;

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    iget-object p1, p0, Lcom/android/quickstep/util/ActiveGestureLog;->logs:[Lcom/android/quickstep/util/ActiveGestureLog$EventLog;

    iget p2, p0, Lcom/android/quickstep/util/ActiveGestureLog;->nextIndex:I

    aput-object v0, p1, p2

    add-int/lit8 p2, p2, 0x1

    .line 19
    array-length p1, p1

    rem-int/2addr p2, p1

    iput p2, p0, Lcom/android/quickstep/util/ActiveGestureLog;->nextIndex:I

    return-void
.end method

.method public addLog(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/util/ActiveGestureLog;->addLog(Ljava/lang/String;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V

    return-void
.end method

.method public addLog(Ljava/lang/String;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V
    .locals 2

    .line 2
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {v0, p1, v1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0, v0, p2}, Lcom/android/quickstep/util/ActiveGestureLog;->addLog(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V

    return-void
.end method

.method public dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "ActiveGestureErrorDetector:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    move v1, v0

    .line 23
    :goto_0
    iget-object v2, p0, Lcom/android/quickstep/util/ActiveGestureLog;->logs:[Lcom/android/quickstep/util/ActiveGestureLog$EventLog;

    .line 24
    .line 25
    array-length v3, v2

    .line 26
    if-ge v1, v3, :cond_1

    .line 27
    .line 28
    iget v3, p0, Lcom/android/quickstep/util/ActiveGestureLog;->nextIndex:I

    .line 29
    .line 30
    add-int/2addr v3, v1

    .line 31
    array-length v4, v2

    .line 32
    rem-int/2addr v3, v4

    .line 33
    aget-object v2, v2, v3

    .line 34
    .line 35
    if-nez v2, :cond_0

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const/16 v4, 0x9

    .line 47
    .line 48
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-static {v3, p2, v2}, Lcom/android/quickstep/util/ActiveGestureErrorDetector;->analyseAndDump(Ljava/lang/String;Ljava/io/PrintWriter;Lcom/android/quickstep/util/ActiveGestureLog$EventLog;)V

    .line 56
    .line 57
    .line 58
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v2, "ActiveGestureLog history:"

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 82
    .line 83
    const-string v2, "HH:mm:ss.SSSZ  "

    .line 84
    .line 85
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 86
    .line 87
    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 88
    .line 89
    .line 90
    new-instance v2, Ljava/util/Date;

    .line 91
    .line 92
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 93
    .line 94
    .line 95
    :goto_2
    iget-object v3, p0, Lcom/android/quickstep/util/ActiveGestureLog;->logs:[Lcom/android/quickstep/util/ActiveGestureLog$EventLog;

    .line 96
    .line 97
    array-length v4, v3

    .line 98
    if-ge v0, v4, :cond_6

    .line 99
    .line 100
    iget v4, p0, Lcom/android/quickstep/util/ActiveGestureLog;->nextIndex:I

    .line 101
    .line 102
    add-int/2addr v4, v0

    .line 103
    array-length v5, v3

    .line 104
    rem-int/2addr v4, v5

    .line 105
    aget-object v3, v3, v4

    .line 106
    .line 107
    if-nez v3, :cond_2

    .line 108
    .line 109
    goto/16 :goto_4

    .line 110
    .line 111
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v5, "\tLogs for logId: "

    .line 120
    .line 121
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget v5, v3, Lcom/android/quickstep/util/ActiveGestureLog$EventLog;->logId:I

    .line 125
    .line 126
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    new-instance v4, Ljava/util/ArrayList;

    .line 137
    .line 138
    iget-object v3, v3, Lcom/android/quickstep/util/ActiveGestureLog$EventLog;->eventEntries:Ljava/util/List;

    .line 139
    .line 140
    invoke-direct {v4, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    if-eqz v4, :cond_5

    .line 152
    .line 153
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    check-cast v4, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;

    .line 158
    .line 159
    invoke-static {v4}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->c(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 160
    .line 161
    .line 162
    move-result-object v5

    .line 163
    invoke-static {v5}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->a(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Z

    .line 164
    .line 165
    .line 166
    move-result v5

    .line 167
    if-eqz v5, :cond_3

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_3
    invoke-static {v4}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->d(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;)J

    .line 171
    .line 172
    .line 173
    move-result-wide v5

    .line 174
    invoke-virtual {v2, v5, v6}, Ljava/util/Date;->setTime(J)V

    .line 175
    .line 176
    .line 177
    new-instance v5, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    new-instance v6, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string v7, "\t\t"

    .line 188
    .line 189
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v6

    .line 196
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v6

    .line 203
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-static {v4}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->c(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 207
    .line 208
    .line 209
    move-result-object v6

    .line 210
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-static {v4}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->a(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;)I

    .line 214
    .line 215
    .line 216
    move-result v6

    .line 217
    if-lez v6, :cond_4

    .line 218
    .line 219
    const-string v6, " & "

    .line 220
    .line 221
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-static {v4}, Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;->a(Lcom/android/quickstep/util/ActiveGestureLog$EventEntry;)I

    .line 225
    .line 226
    .line 227
    move-result v4

    .line 228
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    const-string v4, " similar events"

    .line 232
    .line 233
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    :cond_4
    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 237
    .line 238
    .line 239
    goto :goto_3

    .line 240
    :cond_5
    :goto_4
    add-int/lit8 v0, v0, 0x1

    .line 241
    .line 242
    goto/16 :goto_2

    .line 243
    .line 244
    :cond_6
    return-void
.end method

.method public getLogId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/ActiveGestureLog;->mCurrentLogId:I

    .line 2
    .line 3
    return p0
.end method

.method public incrementLogId()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/ActiveGestureLog;->mCurrentLogId:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/android/quickstep/util/ActiveGestureLog;->mCurrentLogId:I

    .line 6
    .line 7
    return v0
.end method

.method public setIsFullyGesturalNavMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/ActiveGestureLog;->mIsFullyGesturalNavMode:Z

    .line 2
    .line 3
    return-void
.end method

.method public trackEvent(Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->NO_OP:Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/util/ActiveGestureLog;->addLog(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
