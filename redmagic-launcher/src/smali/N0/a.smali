.class public final enum LN0/a;
.super Ljava/lang/Enum;
.source "FancyIconKey.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LN0/a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:LN0/a;

.field public static final enum h:LN0/a;

.field public static final enum i:LN0/a;

.field public static final enum j:LN0/a;

.field public static final enum k:LN0/a;

.field public static final enum l:LN0/a;

.field private static final synthetic m:[LN0/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LN0/a;

    .line 2
    .line 3
    const-string v1, "WORKSPACE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LN0/a;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LN0/a;->g:LN0/a;

    .line 10
    .line 11
    new-instance v0, LN0/a;

    .line 12
    .line 13
    const-string v1, "DRAWER"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LN0/a;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LN0/a;->h:LN0/a;

    .line 20
    .line 21
    new-instance v0, LN0/a;

    .line 22
    .line 23
    const-string v1, "DRAWER_PREDICTION"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, LN0/a;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LN0/a;->i:LN0/a;

    .line 30
    .line 31
    new-instance v0, LN0/a;

    .line 32
    .line 33
    const-string v1, "DRAWER_SEARCH"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, LN0/a;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, LN0/a;->j:LN0/a;

    .line 40
    .line 41
    new-instance v0, LN0/a;

    .line 42
    .line 43
    const-string v1, "TASKBAR"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, LN0/a;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, LN0/a;->k:LN0/a;

    .line 50
    .line 51
    new-instance v0, LN0/a;

    .line 52
    .line 53
    const-string v1, "TASKBAR_FOLDER"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2}, LN0/a;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, LN0/a;->l:LN0/a;

    .line 60
    .line 61
    invoke-static {}, LN0/a;->a()[LN0/a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, LN0/a;->m:[LN0/a;

    .line 66
    .line 67
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

.method private static synthetic a()[LN0/a;
    .locals 6

    .line 1
    sget-object v0, LN0/a;->g:LN0/a;

    .line 2
    .line 3
    sget-object v1, LN0/a;->h:LN0/a;

    .line 4
    .line 5
    sget-object v2, LN0/a;->i:LN0/a;

    .line 6
    .line 7
    sget-object v3, LN0/a;->j:LN0/a;

    .line 8
    .line 9
    sget-object v4, LN0/a;->k:LN0/a;

    .line 10
    .line 11
    sget-object v5, LN0/a;->l:LN0/a;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [LN0/a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LN0/a;
    .locals 1

    .line 1
    const-class v0, LN0/a;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LN0/a;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LN0/a;
    .locals 1

    .line 1
    sget-object v0, LN0/a;->m:[LN0/a;

    .line 2
    .line 3
    invoke-virtual {v0}, [LN0/a;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LN0/a;

    .line 8
    .line 9
    return-object v0
.end method
