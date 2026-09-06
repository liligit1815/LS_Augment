.class Lcom/android/launcher3/q5$h;
.super Landroid/animation/AnimatorListenerAdapter;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->k0(Landroid/animation/AnimatorSet;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/View;Landroid/graphics/PointF;Landroid/graphics/RectF;F)Lcom/android/quickstep/util/RectFSpringAnim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/anim/C;

.field final synthetic h:[Landroid/view/RemoteAnimationTarget;

.field final synthetic i:Landroid/animation/AnimatorSet;

.field final synthetic j:Lcom/android/quickstep/util/RectFSpringAnim;

.field final synthetic k:Landroid/graphics/PointF;

.field final synthetic l:Lcom/android/launcher3/q5;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;Lcom/android/launcher3/anim/C;[Landroid/view/RemoteAnimationTarget;Landroid/animation/AnimatorSet;Lcom/android/quickstep/util/RectFSpringAnim;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/q5$h;->g:Lcom/android/launcher3/anim/C;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/q5$h;->h:[Landroid/view/RemoteAnimationTarget;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/q5$h;->i:Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/q5$h;->j:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/q5$h;->k:Landroid/graphics/PointF;

    .line 12
    .line 13
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/q5$h;Lcom/android/launcher3/anim/C;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/q5$h;->b(Lcom/android/launcher3/anim/C;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b(Lcom/android/launcher3/anim/C;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/android/launcher3/q5;->y(Lcom/android/launcher3/q5;Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/q5;->n(Lcom/android/launcher3/q5;)Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/android/launcher3/q5;->n(Lcom/android/launcher3/q5;)Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 25
    .line 26
    invoke-static {v0, v1}, Lcom/android/launcher3/q5;->x(Lcom/android/launcher3/q5;Landroid/animation/AnimatorSet;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput-boolean v0, p0, Lcom/android/launcher3/q5;->I:Z

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lu2/e;->h()V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 8

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/q5$h;->g:Lcom/android/launcher3/anim/C;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lu2/e;->b()Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Lcom/android/launcher3/q5$h;->g:Lcom/android/launcher3/anim/C;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v0, v0, Lu2/e;->m:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/q5$h;->h:[Landroid/view/RemoteAnimationTarget;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/q5$h;->g:Lcom/android/launcher3/anim/C;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-static {v1, p1, v0}, Lcom/android/quickstep/util/SurfaceTransaction;->createParamForTaskLayerRestore(I[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/anim/C;)Lcom/android/quickstep/util/SurfaceTransaction;

    .line 29
    .line 30
    .line 31
    :cond_0
    new-instance v6, Landroid/animation/AnimatorSet;

    .line 32
    .line 33
    invoke-direct {v6}, Landroid/animation/AnimatorSet;-><init>()V

    .line 34
    .line 35
    .line 36
    sget-boolean p1, Lf1/a;->H:Z

    .line 37
    .line 38
    if-nez p1, :cond_3

    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 43
    .line 44
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 45
    .line 46
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    const/4 v0, 0x0

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 54
    .line 55
    const/16 v1, 0x32

    .line 56
    .line 57
    invoke-static {p1, v0, v1, v0}, Lcom/android/launcher3/q5;->E(Lcom/android/launcher3/q5;ZIZ)Landroid/util/Pair;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v0, Landroid/animation/AnimatorSet;

    .line 64
    .line 65
    sget v1, Lcom/android/launcher3/anim/C;->T:I

    .line 66
    .line 67
    int-to-long v1, v1

    .line 68
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 69
    .line 70
    .line 71
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast v0, Landroid/animation/Animator;

    .line 74
    .line 75
    invoke-virtual {v6, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 76
    .line 77
    .line 78
    new-instance v0, Lcom/android/launcher3/q5$h$a;

    .line 79
    .line 80
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/q5$h$a;-><init>(Lcom/android/launcher3/q5$h;Landroid/util/Pair;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v6, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 88
    .line 89
    iget-object p1, p1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 90
    .line 91
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 92
    .line 93
    invoke-interface {p1, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-nez p1, :cond_3

    .line 98
    .line 99
    invoke-static {}, Lx1/O;->Y2()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    const/4 v1, 0x0

    .line 104
    if-eqz p1, :cond_2

    .line 105
    .line 106
    invoke-static {v1}, Lcom/android/launcher3/anim/C;->h0(Landroid/view/View;)V

    .line 107
    .line 108
    .line 109
    :cond_2
    new-instance p1, Lcom/android/quickstep/util/WorkspaceRevealAnim;

    .line 110
    .line 111
    iget-object v2, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 112
    .line 113
    iget-object v2, v2, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 114
    .line 115
    invoke-direct {p1, v2, v0}, Lcom/android/quickstep/util/WorkspaceRevealAnim;-><init>(Lcom/android/launcher3/C2;Z)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/android/quickstep/util/WorkspaceRevealAnim;->getAnimators()Landroid/animation/AnimatorSet;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    sget v0, Lcom/android/launcher3/anim/C;->T:I

    .line 123
    .line 124
    int-to-long v2, v0

    .line 125
    invoke-virtual {p1, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v6, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 132
    .line 133
    .line 134
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 135
    .line 136
    iget-object v0, p0, Lcom/android/launcher3/q5$h;->i:Landroid/animation/AnimatorSet;

    .line 137
    .line 138
    invoke-static {p1, v0}, Lcom/android/launcher3/q5;->x(Lcom/android/launcher3/q5;Landroid/animation/AnimatorSet;)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 142
    .line 143
    iget-object v0, p0, Lcom/android/launcher3/q5$h;->j:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 144
    .line 145
    invoke-static {p1, v0}, Lcom/android/launcher3/q5;->y(Lcom/android/launcher3/q5;Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Lcom/android/launcher3/q5$h;->j:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 149
    .line 150
    iget-object v0, p0, Lcom/android/launcher3/q5$h;->g:Lcom/android/launcher3/anim/C;

    .line 151
    .line 152
    new-instance v1, Lcom/android/launcher3/r5;

    .line 153
    .line 154
    invoke-direct {v1, p0, v0}, Lcom/android/launcher3/r5;-><init>(Lcom/android/launcher3/q5$h;Lcom/android/launcher3/anim/C;)V

    .line 155
    .line 156
    .line 157
    invoke-static {v1}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 162
    .line 163
    .line 164
    iget-object v2, p0, Lcom/android/launcher3/q5$h;->j:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 165
    .line 166
    iget-object p1, p0, Lcom/android/launcher3/q5$h;->l:Lcom/android/launcher3/q5;

    .line 167
    .line 168
    iget-object v3, p1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 169
    .line 170
    invoke-static {p1}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    iget-object v5, p0, Lcom/android/launcher3/q5$h;->k:Landroid/graphics/PointF;

    .line 175
    .line 176
    const/4 v7, 0x1

    .line 177
    invoke-virtual/range {v2 .. v7}, Lcom/android/quickstep/util/RectFSpringAnim;->start(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/PointF;Landroid/animation/AnimatorSet;Z)V

    .line 178
    .line 179
    .line 180
    return-void
.end method
