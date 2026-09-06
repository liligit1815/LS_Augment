.class public final Lcom/android/launcher3/M2$a;
.super Landroid/view/IRemoteAnimationFinishedCallback$Stub;
.source "LauncherAnimationRunner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/M2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field private final g:Ljava/lang/Runnable;

.field private final h:Ljava/lang/Runnable;

.field private i:Landroid/animation/AnimatorSet;

.field private j:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

.field private k:Ljava/lang/Runnable;

.field private l:Z

.field private m:Z

.field private n:Lu2/s$a;


# direct methods
.method private constructor <init>(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Landroid/view/IRemoteAnimationFinishedCallback$Stub;-><init>()V

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/android/launcher3/M2$a;->l:Z

    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/M2$a;->m:Z

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/M2$a;->g:Ljava/lang/Runnable;

    .line 6
    iput-object p2, p0, Lcom/android/launcher3/M2$a;->h:Ljava/lang/Runnable;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/android/launcher3/N2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/M2$a;-><init>(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic o2(Lcom/android/launcher3/M2$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/M2$a;->s2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic p2(Lcom/android/launcher3/M2$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/M2$a;->q2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private q2()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/M2$a;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/M2$a;->g:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 11
    .line 12
    new-instance v1, Lcom/android/launcher3/L2;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/android/launcher3/L2;-><init>(Lcom/android/launcher3/M2$a;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lcom/android/launcher3/M2$a;->l:Z

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private synthetic s2()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/M2$a;->h:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/M2$a;->k:Ljava/lang/Runnable;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lx1/O;->Z3()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method


# virtual methods
.method public onAnimationFinished()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/M2$a;->h:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r2()Lu2/s$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/M2$a;->n:Lu2/s$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public t2(Landroid/animation/AnimatorSet;Landroid/content/Context;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/android/launcher3/M2$a;->u2(Landroid/animation/AnimatorSet;Landroid/content/Context;Ljava/lang/Runnable;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u2(Landroid/animation/AnimatorSet;Landroid/content/Context;Ljava/lang/Runnable;Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/M2$a;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/android/launcher3/M2$a;->m:Z

    .line 7
    .line 8
    iput-object p1, p0, Lcom/android/launcher3/M2$a;->i:Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    iput-object p3, p0, Lcom/android/launcher3/M2$a;->k:Ljava/lang/Runnable;

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/launcher3/M2$a;->q2()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-boolean p3, p0, Lcom/android/launcher3/M2$a;->l:Z

    .line 19
    .line 20
    if-eqz p3, :cond_2

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/M2$a;->i:Landroid/animation/AnimatorSet;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->end()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/M2$a;->k:Ljava/lang/Runnable;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void

    .line 38
    :cond_2
    new-instance p3, Lcom/android/launcher3/M2$a$a;

    .line 39
    .line 40
    invoke-direct {p3, p0}, Lcom/android/launcher3/M2$a$a;-><init>(Lcom/android/launcher3/M2$a;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, p3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 44
    .line 45
    .line 46
    if-eqz p4, :cond_3

    .line 47
    .line 48
    const-string p1, "b/311077782"

    .line 49
    .line 50
    const-string p3, "LauncherAnimationRunner.setAnimation"

    .line 51
    .line 52
    invoke-static {p1, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/android/launcher3/M2$a;->i:Landroid/animation/AnimatorSet;

    .line 56
    .line 57
    invoke-static {p2}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    int-to-long p2, p2

    .line 62
    iget-object p4, p0, Lcom/android/launcher3/M2$a;->i:Landroid/animation/AnimatorSet;

    .line 63
    .line 64
    invoke-virtual {p4}, Landroid/animation/AnimatorSet;->getTotalDuration()J

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 69
    .line 70
    .line 71
    move-result-wide p2

    .line 72
    invoke-virtual {p1, p2, p3}, Landroid/animation/AnimatorSet;->setCurrentPlayTime(J)V

    .line 73
    .line 74
    .line 75
    :cond_3
    sget-object p1, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 76
    .line 77
    const-string p2, "Launcher.localAnimationStart"

    .line 78
    .line 79
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/launcher3/M2$a;->i:Landroid/animation/AnimatorSet;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 85
    .line 86
    .line 87
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 94
    .line 95
    const-string p1, "Animation already initialized"

    .line 96
    .line 97
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    throw p0
.end method

.method public v2(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Ljava/lang/Runnable;Z)V
    .locals 0

    .line 1
    iget-boolean p3, p0, Lcom/android/launcher3/M2$a;->m:Z

    .line 2
    .line 3
    if-nez p3, :cond_4

    .line 4
    .line 5
    const/4 p3, 0x1

    .line 6
    iput-boolean p3, p0, Lcom/android/launcher3/M2$a;->m:Z

    .line 7
    .line 8
    iput-object p1, p0, Lcom/android/launcher3/M2$a;->j:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 9
    .line 10
    iput-object p2, p0, Lcom/android/launcher3/M2$a;->k:Ljava/lang/Runnable;

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/launcher3/M2$a;->q2()V

    .line 15
    .line 16
    .line 17
    const-string p0, "LauncherAnimationRunner"

    .line 18
    .line 19
    const-string p1, "RectFSpringAnim is null"

    .line 20
    .line 21
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-boolean p2, p0, Lcom/android/launcher3/M2$a;->l:Z

    .line 26
    .line 27
    if-eqz p2, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->start()V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/M2$a;->j:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 33
    .line 34
    const/4 p2, 0x7

    .line 35
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->end(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/M2$a;->k:Ljava/lang/Runnable;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void

    .line 46
    :cond_2
    new-instance p1, Lcom/android/launcher3/M2$a$b;

    .line 47
    .line 48
    invoke-direct {p1, p0}, Lcom/android/launcher3/M2$a$b;-><init>(Lcom/android/launcher3/M2$a;)V

    .line 49
    .line 50
    .line 51
    iget-object p2, p0, Lcom/android/launcher3/M2$a;->j:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 52
    .line 53
    invoke-virtual {p2}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    if-eqz p2, :cond_3

    .line 58
    .line 59
    invoke-virtual {p2, p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    iget-object p2, p0, Lcom/android/launcher3/M2$a;->j:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 64
    .line 65
    invoke-virtual {p2, p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->addListener(Lcom/android/launcher3/anim/T;)V

    .line 66
    .line 67
    .line 68
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/M2$a;->j:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->start()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 75
    .line 76
    const-string p1, "Animation already initialized"

    .line 77
    .line 78
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    throw p0
.end method

.method public w2(Lu2/s$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/M2$a;->n:Lu2/s$a;

    .line 2
    .line 3
    return-void
.end method
