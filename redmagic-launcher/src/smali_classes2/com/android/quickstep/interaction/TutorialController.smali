.class abstract Lcom/android/quickstep/interaction/TutorialController;
.super Ljava/lang/Object;
.source "TutorialController.java"

# interfaces
.implements Lcom/android/quickstep/interaction/EdgeBackGestureHandler$BackGestureAttemptCallback;
.implements Lcom/android/quickstep/interaction/NavBarGestureHandler$NavBarGestureAttemptCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/interaction/TutorialController$TutorialType;
    }
.end annotation


# static fields
.field private static final ADVANCE_TUTORIAL_TIMEOUT_MS:I = 0xbb8

.field private static final DEFAULT_PIXEL_TIPS_APP_NAME:Ljava/lang/CharSequence;

.field private static final DONE_BUTTON_ANNOUNCE_DELAY_MS:I = 0xfa0

.field private static final FEEDBACK_ANIMATION_MS:I = 0x85

.field private static final FINGER_DOT_ANIMATION_DURATION_MILLIS:I = 0x1f4

.field private static final FINGER_DOT_SMALL_SCALE:F = 0.7f

.field private static final FINGER_DOT_VISIBLE_ALPHA:F = 0.7f

.field private static final GESTURE_ANIMATION_PAUSE_DURATION_MILLIS:J = 0x3e8L

.field private static final GLIF_EXPRESSIVE_LIGHT_THEME:Ljava/lang/String; = "glif_expressive_light"

.field private static final GLIF_EXPRESSIVE_THEME:Ljava/lang/String; = "glif_expressive"

.field private static final LOG_TAG:Ljava/lang/String; = "TutorialController"

.field private static final PIXEL_TIPS_APP_PACKAGE_NAME:Ljava/lang/String; = "com.google.android.apps.tips"

.field private static final SUBTITLE_ANNOUNCE_DELAY_MS:I = 0xbb8

.field private static final SUW_THEME_SYSTEM_PROPERTY:Ljava/lang/String; = "setupwizard.theme"


# instance fields
.field protected mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

.field protected mCheckmarkAnimation:Lcom/airbnb/lottie/LottieAnimationView;

.field final mContext:Landroid/content/Context;

.field final mDoneButton:Landroid/widget/Button;

.field final mEdgeGestureVideoView:Landroid/widget/ImageView;

.field protected mExitingAppEndingCornerRadius:F

.field protected mExitingAppMargin:F

.field protected mExitingAppRadius:I

.field private final mExitingAppRect:Landroid/graphics/Rect;

.field protected mExitingAppStartingCornerRadius:F

.field protected mExitingAppView:Landroid/view/View;

.field final mFakeHotseatView:Landroid/widget/FrameLayout;

.field final mFakeIconView:Lcom/android/launcher3/views/ClipIconView;

.field final mFakeLauncherView:Landroid/widget/RelativeLayout;

.field final mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

.field final mFakeTaskView:Landroid/widget/FrameLayout;

.field private mFakeTaskViewCallback:Ljava/lang/Runnable;

.field final mFakeTaskbarView:Lcom/android/quickstep/interaction/AnimatedTaskbarView;

.field private mFakeTaskbarViewCallback:Ljava/lang/Runnable;

.field final mFeedbackSubtitleView:Landroid/widget/TextView;

.field final mFeedbackTitleView:Landroid/widget/TextView;

.field final mFeedbackView:Landroid/view/ViewGroup;

.field private mFeedbackViewCallback:Ljava/lang/Runnable;

.field final mFingerDotView:Landroid/widget/ImageView;

.field private mFullGestureDemonstration:Landroid/widget/RelativeLayout;

.field private mGestureCompleted:Z

.field mHotseatIconView:Landroid/view/View;

.field private final mIsExpressiveThemeEnabledInSUW:Z

.field final mRippleDrawable:Landroid/graphics/drawable/RippleDrawable;

.field final mRippleView:Landroid/view/View;

.field protected mScreenHeight:I

.field protected mScreenWidth:F

.field private final mShowFeedbackRunnable:Ljava/lang/Runnable;

.field final mSkipButton:Landroid/widget/TextView;

.field private final mSkipTutorialDialog:Landroidx/appcompat/app/b;

.field final mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

.field mTutorialType:Lcom/android/quickstep/interaction/TutorialController$TutorialType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "Pixel Tips"

    .line 2
    .line 3
    sput-object v0, Lcom/android/quickstep/interaction/TutorialController;->DEFAULT_PIXEL_TIPS_APP_NAME:Ljava/lang/CharSequence;

    .line 4
    .line 5
    return-void
.end method

