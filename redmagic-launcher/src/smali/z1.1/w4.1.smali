.class public Lz1/w4;
.super Lz1/m2;
.source "QuickstepModelDelegate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/w4$a;,
        Lz1/w4$b;
    }
.end annotation


# static fields
.field private static final m:Lcom/android/launcher3/X;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/X<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final e:Lz1/w4$a;

.field final f:Lz1/w4$a;

.field final g:Lz1/w4$a;

.field private final h:Lcom/android/launcher3/F1;

.field private final i:Lcom/android/launcher3/util/J1;

.field private final j:Lz1/q;

.field private final k:Landroid/app/StatsManager;

.field protected l:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/r0;->g:Lcom/android/launcher3/r0;

    .line 8
    .line 9
    const-string v2, "LAST_SNAPSHOT_TIME_MILLIS"

    .line 10
    .line 11
    invoke-static {v2, v0, v1}, Lcom/android/launcher3/J3;->p(Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;)Lcom/android/launcher3/X;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lz1/w4;->m:Lcom/android/launcher3/X;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/util/J1;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lz1/m2;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lz1/w4$a;

    .line 5
    .line 6
    const-string v1, "all_apps_predictions"

    .line 7
    .line 8
    sget-object v2, Lt1/g;->d:Lt1/g;

    .line 9
    .line 10
    const/16 v3, -0x66

    .line 11
    .line 12
    invoke-direct {v0, v3, v1, v2}, Lz1/w4$a;-><init>(ILjava/lang/String;Lt1/g;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lz1/w4;->e:Lz1/w4$a;

    .line 16
    .line 17
    new-instance v0, Lz1/w4$a;

    .line 18
    .line 19
    sget-object v1, Lcom/android/launcher3/S3;->b:Lt1/g;

    .line 20
    .line 21
    const/16 v2, -0x67

    .line 22
    .line 23
    const-string v3, "hotseat_predictions"

    .line 24
    .line 25
    invoke-direct {v0, v2, v3, v1}, Lz1/w4$a;-><init>(ILjava/lang/String;Lt1/g;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lz1/w4;->f:Lz1/w4$a;

    .line 29
    .line 30
    new-instance v0, Lz1/w4$a;

    .line 31
    .line 32
    const/16 v2, -0x6f

    .line 33
    .line 34
    const-string v3, "widgets_prediction"

    .line 35
    .line 36
    invoke-direct {v0, v2, v3, v1}, Lz1/w4$a;-><init>(ILjava/lang/String;Lt1/g;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lz1/w4;->g:Lz1/w4$a;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    iput-boolean v0, p0, Lz1/w4;->l:Z

    .line 43
    .line 44
    iput-object p2, p0, Lz1/w4;->h:Lcom/android/launcher3/F1;

    .line 45
    .line 46
    iput-object p3, p0, Lz1/w4;->i:Lcom/android/launcher3/util/J1;

    .line 47
    .line 48
    new-instance p2, Lz1/q;

    .line 49
    .line 50
    new-instance p3, Lz1/q4;

    .line 51
    .line 52
    invoke-direct {p3, p0}, Lz1/q4;-><init>(Lz1/w4;)V

    .line 53
    .line 54
    .line 55
    invoke-direct {p2, p1, p3}, Lz1/q;-><init>(Landroid/content/Context;Ljava/util/function/ObjIntConsumer;)V

    .line 56
    .line 57
    .line 58
    iput-object p2, p0, Lz1/w4;->j:Lz1/q;

    .line 59
    .line 60
    sget-object p3, Lcom/android/quickstep/logging/StatsLogCompatManager;->LOGS_CONSUMER:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 61
    .line 62
    invoke-virtual {p3, p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_0

    .line 70
    .line 71
    const/4 p1, 0x0

    .line 72
    goto :goto_0

    .line 73
    :cond_0
    const-class p2, Landroid/app/StatsManager;

    .line 74
    .line 75
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Landroid/app/StatsManager;

    .line 80
    .line 81
    :goto_0
    iput-object p1, p0, Lz1/w4;->k:Landroid/app/StatsManager;

    .line 82
    .line 83
    return-void
.end method

.method private A()V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/w4;->f:Lz1/w4$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lz1/w4$a;->b()V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lz1/w4;->l:Z

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 12
    .line 13
    const-class v1, Landroid/app/prediction/AppPredictionManager;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/app/prediction/AppPredictionManager;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    :goto_0
    return-void

    .line 24
    :cond_1
    iget-object v1, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 25
    .line 26
    invoke-direct {p0, v0, v1}, Lz1/w4;->C(Landroid/app/prediction/AppPredictionManager;Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private B()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lz1/w4;->t()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lz1/w4;->l:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 10
    .line 11
    const-class v0, Landroid/app/prediction/AppPredictionManager;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroid/app/prediction/AppPredictionManager;

    .line 18
    .line 19
    return-void
.end method

.method private C(Landroid/app/prediction/AppPredictionManager;Landroid/content/Context;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lz1/w4;->f:Lz1/w4$a;

    .line 2
    .line 3
    new-instance v1, Landroid/app/prediction/AppPredictionContext$Builder;

    .line 4
    .line 5
    invoke-direct {v1, p2}, Landroid/app/prediction/AppPredictionContext$Builder;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const-string v2, "hotseat"

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/app/prediction/AppPredictionContext$Builder;->setUiSurface(Ljava/lang/String;)Landroid/app/prediction/AppPredictionContext$Builder;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lz1/w4;->h:Lcom/android/launcher3/F1;

    .line 15
    .line 16
    iget v2, v2, Lcom/android/launcher3/F1;->e1:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/app/prediction/AppPredictionContext$Builder;->setPredictedTargetCount(I)Landroid/app/prediction/AppPredictionContext$Builder;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Lz1/m2;->d:Lz1/y0;

    .line 23
    .line 24
    invoke-static {p2, v2}, Lq1/q;->b(Landroid/content/Context;Lz1/y0;)Landroid/os/Bundle;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {v1, p2}, Landroid/app/prediction/AppPredictionContext$Builder;->setExtras(Landroid/os/Bundle;)Landroid/app/prediction/AppPredictionContext$Builder;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2}, Landroid/app/prediction/AppPredictionContext$Builder;->build()Landroid/app/prediction/AppPredictionContext;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p1, p2}, Landroid/app/prediction/AppPredictionManager;->createAppPredictionSession(Landroid/app/prediction/AppPredictionContext;)Landroid/app/prediction/AppPredictor;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-direct {p0, v0, p1}, Lz1/w4;->D(Lz1/w4$a;Landroid/app/prediction/AppPredictor;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private D(Lz1/w4$a;Landroid/app/prediction/AppPredictor;)V
    .locals 2

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lz1/w4$a;->c(Ljava/util/List;)Z

    .line 4
    .line 5
    .line 6
    iput-object p2, p1, Lz1/w4$a;->c:Landroid/app/prediction/AppPredictor;

    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 9
    .line 10
    new-instance v1, Lz1/r4;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Lz1/r4;-><init>(Lz1/w4;Lz1/w4$a;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2, v0, v1}, Landroid/app/prediction/AppPredictor;->registerPredictionUpdates(Ljava/util/concurrent/Executor;Landroid/app/prediction/AppPredictor$Callback;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p1, Lz1/w4$a;->c:Landroid/app/prediction/AppPredictor;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/prediction/AppPredictor;->requestPredictionUpdate()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private E()V
    .locals 5

    .line 1
    iget-object v0, p0, Lz1/w4;->k:Landroid/app/StatsManager;

    .line 2
    .line 3
    const-string v1, "QuickstepModelDelegate"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "Skipping snapshot logging"

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    iget-object v0, p0, Lz1/w4;->k:Landroid/app/StatsManager;

    .line 13
    .line 14
    sget-object v2, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 15
    .line 16
    new-instance v3, Lz1/s4;

    .line 17
    .line 18
    invoke-direct {v3, p0}, Lz1/s4;-><init>(Lz1/w4;)V

    .line 19
    .line 20
    .line 21
    const/16 p0, 0x277c

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-virtual {v0, p0, v4, v2, v3}, Landroid/app/StatsManager;->setPullAtomCallback(ILandroid/app/StatsManager$PullAtomMetadata;Ljava/util/concurrent/Executor;Landroid/app/StatsManager$StatsPullAtomCallback;)V

    .line 25
    .line 26
    .line 27
    const-string p0, "Successfully registered for launcher snapshot logging!"

    .line 28
    .line 29
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p0

    .line 34
    const-string v0, "Failed to register launcher snapshot logging callback with StatsManager"

    .line 35
    .line 36
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic m(Lz1/w4;Lz1/w4$a;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/w4;->w(Lz1/w4$a;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lz1/w4;ILjava/util/List;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/w4;->x(ILjava/util/List;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic o([Lz1/y0$b;Lz1/y0$c;)V
    .locals 3

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_0

    .line 4
    .line 5
    aget-object v2, p0, v1

    .line 6
    .line 7
    invoke-interface {v2, p1}, Lz1/y0$b;->z(Lz1/y0$c;)V

    .line 8
    .line 9
    .line 10
    add-int/lit8 v1, v1, 0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return-void
.end method

.method static bridge synthetic p(Landroid/app/prediction/AppTarget;Landroid/app/prediction/AppTarget;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/w4;->r(Landroid/app/prediction/AppTarget;Landroid/app/prediction/AppTarget;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static r(Landroid/app/prediction/AppTarget;Landroid/app/prediction/AppTarget;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/prediction/AppTarget;->getPackageName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/app/prediction/AppTarget;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_4

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/prediction/AppTarget;->getUser()Landroid/os/UserHandle;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1}, Landroid/app/prediction/AppTarget;->getUser()Landroid/os/UserHandle;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/app/prediction/AppTarget;->getClassName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1}, Landroid/app/prediction/AppTarget;->getClassName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {p0}, Landroid/app/prediction/AppTarget;->getShortcutInfo()Landroid/content/pm/ShortcutInfo;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1}, Landroid/app/prediction/AppTarget;->getShortcutInfo()Landroid/content/pm/ShortcutInfo;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-nez p0, :cond_3

    .line 70
    .line 71
    :cond_1
    return v1

    .line 72
    :cond_2
    if-eqz p1, :cond_3

    .line 73
    .line 74
    return v1

    .line 75
    :cond_3
    const/4 p0, 0x1

    .line 76
    return p0

    .line 77
    :cond_4
    :goto_0
    return v1
.end method

.method private s([Lz1/y0$b;Lz1/y0$c;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v0, Lz1/t4;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Lz1/t4;-><init>([Lz1/y0$b;Lz1/y0$c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private t()V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/w4;->e:Lz1/w4$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lz1/w4$a;->b()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lz1/w4;->f:Lz1/w4$a;

    .line 7
    .line 8
    invoke-virtual {v0}, Lz1/w4$a;->b()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lz1/w4;->g:Lz1/w4$a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lz1/w4$a;->b()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private static u(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/util/A0;)Lcom/android/launcher3/model/data/m;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/y;",
            "Lcom/android/launcher3/util/A0<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)",
            "Lcom/android/launcher3/model/data/m;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 2
    .line 3
    if-lez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    instance-of v0, p1, Lcom/android/launcher3/model/data/m;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "Item info: %s found with invalid container: %s"

    .line 16
    .line 17
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "QuickstepModelDelegate"

    .line 26
    .line 27
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    :cond_0
    check-cast p1, Lcom/android/launcher3/model/data/m;

    .line 31
    .line 32
    return-object p1

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method

.method private v(Lz1/w4$a;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/w4$a;",
            "Ljava/util/List<",
            "Landroid/app/prediction/AppTarget;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Lz1/w4$a;->c(Ljava/util/List;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Lz1/m2;->b:Lcom/android/launcher3/D3;

    .line 9
    .line 10
    new-instance v0, Lz1/p4;

    .line 11
    .line 12
    invoke-direct {v0, p1, p2}, Lz1/p4;-><init>(Lz1/w4$a;Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic w(Lz1/w4$a;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/w4;->v(Lz1/w4$a;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic x(ILjava/util/List;)I
    .locals 5

    .line 1
    new-instance p1, Lcom/android/launcher3/logging/f;

    .line 2
    .line 3
    invoke-direct {p1}, Lcom/android/launcher3/logging/f;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/logging/f;->a()Lcom/android/launcher3/logging/d;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Lz1/m2;->d:Lz1/y0;

    .line 11
    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Lz1/m2;->d:Lz1/y0;

    .line 14
    .line 15
    iget-object v1, v1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/util/A0;->m()Lcom/android/launcher3/util/A0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 37
    .line 38
    invoke-static {v2, v1}, Lz1/w4;->u(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/util/A0;)Lcom/android/launcher3/model/data/m;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object v4, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {v2, v3, v4}, Lcom/android/launcher3/model/data/y;->buildProto(Lcom/android/launcher3/model/data/m;Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const-string v3, "QuickstepModelDelegate"

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/google/protobuf/y;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    invoke-static {v2, p1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->buildStatsEvent(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Lcom/android/launcher3/logging/d;)Landroid/util/StatsEvent;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    const-string p2, "QuickstepModelDelegate"

    .line 66
    .line 67
    const-string v0, "Successfully logged %d workspace items with instanceId=%d"

    .line 68
    .line 69
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {p1}, Lcom/android/launcher3/logging/d;->b()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, p1}, Lz1/w4;->q(Lcom/android/launcher3/logging/d;)V

    .line 97
    .line 98
    .line 99
    sget-object p2, Lcom/android/quickstep/logging/SettingsChangeLogger;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 100
    .line 101
    iget-object p0, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 102
    .line 103
    invoke-virtual {p2, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    check-cast p0, Lcom/android/quickstep/logging/SettingsChangeLogger;

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Lcom/android/quickstep/logging/SettingsChangeLogger;->logSnapshot(Lcom/android/launcher3/logging/d;)V

    .line 110
    .line 111
    .line 112
    const/4 p0, 0x0

    .line 113
    return p0

    .line 114
    :catchall_0
    move-exception p0

    .line 115
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    throw p0
.end method

.method private y(Lz1/L4;Ljava/util/Map;[Lz1/y0$b;ILz1/w4$a;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/L4;",
            "Ljava/util/Map<",
            "LN1/e;",
            "Landroid/content/pm/ShortcutInfo;",
            ">;[",
            "Lz1/y0$b;",
            "I",
            "Lz1/w4$a;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/w4$b;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v3, p0, Lz1/w4;->i:Lcom/android/launcher3/util/J1;

    .line 6
    .line 7
    iget v6, p5, Lz1/w4$a;->a:I

    .line 8
    .line 9
    iget-object v7, p5, Lz1/w4$a;->d:Lt1/g;

    .line 10
    .line 11
    move-object v2, p1

    .line 12
    move-object v4, p2

    .line 13
    move v5, p4

    .line 14
    invoke-direct/range {v0 .. v7}, Lz1/w4$b;-><init>(Landroid/content/Context;Lz1/L4;Lcom/android/launcher3/util/J1;Ljava/util/Map;IILt1/g;)V

    .line 15
    .line 16
    .line 17
    new-instance p1, Lz1/y0$c;

    .line 18
    .line 19
    iget p2, p5, Lz1/w4$a;->a:I

    .line 20
    .line 21
    iget-object p3, p5, Lz1/w4$a;->b:Lcom/android/launcher3/util/R1;

    .line 22
    .line 23
    iget-object p4, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 24
    .line 25
    iget-object v1, v2, Lz1/L4;->a:Landroid/util/LongSparseArray;

    .line 26
    .line 27
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    new-instance v2, Lz1/u4;

    .line 31
    .line 32
    invoke-direct {v2, v1}, Lz1/u4;-><init>(Landroid/util/LongSparseArray;)V

    .line 33
    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p3, p4, v0, v2, v1}, Lcom/android/launcher3/util/R1;->c(Landroid/content/Context;Lcom/android/launcher3/util/R1$a;Ljava/util/function/LongFunction;Ljava/lang/String;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    invoke-direct {p1, p2, p3}, Lz1/y0$c;-><init>(ILjava/util/List;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lz1/m2;->d:Lz1/y0;

    .line 44
    .line 45
    iget-object p0, p0, Lz1/y0;->b:Lcom/android/launcher3/util/A0;

    .line 46
    .line 47
    iget p2, p5, Lz1/w4$a;->a:I

    .line 48
    .line 49
    invoke-virtual {p0, p2, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    invoke-super {p0}, Lz1/m2;->a()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lz1/w4;->l:Z

    .line 6
    .line 7
    sget-object v0, Lcom/android/quickstep/logging/StatsLogCompatManager;->LOGS_CONSUMER:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 8
    .line 9
    iget-object v1, p0, Lz1/w4;->j:Lz1/q;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lz1/w4;->k:Landroid/app/StatsManager;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/16 v1, 0x277c

    .line 19
    .line 20
    :try_start_0
    invoke-virtual {v0, v1}, Landroid/app/StatsManager;->clearPullAtomCallback(I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catch_0
    move-exception v0

    .line 25
    const-string v1, "QuickstepModelDelegate"

    .line 26
    .line 27
    const-string v2, "Failed to unregister snapshot logging callback with StatsManager"

    .line 28
    .line 29
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    :goto_0
    invoke-direct {p0}, Lz1/w4;->t()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public e(Lz1/L4;[Lz1/y0$b;Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/L4;",
            "[",
            "Lz1/y0$b;",
            "Ljava/util/Map<",
            "LN1/e;",
            "Landroid/content/pm/ShortcutInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/w4;->h:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    iget v5, v0, Lcom/android/launcher3/F1;->j1:I

    .line 4
    .line 5
    iget-object v6, p0, Lz1/w4;->e:Lz1/w4$a;

    .line 6
    .line 7
    move-object v1, p0

    .line 8
    move-object v2, p1

    .line 9
    move-object v4, p2

    .line 10
    move-object v3, p3

    .line 11
    invoke-direct/range {v1 .. v6}, Lz1/w4;->y(Lz1/L4;Ljava/util/Map;[Lz1/y0$b;ILz1/w4$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public f([Lz1/y0$b;)V
    .locals 3

    .line 1
    new-instance v0, Lz1/y0$c;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/w4;->g:Lz1/w4$a;

    .line 4
    .line 5
    iget v1, v1, Lz1/w4$a;->a:I

    .line 6
    .line 7
    new-instance v2, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Lz1/y0$c;-><init>(ILjava/util/List;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lz1/m2;->d:Lz1/y0;

    .line 16
    .line 17
    iget-object v1, v1, Lz1/y0;->b:Lcom/android/launcher3/util/A0;

    .line 18
    .line 19
    iget-object v2, p0, Lz1/w4;->g:Lz1/w4$a;

    .line 20
    .line 21
    iget v2, v2, Lz1/w4$a;->a:I

    .line 22
    .line 23
    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, p1, v0}, Lz1/w4;->s([Lz1/y0$b;Lz1/y0$c;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lz1/m2;->d:Lz1/y0;

    .line 30
    .line 31
    iget-object p1, p1, Lz1/y0;->e:Lz1/G4;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lz1/m2;->h(Lz1/G4;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public g(Lz1/L4;[Lz1/y0$b;Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/L4;",
            "[",
            "Lz1/y0$b;",
            "Ljava/util/Map<",
            "LN1/e;",
            "Landroid/content/pm/ShortcutInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/w4;->h:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    iget v5, v0, Lcom/android/launcher3/F1;->e1:I

    .line 4
    .line 5
    iget-object v6, p0, Lz1/w4;->f:Lz1/w4$a;

    .line 6
    .line 7
    move-object v1, p0

    .line 8
    move-object v2, p1

    .line 9
    move-object v4, p2

    .line 10
    move-object v3, p3

    .line 11
    invoke-direct/range {v1 .. v6}, Lz1/w4;->y(Lz1/L4;Ljava/util/Map;[Lz1/y0$b;ILz1/w4$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    invoke-super {p0}, Lz1/m2;->i()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lz1/w4;->l:Z

    .line 6
    .line 7
    return-void
.end method

.method public j()V
    .locals 9

    .line 1
    invoke-super {p0}, Lz1/m2;->j()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lz1/w4;->m:Lcom/android/launcher3/X;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/lang/Long;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v3

    .line 26
    sub-long v1, v3, v1

    .line 27
    .line 28
    const-wide/32 v5, 0x5265c00

    .line 29
    .line 30
    .line 31
    cmp-long v1, v1, v5

    .line 32
    .line 33
    if-gez v1, :cond_0

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    iget-object v1, p0, Lz1/m2;->d:Lz1/y0;

    .line 37
    .line 38
    monitor-enter v1

    .line 39
    :try_start_0
    iget-object v2, p0, Lz1/m2;->d:Lz1/y0;

    .line 40
    .line 41
    iget-object v2, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 42
    .line 43
    invoke-virtual {v2}, Lcom/android/launcher3/util/A0;->m()Lcom/android/launcher3/util/A0;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    new-instance v1, Lcom/android/launcher3/logging/f;

    .line 49
    .line 50
    invoke-direct {v1}, Lcom/android/launcher3/logging/f;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/android/launcher3/logging/f;->a()Lcom/android/launcher3/logging/d;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v2}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-eqz v6, :cond_1

    .line 66
    .line 67
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    check-cast v6, Lcom/android/launcher3/model/data/y;

    .line 72
    .line 73
    invoke-static {v6, v2}, Lz1/w4;->u(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/util/A0;)Lcom/android/launcher3/model/data/m;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    iget-object v8, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 78
    .line 79
    invoke-virtual {v6, v7, v8}, Lcom/android/launcher3/model/data/y;->buildProto(Lcom/android/launcher3/model/data/m;Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 80
    .line 81
    .line 82
    move-result-object v6

    .line 83
    invoke-static {v6, v1}, Lcom/android/quickstep/logging/StatsLogCompatManager;->writeSnapshot(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;Lcom/android/launcher3/logging/d;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    invoke-virtual {p0, v1}, Lz1/w4;->q(Lcom/android/launcher3/logging/d;)V

    .line 88
    .line 89
    .line 90
    sget-object v1, Lz1/w4;->m:Lcom/android/launcher3/X;

    .line 91
    .line 92
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    :goto_1
    invoke-direct {p0}, Lz1/w4;->E()V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :catchall_0
    move-exception p0

    .line 104
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 105
    throw p0
.end method

.method public k()V
    .locals 1

    .line 1
    invoke-super {p0}, Lz1/m2;->k()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lz1/w4;->e:Lz1/w4$a;

    .line 5
    .line 6
    iget-object v0, v0, Lz1/w4$a;->c:Landroid/app/prediction/AppPredictor;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/app/prediction/AppPredictor;->requestPredictionUpdate()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lz1/w4;->g:Lz1/w4$a;

    .line 14
    .line 15
    iget-object p0, p0, Lz1/w4$a;->c:Landroid/app/prediction/AppPredictor;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/prediction/AppPredictor;->requestPredictionUpdate()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    invoke-super {p0}, Lz1/m2;->l()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/quickstep/util/ContextualSearchStateManager;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    iget-object v1, p0, Lz1/m2;->a:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lz1/w4;->B()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method protected q(Lcom/android/launcher3/logging/d;)V
    .locals 0

    .line 1
    return-void
.end method

.method z(Landroid/app/prediction/AppTargetEvent;I)V
    .locals 2

    .line 1
    const/16 v0, -0x6f

    .line 2
    .line 3
    if-eq p2, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, -0x66

    .line 6
    .line 7
    if-eq p2, v0, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Lz1/w4;->f:Lz1/w4$a;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p2, p0, Lz1/w4;->e:Lz1/w4$a;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget-object p2, p0, Lz1/w4;->g:Lz1/w4$a;

    .line 16
    .line 17
    :goto_0
    iget-object v0, p2, Lz1/w4$a;->c:Landroid/app/prediction/AppPredictor;

    .line 18
    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Landroid/app/prediction/AppPredictor;->notifyAppTargetEvent(Landroid/app/prediction/AppTargetEvent;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v1, "notifyAppTargetEvent action="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/app/prediction/AppTargetEvent;->getAction()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, " launchLocation="

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/app/prediction/AppTargetEvent;->getLaunchLocation()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "QuickstepModelDelegate"

    .line 58
    .line 59
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lz1/w4;->f:Lz1/w4$a;

    .line 63
    .line 64
    if-ne p2, v0, :cond_3

    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/app/prediction/AppTargetEvent;->getAction()I

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    const/4 v0, 0x3

    .line 71
    if-eq p2, v0, :cond_2

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/app/prediction/AppTargetEvent;->getAction()I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    const/4 p2, 0x4

    .line 78
    if-ne p1, p2, :cond_3

    .line 79
    .line 80
    :cond_2
    invoke-direct {p0}, Lz1/w4;->A()V

    .line 81
    .line 82
    .line 83
    :cond_3
    return-void
.end method
