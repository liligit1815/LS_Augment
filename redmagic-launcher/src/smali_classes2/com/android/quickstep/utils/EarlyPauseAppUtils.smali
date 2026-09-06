.class public Lcom/android/quickstep/utils/EarlyPauseAppUtils;
.super Ljava/lang/Object;
.source "EarlyPauseAppUtils.java"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# static fields
.field private static final BLACK_LIST_APPS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final BLACK_LIST_COMPONENT:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation
.end field

.field public static final INSTANCE:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/utils/EarlyPauseAppUtils;",
            ">;"
        }
    .end annotation
.end field

.field private static final PAUSE_ADVANCE_ENABLED:Z

.field private static final TAG:Ljava/lang/String; = "EarlyPauseAppUtils"

.field private static final UNSET_PAUSE_ADVANCE_TIMEOUT:J = 0x320L


# instance fields
.field private mActivityManagerService:Landroid/app/IActivityManager;

.field private mAudioManage:Landroid/media/AudioManager;

.field private mAudioPlaybackCallback:Landroid/media/AudioManager$AudioPlaybackCallback;

.field private volatile mCallSetPauseAdvance:Z

.field private mContext:Landroid/content/Context;

.field private mGetPkgNameByPid:Ljava/lang/reflect/Method;

.field private volatile mOldPlayTrackPidList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mPlayTrackPkgList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mTaskIdArray:[I

.field private mUnsetPauseAdvanceRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "persist.zte.quickstep.pauseadvance"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sput-boolean v0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->PAUSE_ADVANCE_ENABLED:Z

    .line 9
    .line 10
    const-string v0, "tv.danmaku.bili"

    .line 11
    .line 12
    filled-new-array {v0}, [Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->BLACK_LIST_APPS:Ljava/util/List;

    .line 21
    .line 22
    new-instance v0, Landroid/content/ComponentName;

    .line 23
    .line 24
    const-string v1, "com.zte.videoplayer"

    .line 25
    .line 26
    const-string v2, "com.zte.videoplayer.VideoPlayerActivity"

    .line 27
    .line 28
    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    filled-new-array {v0}, [Landroid/content/ComponentName;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->BLACK_LIST_COMPONENT:Ljava/util/List;

    .line 40
    .line 41
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 42
    .line 43
    new-instance v1, Lcom/android/quickstep/utils/n;

    .line 44
    .line 45
    invoke-direct {v1}, Lcom/android/quickstep/utils/n;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 49
    .line 50
    .line 51
    sput-object v0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 52
    .line 53
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mOldPlayTrackPidList:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mPlayTrackPkgList:Ljava/util/ArrayList;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mCallSetPauseAdvance:Z

    .line 20
    .line 21
    new-instance v1, Lcom/android/quickstep/utils/l;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcom/android/quickstep/utils/l;-><init>(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mUnsetPauseAdvanceRunnable:Ljava/lang/Runnable;

    .line 27
    .line 28
    const/4 v1, -0x1

    .line 29
    filled-new-array {v1, v1}, [I

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mTaskIdArray:[I

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mContext:Landroid/content/Context;

    .line 40
    .line 41
    const-string v1, "audio"

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Landroid/media/AudioManager;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mAudioManage:Landroid/media/AudioManager;

    .line 50
    .line 51
    invoke-static {}, Landroid/app/ActivityManager;->getService()Landroid/app/IActivityManager;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mActivityManagerService:Landroid/app/IActivityManager;

    .line 56
    .line 57
    :try_start_0
    const-class p1, Landroid/app/IActivityManager;

    .line 58
    .line 59
    const-string v1, "getPkgNameByPid"

    .line 60
    .line 61
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 62
    .line 63
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {p1, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mGetPkgNameByPid:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catch_0
    move-exception p1

    .line 75
    const-string v1, "EarlyPauseAppUtils"

    .line 76
    .line 77
    const-string v2, "init getPkgNameByPid err"

    .line 78
    .line 79
    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 80
    .line 81
    .line 82
    :goto_0
    iget-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mContext:Landroid/content/Context;

    .line 83
    .line 84
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    sget-object v1, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 89
    .line 90
    if-ne p1, v1, :cond_0

    .line 91
    .line 92
    const/4 v0, 0x1

    .line 93
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->handleNavigationGestureChanged(Z)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->lambda$handleNavigationGestureChanged$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->lambda$unSetPauseAdvance$3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->getPlayTrackInfo()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/utils/EarlyPauseAppUtils;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->lambda$setPauseAdvance$1(Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/utils/EarlyPauseAppUtils;Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->lambda$setPauseAdvance$2(Landroid/app/ActivityManager$RunningTaskInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getActivePids(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mAudioManage:Landroid/media/AudioManager;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/media/AudioManager;->getActivePids()[I

    .line 7
    .line 8
    .line 9
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    goto :goto_0

    .line 11
    :catch_0
    move-exception p0

    .line 12
    const-string v2, "EarlyPauseAppUtils"

    .line 13
    .line 14
    const-string v3, "getActivePids err "

    .line 15
    .line 16
    invoke-static {v2, v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 17
    .line 18
    .line 19
    :goto_0
    array-length p0, v1

    .line 20
    :goto_1
    if-ge v0, p0, :cond_1

    .line 21
    .line 22
    aget v2, v1, v0

    .line 23
    .line 24
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-nez v3, :cond_0

    .line 33
    .line 34
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    return-void
.end method

.method private getPkgNameByPid(I)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mGetPkgNameByPid:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->getPkgNameByPidOld(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mActivityManagerService:Landroid/app/IActivityManager;

    .line 11
    .line 12
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    return-object p0

    .line 27
    :catch_0
    move-exception p0

    .line 28
    const-string p1, "EarlyPauseAppUtils"

    .line 29
    .line 30
    const-string v0, "getPkgNameByPid err "

    .line 31
    .line 32
    invoke-static {p1, v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method

.method private getPkgNameByPidOld(I)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "activity"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/app/ActivityManager;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 32
    .line 33
    iget v1, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    .line 34
    .line 35
    if-ne v1, p1, :cond_0

    .line 36
    .line 37
    iget-object v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->pkgList:[Ljava/lang/String;

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    array-length v1, v0

    .line 42
    if-lez v1, :cond_0

    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    aget-object p0, v0, p0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const-string p0, ""

    .line 49
    .line 50
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v1, "getPkgNameByPidOld pkgName = "

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", pid = "

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const-string v0, "EarlyPauseAppUtils"

    .line 76
    .line 77
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    return-object p0
.end method

.method private getPlayTrackInfo()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mPlayTrackPkgList:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mPlayTrackPkgList:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, v0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->getActivePids(Ljava/util/ArrayList;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-ge v1, v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-direct {p0, v2}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->getPkgNameByPid(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v3, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mPlayTrackPkgList:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    new-instance v3, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v4, "getPlayTrackInfo pkg = "

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const-string v3, "EarlyPauseAppUtils"

    .line 63
    .line 64
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    add-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    :goto_1
    return-void
.end method

.method private init()V
    .locals 2

    .line 1
    const-string v0, "EarlyPauseAppUtils"

    .line 2
    .line 3
    const-string v1, "init"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 9
    .line 10
    new-instance v1, Lcom/android/quickstep/utils/k;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/android/quickstep/utils/k;-><init>(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->initAudioManagerPlaybackListener()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private initAudioManagerPlaybackListener()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/utils/EarlyPauseAppUtils$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils$1;-><init>(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mAudioPlaybackCallback:Landroid/media/AudioManager$AudioPlaybackCallback;

    .line 7
    .line 8
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mAudioManage:Landroid/media/AudioManager;

    .line 9
    .line 10
    sget-object v1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0, v0, v1}, Landroid/media/AudioManager;->registerAudioPlaybackCallback(Landroid/media/AudioManager$AudioPlaybackCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    const-string v0, "EarlyPauseAppUtils"

    .line 22
    .line 23
    const-string v1, "unregisterAudioPlaybackCallback err "

    .line 24
    .line 25
    invoke-static {v0, v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private isPlayingChange(Ljava/util/ArrayList;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mOldPlayTrackPidList:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mOldPlayTrackPidList:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mOldPlayTrackPidList:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    xor-int/lit8 v1, v0, 0x1

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mOldPlayTrackPidList:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mOldPlayTrackPidList:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    :cond_1
    return v1

    .line 37
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method static bridge synthetic j(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mOldPlayTrackPidList:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic lambda$handleNavigationGestureChanged$0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mOldPlayTrackPidList:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mPlayTrackPkgList:Ljava/util/ArrayList;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mOldPlayTrackPidList:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mPlayTrackPkgList:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic lambda$setPauseAdvance$1(Ljava/util/HashMap;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mTaskIdArray:[I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, -0x1

    .line 5
    aput v2, v0, v1

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    aput v2, v0, v3

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    move v4, v3

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    if-eqz v5, :cond_1

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    check-cast v5, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    check-cast v6, Ljava/lang/Integer;

    .line 36
    .line 37
    iget-object v7, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mPlayTrackPkgList:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    if-eqz v5, :cond_0

    .line 44
    .line 45
    if-eqz v6, :cond_0

    .line 46
    .line 47
    const/4 v5, 0x2

    .line 48
    if-ge v4, v5, :cond_0

    .line 49
    .line 50
    iget-object v5, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mTaskIdArray:[I

    .line 51
    .line 52
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    aput v6, v5, v4

    .line 57
    .line 58
    add-int/lit8 v4, v4, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mTaskIdArray:[I

    .line 62
    .line 63
    aget v3, v0, v3

    .line 64
    .line 65
    if-ne v3, v2, :cond_2

    .line 66
    .line 67
    aget v0, v0, v1

    .line 68
    .line 69
    if-ne v0, v2, :cond_2

    .line 70
    .line 71
    new-instance p0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    const-string v0, "setPauseAdvance isMusicActive false "

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const-string p1, "EarlyPauseAppUtils"

    .line 89
    .line 90
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    sget-boolean p1, Lcom/android/launcher3/N5;->g:Z

    .line 95
    .line 96
    if-eqz p1, :cond_3

    .line 97
    .line 98
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 99
    .line 100
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mContext:Landroid/content/Context;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Lcom/android/quickstep/SystemUiProxy;

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/android/quickstep/SystemUiProxy;->setPipAnimationTypeToAlpha()V

    .line 109
    .line 110
    .line 111
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mTaskIdArray:[I

    .line 112
    .line 113
    invoke-static {p1}, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->setPauseAdvance([I)V

    .line 114
    .line 115
    .line 116
    iput-boolean v1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mCallSetPauseAdvance:Z

    .line 117
    .line 118
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 119
    .line 120
    invoke-virtual {p1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iget-object p0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mUnsetPauseAdvanceRunnable:Ljava/lang/Runnable;

    .line 125
    .line 126
    const-wide/16 v0, 0x320

    .line 127
    .line 128
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 129
    .line 130
    .line 131
    invoke-static {}, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->finishNoDisplayActivity()V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method private synthetic lambda$setPauseAdvance$2(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mPlayTrackPkgList:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance p0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v0, "setPauseAdvance isMusicActive false "

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "EarlyPauseAppUtils"

    .line 39
    .line 40
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mTaskIdArray:[I

    .line 45
    .line 46
    const/4 v1, 0x1

    .line 47
    const/4 v2, -0x1

    .line 48
    aput v2, v0, v1

    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    aput v2, v0, v3

    .line 52
    .line 53
    iget p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 54
    .line 55
    aput p1, v0, v3

    .line 56
    .line 57
    sget-boolean p1, Lcom/android/launcher3/N5;->g:Z

    .line 58
    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mContext:Landroid/content/Context;

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Lcom/android/quickstep/SystemUiProxy;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/android/quickstep/SystemUiProxy;->setPipAnimationTypeToAlpha()V

    .line 72
    .line 73
    .line 74
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mTaskIdArray:[I

    .line 75
    .line 76
    invoke-static {p1}, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->setPauseAdvance([I)V

    .line 77
    .line 78
    .line 79
    iput-boolean v1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mCallSetPauseAdvance:Z

    .line 80
    .line 81
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 82
    .line 83
    invoke-virtual {p1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mUnsetPauseAdvanceRunnable:Ljava/lang/Runnable;

    .line 88
    .line 89
    const-wide/16 v0, 0x320

    .line 90
    .line 91
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 92
    .line 93
    .line 94
    invoke-static {}, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->finishNoDisplayActivity()V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method private synthetic lambda$unSetPauseAdvance$3()V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mUnsetPauseAdvanceRunnable:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->unSetPauseAdvance()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mTaskIdArray:[I

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    const/4 v2, -0x1

    .line 19
    aput v2, v0, v1

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    aput v2, v0, v1

    .line 23
    .line 24
    iput-boolean v1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mCallSetPauseAdvance:Z

    .line 25
    .line 26
    return-void
.end method

.method static bridge synthetic n(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mPlayTrackPkgList:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method private static shouldPauseAdvance(Landroid/view/RemoteAnimationTarget;)Z
    .locals 1

    if-eqz p0, :cond_1

    .line 2
    iget-object p0, p0, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    if-eqz p0, :cond_1

    iget-object p0, p0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    if-nez p0, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    sget-object v0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->BLACK_LIST_COMPONENT:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method private static shouldPauseAdvance(Lcom/android/quickstep/RemoteAnimationTargets;)Z
    .locals 0

    if-eqz p0, :cond_0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    if-eqz p0, :cond_0

    array-length p0, p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static shouldPauseAdvance(Ljava/lang/String;)Z
    .locals 1

    .line 4
    sget-object v0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->BLACK_LIST_APPS:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method static bridge synthetic t(Lcom/android/quickstep/utils/EarlyPauseAppUtils;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->getActivePids(Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private unregisterAudioManagerPlaybackListener()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mAudioPlaybackCallback:Landroid/media/AudioManager$AudioPlaybackCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget-object v1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mAudioManage:Landroid/media/AudioManager;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/media/AudioManager;->unregisterAudioPlaybackCallback(Landroid/media/AudioManager$AudioPlaybackCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catch_0
    move-exception v0

    .line 12
    const-string v1, "EarlyPauseAppUtils"

    .line 13
    .line 14
    const-string v2, "unregisterAudioPlaybackCallback err "

    .line 15
    .line 16
    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 17
    .line 18
    .line 19
    :goto_0
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mAudioPlaybackCallback:Landroid/media/AudioManager$AudioPlaybackCallback;

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method static bridge synthetic v(Lcom/android/quickstep/utils/EarlyPauseAppUtils;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->getPkgNameByPid(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic w(Lcom/android/quickstep/utils/EarlyPauseAppUtils;Ljava/util/ArrayList;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->isPlayingChange(Ljava/util/ArrayList;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->unregisterAudioManagerPlaybackListener()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mAudioManage:Landroid/media/AudioManager;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mActivityManagerService:Landroid/app/IActivityManager;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mOldPlayTrackPidList:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mPlayTrackPkgList:Ljava/util/ArrayList;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mContext:Landroid/content/Context;

    .line 14
    .line 15
    return-void
.end method

.method public handleNavigationGestureChanged(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "handleNavigationGestureChanged isUsingGestureNav = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "EarlyPauseAppUtils"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mAudioPlaybackCallback:Landroid/media/AudioManager$AudioPlaybackCallback;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->init()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void

    .line 33
    :cond_1
    invoke-direct {p0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->unregisterAudioManagerPlaybackListener()V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 37
    .line 38
    new-instance v0, Lcom/android/quickstep/utils/i;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Lcom/android/quickstep/utils/i;-><init>(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public setPauseAdvance(Landroid/view/RemoteAnimationTarget;)V
    .locals 4

    .line 24
    sget-boolean v0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->PAUSE_ADVANCE_ENABLED:Z

    const-string v1, "EarlyPauseAppUtils"

    if-nez v0, :cond_0

    .line 25
    const-string p0, "PAUSE_ADVANCE_ENABLED false"

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 26
    :cond_0
    invoke-static {p1}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->shouldPauseAdvance(Landroid/view/RemoteAnimationTarget;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 27
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "setPauseAdvance taskInfo = "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 28
    :cond_1
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 29
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    .line 30
    invoke-virtual {v0}, Landroid/app/Activity;->isInMultiWindowMode()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    move v0, v2

    .line 31
    :goto_0
    invoke-static {}, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->hasSetPauseAdvanceMethod()Z

    move-result v3

    if-eqz v3, :cond_3

    if-nez v0, :cond_3

    .line 32
    iput-boolean v2, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mCallSetPauseAdvance:Z

    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setPauseAdvance mPlayTrackPkgList "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mPlayTrackPkgList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    sget-object v2, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    new-instance v3, Lcom/android/quickstep/utils/m;

    invoke-direct {v3, p0, p1}, Lcom/android/quickstep/utils/m;-><init>(Lcom/android/quickstep/utils/EarlyPauseAppUtils;Landroid/app/ActivityManager$RunningTaskInfo;)V

    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 35
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    const-string p1, "setPauseAdvance return. isInMultiWindowMode "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    const-string p1, ", hasSetPauseAdvanceMethod "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    invoke-static {}, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->hasSetPauseAdvanceMethod()Z

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setPauseAdvance(Lcom/android/quickstep/RemoteAnimationTargets;Landroid/view/RemoteAnimationTarget;)V
    .locals 6

    .line 1
    sget-boolean v0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->PAUSE_ADVANCE_ENABLED:Z

    const-string v1, "EarlyPauseAppUtils"

    if-nez v0, :cond_0

    .line 2
    const-string p0, "PAUSE_ADVANCE_ENABLED false"

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 3
    :cond_0
    invoke-static {p1}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->shouldPauseAdvance(Lcom/android/quickstep/RemoteAnimationTargets;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setPauseAdvance remoteAnimationTargets = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    invoke-virtual {p0, p2}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->setPauseAdvance(Landroid/view/RemoteAnimationTarget;)V

    return-void

    .line 6
    :cond_1
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 7
    iget-object p1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    array-length v0, p1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_3

    aget-object v4, p1, v3

    if-eqz v4, :cond_2

    .line 8
    iget-object v5, v4, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    if-eqz v5, :cond_2

    iget-object v5, v5, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    if-eqz v5, :cond_2

    .line 9
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 10
    invoke-static {v4}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->shouldPauseAdvance(Landroid/view/RemoteAnimationTarget;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 11
    iget-object v5, v4, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    iget-object v5, v5, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v5

    iget-object v4, v4, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    iget v4, v4, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p2, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 12
    :cond_3
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 13
    invoke-virtual {p1}, Landroid/app/Activity;->isInMultiWindowMode()Z

    move-result p1

    if-eqz p1, :cond_4

    const/4 p1, 0x1

    goto :goto_1

    :cond_4
    move p1, v2

    .line 14
    :goto_1
    invoke-static {}, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->hasSetPauseAdvanceMethod()Z

    move-result v0

    if-eqz v0, :cond_5

    if-nez p1, :cond_5

    .line 15
    iput-boolean v2, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mCallSetPauseAdvance:Z

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setPauseAdvance mPlayTrackPkgList "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mPlayTrackPkgList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "-packageNameTaskId: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    new-instance v2, Lcom/android/quickstep/utils/o;

    invoke-direct {v2, p0, p2}, Lcom/android/quickstep/utils/o;-><init>(Lcom/android/quickstep/utils/EarlyPauseAppUtils;Ljava/util/HashMap;)V

    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 18
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    const-string p2, "setPauseAdvance return. isInMultiWindowMode "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    const-string p1, ", hasSetPauseAdvanceMethod "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    invoke-static {}, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->hasSetPauseAdvanceMethod()Z

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public unSetPauseAdvance()V
    .locals 4

    .line 1
    sget-boolean v0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->PAUSE_ADVANCE_ENABLED:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "unSetPauseAdvance sCallSetPauseAdvance "

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-boolean v1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mCallSetPauseAdvance:Z

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, ", mTaskIdArray[0]="

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mTaskIdArray:[I

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    aget v1, v1, v2

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", mTaskIdArray[1]="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mTaskIdArray:[I

    .line 39
    .line 40
    const/4 v3, 0x1

    .line 41
    aget v1, v1, v3

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "EarlyPauseAppUtils"

    .line 51
    .line 52
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    iget-boolean v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mCallSetPauseAdvance:Z

    .line 56
    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->mTaskIdArray:[I

    .line 60
    .line 61
    aget v0, v0, v2

    .line 62
    .line 63
    const/4 v1, -0x1

    .line 64
    if-eq v0, v1, :cond_0

    .line 65
    .line 66
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 67
    .line 68
    new-instance v1, Lcom/android/quickstep/utils/j;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Lcom/android/quickstep/utils/j;-><init>(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 74
    .line 75
    .line 76
    :cond_0
    return-void
.end method
