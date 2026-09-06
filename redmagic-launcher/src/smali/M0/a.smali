.class public final LM0/a;
.super Lcom/google/protobuf/y;
.source "ExportedData.java"

# interfaces
.implements Lcom/google/protobuf/U;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LM0/a$b;,
        LM0/a$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y<",
        "LM0/a;",
        "LM0/a$b;",
        ">;",
        "Lcom/google/protobuf/U;"
    }
.end annotation


# static fields
.field private static final m:LM0/a;

.field private static volatile n:Lcom/google/protobuf/c0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/c0<",
            "LM0/a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private g:I

.field private h:J

.field private i:Lcom/google/protobuf/A$j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/A$j<",
            "LM0/d;",
            ">;"
        }
    .end annotation
.end field

.field private j:Ljava/lang/String;

.field private k:Lcom/google/protobuf/A$j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/A$j<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private l:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LM0/a;

    .line 2
    .line 3
    invoke-direct {v0}, LM0/a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LM0/a;->m:LM0/a;

    .line 7
    .line 8
    const-class v1, LM0/a;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/protobuf/y;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/y;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/y;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/protobuf/y;->emptyProtobufList()Lcom/google/protobuf/A$j;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, LM0/a;->i:Lcom/google/protobuf/A$j;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, LM0/a;->j:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Lcom/google/protobuf/y;->emptyProtobufList()Lcom/google/protobuf/A$j;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, LM0/a;->k:Lcom/google/protobuf/A$j;

    .line 19
    .line 20
    return-void
.end method

.method static synthetic a()LM0/a;
    .locals 1

    .line 1
    sget-object v0, LM0/a;->m:LM0/a;

    .line 2
    .line 3
    return-object v0
.end method

.method static synthetic b(LM0/a;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LM0/a;->l(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic c(LM0/a;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/a;->g(Ljava/lang/Iterable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic d(LM0/a;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LM0/a;->n(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic e(LM0/a;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/a;->h(Ljava/lang/Iterable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic f(LM0/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/a;->m(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, LM0/a;->i()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, LM0/a;->k:Lcom/google/protobuf/A$j;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private h(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "LM0/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, LM0/a;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, LM0/a;->i:Lcom/google/protobuf/A$j;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private i()V
    .locals 2

    .line 1
    iget-object v0, p0, LM0/a;->k:Lcom/google/protobuf/A$j;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/A$j;->h()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Lcom/google/protobuf/y;->mutableCopy(Lcom/google/protobuf/A$j;)Lcom/google/protobuf/A$j;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, LM0/a;->k:Lcom/google/protobuf/A$j;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private j()V
    .locals 2

    .line 1
    iget-object v0, p0, LM0/a;->i:Lcom/google/protobuf/A$j;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/A$j;->h()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Lcom/google/protobuf/y;->mutableCopy(Lcom/google/protobuf/A$j;)Lcom/google/protobuf/A$j;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, LM0/a;->i:Lcom/google/protobuf/A$j;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static k()LM0/a$b;
    .locals 1

    .line 1
    sget-object v0, LM0/a;->m:LM0/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/y;->createBuilder()Lcom/google/protobuf/y$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LM0/a$b;

    .line 8
    .line 9
    return-object v0
.end method

.method private l(J)V
    .locals 1

    .line 1
    iget v0, p0, LM0/a;->g:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, LM0/a;->g:I

    .line 6
    .line 7
    iput-wide p1, p0, LM0/a;->h:J

    .line 8
    .line 9
    return-void
.end method

.method private m(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, LM0/a;->g:I

    .line 5
    .line 6
    or-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    iput v0, p0, LM0/a;->g:I

    .line 9
    .line 10
    iput-object p1, p0, LM0/a;->j:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method private n(J)V
    .locals 1

    .line 1
    iget v0, p0, LM0/a;->g:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    iput v0, p0, LM0/a;->g:I

    .line 6
    .line 7
    iput-wide p1, p0, LM0/a;->l:J

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/y$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    sget-object p0, LM0/a$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    packed-switch p0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 16
    .line 17
    .line 18
    throw p0

    .line 19
    :pswitch_0
    return-object p1

    .line 20
    :pswitch_1
    const/4 p0, 0x1

    .line 21
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :pswitch_2
    sget-object p0, LM0/a;->n:Lcom/google/protobuf/c0;

    .line 27
    .line 28
    if-nez p0, :cond_1

    .line 29
    .line 30
    const-class p1, LM0/a;

    .line 31
    .line 32
    monitor-enter p1

    .line 33
    :try_start_0
    sget-object p0, LM0/a;->n:Lcom/google/protobuf/c0;

    .line 34
    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    new-instance p0, Lcom/google/protobuf/y$b;

    .line 38
    .line 39
    sget-object p2, LM0/a;->m:LM0/a;

    .line 40
    .line 41
    invoke-direct {p0, p2}, Lcom/google/protobuf/y$b;-><init>(Lcom/google/protobuf/y;)V

    .line 42
    .line 43
    .line 44
    sput-object p0, LM0/a;->n:Lcom/google/protobuf/c0;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    move-object p0, v0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :goto_0
    monitor-exit p1

    .line 51
    return-object p0

    .line 52
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    throw p0

    .line 54
    :cond_1
    return-object p0

    .line 55
    :pswitch_3
    sget-object p0, LM0/a;->m:LM0/a;

    .line 56
    .line 57
    return-object p0

    .line 58
    :pswitch_4
    const-string v0, "bitField0_"

    .line 59
    .line 60
    const-string v1, "magicNumber_"

    .line 61
    .line 62
    const-string v2, "windowData_"

    .line 63
    .line 64
    const-class v3, LM0/d;

    .line 65
    .line 66
    const-string v4, "package_"

    .line 67
    .line 68
    const-string v5, "classname_"

    .line 69
    .line 70
    const-string v6, "realToElapsedTimeOffsetNanos_"

    .line 71
    .line 72
    filled-new-array/range {v0 .. v6}, [Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "\u0001\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0002\u0000\u0001\u1005\u0000\u0002\u001b\u0003\u1008\u0001\u0004\u001a\u0005\u1005\u0002"

    .line 77
    .line 78
    sget-object p2, LM0/a;->m:LM0/a;

    .line 79
    .line 80
    invoke-static {p2, p1, p0}, Lcom/google/protobuf/y;->newMessageInfo(Lcom/google/protobuf/T;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0

    .line 85
    :pswitch_5
    new-instance p0, LM0/a$b;

    .line 86
    .line 87
    invoke-direct {p0, p1}, LM0/a$b;-><init>(LM0/a$a;)V

    .line 88
    .line 89
    .line 90
    return-object p0

    .line 91
    :pswitch_6
    new-instance p0, LM0/a;

    .line 92
    .line 93
    invoke-direct {p0}, LM0/a;-><init>()V

    .line 94
    .line 95
    .line 96
    return-object p0

    .line 97
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
