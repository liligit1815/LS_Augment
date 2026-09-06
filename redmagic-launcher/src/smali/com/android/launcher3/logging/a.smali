.class public Lcom/android/launcher3/logging/a;
.super Ljava/lang/Object;
.source "ColdRebootStartupLatencyLogger.kt"

# interfaces
.implements Lcom/android/launcher3/logging/h;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/logging/a$a;
    }
.end annotation


# static fields
.field public static final h:Lcom/android/launcher3/logging/a$a;


# instance fields
.field private final b:Landroid/util/SparseLongArray;

.field private final c:Landroid/util/SparseLongArray;

.field private d:I

.field private e:J

.field private f:Z

.field private g:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/logging/a$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/logging/a$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/logging/a;->h:Lcom/android/launcher3/logging/a$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/SparseLongArray;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/SparseLongArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/logging/a;->b:Landroid/util/SparseLongArray;

    .line 10
    .line 11
    new-instance v0, Landroid/util/SparseLongArray;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/util/SparseLongArray;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/logging/a;->c:Landroid/util/SparseLongArray;

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lcom/android/launcher3/logging/a;->d:I

    .line 20
    .line 21
    const-wide/16 v0, -0x1

    .line 22
    .line 23
    iput-wide v0, p0, Lcom/android/launcher3/logging/a;->e:J

    .line 24
    .line 25
    return-void
.end method

