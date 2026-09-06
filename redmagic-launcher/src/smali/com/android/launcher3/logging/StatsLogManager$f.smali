.class public final enum Lcom/android/launcher3/logging/StatsLogManager$f;
.super Ljava/lang/Enum;
.source "StatsLogManager.java"

# interfaces
.implements Lcom/android/launcher3/logging/StatsLogManager$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logging/StatsLogManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "f"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/launcher3/logging/StatsLogManager$f;",
        ">;",
        "Lcom/android/launcher3/logging/StatsLogManager$d;"
    }
.end annotation


# static fields
.field public static final enum h:Lcom/android/launcher3/logging/StatsLogManager$f;

.field public static final enum i:Lcom/android/launcher3/logging/StatsLogManager$f;

.field public static final enum j:Lcom/android/launcher3/logging/StatsLogManager$f;

.field public static final enum k:Lcom/android/launcher3/logging/StatsLogManager$f;

.field public static final enum l:Lcom/android/launcher3/logging/StatsLogManager$f;

.field public static final enum m:Lcom/android/launcher3/logging/StatsLogManager$f;

.field private static final synthetic n:[Lcom/android/launcher3/logging/StatsLogManager$f;


# instance fields
.field private final g:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0x552

    .line 5
    .line 6
    const-string v3, "LAUNCHER_LATENCY_STARTUP_TOTAL_DURATION"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$f;-><init>(Ljava/lang/String;II)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$f;->h:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 12
    .line 13
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const/16 v2, 0x553

    .line 17
    .line 18
    const-string v3, "LAUNCHER_LATENCY_STARTUP_ACTIVITY_ON_CREATE"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$f;-><init>(Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$f;->i:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 24
    .line 25
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const/16 v2, 0x554

    .line 29
    .line 30
    const-string v3, "LAUNCHER_LATENCY_STARTUP_VIEW_INFLATION"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$f;-><init>(Ljava/lang/String;II)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$f;->j:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 36
    .line 37
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const/16 v2, 0x557

    .line 41
    .line 42
    const-string v3, "LAUNCHER_LATENCY_STARTUP_WORKSPACE_LOADER_ASYNC"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$f;-><init>(Ljava/lang/String;II)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$f;->k:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 48
    .line 49
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    const/16 v2, 0x60a

    .line 53
    .line 54
    const-string v3, "LAUNCHER_LATENCY_OMNI_RUNNABLE"

    .line 55
    .line 56
    invoke-direct {v0, v3, v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$f;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$f;->l:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 60
    .line 61
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 62
    .line 63
    const/4 v1, 0x5

    .line 64
    const/16 v2, 0x87b

    .line 65
    .line 66
    const-string v3, "LAUNCHER_LATENCY_CONTEXTUAL_SEARCH_LPNH_ABANDON"

    .line 67
    .line 68
    invoke-direct {v0, v3, v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$f;-><init>(Ljava/lang/String;II)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$f;->m:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 72
    .line 73
    invoke-static {}, Lcom/android/launcher3/logging/StatsLogManager$f;->a()[Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$f;->n:[Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 78
    .line 79
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
    iput p3, p0, Lcom/android/launcher3/logging/StatsLogManager$f;->g:I

    .line 5
    .line 6
    return-void
.end method

.method private static synthetic a()[Lcom/android/launcher3/logging/StatsLogManager$f;
    .locals 6

    .line 1
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$f;->h:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$f;->i:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 4
    .line 5
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$f;->j:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 6
    .line 7
    sget-object v3, Lcom/android/launcher3/logging/StatsLogManager$f;->k:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 8
    .line 9
    sget-object v4, Lcom/android/launcher3/logging/StatsLogManager$f;->l:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 10
    .line 11
    sget-object v5, Lcom/android/launcher3/logging/StatsLogManager$f;->m:Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/launcher3/logging/StatsLogManager$f;
    .locals 1

    .line 1
    const-class v0, Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/launcher3/logging/StatsLogManager$f;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$f;->n:[Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/launcher3/logging/StatsLogManager$f;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/launcher3/logging/StatsLogManager$f;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/logging/StatsLogManager$f;->g:I

    .line 2
    .line 3
    return p0
.end method
