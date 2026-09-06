.class public Lcom/android/quickstep/util/WorkspaceRevealAnim;
.super Ljava/lang/Object;
.source "WorkspaceRevealAnim.java"


# static fields
.field public static final DURATION_MS:I = 0x15e

.field private static final HOTSEAT_SCALE_PROPERTY:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/Hotseat;",
            ">;"
        }
    .end annotation
.end field

.field public static final MFV_WORKSPACE_REVEAL_ANIM_DURATION_MS:I = 0x1f4

.field private static final TAG:Ljava/lang/String; = "WorkspaceRevealAnim"

.field private static final WORKSPACE_SCALE_PROPERTY:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/Workspace<",
            "*>;>;"
        }
    .end annotation
.end field


# instance fields
.field private final mAnimators:Landroid/animation/AnimatorSet;

.field private final mScaleStart:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/G2;->c:Lcom/android/launcher3/util/y1;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/y1;->n(Ljava/lang/Integer;)Landroid/util/FloatProperty;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lcom/android/quickstep/util/WorkspaceRevealAnim;->WORKSPACE_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 13
    .line 14
    sget-object v0, Lcom/android/launcher3/G2;->d:Lcom/android/launcher3/util/y1;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/y1;->n(Ljava/lang/Integer;)Landroid/util/FloatProperty;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lcom/android/quickstep/util/WorkspaceRevealAnim;->HOTSEAT_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/C2;Z)V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/WorkspaceRevealAnim;->prepareToAnimate(Lcom/android/launcher3/C2;Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const v2, 0x7f070ad9

    .line 19
    .line 20
    .line 21
    invoke-interface {v1, v2}, Lx2/h;->getFloat(I)F

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iput v1, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim;->mScaleStart:F

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/4 v2, 0x1

    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v3, v2

    .line 37
    :goto_0
    invoke-static {p1, v0, v3}, Lcom/android/launcher3/anim/C;->v0(Lcom/android/launcher3/C2;Landroid/animation/AnimatorSet;I)V

    .line 38
    .line 39
    .line 40
    const-wide/16 v3, 0x1f4

    .line 41
    .line 42
    const-wide/16 v5, 0x15e

    .line 43
    .line 44
    if-eqz p2, :cond_2

    .line 45
    .line 46
    new-instance p2, Lcom/android/launcher3/anim/V;

    .line 47
    .line 48
    invoke-static {}, Lx1/O;->Y2()Z

    .line 49
    .line 50
    .line 51
    move-result v7

    .line 52
    if-nez v7, :cond_1

    .line 53
    .line 54
    move-wide v7, v3

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    move-wide v7, v5

    .line 57
    :goto_1
    invoke-direct {p2, v7, v8}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    invoke-virtual {v7}, Lcom/android/launcher3/Workspace;->getStateTransitionAnimation()Lcom/android/launcher3/N6;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    sget-object v8, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 69
    .line 70
    new-instance v9, LQ1/f;

    .line 71
    .line 72
    invoke-direct {v9}, LQ1/f;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v7, p2, v8, v9}, Lcom/android/launcher3/N6;->h(Lcom/android/launcher3/anim/Y;Lcom/android/launcher3/V3;LQ1/f;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p2}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {v0, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 83
    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_2
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    sget-object v7, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 91
    .line 92
    invoke-virtual {v7, p1}, Lcom/android/launcher3/V3;->y(Lcom/android/launcher3/C2;)I

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    invoke-virtual {p2, v7}, Lcom/android/launcher3/views/ScrimView;->setBackgroundColor(I)V

    .line 97
    .line 98
    .line 99
    :goto_2
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    iget-boolean p2, p2, Lcom/android/launcher3/r4;->g0:Z

    .line 104
    .line 105
    if-eqz p2, :cond_3

    .line 106
    .line 107
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    if-eqz p2, :cond_3

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_3
    const/4 v2, 0x0

    .line 115
    :goto_3
    instance-of p2, p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 116
    .line 117
    if-eqz p2, :cond_4

    .line 118
    .line 119
    if-nez v2, :cond_4

    .line 120
    .line 121
    new-instance p2, Lcom/android/launcher3/anim/V;

    .line 122
    .line 123
    invoke-direct {p2, v5, v6}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 124
    .line 125
    .line 126
    move-object v2, p1

    .line 127
    check-cast v2, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 128
    .line 129
    invoke-virtual {v2}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    sget-object v7, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 134
    .line 135
    new-instance v8, LQ1/f;

    .line 136
    .line 137
    invoke-direct {v8}, LQ1/f;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v2, v7, v8, p2}, LP1/h;->N(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p2}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    invoke-virtual {v0, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 148
    .line 149
    .line 150
    :cond_4
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {p1}, Lcom/android/launcher3/LauncherRootView;->getSysUiScrim()Ln1/x;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p1}, Ln1/x;->e()Lcom/android/launcher3/anim/d;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    const/4 p2, 0x0

    .line 163
    const/high16 v2, 0x3f800000    # 1.0f

    .line 164
    .line 165
    invoke-virtual {p1, p2, v2}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 170
    .line 171
    .line 172
    invoke-static {}, Lx1/O;->Y2()Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-nez p1, :cond_5

    .line 177
    .line 178
    goto :goto_4

    .line 179
    :cond_5
    move-wide v3, v5

    .line 180
    :goto_4
    invoke-virtual {v0, v3, v4}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 181
    .line 182
    .line 183
    invoke-static {}, Lx1/O;->Y2()Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-nez p1, :cond_6

    .line 188
    .line 189
    sget-object p1, Lcom/android/launcher3/anim/L;->s:Landroid/view/animation/Interpolator;

    .line 190
    .line 191
    goto :goto_5

    .line 192
    :cond_6
    sget-object p1, LJ0/h;->y:Landroid/view/animation/Interpolator;

    .line 193
    .line 194
    :goto_5
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 195
    .line 196
    .line 197
    new-instance p1, Lcom/android/quickstep/util/WorkspaceRevealAnim$1;

    .line 198
    .line 199
    invoke-direct {p1, p0, v1}, Lcom/android/quickstep/util/WorkspaceRevealAnim$1;-><init>(Lcom/android/quickstep/util/WorkspaceRevealAnim;Lcom/android/launcher3/Workspace;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 203
    .line 204
    .line 205
    return-void
.end method

.method private addRevealAnimatorsForView(Landroid/view/View;Landroid/util/FloatProperty;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(TT;",
            "Landroid/util/FloatProperty<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim;->mScaleStart:F

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v3, v2, [F

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    aput v0, v3, v4

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    aput v1, v3, v0

    .line 13
    .line 14
    invoke-static {p1, p2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-wide/16 v3, 0x15e

    .line 19
    .line 20
    invoke-virtual {v0, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    .line 23
    sget-object v1, LJ0/h;->y:Landroid/view/animation/Interpolator;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 26
    .line 27
    .line 28
    iget-object v5, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 29
    .line 30
    invoke-virtual {v5, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 31
    .line 32
    .line 33
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 34
    .line 35
    new-array v2, v2, [F

    .line 36
    .line 37
    fill-array-data v2, :array_0

    .line 38
    .line 39
    .line 40
    invoke-static {p1, v0, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 56
    .line 57
    new-instance v1, Lcom/android/quickstep/util/WorkspaceRevealAnim$2;

    .line 58
    .line 59
    invoke-direct {v1, p0, p2, p1}, Lcom/android/quickstep/util/WorkspaceRevealAnim$2;-><init>(Lcom/android/quickstep/util/WorkspaceRevealAnim;Landroid/util/FloatProperty;Landroid/view/View;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    nop

    .line 67
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private prepareToAnimate(Lcom/android/launcher3/C2;Z)V
    .locals 3

    .line 1
    new-instance p0, LQ1/f;

    .line 2
    .line 3
    invoke-direct {p0}, LQ1/f;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0xe

    .line 7
    .line 8
    iput v0, p0, LQ1/f;->i:I

    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    iput-wide v0, p0, LQ1/f;->g:J

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 19
    .line 20
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2, p0}, Lcom/android/launcher3/statemanager/d;->r(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)Landroid/animation/AnimatorSet;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-virtual {v0, v2}, Lcom/android/launcher3/V4;->forceFinishScroller(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->forceOnPageTransitionEndCallback()V

    .line 46
    .line 47
    .line 48
    if-eqz p2, :cond_0

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->getStateTransitionAnimation()Lcom/android/launcher3/N6;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    sget-object p2, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 59
    .line 60
    invoke-virtual {p1, p2, v1, p0}, Lcom/android/launcher3/N6;->h(Lcom/android/launcher3/anim/Y;Lcom/android/launcher3/V3;LQ1/f;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method


# virtual methods
.method public addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)Lcom/android/quickstep/util/WorkspaceRevealAnim;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public getAnimators()Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public start()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
