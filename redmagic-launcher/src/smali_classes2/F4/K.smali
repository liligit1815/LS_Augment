.class public final enum LF4/K;
.super Ljava/lang/Enum;
.source "CoroutineStart.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LF4/K$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LF4/K;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:LF4/K;

.field public static final enum h:LF4/K;

.field public static final enum i:LF4/K;

.field public static final enum j:LF4/K;

.field private static final synthetic k:[LF4/K;

.field private static final synthetic l:Ln4/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LF4/K;

    .line 2
    .line 3
    const-string v1, "DEFAULT"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LF4/K;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LF4/K;->g:LF4/K;

    .line 10
    .line 11
    new-instance v0, LF4/K;

    .line 12
    .line 13
    const-string v1, "LAZY"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LF4/K;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LF4/K;->h:LF4/K;

    .line 20
    .line 21
    new-instance v0, LF4/K;

    .line 22
    .line 23
    const-string v1, "ATOMIC"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, LF4/K;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LF4/K;->i:LF4/K;

    .line 30
    .line 31
    new-instance v0, LF4/K;

    .line 32
    .line 33
    const-string v1, "UNDISPATCHED"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, LF4/K;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, LF4/K;->j:LF4/K;

    .line 40
    .line 41
    invoke-static {}, LF4/K;->a()[LF4/K;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, LF4/K;->k:[LF4/K;

    .line 46
    .line 47
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, LF4/K;->l:Ln4/a;

    .line 52
    .line 53
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

.method private static final synthetic a()[LF4/K;
    .locals 4

    .line 1
    sget-object v0, LF4/K;->g:LF4/K;

    .line 2
    .line 3
    sget-object v1, LF4/K;->h:LF4/K;

    .line 4
    .line 5
    sget-object v2, LF4/K;->i:LF4/K;

    .line 6
    .line 7
    sget-object v3, LF4/K;->j:LF4/K;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [LF4/K;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LF4/K;
    .locals 1

    .line 1
    const-class v0, LF4/K;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LF4/K;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LF4/K;
    .locals 1

    .line 1
    sget-object v0, LF4/K;->k:[LF4/K;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LF4/K;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final c(Lu4/p;Ljava/lang/Object;Ll4/d;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(",
            "Lu4/p<",
            "-TR;-",
            "Ll4/d<",
            "-TT;>;+",
            "Ljava/lang/Object;",
            ">;TR;",
            "Ll4/d<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    sget-object v0, LF4/K$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x4

    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance p0, Lh4/j;

    .line 23
    .line 24
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 25
    .line 26
    .line 27
    throw p0

    .line 28
    :cond_1
    invoke-static {p1, p2, p3}, LL4/b;->a(Lu4/p;Ljava/lang/Object;Ll4/d;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    invoke-static {p1, p2, p3}, Ll4/f;->a(Lu4/p;Ljava/lang/Object;Ll4/d;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_3
    invoke-static {p1, p2, p3}, LL4/a;->c(Lu4/p;Ljava/lang/Object;Ll4/d;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final d()Z
    .locals 1

    .line 1
    sget-object v0, LF4/K;->h:LF4/K;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
