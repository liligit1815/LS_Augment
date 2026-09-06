.class public final Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;
.super Ljava/lang/Object;
.source "SpringAnimationImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/SpringAnimationImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DepthSpringAnimImp"
.end annotation


# static fields
.field private static final DEPTH:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "LP1/h;",
            ">;"
        }
    .end annotation
.end field

.field private static final ICON_BLUR:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "LP1/h;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

.field private mDepthController:LP1/h;

.field private mIconBlurAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

.field private mLauncher:Lcom/android/launcher3/C2;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp$1;

    .line 2
    .line 3
    const-string v1, "Depth"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp$1;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->DEPTH:Landroid/util/FloatProperty;

    .line 9
    .line 10
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp$2;

    .line 11
    .line 12
    const-string v1, "ICON_BLUR"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp$2;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->ICON_BLUR:Landroid/util/FloatProperty;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(LP1/h;Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "mDepthController"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthController:LP1/h;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mLauncher:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final cancelDepthAnimImmediately()V
    .locals 0

    .line 1
    invoke-static {}, LM3/a;->e()Z

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringAnimation;->cancel()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final cancelImmediately()V
    .locals 1

    .line 1
    invoke-static {}, LM3/a;->e()Z

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringAnimation;->cancel()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mIconBlurAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringAnimation;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public final depthTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;
    .locals 6

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/high16 v2, 0x3f800000    # 1.0f

    .line 7
    .line 8
    const-string v3, "SpringAnimationImpl"

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mLauncher:Lcom/android/launcher3/C2;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->k()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mLauncher:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->p(Lcom/android/launcher3/C2;)F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    new-instance v4, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v5, "depthTo aiFutureScreenBlurPro="

    .line 34
    .line 35
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v5, " old finalPosition="

    .line 42
    .line 43
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v5, " getState="

    .line 50
    .line 51
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v5, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mLauncher:Lcom/android/launcher3/C2;

    .line 55
    .line 56
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-virtual {v5}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    cmpl-float v4, v0, v1

    .line 75
    .line 76
    if-ltz v4, :cond_0

    .line 77
    .line 78
    cmpg-float v4, v0, v2

    .line 79
    .line 80
    if-gtz v4, :cond_0

    .line 81
    .line 82
    move p3, v0

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mLauncher:Lcom/android/launcher3/C2;

    .line 84
    .line 85
    if-eqz v0, :cond_1

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R2()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_1

    .line 92
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    const-string v4, "depthTo isInMiBoard set finalPosition 1 old finalPosition="

    .line 99
    .line 100
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    invoke-static {v3, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move p3, v2

    .line 114
    :cond_1
    invoke-static {}, LM3/a;->e()Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_3

    .line 119
    .line 120
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 121
    .line 122
    new-instance v4, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    const-string v5, "depthTo, animate: "

    .line 128
    .line 129
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v5, ", running: "

    .line 136
    .line 137
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    if-eqz v0, :cond_2

    .line 141
    .line 142
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    goto :goto_0

    .line 151
    :cond_2
    const/4 v0, 0x0

    .line 152
    :goto_0
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string v0, ", "

    .line 156
    .line 157
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v0, " to "

    .line 164
    .line 165
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-static {v3, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 179
    .line 180
    if-nez v0, :cond_4

    .line 181
    .line 182
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 183
    .line 184
    iget-object v3, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthController:LP1/h;

    .line 185
    .line 186
    sget-object v4, Lcom/android/quickstep/util/BaseDepthController;->DEPTH_WITHOUT_ZOOM:Landroid/util/FloatProperty;

    .line 187
    .line 188
    invoke-direct {v0, v3, v4}, Lcom/android/quickstep/util/animation/SpringAnimation;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;)V

    .line 189
    .line 190
    .line 191
    new-instance v3, Lcom/android/quickstep/util/animation/SpringForce;

    .line 192
    .line 193
    invoke-direct {v3, v1}, Lcom/android/quickstep/util/animation/SpringForce;-><init>(F)V

    .line 194
    .line 195
    .line 196
    const/high16 v1, 0x43fa0000    # 500.0f

    .line 197
    .line 198
    invoke-virtual {v3, v1}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    sget-object v3, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

    .line 203
    .line 204
    invoke-virtual {v3, v2}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;->getScaledStiffness(F)F

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringAnimation;->setSpring(Lcom/android/quickstep/util/animation/SpringForce;)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iput-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 217
    .line 218
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 219
    .line 220
    .line 221
    const v1, 0x3a03126f    # 5.0E-4f

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 225
    .line 226
    .line 227
    :cond_4
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthController:LP1/h;

    .line 228
    .line 229
    const/4 v1, 0x1

    .line 230
    invoke-virtual {v0, v1}, LP1/h;->L(Z)V

    .line 231
    .line 232
    .line 233
    if-nez p1, :cond_5

    .line 234
    .line 235
    iget-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 236
    .line 237
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    if-eqz p1, :cond_5

    .line 245
    .line 246
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 247
    .line 248
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    return-object p0

    .line 252
    :cond_5
    iget-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 253
    .line 254
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 258
    .line 259
    .line 260
    move-result p1

    .line 261
    if-nez p1, :cond_6

    .line 262
    .line 263
    sget-object p1, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->DEPTH:Landroid/util/FloatProperty;

    .line 264
    .line 265
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthController:LP1/h;

    .line 266
    .line 267
    invoke-virtual {p1, v0, p2}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 268
    .line 269
    .line 270
    :cond_6
    iget-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 271
    .line 272
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    invoke-virtual {p1, p3}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    sget-object p2, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

    .line 284
    .line 285
    invoke-virtual {p2, p4}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;->getScaledStiffness(F)F

    .line 286
    .line 287
    .line 288
    move-result p2

    .line 289
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    invoke-virtual {p1, p5}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 294
    .line 295
    .line 296
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 297
    .line 298
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 299
    .line 300
    .line 301
    return-object p0
.end method

.method public final iconBlurTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;
    .locals 4

    .line 1
    invoke-static {}, LM3/a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "iconBlurTo, animate: "

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, ", running: "

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v0, 0x0

    .line 39
    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v0, ", "

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v0, " to "

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "SpringAnimationImpl"

    .line 63
    .line 64
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mIconBlurAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 68
    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthController:LP1/h;

    .line 74
    .line 75
    sget-object v2, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->ICON_BLUR:Landroid/util/FloatProperty;

    .line 76
    .line 77
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimation;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;)V

    .line 78
    .line 79
    .line 80
    new-instance v1, Lcom/android/quickstep/util/animation/SpringForce;

    .line 81
    .line 82
    const/4 v2, 0x0

    .line 83
    invoke-direct {v1, v2}, Lcom/android/quickstep/util/animation/SpringForce;-><init>(F)V

    .line 84
    .line 85
    .line 86
    const/high16 v2, 0x43fa0000    # 500.0f

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    sget-object v2, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

    .line 93
    .line 94
    const/high16 v3, 0x3f800000    # 1.0f

    .line 95
    .line 96
    invoke-virtual {v2, v3}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;->getScaledStiffness(F)F

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/SpringAnimation;->setSpring(Lcom/android/quickstep/util/animation/SpringForce;)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mIconBlurAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 109
    .line 110
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    const v1, 0x3a83126f    # 0.001f

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 117
    .line 118
    .line 119
    :cond_2
    if-nez p1, :cond_3

    .line 120
    .line 121
    iget-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mIconBlurAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 122
    .line 123
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-eqz p1, :cond_3

    .line 131
    .line 132
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mIconBlurAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 133
    .line 134
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    return-object p0

    .line 138
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mIconBlurAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 139
    .line 140
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-nez p1, :cond_4

    .line 148
    .line 149
    sget-object p1, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->ICON_BLUR:Landroid/util/FloatProperty;

    .line 150
    .line 151
    iget-object v0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthController:LP1/h;

    .line 152
    .line 153
    invoke-virtual {p1, v0, p2}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 154
    .line 155
    .line 156
    :cond_4
    iget-object p1, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mIconBlurAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 157
    .line 158
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/SpringAnimation;->getSpring()Lcom/android/quickstep/util/animation/SpringForce;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p1, p3}, Lcom/android/quickstep/util/animation/SpringForce;->setFinalPosition(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    sget-object p2, Lcom/android/quickstep/util/animation/SpringAnimationImpl;->INSTANCE:Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;

    .line 170
    .line 171
    invoke-virtual {p2, p4}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$Companion;->getScaledStiffness(F)F

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/animation/SpringForce;->setStiffness(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {p1, p5}, Lcom/android/quickstep/util/animation/SpringForce;->setDampingRatio(F)Lcom/android/quickstep/util/animation/SpringForce;

    .line 180
    .line 181
    .line 182
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mIconBlurAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 183
    .line 184
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 185
    .line 186
    .line 187
    return-object p0
.end method

.method public final isDepthAnimRunning()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->mDepthAnim:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method
