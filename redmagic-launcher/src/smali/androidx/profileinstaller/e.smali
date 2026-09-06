.class final enum Landroidx/profileinstaller/e;
.super Ljava/lang/Enum;
.source "FileSectionType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroidx/profileinstaller/e;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum h:Landroidx/profileinstaller/e;

.field public static final enum i:Landroidx/profileinstaller/e;

.field public static final enum j:Landroidx/profileinstaller/e;

.field public static final enum k:Landroidx/profileinstaller/e;

.field public static final enum l:Landroidx/profileinstaller/e;

.field private static final synthetic m:[Landroidx/profileinstaller/e;


# instance fields
.field private final g:J


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Landroidx/profileinstaller/e;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    const-string v4, "DEX_FILES"

    .line 7
    .line 8
    invoke-direct {v0, v4, v1, v2, v3}, Landroidx/profileinstaller/e;-><init>(Ljava/lang/String;IJ)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Landroidx/profileinstaller/e;->h:Landroidx/profileinstaller/e;

    .line 12
    .line 13
    new-instance v0, Landroidx/profileinstaller/e;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-wide/16 v2, 0x1

    .line 17
    .line 18
    const-string v4, "EXTRA_DESCRIPTORS"

    .line 19
    .line 20
    invoke-direct {v0, v4, v1, v2, v3}, Landroidx/profileinstaller/e;-><init>(Ljava/lang/String;IJ)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Landroidx/profileinstaller/e;->i:Landroidx/profileinstaller/e;

    .line 24
    .line 25
    new-instance v0, Landroidx/profileinstaller/e;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-wide/16 v2, 0x2

    .line 29
    .line 30
    const-string v4, "CLASSES"

    .line 31
    .line 32
    invoke-direct {v0, v4, v1, v2, v3}, Landroidx/profileinstaller/e;-><init>(Ljava/lang/String;IJ)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Landroidx/profileinstaller/e;->j:Landroidx/profileinstaller/e;

    .line 36
    .line 37
    new-instance v0, Landroidx/profileinstaller/e;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-wide/16 v2, 0x3

    .line 41
    .line 42
    const-string v4, "METHODS"

    .line 43
    .line 44
    invoke-direct {v0, v4, v1, v2, v3}, Landroidx/profileinstaller/e;-><init>(Ljava/lang/String;IJ)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Landroidx/profileinstaller/e;->k:Landroidx/profileinstaller/e;

    .line 48
    .line 49
    new-instance v0, Landroidx/profileinstaller/e;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    const-wide/16 v2, 0x4

    .line 53
    .line 54
    const-string v4, "AGGREGATION_COUNT"

    .line 55
    .line 56
    invoke-direct {v0, v4, v1, v2, v3}, Landroidx/profileinstaller/e;-><init>(Ljava/lang/String;IJ)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Landroidx/profileinstaller/e;->l:Landroidx/profileinstaller/e;

    .line 60
    .line 61
    invoke-static {}, Landroidx/profileinstaller/e;->a()[Landroidx/profileinstaller/e;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Landroidx/profileinstaller/e;->m:[Landroidx/profileinstaller/e;

    .line 66
    .line 67
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-wide p3, p0, Landroidx/profileinstaller/e;->g:J

    .line 5
    .line 6
    return-void
.end method

.method private static synthetic a()[Landroidx/profileinstaller/e;
    .locals 5

    .line 1
    sget-object v0, Landroidx/profileinstaller/e;->h:Landroidx/profileinstaller/e;

    .line 2
    .line 3
    sget-object v1, Landroidx/profileinstaller/e;->i:Landroidx/profileinstaller/e;

    .line 4
    .line 5
    sget-object v2, Landroidx/profileinstaller/e;->j:Landroidx/profileinstaller/e;

    .line 6
    .line 7
    sget-object v3, Landroidx/profileinstaller/e;->k:Landroidx/profileinstaller/e;

    .line 8
    .line 9
    sget-object v4, Landroidx/profileinstaller/e;->l:Landroidx/profileinstaller/e;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Landroidx/profileinstaller/e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Landroidx/profileinstaller/e;
    .locals 1

    .line 1
    const-class v0, Landroidx/profileinstaller/e;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/profileinstaller/e;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Landroidx/profileinstaller/e;
    .locals 1

    .line 1
    sget-object v0, Landroidx/profileinstaller/e;->m:[Landroidx/profileinstaller/e;

    .line 2
    .line 3
    invoke-virtual {v0}, [Landroidx/profileinstaller/e;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Landroidx/profileinstaller/e;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Landroidx/profileinstaller/e;->g:J

    .line 2
    .line 3
    return-wide v0
.end method
