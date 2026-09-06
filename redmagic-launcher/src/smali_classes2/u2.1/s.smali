.class public Lu2/s;
.super Ljava/lang/Object;
.source "RemoteAnimationTargetCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lu2/s$a;
    }
.end annotation


# static fields
.field public static volatile A:Z = false


# instance fields
.field public final a:I

.field public final b:Z

.field public final c:Landroid/graphics/Rect;

.field public final d:Landroid/graphics/Rect;

.field public final e:Z

.field public f:Z

.field public final g:Z

.field public final h:Landroid/view/SurfaceControl;

.field private final i:Ljava/util/concurrent/locks/ReentrantLock;

.field public final j:Landroid/graphics/Rect;

.field private final k:Landroid/view/SurfaceControl;

.field public l:Z

.field public final m:I

.field public final n:Landroid/graphics/Point;

.field public final o:I

.field public p:I

.field public final q:I

.field public final r:Landroid/graphics/Rect;

.field public final s:Landroid/graphics/Rect;

.field private final t:Landroid/graphics/Rect;

.field public final u:Landroid/graphics/Rect;

.field public v:I

.field public w:Landroid/app/ActivityManager$RunningTaskInfo;

.field public x:Landroid/view/SurfaceControl;

.field public final y:Landroid/app/WindowConfiguration;

