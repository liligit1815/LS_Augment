.class public final Ly3/d;
.super Ljava/lang/Object;
.source "MSDLPlayerImpl.kt"

# interfaces
.implements Ly3/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ly3/d$a;
    }
.end annotation


# static fields
.field public static final g:Ly3/d$a;

.field private static final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final b:Lx3/b;

.field private final c:Landroid/os/Vibrator;

.field private final d:Ljava/util/concurrent/Executor;

.field private final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lw3/e;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Lz3/c;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ly3/d$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ly3/d$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ly3/d;->g:Ly3/d$a;

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x2

    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x7

    .line 20
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/4 v3, 0x1

    .line 25
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    const/16 v4, 0x8

    .line 30
    .line 31
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sput-object v0, Ly3/d;->h:Ljava/util/List;

    .line 44
    .line 45
    return-void
.end method

.method public constructor <init>(Lx3/b;Landroid/os/Vibrator;Ljava/util/concurrent/Executor;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lx3/b;",
            "Landroid/os/Vibrator;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/Map<",
            "Lw3/e;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "repository"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "vibrator"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "executor"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "useHapticFallbackForToken"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ly3/d;->b:Lx3/b;

    .line 25
    .line 26
    iput-object p2, p0, Ly3/d;->c:Landroid/os/Vibrator;

    .line 27
    .line 28
    iput-object p3, p0, Ly3/d;->d:Ljava/util/concurrent/Executor;

    .line 29
    .line 30
    iput-object p4, p0, Ly3/d;->e:Ljava/util/Map;

    .line 31
    .line 32
    new-instance p1, Lz3/c;

    .line 33
    .line 34
    const/16 p2, 0x14

    .line 35
    .line 36
    invoke-direct {p1, p2}, Lz3/c;-><init>(I)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ly3/d;->f:Lz3/c;

    .line 40
    .line 41
    return-void
.end method

.method public static final synthetic c()Ljava/util/List;
    .locals 1

    .line 1
    sget-object v0, Ly3/d;->h:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic d(Ly3/d;)Landroid/os/Vibrator;
    .locals 0

    .line 1
    iget-object p0, p0, Ly3/d;->c:Landroid/os/Vibrator;

    .line 2
    .line 3
    return-object p0
.end method

.method private final f(Lw3/e;Ly3/b;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ly3/d;->b:Lx3/b;

    .line 2
    .line 3
    invoke-virtual {p1}, Lw3/e;->d()Lw3/d;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v0, v1}, Lx3/b;->a(Lw3/d;)Lx3/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ly3/d;->b:Lx3/b;

    .line 12
    .line 13
    invoke-virtual {p1}, Lw3/e;->f()Lw3/f;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v1, v2}, Lx3/b;->b(Lw3/f;)Lx3/d;

    .line 18
    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto/16 :goto_5

    .line 23
    .line 24
    :cond_0
    const/4 v1, 0x0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    move-object v0, v1

    .line 33
    :goto_0
    instance-of v2, v0, Lw3/b;

    .line 34
    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    check-cast v0, Lw3/b;

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    move-object v0, v1

    .line 41
    :goto_1
    iget-object v2, p0, Ly3/d;->e:Ljava/util/Map;

    .line 42
    .line 43
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_4

    .line 54
    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    invoke-virtual {v0}, Lw3/b;->a()Landroid/os/VibrationEffect;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    goto :goto_2

    .line 62
    :cond_3
    move-object v0, v1

    .line 63
    goto :goto_2

    .line 64
    :cond_4
    instance-of v2, p2, Ly3/b$a;

    .line 65
    .line 66
    if-eqz v2, :cond_5

    .line 67
    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    move-object v2, p2

    .line 71
    check-cast v2, Ly3/b$a;

    .line 72
    .line 73
    invoke-virtual {v2}, Ly3/b$a;->b()F

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    const/4 v3, 0x2

    .line 82
    invoke-static {v0, v2, v1, v3, v1}, Ly3/e;->b(Lw3/b;Ljava/lang/Float;Ljava/lang/Integer;ILjava/lang/Object;)Landroid/os/VibrationEffect;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    goto :goto_2

    .line 87
    :cond_5
    if-eqz v0, :cond_3

    .line 88
    .line 89
    const/4 v2, 0x3

    .line 90
    invoke-static {v0, v1, v1, v2, v1}, Ly3/e;->b(Lw3/b;Ljava/lang/Float;Ljava/lang/Integer;ILjava/lang/Object;)Landroid/os/VibrationEffect;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    :goto_2
    if-eqz v0, :cond_a

    .line 95
    .line 96
    iget-object v2, p0, Ly3/d;->c:Landroid/os/Vibrator;

    .line 97
    .line 98
    invoke-virtual {v2}, Landroid/os/Vibrator;->hasVibrator()Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-nez v2, :cond_6

    .line 103
    .line 104
    goto :goto_5

    .line 105
    :cond_6
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 106
    .line 107
    const/16 v3, 0x21

    .line 108
    .line 109
    if-lt v2, v3, :cond_9

    .line 110
    .line 111
    if-eqz p2, :cond_7

    .line 112
    .line 113
    invoke-interface {p2}, Ly3/b;->a()Landroid/os/VibrationAttributes;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    :cond_7
    if-eqz v1, :cond_8

    .line 118
    .line 119
    invoke-interface {p2}, Ly3/b;->a()Landroid/os/VibrationAttributes;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    goto :goto_3

    .line 124
    :cond_8
    new-instance v1, Landroid/os/VibrationAttributes$Builder;

    .line 125
    .line 126
    invoke-direct {v1}, Landroid/os/VibrationAttributes$Builder;-><init>()V

    .line 127
    .line 128
    .line 129
    const/16 v2, 0x12

    .line 130
    .line 131
    invoke-virtual {v1, v2}, Landroid/os/VibrationAttributes$Builder;->setUsage(I)Landroid/os/VibrationAttributes$Builder;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v1}, Landroid/os/VibrationAttributes$Builder;->build()Landroid/os/VibrationAttributes;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    :goto_3
    iget-object v2, p0, Ly3/d;->d:Ljava/util/concurrent/Executor;

    .line 143
    .line 144
    new-instance v3, Ly3/d$b;

    .line 145
    .line 146
    invoke-direct {v3, p0, v0, v1}, Ly3/d$b;-><init>(Ly3/d;Landroid/os/VibrationEffect;Landroid/os/VibrationAttributes;)V

    .line 147
    .line 148
    .line 149
    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 150
    .line 151
    .line 152
    goto :goto_4

    .line 153
    :cond_9
    iget-object v1, p0, Ly3/d;->d:Ljava/util/concurrent/Executor;

    .line 154
    .line 155
    new-instance v2, Ly3/d$c;

    .line 156
    .line 157
    invoke-direct {v2, p0, v0}, Ly3/d$c;-><init>(Ly3/d;Landroid/os/VibrationEffect;)V

    .line 158
    .line 159
    .line 160
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 161
    .line 162
    .line 163
    :goto_4
    iget-object p0, p0, Ly3/d;->f:Lz3/c;

    .line 164
    .line 165
    new-instance v0, Lz3/a;

    .line 166
    .line 167
    invoke-direct {v0, p1, p2}, Lz3/a;-><init>(Lw3/e;Ly3/b;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0, v0}, Lz3/c;->a(Lz3/a;)V

    .line 171
    .line 172
    .line 173
    :cond_a
    :goto_5
    return-void
.end method


# virtual methods
.method public a(Lw3/e;Ly3/b;)V
    .locals 2

    .line 1
    const-string v0, "token"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ly3/d;->e()Lw3/a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1}, Lw3/e;->e()Lw3/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-gez v0, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-direct {p0, p1, p2}, Ly3/d;->f(Lw3/e;Ly3/b;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lz3/a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ly3/d;->f:Lz3/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lz3/c;->b()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e()Lw3/a;
    .locals 0

    .line 1
    sget-object p0, Ly3/c;->a:Ly3/c$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ly3/c$a;->c()Lw3/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Ly3/d;->c:Landroid/os/Vibrator;

    .line 2
    .line 3
    iget-object p0, p0, Ly3/d;->b:Lx3/b;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "\n            Default MSDL player implementation.\n            Vibrator: "

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, "\n            Repository: "

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p0, "\n        "

    .line 27
    .line 28
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0}, LD4/g;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method
