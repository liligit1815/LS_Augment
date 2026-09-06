.class final enum Lcom/android/quickstep/interaction/TutorialController$TutorialType;
.super Ljava/lang/Enum;
.source "TutorialController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/interaction/TutorialController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "TutorialType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/quickstep/interaction/TutorialController$TutorialType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/quickstep/interaction/TutorialController$TutorialType;

.field public static final enum BACK_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

.field public static final enum BACK_NAVIGATION_COMPLETE:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

.field public static final enum HOME_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

.field public static final enum HOME_NAVIGATION_COMPLETE:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

.field public static final enum OVERVIEW_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

.field public static final enum OVERVIEW_NAVIGATION_COMPLETE:Lcom/android/quickstep/interaction/TutorialController$TutorialType;


# direct methods
.method private static synthetic $values()[Lcom/android/quickstep/interaction/TutorialController$TutorialType;
    .locals 6

    .line 1
    sget-object v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->BACK_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->BACK_NAVIGATION_COMPLETE:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 4
    .line 5
    sget-object v2, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->HOME_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 6
    .line 7
    sget-object v3, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->HOME_NAVIGATION_COMPLETE:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 8
    .line 9
    sget-object v4, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->OVERVIEW_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 10
    .line 11
    sget-object v5, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->OVERVIEW_NAVIGATION_COMPLETE:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 2
    .line 3
    const-string v1, "BACK_NAVIGATION"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/interaction/TutorialController$TutorialType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->BACK_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 12
    .line 13
    const-string v1, "BACK_NAVIGATION_COMPLETE"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/interaction/TutorialController$TutorialType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->BACK_NAVIGATION_COMPLETE:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 20
    .line 21
    new-instance v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 22
    .line 23
    const-string v1, "HOME_NAVIGATION"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/interaction/TutorialController$TutorialType;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->HOME_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 30
    .line 31
    new-instance v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 32
    .line 33
    const-string v1, "HOME_NAVIGATION_COMPLETE"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/interaction/TutorialController$TutorialType;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->HOME_NAVIGATION_COMPLETE:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 40
    .line 41
    new-instance v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 42
    .line 43
    const-string v1, "OVERVIEW_NAVIGATION"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/interaction/TutorialController$TutorialType;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->OVERVIEW_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 50
    .line 51
    new-instance v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 52
    .line 53
    const-string v1, "OVERVIEW_NAVIGATION_COMPLETE"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/interaction/TutorialController$TutorialType;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->OVERVIEW_NAVIGATION_COMPLETE:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 60
    .line 61
    invoke-static {}, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->$values()[Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->$VALUES:[Lcom/android/quickstep/interaction/TutorialController$TutorialType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/android/quickstep/interaction/TutorialController$TutorialType;
    .locals 1

    .line 1
    const-class v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/quickstep/interaction/TutorialController$TutorialType;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->$VALUES:[Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/quickstep/interaction/TutorialController$TutorialType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 8
    .line 9
    return-object v0
.end method
