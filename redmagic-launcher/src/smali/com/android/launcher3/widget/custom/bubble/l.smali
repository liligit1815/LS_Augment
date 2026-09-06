.class public Lcom/android/launcher3/widget/custom/bubble/l;
.super Ljava/lang/Object;
.source "AIBubbleWidgetDataHelper.java"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/custom/bubble/l$g;
    }
.end annotation


# static fields
.field private static A:Ljava/lang/String;

.field protected static t:Z

.field protected static final u:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/widget/custom/bubble/l;",
            ">;"
        }
    .end annotation
.end field

.field private static v:Z

.field private static final w:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final x:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final y:Landroid/net/Uri;

.field private static z:Ljava/lang/String;


# instance fields
.field private g:Landroid/content/Context;

.field private final h:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/app/PendingIntent;",
            ">;"
        }
    .end annotation
.end field

.field private i:Ljava/lang/String;

.field private j:Z

.field private k:Z

.field private l:Landroid/content/BroadcastReceiver;

.field private m:Z

.field private n:Landroid/content/BroadcastReceiver;

.field private o:Z

.field private p:Landroid/database/ContentObserver;

.field private volatile q:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/launcher3/widget/custom/bubble/l$g;",
            ">;"
        }
    .end annotation
.end field

.field private r:J

