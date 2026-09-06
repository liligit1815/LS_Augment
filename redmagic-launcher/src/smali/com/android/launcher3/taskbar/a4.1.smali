.class public Lcom/android/launcher3/taskbar/a4;
.super Ljava/lang/Object;
.source "TaskbarStashController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/a4$e;
    }
.end annotation


# static fields
.field public static J:Z = true


# instance fields
.field private A:Z

.field private B:Landroid/animation/Animator;

.field private final C:J

.field private D:Z

.field private final E:Z

.field private final F:Ljava/util/function/LongPredicate;

.field private final G:Lcom/android/launcher3/taskbar/a4$e;

.field private H:Z

.field private I:Lcom/android/launcher3/taskbar/J3;

.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private final h:I

.field private final i:I

.field private final j:Lcom/android/quickstep/SystemUiProxy;

.field private k:Lcom/android/launcher3/taskbar/R1;

.field private l:Lcom/android/launcher3/anim/d;

.field private m:Lcom/android/launcher3/anim/d;

.field private n:Lcom/android/launcher3/util/v1$c;

.field private o:Lcom/android/launcher3/util/v1$c;

.field private p:Lcom/android/launcher3/anim/d;

.field private q:Lcom/android/launcher3/anim/d;

.field private r:Lcom/android/launcher3/util/v1$c;

.field private s:Lcom/android/launcher3/anim/d;

.field private final t:Landroid/view/accessibility/AccessibilityManager;

.field private u:Z

.field private v:J

.field private w:Landroid/animation/AnimatorSet;

.field private x:Z

.field private y:Z

