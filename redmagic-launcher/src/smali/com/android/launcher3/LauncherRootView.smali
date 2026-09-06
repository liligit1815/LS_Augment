.class public Lcom/android/launcher3/LauncherRootView;
.super Lcom/android/launcher3/h1;
.source "LauncherRootView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/LauncherRootView$e;
    }
.end annotation


# static fields
.field private static final o:Ljava/util/List;
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:Landroid/graphics/Rect;

.field private final h:Lcom/android/launcher3/statemanager/i;

.field private i:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private j:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private final k:Ln1/x;

.field l:Lcom/android/launcher3/oneshot/OneShotLayout;

.field m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

.field n:Landroid/animation/AnimatorSet;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/android/launcher3/LauncherRootView;->o:Ljava/util/List;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/h1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/launcher3/LauncherRootView;->g:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance p2, Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    invoke-direct {p2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/android/launcher3/statemanager/i;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/launcher3/LauncherRootView;->h:Lcom/android/launcher3/statemanager/i;

    .line 25
    .line 26
    new-instance p1, Ln1/x;

    .line 27
    .line 28
    invoke-direct {p1, p0}, Ln1/x;-><init>(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/android/launcher3/LauncherRootView;->k:Ln1/x;

    .line 32
    .line 33
    return-void
.end method

.method static bridge synthetic b(Lcom/android/launcher3/LauncherRootView;Lcom/android/launcher3/C2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/LauncherRootView;->j(Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/LauncherRootView;Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/LauncherRootView;->k(Lcom/android/launcher3/C2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e(Lcom/android/launcher3/C2;ZLandroid/graphics/Point;I)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "launcherOneShot: addOnMirrorToEndLayoutAndDoWallpaperAnimation   isFromAod="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "LauncherRootView"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    const-string p0, "launcherOneShot: addOnMirrorToEndLayoutAndDoWallpaperAnimation return, for the mOneShotAnimationSet is null! "

    .line 28
    .line 29
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/LauncherRootView;->h()V

    .line 34
    .line 35
    .line 36
    const-string v0, "launcherOneShot: addOnMirrorToEndLayoutAndDoWallpaperAnimation return, for the wallpaperAlphaAnimator is empty! "

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    const/4 v3, 0x0

    .line 40
    const/4 v4, 0x0

    .line 41
    const/4 v5, -0x1

    .line 42
    if-eqz p2, :cond_7

    .line 43
    .line 44
    if-eqz p3, :cond_6

    .line 45
    .line 46
    iget p2, p3, Landroid/graphics/Point;->x:I

    .line 47
    .line 48
    if-eqz p2, :cond_6

    .line 49
    .line 50
    iget p2, p3, Landroid/graphics/Point;->y:I

    .line 51
    .line 52
    if-nez p2, :cond_1

    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :cond_1
    iget-object p2, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 57
    .line 58
    if-nez p2, :cond_2

    .line 59
    .line 60
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    const v6, 0x7f0e017c

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2, v6, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    check-cast p2, Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 76
    .line 77
    iput-object p2, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 78
    .line 79
    new-instance p2, Lcom/android/launcher3/h1$a;

    .line 80
    .line 81
    invoke-direct {p2, v5, v5}, Lcom/android/launcher3/h1$a;-><init>(II)V

    .line 82
    .line 83
    .line 84
    iput-boolean v2, p2, Lcom/android/launcher3/h1$a;->a:Z

    .line 85
    .line 86
    iget-object v2, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 87
    .line 88
    invoke-virtual {v2, p2}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    new-instance p2, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 97
    .line 98
    invoke-virtual {v2, p3, p4}, Lcom/android/launcher3/oneshot/OneShotLayout;->b(Landroid/graphics/Point;I)Landroid/animation/ValueAnimator;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    if-eqz p3, :cond_5

    .line 103
    .line 104
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    iget-object p3, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 108
    .line 109
    invoke-virtual {p3}, Lcom/android/launcher3/oneshot/OneShotLayout;->getOneMirrorToEndFromAodBlurAlphaAnimation()Landroid/animation/ValueAnimator;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    if-eqz p3, :cond_4

    .line 114
    .line 115
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    new-instance p3, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string p4, "launcherOneShot: addOnMirrorToEndLayoutAndDoWallpaperAnimation-fromAod childCount_begin= "

    .line 124
    .line 125
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 129
    .line 130
    .line 131
    move-result p4

    .line 132
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p3

    .line 139
    invoke-static {v1, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    iget-object p3, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 143
    .line 144
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 145
    .line 146
    .line 147
    move-result-object p3

    .line 148
    if-eqz p3, :cond_3

    .line 149
    .line 150
    iget-object p3, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 151
    .line 152
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 153
    .line 154
    .line 155
    move-result-object p3

    .line 156
    instance-of p3, p3, Landroid/view/ViewGroup;

    .line 157
    .line 158
    if-eqz p3, :cond_3

    .line 159
    .line 160
    iget-object p3, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 161
    .line 162
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 163
    .line 164
    .line 165
    move-result-object p3

    .line 166
    check-cast p3, Landroid/view/ViewGroup;

    .line 167
    .line 168
    iget-object p4, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 169
    .line 170
    invoke-virtual {p3, p4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 171
    .line 172
    .line 173
    :cond_3
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 174
    .line 175
    .line 176
    move-result-object p3

    .line 177
    iget-object p4, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 178
    .line 179
    invoke-virtual {p3, p4, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 180
    .line 181
    .line 182
    iget-object p3, p0, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 183
    .line 184
    new-array p4, v4, [Landroid/animation/ValueAnimator;

    .line 185
    .line 186
    invoke-interface {p2, p4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    check-cast p2, [Landroid/animation/Animator;

    .line 191
    .line 192
    invoke-virtual {p3, p2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 193
    .line 194
    .line 195
    iget-object p2, p0, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 196
    .line 197
    new-instance p3, Lcom/android/launcher3/LauncherRootView$a;

    .line 198
    .line 199
    invoke-direct {p3, p0, p1}, Lcom/android/launcher3/LauncherRootView$a;-><init>(Lcom/android/launcher3/LauncherRootView;Lcom/android/launcher3/C2;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p2, p3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 203
    .line 204
    .line 205
    iget-object p0, p0, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 206
    .line 207
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_4
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_5
    const-string p0, "launcherOneShot: addOnMirrorToEndLayoutAndDoWallpaperAnimation return, for the wallpaperAnimator is empty! "

    .line 216
    .line 217
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    .line 219
    .line 220
    return-void

    .line 221
    :cond_6
    :goto_0
    const-string p0, "launcherOneShot: addOnMirrorToEndLayoutAndDoWallpaperAnimation return, for the oneShotCoordinatePoint is null! or the value is 0!! "

    .line 222
    .line 223
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    .line 225
    .line 226
    return-void

    .line 227
    :cond_7
    iget-object p2, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 228
    .line 229
    if-nez p2, :cond_8

    .line 230
    .line 231
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 232
    .line 233
    .line 234
    move-result-object p2

    .line 235
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    const p3, 0x7f0e017b

    .line 240
    .line 241
    .line 242
    invoke-virtual {p2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 243
    .line 244
    .line 245
    move-result-object p2

    .line 246
    check-cast p2, Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 247
    .line 248
    iput-object p2, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 249
    .line 250
    new-instance p2, Lcom/android/launcher3/h1$a;

    .line 251
    .line 252
    invoke-direct {p2, v5, v5}, Lcom/android/launcher3/h1$a;-><init>(II)V

    .line 253
    .line 254
    .line 255
    iput-boolean v2, p2, Lcom/android/launcher3/h1$a;->a:Z

    .line 256
    .line 257
    iget-object p3, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 258
    .line 259
    invoke-virtual {p3, p2}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 260
    .line 261
    .line 262
    :cond_8
    new-instance p2, Ljava/util/ArrayList;

    .line 263
    .line 264
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 265
    .line 266
    .line 267
    iget-object p3, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 268
    .line 269
    invoke-virtual {p3}, Lcom/android/launcher3/oneshot/OneShotBlurLayout;->getOneMirrorToEndFromKeyguardAnimation()Landroid/animation/ValueAnimator;

    .line 270
    .line 271
    .line 272
    move-result-object p3

    .line 273
    if-eqz p3, :cond_b

    .line 274
    .line 275
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    iget-object p3, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 279
    .line 280
    invoke-virtual {p3}, Lcom/android/launcher3/oneshot/OneShotBlurLayout;->getOneMirrorToEndFromKeyguardBlurAlphaAnimation()Landroid/animation/ValueAnimator;

    .line 281
    .line 282
    .line 283
    move-result-object p3

    .line 284
    if-eqz p3, :cond_a

    .line 285
    .line 286
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    new-instance p3, Ljava/lang/StringBuilder;

    .line 290
    .line 291
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 292
    .line 293
    .line 294
    const-string p4, "launcherOneShot: addOnMirrorToEndLayoutAndDoWallpaperAnimation-fromKeyguard childCount_begin= "

    .line 295
    .line 296
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 300
    .line 301
    .line 302
    move-result p4

    .line 303
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object p3

    .line 310
    invoke-static {v1, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    .line 312
    .line 313
    iget-object p3, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 314
    .line 315
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 316
    .line 317
    .line 318
    move-result-object p3

    .line 319
    if-eqz p3, :cond_9

    .line 320
    .line 321
    iget-object p3, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 322
    .line 323
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 324
    .line 325
    .line 326
    move-result-object p3

    .line 327
    instance-of p3, p3, Landroid/view/ViewGroup;

    .line 328
    .line 329
    if-eqz p3, :cond_9

    .line 330
    .line 331
    iget-object p3, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 332
    .line 333
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 334
    .line 335
    .line 336
    move-result-object p3

    .line 337
    check-cast p3, Landroid/view/ViewGroup;

    .line 338
    .line 339
    iget-object p4, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 340
    .line 341
    invoke-virtual {p3, p4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 342
    .line 343
    .line 344
    :cond_9
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 345
    .line 346
    .line 347
    move-result-object p3

    .line 348
    iget-object p4, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 349
    .line 350
    invoke-virtual {p3, p4, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 351
    .line 352
    .line 353
    iget-object p3, p0, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 354
    .line 355
    new-array p4, v4, [Landroid/animation/ValueAnimator;

    .line 356
    .line 357
    invoke-interface {p2, p4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 358
    .line 359
    .line 360
    move-result-object p2

    .line 361
    check-cast p2, [Landroid/animation/Animator;

    .line 362
    .line 363
    invoke-virtual {p3, p2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 364
    .line 365
    .line 366
    iget-object p2, p0, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 367
    .line 368
    new-instance p3, Lcom/android/launcher3/LauncherRootView$b;

    .line 369
    .line 370
    invoke-direct {p3, p0, p1}, Lcom/android/launcher3/LauncherRootView$b;-><init>(Lcom/android/launcher3/LauncherRootView;Lcom/android/launcher3/C2;)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {p2, p3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 374
    .line 375
    .line 376
    iget-object p0, p0, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 377
    .line 378
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 379
    .line 380
    .line 381
    return-void

    .line 382
    :cond_a
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    .line 384
    .line 385
    return-void

    .line 386
    :cond_b
    const-string p0, "launcherOneShot: addOnMirrorToEndLayoutAndDoWallpaperAnimation return, for the wallpaperScaleAnimator is empty! "

    .line 387
    .line 388
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    .line 390
    .line 391
    return-void
.end method

.method private g(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->h:Lcom/android/launcher3/statemanager/i;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v2, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 23
    .line 24
    if-ne v0, v2, :cond_0

    .line 25
    .line 26
    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->h:Lcom/android/launcher3/statemanager/i;

    .line 29
    .line 30
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, p1}, Lcom/android/launcher3/h0;->q1(Landroid/graphics/Rect;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/h1;->mInsets:Landroid/graphics/Rect;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {p0, p1}, Lcom/android/launcher3/LauncherRootView;->setInsets(Landroid/graphics/Rect;)V

    .line 44
    .line 45
    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/launcher3/LauncherRootView;->h:Lcom/android/launcher3/statemanager/i;

    .line 49
    .line 50
    sget-object v0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 51
    .line 52
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/launcher3/LauncherRootView;->h:Lcom/android/launcher3/statemanager/i;

    .line 59
    .line 60
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->z()Lcom/android/launcher3/statemanager/a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    if-eq p1, v0, :cond_2

    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/LauncherRootView;->h:Lcom/android/launcher3/statemanager/i;

    .line 71
    .line 72
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object p0, p0, Lcom/android/launcher3/LauncherRootView;->h:Lcom/android/launcher3/statemanager/i;

    .line 77
    .line 78
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 87
    .line 88
    if-eq p0, v0, :cond_1

    .line 89
    .line 90
    const/4 v1, 0x1

    .line 91
    :cond_1
    invoke-virtual {p1, v1}, Lcom/android/launcher3/statemanager/d;->a0(Z)V

    .line 92
    .line 93
    .line 94
    :cond_2
    return-void
.end method

.method private i()Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "launcherOneShot: isOneShotAnimationRunning mOneShotAnimationSet.isRunning()="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const-string v1, "null"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "LauncherRootView"

    .line 34
    .line 35
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_1
    const/4 p0, 0x0

    .line 51
    return p0
.end method

.method private j(Lcom/android/launcher3/C2;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/LauncherRootView$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/LauncherRootView$c;-><init>(Lcom/android/launcher3/LauncherRootView;Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 p1, 0x64

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1, p2}, Landroid/widget/FrameLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private k(Lcom/android/launcher3/C2;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/LauncherRootView$d;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/LauncherRootView$d;-><init>(Lcom/android/launcher3/LauncherRootView;Lcom/android/launcher3/C2;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x64

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1, v2}, Landroid/widget/FrameLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private l(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/util/window/d;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/util/window/d;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Lcom/android/launcher3/LauncherRootView;->g:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-virtual {v0, v1, p1, v2}, Lcom/android/launcher3/util/window/d;->normalizeWindowInsets(Landroid/content/Context;Landroid/view/WindowInsets;Landroid/graphics/Rect;)Landroid/view/WindowInsets;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->g:Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-direct {p0, v0}, Lcom/android/launcher3/LauncherRootView;->g(Landroid/graphics/Rect;)V

    .line 26
    .line 27
    .line 28
    return-object p1
.end method


# virtual methods
.method public d(Lcom/android/launcher3/C2;ZLandroid/graphics/Point;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/LauncherRootView;->e(Lcom/android/launcher3/C2;ZLandroid/graphics/Point;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->k:Ln1/x;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ln1/x;->d(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "dispatchKeyEvent--event.getKeyCode() = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, " action= "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "LauncherRootView"

    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-direct {p0, v0}, Lcom/android/launcher3/LauncherRootView;->l(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->h:Lcom/android/launcher3/statemanager/i;

    .line 16
    .line 17
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/android/launcher3/h1;->mInsets:Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/android/launcher3/h0;->q1(Landroid/graphics/Rect;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/h1;->mInsets:Landroid/graphics/Rect;

    .line 27
    .line 28
    invoke-super {p0, v0}, Lcom/android/launcher3/h1;->setInsets(Landroid/graphics/Rect;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public getSysUiScrim()Ln1/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/LauncherRootView;->k:Ln1/x;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/LauncherRootView;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-string v0, "LauncherRootView"

    .line 8
    .line 9
    const-string v1, "launcherOneShot: interruptOneShotAnimation! "

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->n:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    instance-of v0, v0, Landroid/view/ViewGroup;

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Landroid/view/ViewGroup;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/launcher3/LauncherRootView;->l:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    instance-of v0, v0, Landroid/view/ViewGroup;

    .line 69
    .line 70
    if-eqz v0, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Landroid/view/ViewGroup;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/android/launcher3/LauncherRootView;->m:Lcom/android/launcher3/oneshot/OneShotBlurLayout;

    .line 81
    .line 82
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 83
    .line 84
    .line 85
    :cond_1
    return-void
.end method

.method public onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/LauncherRootView;->h:Lcom/android/launcher3/statemanager/i;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->handleConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0, p1}, Lcom/android/launcher3/LauncherRootView;->l(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method protected onLayout(ZIIII)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/android/launcher3/LauncherRootView;->o:Ljava/util/List;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {p1, p2, p3, p4, p5}, Landroid/graphics/Rect;->set(IIII)V

    .line 14
    .line 15
    .line 16
    iget-boolean p1, p0, Lcom/android/launcher3/LauncherRootView;->i:Z

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/android/launcher3/LauncherRootView;->setDisallowBackGesture(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/LauncherRootView;->k:Ln1/x;

    .line 22
    .line 23
    sub-int/2addr p4, p2

    .line 24
    sub-int/2addr p5, p3

    .line 25
    invoke-virtual {p0, p4, p5}, Ln1/x;->j(II)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onWindowVisibilityChanged(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setDisallowBackGesture(Z)V
    .locals 1

    .line 1
    sget-object v0, Lf1/a;->s:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/LauncherRootView;->i:Z

    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/android/launcher3/LauncherRootView;->j:Z

    .line 13
    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_2
    :goto_0
    sget-object p1, Lcom/android/launcher3/LauncherRootView;->o:Ljava/util/List;

    .line 23
    .line 24
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setSystemGestureExclusionRects(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setForceHideBackArrow(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/LauncherRootView;->j:Z

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/android/launcher3/LauncherRootView;->i:Z

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/LauncherRootView;->setDisallowBackGesture(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/h1;->mInsets:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1}, Lcom/android/launcher3/h1;->setInsets(Landroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/LauncherRootView;->k:Ln1/x;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ln1/x;->g(Landroid/graphics/Rect;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setWindowStateListener(Lcom/android/launcher3/LauncherRootView$e;)V
    .locals 0

    .line 1
    return-void
.end method
