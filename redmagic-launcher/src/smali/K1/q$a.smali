.class public final enum LK1/q$a;
.super Ljava/lang/Enum;
.source "SettingsUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LK1/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LK1/q$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum h:LK1/q$a;

.field public static final enum i:LK1/q$a;

.field public static final enum j:LK1/q$a;

.field public static final enum k:LK1/q$a;

.field public static final enum l:LK1/q$a;

.field public static final enum m:LK1/q$a;

.field private static final synthetic n:[LK1/q$a;


# instance fields
.field final g:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, LK1/q$a;

    .line 2
    .line 3
    const-string v1, "SINGLE_MODE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, LK1/q$a;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, LK1/q$a;->h:LK1/q$a;

    .line 11
    .line 12
    new-instance v0, LK1/q$a;

    .line 13
    .line 14
    const-string v1, "DOUBLE_MODE"

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    invoke-direct {v0, v1, v3, v2}, LK1/q$a;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, LK1/q$a;->i:LK1/q$a;

    .line 21
    .line 22
    new-instance v0, LK1/q$a;

    .line 23
    .line 24
    const-string v1, "EASE_MODE"

    .line 25
    .line 26
    const/4 v3, 0x3

    .line 27
    invoke-direct {v0, v1, v2, v3}, LK1/q$a;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v0, LK1/q$a;->j:LK1/q$a;

    .line 31
    .line 32
    new-instance v0, LK1/q$a;

    .line 33
    .line 34
    const-string v1, "FEATURE_MODE"

    .line 35
    .line 36
    const/4 v2, 0x4

    .line 37
    invoke-direct {v0, v1, v3, v2}, LK1/q$a;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v0, LK1/q$a;->k:LK1/q$a;

    .line 41
    .line 42
    new-instance v0, LK1/q$a;

    .line 43
    .line 44
    const-string v1, "STREAMER_MODE"

    .line 45
    .line 46
    const/4 v3, 0x5

    .line 47
    invoke-direct {v0, v1, v2, v3}, LK1/q$a;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v0, LK1/q$a;->l:LK1/q$a;

    .line 51
    .line 52
    new-instance v0, LK1/q$a;

    .line 53
    .line 54
    const-string v1, "CONCISE_MODE"

    .line 55
    .line 56
    const/4 v2, 0x6

    .line 57
    invoke-direct {v0, v1, v3, v2}, LK1/q$a;-><init>(Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    sput-object v0, LK1/q$a;->m:LK1/q$a;

    .line 61
    .line 62
    invoke-static {}, LK1/q$a;->a()[LK1/q$a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, LK1/q$a;->n:[LK1/q$a;

    .line 67
    .line 68
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, LK1/q$a;->g:I

    .line 5
    .line 6
    return-void
.end method

.method private static synthetic a()[LK1/q$a;
    .locals 6

    .line 1
    sget-object v0, LK1/q$a;->h:LK1/q$a;

    .line 2
    .line 3
    sget-object v1, LK1/q$a;->i:LK1/q$a;

    .line 4
    .line 5
    sget-object v2, LK1/q$a;->j:LK1/q$a;

    .line 6
    .line 7
    sget-object v3, LK1/q$a;->k:LK1/q$a;

    .line 8
    .line 9
    sget-object v4, LK1/q$a;->l:LK1/q$a;

    .line 10
    .line 11
    sget-object v5, LK1/q$a;->m:LK1/q$a;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [LK1/q$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LK1/q$a;
    .locals 1

    .line 1
    const-class v0, LK1/q$a;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LK1/q$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LK1/q$a;
    .locals 1

    .line 1
    sget-object v0, LK1/q$a;->n:[LK1/q$a;

    .line 2
    .line 3
    invoke-virtual {v0}, [LK1/q$a;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LK1/q$a;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public c()I
    .locals 0

    .line 1
    iget p0, p0, LK1/q$a;->g:I

    .line 2
    .line 3
    return p0
.end method
