.class public Lcom/android/wm/shell/shared/n;
.super Ljava/lang/Object;
.source "TransitionUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wm/shell/shared/n$a;
    }
.end annotation


# static fields
.field public static final a:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "ro.vendor.feature.def_physical_corner"

    .line 2
    .line 3
    const/16 v1, 0x48

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sput v0, Lcom/android/wm/shell/shared/n;->a:I

    .line 10
    .line 11
    return-void
.end method

.method private static a(Landroid/window/TransitionInfo$Change;Landroid/view/SurfaceControl;)Landroid/view/RemoteAnimationTarget;
    .locals 18

    .line 1
    new-instance v0, Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p0}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v1}, Lcom/android/wm/shell/shared/n;->l(I)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    new-instance v8, Landroid/graphics/Point;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v8, v1, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual/range {p0 .. p0}, Landroid/window/TransitionInfo$Change;->getStartAbsBounds()Landroid/graphics/Rect;

    .line 18
    .line 19
    .line 20
    move-result-object v9

    .line 21
    invoke-virtual/range {p0 .. p0}, Landroid/window/TransitionInfo$Change;->getStartAbsBounds()Landroid/graphics/Rect;

    .line 22
    .line 23
    .line 24
    move-result-object v10

    .line 25
    new-instance v11, Landroid/app/WindowConfiguration;

    .line 26
    .line 27
    invoke-direct {v11}, Landroid/app/WindowConfiguration;-><init>()V

    .line 28
    .line 29
    .line 30
    const/16 v16, 0x0

    .line 31
    .line 32
    const/16 v17, 0xbb8

    .line 33
    .line 34
    const/4 v1, -0x1

    .line 35
    const/4 v4, 0x0

    .line 36
    const/4 v5, 0x0

    .line 37
    const/4 v6, 0x0

    .line 38
    const v7, 0x7fffffff

    .line 39
    .line 40
    .line 41
    const/4 v12, 0x1

    .line 42
    const/4 v13, 0x0

    .line 43
    const/4 v14, 0x0

    .line 44
    const/4 v15, 0x0

    .line 45
    move-object/from16 v3, p1

    .line 46
    .line 47
    invoke-direct/range {v0 .. v17}, Landroid/view/RemoteAnimationTarget;-><init>(IILandroid/view/SurfaceControl;ZLandroid/graphics/Rect;Landroid/graphics/Rect;ILandroid/graphics/Point;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/app/WindowConfiguration;ZLandroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/app/ActivityManager$RunningTaskInfo;ZI)V

    .line 48
    .line 49
    .line 50
    return-object v0
.end method

.method private static b(Landroid/window/TransitionInfo$Change;Landroid/view/SurfaceControl;)Landroid/view/RemoteAnimationTarget;
    .locals 18

    .line 1
    new-instance v0, Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p0}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v1}, Lcom/android/wm/shell/shared/n;->l(I)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    new-instance v8, Landroid/graphics/Point;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v8, v1, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual/range {p0 .. p0}, Landroid/window/TransitionInfo$Change;->getStartAbsBounds()Landroid/graphics/Rect;

    .line 18
    .line 19
    .line 20
    move-result-object v9

    .line 21
    invoke-virtual/range {p0 .. p0}, Landroid/window/TransitionInfo$Change;->getStartAbsBounds()Landroid/graphics/Rect;

    .line 22
    .line 23
    .line 24
    move-result-object v10

    .line 25
    new-instance v11, Landroid/app/WindowConfiguration;

    .line 26
    .line 27
    invoke-direct {v11}, Landroid/app/WindowConfiguration;-><init>()V

    .line 28
    .line 29
    .line 30
    const/16 v16, 0x0

    .line 31
    .line 32
    const/16 v17, 0x7f2

    .line 33
    .line 34
    const/4 v1, -0x1

    .line 35
    const/4 v4, 0x0

    .line 36
    const/4 v5, 0x0

    .line 37
    const/4 v6, 0x0

    .line 38
    const v7, 0x7fffffff

    .line 39
    .line 40
    .line 41
    const/4 v12, 0x1

    .line 42
    const/4 v13, 0x0

    .line 43
    const/4 v14, 0x0

    .line 44
    const/4 v15, 0x0

    .line 45
    move-object/from16 v3, p1

    .line 46
    .line 47
    invoke-direct/range {v0 .. v17}, Landroid/view/RemoteAnimationTarget;-><init>(IILandroid/view/SurfaceControl;ZLandroid/graphics/Rect;Landroid/graphics/Rect;ILandroid/graphics/Point;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/app/WindowConfiguration;ZLandroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/app/ActivityManager$RunningTaskInfo;ZI)V

    .line 48
    .line 49
    .line 50
    return-object v0
