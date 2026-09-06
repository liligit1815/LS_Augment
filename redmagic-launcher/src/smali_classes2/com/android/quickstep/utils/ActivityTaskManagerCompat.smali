.class public Lcom/android/quickstep/utils/ActivityTaskManagerCompat;
.super Ljava/lang/Object;
.source "ActivityTaskManagerCompat.java"


# static fields
.field private static final GET_TASK_SNAPSHOT_METHOD:Lcom/android/quickstep/utils/MethodKey;

.field private static final GET_TASK_SNAPSHOT_METHOD_API_14:Lcom/android/quickstep/utils/MethodKey;

.field private static final GET_TASK_SNAPSHOT_METHOD_API_15:Lcom/android/quickstep/utils/MethodKey;

.field private static final HAS_METHOD:I = 0x1

.field private static final INVALID_VALUE:I = 0x0

.field private static METHOD_FINISH_NODISPLAY_ACTIVITY:Lcom/android/quickstep/utils/MethodKey; = null

.field private static METHOD_SET_PAUSE_ADVANCE:Lcom/android/quickstep/utils/MethodKey; = null

.field private static METHOD_UNSET_PAUSE_ADVANCE:Lcom/android/quickstep/utils/MethodKey; = null

.field private static final NOT_HAS_METHOD:I = 0x2

.field private static final TAG:Ljava/lang/String; = "ActivityTaskManagerCompat"

.field private static volatile sHasSetPauseAdvanceMethod:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/android/quickstep/utils/MethodKey;

    .line 2
    .line 3
    const-class v1, [I

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "setPauseAdvance"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Lcom/android/quickstep/utils/MethodKey;-><init>(Ljava/lang/String;[Ljava/lang/Class;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->METHOD_SET_PAUSE_ADVANCE:Lcom/android/quickstep/utils/MethodKey;

    .line 15
    .line 16
    new-instance v0, Lcom/android/quickstep/utils/MethodKey;

    .line 17
    .line 18
    const-string v1, "unSetPauseAdvance"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Lcom/android/quickstep/utils/MethodKey;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->METHOD_UNSET_PAUSE_ADVANCE:Lcom/android/quickstep/utils/MethodKey;

    .line 24
    .line 25
    new-instance v0, Lcom/android/quickstep/utils/MethodKey;

    .line 26
    .line 27
    const-string v1, "finishNoDisplayActivity"

    .line 28
    .line 29
    invoke-direct {v0, v1}, Lcom/android/quickstep/utils/MethodKey;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->METHOD_FINISH_NODISPLAY_ACTIVITY:Lcom/android/quickstep/utils/MethodKey;

    .line 33
    .line 34
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 35
    .line 36
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 37
    .line 38
    new-instance v2, Lcom/android/quickstep/utils/MethodKey;

    .line 39
    .line 40
    filled-new-array {v0, v1}, [Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    const-string v4, "getTaskSnapshot"

    .line 45
    .line 46
    invoke-direct {v2, v4, v3}, Lcom/android/quickstep/utils/MethodKey;-><init>(Ljava/lang/String;[Ljava/lang/Class;)V

    .line 47
    .line 48
    .line 49
    sput-object v2, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->GET_TASK_SNAPSHOT_METHOD_API_15:Lcom/android/quickstep/utils/MethodKey;

    .line 50
    .line 51
    new-instance v2, Lcom/android/quickstep/utils/MethodKey;

    .line 52
    .line 53
    filled-new-array {v0, v1, v1}, [Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-direct {v2, v4, v3}, Lcom/android/quickstep/utils/MethodKey;-><init>(Ljava/lang/String;[Ljava/lang/Class;)V

    .line 58
    .line 59
    .line 60
    sput-object v2, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->GET_TASK_SNAPSHOT_METHOD_API_14:Lcom/android/quickstep/utils/MethodKey;

    .line 61
    .line 62
    new-instance v2, Lcom/android/quickstep/utils/MethodKey;

    .line 63
    .line 64
    filled-new-array {v0, v1}, [Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-direct {v2, v4, v0}, Lcom/android/quickstep/utils/MethodKey;-><init>(Ljava/lang/String;[Ljava/lang/Class;)V

    .line 69
    .line 70
    .line 71
    sput-object v2, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->GET_TASK_SNAPSHOT_METHOD:Lcom/android/quickstep/utils/MethodKey;

    .line 72
    .line 73
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

.method public static finishNoDisplayActivity()V
    .locals 3

    .line 1
    const-string v0, "ActivityTaskManagerCompat"

    .line 2
    .line 3
    const-string v1, "finishNoDisplayActivity"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Landroid/app/ActivityTaskManager;->getService()Landroid/app/IActivityTaskManager;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    sget-object v2, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->METHOD_FINISH_NODISPLAY_ACTIVITY:Lcom/android/quickstep/utils/MethodKey;

    .line 14
    .line 15
    invoke-static {v0, v1, v2, v1}, Lcom/android/quickstep/utils/ReflectUtils;->invokeMethod(Ljava/lang/Object;Ljava/lang/String;Lcom/android/quickstep/utils/MethodKey;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static hasSetPauseAdvanceMethod()Z
    .locals 5

    .line 1
    sget v0, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->sHasSetPauseAdvanceMethod:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    :try_start_0
    invoke-static {}, Landroid/app/ActivityTaskManager;->getService()Landroid/app/IActivityTaskManager;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "setPauseAdvance"

    .line 16
    .line 17
    const-class v4, [I

    .line 18
    .line 19
    filled-new-array {v4}, [Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    sput v1, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->sHasSetPauseAdvanceMethod:I

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :catch_0
    move-exception v2

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    sput v0, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->sHasSetPauseAdvanceMethod:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v4, "hasSetPauseAdvanceMethod: "

    .line 43
    .line 44
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const-string v3, "ActivityTaskManagerCompat"

    .line 55
    .line 56
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    sput v0, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->sHasSetPauseAdvanceMethod:I

    .line 60
    .line 61
    :cond_1
    :goto_1
    sget v0, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->sHasSetPauseAdvanceMethod:I

    .line 62
    .line 63
    if-ne v0, v1, :cond_2

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_2
    const/4 v1, 0x0

    .line 67
    :goto_2
    return v1
.end method

.method public static setPauseAdvance([I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setPauseAdvance: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "ActivityTaskManagerCompat"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    invoke-static {}, Landroid/app/ActivityTaskManager;->getService()Landroid/app/IActivityTaskManager;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-object v1, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->METHOD_SET_PAUSE_ADVANCE:Lcom/android/quickstep/utils/MethodKey;

    .line 32
    .line 33
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-static {v0, v2, v1, p0}, Lcom/android/quickstep/utils/ReflectUtils;->invokeMethod(Ljava/lang/Object;Ljava/lang/String;Lcom/android/quickstep/utils/MethodKey;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static unSetPauseAdvance()V
    .locals 3

    .line 1
    const-string v0, "ActivityTaskManagerCompat"

    .line 2
    .line 3
    const-string v1, "unSetPauseAdvance"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Landroid/app/ActivityTaskManager;->getService()Landroid/app/IActivityTaskManager;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    sget-object v2, Lcom/android/quickstep/utils/ActivityTaskManagerCompat;->METHOD_UNSET_PAUSE_ADVANCE:Lcom/android/quickstep/utils/MethodKey;

    .line 14
    .line 15
    invoke-static {v0, v1, v2, v1}, Lcom/android/quickstep/utils/ReflectUtils;->invokeMethod(Ljava/lang/Object;Ljava/lang/String;Lcom/android/quickstep/utils/MethodKey;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method
