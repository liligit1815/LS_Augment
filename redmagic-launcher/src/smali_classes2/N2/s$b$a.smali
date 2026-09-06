.class public final enum LN2/s$b$a;
.super Ljava/lang/Enum;
.source "DragZoneFactory.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LN2/s$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LN2/s$b$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:LN2/s$b$a;

.field public static final enum h:LN2/s$b$a;

.field public static final enum i:LN2/s$b$a;

.field public static final enum j:LN2/s$b$a;

.field public static final enum k:LN2/s$b$a;

.field private static final synthetic l:[LN2/s$b$a;

.field private static final synthetic m:Ln4/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LN2/s$b$a;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LN2/s$b$a;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LN2/s$b$a;->g:LN2/s$b$a;

    .line 10
    .line 11
    new-instance v0, LN2/s$b$a;

    .line 12
    .line 13
    const-string v1, "SPLIT_50_50"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LN2/s$b$a;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LN2/s$b$a;->h:LN2/s$b$a;

    .line 20
    .line 21
    new-instance v0, LN2/s$b$a;

    .line 22
    .line 23
    const-string v1, "SPLIT_10_90"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, LN2/s$b$a;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LN2/s$b$a;->i:LN2/s$b$a;

    .line 30
    .line 31
    new-instance v0, LN2/s$b$a;

    .line 32
    .line 33
    const-string v1, "SPLIT_90_10"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, LN2/s$b$a;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, LN2/s$b$a;->j:LN2/s$b$a;

    .line 40
    .line 41
    new-instance v0, LN2/s$b$a;

    .line 42
    .line 43
    const-string v1, "UNSUPPORTED"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, LN2/s$b$a;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, LN2/s$b$a;->k:LN2/s$b$a;

    .line 50
    .line 51
    invoke-static {}, LN2/s$b$a;->a()[LN2/s$b$a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, LN2/s$b$a;->l:[LN2/s$b$a;

    .line 56
    .line 57
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, LN2/s$b$a;->m:Ln4/a;

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

.method private static final synthetic a()[LN2/s$b$a;
    .locals 5

    .line 1
    sget-object v0, LN2/s$b$a;->g:LN2/s$b$a;

    .line 2
    .line 3
    sget-object v1, LN2/s$b$a;->h:LN2/s$b$a;

    .line 4
    .line 5
    sget-object v2, LN2/s$b$a;->i:LN2/s$b$a;

    .line 6
    .line 7
    sget-object v3, LN2/s$b$a;->j:LN2/s$b$a;

    .line 8
    .line 9
    sget-object v4, LN2/s$b$a;->k:LN2/s$b$a;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [LN2/s$b$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LN2/s$b$a;
    .locals 1

    .line 1
    const-class v0, LN2/s$b$a;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LN2/s$b$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LN2/s$b$a;
    .locals 1

    .line 1
    sget-object v0, LN2/s$b$a;->l:[LN2/s$b$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LN2/s$b$a;

    .line 8
    .line 9
    return-object v0
.end method
