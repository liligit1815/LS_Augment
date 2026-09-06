.class public Lcom/android/quickstep/util/OverviewToHomeAnim;
.super Ljava/lang/Object;
.source "OverviewToHomeAnim.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "OverviewToHomeAnim"


# instance fields
.field private mIsHomeStaggeredAnimFinished:Z

.field private mIsOverviewHidden:Z

.field private final mLauncher:Lcom/android/launcher3/C2;

.field private final mOnReachedHome:Ljava/lang/Runnable;

.field private final mSplitCancelConsumer:Ljava/util/function/BiConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/BiConsumer<",
            "Landroid/animation/AnimatorSet;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;Ljava/lang/Runnable;Ljava/util/function/BiConsumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/C2;",
            "Ljava/lang/Runnable;",
            "Ljava/util/function/BiConsumer<",
            "Landroid/animation/AnimatorSet;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mLauncher:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mOnReachedHome:Ljava/lang/Runnable;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mSplitCancelConsumer:Ljava/util/function/BiConsumer;

    .line 9
    .line 10
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/OverviewToHomeAnim;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mIsHomeStaggeredAnimFinished:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/OverviewToHomeAnim;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mIsOverviewHidden:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/OverviewToHomeAnim;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/OverviewToHomeAnim;->maybeOverviewToHomeAnimComplete()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private maybeOverviewToHomeAnimComplete()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mIsHomeStaggeredAnimFinished:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mIsOverviewHidden:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mOnReachedHome:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public animateWithVelocity(F)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/android/launcher3/V3;

    .line 12
    .line 13
    sget-object v2, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 14
    .line 15
    if-eq v1, v2, :cond_0

    .line 16
    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v3, "animateFromOverviewToHome: unexpected start state "

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v3, "OverviewToHomeAnim"

    .line 35
    .line 36
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    :cond_0
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 40
    .line 41
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 42
    .line 43
    .line 44
    iget-object v3, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mLauncher:Lcom/android/launcher3/C2;

    .line 45
    .line 46
    invoke-static {v3}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->g0:Z

    .line 51
    .line 52
    const/4 v4, 0x1

    .line 53
    const/4 v5, 0x0

    .line 54
    if-eqz v3, :cond_1

    .line 55
    .line 56
    iget-object v3, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mLauncher:Lcom/android/launcher3/C2;

    .line 57
    .line 58
    invoke-static {v3}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    if-eqz v3, :cond_1

    .line 63
    .line 64
    move v3, v4

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    move v3, v5

    .line 67
    :goto_0
    const/4 v6, 0x0

    .line 68
    cmpg-float p1, p1, v6

    .line 69
    .line 70
    if-gez p1, :cond_2

    .line 71
    .line 72
    if-nez v3, :cond_2

    .line 73
    .line 74
    move p1, v4

    .line 75
    goto :goto_1

    .line 76
    :cond_2
    move p1, v5

    .line 77
    :goto_1
    if-eqz p1, :cond_3

    .line 78
    .line 79
    new-instance v3, Lcom/android/quickstep/util/WorkspaceRevealAnim;

    .line 80
    .line 81
    iget-object v4, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mLauncher:Lcom/android/launcher3/C2;

    .line 82
    .line 83
    invoke-direct {v3, v4, v5}, Lcom/android/quickstep/util/WorkspaceRevealAnim;-><init>(Lcom/android/launcher3/C2;Z)V

    .line 84
    .line 85
    .line 86
    new-instance v4, Lcom/android/quickstep/util/OverviewToHomeAnim$1;

    .line 87
    .line 88
    invoke-direct {v4, p0}, Lcom/android/quickstep/util/OverviewToHomeAnim$1;-><init>(Lcom/android/quickstep/util/OverviewToHomeAnim;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3, v4}, Lcom/android/quickstep/util/WorkspaceRevealAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)Lcom/android/quickstep/util/WorkspaceRevealAnim;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v3}, Lcom/android/quickstep/util/WorkspaceRevealAnim;->getAnimators()Landroid/animation/AnimatorSet;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_3
    iput-boolean v4, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mIsHomeStaggeredAnimFinished:Z

    .line 103
    .line 104
    :goto_2
    new-instance v3, LQ1/f;

    .line 105
    .line 106
    invoke-direct {v3}, LQ1/f;-><init>()V

    .line 107
    .line 108
    .line 109
    if-eqz p1, :cond_4

    .line 110
    .line 111
    iget p1, v3, LQ1/f;->i:I

    .line 112
    .line 113
    or-int/lit8 p1, p1, 0x4

    .line 114
    .line 115
    iput p1, v3, LQ1/f;->i:I

    .line 116
    .line 117
    :cond_4
    iget-object p1, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mLauncher:Lcom/android/launcher3/C2;

    .line 118
    .line 119
    invoke-interface {v1, p1, v5}, Lcom/android/launcher3/statemanager/a;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    int-to-long v4, p1

    .line 124
    iput-wide v4, v3, LQ1/f;->g:J

    .line 125
    .line 126
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 127
    .line 128
    invoke-virtual {v0, v1, p1, v3}, Lcom/android/launcher3/statemanager/d;->r(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)Landroid/animation/AnimatorSet;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    new-instance v4, Lcom/android/quickstep/util/OverviewToHomeAnim$2;

    .line 133
    .line 134
    invoke-direct {v4, p0}, Lcom/android/quickstep/util/OverviewToHomeAnim$2;-><init>(Lcom/android/quickstep/util/OverviewToHomeAnim;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/android/quickstep/util/OverviewToHomeAnim;->mSplitCancelConsumer:Ljava/util/function/BiConsumer;

    .line 141
    .line 142
    if-eqz p0, :cond_5

    .line 143
    .line 144
    iget-wide v3, v3, LQ1/f;->g:J

    .line 145
    .line 146
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-interface {p0, v2, v3}, Ljava/util/function/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    :cond_5
    invoke-virtual {v2, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v2, p1}, Lcom/android/launcher3/statemanager/d;->c0(Landroid/animation/AnimatorSet;Lcom/android/launcher3/statemanager/a;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 160
    .line 161
    .line 162
    return-void
.end method
