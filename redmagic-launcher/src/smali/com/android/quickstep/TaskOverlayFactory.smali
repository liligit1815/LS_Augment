.class public Lcom/android/quickstep/TaskOverlayFactory;
.super Ljava/lang/Object;
.source "TaskOverlayFactory.java"

# interfaces
.implements Lcom/android/launcher3/util/V1;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;,
        Lcom/android/quickstep/TaskOverlayFactory$OverlayUICallbacks;
    }
.end annotation


# static fields
.field public static final MENU_OPTIONS:[Lcom/android/quickstep/TaskShortcutFactory;

.field private static final TAG:Ljava/lang/String; = "TaskOverlayFactory"


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    sget-object v0, Lcom/android/quickstep/DesktopSystemShortcut;->Companion:Lcom/android/quickstep/DesktopSystemShortcut$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/DesktopSystemShortcut$Companion;->createFactory()Lcom/android/quickstep/TaskShortcutFactory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/quickstep/ExternalDisplaySystemShortcut;->Companion:Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/quickstep/ExternalDisplaySystemShortcut$Companion;->createFactory()Lcom/android/quickstep/TaskShortcutFactory;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-object v2, Lcom/android/quickstep/AspectRatioSystemShortcut;->Companion:Lcom/android/quickstep/AspectRatioSystemShortcut$Companion;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/android/quickstep/AspectRatioSystemShortcut$Companion;->createFactory()Lcom/android/quickstep/TaskShortcutFactory;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/16 v3, 0x10

    .line 20
    .line 21
    new-array v3, v3, [Lcom/android/quickstep/TaskShortcutFactory;

    .line 22
    .line 23
    sget-object v4, Lcom/android/quickstep/TaskShortcutFactory;->APP_INFO:Lcom/android/quickstep/TaskShortcutFactory;

    .line 24
    .line 25
    const/4 v5, 0x0

    .line 26
    aput-object v4, v3, v5

    .line 27
    .line 28
    sget-object v4, Lcom/android/quickstep/TaskShortcutFactory;->SPLIT_SELECT:Lcom/android/quickstep/TaskShortcutFactory;

    .line 29
    .line 30
    const/4 v5, 0x1

    .line 31
    aput-object v4, v3, v5

    .line 32
    .line 33
    sget-object v4, Lcom/android/quickstep/TaskShortcutFactory;->LOCK_APP:Lcom/android/quickstep/TaskShortcutFactory;

    .line 34
    .line 35
    const/4 v5, 0x2

    .line 36
    aput-object v4, v3, v5

    .line 37
    .line 38
    sget-object v4, Lcom/android/quickstep/TaskShortcutFactory;->MINI_WINDOW:Lcom/android/quickstep/TaskShortcutFactory;

    .line 39
    .line 40
    const/4 v5, 0x3

    .line 41
    aput-object v4, v3, v5

    .line 42
    .line 43
    sget-object v4, Lcom/android/quickstep/TaskShortcutFactory;->SHARE:Lcom/android/quickstep/TaskShortcutFactory;

    .line 44
    .line 45
    const/4 v5, 0x4

    .line 46
    aput-object v4, v3, v5

    .line 47
    .line 48
    sget-object v4, Lcom/android/quickstep/TaskShortcutFactory;->PIN:Lcom/android/quickstep/TaskShortcutFactory;

    .line 49
    .line 50
    const/4 v5, 0x5

    .line 51
    aput-object v4, v3, v5

    .line 52
    .line 53
    sget-object v4, Lcom/android/quickstep/TaskShortcutFactory;->INSTALL:Lcom/android/quickstep/TaskShortcutFactory;

    .line 54
    .line 55
    const/4 v5, 0x6

    .line 56
    aput-object v4, v3, v5

    .line 57
    .line 58
    sget-object v4, Lcom/android/quickstep/TaskShortcutFactory;->FREE_FORM:Lcom/android/quickstep/TaskShortcutFactory;

    .line 59
    .line 60
    const/4 v5, 0x7

    .line 61
    aput-object v4, v3, v5

    .line 62
    .line 63
    const/16 v4, 0x8

    .line 64
    .line 65
    aput-object v0, v3, v4

    .line 66
    .line 67
    const/16 v0, 0x9

    .line 68
    .line 69
    aput-object v1, v3, v0

    .line 70
    .line 71
    const/16 v0, 0xa

    .line 72
    .line 73
    aput-object v2, v3, v0

    .line 74
    .line 75
    sget-object v0, Lcom/android/quickstep/TaskShortcutFactory;->WELLBEING:Lcom/android/quickstep/TaskShortcutFactory;

    .line 76
    .line 77
    const/16 v1, 0xb

    .line 78
    .line 79
    aput-object v0, v3, v1

    .line 80
    .line 81
    sget-object v0, Lcom/android/quickstep/TaskShortcutFactory;->SAVE_APP_PAIR:Lcom/android/quickstep/TaskShortcutFactory;

    .line 82
    .line 83
    const/16 v1, 0xc

    .line 84
    .line 85
    aput-object v0, v3, v1

    .line 86
    .line 87
    sget-object v0, Lcom/android/quickstep/TaskShortcutFactory;->SCREENSHOT:Lcom/android/quickstep/TaskShortcutFactory;

    .line 88
    .line 89
    const/16 v1, 0xd

    .line 90
    .line 91
    aput-object v0, v3, v1

    .line 92
    .line 93
    sget-object v0, Lcom/android/quickstep/TaskShortcutFactory;->MODAL:Lcom/android/quickstep/TaskShortcutFactory;

    .line 94
    .line 95
    const/16 v1, 0xe

    .line 96
    .line 97
    aput-object v0, v3, v1

    .line 98
    .line 99
    sget-object v0, Lcom/android/quickstep/TaskShortcutFactory;->CLOSE:Lcom/android/quickstep/TaskShortcutFactory;

    .line 100
    .line 101
    const/16 v1, 0xf

    .line 102
    .line 103
    aput-object v0, v3, v1

    .line 104
    .line 105
    sput-object v3, Lcom/android/quickstep/TaskOverlayFactory;->MENU_OPTIONS:[Lcom/android/quickstep/TaskShortcutFactory;

    .line 106
    .line 107
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getEnabledShortcuts(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskContainer;)Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/TaskView;",
            "Lcom/android/quickstep/views/TaskContainer;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/popup/P;",
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
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 15
    .line 16
    sget-object v2, Lcom/android/quickstep/TaskOverlayFactory;->MENU_OPTIONS:[Lcom/android/quickstep/TaskShortcutFactory;

    .line 17
    .line 18
    array-length v3, v2

    .line 19
    const/4 v4, 0x0

    .line 20
    move v5, v4

    .line 21
    :goto_0
    if-ge v5, v3, :cond_a

    .line 22
    .line 23
    aget-object v6, v2, v5

    .line 24
    .line 25
    if-nez v6, :cond_0

    .line 26
    .line 27
    goto/16 :goto_2

    .line 28
    .line 29
    :cond_0
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    iget-boolean v7, v7, Lcom/android/launcher3/h0;->G0:Z

    .line 34
    .line 35
    sget-object v7, Lcom/android/quickstep/TaskShortcutFactory;->SCREENSHOT:Lcom/android/quickstep/TaskShortcutFactory;

    .line 36
    .line 37
    if-eq v6, v7, :cond_9

    .line 38
    .line 39
    sget-object v7, Lcom/android/quickstep/TaskShortcutFactory;->SHARE:Lcom/android/quickstep/TaskShortcutFactory;

    .line 40
    .line 41
    if-ne v6, v7, :cond_1

    .line 42
    .line 43
    goto/16 :goto_2

    .line 44
    .line 45
    :cond_1
    instance-of v7, p0, Lcom/android/quickstep/views/GroupedTaskView;

    .line 46
    .line 47
    if-eqz v7, :cond_2

    .line 48
    .line 49
    invoke-interface {v6}, Lcom/android/quickstep/TaskShortcutFactory;->showForGroupedTask()Z

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    if-nez v7, :cond_2

    .line 54
    .line 55
    goto/16 :goto_2

    .line 56
    .line 57
    :cond_2
    instance-of v7, p0, Lcom/android/quickstep/views/DesktopTaskView;

    .line 58
    .line 59
    if-eqz v7, :cond_3

    .line 60
    .line 61
    invoke-interface {v6}, Lcom/android/quickstep/TaskShortcutFactory;->showForDesktopTask()Z

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    if-nez v7, :cond_3

    .line 66
    .line 67
    goto/16 :goto_2

    .line 68
    .line 69
    :cond_3
    sget-object v7, Lcom/android/quickstep/TaskShortcutFactory;->SPLIT_SELECT:Lcom/android/quickstep/TaskShortcutFactory;

    .line 70
    .line 71
    if-ne v6, v7, :cond_4

    .line 72
    .line 73
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    invoke-static {v7}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    iget-boolean v7, v7, Lcom/android/launcher3/r4;->f0:Z

    .line 82
    .line 83
    if-nez v7, :cond_4

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_4
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 87
    .line 88
    .line 89
    move-result-object v7

    .line 90
    if-eqz v7, :cond_7

    .line 91
    .line 92
    sget-object v7, Lcom/android/quickstep/TaskShortcutFactory;->PIN:Lcom/android/quickstep/TaskShortcutFactory;

    .line 93
    .line 94
    if-ne v6, v7, :cond_5

    .line 95
    .line 96
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 97
    .line 98
    .line 99
    move-result-object v8

    .line 100
    invoke-virtual {v8}, Lcom/android/launcher3/H5;->y0()Z

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    if-eqz v8, :cond_5

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_5
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 108
    .line 109
    .line 110
    move-result-object v8

    .line 111
    invoke-virtual {v8}, Lcom/android/launcher3/H5;->X()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v8

    .line 115
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 116
    .line 117
    .line 118
    move-result-object v9

    .line 119
    if-eqz v9, :cond_6

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 122
    .line 123
    .line 124
    move-result-object v9

    .line 125
    invoke-virtual {v9}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 130
    .line 131
    .line 132
    move-result-object v10

    .line 133
    iget-object v10, v10, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 134
    .line 135
    iget v10, v10, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 136
    .line 137
    invoke-static {v10}, Lcom/android/launcher3/resource/h1;->a0(I)Landroid/os/UserHandle;

    .line 138
    .line 139
    .line 140
    move-result-object v10

    .line 141
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 142
    .line 143
    .line 144
    move-result-object v11

    .line 145
    invoke-static {v9, v10, v11}, Lx1/O;->n2(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/content/Context;)Z

    .line 146
    .line 147
    .line 148
    move-result v9

    .line 149
    goto :goto_1

    .line 150
    :cond_6
    move v9, v4

    .line 151
    :goto_1
    if-ne v6, v7, :cond_7

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    invoke-static {v8, v7}, Lx1/O;->d4(Ljava/lang/String;Lcom/android/systemui/shared/recents/model/Task;)Z

    .line 158
    .line 159
    .line 160
    move-result v7

    .line 161
    if-nez v7, :cond_9

    .line 162
    .line 163
    if-eqz v9, :cond_7

    .line 164
    .line 165
    goto :goto_2

    .line 166
    :cond_7
    invoke-interface {v6, v1, p1}, Lcom/android/quickstep/TaskShortcutFactory;->getShortcuts(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;)Ljava/util/List;

    .line 167
    .line 168
    .line 169
    move-result-object v6

    .line 170
    if-nez v6, :cond_8

    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_8
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 174
    .line 175
    .line 176
    :cond_9
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_a
    return-object v0
.end method


# virtual methods
.method public clearAllActiveState()V
    .locals 0

    .line 1
    return-void
.end method

.method public createOverlay(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/RecentsViewContainer;)Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/TaskContainer;",
            "Lcom/android/quickstep/views/RecentsViewContainer;",
            ")",
            "Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay<",
            "*>;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;-><init>(Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public initListeners()V
    .locals 0

    .line 1
    return-void
.end method

.method public removeListeners()V
    .locals 0

    .line 1
    return-void
.end method
