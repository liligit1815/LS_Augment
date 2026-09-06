.class final enum Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;
.super Ljava/lang/Enum;
.source "AnimatorControllerWithResistance.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/AnimatorControllerWithResistance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "RecentsResistanceParams"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

.field public static final enum FROM_APP:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

.field public static final enum FROM_APP_LAND:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

.field public static final enum FROM_APP_TABLET:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

.field public static final enum FROM_APP_TABLET_MFV:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

.field public static final enum FROM_APP_TABLET_MFV_ONETASK:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

.field public static final enum FROM_OVERVIEW:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;


# instance fields
.field public final scaleMaxResist:F

.field public final scaleStartResist:F

.field public final stopScalingAtTop:Z

.field public final translationFactor:F


# direct methods
.method private static synthetic $values()[Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;
    .locals 6

    .line 1
    sget-object v0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP_TABLET:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 4
    .line 5
    sget-object v2, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_OVERVIEW:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 6
    .line 7
    sget-object v3, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP_LAND:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 8
    .line 9
    sget-object v4, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP_TABLET_MFV:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 10
    .line 11
    sget-object v5, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP_TABLET_MFV_ONETASK:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 2
    .line 3
    const/high16 v5, 0x3f800000    # 1.0f

    .line 4
    .line 5
    const/4 v6, 0x0

    .line 6
    const-string v1, "FROM_APP"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/high16 v3, 0x3f400000    # 0.75f

    .line 10
    .line 11
    const/high16 v4, 0x3f000000    # 0.5f

    .line 12
    .line 13
    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;-><init>(Ljava/lang/String;IFFFZ)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 17
    .line 18
    new-instance v1, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 19
    .line 20
    const/high16 v6, 0x3f800000    # 1.0f

    .line 21
    .line 22
    const/4 v7, 0x1

    .line 23
    const-string v2, "FROM_APP_TABLET"

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    const/high16 v4, 0x3f800000    # 1.0f

    .line 27
    .line 28
    const v5, 0x3f333333    # 0.7f

    .line 29
    .line 30
    .line 31
    invoke-direct/range {v1 .. v7}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;-><init>(Ljava/lang/String;IFFFZ)V

    .line 32
    .line 33
    .line 34
    sput-object v1, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP_TABLET:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 35
    .line 36
    new-instance v2, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 37
    .line 38
    const/high16 v7, 0x3f000000    # 0.5f

    .line 39
    .line 40
    const/4 v8, 0x0

    .line 41
    const-string v3, "FROM_OVERVIEW"

    .line 42
    .line 43
    const/4 v4, 0x2

    .line 44
    const/high16 v5, 0x3f800000    # 1.0f

    .line 45
    .line 46
    const/high16 v6, 0x3f400000    # 0.75f

    .line 47
    .line 48
    invoke-direct/range {v2 .. v8}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;-><init>(Ljava/lang/String;IFFFZ)V

    .line 49
    .line 50
    .line 51
    sput-object v2, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_OVERVIEW:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 52
    .line 53
    new-instance v3, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 54
    .line 55
    const v8, 0x3f333333    # 0.7f

    .line 56
    .line 57
    .line 58
    const/4 v9, 0x0

    .line 59
    const-string v4, "FROM_APP_LAND"

    .line 60
    .line 61
    const/4 v5, 0x3

    .line 62
    invoke-direct/range {v3 .. v9}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;-><init>(Ljava/lang/String;IFFFZ)V

    .line 63
    .line 64
    .line 65
    sput-object v3, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP_LAND:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 66
    .line 67
    new-instance v4, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 68
    .line 69
    const/high16 v9, 0x3f400000    # 0.75f

    .line 70
    .line 71
    const/4 v10, 0x0

    .line 72
    const-string v5, "FROM_APP_TABLET_MFV"

    .line 73
    .line 74
    const/4 v6, 0x4

    .line 75
    const/high16 v7, 0x3f800000    # 1.0f

    .line 76
    .line 77
    const/high16 v8, 0x3f800000    # 1.0f

    .line 78
    .line 79
    invoke-direct/range {v4 .. v10}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;-><init>(Ljava/lang/String;IFFFZ)V

    .line 80
    .line 81
    .line 82
    sput-object v4, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP_TABLET_MFV:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 83
    .line 84
    new-instance v5, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 85
    .line 86
    const v10, 0x3f666666    # 0.9f

    .line 87
    .line 88
    .line 89
    const/4 v11, 0x0

    .line 90
    const-string v6, "FROM_APP_TABLET_MFV_ONETASK"

    .line 91
    .line 92
    const/4 v7, 0x5

    .line 93
    const v9, 0x3ee66666    # 0.45f

    .line 94
    .line 95
    .line 96
    invoke-direct/range {v5 .. v11}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;-><init>(Ljava/lang/String;IFFFZ)V

    .line 97
    .line 98
    .line 99
    sput-object v5, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->FROM_APP_TABLET_MFV_ONETASK:Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 100
    .line 101
    invoke-static {}, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->$values()[Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sput-object v0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->$VALUES:[Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 106
    .line 107
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IFFFZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->scaleStartResist:F

    .line 5
    .line 6
    iput p4, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->scaleMaxResist:F

    .line 7
    .line 8
    iput p5, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->translationFactor:F

    .line 9
    .line 10
    iput-boolean p6, p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->stopScalingAtTop:Z

    .line 11
    .line 12
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;
    .locals 1

    .line 1
    const-class v0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->$VALUES:[Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/quickstep/util/AnimatorControllerWithResistance$RecentsResistanceParams;

    .line 8
    .line 9
    return-object v0
.end method
