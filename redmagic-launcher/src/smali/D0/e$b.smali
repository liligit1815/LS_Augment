.class public final enum LD0/e$b;
.super Ljava/lang/Enum;
.source "Layer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LD0/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LD0/e$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:LD0/e$b;

.field public static final enum h:LD0/e$b;

.field public static final enum i:LD0/e$b;

.field public static final enum j:LD0/e$b;

.field public static final enum k:LD0/e$b;

.field public static final enum l:LD0/e$b;

.field private static final synthetic m:[LD0/e$b;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LD0/e$b;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LD0/e$b;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LD0/e$b;->g:LD0/e$b;

    .line 10
    .line 11
    new-instance v0, LD0/e$b;

    .line 12
    .line 13
    const-string v1, "ADD"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LD0/e$b;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LD0/e$b;->h:LD0/e$b;

    .line 20
    .line 21
    new-instance v0, LD0/e$b;

    .line 22
    .line 23
    const-string v1, "INVERT"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, LD0/e$b;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LD0/e$b;->i:LD0/e$b;

    .line 30
    .line 31
    new-instance v0, LD0/e$b;

    .line 32
    .line 33
    const-string v1, "LUMA"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, LD0/e$b;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, LD0/e$b;->j:LD0/e$b;

    .line 40
    .line 41
    new-instance v0, LD0/e$b;

    .line 42
    .line 43
    const-string v1, "LUMA_INVERTED"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, LD0/e$b;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, LD0/e$b;->k:LD0/e$b;

    .line 50
    .line 51
    new-instance v0, LD0/e$b;

    .line 52
    .line 53
    const-string v1, "UNKNOWN"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2}, LD0/e$b;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, LD0/e$b;->l:LD0/e$b;

    .line 60
    .line 61
    invoke-static {}, LD0/e$b;->a()[LD0/e$b;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, LD0/e$b;->m:[LD0/e$b;

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

.method private static synthetic a()[LD0/e$b;
    .locals 6

    .line 1
    sget-object v0, LD0/e$b;->g:LD0/e$b;

    .line 2
    .line 3
    sget-object v1, LD0/e$b;->h:LD0/e$b;

    .line 4
    .line 5
    sget-object v2, LD0/e$b;->i:LD0/e$b;

    .line 6
    .line 7
    sget-object v3, LD0/e$b;->j:LD0/e$b;

    .line 8
    .line 9
    sget-object v4, LD0/e$b;->k:LD0/e$b;

    .line 10
    .line 11
    sget-object v5, LD0/e$b;->l:LD0/e$b;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [LD0/e$b;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LD0/e$b;
    .locals 1

    .line 1
    const-class v0, LD0/e$b;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LD0/e$b;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LD0/e$b;
    .locals 1

    .line 1
    sget-object v0, LD0/e$b;->m:[LD0/e$b;

    .line 2
    .line 3
    invoke-virtual {v0}, [LD0/e$b;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LD0/e$b;

    .line 8
    .line 9
    return-object v0
.end method