.method private final n(Lcom/android/launcher3/logging/StatsLogManager$f;)V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/logging/a;->e:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-nez v4, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v4, Lcom/android/launcher3/logging/StatsLogManager$f;->k:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 11
    .line 12
    if-ne p1, v4, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/logging/a;->k(Lcom/android/launcher3/logging/StatsLogManager$f;J)Lcom/android/launcher3/logging/a;

    .line 15
    .line 16
    .line 17
    iput-wide v2, p0, Lcom/android/launcher3/logging/a;->e:J

    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method private final o(Lcom/android/launcher3/logging/StatsLogManager$f;)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/logging/a;->g:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/logging/a;->b:Landroid/util/SparseLongArray;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager$f;->getId()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {v0, v2}, Landroid/util/SparseLongArray;->indexOfKey(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v2, "Cannot end "

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    const-string v4, "ColdRebootStartupLatencyLogger"

    .line 21
    .line 22
    if-ltz v0, :cond_3

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/logging/a;->c:Landroid/util/SparseLongArray;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager$f;->getId()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    invoke-virtual {v0, v5}, Landroid/util/SparseLongArray;->indexOfKey(I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-ltz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v0, "Cannot end same "

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p0, " event again"

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    return v3

    .line 66
    :cond_1
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$f;->h:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 67
    .line 68
    if-eq p1, v0, :cond_2

    .line 69
    .line 70
    iget-object p0, p0, Lcom/android/launcher3/logging/a;->c:Landroid/util/SparseLongArray;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager$f;->getId()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-virtual {p0, v0}, Landroid/util/SparseLongArray;->indexOfKey(I)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-ltz p0, :cond_2

    .line 81
    .line 82
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    new-instance p1, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string p0, " event after LAUNCHER_LATENCY_STARTUP_TOTAL_DURATION"

    .line 98
    .line 99
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    return v3

    .line 110
    :cond_2
    return v1

    .line 111
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    new-instance p1, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string p0, " event before starting it"

    .line 127
    .line 128
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    return v3
.end method

.method private final p(Lcom/android/launcher3/logging/StatsLogManager$f;)Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/logging/a;->g:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/logging/a;->b:Landroid/util/SparseLongArray;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager$f;->getId()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {v0, v2}, Landroid/util/SparseLongArray;->indexOfKey(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x0

    .line 18
    const-string v3, "ColdRebootStartupLatencyLogger"

    .line 19
    .line 20
    if-ltz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance p1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v0, "Cannot restart same "

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p0, " event"

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    return v2

    .line 52
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/logging/a;->b:Landroid/util/SparseLongArray;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/util/SparseLongArray;->size()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_2

    .line 59
    .line 60
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$f;->h:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 61
    .line 62
    if-eq p1, p0, :cond_2

    .line 63
    .line 64
    const-string p0, "The first log start event must be LAUNCHER_LATENCY_STARTUP_TOTAL_DURATION."

    .line 65
    .line 66
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    return v2

    .line 70
    :cond_2
    return v1
.end method


# virtual methods
.method public bridge synthetic a(Lcom/android/launcher3/logging/StatsLogManager$f;)Lcom/android/launcher3/logging/h;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/logging/a;->j(Lcom/android/launcher3/logging/StatsLogManager$f;)Lcom/android/launcher3/logging/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic b()Lcom/android/launcher3/logging/h;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/logging/a;->l()Lcom/android/launcher3/logging/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic c(Lcom/android/launcher3/logging/StatsLogManager$f;)Lcom/android/launcher3/logging/h;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/logging/a;->h(Lcom/android/launcher3/logging/StatsLogManager$f;)Lcom/android/launcher3/logging/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic d(I)Lcom/android/launcher3/logging/h;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/logging/a;->g(I)Lcom/android/launcher3/logging/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic e()Lcom/android/launcher3/logging/h;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/logging/a;->f()Lcom/android/launcher3/logging/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f()Lcom/android/launcher3/logging/a;
    .locals 0

    .line 1
    return-object p0
.end method

.method public g(I)Lcom/android/launcher3/logging/a;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/logging/a;->f:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    iput p1, p0, Lcom/android/launcher3/logging/a;->d:I

    .line 10
    .line 11
    return-object p0
.end method

.method public h(Lcom/android/launcher3/logging/StatsLogManager$f;)Lcom/android/launcher3/logging/a;
    .locals 2

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/logging/a;->i(Lcom/android/launcher3/logging/StatsLogManager$f;J)Lcom/android/launcher3/logging/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public i(Lcom/android/launcher3/logging/StatsLogManager$f;J)Lcom/android/launcher3/logging/a;
    .locals 1

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/launcher3/logging/a;->f:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/logging/a;->n(Lcom/android/launcher3/logging/StatsLogManager$f;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, p1}, Lcom/android/launcher3/logging/a;->o(Lcom/android/launcher3/logging/StatsLogManager$f;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/logging/a;->c:Landroid/util/SparseLongArray;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager$f;->getId()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {v0, p1, p2, p3}, Landroid/util/SparseLongArray;->put(IJ)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-object p0
.end method

.method public j(Lcom/android/launcher3/logging/StatsLogManager$f;)Lcom/android/launcher3/logging/a;
    .locals 2

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/logging/a;->k(Lcom/android/launcher3/logging/StatsLogManager$f;J)Lcom/android/launcher3/logging/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public k(Lcom/android/launcher3/logging/StatsLogManager$f;J)Lcom/android/launcher3/logging/a;
    .locals 1

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/launcher3/logging/a;->f:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/logging/a;->p(Lcom/android/launcher3/logging/StatsLogManager$f;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/logging/a;->b:Landroid/util/SparseLongArray;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager$f;->getId()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {v0, p1, p2, p3}, Landroid/util/SparseLongArray;->put(IJ)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-object p0
.end method

.method public l()Lcom/android/launcher3/logging/a;
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/logging/a;->m(J)Lcom/android/launcher3/logging/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final m(J)Lcom/android/launcher3/logging/a;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/logging/a;->f:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    iput-wide p1, p0, Lcom/android/launcher3/logging/a;->e:J

    .line 10
    .line 11
    return-object p0
.end method

.method public reset()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/logging/a;->b:Landroid/util/SparseLongArray;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/util/SparseLongArray;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/logging/a;->c:Landroid/util/SparseLongArray;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/util/SparseLongArray;->clear()V

    .line 12
    .line 13
    .line 14
    const/4 v0, -0x1

    .line 15
    iput v0, p0, Lcom/android/launcher3/logging/a;->d:I

    .line 16
    .line 17
    const-wide/16 v0, -0x1

    .line 18
    .line 19
    iput-wide v0, p0, Lcom/android/launcher3/logging/a;->e:J

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Lcom/android/launcher3/logging/a;->f:Z

    .line 23
    .line 24
    return-void
.end method
