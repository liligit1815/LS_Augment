.class public Lcom/android/quickstep/util/animation/AnimParamProvider;
.super Ljava/lang/Object;
.source "AnimParamProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;,
        Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;,
        Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;,
        Lcom/android/quickstep/util/animation/AnimParamProvider$WhenMappings;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;


# instance fields
.field protected alphaParam:[F

.field private alphaStartDelay:J

.field protected centerXParam:[F

.field private mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

.field protected radiusParam:[F

.field protected rectRadioParam:[F

.field protected rectYParam:[F

.field protected widthParam:[F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/animation/AnimParamProvider;->INSTANCE:Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "mAnimType"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/AnimParamProvider;->initParam()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static final get(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)Lcom/android/quickstep/util/animation/AnimParamProvider;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/AnimParamProvider;->INSTANCE:Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;->get(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)Lcom/android/quickstep/util/animation/AnimParamProvider;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static final getContentAnimParam(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/AnimParamProvider;->INSTANCE:Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;->getContentAnimParam(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)Lcom/android/quickstep/util/animation/AnimParamProvider$ContentAnimParam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static final getSwipeUpVelocityParam()Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/AnimParamProvider;->INSTANCE:Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;->getSwipeUpVelocityParam()Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method


# virtual methods
.method public final getAlphaParam()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->alphaParam:[F

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "alphaParam"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getAlphaStartDelay()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->alphaStartDelay:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final getCenterXParam()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->centerXParam:[F

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "centerXParam"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRadiusParam()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->radiusParam:[F

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "radiusParam"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getRectRadioParam()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->rectRadioParam:[F

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "rectRadioParam"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getRectYParam()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->rectYParam:[F

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "rectYParam"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getWidthParam()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->widthParam:[F

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "widthParam"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public initParam()V
    .locals 3

    .line 1
    sget v0, Lcom/android/launcher3/anim/x;->e:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/N5;->c(III)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sget-object v1, Lcom/android/quickstep/util/animation/AnimParamProvider$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 10
    .line 11
    iget-object v2, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    aget v1, v1, v2

    .line 18
    .line 19
    packed-switch v1, :pswitch_data_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :pswitch_0
    sget-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->getCENTER_X_PARAM()[[F

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    aget-object v2, v2, v0

    .line 30
    .line 31
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setCenterXParam([F)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->getRECT_Y_PARAM()[[F

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    aget-object v2, v2, v0

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRectYParam([F)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->getWIDTH_PARAM()[[F

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    aget-object v2, v2, v0

    .line 48
    .line 49
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setWidthParam([F)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->getRECT_RADIO_PARAM()[[F

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    aget-object v2, v2, v0

    .line 57
    .line 58
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRectRadioParam([F)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->getRADIUS_PARAM()[[F

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    aget-object v2, v2, v0

    .line 66
    .line 67
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRadiusParam([F)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$GestureToDragParam;->getALPHA_PARAM()[[F

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    aget-object v0, v1, v0

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setAlphaParam([F)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :pswitch_1
    sget-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeAssistantParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeAssistantParam;

    .line 81
    .line 82
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeAssistantParam;->getCENTER_X_PARAM()[F

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setCenterXParam([F)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeAssistantParam;->getRECT_Y_PARAM()[F

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRectYParam([F)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeAssistantParam;->getWIDTH_PARAM()[F

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setWidthParam([F)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeAssistantParam;->getRECT_RADIO_PARAM()[F

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRectRadioParam([F)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeAssistantParam;->getRADIUS_PARAM()[F

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRadiusParam([F)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeAssistantParam;->getALPHA_PARAM()[F

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setAlphaParam([F)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeAssistantParam;->getALPHA_START_DELAY()[J

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    aget-wide v0, v1, v0

    .line 129
    .line 130
    iput-wide v0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->alphaStartDelay:J

    .line 131
    .line 132
    return-void

    .line 133
    :pswitch_2
    sget-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;

    .line 134
    .line 135
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->getCENTER_X_PARAM()[[F

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    aget-object v2, v2, v0

    .line 140
    .line 141
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setCenterXParam([F)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->getRECT_Y_PARAM()[[F

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    aget-object v2, v2, v0

    .line 149
    .line 150
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRectYParam([F)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->getWIDTH_PARAM()[[F

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    aget-object v2, v2, v0

    .line 158
    .line 159
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setWidthParam([F)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->getRECT_RADIO_PARAM()[[F

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    aget-object v2, v2, v0

    .line 167
    .line 168
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRectRadioParam([F)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->getRADIUS_PARAM()[[F

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    aget-object v2, v2, v0

    .line 176
    .line 177
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRadiusParam([F)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->getALPHA_PARAM()[[F

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    aget-object v2, v2, v0

    .line 185
    .line 186
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setAlphaParam([F)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$SwipeUpToHomeParam;->getALPHA_START_DELAY()[J

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    aget-wide v0, v1, v0

    .line 194
    .line 195
    iput-wide v0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->alphaStartDelay:J

    .line 196
    .line 197
    return-void

    .line 198
    :pswitch_3
    sget-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;

    .line 199
    .line 200
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->getCENTER_X_PARAM()[F

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setCenterXParam([F)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->getRECT_Y_PARAM()[F

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRectYParam([F)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->getWIDTH_PARAM()[F

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setWidthParam([F)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->getRECT_RADIO_PARAM()[F

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRectRadioParam([F)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->getRADIUS_PARAM()[F

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRadiusParam([F)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->getALPHA_PARAM()[F

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setAlphaParam([F)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeAssistantParam;->getALPHA_START_DELAY()[J

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    aget-wide v0, v1, v0

    .line 247
    .line 248
    iput-wide v0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->alphaStartDelay:J

    .line 249
    .line 250
    return-void

    .line 251
    :pswitch_4
    sget-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;

    .line 252
    .line 253
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;->getCENTER_X_PARAM()[[F

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    aget-object v2, v2, v0

    .line 258
    .line 259
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setCenterXParam([F)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;->getRECT_Y_PARAM()[[F

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    aget-object v2, v2, v0

    .line 267
    .line 268
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRectYParam([F)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;->getWIDTH_PARAM()[[F

    .line 272
    .line 273
    .line 274
    move-result-object v2

    .line 275
    aget-object v2, v2, v0

    .line 276
    .line 277
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setWidthParam([F)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;->getRECT_RADIO_PARAM()[[F

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    aget-object v2, v2, v0

    .line 285
    .line 286
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRectRadioParam([F)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;->getRADIUS_PARAM()[[F

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    aget-object v2, v2, v0

    .line 294
    .line 295
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRadiusParam([F)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;->getALPHA_PARAM()[[F

    .line 299
    .line 300
    .line 301
    move-result-object v2

    .line 302
    aget-object v2, v2, v0

    .line 303
    .line 304
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setAlphaParam([F)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppCloseToHomeParam;->getALPHA_START_DELAY()[J

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    aget-wide v0, v1, v0

    .line 312
    .line 313
    iput-wide v0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->alphaStartDelay:J

    .line 314
    .line 315
    return-void

    .line 316
    :pswitch_5
    sget-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;

    .line 317
    .line 318
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;->getCENTER_X_PARAM()[[F

    .line 319
    .line 320
    .line 321
    move-result-object v2

    .line 322
    aget-object v2, v2, v0

    .line 323
    .line 324
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setCenterXParam([F)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;->getRECT_Y_PARAM()[[F

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    aget-object v2, v2, v0

    .line 332
    .line 333
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRectYParam([F)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;->getWIDTH_PARAM()[[F

    .line 337
    .line 338
    .line 339
    move-result-object v2

    .line 340
    aget-object v2, v2, v0

    .line 341
    .line 342
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setWidthParam([F)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;->getRECT_RADIO_PARAM()[[F

    .line 346
    .line 347
    .line 348
    move-result-object v2

    .line 349
    aget-object v2, v2, v0

    .line 350
    .line 351
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRectRadioParam([F)V

    .line 352
    .line 353
    .line 354
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;->getRADIUS_PARAM()[[F

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    aget-object v2, v2, v0

    .line 359
    .line 360
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setRadiusParam([F)V

    .line 361
    .line 362
    .line 363
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;->getALPHA_PARAM()[[F

    .line 364
    .line 365
    .line 366
    move-result-object v2

    .line 367
    aget-object v2, v2, v0

    .line 368
    .line 369
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/AnimParamProvider;->setAlphaParam([F)V

    .line 370
    .line 371
    .line 372
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/SpringAnimConstants$AppLaunchParam;->getALPHA_START_DELAY()[J

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    aget-wide v0, v1, v0

    .line 377
    .line 378
    iput-wide v0, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->alphaStartDelay:J

    .line 379
    .line 380
    return-void

    .line 381
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final setAlphaParam([F)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->alphaParam:[F

    .line 7
    .line 8
    return-void
.end method

.method public final setAlphaStartDelay(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->alphaStartDelay:J

    .line 2
    .line 3
    return-void
.end method

.method public final setCenterXParam([F)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->centerXParam:[F

    .line 7
    .line 8
    return-void
.end method

.method public final setMAnimType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 7
    .line 8
    return-void
.end method

.method public final setRadiusParam([F)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->radiusParam:[F

    .line 7
    .line 8
    return-void
.end method

.method public final setRectRadioParam([F)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->rectRadioParam:[F

    .line 7
    .line 8
    return-void
.end method

.method public final setRectYParam([F)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->rectYParam:[F

    .line 7
    .line 8
    return-void
.end method

.method public final setWidthParam([F)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimParamProvider;->widthParam:[F

    .line 7
    .line 8
    return-void
.end method
