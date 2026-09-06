.class public final Lcom/android/quickstep/util/ActivityPreloadUtil;
.super Ljava/lang/Object;
.source "ActivityPreloadUtil.kt"


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/util/ActivityPreloadUtil;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ActivityPreloadUtil;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/ActivityPreloadUtil;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/util/ActivityPreloadUtil;->INSTANCE:Lcom/android/quickstep/util/ActivityPreloadUtil;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/util/ActivityPreloadUtil;->preloadOverview$lambda$0(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final preloadOverview(Landroid/content/Context;ZZ)V
    .locals 2

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "preloadOverview(fromInit="

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v0, ", forSUWAllSet="

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, ")"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :try_start_0
    sget-object p0, Lcom/android/launcher3/util/n1;->f:Lcom/android/launcher3/util/n1$a;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/n1$a;->a(Landroid/content/Context;)Lcom/android/launcher3/util/n1;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/util/n1;->i()Z

    .line 41
    .line 42
    .line 43
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    if-nez p0, :cond_0

    .line 45
    .line 46
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    :try_start_1
    sget-object p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 57
    .line 58
    sget-object v0, Lcom/android/quickstep/OverviewComponentObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lcom/android/quickstep/OverviewComponentObserver;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isButtonNavMode()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/android/quickstep/OverviewComponentObserver;->isHomeAndOverviewSame()Z

    .line 73
    .line 74
    .line 75
    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    if-nez v1, :cond_1

    .line 77
    .line 78
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    :try_start_2
    invoke-static {p1}, LE1/g;->l(Landroid/content/Context;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_2

    .line 87
    .line 88
    if-eqz p3, :cond_3

    .line 89
    .line 90
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isUserSetupComplete()Z

    .line 91
    .line 92
    .line 93
    move-result p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 94
    if-nez p0, :cond_4

    .line 95
    .line 96
    :cond_3
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_4
    if-eqz p2, :cond_5

    .line 101
    .line 102
    const/4 p0, 0x0

    .line 103
    :try_start_3
    invoke-virtual {v0, p0}, Lcom/android/quickstep/OverviewComponentObserver;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 108
    .line 109
    .line 110
    move-result-object p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 111
    if-eqz p0, :cond_5

    .line 112
    .line 113
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_5
    :try_start_4
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logPreloadRecentsAnimation()V

    .line 118
    .line 119
    .line 120
    new-instance p0, Landroid/content/Intent;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/android/quickstep/OverviewComponentObserver;->getOverviewIntentIgnoreSysUiState()Landroid/content/Intent;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 127
    .line 128
    .line 129
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 130
    .line 131
    new-instance p2, Lcom/android/quickstep/util/d;

    .line 132
    .line 133
    invoke-direct {p2, p0}, Lcom/android/quickstep/util/d;-><init>(Landroid/content/Intent;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 137
    .line 138
    .line 139
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :catchall_0
    move-exception p0

    .line 144
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 145
    .line 146
    .line 147
    throw p0
.end method

.method private static final preloadOverview$lambda$0(Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->preloadRecentsActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static final preloadOverviewForSUWAllSet(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "ctx"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/util/ActivityPreloadUtil;->INSTANCE:Lcom/android/quickstep/util/ActivityPreloadUtil;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-direct {v0, p0, v1, v2}, Lcom/android/quickstep/util/ActivityPreloadUtil;->preloadOverview(Landroid/content/Context;ZZ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static final preloadOverviewForTIS(Landroid/content/Context;Z)V
    .locals 2

    .line 1
    const-string v0, "ctx"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/util/ActivityPreloadUtil;->INSTANCE:Lcom/android/quickstep/util/ActivityPreloadUtil;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, p0, p1, v1}, Lcom/android/quickstep/util/ActivityPreloadUtil;->preloadOverview(Landroid/content/Context;ZZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
