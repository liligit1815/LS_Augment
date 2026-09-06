.class public LW4/d;
.super Ljava/lang/Object;
.source "RxRingBuffer.java"

# interfaces
.implements Lrx/i;


# static fields
.field private static final g:LU4/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LU4/b<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field static h:I

.field public static final i:I

.field public static j:LW4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LW4/a<",
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field public static k:LW4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LW4/a<",
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    invoke-static {}, LU4/b;->b()LU4/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, LW4/d;->g:LU4/b;

    .line 6
    .line 7
    const/16 v0, 0x80

    .line 8
    .line 9
    sput v0, LW4/d;->h:I

    .line 10
    .line 11
    invoke-static {}, LW4/b;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/16 v0, 0x10

    .line 18
    .line 19
    sput v0, LW4/d;->h:I

    .line 20
    .line 21
    :cond_0
    const-string v0, "rx.ring-buffer.size"

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    sput v1, LW4/d;->h:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catch_0
    move-exception v1

    .line 37
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 38
    .line 39
    new-instance v3, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v4, "Failed to set \'rx.buffer.size\' with value "

    .line 45
    .line 46
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, " => "

    .line 53
    .line 54
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    :goto_0
    sget v0, LW4/d;->h:I

    .line 72
    .line 73
    sput v0, LW4/d;->i:I

    .line 74
    .line 75
    new-instance v0, LW4/d$a;

    .line 76
    .line 77
    invoke-direct {v0}, LW4/d$a;-><init>()V

    .line 78
    .line 79
    .line 80
    sput-object v0, LW4/d;->j:LW4/a;

    .line 81
    .line 82
    new-instance v0, LW4/d$b;

    .line 83
    .line 84
    invoke-direct {v0}, LW4/d$b;-><init>()V

    .line 85
    .line 86
    .line 87
    sput-object v0, LW4/d;->k:LW4/a;

    .line 88
    .line 89
    return-void
.end method
