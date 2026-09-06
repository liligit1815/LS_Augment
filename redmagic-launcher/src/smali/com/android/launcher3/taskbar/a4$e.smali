.class Lcom/android/launcher3/taskbar/a4$e;
.super Ljava/lang/Object;
.source "TaskbarStashController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/a4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "e"
.end annotation


# instance fields
.field private final a:Ljava/util/function/LongPredicate;

.field private b:Z

.field private c:I

.field private d:J

.field private e:J

.field final synthetic f:Lcom/android/launcher3/taskbar/a4;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/a4;Ljava/util/function/LongPredicate;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/android/launcher3/taskbar/a4$e;->c:I

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/android/launcher3/taskbar/a4$e;->e:J

    .line 12
    .line 13
    iput-object p2, p0, Lcom/android/launcher3/taskbar/a4$e;->a:Ljava/util/function/LongPredicate;

    .line 14
    .line 15
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/taskbar/a4$e;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/taskbar/a4$e;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private b(J)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 2
    .line 3
    const-wide/16 v1, 0x1

    .line 4
    .line 5
    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/launcher3/taskbar/a4;->x(Lcom/android/launcher3/taskbar/a4;JJ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 12
    .line 13
    invoke-static {p0, v1, v2}, Lcom/android/launcher3/taskbar/a4;->w(Lcom/android/launcher3/taskbar/a4;J)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "Home to App"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "App to Home"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 26
    .line 27
    const-wide/16 v1, 0x100

    .line 28
    .line 29
    invoke-static {v0, p1, p2, v1, v2}, Lcom/android/launcher3/taskbar/a4;->x(Lcom/android/launcher3/taskbar/a4;JJ)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 36
    .line 37
    invoke-static {p0, v1, v2}, Lcom/android/launcher3/taskbar/a4;->w(Lcom/android/launcher3/taskbar/a4;J)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    const-string p0, "Stashed in app"

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_2
    const-string p0, "Manually unstashed"

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_3
    const-string p0, ""

    .line 50
    .line 51
    return-object p0
.end method

.method private c(J)I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/a4;->p(Lcom/android/launcher3/taskbar/a4;)Lcom/android/launcher3/taskbar/R1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/o4;->t()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x2

    .line 14
    const-wide/16 v2, 0x1

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 19
    .line 20
    invoke-static {v0, p1, p2, v2, v3}, Lcom/android/launcher3/taskbar/a4;->x(Lcom/android/launcher3/taskbar/a4;JJ)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    return v1

    .line 27
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    iget-wide v6, p0, Lcom/android/launcher3/taskbar/a4$e;->e:J

    .line 32
    .line 33
    cmp-long v0, v4, v6

    .line 34
    .line 35
    if-gez v0, :cond_1

    .line 36
    .line 37
    return v1

    .line 38
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 39
    .line 40
    invoke-static {v0, p1, p2, v2, v3}, Lcom/android/launcher3/taskbar/a4;->x(Lcom/android/launcher3/taskbar/a4;JJ)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 47
    .line 48
    invoke-static {p0, v2, v3}, Lcom/android/launcher3/taskbar/a4;->w(Lcom/android/launcher3/taskbar/a4;J)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    const/4 p0, 0x1

    .line 55
    return p0

    .line 56
    :cond_2
    const/4 p0, 0x0

    .line 57
    return p0
.end method


# virtual methods
.method public d(JJ)Landroid/animation/Animator;
    .locals 14

    .line 1
    move-wide v0, p1

    .line 2
    invoke-static {}, Lcom/android/launcher3/y0;->F0()Z

    .line 3
    .line 4
    .line 5
    move-result v2

    .line 6
    if-eqz v2, :cond_0

    .line 7
    .line 8
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 9
    .line 10
    const-wide/32 v3, 0x10000

    .line 11
    .line 12
    .line 13
    invoke-static {v2, v3, v4}, Lcom/android/launcher3/taskbar/a4;->w(Lcom/android/launcher3/taskbar/a4;J)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 20
    .line 21
    const-wide/16 v3, 0x1

    .line 22
    .line 23
    invoke-static {v2, v0, v1, v3, v4}, Lcom/android/launcher3/taskbar/a4;->x(Lcom/android/launcher3/taskbar/a4;JJ)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    const-wide/16 v2, -0x2

    .line 30
    .line 31
    and-long/2addr v0, v2

    .line 32
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4$e;->a:Ljava/util/function/LongPredicate;

    .line 33
    .line 34
    invoke-interface {v2, v0, v1}, Ljava/util/function/LongPredicate;->test(J)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    iget-wide v3, p0, Lcom/android/launcher3/taskbar/a4$e;->d:J

    .line 39
    .line 40
    xor-long v5, v3, v0

    .line 41
    .line 42
    cmp-long v3, v3, v0

    .line 43
    .line 44
    if-eqz v3, :cond_1

    .line 45
    .line 46
    iget-object v3, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 47
    .line 48
    invoke-static {v3, v5, v6}, Lcom/android/launcher3/taskbar/a4;->z(Lcom/android/launcher3/taskbar/a4;J)V

    .line 49
    .line 50
    .line 51
    iput-wide v0, p0, Lcom/android/launcher3/taskbar/a4$e;->d:J

    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 54
    .line 55
    const-wide/16 v3, 0x400

    .line 56
    .line 57
    invoke-static {v0, v5, v6, v3, v4}, Lcom/android/launcher3/taskbar/a4;->x(Lcom/android/launcher3/taskbar/a4;JJ)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 64
    .line 65
    invoke-static {v0, v3, v4}, Lcom/android/launcher3/taskbar/a4;->w(Lcom/android/launcher3/taskbar/a4;J)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    const-wide/16 v3, 0xc8

    .line 76
    .line 77
    add-long/2addr v0, v3

    .line 78
    iput-wide v0, p0, Lcom/android/launcher3/taskbar/a4$e;->e:J

    .line 79
    .line 80
    :cond_2
    invoke-direct {p0, v5, v6}, Lcom/android/launcher3/taskbar/a4$e;->c(J)I

    .line 81
    .line 82
    .line 83
    move-result v11

    .line 84
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/android/launcher3/taskbar/a4;->o(Lcom/android/launcher3/taskbar/a4;)Landroid/animation/AnimatorSet;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const/4 v1, 0x0

    .line 91
    const/4 v3, 0x1

    .line 92
    if-eqz v0, :cond_3

    .line 93
    .line 94
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 95
    .line 96
    invoke-static {v0}, Lcom/android/launcher3/taskbar/a4;->o(Lcom/android/launcher3/taskbar/a4;)Landroid/animation/AnimatorSet;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_3

    .line 105
    .line 106
    iget v0, p0, Lcom/android/launcher3/taskbar/a4$e;->c:I

    .line 107
    .line 108
    if-nez v0, :cond_3

    .line 109
    .line 110
    if-eqz v11, :cond_3

    .line 111
    .line 112
    move v0, v3

    .line 113
    goto :goto_0

    .line 114
    :cond_3
    move v0, v1

    .line 115
    :goto_0
    if-eqz v0, :cond_4

    .line 116
    .line 117
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/a4$e;->b:Z

    .line 118
    .line 119
    if-nez v4, :cond_4

    .line 120
    .line 121
    if-nez v2, :cond_4

    .line 122
    .line 123
    if-ne v11, v3, :cond_4

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_4
    move v1, v0

    .line 127
    :goto_1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/a4$e;->b:Z

    .line 128
    .line 129
    if-ne v0, v2, :cond_6

    .line 130
    .line 131
    if-eqz v1, :cond_5

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_5
    const/4 p0, 0x0

    .line 135
    return-object p0

    .line 136
    :cond_6
    :goto_2
    iput-boolean v2, p0, Lcom/android/launcher3/taskbar/a4$e;->b:Z

    .line 137
    .line 138
    iput v11, p0, Lcom/android/launcher3/taskbar/a4$e;->c:I

    .line 139
    .line 140
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 141
    .line 142
    const-wide/16 v1, 0x1000

    .line 143
    .line 144
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/taskbar/a4;->w(Lcom/android/launcher3/taskbar/a4;J)Z

    .line 145
    .line 146
    .line 147
    move-result v12

    .line 148
    iget-object v7, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 149
    .line 150
    iget-boolean v8, p0, Lcom/android/launcher3/taskbar/a4$e;->b:Z

    .line 151
    .line 152
    invoke-direct {p0, v5, v6}, Lcom/android/launcher3/taskbar/a4$e;->b(J)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v13

    .line 156
    move-wide/from16 v9, p3

    .line 157
    .line 158
    invoke-static/range {v7 .. v13}, Lcom/android/launcher3/taskbar/a4;->v(Lcom/android/launcher3/taskbar/a4;ZJIZLjava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4$e;->f:Lcom/android/launcher3/taskbar/a4;

    .line 162
    .line 163
    invoke-static {p0}, Lcom/android/launcher3/taskbar/a4;->o(Lcom/android/launcher3/taskbar/a4;)Landroid/animation/AnimatorSet;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    return-object p0
.end method
