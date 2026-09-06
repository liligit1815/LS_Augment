.class public final enum Li1/a$a;
.super Ljava/lang/Enum;
.source "TestEventEmitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Li1/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Li1/a$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:Li1/a$a;

.field public static final enum h:Li1/a$a;

.field public static final enum i:Li1/a$a;

.field public static final enum j:Li1/a$a;

.field public static final enum k:Li1/a$a;

.field public static final enum l:Li1/a$a;

.field public static final enum m:Li1/a$a;

.field private static final synthetic n:[Li1/a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Li1/a$a;

    .line 2
    .line 3
    const-string v1, "LAUNCHER_ON_CREATE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v1}, Li1/a$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Li1/a$a;->g:Li1/a$a;

    .line 10
    .line 11
    new-instance v0, Li1/a$a;

    .line 12
    .line 13
    const-string v1, "WORKSPACE_ON_DROP"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v1}, Li1/a$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Li1/a$a;->h:Li1/a$a;

    .line 20
    .line 21
    new-instance v0, Li1/a$a;

    .line 22
    .line 23
    const-string v1, "RESIZE_FRAME_SHOWING"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v1}, Li1/a$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Li1/a$a;->i:Li1/a$a;

    .line 30
    .line 31
    new-instance v0, Li1/a$a;

    .line 32
    .line 33
    const-string v1, "WORKSPACE_FINISH_LOADING"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2, v1}, Li1/a$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Li1/a$a;->j:Li1/a$a;

    .line 40
    .line 41
    new-instance v0, Li1/a$a;

    .line 42
    .line 43
    const-string v1, "SPRING_LOADED_STATE_STARTED"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2, v1}, Li1/a$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Li1/a$a;->k:Li1/a$a;

    .line 50
    .line 51
    new-instance v0, Li1/a$a;

    .line 52
    .line 53
    const-string v1, "SPRING_LOADED_STATE_COMPLETED"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2, v1}, Li1/a$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Li1/a$a;->l:Li1/a$a;

    .line 60
    .line 61
    new-instance v0, Li1/a$a;

    .line 62
    .line 63
    const-string v1, "LAUNCHER_STATE_COMPLETED"

    .line 64
    .line 65
    const/4 v2, 0x6

    .line 66
    invoke-direct {v0, v1, v2, v1}, Li1/a$a;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Li1/a$a;->m:Li1/a$a;

    .line 70
    .line 71
    invoke-static {}, Li1/a$a;->a()[Li1/a$a;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, Li1/a$a;->n:[Li1/a$a;

    .line 76
    .line 77
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static synthetic a()[Li1/a$a;
    .locals 7

    .line 1
    sget-object v0, Li1/a$a;->g:Li1/a$a;

    .line 2
    .line 3
    sget-object v1, Li1/a$a;->h:Li1/a$a;

    .line 4
    .line 5
    sget-object v2, Li1/a$a;->i:Li1/a$a;

    .line 6
    .line 7
    sget-object v3, Li1/a$a;->j:Li1/a$a;

    .line 8
    .line 9
    sget-object v4, Li1/a$a;->k:Li1/a$a;

    .line 10
    .line 11
    sget-object v5, Li1/a$a;->l:Li1/a$a;

    .line 12
    .line 13
    sget-object v6, Li1/a$a;->m:Li1/a$a;

    .line 14
    .line 15
    filled-new-array/range {v0 .. v6}, [Li1/a$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Li1/a$a;
    .locals 1

    .line 1
    const-class v0, Li1/a$a;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Li1/a$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Li1/a$a;
    .locals 1

    .line 1
    sget-object v0, Li1/a$a;->n:[Li1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, [Li1/a$a;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Li1/a$a;

    .line 8
    .line 9
    return-object v0
.end method
