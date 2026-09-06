.class public final enum Lj1/i$a;
.super Ljava/lang/Enum;
.source "DesktopAppLaunchTransition.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lj1/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lj1/i$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum i:Lj1/i$a;

.field public static final enum j:Lj1/i$a;

.field private static final synthetic k:[Lj1/i$a;

.field private static final synthetic l:Ln4/a;


# instance fields
.field private final g:LM2/l$a;

.field private final h:J


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lj1/i$a;

    .line 2
    .line 3
    invoke-static {}, Lj1/i;->u2()LM2/l$a;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    const-wide/16 v4, 0xc8

    .line 8
    .line 9
    const-string v1, "LAUNCH"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct/range {v0 .. v5}, Lj1/i$a;-><init>(Ljava/lang/String;ILM2/l$a;J)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lj1/i$a;->i:Lj1/i$a;

    .line 16
    .line 17
    new-instance v1, Lj1/i$a;

    .line 18
    .line 19
    invoke-static {}, Lj1/i;->v2()LM2/l$a;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    const-wide/16 v5, 0x64

    .line 24
    .line 25
    const-string v2, "UNMINIMIZE"

    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    invoke-direct/range {v1 .. v6}, Lj1/i$a;-><init>(Ljava/lang/String;ILM2/l$a;J)V

    .line 29
    .line 30
    .line 31
    sput-object v1, Lj1/i$a;->j:Lj1/i$a;

    .line 32
    .line 33
    invoke-static {}, Lj1/i$a;->a()[Lj1/i$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sput-object v0, Lj1/i$a;->k:[Lj1/i$a;

    .line 38
    .line 39
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sput-object v0, Lj1/i$a;->l:Ln4/a;

    .line 44
    .line 45
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILM2/l$a;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LM2/l$a;",
            "J)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lj1/i$a;->g:LM2/l$a;

    .line 5
    .line 6
    iput-wide p4, p0, Lj1/i$a;->h:J

    .line 7
    .line 8
    return-void
.end method

.method private static final synthetic a()[Lj1/i$a;
    .locals 2

    .line 1
    sget-object v0, Lj1/i$a;->i:Lj1/i$a;

    .line 2
    .line 3
    sget-object v1, Lj1/i$a;->j:Lj1/i$a;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lj1/i$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lj1/i$a;
    .locals 1

    .line 1
    const-class v0, Lj1/i$a;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lj1/i$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lj1/i$a;
    .locals 1

    .line 1
    sget-object v0, Lj1/i$a;->k:[Lj1/i$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lj1/i$a;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lj1/i$a;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final d()LM2/l$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lj1/i$a;->g:LM2/l$a;

    .line 2
    .line 3
    return-object p0
.end method
