.class Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;
.super Ljava/lang/Object;
.source "QuickstepInteractionHandler.java"

# interfaces
.implements Landroid/widget/RemoteViews$InteractionHandler;
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/widget/RemoteViews$InteractionHandler;",
        "Ljava/util/function/Consumer<",
        "Lcom/android/launcher3/widget/T;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "QuickstepInteractionHandler"


# instance fields
.field private final mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    .line 6
    return-void
.end method

.method private findHostViewAncestor(Landroid/view/View;)Lcom/android/launcher3/widget/T;
    .locals 0

    .line 1
    :goto_0
    if-eqz p1, :cond_1

    .line 2
    .line 3
    instance-of p0, p1, Lcom/android/launcher3/widget/T;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/widget/T;

    .line 8
    .line 9
    return-object p1

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    move-object p1, p0

    .line 15
    check-cast p1, Landroid/view/View;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method private logAppLaunch(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    instance-of v0, p1, Lcom/android/launcher3/model/data/y;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 18
    .line 19
    .line 20
    :cond_0
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->i:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 21
    .line 22
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public accept(Lcom/android/launcher3/widget/T;)V
    .locals 0

    .line 2
    invoke-virtual {p1, p0}, Landroid/appwidget/AppWidgetHostView;->setInteractionHandler(Landroid/widget/RemoteViews$InteractionHandler;)V

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/T;

    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;->accept(Lcom/android/launcher3/widget/T;)V

    return-void
.end method

.method public finishCurrentRecentsAnimation()Z
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object v1, v0

    .line 16
    :goto_0
    const/4 v2, 0x0

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->isRecentsAnimationFinished()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-nez v3, :cond_1

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    invoke-virtual {v1, v3, v0}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZLjava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    instance-of v0, p0, Lcom/android/launcher3/views/K;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0, v2}, Lcom/android/launcher3/a;->close(Z)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return v2
.end method

.method public onInteraction(Landroid/view/View;Landroid/app/PendingIntent;Landroid/widget/RemoteViews$RemoteResponse;)Z
    .locals 7

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;->findHostViewAncestor(Landroid/view/View;)Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "QuickstepInteractionHandler"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "View did not have a LauncherAppWidgetHostView ancestor."

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3, p1}, Landroid/widget/RemoteViews$RemoteResponse;->getLaunchOptions(Landroid/view/View;)Landroid/util/Pair;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {v0, p2, p0}, Landroid/widget/RemoteViews;->startPendingIntent(Landroid/view/View;Landroid/app/PendingIntent;Landroid/util/Pair;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->isSplitSelectionActive()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v3, 0x1

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    sget-object p2, Lcom/android/launcher3/logging/StatsLogManager$e;->j3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 43
    .line 44
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->handleIncorrectSplitTargetSelection()Z

    .line 50
    .line 51
    .line 52
    return v3

    .line 53
    :cond_1
    invoke-virtual {p3, p1}, Landroid/widget/RemoteViews$RemoteResponse;->getLaunchOptions(Landroid/view/View;)Landroid/util/Pair;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object p3, p0, Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 58
    .line 59
    invoke-virtual {p3}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 68
    .line 69
    invoke-virtual {p3, v0, v2}, Lcom/android/launcher3/q5;->f0(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    invoke-virtual {p2}, Landroid/app/PendingIntent;->isActivity()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-nez v2, :cond_2

    .line 78
    .line 79
    :try_start_0
    invoke-static {}, Landroid/app/ActivityTaskManager;->getService()Landroid/app/IActivityTaskManager;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {p2}, Landroid/app/PendingIntent;->getCreatorPackage()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    iget-object v5, p3, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 88
    .line 89
    invoke-virtual {v5}, Landroid/app/ActivityOptions;->getRemoteAnimationAdapter()Landroid/view/RemoteAnimationAdapter;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    iget-object v6, p3, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 94
    .line 95
    invoke-virtual {v6}, Landroid/app/ActivityOptions;->getLaunchCookie()Landroid/os/IBinder;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    invoke-interface {v2, v4, v5, v6}, Landroid/app/IActivityTaskManager;->registerRemoteAnimationForNextActivityStart(Ljava/lang/String;Landroid/view/RemoteAnimationAdapter;Landroid/os/IBinder;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :catch_0
    move-exception v2

    .line 104
    new-instance v4, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    const-string v5, "onInteraction d:"

    .line 110
    .line 111
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    :cond_2
    :goto_0
    iget-object v2, p3, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 125
    .line 126
    const/high16 v4, 0x10000000

    .line 127
    .line 128
    invoke-virtual {v2, v4}, Landroid/app/ActivityOptions;->setPendingIntentLaunchFlags(I)V

    .line 129
    .line 130
    .line 131
    iget-object v2, p3, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 132
    .line 133
    const/4 v4, 0x0

    .line 134
    invoke-virtual {v2, v4}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 135
    .line 136
    .line 137
    iget-object v2, p3, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 138
    .line 139
    invoke-virtual {v2, v3}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 140
    .line 141
    .line 142
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 143
    .line 144
    check-cast p1, Landroid/content/Intent;

    .line 145
    .line 146
    iget-object p3, p3, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 147
    .line 148
    invoke-static {p1, p3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p2}, Landroid/app/PendingIntent;->isActivity()Z

    .line 153
    .line 154
    .line 155
    move-result p3

    .line 156
    if-eqz p3, :cond_3

    .line 157
    .line 158
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p3

    .line 162
    invoke-direct {p0, p3}, Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;->logAppLaunch(Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    :cond_3
    const-string p3, "onInteraction"

    .line 166
    .line 167
    invoke-static {v1, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;->finishCurrentRecentsAnimation()Z

    .line 171
    .line 172
    .line 173
    invoke-static {v0, p2, p1}, Landroid/widget/RemoteViews;->startPendingIntent(Landroid/view/View;Landroid/app/PendingIntent;Landroid/util/Pair;)Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    return p0
.end method