.field public final z:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/view/RemoteAnimationTarget;Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lu2/s;->l:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-direct {v0, v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>(Z)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lu2/s;->i:Ljava/util/concurrent/locks/ReentrantLock;

    .line 14
    .line 15
    iput-boolean p2, p0, Lu2/s;->f:Z

    .line 16
    .line 17
    const/4 p2, -0x1

    .line 18
    iput p2, p0, Lu2/s;->p:I

    .line 19
    .line 20
    iget p2, p1, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 21
    .line 22
    iput p2, p0, Lu2/s;->v:I

    .line 23
    .line 24
    iget p2, p1, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 25
    .line 26
    iput p2, p0, Lu2/s;->m:I

    .line 27
    .line 28
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 29
    .line 30
    iput-object p2, p0, Lu2/s;->h:Landroid/view/SurfaceControl;

    .line 31
    .line 32
    iget-boolean p2, p1, Landroid/view/RemoteAnimationTarget;->isTranslucent:Z

    .line 33
    .line 34
    iput-boolean p2, p0, Lu2/s;->g:Z

    .line 35
    .line 36
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->clipRect:Landroid/graphics/Rect;

    .line 37
    .line 38
    iput-object p2, p0, Lu2/s;->c:Landroid/graphics/Rect;

    .line 39
    .line 40
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->position:Landroid/graphics/Point;

    .line 41
    .line 42
    iput-object p2, p0, Lu2/s;->n:Landroid/graphics/Point;

    .line 43
    .line 44
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->localBounds:Landroid/graphics/Rect;

    .line 45
    .line 46
    iput-object p2, p0, Lu2/s;->j:Landroid/graphics/Rect;

    .line 47
    .line 48
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->sourceContainerBounds:Landroid/graphics/Rect;

    .line 49
    .line 50
    iput-object p2, p0, Lu2/s;->s:Landroid/graphics/Rect;

    .line 51
    .line 52
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 53
    .line 54
    iput-object p2, p0, Lu2/s;->r:Landroid/graphics/Rect;

    .line 55
    .line 56
    iput-object p2, p0, Lu2/s;->u:Landroid/graphics/Rect;

    .line 57
    .line 58
    iget p2, p1, Landroid/view/RemoteAnimationTarget;->prefixOrderIndex:I

    .line 59
    .line 60
    iput p2, p0, Lu2/s;->o:I

    .line 61
    .line 62
    iget-boolean p2, p1, Landroid/view/RemoteAnimationTarget;->isNotInRecents:Z

    .line 63
    .line 64
    iput-boolean p2, p0, Lu2/s;->e:Z

    .line 65
    .line 66
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->contentInsets:Landroid/graphics/Rect;

    .line 67
    .line 68
    iput-object p2, p0, Lu2/s;->d:Landroid/graphics/Rect;

    .line 69
    .line 70
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 71
    .line 72
    invoke-virtual {p2}, Landroid/app/WindowConfiguration;->getActivityType()I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    iput p2, p0, Lu2/s;->a:I

    .line 77
    .line 78
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 79
    .line 80
    iput-object p2, p0, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 81
    .line 82
    iget-boolean p2, p1, Landroid/view/RemoteAnimationTarget;->allowEnterPip:Z

    .line 83
    .line 84
    iput-boolean p2, p0, Lu2/s;->b:Z

    .line 85
    .line 86
    iget p2, p1, Landroid/view/RemoteAnimationTarget;->rotationChange:I

    .line 87
    .line 88
    iput p2, p0, Lu2/s;->q:I

    .line 89
    .line 90
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->startLeash:Landroid/view/SurfaceControl;

    .line 91
    .line 92
    iput-object p2, p0, Lu2/s;->k:Landroid/view/SurfaceControl;

    .line 93
    .line 94
    iget p2, p1, Landroid/view/RemoteAnimationTarget;->windowType:I

    .line 95
    .line 96
    iput p2, p0, Lu2/s;->z:I

    .line 97
    .line 98
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 99
    .line 100
    iput-object p2, p0, Lu2/s;->y:Landroid/app/WindowConfiguration;

    .line 101
    .line 102
    iget-object p2, p1, Landroid/view/RemoteAnimationTarget;->startBounds:Landroid/graphics/Rect;

    .line 103
    .line 104
    iput-object p2, p0, Lu2/s;->t:Landroid/graphics/Rect;

    .line 105
    .line 106
    invoke-static {p1}, LU2/a$a;->a(Landroid/view/RemoteAnimationTarget;)Landroid/view/SurfaceControl;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iput-object p1, p0, Lu2/s;->x:Landroid/view/SurfaceControl;

    .line 111
    .line 112
    return-void
.end method

.method public static synthetic a(Lcom/android/wm/shell/shared/n$a;Landroid/window/TransitionInfo$Change;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getActivityComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/wm/shell/shared/n$a;->a(Landroid/window/TransitionInfo$Change;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static synthetic b(ZLandroid/window/TransitionInfo$Change;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getActivityComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/wm/shell/shared/n;->k(Landroid/window/TransitionInfo$Change;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    invoke-static {p1}, Lcom/android/wm/shell/shared/n;->g(Landroid/window/TransitionInfo$Change;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public static c(Landroid/view/RemoteAnimationTarget;I)Landroid/view/RemoteAnimationTarget;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Landroid/view/RemoteAnimationTarget;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget v1, v0, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 7
    .line 8
    iget-object v3, v0, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 9
    .line 10
    iget-boolean v4, v0, Landroid/view/RemoteAnimationTarget;->isTranslucent:Z

    .line 11
    .line 12
    iget-object v5, v0, Landroid/view/RemoteAnimationTarget;->clipRect:Landroid/graphics/Rect;

    .line 13
    .line 14
    iget-object v6, v0, Landroid/view/RemoteAnimationTarget;->contentInsets:Landroid/graphics/Rect;

    .line 15
    .line 16
    iget v7, v0, Landroid/view/RemoteAnimationTarget;->prefixOrderIndex:I

    .line 17
    .line 18
    iget-object v8, v0, Landroid/view/RemoteAnimationTarget;->position:Landroid/graphics/Point;

    .line 19
    .line 20
    iget-object v9, v0, Landroid/view/RemoteAnimationTarget;->localBounds:Landroid/graphics/Rect;

    .line 21
    .line 22
    iget-object v10, v0, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 23
    .line 24
    iget-object v11, v0, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 25
    .line 26
    iget-boolean v12, v0, Landroid/view/RemoteAnimationTarget;->isNotInRecents:Z

    .line 27
    .line 28
    iget-object v13, v0, Landroid/view/RemoteAnimationTarget;->startLeash:Landroid/view/SurfaceControl;

    .line 29
    .line 30
    iget-object v14, v0, Landroid/view/RemoteAnimationTarget;->startBounds:Landroid/graphics/Rect;

    .line 31
    .line 32
    iget-object v15, v0, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 33
    .line 34
    move/from16 v16, v1

    .line 35
    .line 36
    iget-boolean v1, v0, Landroid/view/RemoteAnimationTarget;->allowEnterPip:Z

    .line 37
    .line 38
    iget v0, v0, Landroid/view/RemoteAnimationTarget;->windowType:I

    .line 39
    .line 40
    move/from16 v17, v16

    .line 41
    .line 42
    move/from16 v16, v1

    .line 43
    .line 44
    move/from16 v1, v17

    .line 45
    .line 46
    move/from16 v17, v0

    .line 47
    .line 48
    move-object v0, v2

    .line 49
    move/from16 v2, p1

    .line 50
    .line 51
    invoke-direct/range {v0 .. v17}, Landroid/view/RemoteAnimationTarget;-><init>(IILandroid/view/SurfaceControl;ZLandroid/graphics/Rect;Landroid/graphics/Rect;ILandroid/graphics/Point;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/app/WindowConfiguration;ZLandroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/app/ActivityManager$RunningTaskInfo;ZI)V

    .line 52
    .line 53
    .line 54
    return-object v0
.end method

.method private static d(Landroid/window/TransitionInfo;Landroid/window/TransitionInfo$Change;ILandroid/view/SurfaceControl$Transaction;)Landroid/view/SurfaceControl;
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getFlags()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    and-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-static {p1, p0}, Lcom/android/wm/shell/shared/n;->n(Landroid/window/TransitionInfo$Change;Landroid/window/TransitionInfo;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p0, v1}, Landroid/window/TransitionInfo;->getChange(Landroid/window/WindowContainerToken;)Landroid/window/TransitionInfo$Change;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {p0, v1}, Landroid/window/TransitionInfo;->getChange(Landroid/window/WindowContainerToken;)Landroid/window/TransitionInfo$Change;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 v1, 0x0

    .line 54
    :goto_0
    new-instance v2, Landroid/view/SurfaceControl$Builder;

    .line 55
    .line 56
    invoke-direct {v2}, Landroid/view/SurfaceControl$Builder;-><init>()V

    .line 57
    .line 58
    .line 59
    new-instance v3, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v4}, Landroid/view/SurfaceControl;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v4, "_transition-leash"

    .line 76
    .line 77
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v2, v3}, Landroid/view/SurfaceControl$Builder;->setName(Ljava/lang/String;)Landroid/view/SurfaceControl$Builder;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v2}, Landroid/view/SurfaceControl$Builder;->setContainerLayer()Landroid/view/SurfaceControl$Builder;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    const/4 v3, 0x0

    .line 93
    invoke-virtual {v2, v3}, Landroid/view/SurfaceControl$Builder;->setHidden(Z)Landroid/view/SurfaceControl$Builder;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    if-nez v4, :cond_2

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Landroid/window/TransitionInfo;->getRoot(I)Landroid/window/TransitionInfo$Root;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Root;->getLeash()Landroid/view/SurfaceControl;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    :cond_2
    invoke-virtual {v2, v1}, Landroid/view/SurfaceControl$Builder;->setParent(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Builder;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Landroid/view/SurfaceControl$Builder;->build()Landroid/view/SurfaceControl;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p0}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    sub-int/2addr v1, p2

    .line 128
    invoke-static {v0, p1, v1, p0, p3}, Lu2/s;->g(Landroid/view/SurfaceControl;Landroid/window/TransitionInfo$Change;ILandroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p3, p0, v0}, Landroid/view/SurfaceControl$Transaction;->reparent(Landroid/view/SurfaceControl;Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 136
    .line 137
    .line 138
    invoke-static {p1}, Lcom/android/wm/shell/shared/n;->e(Landroid/window/TransitionInfo$Change;)Z

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    if-nez p0, :cond_3

    .line 143
    .line 144
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    const/high16 p2, 0x3f800000    # 1.0f

    .line 149
    .line 150
    invoke-virtual {p3, p0, p2}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 151
    .line 152
    .line 153
    :cond_3
    sget-boolean p0, Lu2/s;->A:Z

    .line 154
    .line 155
    if-nez p0, :cond_4

    .line 156
    .line 157
    invoke-static {p1}, Lcom/android/wm/shell/shared/n;->f(Landroid/window/TransitionInfo$Change;)Z

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    if-nez p0, :cond_4

    .line 162
    .line 163
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    const/4 p2, 0x0

    .line 168
    invoke-virtual {p3, p0, p2, p2}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 169
    .line 170
    .line 171
    :cond_4
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {p3, p0, v3}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 176
    .line 177
    .line 178
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p3, p0}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 183
    .line 184
    .line 185
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    if-eqz p0, :cond_5

    .line 190
    .line 191
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-virtual {p0}, Landroid/app/ActivityManager$RunningTaskInfo;->getActivityType()I

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    const/4 p2, 0x1

    .line 200
    if-ne p0, p2, :cond_5

    .line 201
    .line 202
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 203
    .line 204
    .line 205
    move-result p0

    .line 206
    const/4 p1, 0x4

    .line 207
    if-ne p0, p1, :cond_5

    .line 208
    .line 209
    invoke-virtual {p3, v0, p2}, Landroid/view/SurfaceControl$Transaction;->setTrustedOverlay(Landroid/view/SurfaceControl;Z)Landroid/view/SurfaceControl$Transaction;

    .line 210
    .line 211
    .line 212
    :cond_5
    return-object v0
.end method

.method public static e(Landroid/window/TransitionInfo$Change;ILandroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)Landroid/view/RemoteAnimationTarget;
    .locals 6
    .param p4    # Landroid/util/ArrayMap;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/window/TransitionInfo$Change;",
            "I",
            "Landroid/window/TransitionInfo;",
            "Landroid/view/SurfaceControl$Transaction;",
            "Landroid/util/ArrayMap<",
            "Landroid/view/SurfaceControl;",
            "Landroid/view/SurfaceControl;",
            ">;)",
            "Landroid/view/RemoteAnimationTarget;"
        }
    .end annotation

    .line 1
    const/4 v2, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move-object v3, p2

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-static/range {v0 .. v5}, Lu2/s;->f(Landroid/window/TransitionInfo$Change;IZLandroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)Landroid/view/RemoteAnimationTarget;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static f(Landroid/window/TransitionInfo$Change;IZLandroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)Landroid/view/RemoteAnimationTarget;
    .locals 0
    .param p5    # Landroid/util/ArrayMap;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/window/TransitionInfo$Change;",
            "IZ",
            "Landroid/window/TransitionInfo;",
            "Landroid/view/SurfaceControl$Transaction;",
            "Landroid/util/ArrayMap<",
            "Landroid/view/SurfaceControl;",
            "Landroid/view/SurfaceControl;",
            ">;)",
            "Landroid/view/RemoteAnimationTarget;"
        }
    .end annotation

    .line 1
    invoke-static {p3, p0, p1, p4}, Lu2/s;->d(Landroid/window/TransitionInfo;Landroid/window/TransitionInfo$Change;ILandroid/view/SurfaceControl$Transaction;)Landroid/view/SurfaceControl;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    invoke-virtual {p5, p4, p3}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p0, p1, p3, p2}, Lcom/android/wm/shell/shared/n;->m(Landroid/window/TransitionInfo$Change;ILandroid/view/SurfaceControl;Z)Landroid/view/RemoteAnimationTarget;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method private static g(Landroid/view/SurfaceControl;Landroid/window/TransitionInfo$Change;ILandroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;)V
    .locals 8
    .param p0    # Landroid/view/SurfaceControl;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/window/TransitionInfo$Change;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/window/TransitionInfo;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/view/SurfaceControl$Transaction;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Landroid/window/TransitionInfo;->getType()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Lcom/android/wm/shell/shared/n;->i(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p3}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {p1, p3}, Lcom/android/wm/shell/shared/n;->n(Landroid/window/TransitionInfo$Change;Landroid/window/TransitionInfo;)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {p3, v3}, Landroid/window/TransitionInfo;->getRoot(I)Landroid/window/TransitionInfo$Root;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-virtual {v4}, Landroid/window/TransitionInfo$Root;->getLeash()Landroid/view/SurfaceControl;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {p4, p0, v4}, Landroid/view/SurfaceControl$Transaction;->reparent(Landroid/view/SurfaceControl;Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 34
    .line 35
    .line 36
    const/4 v4, 0x1

    .line 37
    if-ne v2, v4, :cond_0

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getStartAbsBounds()Landroid/graphics/Rect;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    :goto_0
    iget v6, v5, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    invoke-virtual {p3, v3}, Landroid/window/TransitionInfo;->getRoot(I)Landroid/window/TransitionInfo$Root;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    invoke-virtual {v7}, Landroid/window/TransitionInfo$Root;->getOffset()Landroid/graphics/Point;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    iget v7, v7, Landroid/graphics/Point;->x:I

    .line 59
    .line 60
    sub-int/2addr v6, v7

    .line 61
    int-to-float v6, v6

    .line 62
    iget v5, v5, Landroid/graphics/Rect;->top:I

    .line 63
    .line 64
    invoke-virtual {p3, v3}, Landroid/window/TransitionInfo;->getRoot(I)Landroid/window/TransitionInfo$Root;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v3}, Landroid/window/TransitionInfo$Root;->getOffset()Landroid/graphics/Point;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 73
    .line 74
    sub-int/2addr v5, v3

    .line 75
    int-to-float v3, v5

    .line 76
    invoke-virtual {p4, p0, v6, v3}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 77
    .line 78
    .line 79
    invoke-static {p1}, Lcom/android/wm/shell/shared/n;->f(Landroid/window/TransitionInfo$Change;)Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    const-string v5, ""

    .line 84
    .line 85
    const/4 v6, 0x0

    .line 86
    if-eqz v3, :cond_2

    .line 87
    .line 88
    invoke-static {v2}, Lcom/android/wm/shell/shared/n;->i(I)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_1

    .line 93
    .line 94
    invoke-virtual {p4, p0, v6}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 95
    .line 96
    .line 97
    new-instance p1, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    const-string p2, "trace_layer_alpha setupLeash1 getLayerId "

    .line 103
    .line 104
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/view/SurfaceControl;->getLayerId()I

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    :cond_1
    invoke-virtual {p4, p0, v6, v6}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 122
    .line 123
    .line 124
    const p1, 0x7fffffff

    .line 125
    .line 126
    .line 127
    invoke-virtual {p4, p0, p1}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_2
    invoke-static {p1}, Lcom/android/wm/shell/shared/n;->e(Landroid/window/TransitionInfo$Change;)Z

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    if-eqz v3, :cond_3

    .line 136
    .line 137
    invoke-virtual {p4, p0, v6, v6}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {p4, p0, v3}, Landroid/view/SurfaceControl$Transaction;->setCrop(Landroid/view/SurfaceControl;Landroid/graphics/Rect;)Landroid/view/SurfaceControl$Transaction;

    .line 145
    .line 146
    .line 147
    :cond_3
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getFlags()I

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    and-int/lit8 v3, v3, 0x2

    .line 152
    .line 153
    if-eqz v3, :cond_6

    .line 154
    .line 155
    if-eq v2, v4, :cond_5

    .line 156
    .line 157
    const/4 p1, 0x3

    .line 158
    if-ne v2, p1, :cond_4

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_4
    neg-int p1, v1

    .line 162
    sub-int/2addr p1, p2

    .line 163
    invoke-virtual {p4, p0, p1}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_5
    :goto_1
    neg-int p1, v1

    .line 168
    invoke-virtual {p3}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 169
    .line 170
    .line 171
    move-result-object p3

    .line 172
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 173
    .line 174
    .line 175
    move-result p3

    .line 176
    add-int/2addr p1, p3

    .line 177
    sub-int/2addr p1, p2

    .line 178
    invoke-virtual {p4, p0, p1}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_6
    invoke-static {v2}, Lcom/android/wm/shell/shared/n;->i(I)Z

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    if-eqz v3, :cond_9

    .line 187
    .line 188
    if-eqz v0, :cond_8

    .line 189
    .line 190
    invoke-virtual {p3}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 191
    .line 192
    .line 193
    move-result-object p3

    .line 194
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 195
    .line 196
    .line 197
    move-result p3

    .line 198
    add-int/2addr v1, p3

    .line 199
    sub-int/2addr v1, p2

    .line 200
    invoke-virtual {p4, p0, v1}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getFlags()I

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    and-int/lit8 p1, p1, 0x8

    .line 208
    .line 209
    if-nez p1, :cond_7

    .line 210
    .line 211
    invoke-virtual {p4, p0, v6}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 212
    .line 213
    .line 214
    new-instance p1, Ljava/lang/StringBuilder;

    .line 215
    .line 216
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 217
    .line 218
    .line 219
    const-string p2, "trace_layer_alpha setupLeash2 getLayerId "

    .line 220
    .line 221
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0}, Landroid/view/SurfaceControl;->getLayerId()I

    .line 225
    .line 226
    .line 227
    move-result p0

    .line 228
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-static {v5, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    .line 237
    .line 238
    :cond_7
    return-void

    .line 239
    :cond_8
    sub-int/2addr v1, p2

    .line 240
    invoke-virtual {p4, p0, v1}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 241
    .line 242
    .line 243
    return-void

    .line 244
    :cond_9
    invoke-static {v2}, Lcom/android/wm/shell/shared/n;->d(I)Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    if-eqz p1, :cond_b

    .line 249
    .line 250
    if-eqz v0, :cond_a

    .line 251
    .line 252
    sub-int/2addr v1, p2

    .line 253
    invoke-virtual {p4, p0, v1}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :cond_a
    invoke-virtual {p3}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    add-int/2addr v1, p1

    .line 266
    sub-int/2addr v1, p2

    .line 267
    invoke-virtual {p4, p0, v1}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :cond_b
    invoke-virtual {p3}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    add-int/2addr v1, p1

    .line 280
    sub-int/2addr v1, p2

    .line 281
    invoke-virtual {p4, p0, v1}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 282
    .line 283
    .line 284
    return-void
.end method

.method public static i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    array-length v1, p0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move v1, v0

    .line 7
    :goto_0
    new-array v2, v1, [Landroid/view/RemoteAnimationTarget;

    .line 8
    .line 9
    :goto_1
    if-ge v0, v1, :cond_1

    .line 10
    .line 11
    aget-object v3, p0, v0

    .line 12
    .line 13
    invoke-virtual {v3}, Lu2/s;->h()Landroid/view/RemoteAnimationTarget;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    aput-object v3, v2, v0

    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    return-object v2
.end method

.method private static k(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;Ljava/util/function/Predicate;)[Landroid/view/RemoteAnimationTarget;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/window/TransitionInfo;",
            "Landroid/view/SurfaceControl$Transaction;",
            "Landroid/util/ArrayMap<",
            "Landroid/view/SurfaceControl;",
            "Landroid/view/SurfaceControl;",
            ">;",
            "Ljava/util/function/Predicate<",
            "Landroid/window/TransitionInfo$Change;",
            ">;)[",
            "Landroid/view/RemoteAnimationTarget;"
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
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/window/TransitionInfo$Change;

    .line 26
    .line 27
    invoke-static {v2}, Lcom/android/wm/shell/shared/n;->j(Landroid/window/TransitionInfo$Change;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    invoke-interface {p3, v2}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    sub-int/2addr v3, v1

    .line 49
    invoke-static {v2, v3, p0, p1, p2}, Lu2/s;->e(Landroid/window/TransitionInfo$Change;ILandroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)Landroid/view/RemoteAnimationTarget;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    new-array p0, p0, [Landroid/view/RemoteAnimationTarget;

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    check-cast p0, [Landroid/view/RemoteAnimationTarget;

    .line 70
    .line 71
    return-object p0
.end method

.method public static l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    array-length v1, p0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move v1, v0

    .line 7
    :goto_0
    new-array v2, v1, [Lu2/s;

    .line 8
    .line 9
    move v3, v0

    .line 10
    :goto_1
    if-ge v3, v1, :cond_1

    .line 11
    .line 12
    new-instance v4, Lu2/s;

    .line 13
    .line 14
    aget-object v5, p0, v3

    .line 15
    .line 16
    invoke-direct {v4, v5, v0}, Lu2/s;-><init>(Landroid/view/RemoteAnimationTarget;Z)V

    .line 17
    .line 18
    .line 19
    aput-object v4, v2, v3

    .line 20
    .line 21
    add-int/lit8 v3, v3, 0x1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    return-object v2
.end method

.method public static m(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)[Landroid/view/RemoteAnimationTarget;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/window/TransitionInfo;",
            "Landroid/view/SurfaceControl$Transaction;",
            "Landroid/util/ArrayMap<",
            "Landroid/view/SurfaceControl;",
            "Landroid/view/SurfaceControl;",
            ">;)[",
            "Landroid/view/RemoteAnimationTarget;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/wm/shell/shared/n$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/wm/shell/shared/n$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lu2/r;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Lu2/r;-><init>(Lcom/android/wm/shell/shared/n$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, p1, p2, v1}, Lu2/s;->k(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;Ljava/util/function/Predicate;)[Landroid/view/RemoteAnimationTarget;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static n(Landroid/window/TransitionInfo;ZLandroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;)[Landroid/view/RemoteAnimationTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/window/TransitionInfo;",
            "Z",
            "Landroid/view/SurfaceControl$Transaction;",
            "Landroid/util/ArrayMap<",
            "Landroid/view/SurfaceControl;",
            "Landroid/view/SurfaceControl;",
            ">;)[",
            "Landroid/view/RemoteAnimationTarget;"
        }
    .end annotation

    .line 1
    new-instance v0, Lu2/q;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lu2/q;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p2, p3, v0}, Lu2/s;->k(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/util/ArrayMap;Ljava/util/function/Predicate;)[Landroid/view/RemoteAnimationTarget;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public h()Landroid/view/RemoteAnimationTarget;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Landroid/view/RemoteAnimationTarget;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget v1, v0, Lu2/s;->v:I

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget v2, v0, Lu2/s;->m:I

    .line 10
    .line 11
    move-object v4, v3

    .line 12
    iget-object v3, v0, Lu2/s;->h:Landroid/view/SurfaceControl;

    .line 13
    .line 14
    move-object v5, v4

    .line 15
    iget-boolean v4, v0, Lu2/s;->g:Z

    .line 16
    .line 17
    move-object v6, v5

    .line 18
    iget-object v5, v0, Lu2/s;->c:Landroid/graphics/Rect;

    .line 19
    .line 20
    move-object v7, v6

    .line 21
    iget-object v6, v0, Lu2/s;->d:Landroid/graphics/Rect;

    .line 22
    .line 23
    move-object v8, v7

    .line 24
    iget v7, v0, Lu2/s;->o:I

    .line 25
    .line 26
    move-object v9, v8

    .line 27
    iget-object v8, v0, Lu2/s;->n:Landroid/graphics/Point;

    .line 28
    .line 29
    move-object v10, v9

    .line 30
    iget-object v9, v0, Lu2/s;->j:Landroid/graphics/Rect;

    .line 31
    .line 32
    move-object v11, v10

    .line 33
    iget-object v10, v0, Lu2/s;->r:Landroid/graphics/Rect;

    .line 34
    .line 35
    move-object v12, v11

    .line 36
    iget-object v11, v0, Lu2/s;->y:Landroid/app/WindowConfiguration;

    .line 37
    .line 38
    move-object v13, v12

    .line 39
    iget-boolean v12, v0, Lu2/s;->e:Z

    .line 40
    .line 41
    move-object v14, v13

    .line 42
    iget-object v13, v0, Lu2/s;->k:Landroid/view/SurfaceControl;

    .line 43
    .line 44
    move-object v15, v14

    .line 45
    iget-object v14, v0, Lu2/s;->t:Landroid/graphics/Rect;

    .line 46
    .line 47
    move-object/from16 v16, v15

    .line 48
    .line 49
    iget-object v15, v0, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 50
    .line 51
    move/from16 v17, v1

    .line 52
    .line 53
    iget-boolean v1, v0, Lu2/s;->b:Z

    .line 54
    .line 55
    iget v0, v0, Lu2/s;->z:I

    .line 56
    .line 57
    move/from16 v18, v17

    .line 58
    .line 59
    move/from16 v17, v0

    .line 60
    .line 61
    move-object/from16 v0, v16

    .line 62
    .line 63
    move/from16 v16, v1

    .line 64
    .line 65
    move/from16 v1, v18

    .line 66
    .line 67
    invoke-direct/range {v0 .. v17}, Landroid/view/RemoteAnimationTarget;-><init>(IILandroid/view/SurfaceControl;ZLandroid/graphics/Rect;Landroid/graphics/Rect;ILandroid/graphics/Point;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/app/WindowConfiguration;ZLandroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/app/ActivityManager$RunningTaskInfo;ZI)V

    .line 68
    .line 69
    .line 70
    return-object v0
.end method

.method public j(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lu2/s;->i:Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lu2/s;->i:Ljava/util/concurrent/locks/ReentrantLock;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    iget-object p0, p0, Lu2/s;->i:Ljava/util/concurrent/locks/ReentrantLock;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 19
    .line 20
    .line 21
    throw p1
.end method
