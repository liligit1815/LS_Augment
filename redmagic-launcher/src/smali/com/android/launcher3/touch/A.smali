.class public Lcom/android/launcher3/touch/A;
.super Ljava/lang/Object;
.source "ItemLongClickListener.java"


# static fields
.field public static final a:Landroid/view/View$OnLongClickListener;

.field public static final b:Landroid/view/View$OnLongClickListener;

.field public static c:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/touch/x;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/touch/x;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/touch/A;->a:Landroid/view/View$OnLongClickListener;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/touch/y;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/android/launcher3/touch/y;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/touch/A;->b:Landroid/view/View$OnLongClickListener;

    .line 14
    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    sput-wide v0, Lcom/android/launcher3/touch/A;->c:J

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/touch/A;->e(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic b(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public static c(Landroid/view/View;Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/dragndrop/p;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "beginDrag, item info: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "ItemLongClickListener"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    instance-of v0, v0, Lcom/android/launcher3/model/data/I;

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->a0()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0, p0}, Lcom/android/launcher3/G4;->m(Landroid/view/View;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->s()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_0

    .line 68
    .line 69
    move v0, v2

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const/4 v0, 0x0

    .line 72
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v4, "beginDrag isShowCheckBoxInIconArrangeMode isMoreDragModeOneItem="

    .line 78
    .line 79
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    if-nez v0, :cond_1

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->t()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_2

    .line 103
    .line 104
    new-instance v0, Lc1/a;

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getCellPosMapper()Lc1/c;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v1, p2}, Lc1/c;->a(Lcom/android/launcher3/model/data/y;)Lc1/c$a;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-direct {v0, p0, p2, v1}, Lc1/a;-><init>(Landroid/view/View;Lcom/android/launcher3/model/data/y;Lc1/c$a;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0, v0, p3}, Lcom/android/launcher3/Workspace;->h3(Lc1/a;Lcom/android/launcher3/dragndrop/p;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0, v2}, Lcom/android/launcher3/G4;->g(Z)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v0, v2, v2}, Lcom/android/launcher3/G4;->G(ZZ)V

    .line 137
    .line 138
    .line 139
    :cond_2
    iget v0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 140
    .line 141
    if-ltz v0, :cond_5

    .line 142
    .line 143
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    if-eqz v0, :cond_4

    .line 148
    .line 149
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getIconsInReadingOrder()Ljava/util/ArrayList;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-nez v1, :cond_3

    .line 158
    .line 159
    invoke-virtual {v0, v2}, Lcom/android/launcher3/a;->close(Z)V

    .line 160
    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_3
    invoke-virtual {v0, p0, p3}, Lcom/android/launcher3/folder/Folder;->m2(Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)Z

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_4
    instance-of v0, p0, Lcom/android/launcher3/BubbleTextView;

    .line 168
    .line 169
    if-eqz v0, :cond_5

    .line 170
    .line 171
    move-object v0, p0

    .line 172
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 173
    .line 174
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getParentTransformFolderIcon()Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    if-eqz v1, :cond_5

    .line 179
    .line 180
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getParentTransformFolderIcon()Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p1, p0, p3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->y1(Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)Z

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_5
    :goto_1
    new-instance v0, Lc1/a;

    .line 189
    .line 190
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getCellPosMapper()Lc1/c;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {v1, p2}, Lc1/c;->a(Lcom/android/launcher3/model/data/y;)Lc1/c$a;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-direct {v0, p0, p2, v1}, Lc1/a;-><init>(Landroid/view/View;Lcom/android/launcher3/model/data/y;Lc1/c$a;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-virtual {p0, v0, p3}, Lcom/android/launcher3/Workspace;->h3(Lc1/a;Lcom/android/launcher3/dragndrop/p;)V

    .line 206
    .line 207
    .line 208
    return-void
.end method

.method public static d(Lcom/android/launcher3/C2;)Z
    .locals 3

    .line 1
    const-string v0, "ItemLongClickListener"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    const-string p0, "launcher == null"

    .line 7
    .line 8
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->d3()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    const-string p0, "canStartDrag--launcher.isWorkspaceLocked()"

    .line 19
    .line 20
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    const-string p0, "launcher.getDragController().isDragging()"

    .line 35
    .line 36
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return v1

    .line 40
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->isSplitSelectionActive()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    return v1

    .line 47
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Lcom/android/launcher3/dragndrop/j;->C()Lcom/android/launcher3/dragndrop/p;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    if-eqz v2, :cond_4

    .line 56
    .line 57
    const-string p0, "launcher.getDragController().getOptions() != null"

    .line 58
    .line 59
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    return v1

    .line 63
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_5

    .line 72
    .line 73
    const-string p0, "launcher.getWorkspace().isSwitchingState()"

    .line 74
    .line 75
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    return v1

    .line 79
    :cond_5
    const/4 p0, 0x1

    .line 80
    return p0
.end method

.method private static e(Landroid/view/View;)Z
    .locals 5

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/widget/WidgetCell;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/touch/A;->f(Lcom/android/launcher3/widget/WidgetCell;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const-string v0, "Main"

    .line 13
    .line 14
    const-string v1, "onAllAppsItemLongClick"

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->cancelLongPress()V

    .line 20
    .line 21
    .line 22
    instance-of v0, p0, Lcom/android/launcher3/views/s;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    check-cast p0, Lcom/android/launcher3/views/s;

    .line 27
    .line 28
    invoke-interface {p0}, Lcom/android/launcher3/views/s;->getBubbleText()Lcom/android/launcher3/BubbleTextView;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Lcom/android/launcher3/touch/A;->d(Lcom/android/launcher3/C2;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/4 v2, 0x0

    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    return v2

    .line 48
    :cond_2
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 49
    .line 50
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_3

    .line 55
    .line 56
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 57
    .line 58
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_3

    .line 63
    .line 64
    return v2

    .line 65
    :cond_3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    return v2

    .line 76
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    new-instance v3, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .line 84
    .line 85
    const-string v4, "onAllAppsItemLongClick: appsView.gotoSearchResultAndTheAnimationIsRunning()="

    .line 86
    .line 87
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    if-nez v1, :cond_5

    .line 91
    .line 92
    const-string v4, "null"

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->N()Z

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    const-string v4, "ItemLongClickListener"

    .line 111
    .line 112
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    if-eqz v1, :cond_6

    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->N()Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_6

    .line 122
    .line 123
    return v2

    .line 124
    :cond_6
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    instance-of v4, v3, Lcom/android/launcher3/model/data/y;

    .line 137
    .line 138
    if-eqz v4, :cond_8

    .line 139
    .line 140
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 141
    .line 142
    instance-of v3, v3, Lcom/android/launcher3/model/data/C;

    .line 143
    .line 144
    if-eqz v3, :cond_7

    .line 145
    .line 146
    return v2

    .line 147
    :cond_7
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 152
    .line 153
    invoke-interface {v1, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 154
    .line 155
    .line 156
    :cond_8
    sget-object v3, Lcom/android/launcher3/logging/StatsLogManager$e;->C1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 157
    .line 158
    invoke-interface {v1, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    new-instance v3, Lcom/android/launcher3/touch/A$a;

    .line 166
    .line 167
    invoke-direct {v3, p0, v1}, Lcom/android/launcher3/touch/A$a;-><init>(Landroid/view/View;Lcom/android/launcher3/dragndrop/j;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v1, v3}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    new-instance v3, Lcom/android/launcher3/dragndrop/p;

    .line 182
    .line 183
    invoke-direct {v3}, Lcom/android/launcher3/dragndrop/p;-><init>()V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v1, p0, v0, v3}, Lcom/android/launcher3/Workspace;->F0(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V

    .line 187
    .line 188
    .line 189
    return v2
.end method

.method private static f(Lcom/android/launcher3/widget/WidgetCell;)Z
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->getWidgetView()Lcom/android/launcher3/widget/WidgetImageView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v7, Lcom/android/launcher3/touch/z;

    .line 14
    .line 15
    invoke-direct {v7}, Lcom/android/launcher3/touch/z;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const/4 v3, 0x0

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->getAppWidgetHostViewPreview()Lcom/android/launcher3/widget/x0;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    return v3

    .line 32
    :cond_0
    new-instance v2, Lcom/android/launcher3/widget/H0;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/H0;-><init>(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->getRemoteViewsPreview()Landroid/widget/RemoteViews;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->getAppWidgetHostViewScale()F

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    invoke-virtual {v2, v4, v5}, Lcom/android/launcher3/widget/H0;->w(Landroid/widget/RemoteViews;F)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->getAppWidgetHostViewPreview()Lcom/android/launcher3/widget/x0;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-virtual {v2, v4}, Lcom/android/launcher3/widget/H0;->v(Lcom/android/launcher3/widget/x0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    const/4 v5, 0x2

    .line 60
    const/4 v9, 0x1

    .line 61
    if-eqz v4, :cond_1

    .line 62
    .line 63
    new-array p0, v5, [I

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1, v0, p0}, Lcom/android/launcher3/views/BaseDragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 70
    .line 71
    .line 72
    move v4, v3

    .line 73
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetImageView;->getBitmapBounds()Landroid/graphics/Rect;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    new-instance v6, Landroid/graphics/Point;

    .line 90
    .line 91
    aget v0, p0, v4

    .line 92
    .line 93
    aget p0, p0, v9

    .line 94
    .line 95
    invoke-direct {v6, v0, p0}, Landroid/graphics/Point;-><init>(II)V

    .line 96
    .line 97
    .line 98
    new-instance v8, Lcom/android/launcher3/dragndrop/p;

    .line 99
    .line 100
    invoke-direct {v8}, Lcom/android/launcher3/dragndrop/p;-><init>()V

    .line 101
    .line 102
    .line 103
    move v4, v1

    .line 104
    invoke-virtual/range {v2 .. v8}, Lcom/android/launcher3/widget/H0;->x(Landroid/graphics/Rect;IILandroid/graphics/Point;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_1
    move v4, v3

    .line 109
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->getAppWidgetHostViewPreview()Lcom/android/launcher3/widget/x0;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    new-array v0, v5, [I

    .line 114
    .line 115
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v1, p0, v0}, Lcom/android/launcher3/views/BaseDragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 120
    .line 121
    .line 122
    new-instance v3, Landroid/graphics/Rect;

    .line 123
    .line 124
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, v3}, Lcom/android/launcher3/widget/x0;->d(Landroid/graphics/Rect;)V

    .line 128
    .line 129
    .line 130
    move v1, v4

    .line 131
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getMeasuredWidth()I

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getMeasuredWidth()I

    .line 136
    .line 137
    .line 138
    move-result v5

    .line 139
    new-instance v6, Landroid/graphics/Point;

    .line 140
    .line 141
    aget p0, v0, v1

    .line 142
    .line 143
    aget v0, v0, v9

    .line 144
    .line 145
    invoke-direct {v6, p0, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 146
    .line 147
    .line 148
    new-instance v8, Lcom/android/launcher3/dragndrop/p;

    .line 149
    .line 150
    invoke-direct {v8}, Lcom/android/launcher3/dragndrop/p;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-virtual/range {v2 .. v8}, Lcom/android/launcher3/widget/H0;->x(Landroid/graphics/Rect;IILandroid/graphics/Point;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V

    .line 154
    .line 155
    .line 156
    :goto_0
    return v9
.end method

.method public static g(Landroid/view/View;)Z
    .locals 10

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    const-string v1, "Main"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const-string v0, "Widgets.onLongClick"

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lx1/O;->k1()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    return v2

    .line 20
    :cond_0
    const-string v0, "onWorkspaceItemLongClick"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->u2()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v3, 0x1

    .line 38
    if-nez v1, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->v2()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->O0:Z

    .line 51
    .line 52
    if-eqz v1, :cond_6

    .line 53
    .line 54
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->u2()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 61
    .line 62
    .line 63
    move-result-wide v4

    .line 64
    sget-wide v6, Lcom/android/launcher3/touch/A;->c:J

    .line 65
    .line 66
    sub-long v6, v4, v6

    .line 67
    .line 68
    const-wide/16 v8, 0x7d0

    .line 69
    .line 70
    cmp-long v1, v6, v8

    .line 71
    .line 72
    if-lez v1, :cond_3

    .line 73
    .line 74
    sput-wide v4, Lcom/android/launcher3/touch/A;->c:J

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Lcom/android/launcher3/q4;->g0()V

    .line 81
    .line 82
    .line 83
    :cond_3
    const-string v1, "Launcher"

    .line 84
    .line 85
    const-string v4, "onLongClick--getScreenLockState() || getScreenLockStrictMode()"

    .line 86
    .line 87
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    instance-of v1, p0, Lcom/android/launcher3/folder/FolderIcon;

    .line 91
    .line 92
    if-eqz v1, :cond_4

    .line 93
    .line 94
    return v3

    .line 95
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    sget-object v4, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 100
    .line 101
    invoke-virtual {v1, v4}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_5

    .line 106
    .line 107
    return v3

    .line 108
    :cond_5
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    sget-object v4, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 113
    .line 114
    invoke-virtual {v1, v4}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_6

    .line 119
    .line 120
    return v2

    .line 121
    :cond_6
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    const-string v4, "ItemLongClickListener"

    .line 126
    .line 127
    if-eqz v1, :cond_7

    .line 128
    .line 129
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v1}, Lcom/android/launcher3/folder/Folder;->u1()Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-eqz v1, :cond_7

    .line 138
    .line 139
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v1, v2}, Lcom/android/launcher3/a;->close(Z)V

    .line 144
    .line 145
    .line 146
    const-string v1, "onWorkspaceItemLongClick: isOpenAnimationRunning, close folder"

    .line 147
    .line 148
    invoke-static {v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    :cond_7
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    if-eqz v1, :cond_8

    .line 156
    .line 157
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {v1}, Lcom/android/launcher3/folder/Folder;->getIconsInReadingOrder()Ljava/util/ArrayList;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-nez v1, :cond_8

    .line 170
    .line 171
    const-string v1, "onWorkspaceItemLongClick: folder is exist, this view is not in the opened folder, close folder."

    .line 172
    .line 173
    invoke-static {v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v1, v3}, Lcom/android/launcher3/a;->close(Z)V

    .line 181
    .line 182
    .line 183
    :cond_8
    const/16 v1, 0x8

    .line 184
    .line 185
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 186
    .line 187
    .line 188
    invoke-static {v0}, Lcom/android/launcher3/touch/A;->d(Lcom/android/launcher3/C2;)Z

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    if-nez v1, :cond_9

    .line 193
    .line 194
    return v2

    .line 195
    :cond_9
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 196
    .line 197
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    if-nez v1, :cond_a

    .line 202
    .line 203
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 204
    .line 205
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    if-nez v1, :cond_a

    .line 210
    .line 211
    sget-object v1, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 212
    .line 213
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    if-nez v1, :cond_a

    .line 218
    .line 219
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 220
    .line 221
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-nez v1, :cond_a

    .line 226
    .line 227
    const-string p0, "onLongClick--mState is not NORMAL or OVERVIEW or MENU_OVERVIEW"

    .line 228
    .line 229
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    .line 231
    .line 232
    return v2

    .line 233
    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    instance-of v1, v1, Lcom/android/launcher3/model/data/y;

    .line 238
    .line 239
    if-nez v1, :cond_b

    .line 240
    .line 241
    return v2

    .line 242
    :cond_b
    const/4 v1, 0x0

    .line 243
    invoke-virtual {v0, v1}, Lcom/android/launcher3/C2;->C4(Lcom/android/launcher3/util/O1;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 251
    .line 252
    new-instance v2, Lcom/android/launcher3/dragndrop/p;

    .line 253
    .line 254
    invoke-direct {v2}, Lcom/android/launcher3/dragndrop/p;-><init>()V

    .line 255
    .line 256
    .line 257
    invoke-static {p0, v0, v1, v2}, Lcom/android/launcher3/touch/A;->c(Landroid/view/View;Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/dragndrop/p;)V

    .line 258
    .line 259
    .line 260
    return v3
.end method