.field private final s:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/android/launcher3/O;->a:Z

    .line 2
    .line 3
    sput-boolean v0, Lcom/android/launcher3/widget/custom/bubble/l;->t:Z

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 6
    .line 7
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/k;

    .line 8
    .line 9
    invoke-direct {v1}, Lcom/android/launcher3/widget/custom/bubble/k;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/l;->u:Lcom/android/launcher3/util/I;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    sput-boolean v0, Lcom/android/launcher3/widget/custom/bubble/l;->v:Z

    .line 19
    .line 20
    const-string v0, "com.android.calendar"

    .line 21
    .line 22
    filled-new-array {v0}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/l;->w:Ljava/util/List;

    .line 31
    .line 32
    const-string v0, "zte.com.cn.alarmclock"

    .line 33
    .line 34
    filled-new-array {v0}, [Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/l;->x:Ljava/util/List;

    .line 43
    .line 44
    const-string v0, "concise_ai_bubble_widget_notifications"

    .line 45
    .line 46
    invoke-static {v0}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/l;->y:Landroid/net/Uri;

    .line 51
    .line 52
    const-string v0, ";"

    .line 53
    .line 54
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/l;->z:Ljava/lang/String;

    .line 55
    .line 56
    const-string v0, "/"

    .line 57
    .line 58
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/l;->A:Ljava/lang/String;

    .line 59
    .line 60
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->h:Ljava/util/Map;

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->i:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->j:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->k:Z

    .line 19
    .line 20
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/l$b;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/bubble/l$b;-><init>(Lcom/android/launcher3/widget/custom/bubble/l;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->l:Landroid/content/BroadcastReceiver;

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->m:Z

    .line 28
    .line 29
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/l$c;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/bubble/l$c;-><init>(Lcom/android/launcher3/widget/custom/bubble/l;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->n:Landroid/content/BroadcastReceiver;

    .line 35
    .line 36
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->o:Z

    .line 37
    .line 38
    new-instance v0, Lcom/android/launcher3/widget/custom/bubble/l$d;

    .line 39
    .line 40
    new-instance v1, Landroid/os/Handler;

    .line 41
    .line 42
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/widget/custom/bubble/l$d;-><init>(Lcom/android/launcher3/widget/custom/bubble/l;Landroid/os/Handler;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->p:Landroid/database/ContentObserver;

    .line 53
    .line 54
    new-instance v0, Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->q:Ljava/util/HashMap;

    .line 60
    .line 61
    new-instance v0, Lcom/android/launcher3/widget/custom/bubble/l$f;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/custom/bubble/l$f;-><init>(Lcom/android/launcher3/widget/custom/bubble/l;)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->s:Landroid/content/BroadcastReceiver;

    .line 67
    .line 68
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 69
    .line 70
    const-string v1, "AIBubbleWidgetDataHelper new INSTANCE"

    .line 71
    .line 72
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    const/4 v0, 0x1

    .line 76
    sput-boolean v0, Lcom/android/launcher3/widget/custom/bubble/l;->v:Z

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 83
    .line 84
    return-void
.end method

.method private static A(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v0, "getAppName error. pkgName= "

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "AIBubbleWidgetDataHelper"

    .line 28
    .line 29
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method private static B(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    return-object p0

    .line 19
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v0, "getAppName error. pkgName= "

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "AIBubbleWidgetDataHelper"

    .line 37
    .line 38
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    const-string p0, ""

    .line 42
    .line 43
    return-object p0
.end method

.method private static D(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "concise_ai_bubble_widget_notifications"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0, v0}, Lcom/android/launcher3/widget/custom/bubble/l;->i0(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v2, "getSettingsAIBubbleDataListAndRefreshViews settingsStr="

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "AIBubbleWidgetDataHelper"

    .line 33
    .line 34
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    return-object p0
.end method

.method protected static E()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/launcher3/widget/custom/bubble/l;->v:Z

    .line 2
    .line 3
    return v0
.end method

.method protected static I(Landroid/content/Context;Landroid/view/View;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Landroid/app/PendingIntent;)Z
    .locals 11

    .line 1
    const/4 v8, 0x0

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    if-eqz p2, :cond_4

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_1

    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p2, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    goto/16 :goto_1

    .line 33
    .line 34
    :cond_1
    const-string v9, "AIBubbleWidgetDataHelper"

    .line 35
    .line 36
    const/4 v10, 0x1

    .line 37
    if-eqz p3, :cond_3

    .line 38
    .line 39
    :try_start_0
    instance-of v2, v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 40
    .line 41
    if-eqz v2, :cond_3

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 56
    .line 57
    check-cast v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1, p1, v0}, Lcom/android/launcher3/q5;->f0(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object v0, p1, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 68
    .line 69
    const/high16 v1, 0x10000000

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/app/ActivityOptions;->setPendingIntentLaunchFlags(I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p1, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 75
    .line 76
    invoke-virtual {v0, v8}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 77
    .line 78
    .line 79
    iget-object v0, p1, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 80
    .line 81
    invoke-virtual {v0, v10}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/android/launcher3/util/b;->a()Landroid/os/Bundle;

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    const/4 v2, 0x0

    .line 89
    const/4 v3, 0x0

    .line 90
    const/4 v4, 0x0

    .line 91
    const/4 v5, 0x0

    .line 92
    const/4 v6, 0x0

    .line 93
    move-object v1, p0

    .line 94
    move-object v0, p3

    .line 95
    invoke-virtual/range {v0 .. v7}, Landroid/app/PendingIntent;->sendAndReturnResult(Landroid/content/Context;ILandroid/content/Intent;Landroid/app/PendingIntent$OnFinished;Landroid/os/Handler;Ljava/lang/String;Landroid/os/Bundle;)I

    .line 96
    .line 97
    .line 98
    return v10

    .line 99
    :catchall_0
    move-exception v0

    .line 100
    move-object p0, v0

    .line 101
    goto :goto_0

    .line 102
    :cond_2
    return v10

    .line 103
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    const-string v3, "jumpToThirdAppByPendingIntent startActivitySafely pendingIntent="

    .line 109
    .line 110
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {v9, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    const/4 p0, 0x0

    .line 124
    invoke-virtual {v1, p1, v0, p0}, Lcom/android/launcher3/C2;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    .line 126
    .line 127
    return v10

    .line 128
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    const-string v0, "jumpToThirdAppByPendingIntent error, bubbleData="

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-static {v9, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 146
    .line 147
    .line 148
    :cond_4
    :goto_1
    return v8
.end method

.method private synthetic L(Ljava/util/ArrayList;JLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "asyncGetSettingsAIBubbleDataListAndRefreshViews mainThreadRunnable run update= list="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " curAsyncTime="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, " mLastAsyncGetTime="

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-wide v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->r:J

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "AIBubbleWidgetDataHelper"

    .line 37
    .line 38
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    invoke-static {p4}, Lcom/android/launcher3/widget/custom/bubble/l;->w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result p4

    .line 49
    if-nez p4, :cond_0

    .line 50
    .line 51
    const/4 p4, 0x0

    .line 52
    invoke-virtual {v7, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    invoke-virtual {v7, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p4

    .line 62
    check-cast p4, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 63
    .line 64
    new-instance v2, Lcom/android/launcher3/widget/custom/bubble/l$e;

    .line 65
    .line 66
    move-object v3, p0

    .line 67
    move-object v6, p1

    .line 68
    move-wide v4, p2

    .line 69
    invoke-direct/range {v2 .. v7}, Lcom/android/launcher3/widget/custom/bubble/l$e;-><init>(Lcom/android/launcher3/widget/custom/bubble/l;JLjava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 70
    .line 71
    .line 72
    const-wide/16 p0, 0xc8

    .line 73
    .line 74
    invoke-virtual {p4, v2, p0, p1}, Landroid/widget/FrameLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method

.method private synthetic M(Ljava/util/ArrayList;ZLjava/lang/Runnable;)V
    .locals 2

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    const-string v1, "asyncGetSettingsAIBubbleDataListAndRefreshViews workThreadRunnable run"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 34
    .line 35
    invoke-direct {p0, v1, p2, v0}, Lcom/android/launcher3/widget/custom/bubble/l;->r0(Landroid/content/Context;ZLcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 40
    .line 41
    invoke-virtual {p0, p3}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic b(Landroid/content/Context;Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    const-string v1, "asyncGetSettingsAIBubbleDataListAndRefreshViews MODEL_EXECUTOR run"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :try_start_0
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "com.android.calendar"

    .line 17
    .line 18
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v1, v2, v3}, Lcom/android/launcher3/D3;->Z(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v2, p0, v3, v1}, Lcom/android/launcher3/c1;->A(Landroid/content/Context;Ls1/P;Lcom/android/launcher3/model/data/d;)Lcom/android/launcher3/model/data/d;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    const-string v1, "asyncGetSettingsAIBubbleDataListAndRefreshViews MODEL_EXECUTOR run error"

    .line 54
    .line 55
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 56
    .line 57
    .line 58
    :cond_0
    :goto_0
    sget-object p0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/widget/custom/bubble/l;Ljava/util/ArrayList;ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/custom/bubble/l;->M(Ljava/util/ArrayList;ZLjava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/widget/custom/bubble/l;Ljava/util/ArrayList;JLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/custom/bubble/l;->L(Ljava/util/ArrayList;JLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/widget/custom/bubble/l;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->r:J

    .line 2
    .line 3
    return-wide v0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/widget/custom/bubble/l;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/l;->k0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static i0(Landroid/content/Context;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    const-string v2, "AIBubbleWidgetDataHelper"

    .line 4
    .line 5
    new-instance v3, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto/16 :goto_5

    .line 17
    .line 18
    :cond_0
    :try_start_0
    sget-object v0, Lcom/android/launcher3/widget/custom/bubble/l;->z:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    if-eqz v4, :cond_4

    .line 25
    .line 26
    array-length v0, v4

    .line 27
    if-lez v0, :cond_4

    .line 28
    .line 29
    array-length v5, v4

    .line 30
    const/4 v6, 0x0

    .line 31
    move v7, v6

    .line 32
    :goto_0
    if-ge v7, v5, :cond_4

    .line 33
    .line 34
    aget-object v8, v4, v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    .line 36
    const/4 v9, 0x0

    .line 37
    :try_start_1
    sget-object v0, Lcom/android/launcher3/widget/custom/bubble/l;->A:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v8, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    array-length v10, v0

    .line 46
    const/4 v11, 0x3

    .line 47
    if-lt v10, v11, :cond_2

    .line 48
    .line 49
    aget-object v13, v0, v6

    .line 50
    .line 51
    const/4 v10, 0x1

    .line 52
    aget-object v12, v0, v10

    .line 53
    .line 54
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v14

    .line 58
    const/4 v12, 0x2

    .line 59
    aget-object v12, v0, v12

    .line 60
    .line 61
    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 62
    .line 63
    .line 64
    move-result-wide v15

    .line 65
    array-length v12, v0

    .line 66
    const/4 v6, 0x4

    .line 67
    if-lt v12, v6, :cond_1

    .line 68
    .line 69
    const-string v6, "999"

    .line 70
    .line 71
    aget-object v0, v0, v11

    .line 72
    .line 73
    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_1

    .line 78
    .line 79
    move/from16 v17, v10

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :catchall_0
    move-exception v0

    .line 83
    goto :goto_4

    .line 84
    :catch_0
    move-exception v0

    .line 85
    goto :goto_2

    .line 86
    :cond_1
    const/16 v17, 0x0

    .line 87
    .line 88
    :goto_1
    new-instance v12, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 89
    .line 90
    invoke-direct/range {v12 .. v17}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;-><init>(Ljava/lang/String;IJZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    .line 92
    .line 93
    move-object v9, v12

    .line 94
    goto :goto_3

    .line 95
    :goto_2
    :try_start_2
    new-instance v6, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    const-string v10, "parseSettingsStrToAIBubbleDataList error, app="

    .line 101
    .line 102
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    invoke-static {v2, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 113
    .line 114
    .line 115
    :cond_2
    :goto_3
    if-eqz v9, :cond_3

    .line 116
    .line 117
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 118
    .line 119
    .line 120
    :cond_3
    add-int/lit8 v7, v7, 0x1

    .line 121
    .line 122
    const/4 v6, 0x0

    .line 123
    goto :goto_0

    .line 124
    :goto_4
    new-instance v4, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    const-string v5, "parseSettingsStrToAIBubbleDataList error, settingsStr="

    .line 130
    .line 131
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 142
    .line 143
    .line 144
    :cond_4
    :goto_5
    return-object v3
.end method

.method static bridge synthetic j(Lcom/android/launcher3/widget/custom/bubble/l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->w0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private k0(Z)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/l;->w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_1

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getClockView()Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->h()V

    .line 27
    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    move-object v0, v2

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    if-eqz p1, :cond_4

    .line 34
    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    sget-object p1, Lcom/android/launcher3/widget/custom/bubble/l;->w:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/4 v1, 0x0

    .line 44
    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_3

    .line 49
    .line 50
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Ljava/lang/String;

    .line 55
    .line 56
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/bubble/l;->q:Ljava/util/HashMap;

    .line 57
    .line 58
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_2

    .line 63
    .line 64
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->q:Ljava/util/HashMap;

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    const/4 v1, 0x1

    .line 70
    goto :goto_1

    .line 71
    :cond_3
    if-eqz v1, :cond_4

    .line 72
    .line 73
    new-instance p1, Lcom/android/launcher3/widget/custom/bubble/l$a;

    .line 74
    .line 75
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/custom/bubble/l$a;-><init>(Lcom/android/launcher3/widget/custom/bubble/l;)V

    .line 76
    .line 77
    .line 78
    const-wide/16 v1, 0x3e8

    .line 79
    .line 80
    invoke-virtual {v0, p1, v1, v2}, Landroid/widget/FrameLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 81
    .line 82
    .line 83
    :cond_4
    return-void
.end method

.method private l0()V
    .locals 5

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->k:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "registerDateChangedOrSetTimeReceiver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    new-instance v1, Landroid/content/IntentFilter;

    .line 13
    .line 14
    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v2, "android.intent.action.DATE_CHANGED"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v2, "android.intent.action.TIME_SET"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-string v2, "android.intent.action.TIMEZONE_CHANGED"

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 33
    .line 34
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/bubble/l;->l:Landroid/content/BroadcastReceiver;

    .line 35
    .line 36
    const/4 v4, 0x2

    .line 37
    invoke-virtual {v2, v3, v1, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->k:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    return-void

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    const-string v1, "registerDateChangedOrSetTimeReceiver error"

    .line 46
    .line 47
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method private m0()V
    .locals 5

    .line 1
    const-string v0, "registerDesktopClockStateReceiver: "

    .line 2
    .line 3
    const-string v1, "AIBubbleWidgetDataHelper"

    .line 4
    .line 5
    :try_start_0
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance v2, Landroid/content/IntentFilter;

    .line 9
    .line 10
    const-string v3, "com.android.mifavor.launcher.DESKTOP_CLOCK_STATE"

    .line 11
    .line 12
    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->s:Landroid/content/BroadcastReceiver;

    .line 18
    .line 19
    const/4 v4, 0x2

    .line 20
    invoke-virtual {v3, p0, v2, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception p0

    .line 25
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method static bridge synthetic n(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private n0()V
    .locals 5

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->o:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "registerTimeTickRegisteredReceiver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget-object v2, Lcom/android/launcher3/widget/custom/bubble/l;->y:Landroid/net/Uri;

    .line 19
    .line 20
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/bubble/l;->p:Landroid/database/ContentObserver;

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    invoke-virtual {v1, v2, v4, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 24
    .line 25
    .line 26
    iput-boolean v4, p0, Lcom/android/launcher3/widget/custom/bubble/l;->o:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    const-string v1, "registerTimeTickRegisteredReceiver error"

    .line 31
    .line 32
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private o0()V
    .locals 5

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->m:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "registerTimeTickRegisteredReceiver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    new-instance v1, Landroid/content/IntentFilter;

    .line 13
    .line 14
    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v2, "android.intent.action.TIME_TICK"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/bubble/l;->n:Landroid/content/BroadcastReceiver;

    .line 25
    .line 26
    const/4 v4, 0x2

    .line 27
    invoke-virtual {v2, v3, v1, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->m:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    const-string v1, "registerTimeTickRegisteredReceiver error"

    .line 36
    .line 37
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method private static p0(Landroid/content/Context;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "sendClickBubbleBroadcast aiBubbleData="

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "AIBubbleWidgetDataHelper"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    .line 33
    .line 34
    const-string v2, "concise_ai_bubble_widget.app_bubble"

    .line 35
    .line 36
    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string v2, "com.android.systemui"

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    const-string v2, "type"

    .line 45
    .line 46
    const-string v3, "open"

    .line 47
    .line 48
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    const-string v2, "pkg"

    .line 52
    .line 53
    iget-object v3, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    const-string v2, "count"

    .line 59
    .line 60
    iget v3, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->count:I

    .line 61
    .line 62
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v0, "sendDeleteBubbleBroadcast error, aiBubbleData="

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    :cond_1
    :goto_0
    return-void
.end method

.method protected static q0(Landroid/content/Context;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "sendLongClickDeleteBubbleBroadcast aiBubbleData="

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "AIBubbleWidgetDataHelper"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    .line 33
    .line 34
    const-string v2, "concise_ai_bubble_widget.app_bubble"

    .line 35
    .line 36
    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string v2, "com.android.systemui"

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    const-string v2, "type"

    .line 45
    .line 46
    const-string v3, "delete"

    .line 47
    .line 48
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    const-string v2, "pkg"

    .line 52
    .line 53
    iget-object v3, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    const-string v2, "count"

    .line 59
    .line 60
    iget v3, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->count:I

    .line 61
    .line 62
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v0, "sendLongClickDeleteBubbleBroadcast error, aiBubbleData="

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    :cond_1
    :goto_0
    return-void
.end method

.method private r0(Landroid/content/Context;ZLcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V
    .locals 7

    .line 1
    if-eqz p3, :cond_7

    .line 2
    .line 3
    invoke-virtual {p3}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_5

    .line 10
    .line 11
    :cond_0
    if-nez p2, :cond_1

    .line 12
    .line 13
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/l;->q:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {p3}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->getKey()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    sget-object p2, Lcom/android/launcher3/widget/custom/bubble/l;->x:Ljava/util/List;

    .line 26
    .line 27
    iget-object v0, p3, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {p2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    goto/16 :goto_5

    .line 36
    .line 37
    :cond_1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    const/4 v0, 0x0

    .line 42
    if-eqz p2, :cond_3

    .line 43
    .line 44
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->j:Z

    .line 45
    .line 46
    if-nez v1, :cond_2

    .line 47
    .line 48
    iget-boolean v1, p3, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->doubleApp:Z

    .line 49
    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const/16 v2, 0x3e7

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Lcom/zte/mifavor/launcher/adapter/compat/c;->i(I)Landroid/os/UserHandle;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    goto :goto_0

    .line 63
    :cond_2
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    :goto_0
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    iget-object v2, p3, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p2, v2, v1}, Lcom/android/launcher3/D3;->Z(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    if-eqz p2, :cond_3

    .line 78
    .line 79
    const/4 v1, 0x1

    .line 80
    invoke-virtual {p2, p1, v1}, Lcom/android/launcher3/model/data/z;->G(Landroid/content/Context;I)Ls1/o;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object p2, p2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 85
    .line 86
    iget-object p2, p2, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    move-object p1, v0

    .line 90
    move-object p2, p1

    .line 91
    :goto_1
    if-eqz p1, :cond_5

    .line 92
    .line 93
    instance-of v1, p1, Ls1/d0;

    .line 94
    .line 95
    if-eqz v1, :cond_4

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_4
    :goto_2
    move-object v4, p1

    .line 99
    goto :goto_4

    .line 100
    :cond_5
    :goto_3
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 101
    .line 102
    iget-object p2, p3, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {p1, p2}, Lcom/android/launcher3/widget/custom/bubble/l;->A(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {p1}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    goto :goto_2

    .line 113
    :goto_4
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 114
    .line 115
    invoke-static {p1, p2}, Lk2/a;->a(Landroid/content/Context;Landroid/graphics/Bitmap;)I

    .line 116
    .line 117
    .line 118
    move-result v5

    .line 119
    if-eqz v5, :cond_6

    .line 120
    .line 121
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/l$g;

    .line 122
    .line 123
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 124
    .line 125
    iget-object p2, p3, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {p1, p2}, Lcom/android/launcher3/widget/custom/bubble/l;->B(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    const/4 v6, 0x0

    .line 132
    move-object v2, p3

    .line 133
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/widget/custom/bubble/l$g;-><init>(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ILcom/android/launcher3/widget/custom/bubble/m;)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->q:Ljava/util/HashMap;

    .line 137
    .line 138
    invoke-virtual {v2}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->getKey()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-object v0, v1

    .line 146
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 149
    .line 150
    .line 151
    const-string p1, "syncLoadAppIcon aiBubbleViewData="

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    const-string p1, "AIBubbleWidgetDataHelper"

    .line 164
    .line 165
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    :cond_7
    :goto_5
    return-void
.end method

.method private s0()V
    .locals 3

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->k:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "unregisterDateChangedOrSetTimeReceiver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/l;->l:Landroid/content/BroadcastReceiver;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->k:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    const-string v1, "unregisterDateChangedOrSetTimeReceiver error"

    .line 25
    .line 26
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private t0()V
    .locals 2

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    :try_start_0
    const-string v1, "unregisterDesktopClockStateReceiver"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->s:Landroid/content/BroadcastReceiver;

    .line 11
    .line 12
    invoke-virtual {v1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    const-string v1, "unregisterDesktopClockStateReceiver error"

    .line 18
    .line 19
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private u0()V
    .locals 3

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->o:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "unregisterSettingsNotificationStrObserver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/l;->p:Landroid/database/ContentObserver;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->o:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    const-string v1, "unregisterSettingsNotificationStrObserver error"

    .line 29
    .line 30
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private v0()V
    .locals 3

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->m:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "unregisterTimeTickRegisteredReceiver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/l;->n:Landroid/content/BroadcastReceiver;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->m:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    const-string v1, "unregisterTimeTickRegisteredReceiver error"

    .line 25
    .line 26
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private static w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    const-class p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidget;

    .line 13
    .line 14
    invoke-static {p0}, Lk2/k;->k(Ljava/lang/Class;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_3

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/android/launcher3/widget/T;

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    :goto_1
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-ge v2, v3, :cond_1

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    instance-of v4, v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 46
    .line 47
    if-eqz v4, :cond_2

    .line 48
    .line 49
    check-cast v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    return-object v0
.end method

.method private w0()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/launcher3/notification/NotificationListener;->l()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->h:Ljava/util/Map;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v2, "updateNotificationList "

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "AIBubbleWidgetDataHelper"

    .line 32
    .line 33
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Landroid/service/notification/StatusBarNotification;

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    iget-object v2, v2, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 59
    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object v2, v2, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    invoke-virtual {v1}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget-object v2, v2, Landroid/app/Notification;->fullScreenIntent:Landroid/app/PendingIntent;

    .line 74
    .line 75
    :goto_1
    if-eqz v2, :cond_0

    .line 76
    .line 77
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/bubble/l;->h:Ljava/util/Map;

    .line 78
    .line 79
    invoke-virtual {v1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-nez v3, :cond_0

    .line 88
    .line 89
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/bubble/l;->h:Ljava/util/Map;

    .line 90
    .line 91
    invoke-virtual {v1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    const-string v3, "com.android.systemui"

    .line 99
    .line 100
    invoke-virtual {v1}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_0

    .line 109
    .line 110
    const-string v3, "concise_mode"

    .line 111
    .line 112
    invoke-virtual {v1}, Landroid/service/notification/StatusBarNotification;->getTag()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_0

    .line 121
    .line 122
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->h:Ljava/util/Map;

    .line 123
    .line 124
    const-string v3, "com.zte.userguide"

    .line 125
    .line 126
    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_2
    return-void
.end method


# virtual methods
.method protected C(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)Lcom/android/launcher3/widget/custom/bubble/l$g;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->q:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->getKey()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->q:Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->getKey()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/android/launcher3/widget/custom/bubble/l$g;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public F()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method protected J(Landroid/content/Context;Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)Z
    .locals 2

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->h:Ljava/util/Map;

    .line 31
    .line 32
    iget-object v1, v0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 33
    .line 34
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Landroid/app/PendingIntent;

    .line 39
    .line 40
    invoke-static {p1, p2, v0, p0}, Lcom/android/launcher3/widget/custom/bubble/l;->I(Landroid/content/Context;Landroid/view/View;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Landroid/app/PendingIntent;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method protected P(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V
    .locals 4

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "onBubbleClick bubbleView error, bubbleView="

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 31
    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object v2, v1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v2}, Lh1/a;->h(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 47
    .line 48
    invoke-virtual {p0, v2, p1}, Lcom/android/launcher3/widget/custom/bubble/l;->J(Landroid/content/Context;Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    new-instance v2, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    const-string v3, "onBubbleClick jumped="

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v3, " bubbleData="

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    if-nez p1, :cond_2

    .line 81
    .line 82
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 83
    .line 84
    invoke-static {p1, v1}, Lcom/android/launcher3/widget/custom/bubble/l;->p0(Landroid/content/Context;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 85
    .line 86
    .line 87
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 88
    .line 89
    invoke-static {p0, v1}, Lcom/android/launcher3/widget/custom/bubble/l;->q0(Landroid/content/Context;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_3
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    const-string p1, "onBubbleClick data error, bubbleData="

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method protected T()V
    .locals 3

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    const-string v1, "onDestroy"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-boolean v0, Lcom/android/launcher3/widget/custom/bubble/l;->v:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->q:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->s0()V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->u0()V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->v0()V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->t0()V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/l;->w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getClockView()Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v2}, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->d()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getBubbleContainer()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->G()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getFloatingLayout()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->i0()V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->h:Ljava/util/Map;

    .line 72
    .line 73
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method protected U()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onLauncherModeChanged isConciseMode="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "AIBubbleWidgetDataHelper"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->T()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method protected a0()V
    .locals 2

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    const-string v1, "onLauncherPaused"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->v0()V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getClockView()Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->d()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getBubbleContainer()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->H()V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    return-void
.end method

.method protected b0()V
    .locals 3

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    const-string v1, "onLauncherResumed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/l;->w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getClockView()Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->e()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getBubbleContainer()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->I()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 v0, 0x0

    .line 45
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/custom/bubble/l;->k0(Z)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->o0()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method protected c0()V
    .locals 1

    .line 1
    const-string p0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    const-string v0, "onLauncherStarted"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getBubbleContainer()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->J()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method

.method public close()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected d0()V
    .locals 2

    .line 1
    const-string p0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    const-string v0, "onLauncherStopped"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getBubbleContainer()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->K()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getFloatingLayout()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->k0()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-void
.end method

.method public e0()V
    .locals 2

    .line 1
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    const-string v1, "onLoaderTaskBindAllApplications"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->q:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/widget/custom/bubble/l;->t(ZLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method protected f0(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "onStateChangeStartMFV state="

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 19
    .line 20
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getFloatingLayout()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->l0(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    return-void
.end method

.method protected g0(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "onViewCreated"

    .line 2
    .line 3
    const-string v1, "AIBubbleWidgetDataHelper"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    sput-boolean v0, Lcom/android/launcher3/widget/custom/bubble/l;->v:Z

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->l0()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->n0()V

    .line 15
    .line 16
    .line 17
    instance-of v0, p1, Lcom/android/launcher3/C2;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    check-cast p1, Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->T2()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const-string p1, "onViewCreated isLauncherResumed"

    .line 30
    .line 31
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->o0()V

    .line 35
    .line 36
    .line 37
    :cond_0
    const-string p1, "persist.sys.theme_icon_name"

    .line 38
    .line 39
    const-string v0, ""

    .line 40
    .line 41
    invoke-static {p1, v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->i:Ljava/lang/String;

    .line 46
    .line 47
    const-string v0, "default_theme_49"

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/bubble/l;->j:Z

    .line 54
    .line 55
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->m0()V

    .line 56
    .line 57
    .line 58
    new-instance p1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v0, "onViewCreated mThemeName="

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->i:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->w0()V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public h0()V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getClockView()Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->f()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method public j0(Z)V
    .locals 2

    .line 1
    const-string p0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    const-string v0, "prepareOrResetUnlockAnim"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getClockView()Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1, p1}, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->g(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getBubbleContainer()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->L(Z)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-void
.end method

.method protected t(ZLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)V
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v3

    .line 5
    iput-wide v3, p0, Lcom/android/launcher3/widget/custom/bubble/l;->r:J

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/l;->D(Landroid/content/Context;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    :goto_0
    move v6, v1

    .line 19
    :cond_0
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    if-nez v5, :cond_1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    const-string v5, "com.android.calendar"

    .line 41
    .line 42
    iget-object v7, v1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v5, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    if-eqz v5, :cond_0

    .line 49
    .line 50
    iget-object v5, p0, Lcom/android/launcher3/widget/custom/bubble/l;->q:Ljava/util/HashMap;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->getKey()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v5, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_0

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    goto :goto_0

    .line 64
    :cond_2
    new-instance v0, Lcom/android/launcher3/widget/custom/bubble/h;

    .line 65
    .line 66
    move-object v1, p0

    .line 67
    move-object v5, p2

    .line 68
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/widget/custom/bubble/h;-><init>(Lcom/android/launcher3/widget/custom/bubble/l;Ljava/util/ArrayList;JLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)V

    .line 69
    .line 70
    .line 71
    new-instance p0, Lcom/android/launcher3/widget/custom/bubble/i;

    .line 72
    .line 73
    invoke-direct {p0, v1, v2, p1, v0}, Lcom/android/launcher3/widget/custom/bubble/i;-><init>(Lcom/android/launcher3/widget/custom/bubble/l;Ljava/util/ArrayList;ZLjava/lang/Runnable;)V

    .line 74
    .line 75
    .line 76
    if-eqz v6, :cond_3

    .line 77
    .line 78
    iget-object p1, v1, Lcom/android/launcher3/widget/custom/bubble/l;->g:Landroid/content/Context;

    .line 79
    .line 80
    sget-object p2, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 81
    .line 82
    new-instance v0, Lcom/android/launcher3/widget/custom/bubble/j;

    .line 83
    .line 84
    invoke-direct {v0, p1, p0}, Lcom/android/launcher3/widget/custom/bubble/j;-><init>(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    sget-object p1, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 92
    .line 93
    invoke-virtual {p1, p0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    const-string p0, "AIBubbleWidgetDataHelper"

    .line 2
    .line 3
    const-string v0, "doUnlockAnim"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->w(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getClockView()Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/AIWidgetClockContainer;->b()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getBubbleContainer()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->w()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-void
.end method
