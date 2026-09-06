.class public final LM0/b;
.super Lcom/google/protobuf/y;
.source "FrameData.java"

# interfaces
.implements Lcom/google/protobuf/U;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LM0/b$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y<",
        "LM0/b;",
        "LM0/b$b;",
        ">;",
        "Lcom/google/protobuf/U;"
    }
.end annotation


# static fields
.field private static final j:LM0/b;

.field private static volatile k:Lcom/google/protobuf/c0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/c0<",
            "LM0/b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private g:I

.field private h:J

.field private i:LM0/c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LM0/b;

    .line 2
    .line 3
    invoke-direct {v0}, LM0/b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LM0/b;->j:LM0/b;

    .line 7
    .line 8
    const-class v1, LM0/b;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/protobuf/y;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/y;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/y;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic a()LM0/b;
    .locals 1

    .line 1
    sget-object v0, LM0/b;->j:LM0/b;

    .line 2
    .line 3
    return-object v0
.end method

.method static synthetic b(LM0/b;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LM0/b;->f(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic c(LM0/b;LM0/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/b;->e(LM0/c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d()LM0/b$b;
    .locals 1

    .line 1
    sget-object v0, LM0/b;->j:LM0/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/y;->createBuilder()Lcom/google/protobuf/y$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LM0/b$b;

    .line 8
    .line 9
    return-object v0
.end method

.method private e(LM0/c;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LM0/b;->i:LM0/c;

    .line 5
    .line 6
    iget p1, p0, LM0/b;->g:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x2

    .line 9
    .line 10
    iput p1, p0, LM0/b;->g:I

    .line 11
    .line 12
    return-void
.end method

.method private f(J)V
    .locals 1

    .line 1
    iget v0, p0, LM0/b;->g:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, LM0/b;->g:I

    .line 6
    .line 7
    iput-wide p1, p0, LM0/b;->h:J

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/y$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    sget-object p0, LM0/b$a;->a:[I

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
    sget-object p0, LM0/b;->k:Lcom/google/protobuf/c0;

    .line 27
    .line 28
    if-nez p0, :cond_1

    .line 29
    .line 30
    const-class p1, LM0/b;

    .line 31
    .line 32
    monitor-enter p1

    .line 33
    :try_start_0
    sget-object p0, LM0/b;->k:Lcom/google/protobuf/c0;

    .line 34
    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    new-instance p0, Lcom/google/protobuf/y$b;

    .line 38
    .line 39
    sget-object p2, LM0/b;->j:LM0/b;

    .line 40
    .line 41
    invoke-direct {p0, p2}, Lcom/google/protobuf/y$b;-><init>(Lcom/google/protobuf/y;)V

    .line 42
    .line 43
    .line 44
    sput-object p0, LM0/b;->k:Lcom/google/protobuf/c0;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    :goto_0
    monitor-exit p1

    .line 50
    return-object p0

    .line 51
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw p0

    .line 53
    :cond_1
    return-object p0

    .line 54
    :pswitch_3
    sget-object p0, LM0/b;->j:LM0/b;

    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_4
    const-string p0, "bitField0_"

    .line 58
    .line 59
    const-string p1, "timestamp_"

    .line 60
    .line 61
    const-string p2, "node_"

    .line 62
    .line 63
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u1002\u0000\u0002\u1009\u0001"

    .line 68
    .line 69
    sget-object p2, LM0/b;->j:LM0/b;

    .line 70
    .line 71
    invoke-static {p2, p1, p0}, Lcom/google/protobuf/y;->newMessageInfo(Lcom/google/protobuf/T;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :pswitch_5
    new-instance p0, LM0/b$b;

    .line 77
    .line 78
    invoke-direct {p0, p1}, LM0/b$b;-><init>(LM0/b$a;)V

    .line 79
    .line 80
    .line 81
    return-object p0

    .line 82
    :pswitch_6
    new-instance p0, LM0/b;

    .line 83
    .line 84
    invoke-direct {p0}, LM0/b;-><init>()V

    .line 85
    .line 86
    .line 87
    return-object p0

    .line 88
    nop

    .line 89
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