.end method

.method public static c(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eq p0, v0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public static d(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eq p0, v0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public static e(Landroid/window/TransitionInfo$Change;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/wm/shell/shared/n;->g(Landroid/window/TransitionInfo$Change;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/high16 v0, 0x2000000

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/window/TransitionInfo$Change;->hasFlags(I)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public static f(Landroid/window/TransitionInfo$Change;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/wm/shell/shared/n;->g(Landroid/window/TransitionInfo$Change;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/high16 v0, 0x1000000

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/window/TransitionInfo$Change;->hasFlags(I)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public static g(Landroid/window/TransitionInfo$Change;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    invoke-virtual {p0, v0}, Landroid/window/TransitionInfo$Change;->hasFlags(I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/16 v0, 0x200

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/window/TransitionInfo$Change;->hasFlags(I)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public static h(I)Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_1

    .line 3
    .line 4
    const/4 v1, 0x3

    .line 5
    if-ne p0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_1
    :goto_0
    return v0
.end method

.method public static i(I)Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_1

    .line 3
    .line 4
    const/4 v1, 0x3

    .line 5
    if-eq p0, v1, :cond_1

    .line 6
    .line 7
    const/4 v1, 0x7

    .line 8
    if-eq p0, v1, :cond_1

    .line 9
    .line 10
    const/16 v1, 0xd

    .line 11
    .line 12
    if-ne p0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    return v0
.end method

.method public static j(Landroid/window/TransitionInfo$Change;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x6

    .line 6
    if-ne v0, v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getFlags()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/high16 v1, 0x100000

    .line 13
    .line 14
    and-int/2addr v0, v1

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getStartAbsBounds()Landroid/graphics/Rect;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getLastParent()Landroid/window/WindowContainerToken;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getLastParent()Landroid/window/WindowContainerToken;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getParent()Landroid/window/WindowContainerToken;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Landroid/window/WindowContainerToken;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    :cond_0
    const/4 p0, 0x1

    .line 52
    return p0

    .line 53
    :cond_1
    const/4 p0, 0x0

    .line 54
    return p0
.end method

.method public static k(Landroid/window/TransitionInfo$Change;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    invoke-virtual {p0, v0}, Landroid/window/TransitionInfo$Change;->hasFlags(I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/16 v0, 0x200

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/window/TransitionInfo$Change;->hasFlags(I)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method private static l(I)I
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_1

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq p0, v1, :cond_0

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    if-eq p0, v2, :cond_1

    .line 9
    .line 10
    const/4 v2, 0x4

    .line 11
    if-eq p0, v2, :cond_0

    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    return v0

    .line 15
    :cond_1
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static m(Landroid/window/TransitionInfo$Change;ILandroid/view/SurfaceControl;Z)Landroid/view/RemoteAnimationTarget;
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v4, p2

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/wm/shell/shared/n;->f(Landroid/window/TransitionInfo$Change;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-static {v0, v4}, Lcom/android/wm/shell/shared/n;->b(Landroid/window/TransitionInfo$Change;Landroid/view/SurfaceControl;)Landroid/view/RemoteAnimationTarget;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0

    .line 16
    :cond_0
    invoke-static {v0}, Lcom/android/wm/shell/shared/n;->e(Landroid/window/TransitionInfo$Change;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-static {v0, v4}, Lcom/android/wm/shell/shared/n;->a(Landroid/window/TransitionInfo$Change;Landroid/view/SurfaceControl;)Landroid/view/RemoteAnimationTarget;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    return-object v0

    .line 27
    :cond_1
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/16 v19, 0x1

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    iget v2, v1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 36
    .line 37
    iget-boolean v3, v1, Landroid/app/ActivityManager$RunningTaskInfo;->isRunning:Z

    .line 38
    .line 39
    xor-int/lit8 v3, v3, 0x1

    .line 40
    .line 41
    iget-object v5, v1, Landroid/app/ActivityManager$RunningTaskInfo;->configuration:Landroid/content/res/Configuration;

    .line 42
    .line 43
    iget-object v5, v5, Landroid/content/res/Configuration;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 44
    .line 45
    move v13, v3

    .line 46
    :goto_0
    move-object v12, v5

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    new-instance v5, Landroid/app/WindowConfiguration;

    .line 49
    .line 50
    invoke-direct {v5}, Landroid/app/WindowConfiguration;-><init>()V

    .line 51
    .line 52
    .line 53
    const/4 v2, -0x1

    .line 54
    move/from16 v13, v19

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :goto_1
    new-instance v10, Landroid/graphics/Rect;

    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-direct {v10, v3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getEndRelOffset()Landroid/graphics/Point;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    iget v3, v3, Landroid/graphics/Point;->x:I

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getEndRelOffset()Landroid/graphics/Point;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    iget v5, v5, Landroid/graphics/Point;->y:I

    .line 77
    .line 78
    invoke-virtual {v10, v3, v5}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 79
    .line 80
    .line 81
    move-object/from16 v16, v1

    .line 82
    .line 83
    new-instance v1, Landroid/view/RemoteAnimationTarget;

    .line 84
    .line 85
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-static {v3}, Lcom/android/wm/shell/shared/n;->l(I)I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    const/4 v5, 0x0

    .line 94
    if-nez p3, :cond_4

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getFlags()I

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    and-int/lit8 v6, v6, 0x4

    .line 101
    .line 102
    if-eqz v6, :cond_3

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_3
    move v6, v5

    .line 106
    goto :goto_3

    .line 107
    :cond_4
    :goto_2
    move/from16 v6, v19

    .line 108
    .line 109
    :goto_3
    new-instance v7, Landroid/graphics/Rect;

    .line 110
    .line 111
    invoke-direct {v7, v5, v5, v5, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 112
    .line 113
    .line 114
    new-instance v11, Landroid/graphics/Rect;

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 117
    .line 118
    .line 119
    move-result-object v8

    .line 120
    invoke-direct {v11, v8}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 121
    .line 122
    .line 123
    new-instance v15, Landroid/graphics/Rect;

    .line 124
    .line 125
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getStartAbsBounds()Landroid/graphics/Rect;

    .line 126
    .line 127
    .line 128
    move-result-object v8

    .line 129
    invoke-direct {v15, v8}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->isAllowEnterPip()Z

    .line 133
    .line 134
    .line 135
    move-result v17

    .line 136
    const/16 v18, -0x1

    .line 137
    .line 138
    move v8, v5

    .line 139
    move v5, v6

    .line 140
    const/4 v6, 0x0

    .line 141
    const/4 v9, 0x0

    .line 142
    const/4 v14, 0x0

    .line 143
    move/from16 v20, v8

    .line 144
    .line 145
    move/from16 v8, p1

    .line 146
    .line 147
    invoke-direct/range {v1 .. v18}, Landroid/view/RemoteAnimationTarget;-><init>(IILandroid/view/SurfaceControl;ZLandroid/graphics/Rect;Landroid/graphics/Rect;ILandroid/graphics/Point;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/app/WindowConfiguration;ZLandroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/app/ActivityManager$RunningTaskInfo;ZI)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getFlags()I

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    and-int/lit16 v2, v2, 0x800

    .line 155
    .line 156
    if-eqz v2, :cond_5

    .line 157
    .line 158
    move/from16 v2, v19

    .line 159
    .line 160
    goto :goto_4

    .line 161
    :cond_5
    move/from16 v2, v20

    .line 162
    .line 163
    :goto_4
    invoke-virtual {v1, v2}, Landroid/view/RemoteAnimationTarget;->setWillShowImeOnTarget(Z)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getEndRotation()I

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getStartRotation()I

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    sub-int/2addr v2, v3

    .line 175
    invoke-virtual {v1, v2}, Landroid/view/RemoteAnimationTarget;->setRotationChange(I)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getBackgroundColor()I

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    iput v2, v1, Landroid/view/RemoteAnimationTarget;->backgroundColor:I

    .line 183
    .line 184
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-static {v1, v0}, LU2/a$a;->c(Landroid/view/RemoteAnimationTarget;Landroid/view/SurfaceControl;)V

    .line 189
    .line 190
    .line 191
    return-object v1
.end method

.method public static n(Landroid/window/TransitionInfo$Change;Landroid/window/TransitionInfo;)I
    .locals 1
    .param p0    # Landroid/window/TransitionInfo$Change;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/window/TransitionInfo;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getEndDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, v0}, Landroid/window/TransitionInfo;->findRootIndex(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/window/TransitionInfo$Change;->getStartDisplayId()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {p1, p0}, Landroid/window/TransitionInfo;->findRootIndex(I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-ltz p0, :cond_1

    .line 21
    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method