.method constructor <init>(Lcom/android/quickstep/interaction/TutorialFragment;Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppRect:Landroid/graphics/Rect;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mGestureCompleted:Z

    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialType:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iput-object p2, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/quickstep/interaction/TutorialFragment;->getRootView()Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const v2, 0x7f0b029e

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Landroid/widget/TextView;

    .line 36
    .line 37
    iput-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mSkipButton:Landroid/widget/TextView;

    .line 38
    .line 39
    new-instance v3, Lcom/android/quickstep/interaction/H;

    .line 40
    .line 41
    invoke-direct {v3, p0}, Lcom/android/quickstep/interaction/H;-><init>(Lcom/android/quickstep/interaction/TutorialController;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    const v2, 0x7f0b02a2

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Landroid/view/ViewGroup;

    .line 55
    .line 56
    iput-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 57
    .line 58
    const v3, 0x7f0b02a1

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    check-cast v3, Landroid/widget/TextView;

    .line 66
    .line 67
    iput-object v3, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackTitleView:Landroid/widget/TextView;

    .line 68
    .line 69
    const v4, 0x7f0b02a0

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Landroid/widget/TextView;

    .line 77
    .line 78
    iput-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackSubtitleView:Landroid/widget/TextView;

    .line 79
    .line 80
    const v4, 0x7f0b0295

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    check-cast v4, Landroid/widget/ImageView;

    .line 88
    .line 89
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mEdgeGestureVideoView:Landroid/widget/ImageView;

    .line 90
    .line 91
    const v4, 0x7f0b0298

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    check-cast v4, Landroid/widget/RelativeLayout;

    .line 99
    .line 100
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeLauncherView:Landroid/widget/RelativeLayout;

    .line 101
    .line 102
    const v4, 0x7f0b0296

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    check-cast v4, Landroid/widget/FrameLayout;

    .line 110
    .line 111
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 112
    .line 113
    const v4, 0x7f0b0297

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    check-cast v4, Lcom/android/launcher3/views/ClipIconView;

    .line 121
    .line 122
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeIconView:Lcom/android/launcher3/views/ClipIconView;

    .line 123
    .line 124
    const v4, 0x7f0b029a

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    check-cast v4, Landroid/widget/FrameLayout;

    .line 132
    .line 133
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 134
    .line 135
    const/4 v4, 0x0

    .line 136
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarView:Lcom/android/quickstep/interaction/AnimatedTaskbarView;

    .line 137
    .line 138
    const v4, 0x7f0b0299

    .line 139
    .line 140
    .line 141
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    check-cast v4, Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 146
    .line 147
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 148
    .line 149
    const v4, 0x7f0b02aa

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mRippleView:Landroid/view/View;

    .line 157
    .line 158
    invoke-virtual {v4}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    check-cast v4, Landroid/graphics/drawable/RippleDrawable;

    .line 163
    .line 164
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mRippleDrawable:Landroid/graphics/drawable/RippleDrawable;

    .line 165
    .line 166
    const v4, 0x7f0b029d

    .line 167
    .line 168
    .line 169
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    check-cast v4, Landroid/widget/Button;

    .line 174
    .line 175
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mDoneButton:Landroid/widget/Button;

    .line 176
    .line 177
    const v4, 0x7f0b029c

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    check-cast v4, Landroid/widget/ImageView;

    .line 185
    .line 186
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mFingerDotView:Landroid/widget/ImageView;

    .line 187
    .line 188
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->createSkipTutorialDialog()Landroidx/appcompat/app/b;

    .line 189
    .line 190
    .line 191
    move-result-object v4

    .line 192
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mSkipTutorialDialog:Landroidx/appcompat/app/b;

    .line 193
    .line 194
    const v4, 0x7f0b028c

    .line 195
    .line 196
    .line 197
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 198
    .line 199
    .line 200
    move-result-object v4

    .line 201
    check-cast v4, Landroid/widget/RelativeLayout;

    .line 202
    .line 203
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mFullGestureDemonstration:Landroid/widget/RelativeLayout;

    .line 204
    .line 205
    const v4, 0x7f0b0155

    .line 206
    .line 207
    .line 208
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    check-cast v4, Lcom/airbnb/lottie/LottieAnimationView;

    .line 213
    .line 214
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mCheckmarkAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    .line 215
    .line 216
    const v4, 0x7f0b0290

    .line 217
    .line 218
    .line 219
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v4

    .line 223
    check-cast v4, Lcom/airbnb/lottie/LottieAnimationView;

    .line 224
    .line 225
    iput-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

    .line 226
    .line 227
    const v4, 0x7f0b0259

    .line 228
    .line 229
    .line 230
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    iput-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 235
    .line 236
    invoke-virtual {p1}, Lcom/android/quickstep/interaction/TutorialFragment;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    iget v1, v1, Lcom/android/launcher3/h0;->T0:I

    .line 241
    .line 242
    int-to-float v1, v1

    .line 243
    iput v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mScreenWidth:F

    .line 244
    .line 245
    invoke-virtual {p1}, Lcom/android/quickstep/interaction/TutorialFragment;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    iget p1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 250
    .line 251
    iput p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mScreenHeight:I

    .line 252
    .line 253
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    const v1, 0x7f07038a

    .line 258
    .line 259
    .line 260
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    int-to-float p1, p1

    .line 265
    iput p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppMargin:F

    .line 266
    .line 267
    invoke-static {p2}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    iput p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppStartingCornerRadius:F

    .line 272
    .line 273
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    const p2, 0x7f070389

    .line 278
    .line 279
    .line 280
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    int-to-float p1, p1

    .line 285
    iput p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppEndingCornerRadius:F

    .line 286
    .line 287
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

    .line 288
    .line 289
    new-instance p2, Lcom/android/quickstep/interaction/I;

    .line 290
    .line 291
    invoke-direct {p2, p0}, Lcom/android/quickstep/interaction/I;-><init>(Lcom/android/quickstep/interaction/TutorialController;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {p1, p2}, Lcom/airbnb/lottie/LottieAnimationView;->j(Lv0/t;)Z

    .line 295
    .line 296
    .line 297
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getIntroductionTitle()I

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getIntroductionSubtitle()I

    .line 305
    .line 306
    .line 307
    move-result p1

    .line 308
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(I)V

    .line 309
    .line 310
    .line 311
    const-string p1, "setupwizard.theme"

    .line 312
    .line 313
    const-string p2, ""

    .line 314
    .line 315
    invoke-static {p1, p2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object p1

    .line 319
    const-string p2, "glif_expressive"

    .line 320
    .line 321
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 322
    .line 323
    .line 324
    move-result p2

    .line 325
    const/4 v1, 0x1

    .line 326
    if-nez p2, :cond_0

    .line 327
    .line 328
    const-string p2, "glif_expressive_light"

    .line 329
    .line 330
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 331
    .line 332
    .line 333
    move-result p1

    .line 334
    if-eqz p1, :cond_1

    .line 335
    .line 336
    :cond_0
    move v0, v1

    .line 337
    :cond_1
    iput-boolean v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mIsExpressiveThemeEnabledInSUW:Z

    .line 338
    .line 339
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->maybeSetTitleTypefaces()V

    .line 340
    .line 341
    .line 342
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 343
    .line 344
    invoke-virtual {p1, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 345
    .line 346
    .line 347
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 348
    .line 349
    new-instance p2, Lcom/android/quickstep/interaction/TutorialController$1;

    .line 350
    .line 351
    invoke-direct {p2, p0}, Lcom/android/quickstep/interaction/TutorialController$1;-><init>(Lcom/android/quickstep/interaction/TutorialController;)V

    .line 352
    .line 353
    .line 354
    invoke-virtual {p1, p2}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 355
    .line 356
    .line 357
    new-instance p1, Lcom/android/quickstep/interaction/J;

    .line 358
    .line 359
    invoke-direct {p1, p0}, Lcom/android/quickstep/interaction/J;-><init>(Lcom/android/quickstep/interaction/TutorialController;)V

    .line 360
    .line 361
    .line 362
    iput-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mShowFeedbackRunnable:Ljava/lang/Runnable;

    .line 363
    .line 364
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/interaction/TutorialController;Lv0/h;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->createScalingMatrix(Lv0/h;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/interaction/TutorialController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->lambda$hideFakeTaskbar$3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/interaction/TutorialController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->lambda$new$2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private createScalingMatrix(Lv0/h;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lv0/h;->b()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

    .line 8
    .line 9
    sget-object p1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v0, Landroid/graphics/Matrix;

    .line 16
    .line 17
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 18
    .line 19
    .line 20
    iget v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mScreenWidth:F

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    int-to-float v2, v2

    .line 27
    div-float/2addr v1, v2

    .line 28
    iget v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mScreenHeight:I

    .line 29
    .line 30
    int-to-float v2, v2

    .line 31
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    int-to-float p1, p1

    .line 36
    mul-float/2addr p1, v1

    .line 37
    sub-float/2addr v2, p1

    .line 38
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-virtual {v0, p1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private createSkipTutorialDialog()Landroidx/appcompat/app/b;
    .locals 8

    .line 1
    const-string v0, "TutorialController"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    instance-of v2, v1, Lcom/android/quickstep/interaction/GestureSandboxActivity;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    return-object v3

    .line 11
    :cond_0
    check-cast v1, Lcom/android/quickstep/interaction/GestureSandboxActivity;

    .line 12
    .line 13
    const v2, 0x7f0e00e3

    .line 14
    .line 15
    .line 16
    invoke-static {v1, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    new-instance v3, Landroidx/appcompat/app/b$a;

    .line 21
    .line 22
    invoke-direct {v3, v1}, Landroidx/appcompat/app/b$a;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, v2}, Landroidx/appcompat/app/b$a;->r(Landroid/view/View;)Landroidx/appcompat/app/b$a;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v3}, Landroidx/appcompat/app/b$a;->a()Landroidx/appcompat/app/b;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    iget-object v4, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 34
    .line 35
    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    sget-object v5, Lcom/android/quickstep/interaction/TutorialController;->DEFAULT_PIXEL_TIPS_APP_NAME:Ljava/lang/CharSequence;

    .line 40
    .line 41
    :try_start_0
    const-string v6, "com.google.android.apps.tips"

    .line 42
    .line 43
    const/16 v7, 0x80

    .line 44
    .line 45
    invoke-virtual {v4, v6, v7}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    invoke-virtual {v4, v6}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    .line 50
    .line 51
    .line 52
    move-result-object v5
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    goto :goto_0

    .line 54
    :catch_0
    move-exception v4

    .line 55
    const-string v6, "Could not find app label for package name: com.google.android.apps.tips. Defaulting to \'Pixel Tips.\'"

    .line 56
    .line 57
    invoke-static {v0, v6, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 58
    .line 59
    .line 60
    :goto_0
    const v4, 0x7f0b0293

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Landroid/widget/TextView;

    .line 68
    .line 69
    if-eqz v4, :cond_1

    .line 70
    .line 71
    iget-object v6, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 72
    .line 73
    const v7, 0x7f1403dc

    .line 74
    .line 75
    .line 76
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    invoke-virtual {v6, v7, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_1
    const-string v4, "No subtitle view in the skip tutorial dialog to update."

    .line 89
    .line 90
    invoke-static {v0, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    :goto_1
    const v4, 0x7f0b0291

    .line 94
    .line 95
    .line 96
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    check-cast v4, Landroid/widget/Button;

    .line 101
    .line 102
    if-eqz v4, :cond_2

    .line 103
    .line 104
    new-instance v5, Lcom/android/quickstep/interaction/M;

    .line 105
    .line 106
    invoke-direct {v5, v3}, Lcom/android/quickstep/interaction/M;-><init>(Landroidx/appcompat/app/b;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_2
    const-string v4, "No cancel button in the skip tutorial dialog to update."

    .line 114
    .line 115
    invoke-static {v0, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    :goto_2
    const v4, 0x7f0b0292

    .line 119
    .line 120
    .line 121
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    check-cast v2, Landroid/widget/Button;

    .line 126
    .line 127
    if-eqz v2, :cond_3

    .line 128
    .line 129
    new-instance v0, Lcom/android/quickstep/interaction/N;

    .line 130
    .line 131
    invoke-direct {v0, p0, v3}, Lcom/android/quickstep/interaction/N;-><init>(Lcom/android/quickstep/interaction/TutorialController;Landroidx/appcompat/app/b;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v2, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_3
    const-string p0, "No confirm button in the skip tutorial dialog to update."

    .line 139
    .line 140
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    :goto_3
    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 148
    .line 149
    const v2, 0x106000d

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getColor(I)I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 160
    .line 161
    .line 162
    return-object v3
.end method

.method public static synthetic d(Lcom/android/quickstep/interaction/TutorialController;Landroidx/appcompat/app/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/interaction/TutorialController;->lambda$createSkipTutorialDialog$7(Landroidx/appcompat/app/b;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/interaction/TutorialController;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/interaction/TutorialController;->lambda$new$0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Landroidx/appcompat/app/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/j;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/interaction/TutorialController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->lambda$showFakeTaskbar$4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/android/quickstep/interaction/TutorialController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->lambda$new$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/quickstep/interaction/TutorialController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->lambda$updateDrawables$5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic j(Lcom/android/quickstep/interaction/TutorialController;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppRect:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic lambda$createSkipTutorialDialog$7(Landroidx/appcompat/app/b;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-virtual {p0, p2}, Lcom/android/quickstep/interaction/TutorialFragment;->closeTutorialStep(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/appcompat/app/j;->dismiss()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic lambda$hideFakeTaskbar$3()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarView:Lcom/android/quickstep/interaction/AnimatedTaskbarView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/quickstep/interaction/AnimatedTaskbarView;->animateDisappearanceToHotseat(Landroid/view/ViewGroup;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic lambda$new$0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->showSkipTutorialDialog()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$1()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mGestureCompleted:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/TutorialFragment;->isAtFinalStep()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackViewCallback:Ljava/lang/Runnable;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 23
    .line 24
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    new-instance v1, Lcom/android/quickstep/interaction/G;

    .line 28
    .line 29
    invoke-direct {v1, v0}, Lcom/android/quickstep/interaction/G;-><init>(Lcom/android/quickstep/interaction/TutorialFragment;)V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackViewCallback:Ljava/lang/Runnable;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 37
    .line 38
    invoke-static {p0}, Landroid/view/accessibility/AccessibilityManager;->getInstance(Landroid/content/Context;)Landroid/view/accessibility/AccessibilityManager;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const/16 v2, 0xbb8

    .line 43
    .line 44
    const/4 v3, 0x6

    .line 45
    invoke-virtual {p0, v2, v3}, Landroid/view/accessibility/AccessibilityManager;->getRecommendedTimeoutMillis(II)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    int-to-long v2, p0

    .line 50
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method private synthetic lambda$new$2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 8
    .line 9
    const v1, 0x3f733333    # 0.95f

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-wide/16 v1, 0x85

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/high16 v1, 0x3f800000    # 1.0f

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Lcom/android/quickstep/interaction/E;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Lcom/android/quickstep/interaction/E;-><init>(Lcom/android/quickstep/interaction/TutorialController;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private synthetic lambda$showFakeTaskbar$4()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarView:Lcom/android/quickstep/interaction/AnimatedTaskbarView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/quickstep/interaction/AnimatedTaskbarView;->animateAppearanceFromHotseat(Landroid/view/ViewGroup;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic lambda$updateDrawables$5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private maybeSetTitleTypefaces()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mIsExpressiveThemeEnabledInSUW:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, LH2/c;->j()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackTitleView:Landroid/widget/TextView;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/quickstep/interaction/TutorialFragment;->isLargeScreen()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    sget-object v1, Lcom/android/wm/shell/shared/o$b;->x:Lcom/android/wm/shell/shared/o$b;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/android/wm/shell/shared/o$b;->c()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    goto :goto_1

    .line 30
    :cond_2
    sget-object v1, Lcom/android/wm/shell/shared/o$b;->y:Lcom/android/wm/shell/shared/o$b;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/wm/shell/shared/o$b;->c()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :goto_1
    const/4 v2, 0x0

    .line 37
    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackSubtitleView:Landroid/widget/TextView;

    .line 45
    .line 46
    sget-object v0, Lcom/android/wm/shell/shared/o$b;->t:Lcom/android/wm/shell/shared/o$b;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/wm/shell/shared/o$b;->c()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v0, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method private playFeedbackAnimation()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFullGestureDemonstration:Landroid/widget/RelativeLayout;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->v()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private showSkipTutorialDialog()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mSkipTutorialDialog:Landroidx/appcompat/app/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private showSuccessPage()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->pauseAndHideLottieAnimation()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mCheckmarkAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mCheckmarkAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/airbnb/lottie/LottieAnimationView;->v()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackTitleView:Landroid/widget/TextView;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getSuccessTitleTextAppearance()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->maybeSetTitleTypefaces()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private startGestureAnimation()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getGestureLottieAnimationId()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->v()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private updateDrawables()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/TutorialFragment;->getRootView()Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getMockWallpaperResId()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/TutorialFragment;->updateFeedbackAnimation()Z

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeLauncherView:Landroid/widget/RelativeLayout;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getFakeLauncherColor()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getMockHotseatResId()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/interaction/TutorialController;->updateFakeViewLayout(Landroid/view/ViewGroup;I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    const v1, 0x7f0b02ec

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mHotseatIconView:Landroid/view/View;

    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/high16 v1, 0x3f800000    # 1.0f

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Lcom/android/quickstep/interaction/L;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Lcom/android/quickstep/interaction/L;-><init>(Lcom/android/quickstep/interaction/TutorialController;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakePreviousTaskView:Lcom/android/quickstep/interaction/AnimatedTaskView;

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getMockPreviousAppTaskThumbnailColor()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-virtual {v0, v1}, Lcom/android/quickstep/interaction/AnimatedTaskView;->setFakeTaskViewFillColor(I)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeIconView:Lcom/android/launcher3/views/ClipIconView;

    .line 92
    .line 93
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getMockAppIconResId()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getExitingAppColor()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getFakeTaskViewColor()I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mHotseatIconView:Landroid/view/View;

    .line 125
    .line 126
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/TutorialController;->updateHotseatChildViewColor(Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 130
    .line 131
    const v1, 0x7f0b02ed

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/TutorialController;->updateHotseatChildViewColor(Landroid/view/View;)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 142
    .line 143
    const v1, 0x7f0b02ee

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/TutorialController;->updateHotseatChildViewColor(Landroid/view/View;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 154
    .line 155
    const v1, 0x7f0b02ef

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/TutorialController;->updateHotseatChildViewColor(Landroid/view/View;)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 166
    .line 167
    const v1, 0x7f0b02f0

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/TutorialController;->updateHotseatChildViewColor(Landroid/view/View;)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 178
    .line 179
    const v1, 0x7f0b02f1

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/TutorialController;->updateHotseatChildViewColor(Landroid/view/View;)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 190
    .line 191
    const v1, 0x7f0b02f4

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-direct {p0, v0}, Lcom/android/quickstep/interaction/TutorialController;->updateHotseatChildViewColor(Landroid/view/View;)V

    .line 199
    .line 200
    .line 201
    :cond_0
    return-void
.end method

.method private updateHotseatChildViewColor(Landroid/view/View;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getHotseatIconColor()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private updateLayout()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/android/quickstep/interaction/TutorialFragment;->isLargeScreen()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const v3, 0x7f07039a

    .line 27
    .line 28
    .line 29
    const v4, 0x7f0703c0

    .line 30
    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    move v2, v4

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v2, v3

    .line 37
    :goto_0
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginStart(I)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/android/quickstep/interaction/TutorialFragment;->isLargeScreen()Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_2

    .line 57
    .line 58
    move v3, v4

    .line 59
    :cond_2
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginEnd(I)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 73
    .line 74
    invoke-virtual {v2}, Lcom/android/quickstep/interaction/TutorialFragment;->isLargeScreen()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_3

    .line 79
    .line 80
    const v2, 0x7f0703c1

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    const v2, 0x7f07039b

    .line 85
    .line 86
    .line 87
    :goto_1
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 92
    .line 93
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarView:Lcom/android/quickstep/interaction/AnimatedTaskbarView;

    .line 94
    .line 95
    if-eqz v0, :cond_5

    .line 96
    .line 97
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/android/quickstep/interaction/TutorialFragment;->isLargeScreen()Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_4

    .line 104
    .line 105
    const/4 v1, 0x0

    .line 106
    goto :goto_2

    .line 107
    :cond_4
    const/16 v1, 0x8

    .line 108
    .line 109
    :goto_2
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 110
    .line 111
    .line 112
    :cond_5
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 113
    .line 114
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 121
    .line 122
    invoke-virtual {v1}, Lcom/android/quickstep/interaction/TutorialFragment;->isLargeScreen()Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    const/16 v2, 0xc

    .line 127
    .line 128
    const/16 v3, 0x15

    .line 129
    .line 130
    const/16 v4, 0x14

    .line 131
    .line 132
    if-nez v1, :cond_8

    .line 133
    .line 134
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 135
    .line 136
    invoke-virtual {v1}, Lcom/android/quickstep/interaction/TutorialFragment;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iget-boolean v5, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 141
    .line 142
    if-eqz v5, :cond_7

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->S0()Z

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    if-eqz v1, :cond_6

    .line 149
    .line 150
    move v2, v4

    .line 151
    goto :goto_3

    .line 152
    :cond_6
    move v2, v3

    .line 153
    :cond_7
    :goto_3
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 154
    .line 155
    .line 156
    goto :goto_4

    .line 157
    :cond_8
    const/4 v1, -0x1

    .line 158
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 159
    .line 160
    const/4 v1, -0x2

    .line 161
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 162
    .line 163
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 170
    .line 171
    .line 172
    :goto_4
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 173
    .line 174
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    .line 176
    .line 177
    return-void
.end method


# virtual methods
.method cancelQueuedGestureAnimation()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackViewCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 7
    .line 8
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackViewCallback:Ljava/lang/Runnable;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskViewCallback:Ljava/lang/Runnable;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskViewCallback:Ljava/lang/Runnable;

    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarViewCallback:Ljava/lang/Runnable;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarView:Lcom/android/quickstep/interaction/AnimatedTaskbarView;

    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarViewCallback:Ljava/lang/Runnable;

    .line 36
    .line 37
    :cond_2
    return-void
.end method

.method protected createAnimationPause()Landroid/animation/Animator;
    .locals 2

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    fill-array-data p0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-wide/16 v0, 0x3e8

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    nop

    .line 19
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method protected createFingerDotAppearanceAnimatorSet()Landroid/animation/AnimatorSet;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFingerDotView:Landroid/widget/ImageView;

    .line 2
    .line 3
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v3, v2, [F

    .line 7
    .line 8
    fill-array-data v3, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFingerDotView:Landroid/widget/ImageView;

    .line 16
    .line 17
    sget-object v3, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 18
    .line 19
    new-array v4, v2, [F

    .line 20
    .line 21
    fill-array-data v4, :array_1

    .line 22
    .line 23
    .line 24
    invoke-static {v1, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFingerDotView:Landroid/widget/ImageView;

    .line 29
    .line 30
    sget-object v3, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 31
    .line 32
    new-array v2, v2, [F

    .line 33
    .line 34
    fill-array-data v2, :array_2

    .line 35
    .line 36
    .line 37
    invoke-static {p0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance v2, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 56
    .line 57
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v2}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 61
    .line 62
    .line 63
    const-wide/16 v0, 0x1f4

    .line 64
    .line 65
    invoke-virtual {p0, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 66
    .line 67
    .line 68
    return-object p0

    .line 69
    :array_0
    .array-data 4
        0x0
        0x3f333333    # 0.7f
    .end array-data

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    :array_1
    .array-data 4
        0x3f333333    # 0.7f
        0x3f800000    # 1.0f
    .end array-data

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    :array_2
    .array-data 4
        0x3f333333    # 0.7f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method protected createFingerDotDisappearanceAnimatorSet()Landroid/animation/AnimatorSet;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFingerDotView:Landroid/widget/ImageView;

    .line 2
    .line 3
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v3, v2, [F

    .line 7
    .line 8
    fill-array-data v3, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFingerDotView:Landroid/widget/ImageView;

    .line 16
    .line 17
    sget-object v3, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 18
    .line 19
    new-array v4, v2, [F

    .line 20
    .line 21
    fill-array-data v4, :array_1

    .line 22
    .line 23
    .line 24
    invoke-static {v1, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFingerDotView:Landroid/widget/ImageView;

    .line 29
    .line 30
    sget-object v3, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 31
    .line 32
    new-array v2, v2, [F

    .line 33
    .line 34
    fill-array-data v2, :array_2

    .line 35
    .line 36
    .line 37
    invoke-static {p0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance v2, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 56
    .line 57
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v2}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 61
    .line 62
    .line 63
    const-wide/16 v0, 0x1f4

    .line 64
    .line 65
    invoke-virtual {p0, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 66
    .line 67
    .line 68
    return-object p0

    .line 69
    :array_0
    .array-data 4
        0x3f333333    # 0.7f
        0x0
    .end array-data

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f333333    # 0.7f
    .end array-data

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x3f333333    # 0.7f
    .end array-data
.end method

.method fadeTaskViewAndRun(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p1}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public abstract getDoneButtonColor()I
.end method

.method public getDoneButtonTextAppearance()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method protected getExitingAppColor()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected abstract getFakeLauncherColor()I
.end method

.method protected getFakeTaskViewColor()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected getGestureLottieAnimationId()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method protected getHotseatIconColor()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getHotseatIconLeft()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mHotseatIconView:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLeft()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mHotseatIconView:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    add-int/2addr v0, p0

    .line 20
    return v0
.end method

.method public getHotseatIconTop()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mHotseatIconView:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getTop()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mHotseatIconView:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    add-int/2addr v0, p0

    .line 20
    return v0
.end method

.method public getIntroductionSubtitle()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public getIntroductionTitle()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public getMockAppIconResId()I
    .locals 0

    .line 1
    const p0, 0x7f081159

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method protected getMockAppTaskLayoutResId()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method protected getMockHotseatResId()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/TutorialFragment;->isLargeScreen()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialFragment;->isFoldable()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const p0, 0x7f0e01d3

    .line 18
    .line 19
    .line 20
    return p0

    .line 21
    :cond_0
    const p0, 0x7f0e01d6

    .line 22
    .line 23
    .line 24
    return p0

    .line 25
    :cond_1
    const p0, 0x7f0e01d5

    .line 26
    .line 27
    .line 28
    return p0
.end method

.method protected getMockPreviousAppTaskThumbnailColor()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const v0, 0x7f06021e

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public getMockWallpaperResId()I
    .locals 0

    .line 1
    const p0, 0x7f080a96

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public getSuccessFeedbackSubtitle()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public getSuccessFeedbackTitle()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public getSuccessTitleTextAppearance()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public getTitleTextAppearance()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method hideFakeTaskbar(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/TutorialFragment;->isLargeScreen()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarView:Lcom/android/quickstep/interaction/AnimatedTaskbarView;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarViewCallback:Ljava/lang/Runnable;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_1
    if-eqz p1, :cond_2

    .line 22
    .line 23
    new-instance p1, Lcom/android/quickstep/interaction/D;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Lcom/android/quickstep/interaction/D;-><init>(Lcom/android/quickstep/interaction/TutorialController;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarViewCallback:Ljava/lang/Runnable;

    .line 29
    .line 30
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarView:Lcom/android/quickstep/interaction/AnimatedTaskbarView;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarViewCallback:Ljava/lang/Runnable;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 35
    .line 36
    .line 37
    :cond_3
    :goto_0
    return-void
.end method

.method hideFeedback()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

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
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->cancelQueuedGestureAnimation()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->clearAnimation()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    .line 19
    .line 20
    const/4 v0, 0x4

    .line 21
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public isGestureCompleted()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mGestureCompleted:Z

    .line 2
    .line 3
    return p0
.end method

.method onActionButtonClicked(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialFragment;->continueTutorial()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method pauseAndHideLottieAnimation()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/airbnb/lottie/LottieAnimationView;->u()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mAnimatedGestureDemonstration:Lcom/airbnb/lottie/LottieAnimationView;

    .line 7
    .line 8
    const/4 v1, 0x4

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFullGestureDemonstration:Landroid/widget/RelativeLayout;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected resetViewsForBackGesture()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getFakeTaskViewColor()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppRect:Landroid/graphics/Rect;

    .line 22
    .line 23
    iget v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mScreenWidth:F

    .line 24
    .line 25
    float-to-int v2, v2

    .line 26
    iget v3, p0, Lcom/android/quickstep/interaction/TutorialController;->mScreenHeight:I

    .line 27
    .line 28
    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 29
    .line 30
    .line 31
    iput v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppRadius:I

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/View;->resetPivot()V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 39
    .line 40
    const/high16 v1, 0x3f800000    # 1.0f

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppView:Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->invalidateOutline()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public setGestureCompleted()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mGestureCompleted:Z

    .line 3
    .line 4
    return-void
.end method

.method setRippleHotspot(FF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mRippleDrawable:Landroid/graphics/drawable/RippleDrawable;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/graphics/drawable/RippleDrawable;->setHotspot(FF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method setTutorialType(Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialType:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 2
    .line 3
    return-void
.end method

.method showActionButton()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mSkipButton:Landroid/widget/TextView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mDoneButton:Landroid/widget/Button;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mDoneButton:Landroid/widget/Button;

    .line 15
    .line 16
    new-instance v1, Lcom/android/quickstep/interaction/F;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/android/quickstep/interaction/F;-><init>(Lcom/android/quickstep/interaction/TutorialController;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method showFakeTaskbar(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/interaction/TutorialFragment;->isLargeScreen()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarView:Lcom/android/quickstep/interaction/AnimatedTaskbarView;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarViewCallback:Ljava/lang/Runnable;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_1
    if-eqz p1, :cond_2

    .line 22
    .line 23
    new-instance p1, Lcom/android/quickstep/interaction/K;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Lcom/android/quickstep/interaction/K;-><init>(Lcom/android/quickstep/interaction/TutorialController;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarViewCallback:Ljava/lang/Runnable;

    .line 29
    .line 30
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarView:Lcom/android/quickstep/interaction/AnimatedTaskbarView;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskbarViewCallback:Ljava/lang/Runnable;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 35
    .line 36
    .line 37
    :cond_3
    :goto_0
    return-void
.end method

.method showFeedback()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mGestureCompleted:Z

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setTranslationY(F)V

    return-void

    .line 3
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->playFeedbackAnimation()V

    return-void
.end method

.method showFeedback(I)V
    .locals 1

    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/interaction/TutorialController;->showFeedback(IZ)V

    return-void
.end method

.method showFeedback(IIZ)V
    .locals 3

    .line 7
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackViewCallback:Ljava/lang/Runnable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 8
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 9
    iput-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackViewCallback:Ljava/lang/Runnable;

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackTitleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 11
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackSubtitleView:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 12
    sget-object p1, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    iget-object p2, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/util/p2;

    const-string p2, "user_setup_complete"

    .line 13
    invoke-static {p2}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const/4 v0, 0x0

    .line 14
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    move-result p1

    const/4 p2, 0x1

    if-nez p1, :cond_1

    .line 15
    iget-boolean v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mIsExpressiveThemeEnabledInSUW:Z

    if-eqz v2, :cond_1

    move v2, p2

    goto :goto_0

    :cond_1
    move v2, v0

    :goto_0
    if-eqz p1, :cond_2

    .line 16
    invoke-static {}, LH2/c;->j()Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    move p2, v0

    :goto_1
    if-eqz p3, :cond_7

    .line 17
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    invoke-virtual {p1}, Lcom/android/quickstep/interaction/TutorialFragment;->isAtFinalStep()Z

    move-result p1

    if-eqz p1, :cond_5

    if-nez p2, :cond_3

    if-eqz v2, :cond_4

    .line 18
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mDoneButton:Landroid/widget/Button;

    sget-object p2, Lcom/android/wm/shell/shared/o$b;->q:Lcom/android/wm/shell/shared/o$b;

    .line 19
    invoke-virtual {p2}, Lcom/android/wm/shell/shared/o$b;->c()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, v0}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p2

    .line 20
    invoke-virtual {p1, p2}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 21
    :cond_4
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->showActionButton()V

    .line 22
    :cond_5
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskViewCallback:Ljava/lang/Runnable;

    if-eqz p1, :cond_6

    .line 23
    iget-object p2, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    invoke-virtual {p2, p1}, Landroid/widget/FrameLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 24
    iput-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskViewCallback:Ljava/lang/Runnable;

    .line 25
    :cond_6
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->showSuccessPage()V

    .line 26
    :cond_7
    iput-boolean p3, p0, Lcom/android/quickstep/interaction/TutorialController;->mGestureCompleted:Z

    if-nez p3, :cond_8

    .line 27
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->playFeedbackAnimation()V

    return-void

    .line 28
    :cond_8
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    invoke-virtual {p1}, Lcom/android/quickstep/interaction/TutorialFragment;->releaseFeedbackAnimation()V

    .line 29
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mShowFeedbackRunnable:Ljava/lang/Runnable;

    iput-object p1, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackViewCallback:Ljava/lang/Runnable;

    .line 30
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackView:Landroid/view/ViewGroup;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method showFeedback(IZ)V
    .locals 1

    if-eqz p2, :cond_0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getSuccessFeedbackTitle()I

    move-result v0

    goto :goto_0

    :cond_0
    const v0, 0x7f1401db

    .line 6
    :goto_0
    invoke-virtual {p0, v0, p1, p2}, Lcom/android/quickstep/interaction/TutorialController;->showFeedback(IIZ)V

    return-void
.end method

.method showSuccessFeedback()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getSuccessFeedbackSubtitle()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v2, "Cannot show success feedback for tutorial step: "

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialType:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, ", no success feedback subtitle"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ljava/lang/IllegalStateException;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v3, "TutorialController"

    .line 38
    .line 39
    invoke-static {v3, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 40
    .line 41
    .line 42
    :cond_0
    const/4 v1, 0x1

    .line 43
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/interaction/TutorialController;->showFeedback(IZ)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method transitToController()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->updateCloseButton()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->updateDrawables()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->updateLayout()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFeedbackTitleView:Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getTitleTextAppearance()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mDoneButton:Landroid/widget/Button;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getDoneButtonTextAppearance()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextAppearance(I)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->maybeSetTitleTypefaces()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mDoneButton:Landroid/widget/Button;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/widget/Button;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->getDoneButtonColor()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mCheckmarkAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialFragment:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/android/quickstep/interaction/TutorialFragment;->isAtFinalStep()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    const v1, 0x7f130004

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const v1, 0x7f130005

    .line 59
    .line 60
    .line 61
    :goto_0
    invoke-virtual {v0, v1}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->isGestureCompleted()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mCheckmarkAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    .line 71
    .line 72
    const/16 v1, 0x8

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialController;->startGestureAnimation()V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mTutorialType:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 81
    .line 82
    sget-object v1, Lcom/android/quickstep/interaction/TutorialController$TutorialType;->BACK_NAVIGATION:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 83
    .line 84
    if-ne v0, v1, :cond_1

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/android/quickstep/interaction/TutorialController;->resetViewsForBackGesture()V

    .line 87
    .line 88
    .line 89
    :cond_1
    const/4 v0, 0x0

    .line 90
    iput-boolean v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mGestureCompleted:Z

    .line 91
    .line 92
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeHotseatView:Landroid/widget/FrameLayout;

    .line 93
    .line 94
    if-eqz p0, :cond_2

    .line 95
    .line 96
    const/4 v0, 0x4

    .line 97
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 98
    .line 99
    .line 100
    :cond_2
    return-void
.end method

.method updateCloseButton()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mSkipButton:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const p0, 0x7f1502d7

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const p0, 0x7f1502d8

    .line 16
    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method updateFakeAppTaskViewLayout(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialController;->mFakeTaskView:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/interaction/TutorialController;->updateFakeViewLayout(Landroid/view/ViewGroup;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method updateFakeViewLayout(Landroid/view/ViewGroup;I)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    if-eq p2, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mContext:Landroid/content/Context;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {p0, p2, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 15
    .line 16
    invoke-direct {p2, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
