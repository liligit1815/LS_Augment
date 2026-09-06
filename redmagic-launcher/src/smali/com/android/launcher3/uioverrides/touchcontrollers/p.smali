.class public Lcom/android/launcher3/uioverrides/touchcontrollers/p;
.super Lcom/android/launcher3/uioverrides/touchcontrollers/x;
.source "NoButtonNavbarToOverviewTouchController.java"


# instance fields
.field private final g:Lcom/android/launcher3/util/V2;

.field private final h:Ljava/util/function/BiConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/BiConsumer<",
            "Landroid/animation/AnimatorSet;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Lcom/android/quickstep/views/RecentsView;

.field private final j:Lcom/android/quickstep/util/MotionPauseDetector;

.field private final k:F

.field private l:Z

.field private m:Z

.field private n:Z

.field private o:Landroid/graphics/PointF;

.field private p:F

.field private q:Lcom/android/launcher3/anim/q;

.field private r:Landroid/animation/ObjectAnimator;

.field private final s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private t:Z

.field private u:F


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Ljava/util/function/BiConsumer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/uioverrides/QuickstepLauncher;",
            "Ljava/util/function/BiConsumer<",
            "Landroid/animation/AnimatorSet;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;-><init>(Lcom/android/launcher3/C2;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->o:Landroid/graphics/PointF;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 20
    .line 21
    new-instance v0, Lcom/android/quickstep/util/MotionPauseDetector;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 28
    .line 29
    invoke-direct {v0, p1, v1}, Lcom/android/quickstep/util/MotionPauseDetector;-><init>(Landroid/content/Context;Z)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->j:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const v2, 0x7f070853

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iput v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->k:F

    .line 46
    .line 47
    sget-object v1, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/android/launcher3/util/V2;

    .line 58
    .line 59
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->g:Lcom/android/launcher3/util/V2;

    .line 60
    .line 61
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->h:Ljava/util/function/BiConsumer;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/quickstep/util/MotionPauseDetector;->setMFVSpeedSlowSlop()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/uioverrides/touchcontrollers/p;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/uioverrides/touchcontrollers/p;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/uioverrides/touchcontrollers/p;Z[Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->n(Z[Landroid/animation/AnimatorSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/uioverrides/touchcontrollers/p;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/folder/Folder;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/uioverrides/touchcontrollers/p;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->p(Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/uioverrides/touchcontrollers/p;Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->o(Lcom/android/launcher3/folder/Folder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j(F)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 12
    .line 13
    invoke-static {p1, p0}, Lcom/android/launcher3/N5;->j(FI)F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method private k(F)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->j:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/MotionPauseDetector;->isPaused()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v1, v0, 0x1

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v2, Lcom/android/quickstep/util/OverviewToHomeAnim;

    .line 12
    .line 13
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    new-instance v4, Lcom/android/launcher3/uioverrides/touchcontrollers/m;

    .line 16
    .line 17
    invoke-direct {v4, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/m;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/p;)V

    .line 18
    .line 19
    .line 20
    const/4 v5, 0x0

    .line 21
    invoke-direct {v2, v3, v4, v5}, Lcom/android/quickstep/util/OverviewToHomeAnim;-><init>(Lcom/android/launcher3/C2;Ljava/lang/Runnable;Ljava/util/function/BiConsumer;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, p1}, Lcom/android/quickstep/util/OverviewToHomeAnim;->animateWithVelocity(F)V

    .line 25
    .line 26
    .line 27
    const/16 p1, 0x42

    .line 28
    .line 29
    invoke-static {p1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, LK1/q;->a(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    const/4 p1, 0x1

    .line 52
    new-array v2, p1, [Landroid/animation/AnimatorSet;

    .line 53
    .line 54
    iget-boolean v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->m:Z

    .line 55
    .line 56
    if-eqz v3, :cond_1

    .line 57
    .line 58
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 59
    .line 60
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getTranslationX()F

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 69
    .line 70
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getTranslationY()F

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    invoke-direct {p0, v3}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->j(F)F

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    const v4, 0x3f4ccccd    # 0.8f

    .line 87
    .line 88
    .line 89
    div-float/2addr v3, v4

    .line 90
    const/high16 v4, 0x42a00000    # 80.0f

    .line 91
    .line 92
    invoke-static {v4, v3}, Ljava/lang/Math;->max(FF)F

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    float-to-long v3, v3

    .line 97
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 98
    .line 99
    invoke-virtual {v5}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    const/4 v6, 0x0

    .line 104
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    sget-object v6, LJ0/h;->H:Landroid/view/animation/Interpolator;

    .line 113
    .line 114
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-virtual {v5, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    new-instance v6, Lcom/android/launcher3/uioverrides/touchcontrollers/n;

    .line 123
    .line 124
    invoke-direct {v6, p0, v1, v2}, Lcom/android/launcher3/uioverrides/touchcontrollers/n;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/p;Z[Landroid/animation/AnimatorSet;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 131
    .line 132
    const/4 v5, 0x0

    .line 133
    invoke-virtual {v1, v5}, Lcom/android/quickstep/views/RecentsView;->setTasksTitleHidden(Z)V

    .line 134
    .line 135
    .line 136
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 137
    .line 138
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->animateActionsViewIn()V

    .line 139
    .line 140
    .line 141
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 142
    .line 143
    invoke-virtual {v1, p1}, Lcom/android/quickstep/views/RecentsView;->setLockButtonDisplay(Z)V

    .line 144
    .line 145
    .line 146
    if-eqz v0, :cond_1

    .line 147
    .line 148
    new-instance p1, LQ1/f;

    .line 149
    .line 150
    invoke-direct {p1}, LQ1/f;-><init>()V

    .line 151
    .line 152
    .line 153
    iput-wide v3, p1, LQ1/f;->g:J

    .line 154
    .line 155
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    check-cast v0, Lcom/android/launcher3/V3;

    .line 166
    .line 167
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-virtual {p0, v0, v0, p1}, Lcom/android/launcher3/statemanager/d;->r(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)Landroid/animation/AnimatorSet;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    aput-object p0, v2, v5

    .line 178
    .line 179
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 180
    .line 181
    .line 182
    :cond_1
    return-void
.end method

.method private l()Z
    .locals 4

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/SystemUiProxy;->getLastSystemUiStateFlags()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iget-boolean v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->l:Z

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    .line 20
    .line 21
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 22
    .line 23
    if-ne p0, v2, :cond_0

    .line 24
    .line 25
    const-wide/16 v2, 0x80

    .line 26
    .line 27
    and-long/2addr v0, v2

    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    cmp-long p0, v0, v2

    .line 31
    .line 32
    if-nez p0, :cond_0

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method private synthetic m()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->onSwipeInteractionCompleted(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic n(Z[Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    if-nez p1, :cond_2

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    aget-object p1, p2, p1

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->end()V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->clearState()V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 35
    .line 36
    const/4 p2, 0x1

    .line 37
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->r()V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method

.method private synthetic o(Lcom/android/launcher3/folder/Folder;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    new-instance v1, Lcom/android/launcher3/uioverrides/touchcontrollers/l;

    .line 10
    .line 11
    invoke-direct {v1, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/l;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {p0, v0, v1, p1}, Lcom/android/launcher3/statemanager/d;->N(Lcom/android/launcher3/statemanager/a;ZLandroid/animation/Animator$AnimatorListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic p(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p1, v0}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->createRecentsResistanceFromOverviewAnim(Lcom/android/launcher3/C2;Lcom/android/launcher3/anim/V;)Lcom/android/launcher3/anim/V;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->q:Lcom/android/launcher3/anim/q;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->n:Z

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->r()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->clearState()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic q()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    new-instance v2, Lcom/android/launcher3/uioverrides/touchcontrollers/o;

    .line 10
    .line 11
    invoke-direct {v2, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/o;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/p;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v2}, Lcom/android/launcher3/anim/h;->b(Ljava/util/function/Consumer;)Landroid/animation/Animator$AnimatorListener;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v0, v1, v2, p0}, Lcom/android/launcher3/statemanager/d;->N(Lcom/android/launcher3/statemanager/a;ZLandroid/animation/Animator$AnimatorListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private r()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->f()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/16 v0, 0x42

    .line 14
    .line 15
    invoke-static {v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->onSwipeInteractionCompleted(Lcom/android/launcher3/V3;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private s()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->r:Landroid/animation/ObjectAnimator;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->setTasksTitleHidden(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->getActionsView()Lcom/android/quickstep/views/OverviewActionsView;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/quickstep/views/OverviewActionsView;->getVisibilityAlpha()Lcom/android/launcher3/anim/d;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v0, v2}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget v0, v0, Lcom/android/launcher3/h0;->T0:I

    .line 45
    .line 46
    neg-int v0, v0

    .line 47
    int-to-float v0, v0

    .line 48
    const v2, 0x3f19999a    # 0.6f

    .line 49
    .line 50
    .line 51
    mul-float/2addr v2, v0

    .line 52
    :goto_0
    iput v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->u:F

    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setTranslationX(F)V

    .line 57
    .line 58
    .line 59
    sget-object v0, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 60
    .line 61
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 62
    .line 63
    const/high16 v3, 0x3fc00000    # 1.5f

    .line 64
    .line 65
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v0, v2, v3}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v2, Lcom/android/launcher3/uioverrides/touchcontrollers/k;

    .line 79
    .line 80
    invoke-direct {v2, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/k;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/p;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v2}, Lcom/android/launcher3/G2;->g(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mClearStateOnCancelListener:Landroid/animation/Animator$AnimatorListener;

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->i()Lcom/android/launcher3/anim/q;

    .line 104
    .line 105
    .line 106
    iput-boolean v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->m:Z

    .line 107
    .line 108
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 109
    .line 110
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-static {v0, v1}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->setMiniWindowWeakenMode(Landroid/content/Context;Z)V

    .line 115
    .line 116
    .line 117
    invoke-static {}, Lx1/d;->h()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_2

    .line 122
    .line 123
    const-string v0, "FlingAndHoldTC"

    .line 124
    .line 125
    const-string v1, "onMotionPauseDetected: UseACC"

    .line 126
    .line 127
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 131
    .line 132
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    const-string v0, "launcher_recent"

    .line 137
    .line 138
    invoke-static {p0, v0}, Lx1/d;->i(Landroid/content/Context;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_2
    sget-object v0, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 143
    .line 144
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 145
    .line 146
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    check-cast p0, Lcom/android/launcher3/util/V2;

    .line 151
    .line 152
    sget-object v0, Lcom/android/launcher3/util/V2;->i:Landroid/os/VibrationEffect;

    .line 153
    .line 154
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/V2;->n(Landroid/os/VibrationEffect;)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method private t()V
    .locals 2

    .line 1
    const-string v0, "FlingAndHoldTC"

    .line 2
    .line 3
    const-string v1, "prepareForActionStart called !"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->resetDraglayer()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->k0()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->setPivotX(F)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method


# virtual methods
.method protected canInterceptTouch(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/H4;->b(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->t:Z

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    xor-int/2addr v0, v2

    .line 11
    invoke-virtual {v1, v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->b6(Z)V

    .line 12
    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->t:Z

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-object v3, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 26
    .line 27
    if-ne v0, v3, :cond_0

    .line 28
    .line 29
    return v1

    .line 30
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    and-int/lit16 v0, v0, 0x100

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    move v0, v2

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move v0, v1

    .line 41
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->l:Z

    .line 42
    .line 43
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/quickstep/SystemUiProxy;->getLastSystemUiStateFlags()J

    .line 54
    .line 55
    .line 56
    move-result-wide v3

    .line 57
    const-wide/32 v5, 0x10000

    .line 58
    .line 59
    .line 60
    and-long/2addr v3, v5

    .line 61
    const-wide/16 v5, 0x0

    .line 62
    .line 63
    cmp-long v0, v3, v5

    .line 64
    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    move v0, v2

    .line 68
    goto :goto_1

    .line 69
    :cond_2
    move v0, v1

    .line 70
    :goto_1
    iget-object v3, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 71
    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    const/high16 v0, 0x40200000    # 2.5f

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 78
    .line 79
    :goto_2
    invoke-virtual {v3, v0}, Lcom/android/launcher3/touch/H;->x(F)V

    .line 80
    .line 81
    .line 82
    invoke-super {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->canInterceptTouch(Landroid/view/MotionEvent;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_4

    .line 87
    .line 88
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 89
    .line 90
    sget-object p1, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 91
    .line 92
    invoke-interface {p0, p1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-nez p0, :cond_4

    .line 97
    .line 98
    return v2

    .line 99
    :cond_4
    return v1
.end method

.method public clearLastStatus()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->clearState()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected clearState()V
    .locals 2

    .line 1
    const-string v0, "FlingAndHoldTC"

    .line 2
    .line 3
    const-string v1, "clearState"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->clearState()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected getTargetState(Lcom/android/launcher3/V3;Z)Lcom/android/launcher3/V3;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->l:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->getTargetState(Lcom/android/launcher3/V3;Z)Lcom/android/launcher3/V3;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method protected initCurrentAnimation()F
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->initCurrentAnimation()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    sget-object v2, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    if-ne v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v0, v0, Lcom/android/launcher3/h0;->U0:I

    .line 18
    .line 19
    int-to-float v0, v0

    .line 20
    const/high16 v1, -0x40800000    # -1.0f

    .line 21
    .line 22
    div-float v0, v1, v0

    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->finishAppClosingAnim(ZLjava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return v0
.end method

.method public onDrag(FFLandroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->n:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->o:Landroid/graphics/PointF;

    .line 10
    .line 11
    invoke-virtual {v0, p2, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->p:F

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->o:Landroid/graphics/PointF;

    .line 24
    .line 25
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 26
    .line 27
    sub-float v1, p2, v1

    .line 28
    .line 29
    const v2, 0x3f828f5c    # 1.02f

    .line 30
    .line 31
    .line 32
    mul-float/2addr v1, v2

    .line 33
    iget v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->u:F

    .line 34
    .line 35
    add-float/2addr v1, v2

    .line 36
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setTranslationX(F)V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->p:F

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    cmpl-float v0, v0, v1

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->p:F

    .line 51
    .line 52
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->o:Landroid/graphics/PointF;

    .line 53
    .line 54
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 55
    .line 56
    sub-float v2, v0, p1

    .line 57
    .line 58
    iget v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->p:F

    .line 59
    .line 60
    div-float/2addr v2, v3

    .line 61
    cmpl-float v1, v2, v1

    .line 62
    .line 63
    if-lez v1, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->q:Lcom/android/launcher3/anim/q;

    .line 66
    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 74
    .line 75
    sub-float v0, p1, v0

    .line 76
    .line 77
    const/high16 v2, 0x3e800000    # 0.25f

    .line 78
    .line 79
    mul-float/2addr v0, v2

    .line 80
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 81
    .line 82
    .line 83
    :cond_3
    :goto_0
    neg-float v0, p1

    .line 84
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->j:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 85
    .line 86
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->l()Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    const/4 v3, 0x1

    .line 91
    const/4 v4, 0x0

    .line 92
    if-eqz v2, :cond_5

    .line 93
    .line 94
    iget v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->k:F

    .line 95
    .line 96
    cmpg-float v0, v0, v2

    .line 97
    .line 98
    if-gez v0, :cond_4

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_4
    move v0, v4

    .line 102
    goto :goto_2

    .line 103
    :cond_5
    :goto_1
    move v0, v3

    .line 104
    :goto_2
    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/MotionPauseDetector;->setDisallowPause(Z)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->j:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 108
    .line 109
    invoke-virtual {v0, p3}, Lcom/android/quickstep/util/MotionPauseDetector;->addPosition(Landroid/view/MotionEvent;)V

    .line 110
    .line 111
    .line 112
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->m:Z

    .line 113
    .line 114
    if-nez v0, :cond_7

    .line 115
    .line 116
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/touch/H$d;->onDrag(FFLandroid/view/MotionEvent;)Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    if-eqz p0, :cond_6

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_6
    return v4

    .line 124
    :cond_7
    :goto_3
    return v3
.end method

.method public onDragEnd(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->B5()Lcom/android/launcher3/taskbar/V;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/V;->v0(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/d;->h0(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->O0:Z

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    sget-object v0, LF1/b;->n:Lcom/android/launcher3/util/I;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, LF1/b;

    .line 41
    .line 42
    invoke-virtual {v0}, LF1/b;->d()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->m:Z

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->k(F)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    :goto_0
    const/16 v0, 0x42

    .line 58
    .line 59
    invoke-static {v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 60
    .line 61
    .line 62
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->onDragEnd(F)V

    .line 63
    .line 64
    .line 65
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 72
    .line 73
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->g0:Z

    .line 78
    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    if-eqz p1, :cond_3

    .line 82
    .line 83
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 84
    .line 85
    if-eqz v0, :cond_3

    .line 86
    .line 87
    iget-boolean v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->m:Z

    .line 88
    .line 89
    if-nez v2, :cond_3

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v2, Lcom/android/launcher3/uioverrides/touchcontrollers/j;

    .line 96
    .line 97
    invoke-direct {v2, p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/j;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/p;Lcom/android/launcher3/folder/Folder;)V

    .line 98
    .line 99
    .line 100
    const/4 p1, 0x1

    .line 101
    invoke-static {v2, p1}, Lcom/android/launcher3/G2;->f(Ljava/lang/Runnable;Z)Landroid/animation/Animator$AnimatorListener;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->i()Lcom/android/launcher3/anim/q;

    .line 111
    .line 112
    .line 113
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->j:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 114
    .line 115
    invoke-virtual {p1}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 116
    .line 117
    .line 118
    iput-boolean v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->t:Z

    .line 119
    .line 120
    const/4 p1, 0x0

    .line 121
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->r:Landroid/animation/ObjectAnimator;

    .line 122
    .line 123
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 124
    .line 125
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 126
    .line 127
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-eqz p1, :cond_4

    .line 132
    .line 133
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->clearState()V

    .line 134
    .line 135
    .line 136
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-static {p0, v1}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->setMiniWindowWeakenMode(Landroid/content/Context;Z)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->reloadIfNeeded()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/16 v1, 0x10

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/d;->h0(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 26
    .line 27
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 28
    .line 29
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->B5()Lcom/android/launcher3/taskbar/V;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/V;->v0(Z)V

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/touch/d;->onDragStart(ZF)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->j:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->j:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 56
    .line 57
    iget-boolean p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->t:Z

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/MotionPauseDetector;->setIsTrackpadGesture(Z)V

    .line 60
    .line 61
    .line 62
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->t()V

    .line 63
    .line 64
    .line 65
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->l()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->O0:Z

    .line 78
    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    sget-object p1, LF1/b;->n:Lcom/android/launcher3/util/I;

    .line 82
    .line 83
    iget-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 84
    .line 85
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, LF1/b;

    .line 90
    .line 91
    invoke-virtual {p1}, LF1/b;->d()Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_2

    .line 96
    .line 97
    const-string p0, "FlingAndHoldTC"

    .line 98
    .line 99
    const-string p1, "onDragStart: InNewSplitMode ignore pause change."

    .line 100
    .line 101
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->i:Lcom/android/quickstep/views/RecentsView;

    .line 106
    .line 107
    const/16 p2, 0x42

    .line 108
    .line 109
    const-string v0, "Home"

    .line 110
    .line 111
    invoke-static {p1, p2, v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;ILjava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->j:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 115
    .line 116
    new-instance p2, Lcom/android/launcher3/uioverrides/touchcontrollers/i;

    .line 117
    .line 118
    invoke-direct {p2, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/i;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/p;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/MotionPauseDetector;->setOnMotionPauseListener(Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;)V

    .line 122
    .line 123
    .line 124
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 125
    .line 126
    sget-object p2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 127
    .line 128
    if-ne p1, p2, :cond_4

    .line 129
    .line 130
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 131
    .line 132
    sget-object p2, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 133
    .line 134
    if-ne p1, p2, :cond_4

    .line 135
    .line 136
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 137
    .line 138
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    sget-object p2, Lcom/android/launcher3/G2;->l:Landroid/util/IntProperty;

    .line 143
    .line 144
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 145
    .line 146
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V3;->y(Lcom/android/launcher3/C2;)I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 153
    .line 154
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 155
    .line 156
    invoke-virtual {v1, v2}, Lcom/android/launcher3/V3;->y(Lcom/android/launcher3/C2;)I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    filled-new-array {v0, v1}, [I

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->r:Landroid/animation/ObjectAnimator;

    .line 169
    .line 170
    :cond_4
    const/4 p1, 0x0

    .line 171
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->m:Z

    .line 172
    .line 173
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->n:Z

    .line 174
    .line 175
    const/4 p1, 0x0

    .line 176
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->q:Lcom/android/launcher3/anim/q;

    .line 177
    .line 178
    return-void
.end method

.method protected updateProgress(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/touch/d;->updateProgress(F)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->r:Landroid/animation/ObjectAnimator;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/animation/ObjectAnimator;->setCurrentFraction(F)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method protected updateSwipeCompleteAnimation(Landroid/animation/ValueAnimator;JLcom/android/launcher3/V3;FZ)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p6}, Lcom/android/launcher3/touch/d;->updateSwipeCompleteAnimation(Landroid/animation/ValueAnimator;JLcom/android/launcher3/V3;FZ)V

    .line 2
    .line 3
    .line 4
    sget-object p2, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 5
    .line 6
    if-ne p4, p2, :cond_0

    .line 7
    .line 8
    iget-object p3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->s:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 9
    .line 10
    const/4 p4, 0x1

    .line 11
    invoke-interface {p2, p3, p4}, Lcom/android/launcher3/statemanager/a;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    int-to-long p2, p2

    .line 16
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;->h:Ljava/util/function/BiConsumer;

    .line 25
    .line 26
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-interface {p0, p1, p2}, Ljava/util/function/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method
