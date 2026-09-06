.class public Lcom/android/launcher3/widget/custom/ai/n;
.super Ljava/lang/Object;
.source "AICustomWidgetDataHelper.java"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# static fields
.field private static final A:Ljava/text/SimpleDateFormat;

.field protected static final B:Ljava/text/SimpleDateFormat;

.field protected static final C:Ljava/text/SimpleDateFormat;

.field protected static final D:Ljava/text/SimpleDateFormat;

.field protected static final E:Ljava/text/SimpleDateFormat;

.field protected static final F:Ljava/text/SimpleDateFormat;

.field protected static final G:Ljava/text/SimpleDateFormat;

.field protected static final H:Ljava/text/SimpleDateFormat;

.field private static final I:Landroid/net/Uri;

.field protected static final J:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static u:Z

.field protected static final v:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/widget/custom/ai/n;",
            ">;"
        }
    .end annotation
.end field

.field private static w:Z

.field private static final x:Landroid/net/Uri;

.field private static final y:Landroid/net/Uri;

.field private static final z:[Ljava/lang/String;


# instance fields
.field private g:Landroid/content/Context;

.field private h:Ljava/lang/String;

.field private i:Z

.field private j:Landroid/content/BroadcastReceiver;

.field private k:Z

.field private l:Landroid/content/BroadcastReceiver;

.field private m:Z

.field private n:Z

.field private o:Z

.field private p:Landroid/content/BroadcastReceiver;

.field private q:Landroid/database/ContentObserver;

.field private r:Landroid/database/ContentObserver;

.field private s:Z

.field private t:Landroid/database/ContentObserver;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-boolean v0, Lcom/android/launcher3/O;->a:Z

    .line 2
    .line 3
    sput-boolean v0, Lcom/android/launcher3/widget/custom/ai/n;->u:Z

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 6
    .line 7
    new-instance v1, Lcom/android/launcher3/widget/custom/ai/l;

    .line 8
    .line 9
    invoke-direct {v1}, Lcom/android/launcher3/widget/custom/ai/l;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->v:Lcom/android/launcher3/util/I;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    sput-boolean v0, Lcom/android/launcher3/widget/custom/ai/n;->w:Z

    .line 19
    .line 20
    const-string v0, "content://com.zte.mifavor.miboard.data.customprovider/aiwidget/express"

    .line 21
    .line 22
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->x:Landroid/net/Uri;

    .line 27
    .line 28
    const-string v0, "content://com.zte.mifavor.miboard.data.customprovider/aiwidget/travel"

    .line 29
    .line 30
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->y:Landroid/net/Uri;

    .line 35
    .line 36
    const-string v0, "202"

    .line 37
    .line 38
    const-string v1, "203"

    .line 39
    .line 40
    const-string v2, "200"

    .line 41
    .line 42
    const-string v3, "201"

    .line 43
    .line 44
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->z:[Ljava/lang/String;

    .line 49
    .line 50
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 51
    .line 52
    const-string v1, "HH:mm"

    .line 53
    .line 54
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->A:Ljava/text/SimpleDateFormat;

    .line 58
    .line 59
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 60
    .line 61
    const-string v2, "M\u6708d\u65e5"

    .line 62
    .line 63
    invoke-direct {v0, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->B:Ljava/text/SimpleDateFormat;

    .line 67
    .line 68
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 69
    .line 70
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->C:Ljava/text/SimpleDateFormat;

    .line 74
    .line 75
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 76
    .line 77
    const-string v1, "yyyy-MM-dd"

    .line 78
    .line 79
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->D:Ljava/text/SimpleDateFormat;

    .line 83
    .line 84
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 85
    .line 86
    const-string v2, "yyyy-MM-dd HH:mm"

    .line 87
    .line 88
    invoke-direct {v0, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->E:Ljava/text/SimpleDateFormat;

    .line 92
    .line 93
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 94
    .line 95
    const-string v3, "MM-dd HH:mm"

    .line 96
    .line 97
    invoke-direct {v0, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->F:Ljava/text/SimpleDateFormat;

    .line 101
    .line 102
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 103
    .line 104
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->G:Ljava/text/SimpleDateFormat;

    .line 108
    .line 109
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 110
    .line 111
    invoke-direct {v0, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->H:Ljava/text/SimpleDateFormat;

    .line 115
    .line 116
    const-string v0, "content://com.zte.notice.strategy.contentprovider"

    .line 117
    .line 118
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->I:Landroid/net/Uri;

    .line 123
    .line 124
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/n$d;

    .line 125
    .line 126
    invoke-direct {v0}, Lcom/android/launcher3/widget/custom/ai/n$d;-><init>()V

    .line 127
    .line 128
    .line 129
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/n;->J:Ljava/util/HashMap;

    .line 130
    .line 131
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/ai/n;->h:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/ai/n;->i:Z

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/widget/custom/ai/n$e;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/ai/n$e;-><init>(Lcom/android/launcher3/widget/custom/ai/n;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->j:Landroid/content/BroadcastReceiver;

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/ai/n;->k:Z

    .line 19
    .line 20
    new-instance v1, Lcom/android/launcher3/widget/custom/ai/n$f;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/ai/n$f;-><init>(Lcom/android/launcher3/widget/custom/ai/n;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->l:Landroid/content/BroadcastReceiver;

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/ai/n;->m:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/ai/n;->n:Z

    .line 30
    .line 31
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/ai/n;->o:Z

    .line 32
    .line 33
    new-instance v1, Lcom/android/launcher3/widget/custom/ai/n$g;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/ai/n$g;-><init>(Lcom/android/launcher3/widget/custom/ai/n;)V

    .line 36
    .line 37
    .line 38
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->p:Landroid/content/BroadcastReceiver;

    .line 39
    .line 40
    new-instance v1, Lcom/android/launcher3/widget/custom/ai/n$h;

    .line 41
    .line 42
    new-instance v2, Landroid/os/Handler;

    .line 43
    .line 44
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 49
    .line 50
    .line 51
    invoke-direct {v1, p0, v2}, Lcom/android/launcher3/widget/custom/ai/n$h;-><init>(Lcom/android/launcher3/widget/custom/ai/n;Landroid/os/Handler;)V

    .line 52
    .line 53
    .line 54
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->q:Landroid/database/ContentObserver;

    .line 55
    .line 56
    new-instance v1, Lcom/android/launcher3/widget/custom/ai/n$i;

    .line 57
    .line 58
    new-instance v2, Landroid/os/Handler;

    .line 59
    .line 60
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 65
    .line 66
    .line 67
    invoke-direct {v1, p0, v2}, Lcom/android/launcher3/widget/custom/ai/n$i;-><init>(Lcom/android/launcher3/widget/custom/ai/n;Landroid/os/Handler;)V

    .line 68
    .line 69
    .line 70
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->r:Landroid/database/ContentObserver;

    .line 71
    .line 72
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/ai/n;->s:Z

    .line 73
    .line 74
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/n$b;

    .line 75
    .line 76
    new-instance v1, Landroid/os/Handler;

    .line 77
    .line 78
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 83
    .line 84
    .line 85
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/widget/custom/ai/n$b;-><init>(Lcom/android/launcher3/widget/custom/ai/n;Landroid/os/Handler;)V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/ai/n;->t:Landroid/database/ContentObserver;

    .line 89
    .line 90
    const-string v0, "AICustomWidgetDataHelper"

    .line 91
    .line 92
    const-string v1, "AICustomWidgetDataHelper new INSTANCE"

    .line 93
    .line 94
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    const/4 v0, 0x1

    .line 98
    sput-boolean v0, Lcom/android/launcher3/widget/custom/ai/n;->w:Z

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 105
    .line 106
    return-void
.end method

.method private A0()V
    .locals 3

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->k:Z

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
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/n;->l:Landroid/content/BroadcastReceiver;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->k:Z
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

.method private B0()V
    .locals 3

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->o:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "unregisterTodoReceiver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/n;->p:Landroid/content/BroadcastReceiver;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->o:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    const-string v1, "unregisterTodoReceiver error"

    .line 25
    .line 26
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private C()V
    .locals 2

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    const-string v1, "callNoticeOnLauncherEnterConciseMode"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 9
    .line 10
    new-instance v1, Lcom/android/launcher3/widget/custom/ai/m;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/ai/m;-><init>(Lcom/android/launcher3/widget/custom/ai/n;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private static E(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;",
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
    const-class p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidget;

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
    instance-of v4, v3, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

    .line 46
    .line 47
    if-eqz v4, :cond_2

    .line 48
    .line 49
    check-cast v3, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

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

.method private static F()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Landroid/text/format/Time;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/text/format/Time;->setToNow()V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Landroid/text/format/Time;->toMillis(Z)J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    iget-wide v3, v0, Landroid/text/format/Time;->gmtoff:J

    .line 15
    .line 16
    invoke-static {v1, v2, v3, v4}, Landroid/text/format/Time;->getJulianDay(JJ)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    return-object v0
.end method

.method public static I(Ljava/lang/String;Z)J
    .locals 4

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-wide v1

    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    sget-object p1, Lcom/android/launcher3/widget/custom/ai/n;->G:Ljava/text/SimpleDateFormat;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    sget-object p1, Lcom/android/launcher3/widget/custom/ai/n;->H:Ljava/text/SimpleDateFormat;

    .line 16
    .line 17
    :goto_0
    :try_start_0
    invoke-virtual {p1, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 18
    .line 19
    .line 20
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    goto :goto_1

    .line 22
    :catchall_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v3, "checkTimeStrIsFormat error, timeStr="

    .line 28
    .line 29
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v3, ", format="

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v3, "AICustomWidgetDataHelper"

    .line 52
    .line 53
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    :goto_1
    if-nez v0, :cond_2

    .line 58
    .line 59
    return-wide v1

    .line 60
    :cond_2
    invoke-virtual {p1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_3

    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 71
    .line 72
    .line 73
    move-result-wide v1

    .line 74
    :cond_3
    return-wide v1
.end method

.method public static J()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/launcher3/widget/custom/ai/n;->w:Z

    .line 2
    .line 3
    return v0
.end method

.method protected static L(JJ)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "yyyyMMdd"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method protected static M(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getEventType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v0, 0x65

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method protected static P(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getEventType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v0, 0x66

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method protected static T(J)Z
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance v2, Ljava/text/SimpleDateFormat;

    .line 6
    .line 7
    const-string v3, "yyyyMMdd"

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v2, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v2, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method protected static U(Landroid/content/Context;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;)V
    .locals 5

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    :try_start_0
    const-string v1, "jumpToCalendar "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance v1, Landroid/content/Intent;

    .line 9
    .line 10
    const-string v2, "android.intent.action.VIEW"

    .line 11
    .line 12
    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v2, Landroid/provider/CalendarContract$Events;->CONTENT_URI:Landroid/net/Uri;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getEventId()J

    .line 18
    .line 19
    .line 20
    move-result-wide v3

    .line 21
    invoke-static {v2, v3, v4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v1, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    new-instance p1, Landroid/content/ComponentName;

    .line 29
    .line 30
    const-string v2, "com.android.calendar"

    .line 31
    .line 32
    const-string v3, "com.android.calendar.EventInfoActivity"

    .line 33
    .line 34
    invoke-direct {p1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    const/high16 p1, 0x10000000

    .line 41
    .line 42
    invoke-virtual {v1, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    const-string p1, "jumpToCalendar error"

    .line 51
    .line 52
    invoke-static {v0, p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method protected static a0(Landroid/content/Context;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/widget/custom/ai/n$m;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/ai/n$m;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/widget/custom/ai/n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->d0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected static b0(Landroid/content/Context;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/widget/custom/ai/n$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/ai/n$a;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/widget/custom/ai/n;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method protected static c0(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    const/4 v0, 0x1

    .line 21
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return v0

    .line 25
    :catch_0
    move-exception p0

    .line 26
    const-string p1, "AICustomWidgetDataHelper"

    .line 27
    .line 28
    const-string v0, "jumpToThirdAppMainAty error"

    .line 29
    .line 30
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 31
    .line 32
    .line 33
    return v1
.end method

.method static bridge synthetic d(Lcom/android/launcher3/widget/custom/ai/n;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/ai/n;->n0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic d0()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/android/launcher3/widget/custom/ai/n;->I:Landroid/net/Uri;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/content/ContentResolver;->acquireContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 13
    :try_start_1
    const-string v0, "onLauncherEnterConciseMode"

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1, v1}, Landroid/content/ContentProviderClient;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    .line 18
    .line 19
    :try_start_2
    invoke-virtual {p0}, Landroid/content/ContentProviderClient;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    :try_start_3
    invoke-virtual {p0}, Landroid/content/ContentProviderClient;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_1
    move-exception p0

    .line 31
    :try_start_4
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    :goto_0
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 35
    :catchall_2
    move-exception p0

    .line 36
    const-string v0, "AICustomWidgetDataHelper"

    .line 37
    .line 38
    const-string v1, "callNoticeOnLauncherEnterConciseMode error"

    .line 39
    .line 40
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/widget/custom/ai/n;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->u0()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic g()Landroid/net/Uri;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/custom/ai/n;->x:Landroid/net/Uri;

    .line 2
    .line 3
    return-object v0
.end method

.method protected static i0(Landroid/view/View;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onNoticeCardItemClick noticeData="

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
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "AICustomWidgetDataHelper"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->isAvailable()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p1, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->pkg:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/custom/ai/n;->c0(Landroid/content/Context;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v0, "onNoticeCardItemClick noticeData error return, noticeData="

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method static bridge synthetic j()Landroid/net/Uri;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/custom/ai/n;->y:Landroid/net/Uri;

    .line 2
    .line 3
    return-object v0
.end method

.method private static m0(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, ", endTime="

    .line 2
    .line 3
    const-string v1, ", beginTime="

    .line 4
    .line 5
    const-string v2, "queryTodoList finally close Exception"

    .line 6
    .line 7
    const-string v3, "AICustomWidgetDataHelper"

    .line 8
    .line 9
    new-instance v4, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v8, "eventType NOT IN (?, ?, ?, ?)"

    .line 15
    .line 16
    sget-object v9, Lcom/android/launcher3/widget/custom/ai/n;->z:[Ljava/lang/String;

    .line 17
    .line 18
    const/4 v11, 0x0

    .line 19
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/widget/custom/ai/n;->F()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    sget-object v6, Landroid/provider/CalendarContract$Instances;->CONTENT_BY_DAY_URI:Landroid/net/Uri;

    .line 24
    .line 25
    new-instance v7, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v10, "/"

    .line 34
    .line 35
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    invoke-static {v6, v7}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 54
    .line 55
    invoke-static {v6, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    const-string v7, "content://com.android.calendar.visualprovider"

    .line 60
    .line 61
    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 62
    .line 63
    .line 64
    move-result-object v7

    .line 65
    const-string v10, "get_calendar_provider_data"

    .line 66
    .line 67
    invoke-static {v7, v10}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    invoke-static {v7, v6}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    new-instance v7, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    const-string v10, "queryTodoList curDay="

    .line 81
    .line 82
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    const-string v10, "startDay ASC, begin ASC, title ASC LIMIT 10"

    .line 100
    .line 101
    const/4 v7, 0x0

    .line 102
    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 103
    .line 104
    .line 105
    move-result-object v11

    .line 106
    const-string v5, "title"

    .line 107
    .line 108
    invoke-interface {v11, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    const-string v6, "eventLocation"

    .line 113
    .line 114
    invoke-interface {v11, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    const-string v7, "begin"

    .line 119
    .line 120
    invoke-interface {v11, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    move-result v7

    .line 124
    const-string v8, "end"

    .line 125
    .line 126
    invoke-interface {v11, v8}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v8

    .line 130
    const-string v9, "event_id"

    .line 131
    .line 132
    invoke-interface {v11, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v9

    .line 136
    const-string v10, "allDay"

    .line 137
    .line 138
    invoke-interface {v11, v10}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    move-result v10

    .line 142
    const-string v12, "eventType"

    .line 143
    .line 144
    invoke-interface {v11, v12}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v12

    .line 148
    :goto_0
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    .line 149
    .line 150
    .line 151
    move-result v13
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    if-eqz v13, :cond_3

    .line 153
    .line 154
    :try_start_1
    new-instance v13, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 155
    .line 156
    invoke-direct {v13}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;-><init>()V

    .line 157
    .line 158
    .line 159
    invoke-interface {v11, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v14

    .line 163
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 164
    .line 165
    .line 166
    move-result v15
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 167
    if-eqz v15, :cond_0

    .line 168
    .line 169
    const v15, 0x7f140060

    .line 170
    .line 171
    .line 172
    move/from16 v16, v5

    .line 173
    .line 174
    move-object/from16 v5, p0

    .line 175
    .line 176
    :try_start_2
    invoke-virtual {v5, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v15
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 180
    goto :goto_1

    .line 181
    :catchall_0
    move-exception v0

    .line 182
    move-object v1, v2

    .line 183
    move-object v5, v3

    .line 184
    goto/16 :goto_7

    .line 185
    .line 186
    :catch_0
    move-exception v0

    .line 187
    move-object v1, v2

    .line 188
    move-object v5, v3

    .line 189
    goto/16 :goto_8

    .line 190
    .line 191
    :cond_0
    move/from16 v16, v5

    .line 192
    .line 193
    move-object/from16 v5, p0

    .line 194
    .line 195
    move-object v15, v14

    .line 196
    :goto_1
    :try_start_3
    invoke-virtual {v13, v15}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->setTitle(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    invoke-interface {v11, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v15

    .line 203
    invoke-static {v15}, Lcom/android/launcher3/widget/custom/ai/n;->v0(Ljava/lang/String;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v15

    .line 207
    invoke-virtual {v13, v15}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->setStartTime(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    invoke-interface {v11, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v15
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 214
    move-object/from16 v17, v2

    .line 215
    .line 216
    move-object/from16 v18, v3

    .line 217
    .line 218
    :try_start_4
    invoke-static {v15}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 219
    .line 220
    .line 221
    move-result-wide v2

    .line 222
    invoke-virtual {v13, v2, v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->setStartTimeLong(J)V

    .line 223
    .line 224
    .line 225
    invoke-interface {v11, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-static {v2}, Lcom/android/launcher3/widget/custom/ai/n;->v0(Ljava/lang/String;)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    invoke-virtual {v13, v2}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->setEndTime(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    invoke-interface {v11, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 241
    .line 242
    .line 243
    move-result-wide v2

    .line 244
    invoke-virtual {v13, v2, v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->setEndTimeLong(J)V

    .line 245
    .line 246
    .line 247
    invoke-interface {v11, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v2
    :try_end_4
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 251
    if-nez v2, :cond_1

    .line 252
    .line 253
    :try_start_5
    const-string v3, ""
    :try_end_5
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 254
    .line 255
    goto :goto_2

    .line 256
    :catchall_1
    move-exception v0

    .line 257
    move-object/from16 v1, v17

    .line 258
    .line 259
    move-object/from16 v5, v18

    .line 260
    .line 261
    goto/16 :goto_7

    .line 262
    .line 263
    :catch_1
    move-exception v0

    .line 264
    move-object/from16 v1, v17

    .line 265
    .line 266
    move-object/from16 v5, v18

    .line 267
    .line 268
    goto/16 :goto_8

    .line 269
    .line 270
    :cond_1
    move-object v3, v2

    .line 271
    :goto_2
    :try_start_6
    invoke-virtual {v13, v3}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->setPlace(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    move v3, v6

    .line 275
    invoke-interface {v11, v9}, Landroid/database/Cursor;->getLong(I)J

    .line 276
    .line 277
    .line 278
    move-result-wide v5

    .line 279
    invoke-virtual {v13, v5, v6}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->setEventId(J)V

    .line 280
    .line 281
    .line 282
    invoke-interface {v11, v12}, Landroid/database/Cursor;->getInt(I)I

    .line 283
    .line 284
    .line 285
    move-result v5

    .line 286
    invoke-virtual {v13, v5}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->setEventType(I)V

    .line 287
    .line 288
    .line 289
    const-string v5, "1"

    .line 290
    .line 291
    invoke-interface {v11, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v6

    .line 295
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result v5

    .line 299
    invoke-virtual {v13, v5}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->setAllDay(Z)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    sget-boolean v5, Lcom/android/launcher3/widget/custom/ai/n;->u:Z

    .line 306
    .line 307
    if-eqz v5, :cond_2

    .line 308
    .line 309
    new-instance v5, Ljava/lang/StringBuilder;

    .line 310
    .line 311
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 312
    .line 313
    .line 314
    const-string v6, "queryTodoList title="

    .line 315
    .line 316
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-interface {v11, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v6

    .line 329
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-interface {v11, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v6

    .line 339
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    sget-object v6, Lcom/android/launcher3/widget/custom/ai/n;->F:Ljava/text/SimpleDateFormat;

    .line 346
    .line 347
    invoke-virtual {v13}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getStartTimeLong()J

    .line 348
    .line 349
    .line 350
    move-result-wide v14

    .line 351
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 352
    .line 353
    .line 354
    move-result-object v14

    .line 355
    invoke-virtual {v6, v14}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v14

    .line 359
    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v13}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getEndTimeLong()J

    .line 366
    .line 367
    .line 368
    move-result-wide v13

    .line 369
    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 370
    .line 371
    .line 372
    move-result-object v13

    .line 373
    invoke-virtual {v6, v13}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v6

    .line 377
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 378
    .line 379
    .line 380
    const-string v6, ", allDay="

    .line 381
    .line 382
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-interface {v11, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v6

    .line 389
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    const-string v6, ", location="

    .line 393
    .line 394
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v2
    :try_end_6
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 404
    move-object/from16 v5, v18

    .line 405
    .line 406
    :try_start_7
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    .line 408
    .line 409
    goto :goto_5

    .line 410
    :catchall_2
    move-exception v0

    .line 411
    :goto_3
    move-object/from16 v1, v17

    .line 412
    .line 413
    goto :goto_7

    .line 414
    :catch_2
    move-exception v0

    .line 415
    :goto_4
    move-object/from16 v1, v17

    .line 416
    .line 417
    goto :goto_8

    .line 418
    :catchall_3
    move-exception v0

    .line 419
    move-object/from16 v5, v18

    .line 420
    .line 421
    goto :goto_3

    .line 422
    :catch_3
    move-exception v0

    .line 423
    move-object/from16 v5, v18

    .line 424
    .line 425
    goto :goto_4

    .line 426
    :cond_2
    move-object/from16 v5, v18

    .line 427
    .line 428
    :goto_5
    move v6, v3

    .line 429
    move-object v3, v5

    .line 430
    move/from16 v5, v16

    .line 431
    .line 432
    move-object/from16 v2, v17

    .line 433
    .line 434
    goto/16 :goto_0

    .line 435
    .line 436
    :catchall_4
    move-exception v0

    .line 437
    move-object/from16 v17, v2

    .line 438
    .line 439
    move-object v5, v3

    .line 440
    goto :goto_3

    .line 441
    :catch_4
    move-exception v0

    .line 442
    move-object/from16 v17, v2

    .line 443
    .line 444
    move-object v5, v3

    .line 445
    goto :goto_4

    .line 446
    :cond_3
    move-object/from16 v17, v2

    .line 447
    .line 448
    move-object v5, v3

    .line 449
    new-instance v0, Ljava/lang/StringBuilder;

    .line 450
    .line 451
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 452
    .line 453
    .line 454
    const-string v1, "queryTodoList size= "

    .line 455
    .line 456
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 457
    .line 458
    .line 459
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 460
    .line 461
    .line 462
    move-result v1

    .line 463
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/SecurityException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 471
    .line 472
    .line 473
    :try_start_8
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 474
    .line 475
    .line 476
    return-object v4

    .line 477
    :catchall_5
    move-exception v0

    .line 478
    move-object/from16 v1, v17

    .line 479
    .line 480
    :goto_6
    invoke-static {v5, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 481
    .line 482
    .line 483
    goto :goto_9

    .line 484
    :goto_7
    :try_start_9
    const-string v2, "queryTodoList Exception"

    .line 485
    .line 486
    invoke-static {v5, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_7

    .line 487
    .line 488
    .line 489
    if-eqz v11, :cond_4

    .line 490
    .line 491
    :try_start_a
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 492
    .line 493
    .line 494
    goto :goto_9

    .line 495
    :catchall_6
    move-exception v0

    .line 496
    goto :goto_6

    .line 497
    :catchall_7
    move-exception v0

    .line 498
    move-object v2, v0

    .line 499
    goto :goto_a

    .line 500
    :goto_8
    :try_start_b
    new-instance v2, Ljava/lang/StringBuilder;

    .line 501
    .line 502
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 503
    .line 504
    .line 505
    const-string v3, "queryTodoList SecurityException  "

    .line 506
    .line 507
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 508
    .line 509
    .line 510
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 511
    .line 512
    .line 513
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 514
    .line 515
    .line 516
    move-result-object v0

    .line 517
    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    .line 518
    .line 519
    .line 520
    if-eqz v11, :cond_4

    .line 521
    .line 522
    :try_start_c
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    .line 523
    .line 524
    .line 525
    :cond_4
    :goto_9
    return-object v4

    .line 526
    :goto_a
    if-eqz v11, :cond_5

    .line 527
    .line 528
    :try_start_d
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_8

    .line 529
    .line 530
    .line 531
    goto :goto_b

    .line 532
    :catchall_8
    move-exception v0

    .line 533
    invoke-static {v5, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 534
    .line 535
    .line 536
    :cond_5
    :goto_b
    throw v2
.end method

.method static bridge synthetic n(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/ai/n;->E(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private n0(Z)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/ai/n;->E(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)Ljava/util/ArrayList;

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
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;->getBottomEventLayout()Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2, v3}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->B(Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget-object v1, Lcom/android/launcher3/widget/custom/ai/n;->D:Ljava/text/SimpleDateFormat;

    .line 32
    .line 33
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 34
    .line 35
    .line 36
    move-result-wide v4

    .line 37
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    if-nez p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/ai/n;->h:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->h:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p0, v3, v0}, Lcom/android/launcher3/widget/custom/ai/n;->B(ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private o0()V
    .locals 5

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->i:Z

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
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 33
    .line 34
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/ai/n;->j:Landroid/content/BroadcastReceiver;

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
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->i:Z
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

.method private p0()V
    .locals 5

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->m:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "registerMiBoardExpressObserver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget-object v2, Lcom/android/launcher3/widget/custom/ai/n;->x:Landroid/net/Uri;

    .line 19
    .line 20
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/ai/n;->q:Landroid/database/ContentObserver;

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    invoke-virtual {v1, v2, v4, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 24
    .line 25
    .line 26
    iput-boolean v4, p0, Lcom/android/launcher3/widget/custom/ai/n;->m:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    const-string v1, "registerMiBoardExpressObserver error"

    .line 31
    .line 32
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private q0()V
    .locals 5

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->n:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "registerMiBoardTravelObserver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget-object v2, Lcom/android/launcher3/widget/custom/ai/n;->y:Landroid/net/Uri;

    .line 19
    .line 20
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/ai/n;->r:Landroid/database/ContentObserver;

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    invoke-virtual {v1, v2, v4, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 24
    .line 25
    .line 26
    iput-boolean v4, p0, Lcom/android/launcher3/widget/custom/ai/n;->n:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    const-string v1, "registerMiBoardTravelObserver error"

    .line 31
    .line 32
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private r0()V
    .locals 5

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->s:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "registerNoticeObserver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget-object v2, Lcom/android/launcher3/widget/custom/ai/n;->I:Landroid/net/Uri;

    .line 19
    .line 20
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/ai/n;->t:Landroid/database/ContentObserver;

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    invoke-virtual {v1, v2, v4, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 24
    .line 25
    .line 26
    iput-boolean v4, p0, Lcom/android/launcher3/widget/custom/ai/n;->s:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    const-string v1, "registerNoticeObserver error"

    .line 31
    .line 32
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private s0()V
    .locals 5

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->k:Z

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
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/ai/n;->l:Landroid/content/BroadcastReceiver;

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
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->k:Z
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

.method static bridge synthetic t(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/ai/n;->m0(Landroid/content/Context;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private t0()V
    .locals 5

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->o:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "registerTodoReceiver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    new-instance v1, Landroid/content/IntentFilter;

    .line 13
    .line 14
    const-string v2, "com.android.calendar.UPDATE_WIDGET"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 20
    .line 21
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/ai/n;->p:Landroid/content/BroadcastReceiver;

    .line 22
    .line 23
    const/4 v4, 0x2

    .line 24
    invoke-virtual {v2, v3, v1, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->o:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    const-string v1, "registerTodoReceiver error"

    .line 33
    .line 34
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method private u0()Ljava/util/ArrayList;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v1, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    new-instance v2, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    move-object/from16 v0, p0

    .line 10
    .line 11
    :try_start_0
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v5, Lcom/android/launcher3/widget/custom/ai/n;->I:Landroid/net/Uri;

    .line 18
    .line 19
    invoke-virtual {v0, v5}, Landroid/content/ContentResolver;->acquireContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 20
    .line 21
    .line 22
    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 23
    const/4 v8, 0x0

    .line 24
    const/4 v9, 0x0

    .line 25
    const/4 v6, 0x0

    .line 26
    const/4 v7, 0x0

    .line 27
    :try_start_1
    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentProviderClient;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    if-eqz v3, :cond_7

    .line 32
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v5, "syncGetNoticeDataList cursor.getCount="

    .line 39
    .line 40
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    const-string v0, "mTitleText"

    .line 58
    .line 59
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    const-string v5, "mContentText"

    .line 64
    .line 65
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    const-string v6, "mMessageTime"

    .line 70
    .line 71
    invoke-interface {v3, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    const-string v7, "isGroup"

    .line 76
    .line 77
    invoke-interface {v3, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    const-string v8, "allContentText"

    .line 82
    .line 83
    invoke-interface {v3, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v8

    .line 87
    const-string v9, "mPackage"

    .line 88
    .line 89
    invoke-interface {v3, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v9

    .line 93
    const-string v10, "messageItemCount"

    .line 94
    .line 95
    invoke-interface {v3, v10}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result v10

    .line 99
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    .line 100
    .line 101
    .line 102
    move-result v11

    .line 103
    if-eqz v11, :cond_7

    .line 104
    .line 105
    new-instance v11, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;

    .line 106
    .line 107
    invoke-direct {v11}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 108
    .line 109
    .line 110
    const-string v12, ""

    .line 111
    .line 112
    if-ltz v0, :cond_0

    .line 113
    .line 114
    :try_start_2
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v13

    .line 118
    goto :goto_1

    .line 119
    :catchall_0
    move-exception v0

    .line 120
    move-object v5, v3

    .line 121
    move-object v3, v0

    .line 122
    goto :goto_8

    .line 123
    :cond_0
    move-object v13, v12

    .line 124
    :goto_1
    iput-object v13, v11, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->title:Ljava/lang/String;

    .line 125
    .line 126
    if-ltz v5, :cond_1

    .line 127
    .line 128
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v13

    .line 132
    goto :goto_2

    .line 133
    :cond_1
    move-object v13, v12

    .line 134
    :goto_2
    iput-object v13, v11, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->originContent:Ljava/lang/String;

    .line 135
    .line 136
    if-ltz v6, :cond_2

    .line 137
    .line 138
    invoke-interface {v3, v6}, Landroid/database/Cursor;->getLong(I)J

    .line 139
    .line 140
    .line 141
    move-result-wide v15

    .line 142
    move-wide v13, v15

    .line 143
    goto :goto_3

    .line 144
    :cond_2
    const-wide/16 v13, 0x0

    .line 145
    .line 146
    :goto_3
    iput-wide v13, v11, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->msgTime:J

    .line 147
    .line 148
    if-ltz v7, :cond_3

    .line 149
    .line 150
    invoke-interface {v3, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 151
    .line 152
    .line 153
    move-result v13

    .line 154
    goto :goto_4

    .line 155
    :cond_3
    const/4 v13, -0x1

    .line 156
    :goto_4
    iput v13, v11, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->isGroup:I

    .line 157
    .line 158
    if-ltz v8, :cond_4

    .line 159
    .line 160
    invoke-interface {v3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v13

    .line 164
    goto :goto_5

    .line 165
    :cond_4
    move-object v13, v12

    .line 166
    :goto_5
    iput-object v13, v11, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->summary:Ljava/lang/String;

    .line 167
    .line 168
    if-ltz v9, :cond_5

    .line 169
    .line 170
    invoke-interface {v3, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v12

    .line 174
    :cond_5
    iput-object v12, v11, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->pkg:Ljava/lang/String;

    .line 175
    .line 176
    if-ltz v10, :cond_6

    .line 177
    .line 178
    invoke-interface {v3, v10}, Landroid/database/Cursor;->getLong(I)J

    .line 179
    .line 180
    .line 181
    move-result-wide v13

    .line 182
    goto :goto_6

    .line 183
    :cond_6
    const-wide/16 v13, 0x0

    .line 184
    .line 185
    :goto_6
    iput-wide v13, v11, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetNoticeData;->count:J

    .line 186
    .line 187
    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 188
    .line 189
    .line 190
    goto :goto_0

    .line 191
    :cond_7
    :try_start_3
    invoke-virtual {v4}, Landroid/content/ContentProviderClient;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 192
    .line 193
    .line 194
    :goto_7
    invoke-static {v3}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 195
    .line 196
    .line 197
    goto :goto_b

    .line 198
    :catchall_1
    move-exception v0

    .line 199
    goto :goto_a

    .line 200
    :goto_8
    if-eqz v4, :cond_8

    .line 201
    .line 202
    :try_start_4
    invoke-virtual {v4}, Landroid/content/ContentProviderClient;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 203
    .line 204
    .line 205
    goto :goto_9

    .line 206
    :catchall_2
    move-exception v0

    .line 207
    :try_start_5
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 208
    .line 209
    .line 210
    goto :goto_9

    .line 211
    :catchall_3
    move-exception v0

    .line 212
    move-object v3, v5

    .line 213
    goto :goto_a

    .line 214
    :cond_8
    :goto_9
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 215
    :goto_a
    :try_start_6
    const-string v4, "syncGetNoticeDataList error"

    .line 216
    .line 217
    invoke-static {v1, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 218
    .line 219
    .line 220
    goto :goto_7

    .line 221
    :goto_b
    new-instance v0, Ljava/lang/StringBuilder;

    .line 222
    .line 223
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 224
    .line 225
    .line 226
    const-string v3, "syncGetNoticeDataList noticeDataList="

    .line 227
    .line 228
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    .line 240
    .line 241
    return-object v2

    .line 242
    :catchall_4
    move-exception v0

    .line 243
    invoke-static {v3}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 244
    .line 245
    .line 246
    throw v0
.end method

.method private static v0(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance p0, Ljava/util/GregorianCalendar;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/util/GregorianCalendar;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Ljava/util/GregorianCalendar;->setTimeInMillis(J)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/android/launcher3/widget/custom/ai/n;->A:Ljava/text/SimpleDateFormat;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/GregorianCalendar;->getTime()Ljava/util/Date;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method private w0()V
    .locals 3

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->i:Z

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
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/n;->j:Landroid/content/BroadcastReceiver;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->i:Z
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

.method private x0()V
    .locals 3

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->m:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "unregisterMiBoardExpressObserver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/n;->q:Landroid/database/ContentObserver;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->m:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    const-string v1, "unregisterMiBoardExpressObserver error"

    .line 29
    .line 30
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private y0()V
    .locals 3

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->n:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "unregisterMiBoardTravelObserver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/n;->r:Landroid/database/ContentObserver;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->n:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    const-string v1, "unregisterMiBoardTravelObserver error"

    .line 29
    .line 30
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private z0()V
    .locals 3

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->s:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v1, "unregisterNoticeObserver"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->g:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/n;->t:Landroid/database/ContentObserver;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/ai/n;->s:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    const-string v1, "unregisterNoticeObserver error"

    .line 29
    .line 30
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method


# virtual methods
.method protected A(ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/n$c;

    .line 4
    .line 5
    invoke-direct {v0, p0, p2}, Lcom/android/launcher3/widget/custom/ai/n$c;-><init>(Lcom/android/launcher3/widget/custom/ai/n;Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected B(ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/n$l;

    .line 4
    .line 5
    invoke-direct {v0, p0, p2}, Lcom/android/launcher3/widget/custom/ai/n$l;-><init>(Lcom/android/launcher3/widget/custom/ai/n;Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public D()V
    .locals 0

    .line 1
    return-void
.end method

.method public close()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/n;->e0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected e0()V
    .locals 2

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

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
    sput-boolean v0, Lcom/android/launcher3/widget/custom/ai/n;->w:Z

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->z0()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->x0()V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->y0()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->B0()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->w0()V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->A0()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method protected f0()V
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
    const-string v1, "AICustomWidgetDataHelper"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/n;->e0()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method protected g0()V
    .locals 2

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

    .line 2
    .line 3
    const-string v1, "onLauncherPaused"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->A0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected h0()V
    .locals 2

    .line 1
    const-string v0, "AICustomWidgetDataHelper"

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
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/custom/ai/n;->n0(Z)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->s0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method protected j0(Ljava/util/function/Predicate;Ljava/util/function/Predicate;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/util/L1;",
            ">;",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    const-string p2, "com.android.contacts"

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, p2, v0}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 10
    .line 11
    .line 12
    new-instance p2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v0, "onUnreadChanged "

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-interface {p1, p0}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "AICustomWidgetDataHelper"

    .line 34
    .line 35
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method protected k0(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "onViewCreated"

    .line 2
    .line 3
    const-string v1, "AICustomWidgetDataHelper"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    sput-boolean v0, Lcom/android/launcher3/widget/custom/ai/n;->w:Z

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->r0()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->p0()V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->q0()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->t0()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->o0()V

    .line 24
    .line 25
    .line 26
    instance-of v0, p1, Lcom/android/launcher3/C2;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    check-cast p1, Lcom/android/launcher3/C2;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->T2()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    const-string p1, "onViewCreated isLauncherResumed"

    .line 39
    .line 40
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->s0()V

    .line 44
    .line 45
    .line 46
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/n;->C()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public l0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method protected v(ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/widget/custom/ai/n$j;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/widget/custom/ai/n$j;-><init>(Lcom/android/launcher3/widget/custom/ai/n;ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected w(ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/widget/custom/ai/n$k;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/widget/custom/ai/n$k;-><init>(Lcom/android/launcher3/widget/custom/ai/n;ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
