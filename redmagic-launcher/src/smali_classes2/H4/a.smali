.class public final enum LH4/a;
.super Ljava/lang/Enum;
.source "BufferOverflow.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LH4/a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:LH4/a;

.field public static final enum h:LH4/a;

.field public static final enum i:LH4/a;

.field private static final synthetic j:[LH4/a;

.field private static final synthetic k:Ln4/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LH4/a;

    .line 2
    .line 3
    const-string v1, "SUSPEND"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LH4/a;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LH4/a;->g:LH4/a;

    .line 10
    .line 11
    new-instance v0, LH4/a;

    .line 12
    .line 13
    const-string v1, "DROP_OLDEST"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LH4/a;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LH4/a;->h:LH4/a;

    .line 20
    .line 21
    new-instance v0, LH4/a;

    .line 22
    .line 23
    const-string v1, "DROP_LATEST"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, LH4/a;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LH4/a;->i:LH4/a;

    .line 30
    .line 31
    invoke-static {}, LH4/a;->a()[LH4/a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, LH4/a;->j:[LH4/a;

    .line 36
    .line 37
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, LH4/a;->k:Ln4/a;

    .line 42
    .line 43
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

.method private static final synthetic a()[LH4/a;
    .locals 3

    .line 1
    sget-object v0, LH4/a;->g:LH4/a;

    .line 2
    .line 3
    sget-object v1, LH4/a;->h:LH4/a;

    .line 4
    .line 5
    sget-object v2, LH4/a;->i:LH4/a;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [LH4/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LH4/a;
    .locals 1

    .line 1
    const-class v0, LH4/a;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LH4/a;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LH4/a;
    .locals 1

    .line 1
    sget-object v0, LH4/a;->j:[LH4/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LH4/a;

    .line 8
    .line 9
    return-object v0
.end method
