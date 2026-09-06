.class public Lcom/android/quickstep/RotationTouchHelper;
.super Ljava/lang/Object;
.source "RotationTouchHelper.java"

# interfaces
.implements Lcom/android/launcher3/util/Z$b;


# static fields
.field public static final INSTANCE:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/RotationTouchHelper;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "RotationTouchHelper"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mCurrentAppRotation:I

.field private final mDisplayController:Lcom/android/launcher3/util/Z;

.field private final mDisplayId:I

.field private mDisplayRotation:I

.field private final mExitOverviewRunnable:Ljava/lang/Runnable;

.field private final mFrozenTaskListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

.field private mInOverview:Z

.field private mMode:Lcom/android/launcher3/util/C1;

.field private final mOrientationListener:Landroid/view/OrientationEventListener;

.field private final mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

.field private mPrioritizeDeviceRotation:Z

.field private mSensorRotation:I

.field private final mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

.field private mTaskListFrozen:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/u4;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/quickstep/u4;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/quickstep/RotationTouchHelper;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/Z;Lcom/android/quickstep/SystemUiProxy;Lcom/android/launcher3/util/K;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mMode:Lcom/android/launcher3/util/C1;

    .line 7
    .line 8
    new-instance v0, Lcom/android/quickstep/RotationTouchHelper$1;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/android/quickstep/RotationTouchHelper$1;-><init>(Lcom/android/quickstep/RotationTouchHelper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mFrozenTaskListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 14
    .line 15
    new-instance v0, Lcom/android/quickstep/RotationTouchHelper$2;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/android/quickstep/RotationTouchHelper$2;-><init>(Lcom/android/quickstep/RotationTouchHelper;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mExitOverviewRunnable:Ljava/lang/Runnable;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mSensorRotation:I

    .line 24
    .line 25
    const/4 v1, -0x1

    .line 26
    iput v1, p0, Lcom/android/quickstep/RotationTouchHelper;->mCurrentAppRotation:I

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mPrioritizeDeviceRotation:Z

    .line 29
    .line 30
    iput-object p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mContext:Landroid/content/Context;

    .line 31
    .line 32
    iput-object p2, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 33
    .line 34
    iput-object p3, p0, Lcom/android/quickstep/RotationTouchHelper;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 35
    .line 36
    iput v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayId:I

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/Z;->v(Landroid/content/Context;)Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    new-instance v1, Lcom/android/quickstep/OrientationTouchTransformer;

    .line 50
    .line 51
    iget-object v2, p0, Lcom/android/quickstep/RotationTouchHelper;->mMode:Lcom/android/launcher3/util/C1;

    .line 52
    .line 53
    new-instance v3, Lcom/android/quickstep/x4;

    .line 54
    .line 55
    invoke-direct {v3, p0}, Lcom/android/quickstep/x4;-><init>(Lcom/android/quickstep/RotationTouchHelper;)V

    .line 56
    .line 57
    .line 58
    invoke-direct {v1, p3, v2, v3, p1}, Lcom/android/quickstep/OrientationTouchTransformer;-><init>(Landroid/content/res/Resources;Lcom/android/launcher3/util/C1;Lcom/android/quickstep/OrientationTouchTransformer$QuickStepContractInfo;Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 62
    .line 63
    invoke-virtual {p2, p0, v0}, Lcom/android/launcher3/util/Z;->p(Lcom/android/launcher3/util/Z$b;I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/Z;->x(I)Lcom/android/launcher3/util/Z$c;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    const/16 p3, 0xff

    .line 71
    .line 72
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/RotationTouchHelper;->onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V

    .line 73
    .line 74
    .line 75
    new-instance p2, Lcom/android/quickstep/RotationTouchHelper$3;

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-direct {p2, p0, p1}, Lcom/android/quickstep/RotationTouchHelper$3;-><init>(Lcom/android/quickstep/RotationTouchHelper;Landroid/content/Context;)V

    .line 82
    .line 83
    .line 84
    iput-object p2, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationListener:Landroid/view/OrientationEventListener;

    .line 85
    .line 86
    new-instance p1, Lcom/android/quickstep/y4;

    .line 87
    .line 88
    invoke-direct {p1, p0}, Lcom/android/quickstep/y4;-><init>(Lcom/android/quickstep/RotationTouchHelper;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p4, p1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/RotationTouchHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RotationTouchHelper;->lambda$new$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/RotationTouchHelper;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RotationTouchHelper;->lambda$notifySysuiOfCurrentRotation$2(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/RotationTouchHelper;)F
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RotationTouchHelper;->lambda$new$0()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/RotationTouchHelper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mCurrentAppRotation:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/RotationTouchHelper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayId:I

    .line 2
    .line 3
    return p0
.end method

.method private enableMultipleRegions(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayId:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/Z;->x(I)Lcom/android/launcher3/util/Z$c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, p1, v1}, Lcom/android/quickstep/OrientationTouchTransformer;->enableMultipleRegions(ZLcom/android/launcher3/util/Z$c;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/quickstep/OrientationTouchTransformer;->getQuickStepStartingRotation()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-direct {p0, v0}, Lcom/android/quickstep/RotationTouchHelper;->notifySysuiOfCurrentRotation(I)V

    .line 21
    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-boolean p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mInOverview:Z

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    sget-boolean p1, Lc2/b;->b:Z

    .line 30
    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    iget p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mCurrentAppRotation:I

    .line 34
    .line 35
    iput p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mSensorRotation:I

    .line 36
    .line 37
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationListener:Landroid/view/OrientationEventListener;

    .line 40
    .line 41
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    new-instance v0, Lcom/android/quickstep/v4;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Lcom/android/quickstep/v4;-><init>(Landroid/view/OrientationEventListener;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationListener:Landroid/view/OrientationEventListener;

    .line 56
    .line 57
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    new-instance v0, Lcom/android/quickstep/w4;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Lcom/android/quickstep/w4;-><init>(Landroid/view/OrientationEventListener;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method static bridge synthetic f(Lcom/android/quickstep/RotationTouchHelper;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mExitOverviewRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/quickstep/RotationTouchHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mInOverview:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic h(Lcom/android/quickstep/RotationTouchHelper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mSensorRotation:I

    .line 2
    .line 3
    return p0
.end method

.method private hasGestures(Lcom/android/launcher3/util/C1;)Z
    .locals 0

    .line 1
    iget-boolean p0, p1, Lcom/android/launcher3/util/C1;->g:Z

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    sget-object p0, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 6
    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/systemui/shared/Flags;->threeButtonCornerSwipe()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method static bridge synthetic i(Lcom/android/quickstep/RotationTouchHelper;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mInOverview:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j(Lcom/android/quickstep/RotationTouchHelper;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mPrioritizeDeviceRotation:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic k(Lcom/android/quickstep/RotationTouchHelper;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mSensorRotation:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic l(Lcom/android/quickstep/RotationTouchHelper;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mTaskListFrozen:Z

    .line 2
    .line 3
    return-void
.end method

.method private synthetic lambda$new$0()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private synthetic lambda$new$1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayId:I

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/util/Z;->Q(Lcom/android/launcher3/util/Z$b;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationListener:Landroid/view/OrientationEventListener;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->disable()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mFrozenTaskListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic lambda$notifySysuiOfCurrentRotation$2(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->notifyPrioritizedRotation(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method static bridge synthetic m(Lcom/android/quickstep/RotationTouchHelper;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RotationTouchHelper;->enableMultipleRegions(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic n(Lcom/android/quickstep/RotationTouchHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RotationTouchHelper;->toggleSecondaryNavBarsForRotation()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private notifySysuiOfCurrentRotation(I)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/z4;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/z4;-><init>(Lcom/android/quickstep/RotationTouchHelper;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private toggleSecondaryNavBarsForRotation()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayId:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/Z;->x(I)Lcom/android/launcher3/util/Z$c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/android/quickstep/OrientationTouchTransformer;->setSingleActiveRegion(Lcom/android/launcher3/util/Z$c;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/quickstep/OrientationTouchTransformer;->getCurrentActiveRotation()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-direct {p0, v0}, Lcom/android/quickstep/RotationTouchHelper;->notifySysuiOfCurrentRotation(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public dump(Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    const-string v0, "RotationTouchHelper:"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "  currentActiveRotation="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/RotationTouchHelper;->getCurrentActiveRotation()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v1, "  displayRotation="

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/quickstep/RotationTouchHelper;->getDisplayRotation()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Lcom/android/quickstep/OrientationTouchTransformer;->dump(Ljava/io/PrintWriter;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public getCurrentActiveRotation()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mMode:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/quickstep/RotationTouchHelper;->hasGestures(Lcom/android/launcher3/util/C1;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayRotation:I

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/quickstep/OrientationTouchTransformer;->getCurrentActiveRotation()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public getDisplayRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayRotation:I

    .line 2
    .line 3
    return p0
.end method

.method public getGesturalHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/OrientationTouchTransformer;->mGesturalHeight:I

    .line 4
    .line 5
    return p0
.end method

.method public getOrientationTouchTransformer()Lcom/android/quickstep/OrientationTouchTransformer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 2
    .line 3
    return-object p0
.end method

.method public isInHigherSwipeUpTouchRegion(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/OrientationTouchTransformer;->touchHigherValidSwipeRegions(FF)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public isInSwipeUpTouchRegion(Landroid/view/MotionEvent;)Z
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;I)Z

    move-result p0

    return p0
.end method

.method public isInSwipeUpTouchRegion(Landroid/view/MotionEvent;I)Z
    .locals 1

    .line 2
    invoke-static {p1}, Lcom/android/launcher3/H4;->d(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 3
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/H4;->c(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x1

    return p0

    .line 4
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    .line 5
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    .line 6
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/OrientationTouchTransformer;->touchInValidSwipeRegions(FF)Z

    move-result p0

    return p0
.end method

.method public isInSwipeUpTouchRegionWitYOffset(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/OrientationTouchTransformer;->touchInValidSwipeRegionsWitYOffset(FF)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public isTaskListFrozen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mTaskListFrozen:Z

    .line 2
    .line 3
    return p0
.end method

.method public onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V
    .locals 1

    .line 1
    and-int/lit8 p1, p3, 0x1b

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v0, "onDisplayInfoChanged info.rotation "

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget v0, p2, Lcom/android/launcher3/util/Z$c;->b:I

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, " info.currentSize "

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v0, p2, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "RotationTouchHelper"

    .line 35
    .line 36
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    iget p1, p2, Lcom/android/launcher3/util/Z$c;->b:I

    .line 40
    .line 41
    iput p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayRotation:I

    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mMode:Lcom/android/launcher3/util/C1;

    .line 44
    .line 45
    invoke-direct {p0, p1}, Lcom/android/quickstep/RotationTouchHelper;->hasGestures(Lcom/android/launcher3/util/C1;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/android/quickstep/RotationTouchHelper;->updateGestureTouchRegions()V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 55
    .line 56
    const-string v0, "RTH.onDisplayInfoChanged"

    .line 57
    .line 58
    invoke-virtual {p1, p2, v0}, Lcom/android/quickstep/OrientationTouchTransformer;->createOrAddTouchRegion(Lcom/android/launcher3/util/Z$c;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayRotation:I

    .line 62
    .line 63
    iput p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mCurrentAppRotation:I

    .line 64
    .line 65
    iget-boolean v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mPrioritizeDeviceRotation:Z

    .line 66
    .line 67
    if-nez v0, :cond_0

    .line 68
    .line 69
    iget v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mSensorRotation:I

    .line 70
    .line 71
    if-ne p1, v0, :cond_1

    .line 72
    .line 73
    :cond_0
    iget-boolean p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mInOverview:Z

    .line 74
    .line 75
    if-nez p1, :cond_1

    .line 76
    .line 77
    iget-boolean p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mTaskListFrozen:Z

    .line 78
    .line 79
    if-eqz p1, :cond_1

    .line 80
    .line 81
    invoke-direct {p0}, Lcom/android/quickstep/RotationTouchHelper;->toggleSecondaryNavBarsForRotation()V

    .line 82
    .line 83
    .line 84
    :cond_1
    and-int/lit8 p1, p3, 0x10

    .line 85
    .line 86
    if-eqz p1, :cond_3

    .line 87
    .line 88
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget-object p2, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 93
    .line 94
    iget-object p3, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 95
    .line 96
    iget v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayId:I

    .line 97
    .line 98
    invoke-virtual {p3, v0}, Lcom/android/launcher3/util/Z;->x(I)Lcom/android/launcher3/util/Z$c;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mContext:Landroid/content/Context;

    .line 103
    .line 104
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p2, p1, p3, v0}, Lcom/android/quickstep/OrientationTouchTransformer;->setNavigationMode(Lcom/android/launcher3/util/C1;Lcom/android/launcher3/util/Z$c;Landroid/content/res/Resources;)V

    .line 109
    .line 110
    .line 111
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    iget-object p3, p0, Lcom/android/quickstep/RotationTouchHelper;->mFrozenTaskListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 116
    .line 117
    invoke-virtual {p2, p3}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 118
    .line 119
    .line 120
    invoke-direct {p0, p1}, Lcom/android/quickstep/RotationTouchHelper;->hasGestures(Lcom/android/launcher3/util/C1;)Z

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    if-eqz p2, :cond_2

    .line 125
    .line 126
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    iget-object p3, p0, Lcom/android/quickstep/RotationTouchHelper;->mFrozenTaskListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 131
    .line 132
    invoke-virtual {p2, p3}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->registerTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 133
    .line 134
    .line 135
    :cond_2
    iput-object p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mMode:Lcom/android/launcher3/util/C1;

    .line 136
    .line 137
    :cond_3
    return-void
.end method

.method onEndTargetCalculated(Lcom/android/quickstep/GestureState$GestureEndTarget;Lcom/android/quickstep/BaseContainerInterface;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne p1, v0, :cond_1

    .line 6
    .line 7
    iput-boolean v1, p0, Lcom/android/quickstep/RotationTouchHelper;->mInOverview:Z

    .line 8
    .line 9
    iget-boolean p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mTaskListFrozen:Z

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, v2}, Lcom/android/quickstep/RotationTouchHelper;->enableMultipleRegions(Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mExitOverviewRunnable:Ljava/lang/Runnable;

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Lcom/android/quickstep/BaseContainerInterface;->onExitOverview(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    sget-object p2, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 23
    .line 24
    if-eq p1, p2, :cond_7

    .line 25
    .line 26
    sget-object p2, Lcom/android/quickstep/GestureState$GestureEndTarget;->ALL_APPS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 27
    .line 28
    if-ne p1, p2, :cond_2

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_2
    sget-object p2, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 32
    .line 33
    if-ne p1, p2, :cond_4

    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/android/quickstep/OrientationTouchTransformer;->getQuickStepStartingRotation()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/4 p2, -0x1

    .line 42
    if-ne p1, p2, :cond_3

    .line 43
    .line 44
    invoke-direct {p0, v1}, Lcom/android/quickstep/RotationTouchHelper;->enableMultipleRegions(Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/quickstep/OrientationTouchTransformer;->getCurrentActiveRotation()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    invoke-direct {p0, p1}, Lcom/android/quickstep/RotationTouchHelper;->notifySysuiOfCurrentRotation(I)V

    .line 55
    .line 56
    .line 57
    :goto_0
    iput-boolean v2, p0, Lcom/android/quickstep/RotationTouchHelper;->mPrioritizeDeviceRotation:Z

    .line 58
    .line 59
    return-void

    .line 60
    :cond_4
    sget-object p2, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 61
    .line 62
    if-ne p1, p2, :cond_6

    .line 63
    .line 64
    iget-boolean p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mTaskListFrozen:Z

    .line 65
    .line 66
    if-nez p1, :cond_5

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_5
    iget-object p1, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/android/quickstep/OrientationTouchTransformer;->getCurrentActiveRotation()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-direct {p0, p1}, Lcom/android/quickstep/RotationTouchHelper;->notifySysuiOfCurrentRotation(I)V

    .line 76
    .line 77
    .line 78
    :cond_6
    :goto_1
    return-void

    .line 79
    :cond_7
    :goto_2
    invoke-direct {p0, v2}, Lcom/android/quickstep/RotationTouchHelper;->enableMultipleRegions(Z)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onStartGesture()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mTaskListFrozen:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/OrientationTouchTransformer;->getCurrentActiveRotation()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-direct {p0, v0}, Lcom/android/quickstep/RotationTouchHelper;->notifySysuiOfCurrentRotation(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method resetLastRectTouched()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/OrientationTouchTransformer;->resetLastRectTouched()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setActivityTouchRotationAsDisplay()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayRotation:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/quickstep/OrientationTouchTransformer;->setActivityTouchRotationAsDisplay(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method setGesturalHeight(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/RotationTouchHelper;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/Z;->v(Landroid/content/Context;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 12
    .line 13
    iget p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayId:I

    .line 14
    .line 15
    invoke-virtual {v2, p0}, Lcom/android/launcher3/util/Z;->x(I)Lcom/android/launcher3/util/Z$c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v1, p1, p0, v0}, Lcom/android/quickstep/OrientationTouchTransformer;->setGesturalHeight(ILcom/android/launcher3/util/Z$c;Landroid/content/res/Resources;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method setOrientationTransformIfNeeded(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    cmpg-float v0, v0, v1

    .line 7
    .line 8
    if-ltz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    cmpg-float v0, v0, v1

    .line 15
    .line 16
    if-gez v0, :cond_1

    .line 17
    .line 18
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/android/quickstep/OrientationTouchTransformer;->transform(Landroid/view/MotionEvent;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public touchInAssistantRegion(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/OrientationTouchTransformer;->touchInAssistantRegion(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public touchInLeftAssistantRegion(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/OrientationTouchTransformer;->touchInLeftAssistantRegion(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public touchInOneHandedModeRegion(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/OrientationTouchTransformer;->touchInOneHandedModeRegion(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public updateGestureTouchRegions()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mMode:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/quickstep/RotationTouchHelper;->hasGestures(Lcom/android/launcher3/util/C1;)Z

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
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper;->mOrientationTouchTransformer:Lcom/android/quickstep/OrientationTouchTransformer;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayController:Lcom/android/launcher3/util/Z;

    .line 13
    .line 14
    iget p0, p0, Lcom/android/quickstep/RotationTouchHelper;->mDisplayId:I

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/Z;->x(I)Lcom/android/launcher3/util/Z$c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v1, "RTH.updateGestureTouchRegions"

    .line 21
    .line 22
    invoke-virtual {v0, p0, v1}, Lcom/android/quickstep/OrientationTouchTransformer;->createOrAddTouchRegion(Lcom/android/launcher3/util/Z$c;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
