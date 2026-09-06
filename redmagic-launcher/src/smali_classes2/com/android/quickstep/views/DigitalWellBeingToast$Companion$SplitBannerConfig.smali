.class public final enum Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;
.super Ljava/lang/Enum;
.source "DigitalWellBeingToast.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/DigitalWellBeingToast$Companion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SplitBannerConfig"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Ln4/a;

.field private static final synthetic $VALUES:[Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

.field public static final enum SPLIT_BANNER_FULLSCREEN:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

.field public static final enum SPLIT_GRID_BANNER_LARGE:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

.field public static final enum SPLIT_GRID_BANNER_SMALL:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;


# direct methods
.method private static final synthetic $values()[Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_BANNER_FULLSCREEN:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_GRID_BANNER_LARGE:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 4
    .line 5
    sget-object v2, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_GRID_BANNER_SMALL:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 2
    .line 3
    const-string v1, "SPLIT_BANNER_FULLSCREEN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_BANNER_FULLSCREEN:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 12
    .line 13
    const-string v1, "SPLIT_GRID_BANNER_LARGE"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_GRID_BANNER_LARGE:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 20
    .line 21
    new-instance v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 22
    .line 23
    const-string v1, "SPLIT_GRID_BANNER_SMALL"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_GRID_BANNER_SMALL:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 30
    .line 31
    invoke-static {}, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->$values()[Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->$VALUES:[Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 36
    .line 37
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->$ENTRIES:Ln4/a;

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

.method public static getEntries()Ln4/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ln4/a<",
            "Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->$ENTRIES:Ln4/a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;
    .locals 1

    .line 1
    const-class v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->$VALUES:[Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 8
    .line 9
    return-object v0
.end method
