.class public final Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;
.super Ljava/lang/Object;
.source "SpringAnimConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/SpringAnimConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SwipeUpToHomeParam"
.end annotation


# static fields
.field private static final ALPHA_PARAM:[[F

.field private static final ALPHA_START_DELAY:[J

.field private static final CENTER_X_PARAM:[[F

.field private static final CONTENT_VIEW_PARAM:[[F

.field public static final INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;

.field public static final MAX_RADIO_VELOCITY:F = 19.5f

.field public static final MAX_WIDTH_VELOCITY:F = 18.0f

.field public static final MAX_X_VELOCITY:F = 13.0f

.field public static final MAX_Y_VELOCITY:F = 13.5f

.field private static final RADIUS_PARAM:[[F

.field private static final RECT_RADIO_PARAM:[[F

.field private static final RECT_Y_PARAM:[[F

.field public static final SCALE_X_VELOCITY:F = 0.5f

.field private static final SCALE_Y_VELOCITY:[F

.field private static final WIDTH_PARAM:[[F

.field private static final WIDTH_VELOCITY_RATE_Y:[F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;

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
    new-array v2, v0, [F

    .line 15
    .line 16
    fill-array-data v2, :array_1

    .line 17
    .line 18
    .line 19
    filled-new-array {v1, v2}, [[F

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->CENTER_X_PARAM:[[F

    .line 24
    .line 25
    new-array v1, v0, [F

    .line 26
    .line 27
    fill-array-data v1, :array_2

    .line 28
    .line 29
    .line 30
    new-array v2, v0, [F

    .line 31
    .line 32
    fill-array-data v2, :array_3

    .line 33
    .line 34
    .line 35
    filled-new-array {v1, v2}, [[F

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->RECT_Y_PARAM:[[F

    .line 40
    .line 41
    new-array v1, v0, [F

    .line 42
    .line 43
    fill-array-data v1, :array_4

    .line 44
    .line 45
    .line 46
    new-array v2, v0, [F

    .line 47
    .line 48
    fill-array-data v2, :array_5

    .line 49
    .line 50
    .line 51
    filled-new-array {v1, v2}, [[F

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->WIDTH_PARAM:[[F

    .line 56
    .line 57
    new-array v1, v0, [F

    .line 58
    .line 59
    fill-array-data v1, :array_6

    .line 60
    .line 61
    .line 62
    new-array v2, v0, [F

    .line 63
    .line 64
    fill-array-data v2, :array_7

    .line 65
    .line 66
    .line 67
    filled-new-array {v1, v2}, [[F

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->RADIUS_PARAM:[[F

    .line 72
    .line 73
    new-array v1, v0, [F

    .line 74
    .line 75
    fill-array-data v1, :array_8

    .line 76
    .line 77
    .line 78
    new-array v2, v0, [F

    .line 79
    .line 80
    fill-array-data v2, :array_9

    .line 81
    .line 82
    .line 83
    filled-new-array {v1, v2}, [[F

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->RECT_RADIO_PARAM:[[F

    .line 88
    .line 89
    new-array v1, v0, [F

    .line 90
    .line 91
    fill-array-data v1, :array_a

    .line 92
    .line 93
    .line 94
    new-array v2, v0, [F

    .line 95
    .line 96
    fill-array-data v2, :array_b

    .line 97
    .line 98
    .line 99
    filled-new-array {v1, v2}, [[F

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->ALPHA_PARAM:[[F

    .line 104
    .line 105
    new-array v1, v0, [J

    .line 106
    .line 107
    fill-array-data v1, :array_c

    .line 108
    .line 109
    .line 110
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->ALPHA_START_DELAY:[J

    .line 111
    .line 112
    new-array v1, v0, [F

    .line 113
    .line 114
    fill-array-data v1, :array_d

    .line 115
    .line 116
    .line 117
    new-array v2, v0, [F

    .line 118
    .line 119
    fill-array-data v2, :array_e

    .line 120
    .line 121
    .line 122
    filled-new-array {v1, v2}, [[F

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->CONTENT_VIEW_PARAM:[[F

    .line 127
    .line 128
    new-array v1, v0, [F

    .line 129
    .line 130
    fill-array-data v1, :array_f

    .line 131
    .line 132
    .line 133
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->WIDTH_VELOCITY_RATE_Y:[F

    .line 134
    .line 135
    new-array v0, v0, [F

    .line 136
    .line 137
    fill-array-data v0, :array_10

    .line 138
    .line 139
    .line 140
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->SCALE_Y_VELOCITY:[F

    .line 141
    .line 142
    return-void

    .line 143
    :array_0
    .array-data 4
        0x43480000    # 200.0f
        0x3f59999a    # 0.85f
    .end array-data

    .line 144
    .line 145
    .line 146
    :array_1
    .array-data 4
        0x43040000    # 132.0f
        0x3f59999a    # 0.85f
    .end array-data

    :array_2
    .array-data 4
        0x43480000    # 200.0f
        0x3f59999a    # 0.85f
    .end array-data

    :array_3
    .array-data 4
        0x43040000    # 132.0f
        0x3f59999a    # 0.85f
    .end array-data

    :array_4
    .array-data 4
        0x43480000    # 200.0f
        0x3f59999a    # 0.85f
    .end array-data

    :array_5
    .array-data 4
        0x43040000    # 132.0f
        0x3f6147ae    # 0.88f
    .end array-data

    :array_6
    .array-data 4
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_7
    .array-data 4
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_8
    .array-data 4
        0x43480000    # 200.0f
        0x3f59999a    # 0.85f
    .end array-data

    :array_9
    .array-data 4
        0x43040000    # 132.0f
        0x3f59999a    # 0.85f
    .end array-data

    :array_a
    .array-data 4
        0x447a0000    # 1000.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_b
    .array-data 4
        0x447a0000    # 1000.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_c
    .array-data 8
        0x14
        0x50
    .end array-data

    :array_d
    .array-data 4
        0x43960000    # 300.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_e
    .array-data 4
        0x43480000    # 200.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_f
    .array-data 4
        0x3f800000    # 1.0f
        0x3fa66666    # 1.3f
    .end array-data

    :array_10
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f000000    # 0.5f
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
.method public final getALPHA_PARAM()[[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->ALPHA_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getALPHA_START_DELAY()[J
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->ALPHA_START_DELAY:[J

    .line 2
    .line 3
    return-object p0
.end method

.method public final getCENTER_X_PARAM()[[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->CENTER_X_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getCONTENT_VIEW_PARAM()[[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->CONTENT_VIEW_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRADIUS_PARAM()[[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->RADIUS_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRECT_RADIO_PARAM()[[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->RECT_RADIO_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRECT_Y_PARAM()[[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->RECT_Y_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSCALE_Y_VELOCITY()[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->SCALE_Y_VELOCITY:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getWIDTH_PARAM()[[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->WIDTH_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getWIDTH_VELOCITY_RATE_Y()[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->WIDTH_VELOCITY_RATE_Y:[F

    .line 2
    .line 3
    return-object p0
.end method
