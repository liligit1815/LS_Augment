.class public final enum LB4/m;
.super Ljava/lang/Enum;
.source "KVisibility.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LB4/m;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:LB4/m;

.field public static final enum h:LB4/m;

.field public static final enum i:LB4/m;

.field public static final enum j:LB4/m;

.field private static final synthetic k:[LB4/m;

.field private static final synthetic l:Ln4/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LB4/m;

    .line 2
    .line 3
    const-string v1, "PUBLIC"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LB4/m;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LB4/m;->g:LB4/m;

    .line 10
    .line 11
    new-instance v0, LB4/m;

    .line 12
    .line 13
    const-string v1, "PROTECTED"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LB4/m;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LB4/m;->h:LB4/m;

    .line 20
    .line 21
    new-instance v0, LB4/m;

    .line 22
    .line 23
    const-string v1, "INTERNAL"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, LB4/m;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LB4/m;->i:LB4/m;

    .line 30
    .line 31
    new-instance v0, LB4/m;

    .line 32
    .line 33
    const-string v1, "PRIVATE"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, LB4/m;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, LB4/m;->j:LB4/m;

    .line 40
    .line 41
    invoke-static {}, LB4/m;->a()[LB4/m;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, LB4/m;->k:[LB4/m;

    .line 46
    .line 47
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, LB4/m;->l:Ln4/a;

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

.method private static final synthetic a()[LB4/m;
    .locals 4

    .line 1
    sget-object v0, LB4/m;->g:LB4/m;

    .line 2
    .line 3
    sget-object v1, LB4/m;->h:LB4/m;

    .line 4
    .line 5
    sget-object v2, LB4/m;->i:LB4/m;

    .line 6
    .line 7
    sget-object v3, LB4/m;->j:LB4/m;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [LB4/m;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LB4/m;
    .locals 1

    .line 1
    const-class v0, LB4/m;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LB4/m;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LB4/m;
    .locals 1

    .line 1
    sget-object v0, LB4/m;->k:[LB4/m;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LB4/m;

    .line 8
    .line 9
    return-object v0
.end method
