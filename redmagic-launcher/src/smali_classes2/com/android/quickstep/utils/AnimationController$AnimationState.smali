.class public final enum Lcom/android/quickstep/utils/AnimationController$AnimationState;
.super Ljava/lang/Enum;
.source "AnimationController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/utils/AnimationController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AnimationState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/quickstep/utils/AnimationController$AnimationState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/quickstep/utils/AnimationController$AnimationState;

.field public static final enum CLOSE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

.field public static final enum MULTI_CLOSE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

.field public static final enum MULTI_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

.field public static final enum MULTI_REVERSE_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

.field public static final enum MULTI_WAITING:Lcom/android/quickstep/utils/AnimationController$AnimationState;

.field public static final enum NONE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

.field public static final enum OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

.field public static final enum REVERSE_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

.field public static final enum UNKNOWN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

.field public static final enum WAITING:Lcom/android/quickstep/utils/AnimationController$AnimationState;


# instance fields
.field private final taskbarAlignmentToLauncher:Z

.field private final withTaskbarAlignment:Z


# direct methods
.method private static synthetic $values()[Lcom/android/quickstep/utils/AnimationController$AnimationState;
    .locals 10

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->NONE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/utils/AnimationController$AnimationState;->OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 4
    .line 5
    sget-object v2, Lcom/android/quickstep/utils/AnimationController$AnimationState;->REVERSE_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 6
    .line 7
    sget-object v3, Lcom/android/quickstep/utils/AnimationController$AnimationState;->CLOSE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 8
    .line 9
    sget-object v4, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 10
    .line 11
    sget-object v5, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_REVERSE_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 12
    .line 13
    sget-object v6, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_CLOSE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 14
    .line 15
    sget-object v7, Lcom/android/quickstep/utils/AnimationController$AnimationState;->WAITING:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 16
    .line 17
    sget-object v8, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_WAITING:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 18
    .line 19
    sget-object v9, Lcom/android/quickstep/utils/AnimationController$AnimationState;->UNKNOWN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 20
    .line 21
    filled-new-array/range {v0 .. v9}, [Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2, v2}, Lcom/android/quickstep/utils/AnimationController$AnimationState;-><init>(Ljava/lang/String;IZZ)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->NONE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 12
    .line 13
    const-string v1, "OPEN"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v0, v1, v3, v3, v2}, Lcom/android/quickstep/utils/AnimationController$AnimationState;-><init>(Ljava/lang/String;IZZ)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 20
    .line 21
    new-instance v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 22
    .line 23
    const-string v1, "REVERSE_OPEN"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v0, v1, v4, v3, v2}, Lcom/android/quickstep/utils/AnimationController$AnimationState;-><init>(Ljava/lang/String;IZZ)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->REVERSE_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 30
    .line 31
    new-instance v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 32
    .line 33
    const-string v1, "CLOSE"

    .line 34
    .line 35
    const/4 v4, 0x3

    .line 36
    invoke-direct {v0, v1, v4, v3, v3}, Lcom/android/quickstep/utils/AnimationController$AnimationState;-><init>(Ljava/lang/String;IZZ)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->CLOSE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 40
    .line 41
    new-instance v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 42
    .line 43
    const-string v1, "MULTI_OPEN"

    .line 44
    .line 45
    const/4 v4, 0x4

    .line 46
    invoke-direct {v0, v1, v4, v3, v2}, Lcom/android/quickstep/utils/AnimationController$AnimationState;-><init>(Ljava/lang/String;IZZ)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 50
    .line 51
    new-instance v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 52
    .line 53
    const-string v1, "MULTI_REVERSE_OPEN"

    .line 54
    .line 55
    const/4 v4, 0x5

    .line 56
    invoke-direct {v0, v1, v4, v3, v2}, Lcom/android/quickstep/utils/AnimationController$AnimationState;-><init>(Ljava/lang/String;IZZ)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_REVERSE_OPEN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 60
    .line 61
    new-instance v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 62
    .line 63
    const-string v1, "MULTI_CLOSE"

    .line 64
    .line 65
    const/4 v4, 0x6

    .line 66
    invoke-direct {v0, v1, v4, v3, v3}, Lcom/android/quickstep/utils/AnimationController$AnimationState;-><init>(Ljava/lang/String;IZZ)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_CLOSE:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 70
    .line 71
    new-instance v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 72
    .line 73
    const-string v1, "WAITING"

    .line 74
    .line 75
    const/4 v3, 0x7

    .line 76
    invoke-direct {v0, v1, v3, v2, v2}, Lcom/android/quickstep/utils/AnimationController$AnimationState;-><init>(Ljava/lang/String;IZZ)V

    .line 77
    .line 78
    .line 79
    sput-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->WAITING:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 80
    .line 81
    new-instance v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 82
    .line 83
    const-string v1, "MULTI_WAITING"

    .line 84
    .line 85
    const/16 v3, 0x8

    .line 86
    .line 87
    invoke-direct {v0, v1, v3, v2, v2}, Lcom/android/quickstep/utils/AnimationController$AnimationState;-><init>(Ljava/lang/String;IZZ)V

    .line 88
    .line 89
    .line 90
    sput-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->MULTI_WAITING:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 91
    .line 92
    new-instance v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 93
    .line 94
    const-string v1, "UNKNOWN"

    .line 95
    .line 96
    const/16 v3, 0x9

    .line 97
    .line 98
    invoke-direct {v0, v1, v3, v2, v2}, Lcom/android/quickstep/utils/AnimationController$AnimationState;-><init>(Ljava/lang/String;IZZ)V

    .line 99
    .line 100
    .line 101
    sput-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->UNKNOWN:Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 102
    .line 103
    invoke-static {}, Lcom/android/quickstep/utils/AnimationController$AnimationState;->$values()[Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    sput-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->$VALUES:[Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 108
    .line 109
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-boolean p3, p0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->withTaskbarAlignment:Z

    .line 5
    .line 6
    iput-boolean p4, p0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->taskbarAlignmentToLauncher:Z

    .line 7
    .line 8
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/quickstep/utils/AnimationController$AnimationState;
    .locals 1

    .line 1
    const-class v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/quickstep/utils/AnimationController$AnimationState;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->$VALUES:[Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/quickstep/utils/AnimationController$AnimationState;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/quickstep/utils/AnimationController$AnimationState;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getTaskbarAlignmentToLauncher()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->taskbarAlignmentToLauncher:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getWithTaskbarAlignment()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/utils/AnimationController$AnimationState;->withTaskbarAlignment:Z

    .line 2
    .line 3
    return p0
.end method
