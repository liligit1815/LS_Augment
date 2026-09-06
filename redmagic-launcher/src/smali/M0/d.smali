.class public final LM0/d;
.super Lcom/google/protobuf/y;
.source "WindowData.java"

# interfaces
.implements Lcom/google/protobuf/U;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LM0/d$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y<",
        "LM0/d;",
        "LM0/d$b;",
        ">;",
        "Lcom/google/protobuf/U;"
    }
.end annotation


# static fields
.field private static final j:LM0/d;

.field private static volatile k:Lcom/google/protobuf/c0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/c0<",
            "LM0/d;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private g:I

.field private h:Lcom/google/protobuf/A$j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/A$j<",
            "LM0/b;",
            ">;"
        }
    .end annotation
.end field

.field private i:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LM0/d;

    .line 2
    .line 3
    invoke-direct {v0}, LM0/d;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LM0/d;->j:LM0/d;

    .line 7
    .line 8
    const-class v1, LM0/d;

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
    iput-object v0, p0, LM0/d;->h:Lcom/google/protobuf/A$j;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, LM0/d;->i:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method static synthetic a()LM0/d;
    .locals 1

    .line 1
    sget-object v0, LM0/d;->j:LM0/d;

    .line 2
    .line 3
    return-object v0
.end method

.method static synthetic b(LM0/d;LM0/b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/d;->d(LM0/b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic c(LM0/d;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LM0/d;->setTitle(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private d(LM0/b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, LM0/d;->e()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, LM0/d;->h:Lcom/google/protobuf/A$j;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private e()V
    .locals 2

    .line 1
    iget-object v0, p0, LM0/d;->h:Lcom/google/protobuf/A$j;

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
    iput-object v0, p0, LM0/d;->h:Lcom/google/protobuf/A$j;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static f()LM0/d$b;
    .locals 1

    .line 1
    sget-object v0, LM0/d;->j:LM0/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/y;->createBuilder()Lcom/google/protobuf/y$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LM0/d$b;

    .line 8
    .line 9
    return-object v0
.end method

.method private setTitle(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, LM0/d;->g:I

    .line 5
    .line 6
    or-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    iput v0, p0, LM0/d;->g:I

    .line 9
    .line 10
    iput-object p1, p0, LM0/d;->i:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/y$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    sget-object p0, LM0/d$a;->a:[I

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
    sget-object p0, LM0/d;->k:Lcom/google/protobuf/c0;

    .line 27
    .line 28
    if-nez p0, :cond_1

    .line 29
    .line 30
    const-class p1, LM0/d;

    .line 31
    .line 32
    monitor-enter p1

    .line 33
    :try_start_0
    sget-object p0, LM0/d;->k:Lcom/google/protobuf/c0;

    .line 34
    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    new-instance p0, Lcom/google/protobuf/y$b;

    .line 38
    .line 39
    sget-object p2, LM0/d;->j:LM0/d;

    .line 40
    .line 41
    invoke-direct {p0, p2}, Lcom/google/protobuf/y$b;-><init>(Lcom/google/protobuf/y;)V

    .line 42
    .line 43
    .line 44
    sput-object p0, LM0/d;->k:Lcom/google/protobuf/c0;

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
    sget-object p0, LM0/d;->j:LM0/d;

    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_4
    const-string p0, "bitField0_"

    .line 58
    .line 59
    const-string p1, "frameData_"

    .line 60
    .line 61
    const-class p2, LM0/b;

    .line 62
    .line 63
    const-string p3, "title_"

    .line 64
    .line 65
    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string p1, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u001b\u0002\u1008\u0000"

    .line 70
    .line 71
    sget-object p2, LM0/d;->j:LM0/d;

    .line 72
    .line 73
    invoke-static {p2, p1, p0}, Lcom/google/protobuf/y;->newMessageInfo(Lcom/google/protobuf/T;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0

    .line 78
    :pswitch_5
    new-instance p0, LM0/d$b;

    .line 79
    .line 80
    invoke-direct {p0, p1}, LM0/d$b;-><init>(LM0/d$a;)V

    .line 81
    .line 82
    .line 83
    return-object p0

    .line 84
    :pswitch_6
    new-instance p0, LM0/d;

    .line 85
    .line 86
    invoke-direct {p0}, LM0/d;-><init>()V

    .line 87
    .line 88
    .line 89
    return-object p0

    .line 90
    nop

    .line 91
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
