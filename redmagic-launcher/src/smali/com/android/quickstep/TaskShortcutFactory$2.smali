.class Lcom/android/quickstep/TaskShortcutFactory$2;
.super Ljava/lang/Object;
.source "TaskShortcutFactory.java"

# interfaces
.implements Lcom/android/quickstep/TaskShortcutFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TaskShortcutFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/TaskView;Lcom/android/launcher3/util/y2$b;)Lcom/android/launcher3/popup/P;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/TaskShortcutFactory$SplitSelectSystemShortcut;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/quickstep/TaskShortcutFactory$SplitSelectSystemShortcut;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/TaskView;Lcom/android/launcher3/util/y2$b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public getShortcuts(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsViewContainer;",
            "Lcom/android/quickstep/views/TaskContainer;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/popup/P;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->baseIntent:Landroid/content/Intent;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/content/Intent;->getFlags()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    if-nez v3, :cond_0

    .line 26
    .line 27
    sget-object v3, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    :goto_0
    iget-boolean v4, v0, Lcom/android/systemui/shared/recents/model/Task;->isDockable:Z

    .line 35
    .line 36
    const/4 v5, 0x1

    .line 37
    const/4 v6, 0x0

    .line 38
    if-eqz v4, :cond_2

    .line 39
    .line 40
    const/high16 v4, 0x800000

    .line 41
    .line 42
    and-int/2addr v1, v4

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    move v1, v6

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    :goto_1
    move v1, v5

    .line 49
    :goto_2
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    iget-boolean v4, v4, Lcom/android/launcher3/h0;->O0:Z

    .line 54
    .line 55
    const/4 v7, 0x0

    .line 56
    if-nez v1, :cond_9

    .line 57
    .line 58
    if-eqz v4, :cond_3

    .line 59
    .line 60
    goto/16 :goto_6

    .line 61
    .line 62
    :cond_3
    invoke-static {}, Lcom/android/launcher3/y0;->X()Z

    .line 63
    .line 64
    .line 65
    sget-object v1, LF1/b;->n:Lcom/android/launcher3/util/I;

    .line 66
    .line 67
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v1, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, LF1/b;

    .line 76
    .line 77
    invoke-virtual {v1}, LF1/b;->d()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_8

    .line 82
    .line 83
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->f0:Z

    .line 92
    .line 93
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_5

    .line 112
    .line 113
    iget-object v0, p2, Lcom/android/quickstep/views/TaskContainer;->supportSplit:Ljava/lang/Boolean;

    .line 114
    .line 115
    if-nez v0, :cond_4

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_5

    .line 123
    .line 124
    move v0, v5

    .line 125
    goto :goto_4

    .line 126
    :cond_5
    :goto_3
    move v0, v6

    .line 127
    :goto_4
    if-eqz p0, :cond_7

    .line 128
    .line 129
    if-nez v0, :cond_6

    .line 130
    .line 131
    goto :goto_5

    .line 132
    :cond_6
    new-instance p0, Lcom/android/quickstep/TaskShortcutFactory$SplitSelectSystemShortcut;

    .line 133
    .line 134
    new-instance v0, Lcom/android/launcher3/util/y2$b;

    .line 135
    .line 136
    const v1, 0x7f081645

    .line 137
    .line 138
    .line 139
    const v3, 0x7f140328

    .line 140
    .line 141
    .line 142
    invoke-direct {v0, v1, v3, v6, v6}, Lcom/android/launcher3/util/y2$b;-><init>(IIII)V

    .line 143
    .line 144
    .line 145
    invoke-direct {p0, p1, p2, v2, v0}, Lcom/android/quickstep/TaskShortcutFactory$SplitSelectSystemShortcut;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/TaskView;Lcom/android/launcher3/util/y2$b;)V

    .line 146
    .line 147
    .line 148
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    invoke-static {p1, p2}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkTasktInWindow(Landroid/content/Context;Lcom/android/systemui/shared/recents/model/Task;)Z

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    xor-int/2addr p1, v5

    .line 161
    invoke-virtual {p0, p1}, Lcom/android/launcher3/popup/P;->setEnabled(Z)V

    .line 162
    .line 163
    .line 164
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    return-object p0

    .line 169
    :cond_7
    :goto_5
    return-object v7

    .line 170
    :cond_8
    invoke-interface {v3, p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSplitPositionOptions(Lcom/android/launcher3/h0;)Ljava/util/List;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    new-instance v0, Lcom/android/quickstep/l5;

    .line 179
    .line 180
    invoke-direct {v0, p1, p2, v2}, Lcom/android/quickstep/l5;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/views/TaskView;)V

    .line 181
    .line 182
    .line 183
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    check-cast p0, Ljava/util/List;

    .line 196
    .line 197
    return-object p0

    .line 198
    :cond_9
    :goto_6
    return-object v7
.end method
