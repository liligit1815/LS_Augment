.class public final enum LM4/a$d;
.super Ljava/lang/Enum;
.source "CoroutineScheduler.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LM4/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LM4/a$d;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:LM4/a$d;

.field public static final enum h:LM4/a$d;

.field public static final enum i:LM4/a$d;

.field public static final enum j:LM4/a$d;

.field public static final enum k:LM4/a$d;

.field private static final synthetic l:[LM4/a$d;

.field private static final synthetic m:Ln4/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LM4/a$d;

    .line 2
    .line 3
    const-string v1, "CPU_ACQUIRED"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LM4/a$d;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LM4/a$d;->g:LM4/a$d;

    .line 10
    .line 11
    new-instance v0, LM4/a$d;

    .line 12
    .line 13
    const-string v1, "BLOCKING"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LM4/a$d;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LM4/a$d;->h:LM4/a$d;

    .line 20
    .line 21
    new-instance v0, LM4/a$d;

    .line 22
    .line 23
    const-string v1, "PARKING"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, LM4/a$d;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LM4/a$d;->i:LM4/a$d;

    .line 30
    .line 31
    new-instance v0, LM4/a$d;

    .line 32
    .line 33
    const-string v1, "DORMANT"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, LM4/a$d;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, LM4/a$d;->j:LM4/a$d;

    .line 40
    .line 41
    new-instance v0, LM4/a$d;

    .line 42
    .line 43
    const-string v1, "TERMINATED"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, LM4/a$d;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, LM4/a$d;->k:LM4/a$d;

    .line 50
    .line 51
    invoke-static {}, LM4/a$d;->a()[LM4/a$d;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, LM4/a$d;->l:[LM4/a$d;

    .line 56
    .line 57
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, LM4/a$d;->m:Ln4/a;

    .line 62
    .line 63
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final synthetic a()[LM4/a$d;
    .locals 5

    .line 1
    sget-object v0, LM4/a$d;->g:LM4/a$d;

    .line 2
    .line 3
    sget-object v1, LM4/a$d;->h:LM4/a$d;

    .line 4
    .line 5
    sget-object v2, LM4/a$d;->i:LM4/a$d;

    .line 6
    .line 7
    sget-object v3, LM4/a$d;->j:LM4/a$d;

    .line 8
    .line 9
    sget-object v4, LM4/a$d;->k:LM4/a$d;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [LM4/a$d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LM4/a$d;
    .locals 1

    .line 1
    const-class v0, LM4/a$d;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LM4/a$d;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LM4/a$d;
    .locals 1

    .line 1
    sget-object v0, LM4/a$d;->l:[LM4/a$d;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LM4/a$d;

    .line 8
    .line 9
    return-object v0
.end method
