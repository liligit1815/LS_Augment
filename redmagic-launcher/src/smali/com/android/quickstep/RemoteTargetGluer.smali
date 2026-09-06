.class public Lcom/android/quickstep/RemoteTargetGluer;
.super Ljava/lang/Object;
.source "RemoteTargetGluer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;
    }
.end annotation


# static fields
.field private static final DEFAULT_NUM_HANDLES:I = 0x4

.field private static final TAG:Ljava/lang/String; = "RemoteTargetGluer"


# instance fields
.field private mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

.field private mSplitBounds:Lcom/android/launcher3/util/y2$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;)V
    .locals 2

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    sget-object v0, LP1/k;->o:Lcom/android/launcher3/util/I;

    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LP1/k;

    .line 5
    invoke-virtual {v0}, LP1/k;->q()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    .line 6
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/quickstep/RemoteTargetGluer;->init(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;IZ)V

    return-void

    :cond_0
    const/4 v0, 0x4

    const/4 v1, 0x0

    .line 7
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/quickstep/RemoteTargetGluer;->init(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;IZ)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;Lcom/android/quickstep/RemoteAnimationTargets;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iget-object p3, p3, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    array-length p3, p3

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/RemoteTargetGluer;->init(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;IZ)V

    return-void
.end method

.method public static synthetic a(Landroid/view/RemoteAnimationTarget;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/WindowConfiguration;->getWindowingMode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x6

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public static synthetic b(Landroid/view/RemoteAnimationTarget;Landroid/view/RemoteAnimationTarget;)Z
    .locals 0

    .line 1
    iget p1, p1, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 2
    .line 3
    iget p0, p0, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 4
    .line 5
    if-eq p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic c(Landroid/view/RemoteAnimationTarget;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/WindowConfiguration;->getWindowingMode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x6

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method private createHandles(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;IZ)[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;
    .locals 4

    .line 1
    new-array p0, p3, [Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :goto_0
    if-ge v0, p3, :cond_0

    .line 5
    .line 6
    new-instance v1, Lcom/android/quickstep/util/TaskViewSimulator;

    .line 7
    .line 8
    invoke-direct {v1, p1, p2, p4, v0}, Lcom/android/quickstep/util/TaskViewSimulator;-><init>(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;ZI)V

    .line 9
    .line 10
    .line 11
    new-instance v2, Lcom/android/quickstep/util/TransformParams;

    .line 12
    .line 13
    invoke-direct {v2}, Lcom/android/quickstep/util/TransformParams;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v3, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 17
    .line 18
    invoke-direct {v3, v1, v2}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;-><init>(Lcom/android/quickstep/util/TaskViewSimulator;Lcom/android/quickstep/util/TransformParams;)V

    .line 19
    .line 20
    .line 21
    aput-object v3, p0, v0

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-object p0
.end method

.method private createRemoteAnimationTargetsForTarget(Lcom/android/quickstep/RemoteAnimationTargets;Ljava/util/List;)Lcom/android/quickstep/RemoteAnimationTargets;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/RemoteAnimationTargets;",
            "Ljava/util/List<",
            "Landroid/view/RemoteAnimationTarget;",
            ">;)",
            "Lcom/android/quickstep/RemoteAnimationTargets;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredApps:[Landroid/view/RemoteAnimationTarget;

    .line 7
    .line 8
    array-length v1, v0

    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    if-ge v3, v1, :cond_4

    .line 12
    .line 13
    aget-object v4, v0, v3

    .line 14
    .line 15
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    move v6, v2

    .line 20
    :cond_0
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v7

    .line 24
    if-eqz v7, :cond_2

    .line 25
    .line 26
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v7

    .line 30
    check-cast v7, Landroid/view/RemoteAnimationTarget;

    .line 31
    .line 32
    const/4 v8, 0x1

    .line 33
    if-ne v4, v7, :cond_1

    .line 34
    .line 35
    move v6, v8

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    if-eqz v7, :cond_0

    .line 38
    .line 39
    iget-object v7, v7, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 40
    .line 41
    if-eqz v7, :cond_0

    .line 42
    .line 43
    iget-object v9, v4, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 44
    .line 45
    if-eqz v9, :cond_0

    .line 46
    .line 47
    iget v7, v7, Landroid/app/ActivityManager$RunningTaskInfo;->parentTaskId:I

    .line 48
    .line 49
    iget v9, v9, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 50
    .line 51
    if-ne v7, v9, :cond_0

    .line 52
    .line 53
    move v6, v8

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    :goto_2
    if-eqz v6, :cond_3

    .line 56
    .line 57
    goto :goto_3

    .line 58
    :cond_3
    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_4
    new-array p2, v2, [Landroid/view/RemoteAnimationTarget;

    .line 65
    .line 66
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, [Landroid/view/RemoteAnimationTarget;

    .line 71
    .line 72
    new-instance p2, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 73
    .line 74
    iget-object v0, p1, Lcom/android/quickstep/RemoteAnimationTargets;->wallpapers:[Landroid/view/RemoteAnimationTarget;

    .line 75
    .line 76
    iget-object v1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->nonApps:[Landroid/view/RemoteAnimationTarget;

    .line 77
    .line 78
    iget p1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->targetMode:I

    .line 79
    .line 80
    invoke-direct {p2, p0, v0, v1, p1}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;I)V

    .line 81
    .line 82
    .line 83
    return-object p2
.end method

.method public static synthetic d(Lcom/android/quickstep/RemoteAnimationTargets;Landroid/view/RemoteAnimationTarget;)Z
    .locals 0

    .line 1
    iget p1, p1, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/RemoteAnimationTargets;->targetMode:I

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic e(Lcom/android/quickstep/RemoteAnimationTargets;Landroid/view/RemoteAnimationTarget;)Z
    .locals 0

    .line 1
    iget p1, p1, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/RemoteAnimationTargets;->targetMode:I

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method private getStartBounds(Landroid/view/RemoteAnimationTarget;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p1, Landroid/view/RemoteAnimationTarget;->startBounds:Landroid/graphics/Rect;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p1, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method private init(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/RemoteTargetGluer;->createHandles(Landroid/content/Context;Lcom/android/quickstep/BaseContainerInterface;IZ)[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 6
    .line 7
    return-void
.end method

.method private resizeRemoteTargetHandles(Lcom/android/quickstep/RemoteAnimationTargets;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/quickstep/p4;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Lcom/android/quickstep/p4;-><init>(Lcom/android/quickstep/RemoteAnimationTargets;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1}, Ljava/util/stream/Stream;->count()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    new-instance p1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "appCount: "

    .line 26
    .line 27
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, " handleLength: "

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 39
    .line 40
    array-length v2, v2

    .line 41
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string v2, "RemoteTargetGluer"

    .line 49
    .line 50
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 54
    .line 55
    array-length p1, p1

    .line 56
    int-to-long v3, p1

    .line 57
    cmp-long p1, v0, v3

    .line 58
    .line 59
    if-gez p1, :cond_0

    .line 60
    .line 61
    const-string p1, "resizing handles"

    .line 62
    .line 63
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    long-to-int p1, v0

    .line 67
    new-array v0, p1, [Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 70
    .line 71
    const/4 v2, 0x0

    .line 72
    invoke-static {v1, v2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 76
    .line 77
    :cond_0
    return-void
.end method


# virtual methods
.method public assignTargets(Lcom/android/quickstep/RemoteAnimationTargets;)[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_0

    .line 6
    .line 7
    iget-object v2, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 8
    .line 9
    aget-object v2, v2, v0

    .line 10
    .line 11
    aget-object v1, v1, v0

    .line 12
    .line 13
    invoke-static {v1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->b(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TransformParams;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 18
    .line 19
    invoke-direct {p0, p1, v3}, Lcom/android/quickstep/RemoteTargetGluer;->createRemoteAnimationTargetsForTarget(Lcom/android/quickstep/RemoteAnimationTargets;Ljava/util/List;)Lcom/android/quickstep/RemoteAnimationTargets;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v1, v3}, Lcom/android/quickstep/util/TransformParams;->setTargetSet(Lcom/android/quickstep/RemoteAnimationTargets;)Lcom/android/quickstep/util/TransformParams;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 27
    .line 28
    aget-object v1, v1, v0

    .line 29
    .line 30
    invoke-static {v1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->a(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TaskViewSimulator;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-virtual {v1, v2, v3}, Lcom/android/quickstep/util/TaskViewSimulator;->setPreview(Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/util/y2$a;)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-object v1
.end method

.method public assignTargetsForDesktop(Lcom/android/quickstep/RemoteAnimationTargets;Landroid/window/TransitionInfo;)[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RemoteTargetGluer;->resizeRemoteTargetHandles(Lcom/android/quickstep/RemoteAnimationTargets;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 6
    .line 7
    array-length v2, v1

    .line 8
    if-ge v0, v2, :cond_0

    .line 9
    .line 10
    iget-object v1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 11
    .line 12
    aget-object v2, v1, v0

    .line 13
    .line 14
    invoke-static {v1}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v3, Lcom/android/quickstep/q4;

    .line 19
    .line 20
    invoke-direct {v3, v2}, Lcom/android/quickstep/q4;-><init>(Landroid/view/RemoteAnimationTarget;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v1, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v3, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 32
    .line 33
    aget-object v3, v3, v0

    .line 34
    .line 35
    invoke-static {v3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->b(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TransformParams;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-direct {p0, p1, v1}, Lcom/android/quickstep/RemoteTargetGluer;->createRemoteAnimationTargetsForTarget(Lcom/android/quickstep/RemoteAnimationTargets;Ljava/util/List;)Lcom/android/quickstep/RemoteAnimationTargets;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v3, v1}, Lcom/android/quickstep/util/TransformParams;->setTargetSet(Lcom/android/quickstep/RemoteAnimationTargets;)Lcom/android/quickstep/util/TransformParams;

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 47
    .line 48
    aget-object v1, v1, v0

    .line 49
    .line 50
    invoke-static {v1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->b(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TransformParams;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1, p2}, Lcom/android/quickstep/util/TransformParams;->setTransitionInfo(Landroid/window/TransitionInfo;)Lcom/android/quickstep/util/TransformParams;

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 58
    .line 59
    aget-object v1, v1, v0

    .line 60
    .line 61
    invoke-static {v1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->a(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TaskViewSimulator;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const/4 v3, 0x0

    .line 66
    invoke-virtual {v1, v2, v3}, Lcom/android/quickstep/util/TaskViewSimulator;->setPreview(Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/util/y2$a;)V

    .line 67
    .line 68
    .line 69
    add-int/lit8 v0, v0, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    return-object v1
.end method

.method public assignTargetsForSplitScreen(Lcom/android/quickstep/RemoteAnimationTargets;)[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;
    .locals 8

    .line 3
    invoke-direct {p0, p1}, Lcom/android/quickstep/RemoteTargetGluer;->resizeRemoteTargetHandles(Lcom/android/quickstep/RemoteAnimationTargets;)V

    .line 4
    iget-object v0, p0, Lcom/android/quickstep/RemoteTargetGluer;->mSplitBounds:Lcom/android/launcher3/util/y2$a;

    if-nez v0, :cond_0

    .line 5
    iget-object v0, p1, Lcom/android/quickstep/RemoteAnimationTargets;->extras:Landroid/os/Bundle;

    const-string v1, "key_SplitBounds"

    const-class v2, Lcom/android/wm/shell/shared/split/SplitBounds;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/wm/shell/shared/split/SplitBounds;

    if-eqz v0, :cond_0

    .line 6
    invoke-static {v0}, Lcom/android/quickstep/util/SplitScreenUtils;->convertShellSplitBoundsToLauncher(Lcom/android/wm/shell/shared/split/SplitBounds;)Lcom/android/launcher3/util/y2$a;

    move-result-object v0

    iput-object v0, p0, Lcom/android/quickstep/RemoteTargetGluer;->mSplitBounds:Lcom/android/launcher3/util/y2$a;

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/RemoteTargetGluer;->mSplitBounds:Lcom/android/launcher3/util/y2$a;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 8
    :goto_0
    iget-object v3, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    invoke-static {v3}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object v3

    new-instance v4, Lcom/android/quickstep/r4;

    invoke-direct {v4, p1}, Lcom/android/quickstep/r4;-><init>(Lcom/android/quickstep/RemoteAnimationTargets;)V

    .line 9
    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v3

    .line 10
    invoke-interface {v3}, Ljava/util/stream/Stream;->count()J

    move-result-wide v3

    const-wide/16 v5, 0x1

    cmp-long v5, v3, v5

    if-lez v5, :cond_3

    .line 11
    iget-object v5, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    invoke-static {v5}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object v5

    new-instance v6, Lcom/android/quickstep/s4;

    invoke-direct {v6}, Lcom/android/quickstep/s4;-><init>()V

    .line 12
    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v5

    .line 13
    invoke-interface {v5}, Ljava/util/stream/Stream;->count()J

    move-result-wide v5

    if-eqz v0, :cond_2

    cmp-long v0, v5, v3

    if-nez v0, :cond_2

    move v0, v1

    goto :goto_1

    :cond_2
    move v0, v2

    goto :goto_1

    :cond_3
    const-wide/16 v5, 0x0

    .line 14
    :goto_1
    iget-object v3, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    array-length v4, v3

    if-nez v4, :cond_4

    return-object v3

    .line 15
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "containsSplitTargets? "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " handleLength: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    array-length v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " appsLength: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    array-length v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " splitCount: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "RemoteTargetGluer"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    iget-object v3, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    array-length v5, v3

    const/4 v6, 0x0

    if-ne v5, v1, :cond_5

    .line 17
    aget-object v0, v3, v2

    invoke-static {v0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->b(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TransformParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/TransformParams;->setTargetSet(Lcom/android/quickstep/RemoteAnimationTargets;)Lcom/android/quickstep/util/TransformParams;

    .line 18
    iget-object v0, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    array-length v0, v0

    if-lez v0, :cond_a

    .line 19
    iget-object v0, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    aget-object v0, v0, v2

    invoke-static {v0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->a(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TaskViewSimulator;

    move-result-object v0

    iget-object p1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    aget-object p1, p1, v2

    invoke-virtual {v0, p1, v6}, Lcom/android/quickstep/util/TaskViewSimulator;->setPreview(Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/util/y2$a;)V

    goto/16 :goto_4

    :cond_5
    if-nez v0, :cond_6

    .line 20
    :goto_2
    iget-object v0, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    array-length v1, v0

    if-ge v2, v1, :cond_a

    .line 21
    aget-object v0, v0, v2

    invoke-static {v0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->b(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TransformParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/TransformParams;->setTargetSet(Lcom/android/quickstep/RemoteAnimationTargets;)Lcom/android/quickstep/util/TransformParams;

    .line 22
    iget-object v0, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    aget-object v0, v0, v2

    invoke-static {v0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->a(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TaskViewSimulator;

    move-result-object v0

    iget-object v1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1, v6}, Lcom/android/quickstep/util/TaskViewSimulator;->setPreview(Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/util/y2$a;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 23
    :cond_6
    iget-object v0, p0, Lcom/android/quickstep/RemoteTargetGluer;->mSplitBounds:Lcom/android/launcher3/util/y2$a;

    iget v0, v0, Lcom/android/launcher3/util/y2$a;->k:I

    invoke-virtual {p1, v0}, Lcom/android/quickstep/RemoteAnimationTargets;->findTask(I)Landroid/view/RemoteAnimationTarget;

    move-result-object v0

    .line 24
    iget-object v3, p0, Lcom/android/quickstep/RemoteTargetGluer;->mSplitBounds:Lcom/android/launcher3/util/y2$a;

    iget v3, v3, Lcom/android/launcher3/util/y2$a;->l:I

    invoke-virtual {p1, v3}, Lcom/android/quickstep/RemoteAnimationTargets;->findTask(I)Landroid/view/RemoteAnimationTarget;

    move-result-object v3

    if-nez v0, :cond_7

    .line 25
    iget-object v5, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    array-length v5, v5

    if-lez v5, :cond_7

    .line 26
    const-string v0, "assignTargetsForSplitScreen: topLeftTarget is null, use targets.apps[0] !"

    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    iget-object v0, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    aget-object v0, v0, v2

    :cond_7
    if-nez v3, :cond_8

    .line 28
    iget-object v5, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    array-length v5, v5

    if-lez v5, :cond_8

    .line 29
    const-string v3, "assignTargetsForSplitScreen: bottomRightTarget is null, use targets.apps[1] !"

    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    iget-object v3, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    aget-object v3, v3, v1

    .line 31
    :cond_8
    iget-object v5, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    invoke-static {v5}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object v5

    new-instance v6, Lcom/android/quickstep/t4;

    invoke-direct {v6}, Lcom/android/quickstep/t4;-><init>()V

    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v5

    .line 32
    invoke-interface {v5}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    move-result-object v5

    .line 33
    iget-object v6, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    aget-object v6, v6, v2

    invoke-static {v6}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->b(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TransformParams;

    move-result-object v6

    .line 34
    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 35
    invoke-direct {p0, p1, v7}, Lcom/android/quickstep/RemoteTargetGluer;->createRemoteAnimationTargetsForTarget(Lcom/android/quickstep/RemoteAnimationTargets;Ljava/util/List;)Lcom/android/quickstep/RemoteAnimationTargets;

    move-result-object v7

    .line 36
    invoke-virtual {v6, v7}, Lcom/android/quickstep/util/TransformParams;->setTargetSet(Lcom/android/quickstep/RemoteAnimationTargets;)Lcom/android/quickstep/util/TransformParams;

    .line 37
    iget-object v6, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    aget-object v2, v6, v2

    invoke-static {v2}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->a(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TaskViewSimulator;

    move-result-object v2

    iget-object v6, p0, Lcom/android/quickstep/RemoteTargetGluer;->mSplitBounds:Lcom/android/launcher3/util/y2$a;

    invoke-virtual {v2, v0, v6}, Lcom/android/quickstep/util/TaskViewSimulator;->setPreview(Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/util/y2$a;)V

    .line 38
    iget-object v2, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    aget-object v2, v2, v1

    invoke-static {v2}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->b(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TransformParams;

    move-result-object v2

    .line 39
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    .line 40
    invoke-direct {p0, p1, v6}, Lcom/android/quickstep/RemoteTargetGluer;->createRemoteAnimationTargetsForTarget(Lcom/android/quickstep/RemoteAnimationTargets;Ljava/util/List;)Lcom/android/quickstep/RemoteAnimationTargets;

    move-result-object v6

    .line 41
    invoke-virtual {v2, v6}, Lcom/android/quickstep/util/TransformParams;->setTargetSet(Lcom/android/quickstep/RemoteAnimationTargets;)Lcom/android/quickstep/util/TransformParams;

    .line 42
    iget-object v2, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    aget-object v1, v2, v1

    invoke-static {v1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->a(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TaskViewSimulator;

    move-result-object v1

    iget-object v2, p0, Lcom/android/quickstep/RemoteTargetGluer;->mSplitBounds:Lcom/android/launcher3/util/y2$a;

    invoke-virtual {v1, v3, v2}, Lcom/android/quickstep/util/TaskViewSimulator;->setPreview(Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/util/y2$a;)V

    .line 43
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_a

    .line 44
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 45
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x2

    .line 47
    :goto_3
    iget-object v2, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    array-length v2, v2

    if-ge v0, v2, :cond_a

    .line 48
    iget-object v2, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    array-length v3, v2

    if-lt v0, v3, :cond_9

    .line 49
    array-length v0, v2

    .line 50
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object p1, p1, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    array-length p1, p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {v0, p1}, [Ljava/lang/Object;

    move-result-object p1

    .line 51
    const-string v0, "Attempting to animate an untracked target (%d handles allocated, but %d want to animate)"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 52
    :cond_9
    aget-object v2, v2, v0

    invoke-static {v2}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->b(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TransformParams;

    move-result-object v2

    .line 53
    invoke-direct {p0, p1, v1}, Lcom/android/quickstep/RemoteTargetGluer;->createRemoteAnimationTargetsForTarget(Lcom/android/quickstep/RemoteAnimationTargets;Ljava/util/List;)Lcom/android/quickstep/RemoteAnimationTargets;

    move-result-object v3

    .line 54
    invoke-virtual {v2, v3}, Lcom/android/quickstep/util/TransformParams;->setTargetSet(Lcom/android/quickstep/RemoteAnimationTargets;)Lcom/android/quickstep/util/TransformParams;

    .line 55
    iget-object v2, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    aget-object v2, v2, v0

    invoke-static {v2}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->a(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TaskViewSimulator;

    move-result-object v2

    add-int/lit8 v3, v0, -0x2

    .line 56
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/RemoteAnimationTarget;

    .line 57
    invoke-virtual {v2, v3}, Lcom/android/quickstep/util/TaskViewSimulator;->setPreview(Landroid/view/RemoteAnimationTarget;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 58
    :cond_a
    :goto_4
    iget-object p0, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    return-object p0
.end method

.method public assignTargetsForSplitScreen(Lcom/android/quickstep/RemoteAnimationTargets;Lcom/android/launcher3/util/y2$a;)[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/RemoteTargetGluer;->mSplitBounds:Lcom/android/launcher3/util/y2$a;

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RemoteTargetGluer;->assignTargetsForSplitScreen(Lcom/android/quickstep/RemoteAnimationTargets;)[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    move-result-object p0

    return-object p0
.end method

.method public getRemoteTargetHandles()[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RemoteTargetGluer;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSplitBounds()Lcom/android/launcher3/util/y2$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RemoteTargetGluer;->mSplitBounds:Lcom/android/launcher3/util/y2$a;

    .line 2
    .line 3
    return-object p0
.end method
