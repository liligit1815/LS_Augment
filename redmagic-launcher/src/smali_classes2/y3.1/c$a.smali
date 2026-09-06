.class public final Ly3/c$a;
.super Ljava/lang/Object;
.source "MSDLPlayer.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ly3/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field static final synthetic a:Ly3/c$a;

.field private static b:Lw3/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ly3/c$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ly3/c$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ly3/c$a;->a:Ly3/c$a;

    .line 7
    .line 8
    sget-object v0, Lw3/a;->i:Lw3/a;

    .line 9
    .line 10
    sput-object v0, Ly3/c$a;->b:Lw3/a;

    .line 11
    .line 12
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final a(Landroid/os/Vibrator;Lx3/b;)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Vibrator;",
            "Lx3/b;",
            ")",
            "Ljava/util/Map<",
            "Lw3/e;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ly3/d;->g:Ly3/d$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ly3/d$a;->a()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 8
    .line 9
    const/16 v1, 0xa

    .line 10
    .line 11
    invoke-static {p0, v1}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v2}, Li4/F;->a(I)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/16 v3, 0x10

    .line 20
    .line 21
    invoke-static {v2, v3}, LA4/d;->c(II)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-direct {v0, v2}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    move-object v4, v2

    .line 43
    check-cast v4, Ljava/lang/Number;

    .line 44
    .line 45
    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    filled-new-array {v4}, [I

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {p1, v4}, Landroid/os/Vibrator;->arePrimitivesSupported([I)[Z

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-string v5, "arePrimitivesSupported(...)"

    .line 58
    .line 59
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v4}, Li4/g;->J([Z)Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    invoke-static {}, Lw3/e;->c()Ln4/a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 79
    .line 80
    invoke-static {p0, v1}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-static {v1}, Li4/F;->a(I)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-static {v1, v3}, LA4/d;->c(II)I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-direct {p1, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 93
    .line 94
    .line 95
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_4

    .line 104
    .line 105
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    move-object v2, v1

    .line 110
    check-cast v2, Lw3/e;

    .line 111
    .line 112
    invoke-virtual {v2}, Lw3/e;->d()Lw3/d;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-interface {p2, v2}, Lx3/b;->a(Lw3/d;)Lx3/a;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    const/4 v3, 0x0

    .line 121
    if-eqz v2, :cond_1

    .line 122
    .line 123
    invoke-interface {v2}, Lx3/a;->get()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    goto :goto_2

    .line 128
    :cond_1
    move-object v2, v3

    .line 129
    :goto_2
    instance-of v4, v2, Lw3/b;

    .line 130
    .line 131
    if-eqz v4, :cond_2

    .line 132
    .line 133
    move-object v3, v2

    .line 134
    check-cast v3, Lw3/b;

    .line 135
    .line 136
    :cond_2
    if-eqz v3, :cond_3

    .line 137
    .line 138
    invoke-static {v3, v0}, Ly3/f;->a(Lw3/b;Ljava/util/Map;)Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    goto :goto_3

    .line 143
    :cond_3
    const/4 v2, 0x0

    .line 144
    :goto_3
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_4
    return-object p1
.end method


# virtual methods
.method public final b(Landroid/os/Vibrator;Ljava/util/concurrent/Executor;Ljava/util/Map;)Ly3/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Vibrator;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/Map<",
            "Lw3/e;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ly3/c;"
        }
    .end annotation

    .line 1
    const-string v0, "executor"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const-string p0, "MSDLPlayer"

    .line 9
    .line 10
    const-string p1, "A null vibrator was used to create a MSDLPlayer. An empty player was created"

    .line 11
    .line 12
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    new-instance p0, Ly3/a;

    .line 16
    .line 17
    invoke-direct {p0}, Ly3/a;-><init>()V

    .line 18
    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    new-instance v0, Lx3/c;

    .line 22
    .line 23
    invoke-direct {v0}, Lx3/c;-><init>()V

    .line 24
    .line 25
    .line 26
    if-nez p3, :cond_1

    .line 27
    .line 28
    invoke-direct {p0, p1, v0}, Ly3/c$a;->a(Landroid/os/Vibrator;Lx3/b;)Ljava/util/Map;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    :cond_1
    new-instance p0, Ly3/d;

    .line 33
    .line 34
    invoke-direct {p0, v0, p1, p2, p3}, Ly3/d;-><init>(Lx3/b;Landroid/os/Vibrator;Ljava/util/concurrent/Executor;Ljava/util/Map;)V

    .line 35
    .line 36
    .line 37
    return-object p0
.end method

.method public final c()Lw3/a;
    .locals 0

    .line 1
    sget-object p0, Ly3/c$a;->b:Lw3/a;

    .line 2
    .line 3
    return-object p0
.end method
