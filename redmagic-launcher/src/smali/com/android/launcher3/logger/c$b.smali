.class public final Lcom/android/launcher3/logger/c$b;
.super Lcom/google/protobuf/y;
.source "LauncherAtomExtensions.java"

# interfaces
.implements Lcom/google/protobuf/U;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logger/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/logger/c$b$b;,
        Lcom/android/launcher3/logger/c$b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/y<",
        "Lcom/android/launcher3/logger/c$b;",
        "Lcom/android/launcher3/logger/c$b$a;",
        ">;",
        "Lcom/google/protobuf/U;"
    }
.end annotation


# static fields
.field private static final j:Lcom/android/launcher3/logger/c$b;

.field private static volatile k:Lcom/google/protobuf/c0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/c0<",
            "Lcom/android/launcher3/logger/c$b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private g:Z

.field private h:Z

.field private i:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/logger/c$b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/logger/c$b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/logger/c$b;->j:Lcom/android/launcher3/logger/c$b;

    .line 7
    .line 8
    const-class v1, Lcom/android/launcher3/logger/c$b;

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

.method static bridge synthetic a()Lcom/android/launcher3/logger/c$b;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/logger/c$b;->j:Lcom/android/launcher3/logger/c$b;

    .line 2
    .line 3
    return-object v0
.end method

.method public static c()Lcom/android/launcher3/logger/c$b;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/logger/c$b;->j:Lcom/android/launcher3/logger/c$b;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/logger/c$b;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/logger/c$b;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method protected final dynamicMethod(Lcom/google/protobuf/y$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    sget-object p0, Lcom/android/launcher3/logger/b;->a:[I

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
    sget-object p0, Lcom/android/launcher3/logger/c$b;->k:Lcom/google/protobuf/c0;

    .line 27
    .line 28
    if-nez p0, :cond_1

    .line 29
    .line 30
    const-class p1, Lcom/android/launcher3/logger/c$b;

    .line 31
    .line 32
    monitor-enter p1

    .line 33
    :try_start_0
    sget-object p0, Lcom/android/launcher3/logger/c$b;->k:Lcom/google/protobuf/c0;

    .line 34
    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    new-instance p0, Lcom/google/protobuf/y$b;

    .line 38
    .line 39
    sget-object p2, Lcom/android/launcher3/logger/c$b;->j:Lcom/android/launcher3/logger/c$b;

    .line 40
    .line 41
    invoke-direct {p0, p2}, Lcom/google/protobuf/y$b;-><init>(Lcom/google/protobuf/y;)V

    .line 42
    .line 43
    .line 44
    sput-object p0, Lcom/android/launcher3/logger/c$b;->k:Lcom/google/protobuf/c0;

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
    sget-object p0, Lcom/android/launcher3/logger/c$b;->j:Lcom/android/launcher3/logger/c$b;

    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_4
    const-string p0, "bitField0_"

    .line 58
    .line 59
    const-string p1, "correctedQuery_"

    .line 60
    .line 61
    const-string p2, "directMatch_"

    .line 62
    .line 63
    const-string p3, "entryState_"

    .line 64
    .line 65
    invoke-static {}, Lcom/android/launcher3/logger/c$b$b;->d()Lcom/google/protobuf/A$e;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    filled-new-array {p0, p1, p2, p3, v0}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-string p1, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u1007\u0000\u0002\u1007\u0001\u0003\u100c\u0002"

    .line 74
    .line 75
    sget-object p2, Lcom/android/launcher3/logger/c$b;->j:Lcom/android/launcher3/logger/c$b;

    .line 76
    .line 77
    invoke-static {p2, p1, p0}, Lcom/google/protobuf/y;->newMessageInfo(Lcom/google/protobuf/T;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :pswitch_5
    new-instance p0, Lcom/android/launcher3/logger/c$b$a;

    .line 83
    .line 84
    invoke-direct {p0, p1}, Lcom/android/launcher3/logger/c$b$a;-><init>(Lcom/android/launcher3/logger/e;)V

    .line 85
    .line 86
    .line 87
    return-object p0

    .line 88
    :pswitch_6
    new-instance p0, Lcom/android/launcher3/logger/c$b;

    .line 89
    .line 90
    invoke-direct {p0}, Lcom/android/launcher3/logger/c$b;-><init>()V

    .line 91
    .line 92
    .line 93
    return-object p0

    .line 94
    nop

    .line 95
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

.method public e()Lcom/android/launcher3/logger/c$b$b;
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/logger/c$b;->i:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/logger/c$b$b;->c(I)Lcom/android/launcher3/logger/c$b$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/android/launcher3/logger/c$b$b;->h:Lcom/android/launcher3/logger/c$b$b;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method