.field private final z:Lcom/android/launcher3/c;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/a4;->u:Z

    .line 6
    .line 7
    new-instance v1, Lcom/android/launcher3/c;

    .line 8
    .line 9
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2}, Lcom/android/launcher3/c;-><init>(Landroid/os/Looper;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/android/launcher3/taskbar/a4;->z:Lcom/android/launcher3/c;

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/a4;->A:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/a4;->D:Z

    .line 21
    .line 22
    new-instance v1, Lcom/android/launcher3/taskbar/N3;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/N3;-><init>(Lcom/android/launcher3/taskbar/a4;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/android/launcher3/taskbar/a4;->F:Ljava/util/function/LongPredicate;

    .line 28
    .line 29
    new-instance v2, Lcom/android/launcher3/taskbar/a4$e;

    .line 30
    .line 31
    invoke-direct {v2, p0, v1}, Lcom/android/launcher3/taskbar/a4$e;-><init>(Lcom/android/launcher3/taskbar/a4;Ljava/util/function/LongPredicate;)V

    .line 32
    .line 33
    .line 34
    iput-object v2, p0, Lcom/android/launcher3/taskbar/a4;->G:Lcom/android/launcher3/taskbar/a4$e;

    .line 35
    .line 36
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/a4;->H:Z

    .line 37
    .line 38
    iput-object p1, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 39
    .line 40
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 41
    .line 42
    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/android/quickstep/SystemUiProxy;

    .line 47
    .line 48
    iput-object v1, p0, Lcom/android/launcher3/taskbar/a4;->j:Lcom/android/quickstep/SystemUiProxy;

    .line 49
    .line 50
    const-class v1, Landroid/view/accessibility/AccessibilityManager;

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Landroid/view/ContextThemeWrapper;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Landroid/view/accessibility/AccessibilityManager;

    .line 57
    .line 58
    iput-object v1, p0, Lcom/android/launcher3/taskbar/a4;->t:Landroid/view/accessibility/AccessibilityManager;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->q2()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_0

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->r2()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_0

    .line 71
    .line 72
    const/4 v0, 0x1

    .line 73
    :cond_0
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/a4;->E:Z

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const v1, 0x7f0c00f8

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    int-to-long v0, v0

    .line 87
    iput-wide v0, p0, Lcom/android/launcher3/taskbar/a4;->C:J

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_1

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const v1, 0x7f070ba8

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iput v0, p0, Lcom/android/launcher3/taskbar/a4;->i:I

    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    const v0, 0x7f070bb6

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    iput p1, p0, Lcom/android/launcher3/taskbar/a4;->h:I

    .line 120
    .line 121
    return-void

    .line 122
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget v0, v0, Lcom/android/launcher3/h0;->r3:I

    .line 127
    .line 128
    iput v0, p0, Lcom/android/launcher3/taskbar/a4;->i:I

    .line 129
    .line 130
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iget p1, p1, Lcom/android/launcher3/h0;->s3:I

    .line 135
    .line 136
    iput p1, p0, Lcom/android/launcher3/taskbar/a4;->h:I

    .line 137
    .line 138
    return-void
.end method

.method static bridge synthetic A(Lcom/android/launcher3/taskbar/a4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->M0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private A0(Lcom/android/launcher3/c;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/K1;->e()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->Q0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private B(Landroid/animation/AnimatorSet;ZLjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    if-eqz p2, :cond_1

    .line 17
    .line 18
    const/16 p2, 0x3c

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/16 p2, 0x3d

    .line 22
    .line 23
    :goto_0
    new-instance v1, Lcom/android/launcher3/taskbar/a4$d;

    .line 24
    .line 25
    invoke-direct {v1, p0, p2, v0, p3}, Lcom/android/launcher3/taskbar/a4$d;-><init>(Lcom/android/launcher3/taskbar/a4;ILandroid/view/View;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private static B0(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JJLandroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1, p4, p5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p2, p3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p6}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private E0()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->I0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x8

    .line 6
    .line 7
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-eq v3, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1, v2, v0}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 14
    .line 15
    .line 16
    const-wide/16 v0, 0x50

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->V()J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/launcher3/taskbar/a4;->F(JJ)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 29
    .line 30
    invoke-virtual {v0}, La2/e;->j()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    int-to-long v0, v0

    .line 35
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->E(J)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private G(JLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/a4;->L(J)Landroid/animation/Animator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    invoke-static {p3}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    if-eqz p3, :cond_2

    .line 21
    .line 22
    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    .line 23
    .line 24
    .line 25
    :cond_2
    return-void
.end method

.method private I0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    return v1

    .line 38
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 39
    .line 40
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->isHardwareKeyboard()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->d1()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->T0()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_2

    .line 61
    .line 62
    return v1

    .line 63
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 64
    .line 65
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->isHardwareKeyboard()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 82
    .line 83
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 84
    .line 85
    invoke-virtual {v2}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    invoke-virtual {v0, v2}, Lcom/android/launcher3/taskbar/S1;->d(I)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    return v1

    .line 96
    :cond_3
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/a4;->x:Z

    .line 97
    .line 98
    if-eqz v0, :cond_4

    .line 99
    .line 100
    return v1

    .line 101
    :cond_4
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/a4;->y:Z

    .line 102
    .line 103
    return p0
.end method

.method private J(Landroid/animation/AnimatorSet;ZJFI)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move-wide/from16 v2, p3

    .line 6
    .line 7
    move/from16 v4, p6

    .line 8
    .line 9
    const/4 v5, 0x3

    .line 10
    new-instance v8, Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    invoke-direct {v8}, Landroid/animation/AnimatorSet;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v9, Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    invoke-direct {v9}, Landroid/animation/AnimatorSet;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v10, Landroid/animation/AnimatorSet;

    .line 21
    .line 22
    invoke-direct {v10}, Landroid/animation/AnimatorSet;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v11, 0x2

    .line 26
    const/high16 v13, 0x3f000000    # 0.5f

    .line 27
    .line 28
    const/4 v14, 0x0

    .line 29
    const/high16 v15, 0x3f800000    # 1.0f

    .line 30
    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    const/16 v16, 0x1

    .line 34
    .line 35
    iget-object v6, v0, Lcom/android/launcher3/taskbar/a4;->q:Lcom/android/launcher3/anim/d;

    .line 36
    .line 37
    move/from16 v7, p5

    .line 38
    .line 39
    const/16 v17, 0x0

    .line 40
    .line 41
    invoke-virtual {v6, v7}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    invoke-virtual {v8, v6}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 46
    .line 47
    .line 48
    iget-object v6, v0, Lcom/android/launcher3/taskbar/a4;->l:Lcom/android/launcher3/anim/d;

    .line 49
    .line 50
    invoke-virtual {v6, v15}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    invoke-virtual {v8, v6}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 55
    .line 56
    .line 57
    iget-object v6, v0, Lcom/android/launcher3/taskbar/a4;->o:Lcom/android/launcher3/util/v1$c;

    .line 58
    .line 59
    invoke-virtual {v6, v14}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    iget-object v7, v0, Lcom/android/launcher3/taskbar/a4;->p:Lcom/android/launcher3/anim/d;

    .line 64
    .line 65
    iget-object v12, v0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 66
    .line 67
    invoke-virtual {v12}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 68
    .line 69
    .line 70
    move-result v12

    .line 71
    if-eqz v12, :cond_0

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    move v14, v13

    .line 75
    :goto_0
    invoke-virtual {v7, v14}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    new-array v12, v11, [Landroid/animation/Animator;

    .line 80
    .line 81
    aput-object v6, v12, v17

    .line 82
    .line 83
    aput-object v7, v12, v16

    .line 84
    .line 85
    invoke-virtual {v9, v12}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 86
    .line 87
    .line 88
    iget-object v6, v0, Lcom/android/launcher3/taskbar/a4;->r:Lcom/android/launcher3/util/v1$c;

    .line 89
    .line 90
    invoke-virtual {v6, v15}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    filled-new-array {v6}, [Landroid/animation/Animator;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    invoke-virtual {v10, v6}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 99
    .line 100
    .line 101
    if-ne v4, v11, :cond_1

    .line 102
    .line 103
    sget-object v4, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 104
    .line 105
    invoke-virtual {v8, v4}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v9, v4}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 109
    .line 110
    .line 111
    :cond_1
    const/high16 v12, 0x3f400000    # 0.75f

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_2
    const/16 v16, 0x1

    .line 115
    .line 116
    const/16 v17, 0x0

    .line 117
    .line 118
    iget-object v6, v0, Lcom/android/launcher3/taskbar/a4;->p:Lcom/android/launcher3/anim/d;

    .line 119
    .line 120
    invoke-virtual {v6, v15}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    iget-object v7, v0, Lcom/android/launcher3/taskbar/a4;->q:Lcom/android/launcher3/anim/d;

    .line 125
    .line 126
    invoke-virtual {v7, v14}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 127
    .line 128
    .line 129
    move-result-object v7

    .line 130
    new-array v12, v11, [Landroid/animation/Animator;

    .line 131
    .line 132
    aput-object v6, v12, v17

    .line 133
    .line 134
    aput-object v7, v12, v16

    .line 135
    .line 136
    invoke-virtual {v8, v12}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 137
    .line 138
    .line 139
    if-eq v4, v5, :cond_3

    .line 140
    .line 141
    iget-object v6, v0, Lcom/android/launcher3/taskbar/a4;->l:Lcom/android/launcher3/anim/d;

    .line 142
    .line 143
    invoke-virtual {v6, v14}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 144
    .line 145
    .line 146
    move-result-object v6

    .line 147
    invoke-virtual {v8, v6}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_3
    new-instance v6, Lcom/android/launcher3/taskbar/Z3;

    .line 152
    .line 153
    invoke-direct {v6, v0}, Lcom/android/launcher3/taskbar/Z3;-><init>(Lcom/android/launcher3/taskbar/a4;)V

    .line 154
    .line 155
    .line 156
    invoke-static {v6}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 157
    .line 158
    .line 159
    move-result-object v6

    .line 160
    invoke-virtual {v8, v6}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 161
    .line 162
    .line 163
    :goto_1
    iget-object v6, v0, Lcom/android/launcher3/taskbar/a4;->r:Lcom/android/launcher3/util/v1$c;

    .line 164
    .line 165
    invoke-virtual {v6, v14}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 166
    .line 167
    .line 168
    move-result-object v6

    .line 169
    filled-new-array {v6}, [Landroid/animation/Animator;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    invoke-virtual {v9, v6}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 174
    .line 175
    .line 176
    iget-object v6, v0, Lcom/android/launcher3/taskbar/a4;->o:Lcom/android/launcher3/util/v1$c;

    .line 177
    .line 178
    invoke-virtual {v6, v15}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 179
    .line 180
    .line 181
    move-result-object v6

    .line 182
    filled-new-array {v6}, [Landroid/animation/Animator;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    invoke-virtual {v10, v6}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 187
    .line 188
    .line 189
    if-ne v4, v11, :cond_4

    .line 190
    .line 191
    sget-object v4, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 192
    .line 193
    invoke-virtual {v8, v4}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v10, v4}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 197
    .line 198
    .line 199
    :cond_4
    move v12, v13

    .line 200
    const/high16 v13, 0x3f400000    # 0.75f

    .line 201
    .line 202
    :goto_2
    iget-object v4, v0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 203
    .line 204
    iget-object v4, v4, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 205
    .line 206
    invoke-virtual {v4, v1}, Lcom/android/launcher3/taskbar/U0;->k(Z)Landroid/animation/Animator;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-virtual {v8, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 211
    .line 212
    .line 213
    iget-object v0, v0, Lcom/android/launcher3/taskbar/a4;->s:Lcom/android/launcher3/anim/d;

    .line 214
    .line 215
    invoke-virtual {v0, v15}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-virtual {v8, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v8, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 223
    .line 224
    .line 225
    long-to-float v0, v2

    .line 226
    mul-float/2addr v12, v0

    .line 227
    float-to-long v1, v12

    .line 228
    invoke-virtual {v9, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 229
    .line 230
    .line 231
    mul-float v1, v0, v13

    .line 232
    .line 233
    float-to-long v1, v1

    .line 234
    invoke-virtual {v10, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 235
    .line 236
    .line 237
    sub-float/2addr v15, v13

    .line 238
    mul-float/2addr v0, v15

    .line 239
    float-to-long v0, v0

    .line 240
    invoke-virtual {v10, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 241
    .line 242
    .line 243
    new-array v0, v5, [Landroid/animation/Animator;

    .line 244
    .line 245
    aput-object v8, v0, v17

    .line 246
    .line 247
    aput-object v9, v0, v16

    .line 248
    .line 249
    aput-object v10, v0, v11

    .line 250
    .line 251
    move-object/from16 v1, p1

    .line 252
    .line 253
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 254
    .line 255
    .line 256
    return-void
.end method

.method private K(ZJIZLjava/lang/String;)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x3

    .line 4
    if-ne p4, v2, :cond_0

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const-string v2, "TaskbarStashController"

    .line 9
    .line 10
    const-string v3, "Illegal arguments:Using TRANSITION_UNSTASH_SUW_MANUAL to stash taskbar"

    .line 11
    .line 12
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->cancel()V

    .line 20
    .line 21
    .line 22
    :cond_1
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 23
    .line 24
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v2, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 28
    .line 29
    xor-int/lit8 v3, p1, 0x1

    .line 30
    .line 31
    move-object/from16 v4, p6

    .line 32
    .line 33
    invoke-direct {p0, v2, v3, v4}, Lcom/android/launcher3/taskbar/a4;->B(Landroid/animation/AnimatorSet;ZLjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    const/4 v3, 0x0

    .line 43
    if-nez v2, :cond_3

    .line 44
    .line 45
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget v2, p0, Lcom/android/launcher3/taskbar/a4;->i:I

    .line 55
    .line 56
    iget v4, p0, Lcom/android/launcher3/taskbar/a4;->h:I

    .line 57
    .line 58
    sub-int/2addr v2, v4

    .line 59
    int-to-float v2, v2

    .line 60
    move v8, v2

    .line 61
    goto :goto_1

    .line 62
    :cond_3
    :goto_0
    move v8, v3

    .line 63
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->K0()Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-nez v2, :cond_8

    .line 68
    .line 69
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 70
    .line 71
    iget-object v4, p0, Lcom/android/launcher3/taskbar/a4;->o:Lcom/android/launcher3/util/v1$c;

    .line 72
    .line 73
    const/high16 v5, 0x3f800000    # 1.0f

    .line 74
    .line 75
    if-eqz p1, :cond_4

    .line 76
    .line 77
    move v6, v3

    .line 78
    goto :goto_2

    .line 79
    :cond_4
    move v6, v5

    .line 80
    :goto_2
    invoke-virtual {v4, v6}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v4, p2, p3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v2, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 92
    .line 93
    iget-object v4, p0, Lcom/android/launcher3/taskbar/a4;->l:Lcom/android/launcher3/anim/d;

    .line 94
    .line 95
    if-eqz p1, :cond_5

    .line 96
    .line 97
    move v6, v5

    .line 98
    goto :goto_3

    .line 99
    :cond_5
    move v6, v3

    .line 100
    :goto_3
    invoke-virtual {v4, v6}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-virtual {v4, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    new-array v6, v1, [Landroid/animation/Animator;

    .line 109
    .line 110
    aput-object v4, v6, v0

    .line 111
    .line 112
    invoke-virtual {v2, v6}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 113
    .line 114
    .line 115
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 116
    .line 117
    iget-object v4, p0, Lcom/android/launcher3/taskbar/a4;->q:Lcom/android/launcher3/anim/d;

    .line 118
    .line 119
    if-eqz p1, :cond_6

    .line 120
    .line 121
    goto :goto_4

    .line 122
    :cond_6
    move v8, v3

    .line 123
    :goto_4
    invoke-virtual {v4, v8}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    invoke-virtual {v4, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    new-array v1, v1, [Landroid/animation/Animator;

    .line 132
    .line 133
    aput-object v4, v1, v0

    .line 134
    .line 135
    invoke-virtual {v2, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 139
    .line 140
    iget-object v1, p0, Lcom/android/launcher3/taskbar/a4;->m:Lcom/android/launcher3/anim/d;

    .line 141
    .line 142
    const-wide/16 v6, 0x8

    .line 143
    .line 144
    invoke-direct {p0, v6, v7}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-eqz v2, :cond_7

    .line 149
    .line 150
    if-eqz p1, :cond_7

    .line 151
    .line 152
    goto :goto_5

    .line 153
    :cond_7
    move v3, v5

    .line 154
    :goto_5
    invoke-virtual {v1, v3}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-virtual {v1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    invoke-virtual {v0, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 163
    .line 164
    .line 165
    iget-object p2, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 166
    .line 167
    new-instance p3, Lcom/android/launcher3/taskbar/U3;

    .line 168
    .line 169
    invoke-direct {p3, p0, p1}, Lcom/android/launcher3/taskbar/U3;-><init>(Lcom/android/launcher3/taskbar/a4;Z)V

    .line 170
    .line 171
    .line 172
    invoke-static {p3}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p2, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_8
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 181
    .line 182
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-eqz v0, :cond_9

    .line 187
    .line 188
    iget-object v4, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 189
    .line 190
    move-object v3, p0

    .line 191
    move v5, p1

    .line 192
    move-wide v6, p2

    .line 193
    move v9, p4

    .line 194
    move v8, p5

    .line 195
    invoke-direct/range {v3 .. v9}, Lcom/android/launcher3/taskbar/a4;->M(Landroid/animation/AnimatorSet;ZJZI)V

    .line 196
    .line 197
    .line 198
    goto :goto_6

    .line 199
    :cond_9
    iget-object v4, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 200
    .line 201
    move-object v3, p0

    .line 202
    move v5, p1

    .line 203
    move-wide v6, p2

    .line 204
    move v9, p4

    .line 205
    invoke-direct/range {v3 .. v9}, Lcom/android/launcher3/taskbar/a4;->J(Landroid/animation/AnimatorSet;ZJFI)V

    .line 206
    .line 207
    .line 208
    :goto_6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 209
    .line 210
    new-instance v1, Lcom/android/launcher3/taskbar/a4$a;

    .line 211
    .line 212
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/a4$a;-><init>(Lcom/android/launcher3/taskbar/a4;ZJ)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 216
    .line 217
    .line 218
    return-void
.end method

.method private M(Landroid/animation/AnimatorSet;ZJZI)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v8, p3

    .line 4
    .line 5
    move/from16 v10, p6

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/high16 v11, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    move v12, v11

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v12, v1

    .line 15
    :goto_0
    if-eqz p2, :cond_1

    .line 16
    .line 17
    move v13, v1

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    move v13, v11

    .line 20
    :goto_1
    if-eqz p2, :cond_2

    .line 21
    .line 22
    move v2, v11

    .line 23
    goto :goto_2

    .line 24
    :cond_2
    move v2, v1

    .line 25
    :goto_2
    if-eqz p2, :cond_3

    .line 26
    .line 27
    move v14, v1

    .line 28
    goto :goto_3

    .line 29
    :cond_3
    move v14, v11

    .line 30
    :goto_3
    const-wide/16 v3, 0x0

    .line 31
    .line 32
    cmp-long v1, v8, v3

    .line 33
    .line 34
    const/4 v15, 0x1

    .line 35
    const/4 v5, 0x2

    .line 36
    if-lez v1, :cond_7

    .line 37
    .line 38
    if-ne v10, v5, :cond_4

    .line 39
    .line 40
    move-wide/from16 v18, v3

    .line 41
    .line 42
    move-wide/from16 v20, v8

    .line 43
    .line 44
    const-wide/16 v5, 0x32

    .line 45
    .line 46
    goto :goto_5

    .line 47
    :cond_4
    const-wide/16 v16, 0x21

    .line 48
    .line 49
    if-eqz p2, :cond_6

    .line 50
    .line 51
    if-ne v10, v15, :cond_5

    .line 52
    .line 53
    const-wide/16 v16, 0x42

    .line 54
    .line 55
    :cond_5
    sub-long v5, v8, v16

    .line 56
    .line 57
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    .line 58
    .line 59
    .line 60
    move-result-wide v3

    .line 61
    move-wide v5, v3

    .line 62
    move-wide/from16 v3, v16

    .line 63
    .line 64
    move-wide/from16 v18, v3

    .line 65
    .line 66
    :goto_4
    const-wide/16 v20, 0x32

    .line 67
    .line 68
    goto :goto_5

    .line 69
    :cond_6
    move-wide/from16 v18, v16

    .line 70
    .line 71
    const-wide/16 v5, 0x32

    .line 72
    .line 73
    goto :goto_4

    .line 74
    :cond_7
    move-wide v5, v3

    .line 75
    move-wide/from16 v18, v5

    .line 76
    .line 77
    move-wide/from16 v20, v18

    .line 78
    .line 79
    :goto_5
    iget-object v7, v0, Lcom/android/launcher3/taskbar/a4;->r:Lcom/android/launcher3/util/v1$c;

    .line 80
    .line 81
    invoke-virtual {v7, v2}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    sget-object v7, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 86
    .line 87
    move-object/from16 v1, p1

    .line 88
    .line 89
    const/4 v15, 0x2

    .line 90
    invoke-static/range {v1 .. v7}, Lcom/android/launcher3/taskbar/a4;->B0(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JJLandroid/view/animation/Interpolator;)V

    .line 91
    .line 92
    .line 93
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_8

    .line 98
    .line 99
    if-nez p2, :cond_8

    .line 100
    .line 101
    if-eqz p5, :cond_8

    .line 102
    .line 103
    invoke-direct {v0, v8, v9}, Lcom/android/launcher3/taskbar/a4;->U(J)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    const-wide/16 v3, 0x0

    .line 108
    .line 109
    const-wide/16 v5, 0x0

    .line 110
    .line 111
    move-object/from16 v1, p1

    .line 112
    .line 113
    invoke-static/range {v1 .. v7}, Lcom/android/launcher3/taskbar/a4;->B0(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JJLandroid/view/animation/Interpolator;)V

    .line 114
    .line 115
    .line 116
    new-instance v2, Lcom/android/launcher3/taskbar/O3;

    .line 117
    .line 118
    invoke-direct {v2, v0, v14}, Lcom/android/launcher3/taskbar/O3;-><init>(Lcom/android/launcher3/taskbar/a4;F)V

    .line 119
    .line 120
    .line 121
    invoke-static {v2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 126
    .line 127
    .line 128
    :goto_6
    move-object/from16 v22, v7

    .line 129
    .line 130
    goto :goto_7

    .line 131
    :cond_8
    move-object/from16 v1, p1

    .line 132
    .line 133
    iget-object v2, v0, Lcom/android/launcher3/taskbar/a4;->n:Lcom/android/launcher3/util/v1$c;

    .line 134
    .line 135
    invoke-virtual {v2, v14}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-static/range {v1 .. v7}, Lcom/android/launcher3/taskbar/a4;->B0(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JJLandroid/view/animation/Interpolator;)V

    .line 140
    .line 141
    .line 142
    goto :goto_6

    .line 143
    :goto_7
    if-ne v10, v15, :cond_a

    .line 144
    .line 145
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 146
    .line 147
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 151
    .line 152
    .line 153
    if-eqz p2, :cond_9

    .line 154
    .line 155
    sget-object v1, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 156
    .line 157
    goto :goto_8

    .line 158
    :cond_9
    sget-object v1, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 159
    .line 160
    :goto_8
    invoke-virtual {v2, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 161
    .line 162
    .line 163
    move-object v1, v2

    .line 164
    :cond_a
    const/4 v14, 0x3

    .line 165
    if-eq v10, v14, :cond_b

    .line 166
    .line 167
    iget-object v2, v0, Lcom/android/launcher3/taskbar/a4;->l:Lcom/android/launcher3/anim/d;

    .line 168
    .line 169
    invoke-virtual {v2, v12}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    const-wide/16 v3, 0x0

    .line 174
    .line 175
    sget-object v7, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 176
    .line 177
    move-wide v5, v8

    .line 178
    invoke-static/range {v1 .. v7}, Lcom/android/launcher3/taskbar/a4;->B0(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JJLandroid/view/animation/Interpolator;)V

    .line 179
    .line 180
    .line 181
    goto :goto_9

    .line 182
    :cond_b
    new-instance v2, Lcom/android/launcher3/taskbar/P3;

    .line 183
    .line 184
    invoke-direct {v2, v0, v12}, Lcom/android/launcher3/taskbar/P3;-><init>(Lcom/android/launcher3/taskbar/a4;F)V

    .line 185
    .line 186
    .line 187
    invoke-static {v2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 192
    .line 193
    .line 194
    :goto_9
    iget-object v2, v0, Lcom/android/launcher3/taskbar/a4;->o:Lcom/android/launcher3/util/v1$c;

    .line 195
    .line 196
    invoke-virtual {v2, v13}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 197
    .line 198
    .line 199
    move-result-object v17

    .line 200
    move-object/from16 v16, v1

    .line 201
    .line 202
    invoke-static/range {v16 .. v22}, Lcom/android/launcher3/taskbar/a4;->B0(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JJLandroid/view/animation/Interpolator;)V

    .line 203
    .line 204
    .line 205
    move-object/from16 v7, v22

    .line 206
    .line 207
    if-eqz p2, :cond_c

    .line 208
    .line 209
    iget-object v2, v0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 210
    .line 211
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->u:Lcom/android/launcher3/taskbar/M3;

    .line 212
    .line 213
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/M3;->d()Landroid/animation/ValueAnimator;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    const-wide/16 v3, 0x0

    .line 218
    .line 219
    move-wide/from16 v5, p3

    .line 220
    .line 221
    invoke-static/range {v1 .. v7}, Lcom/android/launcher3/taskbar/a4;->B0(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JJLandroid/view/animation/Interpolator;)V

    .line 222
    .line 223
    .line 224
    goto :goto_a

    .line 225
    :cond_c
    iget-object v2, v0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 226
    .line 227
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->u:Lcom/android/launcher3/taskbar/M3;

    .line 228
    .line 229
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/M3;->c()Landroid/animation/ObjectAnimator;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    const-wide/16 v3, 0x0

    .line 234
    .line 235
    move-wide/from16 v5, p3

    .line 236
    .line 237
    invoke-static/range {v1 .. v7}, Lcom/android/launcher3/taskbar/a4;->B0(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JJLandroid/view/animation/Interpolator;)V

    .line 238
    .line 239
    .line 240
    :goto_a
    iget-object v2, v0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 241
    .line 242
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 243
    .line 244
    sget-object v6, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 245
    .line 246
    if-ne v10, v14, :cond_d

    .line 247
    .line 248
    const/4 v7, 0x1

    .line 249
    :goto_b
    move-object v3, v2

    .line 250
    move-object v2, v1

    .line 251
    move-object v1, v3

    .line 252
    move/from16 v3, p2

    .line 253
    .line 254
    move-wide/from16 v4, p3

    .line 255
    .line 256
    goto :goto_c

    .line 257
    :cond_d
    const/4 v15, 0x0

    .line 258
    move v7, v15

    .line 259
    goto :goto_b

    .line 260
    :goto_c
    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher3/taskbar/W4;->v(Landroid/animation/AnimatorSet;ZJLandroid/view/animation/Interpolator;Z)V

    .line 261
    .line 262
    .line 263
    move-object v1, v2

    .line 264
    move v8, v3

    .line 265
    iget-object v2, v0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 266
    .line 267
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 268
    .line 269
    invoke-virtual {v2, v8}, Lcom/android/launcher3/taskbar/U0;->k(Z)Landroid/animation/Animator;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    const-wide/16 v3, 0x0

    .line 274
    .line 275
    move-object v7, v6

    .line 276
    move-wide/from16 v5, p3

    .line 277
    .line 278
    invoke-static/range {v1 .. v7}, Lcom/android/launcher3/taskbar/a4;->B0(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JJLandroid/view/animation/Interpolator;)V

    .line 279
    .line 280
    .line 281
    iget-object v0, v0, Lcom/android/launcher3/taskbar/a4;->s:Lcom/android/launcher3/anim/d;

    .line 282
    .line 283
    invoke-virtual {v0, v11}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    if-eqz v8, :cond_e

    .line 288
    .line 289
    const-wide/16 v2, 0x2

    .line 290
    .line 291
    div-long v2, p3, v2

    .line 292
    .line 293
    goto :goto_d

    .line 294
    :cond_e
    move-wide/from16 v2, p3

    .line 295
    .line 296
    :goto_d
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 301
    .line 302
    .line 303
    return-void
.end method

.method private M0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/a4;->u:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/a4;->A:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->I()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->z:Lcom/android/launcher3/c;

    .line 22
    .line 23
    new-instance v1, Lcom/android/launcher3/taskbar/R3;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/R3;-><init>(Lcom/android/launcher3/taskbar/a4;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->z:Lcom/android/launcher3/c;

    .line 32
    .line 33
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->T()J

    .line 34
    .line 35
    .line 36
    move-result-wide v1

    .line 37
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/c;->d(J)V

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    return-void
.end method

.method private Q0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->D0()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    move v0, v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 v0, 0x0

    .line 33
    :goto_0
    xor-int/2addr v0, v1

    .line 34
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/taskbar/a4;->O0(ZZ)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private static R(J)Ljava/lang/String;
    .locals 6

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
    const-wide/16 v3, 0x41

    .line 9
    .line 10
    const-string v5, "FLAG_IN_APP"

    .line 11
    .line 12
    move-wide v1, p0

    .line 13
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/util/n0;->b(Ljava/util/StringJoiner;JJLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-wide/16 v3, 0x2

    .line 17
    .line 18
    const-string v5, "FLAG_STASHED_IN_APP_SYSUI"

    .line 19
    .line 20
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/util/n0;->b(Ljava/util/StringJoiner;JJLjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-wide/16 v3, 0x4

    .line 24
    .line 25
    const-string v5, "FLAG_STASHED_IN_APP_SETUP"

    .line 26
    .line 27
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/util/n0;->b(Ljava/util/StringJoiner;JJLjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 v3, 0x8

    .line 31
    .line 32
    const-string v5, "FLAG_STASHED_IN_APP_IME"

    .line 33
    .line 34
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/util/n0;->b(Ljava/util/StringJoiner;JJLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-wide/16 v3, 0x10

    .line 38
    .line 39
    const-string v5, "FLAG_IN_STASHED_LAUNCHER_STATE"

    .line 40
    .line 41
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/util/n0;->b(Ljava/util/StringJoiner;JJLjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-wide/16 v3, 0x20

    .line 45
    .line 46
    const-string v5, "FLAG_STASHED_IN_TASKBAR_ALL_APPS"

    .line 47
    .line 48
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/util/n0;->b(Ljava/util/StringJoiner;JJLjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const-wide/16 v3, 0x40

    .line 52
    .line 53
    const-string v5, "FLAG_IN_SETUP"

    .line 54
    .line 55
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/util/n0;->b(Ljava/util/StringJoiner;JJLjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const-wide/16 v3, 0x100

    .line 59
    .line 60
    const-string v5, "FLAG_STASHED_IN_APP_AUTO"

    .line 61
    .line 62
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/util/n0;->b(Ljava/util/StringJoiner;JJLjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const-wide/16 v3, 0x200

    .line 66
    .line 67
    const-string v5, "FLAG_STASHED_SYSUI"

    .line 68
    .line 69
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/util/n0;->b(Ljava/util/StringJoiner;JJLjava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const-wide/16 v3, 0x400

    .line 73
    .line 74
    const-string v5, "FLAG_STASHED_DEVICE_LOCKED"

    .line 75
    .line 76
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/util/n0;->b(Ljava/util/StringJoiner;JJLjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    const-wide/16 v3, 0x800

    .line 80
    .line 81
    const-string v5, "FLAG_IN_OVERVIEW"

    .line 82
    .line 83
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/util/n0;->b(Ljava/util/StringJoiner;JJLjava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/util/StringJoiner;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0
.end method

.method private T()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->t:Landroid/view/accessibility/AccessibilityManager;

    .line 2
    .line 3
    const/16 v0, 0x1388

    .line 4
    .line 5
    const/4 v1, 0x4

    .line 6
    invoke-virtual {p0, v0, v1}, Landroid/view/accessibility/AccessibilityManager;->getRecommendedTimeoutMillis(II)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-long v0, p0

    .line 11
    return-wide v0
.end method

.method private U(J)Landroid/animation/Animator;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    new-instance p1, Lcom/android/launcher3/taskbar/a4$b;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/a4$b;-><init>(Lcom/android/launcher3/taskbar/a4;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 20
    .line 21
    .line 22
    return-object v0

    .line 23
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private X(J)Z
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/taskbar/a4;->v:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private Y(JJ)Z
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

.method public static synthetic b(Lcom/android/launcher3/taskbar/a4;ZLcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/a4;->u0(ZLcom/android/launcher3/taskbar/bubbles/m0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/a4;Lcom/android/launcher3/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/a4;->A0(Lcom/android/launcher3/c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/a4;J)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/a4;->o0(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic e(Lcom/android/launcher3/taskbar/a4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->s0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/taskbar/a4;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/a4;->q0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/taskbar/a4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->j0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/taskbar/a4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->r0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/taskbar/a4;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/a4;->k0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/taskbar/a4;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/a4;->n0(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic j0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/W4;->q0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic k(Lcom/android/launcher3/taskbar/a4;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/a4;->t0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic k0(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/a4;->u:Z

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/a4;->y0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic l(Lcom/android/launcher3/taskbar/a4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->p0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic l0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->l:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/taskbar/a4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->l0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic m0(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->n:Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n(Lcom/android/launcher3/taskbar/a4;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/a4;->m0(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic n0(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->l:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method static bridge synthetic o(Lcom/android/launcher3/taskbar/a4;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic o0(J)Z
    .locals 7

    .line 1
    const-wide/16 v0, 0x41

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-wide/16 v1, 0x1ae

    .line 8
    .line 9
    invoke-direct {p0, p1, p2, v1, v2}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const-wide/16 v2, 0x10

    .line 14
    .line 15
    invoke-direct {p0, p1, p2, v2, v3}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const-wide/16 v3, 0x800

    .line 20
    .line 21
    invoke-direct {p0, p1, p2, v3, v4}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    const-wide/16 v4, 0x8

    .line 26
    .line 27
    invoke-direct {p0, p1, p2, v4, v5}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    const-wide/32 v5, 0xa6a0

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, p1, p2, v5, v6}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    if-nez v1, :cond_3

    .line 41
    .line 42
    :cond_0
    if-nez v0, :cond_1

    .line 43
    .line 44
    if-nez v2, :cond_3

    .line 45
    .line 46
    :cond_1
    if-eqz v3, :cond_2

    .line 47
    .line 48
    if-nez v4, :cond_3

    .line 49
    .line 50
    :cond_2
    if-eqz p0, :cond_4

    .line 51
    .line 52
    :cond_3
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_4
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method static bridge synthetic p(Lcom/android/launcher3/taskbar/a4;)Lcom/android/launcher3/taskbar/R1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic p0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->t:Landroid/view/accessibility/AccessibilityManager;

    .line 2
    .line 3
    const/16 v0, 0x1f3

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityManager;->unregisterSystemAction(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method static bridge synthetic q(Lcom/android/launcher3/taskbar/a4;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/a4;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method private synthetic q0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->K0()Z

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
    goto :goto_0

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    :goto_0
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/U0;->s(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->q:Lcom/android/launcher3/taskbar/N2;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/N2;->p()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method static bridge synthetic r(Lcom/android/launcher3/taskbar/a4;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/a4;->D:Z

    .line 2
    .line 3
    return p0
.end method

.method private synthetic r0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->q:Lcom/android/launcher3/taskbar/N2;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/N2;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method static bridge synthetic s(Lcom/android/launcher3/taskbar/a4;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method private synthetic s0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->E()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method static bridge synthetic t(Lcom/android/launcher3/taskbar/a4;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/a4;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method private synthetic t0(Z)V
    .locals 5

    .line 1
    const/16 v0, 0x1f3

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/a4;->H:Z

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    new-instance p1, Landroid/app/RemoteAction;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 29
    .line 30
    const v2, 0x7f080d35

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v2}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 38
    .line 39
    const v3, 0x7f140420

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v3}, Landroid/view/ContextThemeWrapper;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v4, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 47
    .line 48
    invoke-virtual {v4, v3}, Landroid/view/ContextThemeWrapper;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iget-object v4, p0, Lcom/android/launcher3/taskbar/a4;->I:Lcom/android/launcher3/taskbar/J3;

    .line 53
    .line 54
    iget-object v4, v4, Lcom/android/launcher3/taskbar/J3;->s:Landroid/app/PendingIntent;

    .line 55
    .line 56
    invoke-direct {p1, v1, v2, v3, v4}, Landroid/app/RemoteAction;-><init>(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/launcher3/taskbar/a4;->t:Landroid/view/accessibility/AccessibilityManager;

    .line 60
    .line 61
    invoke-virtual {v1, p1, v0}, Landroid/view/accessibility/AccessibilityManager;->registerSystemAction(Landroid/app/RemoteAction;I)V

    .line 62
    .line 63
    .line 64
    const/4 p1, 0x1

    .line 65
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/a4;->H:Z

    .line 66
    .line 67
    :cond_1
    return-void

    .line 68
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->t:Landroid/view/accessibility/AccessibilityManager;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityManager;->unregisterSystemAction(I)V

    .line 71
    .line 72
    .line 73
    const/4 p1, 0x0

    .line 74
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/a4;->H:Z

    .line 75
    .line 76
    return-void
.end method

.method static bridge synthetic u(Lcom/android/launcher3/taskbar/a4;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/a4;->B:Landroid/animation/Animator;

    .line 2
    .line 3
    return-void
.end method

.method private synthetic u0(ZLcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->F:Ljava/util/function/LongPredicate;

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/android/launcher3/taskbar/a4;->v:J

    .line 6
    .line 7
    invoke-interface {p1, v0, v1}, Ljava/util/function/LongPredicate;->test(J)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    iget-object p1, p2, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 12
    .line 13
    invoke-interface {p1}, LX1/b;->c()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eq p0, p1, :cond_1

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p2, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 22
    .line 23
    invoke-interface {p0}, LX1/b;->J()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p0, p2, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-interface {p0, p1}, LX1/b;->g(Z)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method static bridge synthetic v(Lcom/android/launcher3/taskbar/a4;ZJIZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/taskbar/a4;->K(ZJIZLjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private v0(ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->j:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/android/quickstep/SystemUiProxy;->notifyTaskbarStatus(ZZ)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/a4;->G0(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->e:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/rotation/RotationButtonController;->onTaskbarStateChange(ZZ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method static bridge synthetic w(Lcom/android/launcher3/taskbar/a4;J)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic x(Lcom/android/launcher3/taskbar/a4;JJ)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic y(Lcom/android/launcher3/taskbar/a4;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/a4;->y0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private y0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/taskbar/Q3;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/taskbar/Q3;-><init>(Lcom/android/launcher3/taskbar/a4;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/R1;->q(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method static bridge synthetic z(Lcom/android/launcher3/taskbar/a4;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/a4;->z0(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private z0(J)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x1ae

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/o4;->G()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const-wide/16 v0, 0x1ef

    .line 17
    .line 18
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-wide/16 v0, 0x41

    .line 25
    .line 26
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->h0()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->v0(ZZ)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->c0()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    xor-int/lit8 v1, v1, 0x1

    .line 46
    .line 47
    const/16 v2, 0x10

    .line 48
    .line 49
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/taskbar/K1;->g(IZ)V

    .line 50
    .line 51
    .line 52
    :cond_1
    const-wide/16 v0, 0x100

    .line 53
    .line 54
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_3

    .line 59
    .line 60
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 61
    .line 62
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_2

    .line 75
    .line 76
    sget-object v3, Lcom/android/launcher3/logging/StatsLogManager$e;->V2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    sget-object v3, Lcom/android/launcher3/logging/StatsLogManager$e;->W2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 80
    .line 81
    :goto_0
    invoke-interface {v2, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 82
    .line 83
    .line 84
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 85
    .line 86
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 87
    .line 88
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    xor-int/lit8 v0, v0, 0x1

    .line 93
    .line 94
    const/16 v1, 0x20

    .line 95
    .line 96
    invoke-virtual {v2, v1, v0}, Lcom/android/launcher3/taskbar/K1;->g(IZ)V

    .line 97
    .line 98
    .line 99
    :cond_3
    const-wide/16 v0, 0x801

    .line 100
    .line 101
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_4

    .line 106
    .line 107
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 108
    .line 109
    new-instance p2, Lcom/android/launcher3/taskbar/X3;

    .line 110
    .line 111
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/X3;-><init>(Lcom/android/launcher3/taskbar/a4;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/R1;->q(Ljava/lang/Runnable;)V

    .line 115
    .line 116
    .line 117
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/a4;->E:Z

    .line 118
    .line 119
    if-eqz p1, :cond_4

    .line 120
    .line 121
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 122
    .line 123
    new-instance p2, Lcom/android/launcher3/taskbar/Y3;

    .line 124
    .line 125
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/Y3;-><init>(Lcom/android/launcher3/taskbar/a4;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/R1;->q(Ljava/lang/Runnable;)V

    .line 129
    .line 130
    .line 131
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 132
    .line 133
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->h0()Z

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    xor-int/lit8 p0, p0, 0x1

    .line 138
    .line 139
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/I1;->c0(Z)V

    .line 140
    .line 141
    .line 142
    return-void
.end method


# virtual methods
.method protected C(Landroid/animation/AnimatorSet;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/W4;->q0(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-long v3, p2

    .line 16
    const/4 v6, 0x0

    .line 17
    const-string v7, "SUW_MANUAL"

    .line 18
    .line 19
    const/4 v5, 0x3

    .line 20
    move-object v1, p0

    .line 21
    invoke-direct/range {v1 .. v7}, Lcom/android/launcher3/taskbar/a4;->K(ZJIZLjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Lcom/android/launcher3/taskbar/S3;

    .line 25
    .line 26
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/S3;-><init>(Lcom/android/launcher3/taskbar/a4;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p0}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, v1, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public C0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->B:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->n:Lcom/android/launcher3/util/v1$c;

    .line 13
    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-wide v1, p0, Lcom/android/launcher3/taskbar/a4;->C:J

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/android/launcher3/taskbar/a4;->B:Landroid/animation/Animator;

    .line 27
    .line 28
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->B:Landroid/animation/Animator;

    .line 34
    .line 35
    new-instance v1, Lcom/android/launcher3/taskbar/a4$c;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/a4$c;-><init>(Lcom/android/launcher3/taskbar/a4;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->B:Landroid/animation/Animator;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public D()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/a4;->H(Ljava/lang/Runnable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method protected D0(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 15
    :goto_1
    const-wide/16 v0, 0x40

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1, p1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 18
    .line 19
    .line 20
    const-wide/16 v0, 0x4

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1, p1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 23
    .line 24
    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    const-wide/16 v0, 0x0

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->P()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    :goto_2
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->E(J)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public E(J)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/a4;->G(JLjava/lang/Runnable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public F(JJ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/a4;->L(J)Landroid/animation/Animator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p3, p4}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public F0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/a4;->x:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->E0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G0(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/taskbar/W3;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/taskbar/W3;-><init>(Lcom/android/launcher3/taskbar/a4;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public H(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x40

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-wide/16 v0, 0x12c

    .line 13
    .line 14
    :goto_0
    invoke-direct {p0, v0, v1, p1}, Lcom/android/launcher3/taskbar/a4;->G(JLjava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public H0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/a4;->D:Z

    .line 2
    .line 3
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->z:Lcom/android/launcher3/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/c;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->z:Lcom/android/launcher3/c;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/c;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method protected J0(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->g0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->s:Lcom/android/launcher3/anim/d;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    const p1, 0x3f8ccccd    # 1.1f

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-wide/16 v0, 0x190

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public K0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->Q()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

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

.method public L(J)Landroid/animation/Animator;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->G:Lcom/android/launcher3/taskbar/a4$e;

    .line 12
    .line 13
    iget-wide v1, p0, Lcom/android/launcher3/taskbar/a4;->v:J

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/android/launcher3/taskbar/a4$e;->d(JJ)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public L0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const-wide/16 v0, 0x41

    .line 10
    .line 11
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-wide/16 v0, 0x100

    .line 19
    .line 20
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    xor-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public N(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/a4;->A:Z

    .line 2
    .line 3
    return-void
.end method

.method public N0(Z)V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/android/launcher3/taskbar/a4;->J:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/taskbar/a4;->P0(ZZZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public O()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->b1()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->Q()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->K0()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_6

    .line 35
    .line 36
    const-wide/16 v0, 0x184

    .line 37
    .line 38
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_6

    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-wide/16 v1, 0x4

    .line 51
    .line 52
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_3

    .line 57
    .line 58
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->p3:Z

    .line 59
    .line 60
    if-nez v0, :cond_2

    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->b1()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const v0, 0x7f070bb9

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    return p0

    .line 84
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 85
    .line 86
    const/4 v1, 0x0

    .line 87
    if-eqz v0, :cond_4

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_4

    .line 94
    .line 95
    const/4 v0, 0x1

    .line 96
    goto :goto_0

    .line 97
    :cond_4
    move v0, v1

    .line 98
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 99
    .line 100
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 101
    .line 102
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/U0;->q()Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-nez v2, :cond_5

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->c0()Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-eqz v2, :cond_5

    .line 113
    .line 114
    if-nez v0, :cond_5

    .line 115
    .line 116
    return v1

    .line 117
    :cond_5
    iget p0, p0, Lcom/android/launcher3/taskbar/a4;->h:I

    .line 118
    .line 119
    return p0

    .line 120
    :cond_6
    iget p0, p0, Lcom/android/launcher3/taskbar/a4;->i:I

    .line 121
    .line 122
    return p0
.end method

.method public O0(ZZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/a4;->P0(ZZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public P()J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->d1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-wide/16 v0, 0x258

    .line 10
    .line 11
    return-wide v0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const-wide/16 v0, 0x1a1

    .line 21
    .line 22
    return-wide v0

    .line 23
    :cond_1
    const-wide/16 v0, 0x12c

    .line 24
    .line 25
    return-wide v0
.end method

.method public P0(ZZZ)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_6

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->P0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_0
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/K1;->d()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/K1;->e()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_1
    const-wide/16 v0, 0x1000

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    const/4 v3, 0x1

    .line 45
    if-eqz p3, :cond_2

    .line 46
    .line 47
    iget-object v4, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 48
    .line 49
    iget-object v4, v4, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 50
    .line 51
    invoke-virtual {v4, v0, v1, v3}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 52
    .line 53
    .line 54
    move v4, v3

    .line 55
    goto :goto_0

    .line 56
    :cond_2
    move v4, v2

    .line 57
    :goto_0
    const-wide/16 v5, 0x100

    .line 58
    .line 59
    invoke-direct {p0, v5, v6}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    if-eq v7, p1, :cond_3

    .line 64
    .line 65
    iget-object v4, p0, Lcom/android/launcher3/taskbar/a4;->I:Lcom/android/launcher3/taskbar/J3;

    .line 66
    .line 67
    iput-boolean p1, v4, Lcom/android/launcher3/taskbar/J3;->w:Z

    .line 68
    .line 69
    invoke-virtual {p0, v5, v6, p1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    move v3, v4

    .line 74
    :goto_1
    if-eqz v3, :cond_4

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->D()V

    .line 77
    .line 78
    .line 79
    :cond_4
    if-eqz p3, :cond_5

    .line 80
    .line 81
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 82
    .line 83
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 84
    .line 85
    invoke-virtual {p1, v0, v1, v2}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 89
    .line 90
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 91
    .line 92
    const-wide/16 v0, 0x0

    .line 93
    .line 94
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/taskbar/a4;->E(J)V

    .line 95
    .line 96
    .line 97
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 98
    .line 99
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 100
    .line 101
    new-instance p3, Lcom/android/launcher3/taskbar/T3;

    .line 102
    .line 103
    invoke-direct {p3, p0, p2}, Lcom/android/launcher3/taskbar/T3;-><init>(Lcom/android/launcher3/taskbar/a4;Z)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, p3}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 107
    .line 108
    .line 109
    :cond_6
    :goto_2
    return-void
.end method

.method public Q()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/a4;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public R0(JZ)Z
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/taskbar/a4;->v:J

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    or-long/2addr p1, v0

    .line 6
    iput-wide p1, p0, Lcom/android/launcher3/taskbar/a4;->v:J

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    not-long p1, p1

    .line 10
    and-long/2addr p1, v0

    .line 11
    iput-wide p1, p0, Lcom/android/launcher3/taskbar/a4;->v:J

    .line 12
    .line 13
    :goto_0
    iget-wide p0, p0, Lcom/android/launcher3/taskbar/a4;->v:J

    .line 14
    .line 15
    cmp-long p0, p0, v0

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public S()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->O()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, Lcom/android/launcher3/taskbar/a4;->h:I

    .line 6
    .line 7
    if-gt v0, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    return v0
.end method

.method public S0(JZ)V
    .locals 9

    .line 1
    sget-object v0, Lcom/android/launcher3/taskbar/I1;->M:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-wide v3, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-wide/32 v3, 0x40000000

    .line 14
    .line 15
    .line 16
    :goto_0
    const-wide/32 v5, 0x8000

    .line 17
    .line 18
    .line 19
    or-long/2addr v3, v5

    .line 20
    invoke-direct {p0, p1, p2, v3, v4}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const-wide/16 v3, 0x2

    .line 25
    .line 26
    invoke-virtual {p0, v3, v4, v0}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 27
    .line 28
    .line 29
    const-wide/16 v3, 0x800

    .line 30
    .line 31
    invoke-direct {p0, v3, v4}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/4 v3, 0x0

    .line 36
    const/4 v4, 0x1

    .line 37
    const-wide/16 v5, 0x4000

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-direct {p0, p1, p2, v5, v6}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    move v0, v4

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    move v0, v3

    .line 58
    :goto_1
    const-wide/16 v7, 0x1

    .line 59
    .line 60
    invoke-direct {p0, p1, p2, v7, v8}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    if-nez v7, :cond_2

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    :cond_2
    move v3, v4

    .line 69
    :cond_3
    const-wide/16 v7, 0x200

    .line 70
    .line 71
    invoke-virtual {p0, v7, v8, v3}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 72
    .line 73
    .line 74
    const-wide/16 v3, 0x400

    .line 75
    .line 76
    invoke-static {p1, p2}, Lcom/android/quickstep/util/SystemUiFlagUtils;->isLocked(J)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-virtual {p0, v3, v4, v0}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 81
    .line 82
    .line 83
    const-wide/32 v3, 0x40000

    .line 84
    .line 85
    .line 86
    invoke-direct {p0, p1, p2, v3, v4}, Lcom/android/launcher3/taskbar/a4;->Y(JJ)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/a4;->y:Z

    .line 91
    .line 92
    const-wide/16 v3, 0x8

    .line 93
    .line 94
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->I0()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-virtual {p0, v3, v4, v0}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->V()J

    .line 105
    .line 106
    .line 107
    move-result-wide v3

    .line 108
    const-wide/16 v7, 0x50

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_4
    const-wide/16 v7, 0x12c

    .line 112
    .line 113
    move-wide v3, v1

    .line 114
    :goto_2
    invoke-static {p1, p2}, Lcom/android/quickstep/util/SystemUiFlagUtils;->isTaskbarHidden(J)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_5

    .line 119
    .line 120
    invoke-direct {p0, v5, v6}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_5

    .line 125
    .line 126
    invoke-static {p1, p2}, Lcom/android/quickstep/util/SystemUiFlagUtils;->isTaskbarHidden(J)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    invoke-virtual {p0, v5, v6, p1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 131
    .line 132
    .line 133
    const-wide/16 p1, 0x1c2

    .line 134
    .line 135
    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/android/launcher3/taskbar/a4;->F(JJ)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_5
    invoke-static {p1, p2}, Lcom/android/quickstep/util/SystemUiFlagUtils;->isTaskbarHidden(J)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    invoke-virtual {p0, v5, v6, p1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 144
    .line 145
    .line 146
    if-eqz p3, :cond_6

    .line 147
    .line 148
    move-wide v7, v1

    .line 149
    :cond_6
    if-eqz p3, :cond_7

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_7
    move-wide v1, v3

    .line 153
    :goto_3
    invoke-virtual {p0, v7, v8, v1, v2}, Lcom/android/launcher3/taskbar/a4;->F(JJ)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public T0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->I()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->M0()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method V()J
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/a4;->y:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/high16 v0, 0x10e0000

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    int-to-long v0, p0

    .line 23
    const-wide/16 v2, 0x50

    .line 24
    .line 25
    sub-long/2addr v0, v2

    .line 26
    return-wide v0
.end method

.method public W()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/a4;->u:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/taskbar/a4;->h:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget v0, p0, Lcom/android/launcher3/taskbar/a4;->i:I

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget p0, p0, Lcom/android/launcher3/h0;->t3:I

    .line 17
    .line 18
    add-int/2addr v0, p0

    .line 19
    return v0
.end method

.method public Z(Lcom/android/launcher3/taskbar/R1;ZLcom/android/launcher3/taskbar/J3;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/taskbar/a4;->I:Lcom/android/launcher3/taskbar/J3;

    .line 4
    .line 5
    iget-object p3, p1, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 6
    .line 7
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/s2;->u()Lcom/android/launcher3/anim/d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/taskbar/a4;->l:Lcom/android/launcher3/anim/d;

    .line 12
    .line 13
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/s2;->o()Lcom/android/launcher3/anim/d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/android/launcher3/taskbar/a4;->m:Lcom/android/launcher3/anim/d;

    .line 18
    .line 19
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/s2;->m()Lcom/android/launcher3/util/v1$c;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    iput-object p3, p0, Lcom/android/launcher3/taskbar/a4;->n:Lcom/android/launcher3/util/v1$c;

    .line 24
    .line 25
    iget-object p3, p1, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 26
    .line 27
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/W4;->S()Lcom/android/launcher3/util/v1;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x2

    .line 32
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/android/launcher3/taskbar/a4;->o:Lcom/android/launcher3/util/v1$c;

    .line 37
    .line 38
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/W4;->U()Lcom/android/launcher3/anim/d;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/android/launcher3/taskbar/a4;->p:Lcom/android/launcher3/anim/d;

    .line 43
    .line 44
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/W4;->Y()Lcom/android/launcher3/anim/d;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    iput-object p3, p0, Lcom/android/launcher3/taskbar/a4;->q:Lcom/android/launcher3/anim/d;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/U0;->l()Lcom/android/launcher3/util/v1;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    const/4 v0, 0x0

    .line 57
    invoke-virtual {p3, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    iput-object p3, p0, Lcom/android/launcher3/taskbar/a4;->r:Lcom/android/launcher3/util/v1$c;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/U0;->n()Lcom/android/launcher3/anim/d;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iput-object p1, p0, Lcom/android/launcher3/taskbar/a4;->s:Lcom/android/launcher3/anim/d;

    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    iget-object p3, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 76
    .line 77
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 78
    .line 79
    .line 80
    move-result p3

    .line 81
    const/4 v1, 0x1

    .line 82
    if-eqz p3, :cond_1

    .line 83
    .line 84
    if-eqz p2, :cond_0

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_0
    move p2, v0

    .line 88
    goto :goto_1

    .line 89
    :cond_1
    :goto_0
    move p2, v1

    .line 90
    :goto_1
    if-eqz p1, :cond_2

    .line 91
    .line 92
    iget-object p3, p0, Lcom/android/launcher3/taskbar/a4;->I:Lcom/android/launcher3/taskbar/J3;

    .line 93
    .line 94
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/J3;->a()Z

    .line 95
    .line 96
    .line 97
    move-result p3

    .line 98
    if-nez p3, :cond_2

    .line 99
    .line 100
    move p3, v1

    .line 101
    goto :goto_2

    .line 102
    :cond_2
    move p3, v0

    .line 103
    :goto_2
    sget-boolean v2, Lf1/a;->g:Z

    .line 104
    .line 105
    if-eqz v2, :cond_4

    .line 106
    .line 107
    if-eqz p3, :cond_3

    .line 108
    .line 109
    iget-object p3, p0, Lcom/android/launcher3/taskbar/a4;->I:Lcom/android/launcher3/taskbar/J3;

    .line 110
    .line 111
    iget-boolean p3, p3, Lcom/android/launcher3/taskbar/J3;->w:Z

    .line 112
    .line 113
    if-eqz p3, :cond_3

    .line 114
    .line 115
    move p3, v1

    .line 116
    goto :goto_3

    .line 117
    :cond_3
    move p3, v0

    .line 118
    :cond_4
    :goto_3
    const-wide/16 v2, 0x100

    .line 119
    .line 120
    invoke-virtual {p0, v2, v3, p3}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 121
    .line 122
    .line 123
    const-wide/16 v2, 0x4

    .line 124
    .line 125
    invoke-virtual {p0, v2, v3, p2}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 126
    .line 127
    .line 128
    const-wide/16 v2, 0x40

    .line 129
    .line 130
    invoke-virtual {p0, v2, v3, p2}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 131
    .line 132
    .line 133
    iget-object p2, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 134
    .line 135
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/I1;->b1()Z

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    const-wide/16 v2, 0x80

    .line 140
    .line 141
    invoke-virtual {p0, v2, v3, p2}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 142
    .line 143
    .line 144
    const-wide/16 p2, 0x1

    .line 145
    .line 146
    invoke-virtual {p0, p2, p3, v1}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 147
    .line 148
    .line 149
    iget-object p2, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 150
    .line 151
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/I1;->P0()Z

    .line 152
    .line 153
    .line 154
    move-result p2

    .line 155
    const-wide/32 v2, 0x8000

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0, v2, v3, p2}, Lcom/android/launcher3/taskbar/a4;->R0(JZ)Z

    .line 159
    .line 160
    .line 161
    const-wide/16 p2, 0x0

    .line 162
    .line 163
    invoke-virtual {p0, p2, p3}, Lcom/android/launcher3/taskbar/a4;->E(J)V

    .line 164
    .line 165
    .line 166
    iget-object p2, p0, Lcom/android/launcher3/taskbar/a4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 167
    .line 168
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 169
    .line 170
    .line 171
    move-result p2

    .line 172
    if-nez p2, :cond_6

    .line 173
    .line 174
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 175
    .line 176
    .line 177
    move-result p2

    .line 178
    if-eqz p2, :cond_5

    .line 179
    .line 180
    if-eqz p1, :cond_5

    .line 181
    .line 182
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->g0()Z

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    if-eqz p1, :cond_5

    .line 187
    .line 188
    goto :goto_4

    .line 189
    :cond_5
    move v1, v0

    .line 190
    :cond_6
    :goto_4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->n:Lcom/android/launcher3/util/v1$c;

    .line 191
    .line 192
    if-eqz v1, :cond_7

    .line 193
    .line 194
    const/4 p2, 0x0

    .line 195
    goto :goto_5

    .line 196
    :cond_7
    const/high16 p2, 0x3f800000    # 1.0f

    .line 197
    .line 198
    :goto_5
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->I:Lcom/android/launcher3/taskbar/J3;

    .line 202
    .line 203
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/J3;->a()Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-nez p1, :cond_8

    .line 208
    .line 209
    iget-object p1, p0, Lcom/android/launcher3/taskbar/a4;->I:Lcom/android/launcher3/taskbar/J3;

    .line 210
    .line 211
    iget-boolean p1, p1, Lcom/android/launcher3/taskbar/J3;->w:Z

    .line 212
    .line 213
    if-nez p1, :cond_9

    .line 214
    .line 215
    :cond_8
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->M0()V

    .line 216
    .line 217
    .line 218
    :cond_9
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->h0()Z

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/taskbar/a4;->v0(ZZ)V

    .line 223
    .line 224
    .line 225
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

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
    const-string v1, "TaskbarStashController:"

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
    const-string v1, "\tmStashedHeight="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v1, p0, Lcom/android/launcher3/taskbar/a4;->h:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, "\tmUnstashedHeight="

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget v1, p0, Lcom/android/launcher3/taskbar/a4;->i:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v1, "\tmIsStashed="

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/a4;->u:Z

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v1, "\tappliedState="

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/android/launcher3/taskbar/a4;->G:Lcom/android/launcher3/taskbar/a4$e;

    .line 110
    .line 111
    invoke-static {v1}, Lcom/android/launcher3/taskbar/a4$e;->a(Lcom/android/launcher3/taskbar/a4$e;)J

    .line 112
    .line 113
    .line 114
    move-result-wide v1

    .line 115
    invoke-static {v1, v2}, Lcom/android/launcher3/taskbar/a4;->R(J)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v1, "\tmState="

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget-wide v1, p0, Lcom/android/launcher3/taskbar/a4;->v:J

    .line 143
    .line 144
    invoke-static {v1, v2}, Lcom/android/launcher3/taskbar/a4;->R(J)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    new-instance v0, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    const-string v1, "\tmIsSystemGestureInProgress="

    .line 167
    .line 168
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/a4;->x:Z

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string p1, "\tmIsImeVisible="

    .line 192
    .line 193
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/a4;->y:Z

    .line 197
    .line 198
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    return-void
.end method

.method public a0()Z
    .locals 2

    .line 1
    const-wide/16 v0, 0x400

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b0()Z
    .locals 2

    .line 1
    const-wide/16 v0, 0x2000

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c0()Z
    .locals 2

    .line 1
    const-wide/16 v0, 0x41

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d0()Z
    .locals 2

    .line 1
    const-wide/16 v0, 0x800

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e0()Z
    .locals 2

    .line 1
    const-wide/16 v0, 0x10

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->K0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public f0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->c0()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public g0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/a4;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public h0()Z
    .locals 2

    .line 1
    const-wide/16 v0, 0x1ae

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/a4;->X(J)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i0()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/a4;->u:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a4;->k:Lcom/android/launcher3/taskbar/R1;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->A()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public w0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/a4;->w:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 12
    .line 13
    new-instance v1, Lcom/android/launcher3/taskbar/V3;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/V3;-><init>(Lcom/android/launcher3/taskbar/a4;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public x0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/a4;->E0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
