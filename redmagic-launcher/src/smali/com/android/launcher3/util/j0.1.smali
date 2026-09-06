.class public final Lcom/android/launcher3/util/j0;
.super Ljava/lang/Object;
.source "EventLogArray.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/j0$a;,
        Lcom/android/launcher3/util/j0$b;
    }
.end annotation


# static fields
.field public static final d:Lcom/android/launcher3/util/j0$a;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:[Lcom/android/launcher3/util/j0$b;

.field private c:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/j0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/j0$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/util/j0;->d:Lcom/android/launcher3/util/j0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const-string v0, "name"

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
    iput-object p1, p0, Lcom/android/launcher3/util/j0;->a:Ljava/lang/String;

    .line 10
    .line 11
    new-array p1, p2, [Lcom/android/launcher3/util/j0$b;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/launcher3/util/j0;->b:[Lcom/android/launcher3/util/j0$b;

    .line 14
    .line 15
    return-void
.end method

.method private final a(ILjava/lang/String;F)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/launcher3/util/j0;->c:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/util/j0;->b:[Lcom/android/launcher3/util/j0$b;

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    add-int/2addr v2, v0

    .line 7
    add-int/lit8 v2, v2, -0x1

    .line 8
    .line 9
    array-length v3, v1

    .line 10
    rem-int/2addr v2, v3

    .line 11
    array-length v3, v1

    .line 12
    add-int/2addr v0, v3

    .line 13
    add-int/lit8 v0, v0, -0x2

    .line 14
    .line 15
    array-length v3, v1

    .line 16
    rem-int/2addr v0, v3

    .line 17
    sget-object v3, Lcom/android/launcher3/util/j0;->d:Lcom/android/launcher3/util/j0$a;

    .line 18
    .line 19
    aget-object v1, v1, v2

    .line 20
    .line 21
    invoke-static {v3, v1, p1, p2}, Lcom/android/launcher3/util/j0$a;->a(Lcom/android/launcher3/util/j0$a;Lcom/android/launcher3/util/j0$b;ILjava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/util/j0;->b:[Lcom/android/launcher3/util/j0$b;

    .line 28
    .line 29
    aget-object v1, v1, v0

    .line 30
    .line 31
    invoke-static {v3, v1, p1, p2}, Lcom/android/launcher3/util/j0$a;->a(Lcom/android/launcher3/util/j0$a;Lcom/android/launcher3/util/j0$b;ILjava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/util/j0;->b:[Lcom/android/launcher3/util/j0$b;

    .line 38
    .line 39
    aget-object v1, v1, v2

    .line 40
    .line 41
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, p1, p2, p3}, Lcom/android/launcher3/util/j0$b;->g(ILjava/lang/String;F)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/launcher3/util/j0;->b:[Lcom/android/launcher3/util/j0$b;

    .line 48
    .line 49
    aget-object p0, p0, v0

    .line 50
    .line 51
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/util/j0$b;->a()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    add-int/lit8 p1, p1, 0x1

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/j0$b;->f(I)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/util/j0;->b:[Lcom/android/launcher3/util/j0$b;

    .line 65
    .line 66
    iget v1, p0, Lcom/android/launcher3/util/j0;->c:I

    .line 67
    .line 68
    aget-object v2, v0, v1

    .line 69
    .line 70
    if-nez v2, :cond_1

    .line 71
    .line 72
    new-instance v2, Lcom/android/launcher3/util/j0$b;

    .line 73
    .line 74
    invoke-direct {v2}, Lcom/android/launcher3/util/j0$b;-><init>()V

    .line 75
    .line 76
    .line 77
    aput-object v2, v0, v1

    .line 78
    .line 79
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/util/j0;->b:[Lcom/android/launcher3/util/j0$b;

    .line 80
    .line 81
    iget v1, p0, Lcom/android/launcher3/util/j0;->c:I

    .line 82
    .line 83
    aget-object v0, v0, v1

    .line 84
    .line 85
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, p1, p2, p3}, Lcom/android/launcher3/util/j0$b;->g(ILjava/lang/String;F)V

    .line 89
    .line 90
    .line 91
    iget p1, p0, Lcom/android/launcher3/util/j0;->c:I

    .line 92
    .line 93
    add-int/lit8 p1, p1, 0x1

    .line 94
    .line 95
    iget-object p2, p0, Lcom/android/launcher3/util/j0;->b:[Lcom/android/launcher3/util/j0$b;

    .line 96
    .line 97
    array-length p2, p2

    .line 98
    rem-int/2addr p1, p2

    .line 99
    iput p1, p0, Lcom/android/launcher3/util/j0;->c:I

    .line 100
    .line 101
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {p0, v0, p1, v1}, Lcom/android/launcher3/util/j0;->a(ILjava/lang/String;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final c(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    const/4 p2, 0x3

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p2, 0x4

    .line 11
    :goto_0
    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p2, p1, v0}, Lcom/android/launcher3/util/j0;->a(ILjava/lang/String;F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final d(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "prefix"

    .line 3
    .line 4
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const-string v1, "writer"

    .line 8
    .line 9
    invoke-static {p2, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/util/j0;->a:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, " event history:"

    .line 26
    .line 27
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 38
    .line 39
    const-string v2, "  HH:mm:ss.SSSZ  "

    .line 40
    .line 41
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 42
    .line 43
    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ljava/util/Date;

    .line 47
    .line 48
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Lcom/android/launcher3/util/j0;->b:[Lcom/android/launcher3/util/j0$b;

    .line 52
    .line 53
    array-length v3, v3

    .line 54
    const/4 v4, 0x0

    .line 55
    :goto_0
    if-ge v4, v3, :cond_6

    .line 56
    .line 57
    iget-object v5, p0, Lcom/android/launcher3/util/j0;->b:[Lcom/android/launcher3/util/j0$b;

    .line 58
    .line 59
    iget v6, p0, Lcom/android/launcher3/util/j0;->c:I

    .line 60
    .line 61
    array-length v7, v5

    .line 62
    add-int/2addr v6, v7

    .line 63
    sub-int/2addr v6, v4

    .line 64
    sub-int/2addr v6, v0

    .line 65
    array-length v7, v5

    .line 66
    rem-int/2addr v6, v7

    .line 67
    aget-object v5, v5, v6

    .line 68
    .line 69
    if-nez v5, :cond_0

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_0
    invoke-virtual {v5}, Lcom/android/launcher3/util/j0$b;->d()J

    .line 73
    .line 74
    .line 75
    move-result-wide v6

    .line 76
    invoke-virtual {v2, v6, v7}, Ljava/util/Date;->setTime(J)V

    .line 77
    .line 78
    .line 79
    new-instance v6, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v6, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v5}, Lcom/android/launcher3/util/j0$b;->b()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v7

    .line 95
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v5}, Lcom/android/launcher3/util/j0$b;->e()I

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    const-string v8, ": "

    .line 103
    .line 104
    if-eq v7, v0, :cond_4

    .line 105
    .line 106
    const/4 v9, 0x2

    .line 107
    if-eq v7, v9, :cond_3

    .line 108
    .line 109
    const/4 v8, 0x3

    .line 110
    if-eq v7, v8, :cond_2

    .line 111
    .line 112
    const/4 v8, 0x4

    .line 113
    if-eq v7, v8, :cond_1

    .line 114
    .line 115
    sget-object v7, Lh4/t;->a:Lh4/t;

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_1
    const-string v7, ": false"

    .line 119
    .line 120
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_2
    const-string v7, ": true"

    .line 125
    .line 126
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_3
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v5}, Lcom/android/launcher3/util/j0$b;->c()F

    .line 134
    .line 135
    .line 136
    move-result v7

    .line 137
    float-to-int v7, v7

    .line 138
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_4
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v5}, Lcom/android/launcher3/util/j0$b;->c()F

    .line 146
    .line 147
    .line 148
    move-result v7

    .line 149
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    :goto_1
    invoke-virtual {v5}, Lcom/android/launcher3/util/j0$b;->a()I

    .line 153
    .line 154
    .line 155
    move-result v7

    .line 156
    if-lez v7, :cond_5

    .line 157
    .line 158
    const-string v7, " & "

    .line 159
    .line 160
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v5}, Lcom/android/launcher3/util/j0$b;->a()I

    .line 164
    .line 165
    .line 166
    move-result v5

    .line 167
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    const-string v5, " similar events"

    .line 171
    .line 172
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    :cond_5
    invoke-virtual {p2, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    :goto_2
    add-int/2addr v4, v0

    .line 179
    goto :goto_0

    .line 180
    :cond_6
    return-void
.end method
