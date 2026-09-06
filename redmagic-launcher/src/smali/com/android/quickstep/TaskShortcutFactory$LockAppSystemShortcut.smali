.class public Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;
.super Lcom/android/launcher3/popup/P;
.source "TaskShortcutFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TaskShortcutFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LockAppSystemShortcut"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/popup/P<",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ">;"
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

.field mLockIcon:Landroid/widget/ImageView;

.field mLockText:Landroid/widget/TextView;

.field mTaskView:Lcom/android/quickstep/views/TaskView;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;)V
    .locals 6

    .line 1
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    .line 8
    move-result-object v5

    .line 9
    const v1, 0x7f080e72

    .line 10
    .line 11
    .line 12
    const v2, 0x7f140223

    .line 13
    .line 14
    .line 15
    move-object v0, p0

    .line 16
    move-object v3, p1

    .line 17
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    const-string p0, "LockAppSystemShortcut"

    .line 21
    .line 22
    iput-object p0, v0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->TAG:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iput-object p0, v0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 29
    .line 30
    iput-object v3, v0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic J(Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->lambda$onClick$0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onClick$0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->A()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0, p1}, Lcom/android/launcher3/resource/TaskProvider;->g(Landroid/content/Context;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, p1}, Lcom/android/launcher3/H5;->d1(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0, p1}, Lcom/android/launcher3/resource/TaskProvider;->k(Landroid/content/Context;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0, p1}, Lcom/android/launcher3/H5;->d(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method private setLockAppResId(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const p1, 0x7f080e73

    .line 4
    .line 5
    .line 6
    iput p1, p0, Lcom/android/launcher3/popup/P;->mIconResId:I

    .line 7
    .line 8
    const p1, 0x7f14046a

    .line 9
    .line 10
    .line 11
    iput p1, p0, Lcom/android/launcher3/popup/P;->mLabelResId:I

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const p1, 0x7f080e72

    .line 15
    .line 16
    .line 17
    iput p1, p0, Lcom/android/launcher3/popup/P;->mIconResId:I

    .line 18
    .line 19
    const p1, 0x7f140223

    .line 20
    .line 21
    .line 22
    iput p1, p0, Lcom/android/launcher3/popup/P;->mLabelResId:I

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public init(Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const v0, 0x7f0b02fc

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/ImageView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mLockIcon:Landroid/widget/ImageView;

    .line 13
    .line 14
    const v0, 0x7f0b05e0

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Landroid/widget/TextView;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mLockText:Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-static {}, Lx1/O;->Q0()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object v0, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 30
    .line 31
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->isAppLocked(Lcom/android/quickstep/views/TaskView;Z)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->setLockAppResId(Z)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public isAppLocked(Lcom/android/quickstep/views/TaskView;Z)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    const-string v0, " , "

    .line 20
    .line 21
    const-string v1, "LockAppSystemShortcut"

    .line 22
    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p2, p0, p1}, Lcom/android/quickstep/views/RecentsView;->getConstructPackageName(Ljava/lang/String;Lcom/android/systemui/shared/recents/model/Task;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    :cond_1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskView;->isAppLocked(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    new-instance p2, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v2, "isZteSceneDecision isAppLocked: "

    .line 53
    .line 54
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    return p1

    .line 74
    :cond_2
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    if-eqz p2, :cond_3

    .line 87
    .line 88
    if-eqz p1, :cond_3

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->A()Ljava/util/ArrayList;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget-object p2, p2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 99
    .line 100
    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    goto :goto_1

    .line 109
    :cond_3
    const/4 p1, 0x0

    .line 110
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .line 114
    .line 115
    const-string v2, " isAppLocked: "

    .line 116
    .line 117
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    return p1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-static {}, Lx1/O;->p0()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const-string v0, "LockAppSystemShortcut"

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p0, "onClick, in monkey, do not lock."

    .line 10
    .line 11
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    const-string p0, "onClick: task null error !!"

    .line 24
    .line 25
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {}, Lx1/O;->Q0()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iget-object v3, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 40
    .line 41
    invoke-virtual {p0, v3, v2}, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->isAppLocked(Lcom/android/quickstep/views/TaskView;Z)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    xor-int/lit8 v4, v3, 0x1

    .line 46
    .line 47
    new-instance v5, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v6, "onClick newLockState: "

    .line 53
    .line 54
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-nez v3, :cond_2

    .line 74
    .line 75
    const v3, 0x7f140133

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    const v3, 0x7f140135

    .line 80
    .line 81
    .line 82
    :goto_0
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v1, v0}, Lh1/a;->H(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 90
    .line 91
    invoke-virtual {v0, v4}, Lcom/android/quickstep/views/TaskView;->setLockImageStatus(Z)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 95
    .line 96
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 101
    .line 102
    invoke-virtual {v0, p1, v4}, Lcom/android/quickstep/views/RecentsView;->changeRelateApp(Lcom/android/systemui/shared/recents/model/Task;Z)V

    .line 103
    .line 104
    .line 105
    invoke-direct {p0, v4}, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->setLockAppResId(Z)V

    .line 106
    .line 107
    .line 108
    iget-object v3, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mLockIcon:Landroid/widget/ImageView;

    .line 109
    .line 110
    iget-object v5, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mLockText:Landroid/widget/TextView;

    .line 111
    .line 112
    invoke-virtual {p0, v3, v5}, Lcom/android/launcher3/popup/P;->setIconAndLabelFor(Landroid/view/View;Landroid/widget/TextView;)V

    .line 113
    .line 114
    .line 115
    invoke-static {}, Lx1/d;->h()Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-eqz v3, :cond_3

    .line 120
    .line 121
    iget-object v3, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 122
    .line 123
    invoke-interface {v3}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    const-string v5, "launcher_recent_lock_app"

    .line 132
    .line 133
    invoke-static {v3, v5}, Lx1/d;->i(Landroid/content/Context;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_3
    sget-object v3, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 138
    .line 139
    iget-object v5, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 140
    .line 141
    invoke-interface {v5}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 142
    .line 143
    .line 144
    move-result-object v5

    .line 145
    invoke-virtual {v3, v5}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    check-cast v3, Lcom/android/launcher3/util/V2;

    .line 150
    .line 151
    sget-object v5, Lcom/android/launcher3/util/V2;->i:Landroid/os/VibrationEffect;

    .line 152
    .line 153
    invoke-virtual {v3, v5}, Lcom/android/launcher3/util/V2;->n(Landroid/os/VibrationEffect;)V

    .line 154
    .line 155
    .line 156
    :goto_1
    if-eqz v2, :cond_4

    .line 157
    .line 158
    iget-object v2, p0, Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 159
    .line 160
    invoke-virtual {v0, v1, p1}, Lcom/android/quickstep/views/RecentsView;->getConstructPackageName(Ljava/lang/String;Lcom/android/systemui/shared/recents/model/Task;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {v2, p1, v4}, Lcom/android/quickstep/views/TaskView;->setAppLockState(Ljava/lang/String;I)Z

    .line 165
    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_4
    sget-object p1, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 169
    .line 170
    new-instance v0, Lcom/android/quickstep/q5;

    .line 171
    .line 172
    invoke-direct {v0, p0, v1}, Lcom/android/quickstep/q5;-><init>(Lcom/android/quickstep/TaskShortcutFactory$LockAppSystemShortcut;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 176
    .line 177
    .line 178
    :goto_2
    invoke-virtual {p0}, Lcom/android/launcher3/popup/P;->dismissTaskMenuView()V

    .line 179
    .line 180
    .line 181
    return-void
.end method
