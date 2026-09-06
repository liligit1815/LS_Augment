.class public Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;
.super Ljava/lang/Object;
.source "SplitSelectStateController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/SplitSelectStateController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SplitFromDesktopController"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SplitFromDesktopController"


# instance fields
.field private mAppIcon:Landroid/graphics/drawable/Drawable;

.field private final mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private final mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

.field private final mSplitPlaceholderInset:I

.field private final mSplitPlaceholderSize:I

.field private mSplitSelectListener:Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;

.field private mTaskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

.field final synthetic this$0:Lcom/android/quickstep/util/SplitSelectStateController;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/util/SplitSelectStateController;Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 7
    .line 8
    sget-object p1, Lcom/android/quickstep/OverviewComponentObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/android/quickstep/OverviewComponentObserver;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 17
    .line 18
    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const v0, 0x7f070a90

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mSplitPlaceholderSize:I

    .line 30
    .line 31
    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const v0, 0x7f070a8f

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mSplitPlaceholderInset:I

    .line 43
    .line 44
    new-instance p1, Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;

    .line 45
    .line 46
    invoke-direct {p1, p0}, Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;-><init>(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mSplitSelectListener:Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;

    .line 50
    .line 51
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/android/quickstep/SystemUiProxy;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mSplitSelectListener:Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Lcom/android/quickstep/SystemUiProxy;->registerSplitSelectListener(Lcom/android/wm/shell/splitscreen/c;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->lambda$enterSplitSelect$0(Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mAppIcon:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mSplitPlaceholderInset:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mSplitPlaceholderSize:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)Landroid/app/ActivityManager$RunningTaskInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mTaskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic lambda$enterSplitSelect$0(Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 3

    .line 1
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x3

    .line 6
    invoke-virtual {v0, v1}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/app/ActivityOptions;->setTransientLaunch()Landroid/app/ActivityOptions;

    .line 10
    .line 11
    .line 12
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/android/quickstep/SystemUiProxy;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/OverviewComponentObserver;->getOverviewIntent()Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {v1, p0, v0, p1, v2}, Lcom/android/quickstep/SystemUiProxy;->startRecentsActivity(Landroid/content/Intent;Landroid/app/ActivityOptions;Lcom/android/systemui/shared/system/RecentsAnimationListener;Z)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public enterSplitSelect(Landroid/app/ActivityManager$RunningTaskInfo;ILandroid/graphics/Rect;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mTaskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 2
    .line 3
    iget-object p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->realActivity:Landroid/content/ComponentName;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ls1/T;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-direct {v1, v2}, Ls1/T;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    :try_start_0
    iget-object v2, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mTaskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 31
    .line 32
    iget-object v2, v2, Landroid/app/ActivityManager$RunningTaskInfo;->baseActivity:Landroid/content/ComponentName;

    .line 33
    .line 34
    const-wide/16 v3, 0x0

    .line 35
    .line 36
    invoke-static {v3, v4}, Landroid/content/pm/PackageManager$ComponentInfoFlags;->of(J)Landroid/content/pm/PackageManager$ComponentInfoFlags;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v0, v2, v3}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;Landroid/content/pm/PackageManager$ComponentInfoFlags;)Landroid/content/pm/ActivityInfo;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v1, v0}, Ls1/T;->j(Landroid/content/pm/ComponentInfo;)Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mAppIcon:Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    new-instance v1, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    const-string v2, "Package not found: "

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string v1, "SplitFromDesktopController"

    .line 70
    .line 71
    invoke-static {v1, p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 72
    .line 73
    .line 74
    :goto_0
    new-instance p1, Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 75
    .line 76
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 79
    .line 80
    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 89
    .line 90
    invoke-direct {p1, v0}, Lcom/android/quickstep/RecentsAnimationCallbacks;-><init>(Lcom/android/quickstep/SystemUiProxy;)V

    .line 91
    .line 92
    .line 93
    new-instance v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;

    .line 94
    .line 95
    invoke-direct {v0, p0, p2, p3}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;-><init>(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;ILandroid/graphics/Rect;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1, v0}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 99
    .line 100
    .line 101
    sget-object p2, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 102
    .line 103
    new-instance p3, Lcom/android/quickstep/util/Y0;

    .line 104
    .line 105
    invoke-direct {p3, p0, p1}, Lcom/android/quickstep/util/Y0;-><init>(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p2, p3}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method onDestroy()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

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
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mSplitSelectListener:Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/quickstep/SystemUiProxy;->unregisterSplitSelectListener(Lcom/android/wm/shell/splitscreen/c;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mSplitSelectListener:Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;->release()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->mSplitSelectListener:Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;

    .line 23
    .line 24
    return-void
.end method
