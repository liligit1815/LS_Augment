.class public Lcom/android/launcher3/taskbar/X2;
.super Ljava/lang/Object;
.source "TaskbarLauncherStateController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/X2$g;
    }
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/anim/d;

.field private b:Lcom/android/launcher3/taskbar/R1;

.field private c:Lcom/android/launcher3/anim/d;

.field private d:Lcom/android/launcher3/anim/d;

.field private e:Lcom/android/launcher3/anim/d;

.field private f:Lcom/android/launcher3/util/v1$c;

.field private g:Landroid/animation/Animator;

.field private h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private i:Z

.field private j:Ljava/lang/Integer;

.field private k:I

.field private l:Lcom/android/launcher3/V3;

.field private m:Z

.field private n:J

.field private o:J

.field private p:Lcom/android/launcher3/taskbar/X2$g;

.field private q:Z

.field private r:Z

.field private s:LN2/h;

.field private t:Z

.field private u:Z

.field private v:Lcom/android/quickstep/RecentsAnimationCallbacks;

.field private final w:Lcom/android/launcher3/X3$b;

.field private final x:Lcom/android/launcher3/statemanager/d$g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/statemanager/d$g<",
            "Lcom/android/launcher3/V3;",
            ">;"
        }
    .end annotation
.end field

.field private final y:Lcom/android/launcher3/statemanager/d$g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/statemanager/d$g<",
            "Lcom/android/quickstep/fallback/RecentsState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/taskbar/R2;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/R2;-><init>(Lcom/android/launcher3/taskbar/X2;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/X2;->i:Z

    .line 18
    .line 19
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 22
    .line 23
    const-wide/16 v0, 0x0

    .line 24
    .line 25
    iput-wide v0, p0, Lcom/android/launcher3/taskbar/X2;->n:J

    .line 26
    .line 27
    new-instance v0, Lcom/android/launcher3/taskbar/X2$a;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/X2$a;-><init>(Lcom/android/launcher3/taskbar/X2;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/launcher3/taskbar/X2;->w:Lcom/android/launcher3/X3$b;

    .line 33
    .line 34
    new-instance v0, Lcom/android/launcher3/taskbar/X2$b;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/X2$b;-><init>(Lcom/android/launcher3/taskbar/X2;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/android/launcher3/taskbar/X2;->x:Lcom/android/launcher3/statemanager/d$g;

    .line 40
    .line 41
    new-instance v0, Lcom/android/launcher3/taskbar/X2$c;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/X2$c;-><init>(Lcom/android/launcher3/taskbar/X2;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/android/launcher3/taskbar/X2;->y:Lcom/android/launcher3/statemanager/d$g;

    .line 47
    .line 48
    return-void
.end method

.method static bridge synthetic A(Lcom/android/launcher3/taskbar/X2;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/X2;->r0(ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static H(I)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/StringJoiner;

    .line 2
    .line 3
    const-string v1, "|"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/StringJoiner;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    const-string v2, "flag_visible"

    .line 10
    .line 11
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    const-string v2, "transition_to_visible"

    .line 16
    .line 17
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    const-string v2, "launcher_in_state_transition"

    .line 22
    .line 23
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/16 v1, 0x8

    .line 27
    .line 28
    const-string v2, "awake"

    .line 29
    .line 30
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/16 v1, 0x10

    .line 34
    .line 35
    const-string v2, "was_active_while_awake"

    .line 36
    .line 37
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/16 v1, 0x20

    .line 41
    .line 42
    const-string v2, "device_locked"

    .line 43
    .line 44
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/16 v1, 0x40

    .line 48
    .line 49
    const-string v2, "taskbar_hidden"

    .line 50
    .line 51
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/util/StringJoiner;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method private I(J)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/X2;->k:I

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/launcher3/taskbar/X2;->J(JJ)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method private J(JJ)Z
    .locals 0

    .line 1
    and-long p0, p1, p3

    .line 2
    .line 3
    const-wide/16 p2, 0x0

    .line 4
    .line 5
    cmp-long p0, p0, p2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private O()Z
    .locals 2

    .line 1
    const-wide/16 v0, 0x8

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/X2;->I(J)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-wide/16 v0, 0x3

    .line 10
    .line 11
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/X2;->I(J)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const-wide/16 v0, 0x10

    .line 17
    .line 18
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/X2;->I(J)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method private synthetic R()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->p:Lcom/android/launcher3/taskbar/X2$g;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {p0, v0, v1}, Lcom/android/launcher3/taskbar/X2$g;->a(Lcom/android/launcher3/taskbar/X2$g;ZZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic S()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/X2;->q0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic T(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->y:Lcom/android/launcher3/statemanager/d$g;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic U(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->y:Lcom/android/launcher3/statemanager/d$g;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/d;->b0(Lcom/android/launcher3/statemanager/d$g;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic V(ZLcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    sget-object v3, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    if-ne v2, v3, :cond_0

    .line 10
    .line 11
    move v2, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v2, v0

    .line 14
    :goto_0
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 19
    .line 20
    invoke-virtual {p1, p0, v1}, Lcom/android/launcher3/V3;->c(Lcom/android/launcher3/C2;I)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    move v0, v1

    .line 27
    :cond_1
    if-eqz v2, :cond_2

    .line 28
    .line 29
    sget-object p0, LX1/b$a;->g:LX1/b$a;

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_2
    if-eqz v0, :cond_3

    .line 33
    .line 34
    sget-object p0, LX1/b$a;->h:LX1/b$a;

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_3
    sget-object p0, LX1/b$a;->i:LX1/b$a;

    .line 38
    .line 39
    :goto_1
    iget-object p1, p2, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 40
    .line 41
    invoke-interface {p1, p0}, LX1/b;->d(LX1/b$a;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private synthetic W()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/anim/d;->k()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/X2;->Z()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private Z()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->f:Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 8
    .line 9
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 10
    .line 11
    const/high16 v2, 0x3f800000    # 1.0f

    .line 12
    .line 13
    cmpg-float v1, v1, v2

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x1

    .line 17
    if-gez v1, :cond_0

    .line 18
    .line 19
    move v1, v4

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v3

    .line 22
    :goto_0
    const/4 v5, 0x0

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-static {v0, v2}, Ljava/lang/Float;->compare(FF)I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    if-nez v6, :cond_2

    .line 30
    .line 31
    :cond_1
    if-nez v1, :cond_3

    .line 32
    .line 33
    invoke-static {v0, v5}, Ljava/lang/Float;->compare(FF)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    :cond_2
    move v0, v4

    .line 40
    goto :goto_1

    .line 41
    :cond_3
    move v0, v3

    .line 42
    :goto_1
    iget-object v6, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 43
    .line 44
    iget-object v6, v6, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 45
    .line 46
    iget-object v7, p0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 47
    .line 48
    iget v7, v7, Lcom/android/launcher3/anim/d;->d:F

    .line 49
    .line 50
    iget-object v8, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 51
    .line 52
    invoke-virtual {v8}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    invoke-virtual {v6, v7, v8}, Lcom/android/launcher3/taskbar/W4;->r0(FLcom/android/launcher3/h0;)V

    .line 57
    .line 58
    .line 59
    iget-object v6, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 60
    .line 61
    iget-object v6, v6, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 62
    .line 63
    iget-object v7, p0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 64
    .line 65
    iget v7, v7, Lcom/android/launcher3/anim/d;->d:F

    .line 66
    .line 67
    invoke-virtual {v6, v7}, Lcom/android/launcher3/taskbar/M0;->h1(F)V

    .line 68
    .line 69
    .line 70
    iget-object v6, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 71
    .line 72
    iget-object v6, v6, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 73
    .line 74
    invoke-virtual {v6}, Lcom/android/launcher3/taskbar/a4;->b0()Z

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_4
    move v2, v5

    .line 82
    :goto_2
    xor-int/lit8 v1, v6, 0x1

    .line 83
    .line 84
    invoke-direct {p0, v2, v3, v1}, Lcom/android/launcher3/taskbar/X2;->l0(FIZ)V

    .line 85
    .line 86
    .line 87
    if-eqz v0, :cond_5

    .line 88
    .line 89
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/X2;->t:Z

    .line 90
    .line 91
    if-eqz v0, :cond_5

    .line 92
    .line 93
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_5

    .line 98
    .line 99
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    new-instance v1, Lcom/android/launcher3/taskbar/U2;

    .line 114
    .line 115
    invoke-direct {v1}, Lcom/android/launcher3/taskbar/U2;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-static {v0, p0, v1}, Lu2/I;->b(Landroid/view/View;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 119
    .line 120
    .line 121
    :cond_5
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/X2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/X2;->R()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a0(IJZ)Landroid/animation/Animator;
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v4, p2

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/X2;->O()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    iget-object v1, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/o4;->v()Z

    .line 14
    .line 15
    .line 16
    move-result v6

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/X2;->M()Z

    .line 18
    .line 19
    .line 20
    move-result v7

    .line 21
    if-eqz v7, :cond_0

    .line 22
    .line 23
    const/high16 v11, 0x3f800000    # 1.0f

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v11, 0x0

    .line 27
    :goto_0
    iget-object v1, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->d1()Z

    .line 32
    .line 33
    .line 34
    move-result v12

    .line 35
    iget-object v1, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 38
    .line 39
    new-instance v3, Lcom/android/launcher3/taskbar/S2;

    .line 40
    .line 41
    invoke-direct {v3, v0, v2}, Lcom/android/launcher3/taskbar/S2;-><init>(Lcom/android/launcher3/taskbar/X2;Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v3}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 48
    .line 49
    iget-object v3, v1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 50
    .line 51
    iget-object v1, v0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 52
    .line 53
    sget-object v8, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 54
    .line 55
    if-ne v1, v8, :cond_1

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    const/4 v1, 0x0

    .line 60
    :goto_1
    const-wide/16 v9, 0x800

    .line 61
    .line 62
    invoke-virtual {v3, v9, v10, v1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 63
    .line 64
    .line 65
    new-instance v9, Landroid/animation/AnimatorSet;

    .line 66
    .line 67
    invoke-direct {v9}, Landroid/animation/AnimatorSet;-><init>()V

    .line 68
    .line 69
    .line 70
    move/from16 v1, p1

    .line 71
    .line 72
    int-to-long v13, v1

    .line 73
    move/from16 v17, v11

    .line 74
    .line 75
    const-wide/16 v10, 0x4

    .line 76
    .line 77
    invoke-direct {v0, v13, v14, v10, v11}, Lcom/android/launcher3/taskbar/X2;->J(JJ)Z

    .line 78
    .line 79
    .line 80
    move-result v18

    .line 81
    move/from16 v19, v6

    .line 82
    .line 83
    move/from16 v20, v7

    .line 84
    .line 85
    const-wide/16 v6, 0x0

    .line 86
    .line 87
    if-eqz v18, :cond_5

    .line 88
    .line 89
    invoke-direct {v0, v10, v11}, Lcom/android/launcher3/taskbar/X2;->I(J)Z

    .line 90
    .line 91
    .line 92
    move-result v10

    .line 93
    xor-int/lit8 v11, v10, 0x1

    .line 94
    .line 95
    invoke-direct {v0, v9, v4, v5, v11}, Lcom/android/launcher3/taskbar/X2;->c0(Landroid/animation/AnimatorSet;JZ)V

    .line 96
    .line 97
    .line 98
    if-nez v10, :cond_2

    .line 99
    .line 100
    iget-object v10, v0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 101
    .line 102
    sget-object v11, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 103
    .line 104
    if-ne v10, v11, :cond_2

    .line 105
    .line 106
    const/4 v1, 0x1

    .line 107
    const/4 v10, 0x0

    .line 108
    invoke-virtual {v0, v1, v10}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v6, v7}, Lcom/android/launcher3/taskbar/X2;->D(J)V

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_2
    const/4 v10, 0x0

    .line 116
    :goto_2
    iget-object v1, v0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 117
    .line 118
    sget-object v11, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 119
    .line 120
    if-ne v1, v11, :cond_3

    .line 121
    .line 122
    const/4 v11, 0x1

    .line 123
    goto :goto_3

    .line 124
    :cond_3
    move v11, v10

    .line 125
    :goto_3
    if-ne v1, v8, :cond_4

    .line 126
    .line 127
    iget-object v1, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 128
    .line 129
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-nez v1, :cond_4

    .line 136
    .line 137
    iget-object v1, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 140
    .line 141
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->O1()V

    .line 142
    .line 143
    .line 144
    :cond_4
    move v1, v11

    .line 145
    goto :goto_4

    .line 146
    :cond_5
    const/4 v10, 0x0

    .line 147
    move v1, v10

    .line 148
    :goto_4
    const-wide/16 v10, 0x3

    .line 149
    .line 150
    invoke-direct {v0, v13, v14, v10, v11}, Lcom/android/launcher3/taskbar/X2;->J(JJ)Z

    .line 151
    .line 152
    .line 153
    move-result v8

    .line 154
    if-eqz v8, :cond_6

    .line 155
    .line 156
    new-instance v0, Lcom/android/launcher3/taskbar/X2$d;

    .line 157
    .line 158
    move-object/from16 v1, p0

    .line 159
    .line 160
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/taskbar/X2$d;-><init>(Lcom/android/launcher3/taskbar/X2;ZLcom/android/launcher3/taskbar/a4;J)V

    .line 161
    .line 162
    .line 163
    move-object v10, v1

    .line 164
    move-object v1, v0

    .line 165
    move-object v0, v10

    .line 166
    move v10, v2

    .line 167
    invoke-virtual {v9, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 168
    .line 169
    .line 170
    const/4 v1, 0x1

    .line 171
    goto :goto_5

    .line 172
    :cond_6
    move v10, v2

    .line 173
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/a4;->D()V

    .line 174
    .line 175
    .line 176
    :goto_5
    if-eqz v1, :cond_7

    .line 177
    .line 178
    if-eqz v10, :cond_7

    .line 179
    .line 180
    iget-object v1, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 181
    .line 182
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 183
    .line 184
    invoke-static {v1}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 185
    .line 186
    .line 187
    :cond_7
    const-wide/16 v1, 0x40

    .line 188
    .line 189
    invoke-direct {v0, v13, v14, v1, v2}, Lcom/android/launcher3/taskbar/X2;->J(JJ)Z

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    if-eqz v3, :cond_8

    .line 194
    .line 195
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/taskbar/X2;->I(J)Z

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    if-nez v3, :cond_8

    .line 200
    .line 201
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 202
    .line 203
    .line 204
    move-result-wide v6

    .line 205
    iput-wide v6, v0, Lcom/android/launcher3/taskbar/X2;->n:J

    .line 206
    .line 207
    :cond_8
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/taskbar/X2;->I(J)Z

    .line 208
    .line 209
    .line 210
    move-result v3

    .line 211
    if-eqz v3, :cond_9

    .line 212
    .line 213
    const/4 v6, 0x0

    .line 214
    goto :goto_6

    .line 215
    :cond_9
    const/high16 v6, 0x3f800000    # 1.0f

    .line 216
    .line 217
    :goto_6
    iget-object v7, v0, Lcom/android/launcher3/taskbar/X2;->d:Lcom/android/launcher3/anim/d;

    .line 218
    .line 219
    invoke-virtual {v7}, Lcom/android/launcher3/anim/d;->k()Z

    .line 220
    .line 221
    .line 222
    move-result v7

    .line 223
    if-nez v7, :cond_b

    .line 224
    .line 225
    iget-object v7, v0, Lcom/android/launcher3/taskbar/X2;->d:Lcom/android/launcher3/anim/d;

    .line 226
    .line 227
    iget v7, v7, Lcom/android/launcher3/anim/d;->d:F

    .line 228
    .line 229
    cmpl-float v7, v7, v6

    .line 230
    .line 231
    if-eqz v7, :cond_a

    .line 232
    .line 233
    goto :goto_7

    .line 234
    :cond_a
    const-wide/16 v7, 0x0

    .line 235
    .line 236
    goto :goto_9

    .line 237
    :cond_b
    :goto_7
    iget-object v7, v0, Lcom/android/launcher3/taskbar/X2;->d:Lcom/android/launcher3/anim/d;

    .line 238
    .line 239
    invoke-virtual {v7, v6}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 240
    .line 241
    .line 242
    move-result-object v6

    .line 243
    invoke-virtual {v6, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 244
    .line 245
    .line 246
    if-eqz v3, :cond_c

    .line 247
    .line 248
    new-instance v3, Lcom/android/launcher3/taskbar/X2$e;

    .line 249
    .line 250
    invoke-direct {v3, v0}, Lcom/android/launcher3/taskbar/X2$e;-><init>(Lcom/android/launcher3/taskbar/X2;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v9, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 254
    .line 255
    .line 256
    const-wide/16 v7, 0x0

    .line 257
    .line 258
    goto :goto_8

    .line 259
    :cond_c
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 260
    .line 261
    .line 262
    move-result-wide v7

    .line 263
    iget-wide v1, v0, Lcom/android/launcher3/taskbar/X2;->n:J

    .line 264
    .line 265
    sub-long/2addr v7, v1

    .line 266
    const-wide/16 v1, 0xfa

    .line 267
    .line 268
    sub-long/2addr v1, v7

    .line 269
    const-wide/16 v7, 0x0

    .line 270
    .line 271
    invoke-static {v7, v8, v1, v2}, Ljava/lang/Math;->max(JJ)J

    .line 272
    .line 273
    .line 274
    move-result-wide v1

    .line 275
    invoke-virtual {v6, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 276
    .line 277
    .line 278
    :goto_8
    invoke-virtual {v9, v6}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 279
    .line 280
    .line 281
    :goto_9
    if-eqz v10, :cond_d

    .line 282
    .line 283
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/X2;->Q()Z

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    if-eqz v1, :cond_d

    .line 288
    .line 289
    const/4 v1, 0x0

    .line 290
    goto :goto_a

    .line 291
    :cond_d
    const/high16 v1, 0x3f800000    # 1.0f

    .line 292
    .line 293
    :goto_a
    iget-object v2, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 294
    .line 295
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 296
    .line 297
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/s2;->u()Lcom/android/launcher3/anim/d;

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    iget-object v2, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 302
    .line 303
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 304
    .line 305
    move/from16 v6, v19

    .line 306
    .line 307
    invoke-static {v2, v10, v6}, Lcom/android/launcher3/taskbar/X2;->i0(Lcom/android/launcher3/taskbar/I1;ZZ)Z

    .line 308
    .line 309
    .line 310
    move-result v2

    .line 311
    if-eqz v2, :cond_e

    .line 312
    .line 313
    const/4 v6, 0x0

    .line 314
    goto :goto_b

    .line 315
    :cond_e
    const/high16 v6, 0x3f800000    # 1.0f

    .line 316
    .line 317
    :goto_b
    if-eqz v2, :cond_f

    .line 318
    .line 319
    const/high16 v11, 0x3f800000    # 1.0f

    .line 320
    .line 321
    goto :goto_c

    .line 322
    :cond_f
    const/4 v11, 0x0

    .line 323
    :goto_c
    iget-object v7, v0, Lcom/android/launcher3/taskbar/X2;->c:Lcom/android/launcher3/anim/d;

    .line 324
    .line 325
    invoke-virtual {v7}, Lcom/android/launcher3/anim/d;->k()Z

    .line 326
    .line 327
    .line 328
    move-result v7

    .line 329
    if-nez v7, :cond_11

    .line 330
    .line 331
    iget-object v7, v0, Lcom/android/launcher3/taskbar/X2;->c:Lcom/android/launcher3/anim/d;

    .line 332
    .line 333
    iget v7, v7, Lcom/android/launcher3/anim/d;->d:F

    .line 334
    .line 335
    cmpl-float v7, v7, v1

    .line 336
    .line 337
    if-nez v7, :cond_11

    .line 338
    .line 339
    invoke-virtual {v3, v11}, Lcom/android/launcher3/anim/d;->l(F)Z

    .line 340
    .line 341
    .line 342
    move-result v7

    .line 343
    if-nez v7, :cond_11

    .line 344
    .line 345
    iget v7, v3, Lcom/android/launcher3/anim/d;->d:F

    .line 346
    .line 347
    cmpl-float v7, v7, v6

    .line 348
    .line 349
    if-eqz v7, :cond_10

    .line 350
    .line 351
    goto :goto_d

    .line 352
    :cond_10
    move-object v1, v9

    .line 353
    move/from16 p1, v10

    .line 354
    .line 355
    const-wide/16 v9, 0x40

    .line 356
    .line 357
    goto/16 :goto_14

    .line 358
    .line 359
    :cond_11
    :goto_d
    iget-object v7, v0, Lcom/android/launcher3/taskbar/X2;->c:Lcom/android/launcher3/anim/d;

    .line 360
    .line 361
    invoke-virtual {v7}, Lcom/android/launcher3/anim/d;->h()V

    .line 362
    .line 363
    .line 364
    if-eqz v10, :cond_12

    .line 365
    .line 366
    if-nez v20, :cond_12

    .line 367
    .line 368
    const/4 v7, 0x1

    .line 369
    goto :goto_e

    .line 370
    :cond_12
    const/4 v7, 0x0

    .line 371
    :goto_e
    if-nez v10, :cond_13

    .line 372
    .line 373
    if-nez v20, :cond_13

    .line 374
    .line 375
    const/4 v8, 0x1

    .line 376
    goto :goto_f

    .line 377
    :cond_13
    const/4 v8, 0x0

    .line 378
    :goto_f
    if-eqz v10, :cond_14

    .line 379
    .line 380
    if-eqz v20, :cond_14

    .line 381
    .line 382
    const/16 v19, 0x1

    .line 383
    .line 384
    goto :goto_10

    .line 385
    :cond_14
    const/16 v19, 0x0

    .line 386
    .line 387
    :goto_10
    iget-object v15, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 388
    .line 389
    iget-object v15, v15, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 390
    .line 391
    invoke-virtual {v15}, Lcom/android/launcher3/taskbar/o4;->t()Z

    .line 392
    .line 393
    .line 394
    move-result v15

    .line 395
    const v21, 0x3ea8f5c3    # 0.33f

    .line 396
    .line 397
    .line 398
    if-eqz v7, :cond_15

    .line 399
    .line 400
    :goto_11
    long-to-float v7, v4

    .line 401
    mul-float v7, v7, v21

    .line 402
    .line 403
    goto :goto_12

    .line 404
    :cond_15
    if-eqz v8, :cond_16

    .line 405
    .line 406
    if-eqz v15, :cond_16

    .line 407
    .line 408
    goto :goto_11

    .line 409
    :cond_16
    const/4 v7, 0x0

    .line 410
    :goto_12
    long-to-float v8, v4

    .line 411
    sub-float v21, v8, v7

    .line 412
    .line 413
    if-eqz v19, :cond_17

    .line 414
    .line 415
    if-eqz v15, :cond_17

    .line 416
    .line 417
    const/high16 v15, 0x3e800000    # 0.25f

    .line 418
    .line 419
    mul-float v21, v8, v15

    .line 420
    .line 421
    :cond_17
    move/from16 v15, v21

    .line 422
    .line 423
    iget-object v8, v0, Lcom/android/launcher3/taskbar/X2;->c:Lcom/android/launcher3/anim/d;

    .line 424
    .line 425
    invoke-virtual {v8, v1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 426
    .line 427
    .line 428
    move-result-object v8

    .line 429
    if-eqz v12, :cond_18

    .line 430
    .line 431
    move-wide/from16 v22, v4

    .line 432
    .line 433
    move v5, v6

    .line 434
    move-wide/from16 v6, v22

    .line 435
    .line 436
    move-object v1, v9

    .line 437
    move/from16 p1, v10

    .line 438
    .line 439
    move v4, v11

    .line 440
    const-wide/16 v9, 0x40

    .line 441
    .line 442
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/taskbar/X2;->h0(Landroid/animation/AnimatorSet;ZLcom/android/launcher3/anim/d;FFJLandroid/animation/Animator;)V

    .line 443
    .line 444
    .line 445
    move-wide v4, v6

    .line 446
    goto :goto_13

    .line 447
    :cond_18
    move v11, v7

    .line 448
    move-object v1, v9

    .line 449
    move/from16 p1, v10

    .line 450
    .line 451
    const-wide/16 v9, 0x40

    .line 452
    .line 453
    float-to-long v2, v15

    .line 454
    invoke-virtual {v8, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 455
    .line 456
    .line 457
    float-to-long v2, v11

    .line 458
    invoke-virtual {v8, v2, v3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 459
    .line 460
    .line 461
    :goto_13
    invoke-virtual {v1, v8}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 462
    .line 463
    .line 464
    :goto_14
    if-eqz p1, :cond_19

    .line 465
    .line 466
    const/16 v16, 0x0

    .line 467
    .line 468
    goto :goto_15

    .line 469
    :cond_19
    const/high16 v16, 0x3f800000    # 1.0f

    .line 470
    .line 471
    :goto_15
    iget-object v2, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 472
    .line 473
    iget-object v3, v2, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 474
    .line 475
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 476
    .line 477
    invoke-virtual {v2}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 478
    .line 479
    .line 480
    move-result v2

    .line 481
    invoke-virtual {v3, v2}, Lcom/android/launcher3/taskbar/S1;->d(I)Z

    .line 482
    .line 483
    .line 484
    move-result v2

    .line 485
    if-eqz v2, :cond_1a

    .line 486
    .line 487
    iget-object v2, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 488
    .line 489
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 490
    .line 491
    .line 492
    move-result-object v2

    .line 493
    if-eqz v2, :cond_1a

    .line 494
    .line 495
    iget-object v2, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 496
    .line 497
    iget-object v3, v2, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 498
    .line 499
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 500
    .line 501
    .line 502
    move-result-object v2

    .line 503
    iget-boolean v2, v2, Lcom/android/launcher3/taskbar/J3;->x:Z

    .line 504
    .line 505
    invoke-virtual {v3, v2}, Lcom/android/launcher3/taskbar/S1;->a(Z)F

    .line 506
    .line 507
    .line 508
    move-result v16

    .line 509
    :cond_1a
    move/from16 v2, v16

    .line 510
    .line 511
    iget-object v3, v0, Lcom/android/launcher3/taskbar/X2;->e:Lcom/android/launcher3/anim/d;

    .line 512
    .line 513
    invoke-virtual {v3}, Lcom/android/launcher3/anim/d;->k()Z

    .line 514
    .line 515
    .line 516
    move-result v3

    .line 517
    if-nez v3, :cond_1b

    .line 518
    .line 519
    iget-object v3, v0, Lcom/android/launcher3/taskbar/X2;->e:Lcom/android/launcher3/anim/d;

    .line 520
    .line 521
    iget v3, v3, Lcom/android/launcher3/anim/d;->d:F

    .line 522
    .line 523
    cmpl-float v3, v3, v2

    .line 524
    .line 525
    if-eqz v3, :cond_1c

    .line 526
    .line 527
    :cond_1b
    iget-object v3, v0, Lcom/android/launcher3/taskbar/X2;->e:Lcom/android/launcher3/anim/d;

    .line 528
    .line 529
    invoke-virtual {v3}, Lcom/android/launcher3/anim/d;->h()V

    .line 530
    .line 531
    .line 532
    iget-object v3, v0, Lcom/android/launcher3/taskbar/X2;->e:Lcom/android/launcher3/anim/d;

    .line 533
    .line 534
    invoke-virtual {v3, v2}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 535
    .line 536
    .line 537
    move-result-object v2

    .line 538
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 539
    .line 540
    .line 541
    :cond_1c
    const-wide/16 v2, 0x20

    .line 542
    .line 543
    invoke-direct {v0, v13, v14, v2, v3}, Lcom/android/launcher3/taskbar/X2;->J(JJ)Z

    .line 544
    .line 545
    .line 546
    move-result v6

    .line 547
    if-eqz v6, :cond_1d

    .line 548
    .line 549
    invoke-direct {v0, v2, v3}, Lcom/android/launcher3/taskbar/X2;->I(J)Z

    .line 550
    .line 551
    .line 552
    move-result v2

    .line 553
    if-nez v2, :cond_1d

    .line 554
    .line 555
    const/4 v2, 0x1

    .line 556
    goto :goto_16

    .line 557
    :cond_1d
    const/4 v2, 0x0

    .line 558
    :goto_16
    if-eqz v2, :cond_1e

    .line 559
    .line 560
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 561
    .line 562
    .line 563
    move-result-wide v6

    .line 564
    const-wide/16 v13, 0xc8

    .line 565
    .line 566
    add-long/2addr v6, v13

    .line 567
    iput-wide v6, v0, Lcom/android/launcher3/taskbar/X2;->o:J

    .line 568
    .line 569
    :cond_1e
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 570
    .line 571
    .line 572
    move-result-wide v6

    .line 573
    iget-wide v13, v0, Lcom/android/launcher3/taskbar/X2;->o:J

    .line 574
    .line 575
    cmp-long v3, v6, v13

    .line 576
    .line 577
    if-gez v3, :cond_1f

    .line 578
    .line 579
    const/4 v13, 0x1

    .line 580
    goto :goto_17

    .line 581
    :cond_1f
    const/4 v13, 0x0

    .line 582
    :goto_17
    if-nez v2, :cond_20

    .line 583
    .line 584
    if-eqz v13, :cond_21

    .line 585
    .line 586
    :cond_20
    move/from16 v3, v17

    .line 587
    .line 588
    goto :goto_19

    .line 589
    :cond_21
    iget-object v2, v0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 590
    .line 591
    move/from16 v3, v17

    .line 592
    .line 593
    invoke-virtual {v2, v3}, Lcom/android/launcher3/anim/d;->l(F)Z

    .line 594
    .line 595
    .line 596
    move-result v2

    .line 597
    if-nez v2, :cond_24

    .line 598
    .line 599
    iget-object v2, v0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 600
    .line 601
    invoke-virtual {v2, v3}, Lcom/android/launcher3/anim/d;->m(F)Z

    .line 602
    .line 603
    .line 604
    move-result v2

    .line 605
    if-eqz v2, :cond_22

    .line 606
    .line 607
    goto :goto_18

    .line 608
    :cond_22
    iget-object v2, v0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 609
    .line 610
    invoke-virtual {v2}, Lcom/android/launcher3/anim/d;->h()V

    .line 611
    .line 612
    .line 613
    iget-object v2, v0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 614
    .line 615
    invoke-virtual {v2, v3}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 616
    .line 617
    .line 618
    move-result-object v2

    .line 619
    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 620
    .line 621
    .line 622
    move-result-object v2

    .line 623
    if-nez v12, :cond_25

    .line 624
    .line 625
    invoke-direct {v0, v9, v10}, Lcom/android/launcher3/taskbar/X2;->I(J)Z

    .line 626
    .line 627
    .line 628
    move-result v0

    .line 629
    if-eqz v0, :cond_23

    .line 630
    .line 631
    sget-object v0, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 632
    .line 633
    invoke-virtual {v2, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 634
    .line 635
    .line 636
    goto :goto_1a

    .line 637
    :cond_23
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 638
    .line 639
    .line 640
    goto :goto_1a

    .line 641
    :cond_24
    :goto_18
    new-instance v2, Lcom/android/launcher3/taskbar/T2;

    .line 642
    .line 643
    invoke-direct {v2, v0}, Lcom/android/launcher3/taskbar/T2;-><init>(Lcom/android/launcher3/taskbar/X2;)V

    .line 644
    .line 645
    .line 646
    invoke-static {v2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 647
    .line 648
    .line 649
    move-result-object v0

    .line 650
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 651
    .line 652
    .line 653
    goto :goto_1a

    .line 654
    :goto_19
    iget-object v2, v0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 655
    .line 656
    invoke-virtual {v2}, Lcom/android/launcher3/anim/d;->h()V

    .line 657
    .line 658
    .line 659
    iget-object v2, v0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 660
    .line 661
    invoke-virtual {v2, v3}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 662
    .line 663
    .line 664
    if-nez p1, :cond_25

    .line 665
    .line 666
    iget-object v2, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 667
    .line 668
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 669
    .line 670
    const-wide/16 v3, 0x1

    .line 671
    .line 672
    const/4 v5, 0x1

    .line 673
    invoke-virtual {v2, v3, v4, v5}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 674
    .line 675
    .line 676
    iget-object v0, v0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 677
    .line 678
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 679
    .line 680
    const-wide/16 v7, 0x0

    .line 681
    .line 682
    invoke-virtual {v0, v7, v8}, Lcom/android/launcher3/taskbar/a4;->E(J)V

    .line 683
    .line 684
    .line 685
    :cond_25
    :goto_1a
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 686
    .line 687
    .line 688
    move-result v0

    .line 689
    if-eqz v0, :cond_26

    .line 690
    .line 691
    if-nez v12, :cond_26

    .line 692
    .line 693
    sget-object v0, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->SCALE_INTERPOLATOR:Landroid/view/animation/PathInterpolator;

    .line 694
    .line 695
    goto :goto_1b

    .line 696
    :cond_26
    sget-object v0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 697
    .line 698
    :goto_1b
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 699
    .line 700
    .line 701
    if-eqz p4, :cond_27

    .line 702
    .line 703
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 704
    .line 705
    .line 706
    :cond_27
    return-object v1
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/X2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/X2;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/X2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/X2;->W()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c0(Landroid/animation/AnimatorSet;JZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V3;->B(Lcom/android/launcher3/C2;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 12
    .line 13
    const-wide/16 v2, 0x10

    .line 14
    .line 15
    invoke-virtual {v1, v2, v3, v0}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2, p3}, Lcom/android/launcher3/taskbar/a4;->L(J)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    new-instance v2, Lcom/android/launcher3/taskbar/X2$f;

    .line 25
    .line 26
    invoke-direct {v2, p0, v0, p4}, Lcom/android/launcher3/taskbar/X2$f;-><init>(Lcom/android/launcher3/taskbar/X2;ZZ)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p4, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 36
    .line 37
    iget-object p4, p4, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 38
    .line 39
    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/a4;->c0()Z

    .line 40
    .line 41
    .line 42
    move-result p4

    .line 43
    if-eqz p4, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const-wide/16 v0, 0x2

    .line 47
    .line 48
    div-long/2addr p2, v0

    .line 49
    :goto_0
    iget-object p4, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 50
    .line 51
    iget-object p4, p4, Lcom/android/launcher3/taskbar/R1;->t:Lcom/android/launcher3/taskbar/j4;

    .line 52
    .line 53
    invoke-virtual {p4, p2, p3}, Lcom/android/launcher3/taskbar/j4;->v(J)Z

    .line 54
    .line 55
    .line 56
    move-result p4

    .line 57
    if-nez p4, :cond_3

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->L()Z

    .line 60
    .line 61
    .line 62
    move-result p4

    .line 63
    if-nez p4, :cond_2

    .line 64
    .line 65
    iget-object p4, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 66
    .line 67
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 68
    .line 69
    if-ne p4, v0, :cond_3

    .line 70
    .line 71
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->t:Lcom/android/launcher3/taskbar/j4;

    .line 74
    .line 75
    invoke-virtual {p0, p2, p3}, Lcom/android/launcher3/taskbar/j4;->o(J)Landroid/animation/ValueAnimator;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 80
    .line 81
    .line 82
    :cond_3
    return-void
.end method

.method public static synthetic d()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/taskbar/X2;Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/X2;->U(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e0(Ljava/util/function/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/fallback/window/RecentsWindowManager;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->getEnableOverviewInWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-virtual {v0, p0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getRecentsWindowManager(I)Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/taskbar/X2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/X2;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/taskbar/X2;Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/X2;->T(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/taskbar/X2;ZLcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/X2;->V(ZLcom/android/launcher3/taskbar/bubbles/m0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h0(Landroid/animation/AnimatorSet;ZLcom/android/launcher3/anim/d;FFJLandroid/animation/Animator;)V
    .locals 5

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    move v2, v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v2, v1

    .line 9
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 10
    .line 11
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-virtual {v3, v2, v4}, Lcom/android/launcher3/Hotseat;->o1(FI)V

    .line 17
    .line 18
    .line 19
    iget-boolean v3, p0, Lcom/android/launcher3/taskbar/X2;->u:Z

    .line 20
    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    iget-object v3, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 24
    .line 25
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v3, v2, v4}, Lcom/android/launcher3/Hotseat;->p1(FI)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget v2, p3, Lcom/android/launcher3/anim/d;->d:F

    .line 33
    .line 34
    cmpl-float v2, v2, p5

    .line 35
    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    invoke-virtual {p3}, Lcom/android/launcher3/anim/d;->k()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_3

    .line 43
    .line 44
    :cond_2
    invoke-virtual {p3, p4}, Lcom/android/launcher3/anim/d;->l(F)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_6

    .line 49
    .line 50
    :cond_3
    invoke-virtual {p3}, Lcom/android/launcher3/anim/d;->h()V

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lcom/android/launcher3/taskbar/X2;->f:Lcom/android/launcher3/util/v1$c;

    .line 54
    .line 55
    if-eqz p2, :cond_4

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_4
    move v0, v1

    .line 59
    :goto_1
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v2, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 64
    .line 65
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 66
    .line 67
    iget-object v2, v2, Lcom/android/launcher3/taskbar/W4;->l:Lcom/android/launcher3/anim/d;

    .line 68
    .line 69
    invoke-virtual {p3, p4, p5}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    iget p0, p0, Lcom/android/launcher3/h0;->r3:I

    .line 82
    .line 83
    int-to-float p0, p0

    .line 84
    if-eqz p2, :cond_5

    .line 85
    .line 86
    invoke-virtual {v2, p0, v1}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    goto :goto_2

    .line 91
    :cond_5
    invoke-virtual {v2, v1, p0}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    :goto_2
    invoke-virtual {v0, p6, p7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, p6, p7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 99
    .line 100
    .line 101
    invoke-virtual {p3, p6, p7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, p3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 111
    .line 112
    .line 113
    :cond_6
    if-eqz p2, :cond_7

    .line 114
    .line 115
    sget-object p0, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_7
    sget-object p0, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 119
    .line 120
    :goto_3
    invoke-virtual {p8, p0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p8, p6, p7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method static bridge synthetic i(Lcom/android/launcher3/taskbar/X2;)LN2/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->s:LN2/h;

    .line 2
    .line 3
    return-object p0
.end method

.method private static i0(Lcom/android/launcher3/taskbar/I1;ZZ)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->q2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->r2()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    if-eqz p1, :cond_3

    .line 19
    .line 20
    if-eqz p2, :cond_2

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_3
    :goto_0
    return v1
.end method

.method static bridge synthetic j(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/taskbar/R1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-object p0
.end method

.method private j0(FZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->g:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/X2;->g:Landroid/animation/Animator;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-virtual {v2, v3}, Lcom/android/launcher3/Hotseat;->X0(I)Lcom/android/launcher3/util/v1$c;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-eqz p2, :cond_1

    .line 34
    .line 35
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    filled-new-array {v2}, [Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/X2;->u:Z

    .line 51
    .line 52
    if-eqz v2, :cond_2

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    const/4 p1, 0x0

    .line 56
    :goto_1
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->getQsbTranslationX()Lcom/android/launcher3/util/v1$c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    if-eqz p2, :cond_3

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    filled-new-array {p1}, [Landroid/animation/Animator;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {v1, p1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 77
    .line 78
    .line 79
    :cond_4
    :goto_2
    if-nez p2, :cond_5

    .line 80
    .line 81
    return-void

    .line 82
    :cond_5
    iput-object v1, p0, Lcom/android/launcher3/taskbar/X2;->g:Landroid/animation/Animator;

    .line 83
    .line 84
    const-wide/16 p0, 0x64

    .line 85
    .line 86
    invoke-virtual {v1, p0, p1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 90
    .line 91
    .line 92
    sget-object p0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 93
    .line 94
    invoke-virtual {v1, p0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method static bridge synthetic k(Lcom/android/launcher3/taskbar/X2;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/X2;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method private k0(FI)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/X2;->l0(FIZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method static bridge synthetic l(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    return-object p0
.end method

.method private l0(FIZ)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/X2;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz p3, :cond_1

    .line 7
    .line 8
    iget-object p3, p0, Lcom/android/launcher3/taskbar/X2;->f:Lcom/android/launcher3/util/v1$c;

    .line 9
    .line 10
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 11
    .line 12
    .line 13
    :cond_1
    const/4 p3, 0x0

    .line 14
    cmpl-float p1, p1, p3

    .line 15
    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/o4;->t()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_3

    .line 37
    .line 38
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 39
    .line 40
    iget p1, p1, Lcom/android/launcher3/anim/d;->d:F

    .line 41
    .line 42
    cmpl-float p1, p1, p3

    .line 43
    .line 44
    if-lez p1, :cond_3

    .line 45
    .line 46
    :cond_2
    const/high16 p3, 0x3f800000    # 1.0f

    .line 47
    .line 48
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1, p3, p2}, Lcom/android/launcher3/Hotseat;->o1(FI)V

    .line 55
    .line 56
    .line 57
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/X2;->u:Z

    .line 58
    .line 59
    if-eqz p1, :cond_4

    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, p3, p2}, Lcom/android/launcher3/Hotseat;->p1(FI)V

    .line 68
    .line 69
    .line 70
    :cond_4
    :goto_0
    return-void
.end method

.method static bridge synthetic m(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/V3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    return-object p0
.end method

.method private m0(Lcom/android/launcher3/V3;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->isSplitSelectionActive()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/X2;->q:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 17
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->d()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->b()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-static {p0, v1, v0, p1}, Lcom/android/launcher3/taskbar/X4;->a(Lcom/android/launcher3/taskbar/R1;ZZZ)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method static bridge synthetic n(Lcom/android/launcher3/taskbar/X2;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->j:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic o(Lcom/android/launcher3/taskbar/X2;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/X2;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic p(Lcom/android/launcher3/taskbar/X2;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/X2;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method private p0(JZ)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x8

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/X2;->I(J)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-wide/32 v1, 0x10000000

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1, p2, v1, v2}, Lcom/android/launcher3/taskbar/X2;->J(JJ)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    invoke-virtual {p0, v2, v1}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 17
    .line 18
    .line 19
    if-eq v0, v1, :cond_1

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-wide/16 v0, 0x3

    .line 24
    .line 25
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/X2;->I(J)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v0, 0x0

    .line 34
    :goto_0
    const/16 v1, 0x10

    .line 35
    .line 36
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 37
    .line 38
    .line 39
    :cond_1
    const/16 v0, 0x20

    .line 40
    .line 41
    invoke-static {p1, p2}, Lcom/android/quickstep/util/SystemUiFlagUtils;->isLocked(J)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 46
    .line 47
    .line 48
    const/16 v0, 0x40

    .line 49
    .line 50
    invoke-static {p1, p2}, Lcom/android/quickstep/util/SystemUiFlagUtils;->isTaskbarHidden(J)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 55
    .line 56
    .line 57
    if-eqz p3, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->C()V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void
.end method

.method static bridge synthetic q(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/statemanager/d$g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->x:Lcom/android/launcher3/statemanager/d$g;

    .line 2
    .line 3
    return-object p0
.end method

.method private q0(Z)V
    .locals 1

    .line 1
    xor-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/taskbar/X2;->r0(ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method static bridge synthetic r(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/util/v1$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->f:Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    return-object p0
.end method

.method private r0(ZZ)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v2, v1

    .line 9
    goto :goto_1

    .line 10
    :cond_1
    :goto_0
    move v2, v0

    .line 11
    :goto_1
    const/4 v3, 0x2

    .line 12
    invoke-virtual {p0, v3, v1}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->C()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 24
    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    if-nez p2, :cond_2

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_2
    move v0, v1

    .line 31
    :goto_2
    const-wide/16 p1, 0x1

    .line 32
    .line 33
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->D()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method static bridge synthetic s(Lcom/android/launcher3/taskbar/X2;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/X2;->q:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic t(Lcom/android/launcher3/taskbar/X2;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/X2;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic u(Lcom/android/launcher3/taskbar/X2;Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic v(Lcom/android/launcher3/taskbar/X2;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->j:Ljava/lang/Integer;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic w(Lcom/android/launcher3/taskbar/X2;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/X2;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic x(Lcom/android/launcher3/taskbar/X2;Lcom/android/launcher3/taskbar/X2$g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->p:Lcom/android/launcher3/taskbar/X2$g;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic y(Lcom/android/launcher3/taskbar/X2;FI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/X2;->k0(FI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic z(Lcom/android/launcher3/taskbar/X2;Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/X2;->m0(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B(JZ)Landroid/animation/Animator;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/X2;->i:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_4

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->j:Ljava/lang/Integer;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget v2, p0, Lcom/android/launcher3/taskbar/X2;->k:I

    .line 26
    .line 27
    if-eq v0, v2, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-object v1

    .line 31
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->j:Ljava/lang/Integer;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    const/4 v0, -0x1

    .line 36
    goto :goto_1

    .line 37
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget v1, p0, Lcom/android/launcher3/taskbar/X2;->k:I

    .line 42
    .line 43
    xor-int/2addr v0, v1

    .line 44
    :goto_1
    iget v1, p0, Lcom/android/launcher3/taskbar/X2;->k:I

    .line 45
    .line 46
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, p0, Lcom/android/launcher3/taskbar/X2;->j:Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/android/launcher3/taskbar/X2;->a0(IJZ)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_4
    :goto_2
    return-object v1
.end method

.method public C()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->P()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/X2;->D(J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public D(J)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/X2;->B(JZ)Landroid/animation/Animator;

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public E(Lcom/android/launcher3/V3;Lcom/android/quickstep/RecentsAnimationCallbacks;J)Landroid/animation/Animator;
    .locals 5

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/X2;->v:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 13
    .line 14
    invoke-virtual {p1, v2}, Lcom/android/launcher3/V3;->B(Lcom/android/launcher3/C2;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const-wide/16 v3, 0x10

    .line 19
    .line 20
    invoke-virtual {v1, v3, v4, v2}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 21
    .line 22
    .line 23
    const-wide/16 v2, 0x1

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-virtual {v1, v2, v3, v4}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 27
    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    const/4 v3, 0x1

    .line 31
    invoke-virtual {p0, v2, v3}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 35
    .line 36
    invoke-virtual {v1, p3, p4}, Lcom/android/launcher3/taskbar/a4;->L(J)Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p3, p4, v4}, Lcom/android/launcher3/taskbar/X2;->B(JZ)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->p:Lcom/android/launcher3/taskbar/X2$g;

    .line 51
    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    iget-object p3, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 55
    .line 56
    sget-object p4, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 57
    .line 58
    invoke-interface {p3, p4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 59
    .line 60
    .line 61
    move-result p3

    .line 62
    xor-int/2addr p3, v3

    .line 63
    invoke-static {p1, p3, v4}, Lcom/android/launcher3/taskbar/X2$g;->a(Lcom/android/launcher3/taskbar/X2$g;ZZ)V

    .line 64
    .line 65
    .line 66
    :cond_0
    new-instance p1, Lcom/android/launcher3/taskbar/X2$g;

    .line 67
    .line 68
    invoke-direct {p1, p0, p2}, Lcom/android/launcher3/taskbar/X2$g;-><init>(Lcom/android/launcher3/taskbar/X2;Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->p:Lcom/android/launcher3/taskbar/X2$g;

    .line 72
    .line 73
    invoke-virtual {p2, p1}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/o4;->k()Lcom/android/quickstep/views/RecentsView;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    if-eqz p1, :cond_1

    .line 85
    .line 86
    new-instance p2, Lcom/android/launcher3/taskbar/P2;

    .line 87
    .line 88
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/P2;-><init>(Lcom/android/launcher3/taskbar/X2;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, p2}, Lcom/android/quickstep/views/RecentsView;->setTaskLaunchListener(Lcom/android/quickstep/views/RecentsView$TaskLaunchListener;)V

    .line 92
    .line 93
    .line 94
    new-instance p2, Lcom/android/launcher3/taskbar/Q2;

    .line 95
    .line 96
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/Q2;-><init>(Lcom/android/launcher3/taskbar/X2;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, p2}, Lcom/android/quickstep/views/RecentsView;->setTaskLaunchCancelledRunnable(Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    :cond_1
    return-object v0
.end method

.method protected F(Ljava/lang/String;Ljava/io/PrintWriter;)V
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
    const-string v1, "TaskbarLauncherStateController:"

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
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 22
    .line 23
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 24
    .line 25
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "%s\tmIconAlignment=%.2f"

    .line 34
    .line 35
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->c:Lcom/android/launcher3/anim/d;

    .line 43
    .line 44
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "%s\tmTaskbarBackgroundAlpha=%.2f"

    .line 55
    .line 56
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->f:Lcom/android/launcher3/util/v1$c;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const-string v1, "%s\tmTaskbarAlphaForHome=%.2f"

    .line 78
    .line 79
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->j:Ljava/lang/Integer;

    .line 87
    .line 88
    if-nez v0, :cond_0

    .line 89
    .line 90
    const/4 v0, 0x0

    .line 91
    goto :goto_0

    .line 92
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    invoke-static {v0}, Lcom/android/launcher3/taskbar/X2;->H(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    :goto_0
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const-string v1, "%s\tmPrevState=%s"

    .line 105
    .line 106
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget v0, p0, Lcom/android/launcher3/taskbar/X2;->k:I

    .line 114
    .line 115
    invoke-static {v0}, Lcom/android/launcher3/taskbar/X2;->H(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    const-string v1, "%s\tmState=%s"

    .line 124
    .line 125
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 133
    .line 134
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    const-string v1, "%s\tmLauncherState=%s"

    .line 139
    .line 140
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/X2;->q:Z

    .line 148
    .line 149
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    const-string v1, "%s\tmIsAnimatingToLauncher=%b"

    .line 158
    .line 159
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/X2;->r:Z

    .line 167
    .line 168
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    const-string p1, "%s\tmShouldDelayLauncherStateAnim=%b"

    .line 177
    .line 178
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public G()Lcom/android/launcher3/V3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    return-object p0
.end method

.method public K(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/uioverrides/QuickstepLauncher;J)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/X2;->t:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->M0:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/X2;->u:Z

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/s2;->t()Lcom/android/launcher3/anim/d;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->c:Lcom/android/launcher3/anim/d;

    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/s2;->s()Lcom/android/launcher3/anim/d;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->d:Lcom/android/launcher3/anim/d;

    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/R1;->i()Lcom/android/launcher3/anim/d;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->e:Lcom/android/launcher3/anim/d;

    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/W4;->S()Lcom/android/launcher3/util/v1;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->f:Lcom/android/launcher3/util/v1$c;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->d0()V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_0

    .line 70
    .line 71
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object v1, p0, Lcom/android/launcher3/taskbar/X2;->x:Lcom/android/launcher3/statemanager/d$g;

    .line 78
    .line 79
    invoke-virtual {p1, v1}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    .line 80
    .line 81
    .line 82
    new-instance p1, Lcom/android/launcher3/taskbar/V2;

    .line 83
    .line 84
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/V2;-><init>(Lcom/android/launcher3/taskbar/X2;)V

    .line 85
    .line 86
    .line 87
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/X2;->e0(Ljava/util/function/Consumer;)V

    .line 88
    .line 89
    .line 90
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Lcom/android/launcher3/V3;

    .line 99
    .line 100
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 101
    .line 102
    invoke-direct {p0, p3, p4, v0}, Lcom/android/launcher3/taskbar/X2;->p0(JZ)V

    .line 103
    .line 104
    .line 105
    const-wide/16 p1, 0x0

    .line 106
    .line 107
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/X2;->D(J)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    xor-int/lit8 p1, p1, 0x1

    .line 119
    .line 120
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/X2;->t:Z

    .line 121
    .line 122
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 123
    .line 124
    iget-object p2, p0, Lcom/android/launcher3/taskbar/X2;->w:Lcom/android/launcher3/X3$b;

    .line 125
    .line 126
    invoke-interface {p1, p2}, Lcom/android/quickstep/views/RecentsViewContainer;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 130
    .line 131
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/X2;->m0(Lcom/android/launcher3/V3;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public L()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/X2;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public M()Z
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/X2;->O()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Lcom/android/launcher3/V3;->B(Lcom/android/launcher3/C2;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v2, 0x1

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->K0()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    move v0, v2

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move v0, v1

    .line 32
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->Q()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    return v2

    .line 41
    :cond_1
    return v1
.end method

.method public N()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->F1()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method P()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/launcher3/V3;->c:Z

    .line 4
    .line 5
    return p0
.end method

.method public Q()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->q2()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->r2()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/X2;->O()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    return v1

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->l:Lcom/android/launcher3/V3;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/android/launcher3/V3;->A(Lcom/android/launcher3/C2;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public X(LN2/h;Z)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->s:LN2/h;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/X2;->j0(FZ)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2;->s:LN2/h;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/android/launcher3/h0;->Y0(Landroid/content/Context;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {p1, v1}, LN2/h;->e(Z)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iget-object v1, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 45
    .line 46
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/h0;->u0(Landroid/content/Context;Z)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    int-to-float p1, p1

    .line 51
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/X2;->j0(FZ)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public Y()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/X2;->i:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/X2;->t:Z

    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/launcher3/taskbar/X2;->v:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    iget-object v3, p0, Lcom/android/launcher3/taskbar/X2;->p:Lcom/android/launcher3/taskbar/X2$g;

    .line 12
    .line 13
    invoke-virtual {v2, v3}, Lcom/android/quickstep/RecentsAnimationCallbacks;->removeListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    iput-object v2, p0, Lcom/android/launcher3/taskbar/X2;->v:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 18
    .line 19
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/android/launcher3/anim/d;->i()V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const/high16 v3, 0x3f800000    # 1.0f

    .line 31
    .line 32
    invoke-virtual {v2, v3, v1}, Lcom/android/launcher3/Hotseat;->o1(FI)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, p0, Lcom/android/launcher3/taskbar/X2;->x:Lcom/android/launcher3/statemanager/d$g;

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Lcom/android/launcher3/statemanager/d;->b0(Lcom/android/launcher3/statemanager/d$g;)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Lcom/android/launcher3/taskbar/W2;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/W2;-><init>(Lcom/android/launcher3/taskbar/X2;)V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/X2;->e0(Ljava/util/function/Consumer;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/android/launcher3/taskbar/X2;->b:Lcom/android/launcher3/taskbar/R1;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    xor-int/2addr v0, v1

    .line 63
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/X2;->t:Z

    .line 64
    .line 65
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2;->w:Lcom/android/launcher3/X3$b;

    .line 68
    .line 69
    invoke-interface {v0, p0}, Lcom/android/quickstep/views/RecentsViewContainer;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public b0(Lcom/android/launcher3/V3;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/v;->hasBeenResumed()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1, p1}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->C()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method protected d0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2;->a:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/anim/d;->i()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/X2;->Z()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f0(Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/X2;->r:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->C()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/X2;->r:Z

    .line 11
    .line 12
    return-void
.end method

.method public g0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/X2;->m:Z

    .line 3
    .line 4
    return-void
.end method

.method public n0(IZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget p2, p0, Lcom/android/launcher3/taskbar/X2;->k:I

    .line 4
    .line 5
    or-int/2addr p1, p2

    .line 6
    iput p1, p0, Lcom/android/launcher3/taskbar/X2;->k:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget p2, p0, Lcom/android/launcher3/taskbar/X2;->k:I

    .line 10
    .line 11
    not-int p1, p1

    .line 12
    and-int/2addr p1, p2

    .line 13
    iput p1, p0, Lcom/android/launcher3/taskbar/X2;->k:I

    .line 14
    .line 15
    return-void
.end method

.method public o0(J)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/X2;->p0(JZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
