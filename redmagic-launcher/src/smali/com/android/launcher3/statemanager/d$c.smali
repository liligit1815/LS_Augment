.class Lcom/android/launcher3/statemanager/d$c;
.super LQ1/f;
.source "StateManager.java"

# interfaces
.implements Lcom/android/launcher3/anim/T;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/statemanager/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<STATE_TYPE:",
        "Ljava/lang/Object;",
        ">",
        "LQ1/f;",
        "Lcom/android/launcher3/anim/T;"
    }
.end annotation


# static fields
.field private static final p:LQ1/f;


# instance fields
.field public k:Lcom/android/launcher3/anim/q;

.field public l:Landroid/animation/AnimatorSet;

.field public m:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TSTATE_TYPE;"
        }
    .end annotation
.end field

.field public n:I

.field public o:Lcom/android/quickstep/util/animation/MultiAnimatorSet;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LQ1/f;

    .line 2
    .line 3
    invoke-direct {v0}, LQ1/f;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/statemanager/d$c;->p:LQ1/f;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, LQ1/f;-><init>()V

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lcom/android/launcher3/statemanager/d$c;->n:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/statemanager/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/statemanager/d$c;-><init>()V

    return-void
.end method

.method private f()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/statemanager/d$c;->o:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_5

    .line 9
    .line 10
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->k0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x0

    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const v4, 0x7f140229

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, v2}, Lcom/android/launcher3/LongClickTextView;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    const v3, 0x7f07051c

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v2}, Lcom/android/launcher3/H5$g;->b()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    invoke-virtual {v0, v2}, Lcom/android/launcher3/LongClickTextView;->setLongClickTextViewColor(I)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual {v2}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    check-cast v2, Lcom/android/launcher3/V3;

    .line 117
    .line 118
    invoke-virtual {v2}, Lcom/android/launcher3/V3;->z()Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_0

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->G0()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    int-to-float v1, v1

    .line 133
    :cond_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    const/16 v0, 0x8

    .line 145
    .line 146
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->k0()Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-nez v0, :cond_5

    .line 159
    .line 160
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->N0()Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-nez v0, :cond_3

    .line 169
    .line 170
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->k:Z

    .line 175
    .line 176
    if-eqz v0, :cond_2

    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    const/4 v3, 0x4

    .line 184
    invoke-virtual {v0, v3}, Lcom/android/launcher3/LongClickTextView;->setVisibility(I)V

    .line 185
    .line 186
    .line 187
    goto :goto_1

    .line 188
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0}, Lcom/android/launcher3/LongClickTextView;->h()V

    .line 193
    .line 194
    .line 195
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    if-eqz v0, :cond_5

    .line 204
    .line 205
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->V2()Z

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 229
    .line 230
    invoke-interface {p0, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 231
    .line 232
    .line 233
    move-result v3

    .line 234
    sget-object v4, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 235
    .line 236
    invoke-interface {p0, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 237
    .line 238
    .line 239
    move-result v5

    .line 240
    invoke-virtual {v0, v2, v3, v5}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->b(ZZZ)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    new-instance v2, Ljava/lang/StringBuilder;

    .line 248
    .line 249
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 250
    .line 251
    .line 252
    const-string v3, "onAnimationEndMFV: set indicator color: "

    .line 253
    .line 254
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v3

    .line 261
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    const-string v3, "StateManager"

    .line 269
    .line 270
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    .line 272
    .line 273
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    invoke-virtual {v2, v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->setMfvPageIndicatorColor(I)V

    .line 282
    .line 283
    .line 284
    invoke-interface {p0, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    if-eqz v0, :cond_4

    .line 289
    .line 290
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->G0()I

    .line 303
    .line 304
    .line 305
    move-result p0

    .line 306
    int-to-float p0, p0

    .line 307
    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setTranslationY(F)V

    .line 308
    .line 309
    .line 310
    return-void

    .line 311
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    invoke-virtual {p0, v1}, Landroid/widget/RelativeLayout;->setTranslationY(F)V

    .line 320
    .line 321
    .line 322
    :cond_5
    return-void
.end method


# virtual methods
.method public g()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d$c;->k:Lcom/android/launcher3/anim/q;

    .line 4
    .line 5
    sget-object v2, Lcom/android/launcher3/statemanager/d$c;->p:LQ1/f;

    .line 6
    .line 7
    invoke-virtual {v2, p0}, LQ1/f;->a(LQ1/f;)V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-object v2, p0, Lcom/android/launcher3/statemanager/d$c;->m:Ljava/lang/Object;

    .line 12
    .line 13
    const-string v3, "StateManager"

    .line 14
    .line 15
    const-string v4, "reset current anim."

    .line 16
    .line 17
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iput-object v2, p0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 21
    .line 22
    iput-object v2, p0, Lcom/android/launcher3/statemanager/d$c;->k:Lcom/android/launcher3/anim/q;

    .line 23
    .line 24
    iget v2, p0, Lcom/android/launcher3/statemanager/d$c;->n:I

    .line 25
    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    iput v2, p0, Lcom/android/launcher3/statemanager/d$c;->n:I

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/android/launcher3/anim/q;->i()Lcom/android/launcher3/anim/q;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->j()Lcom/android/launcher3/anim/q;

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    if-eqz v0, :cond_2

    .line 48
    .line 49
    const-wide/16 v1, 0x0

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_1

    .line 59
    .line 60
    new-instance p0, Lcom/android/launcher3/anim/l;

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/android/launcher3/anim/l;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, p0}, Lcom/android/launcher3/anim/q;->g(Landroid/animation/Animator;Ljava/util/function/BiConsumer;)V

    .line 66
    .line 67
    .line 68
    new-instance p0, Lcom/android/launcher3/anim/k;

    .line 69
    .line 70
    invoke-direct {p0}, Lcom/android/launcher3/anim/k;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, p0}, Lcom/android/launcher3/anim/q;->g(Landroid/animation/Animator;Ljava/util/function/BiConsumer;)V

    .line 74
    .line 75
    .line 76
    :cond_1
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 77
    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method public h(Landroid/animation/AnimatorSet;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/animation/AnimatorSet;",
            "TSTATE_TYPE;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setAnimation: set current anim, target state: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "StateManager"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    iput-object p2, p0, Lcom/android/launcher3/statemanager/d$c;->m:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public i(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/animation/MultiAnimatorSet;",
            "TSTATE_TYPE;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d$c;->o:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/statemanager/d$c;->m:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->addListener(Lcom/android/launcher3/anim/T;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d$c;->k:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-ne v0, p1, :cond_0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/android/launcher3/statemanager/d$c;->k:Lcom/android/launcher3/anim/q;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    if-ne v0, p1, :cond_1

    .line 17
    .line 18
    const-string p1, "StateManager"

    .line 19
    .line 20
    const-string v0, "onAnimationEnd: set current anim null."

    .line 21
    .line 22
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 26
    .line 27
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/statemanager/d$c;->f()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method
