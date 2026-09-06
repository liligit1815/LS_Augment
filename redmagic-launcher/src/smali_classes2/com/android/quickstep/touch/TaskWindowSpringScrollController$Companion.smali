.class public final Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;
.super Ljava/lang/Object;
.source "TaskWindowSpringScrollController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/touch/TaskWindowSpringScrollController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getCreatedInstance()Lcom/android/quickstep/touch/TaskWindowSpringScrollController;
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->c()Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final isCompatibleRemoteTargetHandles([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Z
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    array-length v0, p1

    .line 6
    move v1, p0

    .line 7
    :goto_0
    const/4 v2, 0x0

    .line 8
    if-lt v1, v0, :cond_1

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_1
    aget-object v3, p1, v1

    .line 12
    .line 13
    invoke-virtual {v3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    if-eqz v3, :cond_2

    .line 18
    .line 19
    invoke-virtual {v3}, Lcom/android/quickstep/util/TaskViewSimulator;->getStagedSplitBounds()Lcom/android/launcher3/util/y2$a;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    :cond_2
    if-eqz v2, :cond_6

    .line 24
    .line 25
    invoke-virtual {v3}, Lcom/android/quickstep/util/TaskViewSimulator;->getStagedSplitBounds()Lcom/android/launcher3/util/y2$a;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    :goto_1
    const/4 v0, 0x1

    .line 30
    if-eqz v2, :cond_3

    .line 31
    .line 32
    move v1, v0

    .line 33
    goto :goto_2

    .line 34
    :cond_3
    move v1, p0

    .line 35
    :goto_2
    array-length p1, p1

    .line 36
    if-eq p1, v0, :cond_5

    .line 37
    .line 38
    if-eqz v1, :cond_4

    .line 39
    .line 40
    const/4 v1, 0x2

    .line 41
    if-ne p1, v1, :cond_4

    .line 42
    .line 43
    goto :goto_3

    .line 44
    :cond_4
    return p0

    .line 45
    :cond_5
    :goto_3
    return v0

    .line 46
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_0
.end method

.method public final isEnabled()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final isSupportSpringScrollWith(Lcom/android/quickstep/GestureState$GestureEndTarget;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

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
