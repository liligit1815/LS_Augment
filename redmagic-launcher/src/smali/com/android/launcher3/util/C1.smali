.class public final enum Lcom/android/launcher3/util/C1;
.super Ljava/lang/Enum;
.source "NavigationMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/launcher3/util/C1;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum j:Lcom/android/launcher3/util/C1;

.field public static final enum k:Lcom/android/launcher3/util/C1;

.field public static final enum l:Lcom/android/launcher3/util/C1;

.field private static final synthetic m:[Lcom/android/launcher3/util/C1;


# instance fields
.field public final g:Z

.field public final h:I

.field public final i:Lcom/android/launcher3/logging/StatsLogManager$e;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    sget-object v5, Lcom/android/launcher3/logging/StatsLogManager$e;->O0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 5
    .line 6
    const-string v1, "THREE_BUTTONS"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/util/C1;-><init>(Ljava/lang/String;IZILcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 14
    .line 15
    new-instance v1, Lcom/android/launcher3/util/C1;

    .line 16
    .line 17
    const/4 v5, 0x1

    .line 18
    sget-object v6, Lcom/android/launcher3/logging/StatsLogManager$e;->P0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 19
    .line 20
    const-string v2, "TWO_BUTTONS"

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    const/4 v4, 0x1

    .line 24
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/util/C1;-><init>(Ljava/lang/String;IZILcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 25
    .line 26
    .line 27
    sput-object v1, Lcom/android/launcher3/util/C1;->k:Lcom/android/launcher3/util/C1;

    .line 28
    .line 29
    new-instance v2, Lcom/android/launcher3/util/C1;

    .line 30
    .line 31
    const/4 v6, 0x2

    .line 32
    sget-object v7, Lcom/android/launcher3/logging/StatsLogManager$e;->Q0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 33
    .line 34
    const-string v3, "NO_BUTTON"

    .line 35
    .line 36
    const/4 v4, 0x2

    .line 37
    invoke-direct/range {v2 .. v7}, Lcom/android/launcher3/util/C1;-><init>(Ljava/lang/String;IZILcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 38
    .line 39
    .line 40
    sput-object v2, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 41
    .line 42
    invoke-static {}, Lcom/android/launcher3/util/C1;->a()[Lcom/android/launcher3/util/C1;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/android/launcher3/util/C1;->m:[Lcom/android/launcher3/util/C1;

    .line 47
    .line 48
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZILcom/android/launcher3/logging/StatsLogManager$e;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI",
            "Lcom/android/launcher3/logging/StatsLogManager$e;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-boolean p3, p0, Lcom/android/launcher3/util/C1;->g:Z

    .line 5
    .line 6
    iput p4, p0, Lcom/android/launcher3/util/C1;->h:I

    .line 7
    .line 8
    iput-object p5, p0, Lcom/android/launcher3/util/C1;->i:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 9
    .line 10
    return-void
.end method

.method private static synthetic a()[Lcom/android/launcher3/util/C1;
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/util/C1;->k:Lcom/android/launcher3/util/C1;

    .line 4
    .line 5
    sget-object v2, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/android/launcher3/util/C1;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/launcher3/util/C1;
    .locals 1

    .line 1
    const-class v0, Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/C1;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/launcher3/util/C1;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/C1;->m:[Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/launcher3/util/C1;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/launcher3/util/C1;

    .line 8
    .line 9
    return-object v0
.end method
