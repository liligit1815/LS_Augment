.class public Lcom/android/launcher3/resource/o0;
.super Ljava/lang/Object;
.source "ResourceState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/resource/o0$a;
    }
.end annotation


# static fields
.field private static volatile o:Landroid/content/Context;

.field private static volatile p:Lcom/android/launcher3/resource/o0;

.field private static q:Lcom/android/launcher3/resource/ResourceDatabaseProvider;

.field private static final r:Landroid/os/HandlerThread;

.field private static final s:Landroid/os/Handler;


# instance fields
.field a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/launcher3/H5$i;",
            ">;"
        }
    .end annotation
.end field

.field b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/launcher3/H5$h;",
            ">;"
        }
    .end annotation
.end field

.field private c:Lcom/android/launcher3/resource/o0$a;

.field private d:Lcom/android/launcher3/resource/j;

.field private e:Lcom/android/launcher3/resource/z;

.field private f:Landroid/content/res/Resources;

.field private g:Landroid/content/pm/LauncherApps;

.field private h:LD1/t;

.field private i:Lcom/android/launcher3/resource/g0;

.field private j:Lcom/android/launcher3/resource/K$c;

.field private k:Landroid/content/SharedPreferences;

.field private l:Lcom/android/launcher3/H5$c;

.field private m:Lcom/android/launcher3/util/j2;

