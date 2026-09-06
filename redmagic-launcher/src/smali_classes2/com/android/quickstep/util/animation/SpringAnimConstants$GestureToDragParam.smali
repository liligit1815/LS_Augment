.class public final Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;
.super Ljava/lang/Object;
.source "SpringAnimConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/SpringAnimConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "GestureToDragParam"
.end annotation


# static fields
.field private static final ALPHA_PARAM:[[F

.field private static final CENTER_X_PARAM:[[F

.field public static final INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;

.field private static final RADIUS_PARAM:[[F

.field private static final RECT_RADIO_PARAM:[[F

.field private static final RECT_Y_PARAM:[[F

.field private static final WIDTH_PARAM:[[F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;

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
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->CENTER_X_PARAM:[[F

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
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->RECT_Y_PARAM:[[F

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
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->WIDTH_PARAM:[[F

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
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->RADIUS_PARAM:[[F

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
    sput-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->RECT_RADIO_PARAM:[[F

    .line 88
    .line 89
    new-array v1, v0, [F

    .line 90
    .line 91
    fill-array-data v1, :array_a

    .line 92
    .line 93
    .line 94
    new-array v0, v0, [F

    .line 95
    .line 96
    fill-array-data v0, :array_b

    .line 97
    .line 98
    .line 99
    filled-new-array {v1, v0}, [[F

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->ALPHA_PARAM:[[F

    .line 104
    .line 105
    return-void

    .line 106
    nop

    .line 107
    :array_0
    .array-data 4
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    :array_1
    .array-data 4
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    :array_2
    .array-data 4
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    :array_3
    .array-data 4
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    :array_4
    .array-data 4
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    :array_5
    .array-data 4
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
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
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_9
    .array-data 4
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_a
    .array-data 4
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_b
    .array-data 4
        0x43c80000    # 400.0f
        0x3f800000    # 1.0f
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
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->ALPHA_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getCENTER_X_PARAM()[[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->CENTER_X_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRADIUS_PARAM()[[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->RADIUS_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRECT_RADIO_PARAM()[[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->RECT_RADIO_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRECT_Y_PARAM()[[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->RECT_Y_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getWIDTH_PARAM()[[F
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->WIDTH_PARAM:[[F

    .line 2
    .line 3
    return-object p0
.end method
