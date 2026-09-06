.class public final Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;
.super Ljava/lang/Object;
.source "SpringAnimConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/SpringAnimConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AppCloseToHomeAssistantParam"
.end annotation


# static fields
.field private static final ALPHA_PARAM:[F

.field private static final ALPHA_START_DELAY:[J

.field private static final CENTER_X_PARAM:[F

.field public static final INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;

.field private static final RADIUS_PARAM:[F

.field private static final RECT_RADIO_PARAM:[F

.field private static final RECT_Y_PARAM:[F

.field private static final WIDTH_PARAM:[F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    new-array v1, v0, [F

    .line 10
    .line 11
    fill-array-data v1, :array_0

    .line 12
    .line 13
    .line 14
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->CENTER_X_PARAM:[F

    .line 15
    .line 16
    new-array v1, v0, [F

    .line 17
    .line 18
    fill-array-data v1, :array_1

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->RECT_Y_PARAM:[F

    .line 22
    .line 23
    new-array v1, v0, [F

    .line 24
    .line 25
    fill-array-data v1, :array_2

    .line 26
    .line 27
    .line 28
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->WIDTH_PARAM:[F

    .line 29
    .line 30
    new-array v1, v0, [F

    .line 31
    .line 32
    fill-array-data v1, :array_3

    .line 33
    .line 34
    .line 35
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->RADIUS_PARAM:[F

    .line 36
    .line 37
    new-array v1, v0, [F

    .line 38
    .line 39
    fill-array-data v1, :array_4

    .line 40
    .line 41
    .line 42
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->RECT_RADIO_PARAM:[F

    .line 43
    .line 44
    new-array v1, v0, [F

    .line 45
    .line 46
    fill-array-data v1, :array_5

    .line 47
    .line 48
    .line 49
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->ALPHA_PARAM:[F

    .line 50
    .line 51
    new-array v0, v0, [J

    .line 52
    .line 53
    fill-array-data v0, :array_6

    .line 54
    .line 55
    .line 56
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->ALPHA_START_DELAY:[J

    .line 57
    .line 58
    return-void

    .line 59
    :array_0
    .array-data 4
        0x437a0000    # 250.0f
        0x3f5c28f6    # 0.86f
    .end array-data

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    :array_1
    .array-data 4
        0x437a0000    # 250.0f
        0x3f5c28f6    # 0.86f
    .end array-data

    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    :array_2
    .array-data 4
        0x437a0000    # 250.0f
        0x3f5c28f6    # 0.86f
    .end array-data

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    :array_3
    .array-data 4
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    :array_4
    .array-data 4
        0x437a0000    # 250.0f
        0x3f5c28f6    # 0.86f
    .end array-data

    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    :array_5
    .array-data 4
        0x447a0000    # 1000.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    :array_6
    .array-data 8
        0x14
        0x55
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final getALPHA_PARAM()[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->ALPHA_PARAM:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getALPHA_START_DELAY()[J
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->ALPHA_START_DELAY:[J

    .line 2
    .line 3
    return-object p0
.end method

.method public final getCENTER_X_PARAM()[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->CENTER_X_PARAM:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRADIUS_PARAM()[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->RADIUS_PARAM:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRECT_RADIO_PARAM()[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->RECT_RADIO_PARAM:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRECT_Y_PARAM()[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->RECT_Y_PARAM:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getWIDTH_PARAM()[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->WIDTH_PARAM:[F

    .line 2
    .line 3
    return-object p0
.end method
