.class public Lcom/android/launcher3/taskbar/L;
.super Ljava/lang/Object;
.source "KeyboardQuickSwitchViewController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/L$b;
    }
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/L$b;

.field private final b:Lcom/android/launcher3/taskbar/R1;

.field private final c:La2/a;

.field private final d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

.field private final e:Lcom/android/launcher3/taskbar/s$a;

.field private f:Landroid/animation/Animator;

.field private g:I

.field private h:Z

.field private i:Z

.field private j:Z

.field private k:Z


# direct methods
.method protected constructor <init>(Lcom/android/launcher3/taskbar/R1;La2/a;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Lcom/android/launcher3/taskbar/s$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/taskbar/L$b;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/L$b;-><init>(Lcom/android/launcher3/taskbar/L;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/L;->a:Lcom/android/launcher3/taskbar/L$b;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lcom/android/launcher3/taskbar/L;->g:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/L;->k:Z

    .line 16
    .line 17
    iput-object p1, p0, Lcom/android/launcher3/taskbar/L;->b:Lcom/android/launcher3/taskbar/R1;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/android/launcher3/taskbar/L;->c:La2/a;

    .line 20
    .line 21
    iput-object p3, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 22
    .line 23
    iput-object p4, p0, Lcom/android/launcher3/taskbar/L;->e:Lcom/android/launcher3/taskbar/s$a;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/L;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/L;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b()V
    .locals 1

    .line 1
    const/16 v0, 0x73

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/L;Landroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/L;->q(Landroid/window/RemoteTransition;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/L;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/L;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/taskbar/L;)Lcom/android/launcher3/taskbar/s$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L;->e:Lcom/android/launcher3/taskbar/s$a;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/taskbar/L;)Lcom/android/launcher3/taskbar/R1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L;->b:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/taskbar/L;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/L;->g:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/taskbar/L;)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/taskbar/L;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/L;->g:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j(Lcom/android/launcher3/taskbar/L;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/L;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method private synthetic p()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    const/16 v0, 0x73

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic q(Landroid/window/RemoteTransition;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDisplay()Landroid/view/Display;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-virtual {v0, p0, p1}, Lcom/android/quickstep/SystemUiProxy;->showDesktopApps(ILandroid/window/RemoteTransition;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private s(I)I
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/L;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->getOverviewTaskIndex()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x1

    .line 16
    if-ne p1, v0, :cond_3

    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/L;->h:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    return v2

    .line 23
    :cond_1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/L;->i:Z

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    add-int/2addr p1, v2

    .line 28
    :cond_2
    return p1

    .line 29
    :cond_3
    new-instance v7, Lcom/android/launcher3/taskbar/I;

    .line 30
    .line 31
    invoke-direct {v7, p0}, Lcom/android/launcher3/taskbar/I;-><init>(Lcom/android/launcher3/taskbar/L;)V

    .line 32
    .line 33
    .line 34
    new-instance v8, Lcom/android/launcher3/taskbar/J;

    .line 35
    .line 36
    invoke-direct {v8}, Lcom/android/launcher3/taskbar/J;-><init>()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L;->b:Lcom/android/launcher3/taskbar/R1;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 42
    .line 43
    new-instance v10, Landroid/window/RemoteTransition;

    .line 44
    .line 45
    new-instance v3, Lcom/android/quickstep/util/SlideInRemoteTransition;

    .line 46
    .line 47
    iget-object v4, p0, Lcom/android/launcher3/taskbar/L;->b:Lcom/android/launcher3/taskbar/R1;

    .line 48
    .line 49
    iget-object v4, v4, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 50
    .line 51
    invoke-virtual {v4}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-static {v4}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    iget v5, v5, Lcom/android/launcher3/h0;->W2:I

    .line 64
    .line 65
    invoke-static {v0}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    const v9, 0x10c001a

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v9}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    .line 73
    .line 74
    .line 75
    move-result-object v9

    .line 76
    move-object v11, v8

    .line 77
    move-object v8, v7

    .line 78
    move-object v7, v9

    .line 79
    move-object v9, v11

    .line 80
    invoke-direct/range {v3 .. v9}, Lcom/android/quickstep/util/SlideInRemoteTransition;-><init>(ZIFLandroid/animation/TimeInterpolator;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 81
    .line 82
    .line 83
    move-object v7, v8

    .line 84
    move-object v8, v9

    .line 85
    const-string v4, "SlideInTransition"

    .line 86
    .line 87
    invoke-direct {v10, v3, v4}, Landroid/window/RemoteTransition;-><init>(Landroid/window/IRemoteTransition;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object v3, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 91
    .line 92
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->getDesktopTaskIndex()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-ne p1, v3, :cond_4

    .line 97
    .line 98
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 99
    .line 100
    new-instance v0, Lcom/android/launcher3/taskbar/K;

    .line 101
    .line 102
    invoke-direct {v0, p0, v10}, Lcom/android/launcher3/taskbar/K;-><init>(Lcom/android/launcher3/taskbar/L;Landroid/window/RemoteTransition;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 106
    .line 107
    .line 108
    return v1

    .line 109
    :cond_4
    iget-object v3, p0, Lcom/android/launcher3/taskbar/L;->e:Lcom/android/launcher3/taskbar/s$a;

    .line 110
    .line 111
    invoke-virtual {v3, p1}, Lcom/android/launcher3/taskbar/s$a;->c(I)Lcom/android/quickstep/util/GroupTask;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    const/4 v4, 0x0

    .line 116
    if-nez v3, :cond_6

    .line 117
    .line 118
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/L;->h:Z

    .line 119
    .line 120
    if-eqz p0, :cond_5

    .line 121
    .line 122
    return v2

    .line 123
    :cond_5
    invoke-static {v4, p1}, Ljava/lang/Math;->max(II)I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    return p0

    .line 128
    :cond_6
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L;->e:Lcom/android/launcher3/taskbar/s$a;

    .line 129
    .line 130
    invoke-virtual {p1, v3}, Lcom/android/launcher3/taskbar/s$a;->f(Lcom/android/quickstep/util/GroupTask;)Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-eqz p1, :cond_7

    .line 135
    .line 136
    return v1

    .line 137
    :cond_7
    instance-of p1, v3, Lcom/android/quickstep/util/SingleTask;

    .line 138
    .line 139
    if-eqz p1, :cond_8

    .line 140
    .line 141
    move-object p1, v3

    .line 142
    check-cast p1, Lcom/android/quickstep/util/SingleTask;

    .line 143
    .line 144
    iget-object v5, p0, Lcom/android/launcher3/taskbar/L;->b:Lcom/android/launcher3/taskbar/R1;

    .line 145
    .line 146
    iget-object v5, v5, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 147
    .line 148
    invoke-virtual {p1}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 153
    .line 154
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 155
    .line 156
    invoke-virtual {v5, p1}, Lcom/android/launcher3/taskbar/I1;->e0(I)Z

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    if-eqz p1, :cond_8

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_8
    move v2, v4

    .line 164
    :goto_0
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/L;->h:Z

    .line 165
    .line 166
    if-eqz p1, :cond_9

    .line 167
    .line 168
    if-eqz v2, :cond_9

    .line 169
    .line 170
    new-instance v10, Landroid/window/RemoteTransition;

    .line 171
    .line 172
    new-instance p1, Lj1/i;

    .line 173
    .line 174
    sget-object v2, Lj1/i$a;->j:Lj1/i$a;

    .line 175
    .line 176
    const/16 v4, 0x7d

    .line 177
    .line 178
    sget-object v5, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 179
    .line 180
    invoke-direct {p1, v0, v2, v4, v5}, Lj1/i;-><init>(Landroid/content/Context;Lj1/i$a;ILjava/util/concurrent/Executor;)V

    .line 181
    .line 182
    .line 183
    const-string v0, "DesktopKeyboardQuickSwitchUnminimize"

    .line 184
    .line 185
    invoke-direct {v10, p1, v0}, Landroid/window/RemoteTransition;-><init>(Landroid/window/IRemoteTransition;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    :cond_9
    move-object v4, v10

    .line 189
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L;->b:Lcom/android/launcher3/taskbar/R1;

    .line 190
    .line 191
    iget-object v2, p1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 192
    .line 193
    iget-boolean v5, p0, Lcom/android/launcher3/taskbar/L;->h:Z

    .line 194
    .line 195
    sget-object v6, LO2/f;->j:LO2/f;

    .line 196
    .line 197
    invoke-virtual/range {v2 .. v8}, Lcom/android/launcher3/taskbar/I1;->L0(Lcom/android/quickstep/util/GroupTask;Landroid/window/RemoteTransition;ZLO2/f;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 198
    .line 199
    .line 200
    return v1
.end method

.method private t()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/taskbar/L;->f:Landroid/animation/Animator;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->T()V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/L;->k:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L;->c:La2/a;

    .line 14
    .line 15
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L;->e:Lcom/android/launcher3/taskbar/s$a;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/s$a;->g()V

    .line 27
    .line 28
    .line 29
    const/16 p0, 0x72

    .line 30
    .line 31
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method protected k(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/L;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L;->f:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L;->e:Lcom/android/launcher3/taskbar/s$a;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/s$a;->h()V

    .line 18
    .line 19
    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 23
    .line 24
    const/16 v0, 0x72

    .line 25
    .line 26
    invoke-static {p1, v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/L;->t()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->getCloseAnimation()Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/android/launcher3/taskbar/L;->f:Landroid/animation/Animator;

    .line 40
    .line 41
    new-instance v0, Lcom/android/launcher3/taskbar/L$a;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/L$a;-><init>(Lcom/android/launcher3/taskbar/L;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/android/launcher3/taskbar/L;->f:Landroid/animation/Animator;

    .line 50
    .line 51
    new-instance v0, Lcom/android/launcher3/taskbar/H;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/H;-><init>(Lcom/android/launcher3/taskbar/L;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L;->f:Landroid/animation/Animator;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public l(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "KeyboardQuickSwitchViewController:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "\thasFocus="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/view/ViewGroup;->hasFocus()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v1, "\tisCloseAnimationRunning="

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/L;->n()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v1, "\tmCurrentFocusIndex="

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget v1, p0, Lcom/android/launcher3/taskbar/L;->g:I

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v1, "\tmOnDesktop="

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/L;->h:Z

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    new-instance v0, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v1, "\tmWasDesktopTaskFilteredOut="

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/L;->i:Z

    .line 141
    .line 142
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const-string p1, "\tmWasOpenedFromTaskbar="

    .line 161
    .line 162
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/L;->j:Z

    .line 166
    .line 167
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method protected m()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/L;->g:I

    .line 2
    .line 3
    return p0
.end method

.method n()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L;->f:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method protected o(La2/h;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    invoke-virtual {p1, p0, p2}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method protected r()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/L;->g:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/L;->s(I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L;->e:Lcom/android/launcher3/taskbar/s$a;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/s$a;->e()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->getTaskCount()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-le v0, v1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 v1, 0x0

    .line 30
    :goto_0
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/L;->s(I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method protected u()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/L;->k(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method protected v(Ljava/util/List;IZIZZZZ)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;IZIZZZZ)V"
        }
    .end annotation

    .line 1
    move/from16 v0, p5

    .line 2
    .line 3
    move/from16 v1, p8

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/taskbar/L;->b:Lcom/android/launcher3/taskbar/R1;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher3/taskbar/L;->w(ZZ)V

    .line 14
    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/taskbar/L;->b:Lcom/android/launcher3/taskbar/R1;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Lcom/android/launcher3/taskbar/a4;->T0(Z)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/L;->c:La2/a;

    .line 29
    .line 30
    invoke-virtual {v2}, La2/a;->n()La2/h;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget-object v4, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 35
    .line 36
    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/L;->h:Z

    .line 40
    .line 41
    move/from16 v2, p7

    .line 42
    .line 43
    iput-boolean v2, p0, Lcom/android/launcher3/taskbar/L;->i:Z

    .line 44
    .line 45
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/L;->j:Z

    .line 46
    .line 47
    invoke-static {}, Lcom/android/launcher3/y0;->G0()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    iget-object v1, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->L()V

    .line 58
    .line 59
    .line 60
    :cond_1
    iget-object v4, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 61
    .line 62
    iget-object v5, p0, Lcom/android/launcher3/taskbar/L;->c:La2/a;

    .line 63
    .line 64
    iget-object v10, p0, Lcom/android/launcher3/taskbar/L;->a:Lcom/android/launcher3/taskbar/L$b;

    .line 65
    .line 66
    if-nez v0, :cond_2

    .line 67
    .line 68
    if-eqz p6, :cond_2

    .line 69
    .line 70
    :goto_0
    move-object v6, p1

    .line 71
    move v7, p2

    .line 72
    move v8, p3

    .line 73
    move/from16 v9, p4

    .line 74
    .line 75
    move v11, v3

    .line 76
    goto :goto_1

    .line 77
    :cond_2
    const/4 v3, 0x0

    .line 78
    goto :goto_0

    .line 79
    :goto_1
    invoke-virtual/range {v4 .. v11}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->J(Landroid/content/Context;Ljava/util/List;IZILcom/android/launcher3/taskbar/L$b;Z)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method protected w(ZZ)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p1, v0}, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const v1, 0x7f0704ee

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iget-object v2, p0, Lcom/android/launcher3/taskbar/L;->b:Lcom/android/launcher3/taskbar/R1;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const/4 v3, 0x0

    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    iget p2, v2, Lcom/android/launcher3/h0;->r3:I

    .line 40
    .line 41
    iget v4, v2, Lcom/android/launcher3/h0;->t3:I

    .line 42
    .line 43
    add-int/2addr p2, v4

    .line 44
    iget v2, v2, Lcom/android/launcher3/h0;->s3:I

    .line 45
    .line 46
    sub-int/2addr p2, v2

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    move p2, v3

    .line 49
    :goto_0
    const v2, 0x7f0704ed

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    add-int/2addr p2, v0

    .line 57
    invoke-virtual {p1, v1, v3, v1, p2}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 58
    .line 59
    .line 60
    const/4 p2, -0x2

    .line 61
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 62
    .line 63
    const/16 p2, 0x51

    .line 64
    .line 65
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 66
    .line 67
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method protected x(ZI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, -0x2

    .line 12
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p1, -0x1

    .line 16
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 17
    .line 18
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->I(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method protected y(Ljava/util/List;IIZZ)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;IIZZ)V"
        }
    .end annotation

    .line 1
    iput-boolean p5, p0, Lcom/android/launcher3/taskbar/L;->i:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/taskbar/L;->d:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/L;->c:La2/a;

    .line 6
    .line 7
    iget-object v6, p0, Lcom/android/launcher3/taskbar/L;->a:Lcom/android/launcher3/taskbar/L$b;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/L;->h:Z

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    if-eqz p4, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    :goto_0
    move v7, p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    goto :goto_0

    .line 20
    :goto_1
    const/4 v4, 0x1

    .line 21
    move-object v2, p1

    .line 22
    move v3, p2

    .line 23
    move v5, p3

    .line 24
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->J(Landroid/content/Context;Ljava/util/List;IZILcom/android/launcher3/taskbar/L$b;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method protected z()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/L;->j:Z

    .line 2
    .line 3
    return p0
.end method