.field private n:Lcom/android/launcher3/resource/p;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    const-string v1, "resource-loader"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/resource/o0;->r:Landroid/os/HandlerThread;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 11
    .line 12
    .line 13
    new-instance v1, Landroid/os/Handler;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 20
    .line 21
    .line 22
    sput-object v1, Lcom/android/launcher3/resource/o0;->s:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v2, "static initializer: loader thread id: "

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getThreadId()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "R-Loader"

    .line 46
    .line 47
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->k:Landroid/content/SharedPreferences;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->m:Lcom/android/launcher3/util/j2;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->n:Lcom/android/launcher3/resource/p;

    .line 10
    .line 11
    sget-object v1, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    new-instance v1, Lcom/android/launcher3/resource/g0;

    .line 16
    .line 17
    sget-object v2, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 18
    .line 19
    invoke-direct {v1, v2}, Lcom/android/launcher3/resource/g0;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lcom/android/launcher3/resource/o0;->i:Lcom/android/launcher3/resource/g0;

    .line 23
    .line 24
    new-instance v1, Lcom/android/launcher3/resource/o0$a;

    .line 25
    .line 26
    invoke-direct {v1}, Lcom/android/launcher3/resource/o0$a;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/android/launcher3/resource/o0;->c:Lcom/android/launcher3/resource/o0$a;

    .line 30
    .line 31
    new-instance v1, Lcom/android/launcher3/resource/j;

    .line 32
    .line 33
    invoke-direct {v1}, Lcom/android/launcher3/resource/j;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/android/launcher3/resource/o0;->d:Lcom/android/launcher3/resource/j;

    .line 37
    .line 38
    new-instance v1, Lcom/android/launcher3/resource/z;

    .line 39
    .line 40
    sget-object v2, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 41
    .line 42
    invoke-direct {v1, v2}, Lcom/android/launcher3/resource/z;-><init>(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/android/launcher3/resource/o0;->e:Lcom/android/launcher3/resource/z;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->f:Landroid/content/res/Resources;

    .line 48
    .line 49
    sget-object v0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 50
    .line 51
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->g:Landroid/content/pm/LauncherApps;

    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 63
    .line 64
    const-string v0, "ResourceState inited before app context set"

    .line 65
    .line 66
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw p0
.end method

.method static C(Ljava/lang/Runnable;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/resource/o0;->s:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/os/Handler;->hasCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private D()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/resource/m0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/m0;-><init>(Lcom/android/launcher3/resource/o0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private E()V
    .locals 1

    .line 1
    sget-object p0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "cached"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    const-string p0, "R-Loader"

    .line 25
    .line 26
    const-string v0, "initWallpaperCachePath mkdirs fail! "

    .line 27
    .line 28
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method static varargs I(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method private synthetic L()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/o0;->E()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/resource/K;->E(Landroid/content/Context;)Lcom/android/launcher3/resource/K$c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->j:Lcom/android/launcher3/resource/K$c;

    .line 11
    .line 12
    return-void
.end method

.method static M(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/resource/o0;->s:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method static P(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/resource/o0;->r:Landroid/os/HandlerThread;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getThreadId()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {}, Landroid/os/Process;->myTid()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object v0, Lcom/android/launcher3/resource/o0;->s:Landroid/os/Handler;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method static Q(Ljava/lang/Runnable;J)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/resource/o0;->s:Landroid/os/Handler;

    .line 2
    .line 3
    const/16 v1, 0x65

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;IJ)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method static R(Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v1, "R-Loader"

    .line 12
    .line 13
    const-string v2, "Start runOnMainThread"

    .line 14
    .line 15
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, p0}, Lcom/android/launcher3/H5$i;->j(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public static Y(Landroid/content/Context;)V
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object v0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "ResourceState setApplicationContext called twice! old="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    sget-object v1, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, " new="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "R-Loader"

    .line 36
    .line 37
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sput-object p0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/resource/o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/o0;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method static c0(Lcom/android/launcher3/resource/ResourceDatabaseProvider;)V
    .locals 2

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const-string v1, "setResourceProvider init "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    sput-object p0, Lcom/android/launcher3/resource/o0;->q:Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 9
    .line 10
    return-void
.end method

.method static h()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method public static l()Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "persist.sys.icon_config_mask"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    const-string v0, "LAUNCHER_DEFAULT_ICON"

    .line 17
    .line 18
    return-object v0
.end method

.method public static m()Ljava/lang/String;
    .locals 6

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v1, v2}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v2, "android.mifavor.ThemeManager"

    .line 16
    .line 17
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-string v3, "getInstance"

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    new-array v5, v4, [Ljava/lang/Class;

    .line 25
    .line 26
    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    new-array v4, v4, [Ljava/lang/Object;

    .line 31
    .line 32
    const/4 v5, 0x0

    .line 33
    invoke-virtual {v3, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const-string v4, "getCurrentThemeNameForIcon"

    .line 38
    .line 39
    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 40
    .line 41
    filled-new-array {v5}, [Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Ljava/lang/String;

    .line 62
    .line 63
    new-instance v3, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string v4, "getCurrentThemeIdFromSys themeId: "

    .line 69
    .line 70
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v4, " ,userId: "

    .line 77
    .line 78
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :catch_0
    const-string v1, "persist.sys.theme_name"

    .line 93
    .line 94
    const-string v2, ""

    .line 95
    .line 96
    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .line 104
    .line 105
    const-string v3, "getCurrentThemeIdFromSys from persist.sys: "

    .line 106
    .line 107
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_0

    .line 125
    .line 126
    return-object v2

    .line 127
    :cond_0
    const-string v0, "LAUNCHER_DEFAULT_ICON"

    .line 128
    .line 129
    return-object v0
.end method

.method public static n()Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "persist.sys.theme_pkg_version"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    return-object v1
.end method

.method public static o()Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "persist.sys.icon_close_third_beautify"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    const-string v0, "0"

    .line 17
    .line 18
    return-object v0
.end method

.method static q()Lcom/android/launcher3/resource/o0;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/resource/o0;->p:Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/android/launcher3/resource/o0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/android/launcher3/resource/o0;->p:Lcom/android/launcher3/resource/o0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/android/launcher3/resource/o0;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/android/launcher3/resource/o0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/android/launcher3/resource/o0;->p:Lcom/android/launcher3/resource/o0;

    .line 18
    .line 19
    sget-object v1, Lcom/android/launcher3/resource/o0;->p:Lcom/android/launcher3/resource/o0;

    .line 20
    .line 21
    invoke-direct {v1}, Lcom/android/launcher3/resource/o0;->D()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception v1

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    sget-object v1, Lcom/android/launcher3/resource/o0;->p:Lcom/android/launcher3/resource/o0;

    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return-object v1

    .line 31
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw v1

    .line 33
    :cond_1
    sget-object v0, Lcom/android/launcher3/resource/o0;->p:Lcom/android/launcher3/resource/o0;

    .line 34
    .line 35
    return-object v0
.end method

.method static r()Lcom/android/launcher3/resource/o0;
    .locals 2

    .line 1
    const-class v0, Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/android/launcher3/resource/o0;->p:Lcom/android/launcher3/resource/o0;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object v1

    .line 8
    :catchall_0
    move-exception v1

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw v1
.end method

.method private s()Landroid/content/pm/LauncherApps;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->g:Landroid/content/pm/LauncherApps;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 6
    .line 7
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->g:Landroid/content/pm/LauncherApps;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->g:Landroid/content/pm/LauncherApps;

    .line 18
    .line 19
    return-object p0
.end method

.method static v(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    .line 1
    const-string v0, "MiFavor_settings"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static x()Lcom/android/launcher3/resource/g0;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/resource/o0;->p:Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    return-object v0

    .line 7
    :cond_0
    sget-object v0, Lcom/android/launcher3/resource/o0;->p:Lcom/android/launcher3/resource/o0;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/android/launcher3/resource/o0;->i:Lcom/android/launcher3/resource/g0;

    .line 10
    .line 11
    return-object v0
.end method

.method public static y(Landroid/content/Context;)Lcom/android/launcher3/resource/g0;
    .locals 2

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const-string v1, "getResourceManager"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/android/launcher3/resource/o0;->Y(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/android/launcher3/globalsearch/r;->c(Landroid/content/Context;)Lcom/android/launcher3/globalsearch/r;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->i:Lcom/android/launcher3/resource/g0;

    .line 23
    .line 24
    return-object p0
.end method

.method public static z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/resource/o0;->q:Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method A()LD1/t;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->h:LD1/t;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 6
    .line 7
    sget-object v1, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, LD1/t;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->h:LD1/t;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->h:LD1/t;

    .line 18
    .line 19
    return-object p0
.end method

.method B()LD1/t;
    .locals 1

    .line 1
    sget-object p0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, LD1/t;

    .line 10
    .line 11
    return-object p0
.end method

.method public F()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->e:Lcom/android/launcher3/resource/z;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/resource/z;->k()Lcom/android/launcher3/resource/y0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->e:Lcom/android/launcher3/resource/z;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/resource/z;->l()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method G(Landroid/content/ComponentName;Landroid/os/UserHandle;)Z
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/android/launcher3/resource/o0;->s()Landroid/content/pm/LauncherApps;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Landroid/content/pm/LauncherApps;->isActivityEnabled(Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    .line 6
    .line 7
    .line 8
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return p0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    new-instance p1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string p2, "isActivityEnabled: "

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "R-Loader"

    .line 33
    .line 34
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public H(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->n:Lcom/android/launcher3/resource/p;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/p;->d(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method J()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/X3;->C()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method K(Ljava/lang/String;Landroid/os/UserHandle;)Z
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/android/launcher3/resource/o0;->s()Landroid/content/pm/LauncherApps;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Landroid/content/pm/LauncherApps;->isPackageEnabled(Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 6
    .line 7
    .line 8
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return p0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    new-instance p1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string p2, "isPackageEnabled: "

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "R-Loader"

    .line 33
    .line 34
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method N(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->u()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public O()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->E()Lcom/android/launcher3/H5$d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/H5$d;->d()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Lcom/android/launcher3/resource/B;->k:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->k:Landroid/content/SharedPreferences;

    .line 13
    .line 14
    return-void
.end method

.method S(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->u()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method T(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->u()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method U(Ljava/lang/String;I)V
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method V(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method W(Ljava/lang/String;Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/util/Set;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->u()Landroid/content/SharedPreferences;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 19
    .line 20
    .line 21
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    :goto_0
    const-string p0, "R-Loader"

    .line 26
    .line 27
    const-string p1, "saveConfigToPrefs no data to save!"

    .line 28
    .line 29
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method X(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/o0;->u()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method Z(Landroid/content/res/Resources;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/o0;->f:Landroid/content/res/Resources;

    .line 2
    .line 3
    return-void
.end method

.method public a0(Lcom/android/launcher3/H5$h;)V
    .locals 1

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/resource/o0;->b:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->clear()V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/android/launcher3/resource/o0;->b:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    :cond_0
    return-void

    .line 14
    :cond_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->b:Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->i:Lcom/android/launcher3/resource/g0;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/resource/g0;->v2()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-interface {p1, p0}, Lcom/android/launcher3/H5$h;->onLowMemInit(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public b0(Lcom/android/launcher3/H5$i;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->a:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/resource/o0;->c:Lcom/android/launcher3/resource/o0$a;

    .line 9
    .line 10
    sget-object v0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/android/launcher3/resource/o0$a;->c(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->e:Lcom/android/launcher3/resource/z;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/resource/z;->l()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method c()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->e:Lcom/android/launcher3/resource/z;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/z;->f()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "R-Loader"

    .line 10
    .line 11
    const-string v0, "changeIconFinished, mIconStatus is null!"

    .line 12
    .line 13
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method d()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object p0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "CurLanguage"

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method d0()V
    .locals 6

    .line 1
    const-string v0, "---startLoader start "

    .line 2
    .line 3
    const-string v1, "R-Loader"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->e:Lcom/android/launcher3/resource/z;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/resource/z;->t()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "startLoader, mIconStatus is null! "

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->j:Lcom/android/launcher3/resource/K$c;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$c;->b()V

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/resource/j;->S0()Lcom/android/launcher3/resource/K$a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-static {v4, v0, p0}, Lcom/android/launcher3/resource/K;->l(Landroid/content/Context;Lcom/android/launcher3/resource/K$a;Lcom/android/launcher3/resource/o0;)Lcom/android/launcher3/resource/K;

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->j:Lcom/android/launcher3/resource/K$c;

    .line 52
    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Lcom/android/launcher3/resource/K;->E(Landroid/content/Context;)Lcom/android/launcher3/resource/K$c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->j:Lcom/android/launcher3/resource/K$c;

    .line 64
    .line 65
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->e:Lcom/android/launcher3/resource/z;

    .line 66
    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/android/launcher3/resource/z;->w()V

    .line 70
    .line 71
    .line 72
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->i:Lcom/android/launcher3/resource/g0;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->Q0()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-static {v4}, Lx1/O;->S0(Landroid/content/Context;)Z

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-nez v0, :cond_4

    .line 87
    .line 88
    if-eqz v4, :cond_4

    .line 89
    .line 90
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K;->G()V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_4
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K;->j()V

    .line 103
    .line 104
    .line 105
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->i:Lcom/android/launcher3/resource/g0;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->B()Lcom/android/launcher3/H5$c;

    .line 108
    .line 109
    .line 110
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_5

    .line 115
    .line 116
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-interface {v0}, Lcom/android/launcher3/globalsearch/s;->g()V

    .line 125
    .line 126
    .line 127
    :cond_5
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->u()Landroid/content/SharedPreferences;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    sget-object v4, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 136
    .line 137
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    const-string v5, "MiFavor_unread_corner_mode"

    .line 142
    .line 143
    invoke-interface {v0, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-static {v0}, Lcom/android/launcher3/H5$c;->valueOf(Ljava/lang/String;)Lcom/android/launcher3/H5$c;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->l:Lcom/android/launcher3/H5$c;

    .line 152
    .line 153
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->m:Lcom/android/launcher3/util/j2;

    .line 154
    .line 155
    if-nez v0, :cond_6

    .line 156
    .line 157
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iget-object v4, p0, Lcom/android/launcher3/resource/o0;->i:Lcom/android/launcher3/resource/g0;

    .line 162
    .line 163
    invoke-virtual {v4}, Lcom/android/launcher3/resource/g0;->n2()Lcom/android/launcher3/resource/g0$g;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    new-instance v5, Lcom/android/launcher3/resource/n0;

    .line 171
    .line 172
    invoke-direct {v5, v4}, Lcom/android/launcher3/resource/n0;-><init>(Lcom/android/launcher3/resource/g0$g;)V

    .line 173
    .line 174
    .line 175
    invoke-static {v0, v5}, Lcom/android/launcher3/util/j2;->c(Landroid/content/Context;Lcom/android/launcher3/util/j2$a;)Lcom/android/launcher3/util/j2;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->m:Lcom/android/launcher3/util/j2;

    .line 180
    .line 181
    invoke-virtual {v0}, Lcom/android/launcher3/util/j2;->d()V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->m:Lcom/android/launcher3/util/j2;

    .line 185
    .line 186
    invoke-virtual {v0}, Lcom/android/launcher3/util/j2;->a()V

    .line 187
    .line 188
    .line 189
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->n:Lcom/android/launcher3/resource/p;

    .line 190
    .line 191
    if-nez v0, :cond_7

    .line 192
    .line 193
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-static {v0}, Lcom/android/launcher3/resource/p;->b(Landroid/content/Context;)Lcom/android/launcher3/resource/p;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->n:Lcom/android/launcher3/resource/p;

    .line 202
    .line 203
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 206
    .line 207
    .line 208
    const-string v0, "---startLoader load time--"

    .line 209
    .line 210
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 214
    .line 215
    .line 216
    move-result-wide v4

    .line 217
    sub-long/2addr v4, v2

    .line 218
    invoke-virtual {p0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    .line 227
    .line 228
    return-void
.end method

.method e()Lcom/android/launcher3/H5$i;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/H5$i;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public e0(Z)V
    .locals 2

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const-string v1, "---startLoaderThirdLauncher start "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->d:Lcom/android/launcher3/resource/j;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/android/launcher3/resource/j;->T0(Z)Lcom/android/launcher3/resource/K$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0, p1, p0}, Lcom/android/launcher3/resource/K;->l(Landroid/content/Context;Lcom/android/launcher3/resource/K$a;Lcom/android/launcher3/resource/o0;)Lcom/android/launcher3/resource/K;

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/launcher3/resource/o0;->j:Lcom/android/launcher3/resource/K$c;

    .line 22
    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Lcom/android/launcher3/resource/K;->E(Landroid/content/Context;)Lcom/android/launcher3/resource/K$c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/android/launcher3/resource/o0;->j:Lcom/android/launcher3/resource/K$c;

    .line 34
    .line 35
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/K;->n()Lcom/android/launcher3/resource/K;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->j()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method f()Lcom/android/launcher3/resource/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->d:Lcom/android/launcher3/resource/j;

    .line 2
    .line 3
    return-object p0
.end method

.method f0(Lcom/android/launcher3/H5$c;)V
    .locals 1

    .line 1
    :try_start_0
    iput-object p1, p0, Lcom/android/launcher3/resource/o0;->l:Lcom/android/launcher3/H5$c;

    .line 2
    .line 3
    sget-object p0, Lcom/android/launcher3/H5$c;->h:Lcom/android/launcher3/H5$c;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    const-string v0, "badge_type_value"

    .line 6
    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    :try_start_1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-static {p0, v0, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p1, 0x1

    .line 31
    invoke-static {p0, v0, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catch_0
    move-exception p0

    .line 36
    new-instance p1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v0, "syncSysCornerStatus exception : "

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "R-Loader"

    .line 58
    .line 59
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method g()Landroid/content/res/Resources;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->f:Landroid/content/res/Resources;

    .line 2
    .line 3
    return-object p0
.end method

.method i()Lcom/android/launcher3/resource/o0$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->c:Lcom/android/launcher3/resource/o0$a;

    .line 2
    .line 3
    return-object p0
.end method

.method j()Lcom/android/launcher3/H5$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->l:Lcom/android/launcher3/H5$c;

    .line 2
    .line 3
    return-object p0
.end method

.method k()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method p()Lcom/android/launcher3/resource/z;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->e:Lcom/android/launcher3/resource/z;

    .line 2
    .line 3
    return-object p0
.end method

.method t()Lcom/android/launcher3/resource/K$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->j:Lcom/android/launcher3/resource/K$c;

    .line 2
    .line 3
    return-object p0
.end method

.method u()Landroid/content/SharedPreferences;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/o0;->k:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    sget-object v0, Lcom/android/launcher3/resource/o0;->o:Landroid/content/Context;

    .line 7
    .line 8
    sget-object v1, Lcom/android/launcher3/resource/B;->k:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/android/launcher3/resource/o0;->k:Landroid/content/SharedPreferences;

    .line 16
    .line 17
    return-object v0
.end method

.method w()Lcom/android/launcher3/H5$h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/o0;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/H5$h;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method
