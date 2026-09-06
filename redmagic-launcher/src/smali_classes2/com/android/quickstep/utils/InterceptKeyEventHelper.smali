.class public final Lcom/android/quickstep/utils/InterceptKeyEventHelper;
.super Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;
.source "InterceptKeyEventHelper.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "InterceptKeyEventHelper"


# instance fields
.field private inputCallback:Landroid/window/IRemoteTransitionInputCallback;

.field private final interceptKeyMethod:Lcom/android/quickstep/util/anim/BaseValueHolder;

.field private final mfvWindowManager:Lcom/android/quickstep/util/anim/BaseValueHolder;

.field private final oldInterceptKeyMethod:Lcom/android/quickstep/util/anim/BaseValueHolder;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/quickstep/util/anim/FunctionValueHolder;

    .line 5
    .line 6
    new-instance v1, Lcom/android/quickstep/utils/InterceptKeyEventHelper$1;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/quickstep/utils/InterceptKeyEventHelper$1;-><init>(Lcom/android/quickstep/utils/InterceptKeyEventHelper;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/anim/FunctionValueHolder;-><init>(Lu4/a;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->mfvWindowManager:Lcom/android/quickstep/util/anim/BaseValueHolder;

    .line 15
    .line 16
    new-instance v0, Lcom/android/quickstep/util/anim/FunctionValueHolder;

    .line 17
    .line 18
    new-instance v1, Lcom/android/quickstep/utils/InterceptKeyEventHelper$2;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/android/quickstep/utils/InterceptKeyEventHelper$2;-><init>(Lcom/android/quickstep/utils/InterceptKeyEventHelper;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/anim/FunctionValueHolder;-><init>(Lu4/a;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->interceptKeyMethod:Lcom/android/quickstep/util/anim/BaseValueHolder;

    .line 27
    .line 28
    new-instance v0, Lcom/android/quickstep/util/anim/FunctionValueHolder;

    .line 29
    .line 30
    new-instance v1, Lcom/android/quickstep/utils/InterceptKeyEventHelper$3;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Lcom/android/quickstep/utils/InterceptKeyEventHelper$3;-><init>(Lcom/android/quickstep/utils/InterceptKeyEventHelper;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/anim/FunctionValueHolder;-><init>(Lu4/a;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->oldInterceptKeyMethod:Lcom/android/quickstep/util/anim/BaseValueHolder;

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/utils/InterceptKeyEventHelper;ZLandroid/window/IRemoteTransitionInputCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->lambda$setInterceptKeyEventEnabled$0(ZLandroid/window/IRemoteTransitionInputCallback;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final getInterceptKeyMethod()Ljava/lang/reflect/Method;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->interceptKeyMethod:Lcom/android/quickstep/util/anim/BaseValueHolder;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/util/anim/BaseValueHolder;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/reflect/Method;

    .line 8
    .line 9
    return-object p0
.end method

.method private final getOldInterceptKeyMethod()Ljava/lang/reflect/Method;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->oldInterceptKeyMethod:Lcom/android/quickstep/util/anim/BaseValueHolder;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/util/anim/BaseValueHolder;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/reflect/Method;

    .line 8
    .line 9
    return-object p0
.end method

.method private synthetic lambda$setInterceptKeyEventEnabled$0(ZLandroid/window/IRemoteTransitionInputCallback;)V
    .locals 0

    .line 1
    invoke-static {p1, p0, p2}, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->setInterceptKeyEventEnabled$lambda$2(ZLcom/android/quickstep/utils/InterceptKeyEventHelper;Landroid/window/IRemoteTransitionInputCallback;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final setInterceptKeyEventEnabled$lambda$0(Lcom/android/quickstep/utils/InterceptKeyEventHelper;ZLandroid/window/IRemoteTransitionInputCallback;Lcom/android/wm/shell/recents/d;)V
    .locals 2

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "$inputCallback"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "$runner"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->getInterceptKeyMethod()Ljava/lang/reflect/Method;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->setInterceptKeyEventEnabled(ZLandroid/window/IRemoteTransitionInputCallback;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v1, "realSetInterceptKeyEventEnabled: "

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, ", "

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    const-string v0, "InterceptKeyEventHelper"

    .line 52
    .line 53
    invoke-static {v0, p2}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0}, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->getOldInterceptKeyMethod()Ljava/lang/reflect/Method;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    if-eqz p2, :cond_1

    .line 61
    .line 62
    :try_start_0
    invoke-virtual {p0}, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->getMFVWindowManager()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    filled-new-array {p1, p3}, [Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p2, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :catch_0
    move-exception p0

    .line 79
    new-instance p1, Ljava/lang/RuntimeException;

    .line 80
    .line 81
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    throw p1

    .line 85
    :catch_1
    move-exception p0

    .line 86
    new-instance p1, Ljava/lang/RuntimeException;

    .line 87
    .line 88
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    throw p1

    .line 92
    :cond_1
    return-void
.end method

.method public static final setInterceptKeyEventEnabled$lambda$2(ZLcom/android/quickstep/utils/InterceptKeyEventHelper;Landroid/window/IRemoteTransitionInputCallback;)V
    .locals 5

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "$inputCallback"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, ", "

    .line 12
    .line 13
    const-string v1, "InterceptKeyEventHelper"

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    iget-object v2, p1, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->inputCallback:Landroid/window/IRemoteTransitionInputCallback;

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-static {p2, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    new-instance p0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v2, "setInterceptKeyEventEnabled fail: "

    .line 33
    .line 34
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object p1, p1, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->inputCallback:Landroid/window/IRemoteTransitionInputCallback;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    invoke-direct {p1}, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->getInterceptKeyMethod()Ljava/lang/reflect/Method;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    new-instance v3, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v4, "realSetInterceptKeyEventEnabled by new api: "

    .line 68
    .line 69
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iput-object p2, p1, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->inputCallback:Landroid/window/IRemoteTransitionInputCallback;

    .line 89
    .line 90
    :try_start_0
    invoke-virtual {p1}, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->getMFVWindowManager()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    filled-new-array {p0, p2}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v2, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :catch_0
    move-exception p0

    .line 107
    new-instance p1, Ljava/lang/RuntimeException;

    .line 108
    .line 109
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    throw p1

    .line 113
    :catch_1
    move-exception p0

    .line 114
    new-instance p1, Ljava/lang/RuntimeException;

    .line 115
    .line 116
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 117
    .line 118
    .line 119
    throw p1

    .line 120
    :cond_1
    return-void
.end method


# virtual methods
.method public final getMFVWindowManager()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/InterceptKeyEventHelper;->mfvWindowManager:Lcom/android/quickstep/util/anim/BaseValueHolder;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/util/anim/BaseValueHolder;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "<get-MFVWindowManager>(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public sendBackKeyEvent(Landroid/content/Context;)V
    .locals 8

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    new-instance v0, Landroid/view/KeyEvent;

    .line 11
    .line 12
    const/4 v6, 0x4

    .line 13
    const/4 v7, 0x0

    .line 14
    const/4 v5, 0x0

    .line 15
    move-wide v3, v1

    .line 16
    invoke-direct/range {v0 .. v7}, Landroid/view/KeyEvent;-><init>(JJIII)V

    .line 17
    .line 18
    .line 19
    move-object p0, v0

    .line 20
    new-instance v0, Landroid/view/KeyEvent;

    .line 21
    .line 22
    const/4 v5, 0x1

    .line 23
    invoke-direct/range {v0 .. v7}, Landroid/view/KeyEvent;-><init>(JJIII)V

    .line 24
    .line 25
    .line 26
    const-class v1, Landroid/hardware/input/InputManager;

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Landroid/hardware/input/InputManager;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p1, p0, v1}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    .line 38
    .line 39
    .line 40
    :cond_0
    if-eqz p1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1, v0, v1}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public setInterceptKeyEventEnabled(ZLandroid/window/IRemoteTransitionInputCallback;)V
    .locals 2

    .line 5
    const-string v0, "inputCallback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setInterceptKeyEventEnabled by new api: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "InterceptKeyEventHelper"

    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    new-instance v1, Lcom/android/quickstep/utils/p;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/quickstep/utils/p;-><init>(Lcom/android/quickstep/utils/InterceptKeyEventHelper;ZLandroid/window/IRemoteTransitionInputCallback;)V

    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setInterceptKeyEventEnabled(ZLcom/android/wm/shell/recents/d;Landroid/window/IRemoteTransitionInputCallback;)V
    .locals 2

    .line 1
    const-string v0, "runner"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    const-string v0, "inputCallback"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setInterceptKeyEventEnabled: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "InterceptKeyEventHelper"

    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    new-instance v1, Lcom/android/quickstep/utils/InterceptKeyEventHelper$4;

    invoke-direct {v1, p0, p1, p3, p2}, Lcom/android/quickstep/utils/InterceptKeyEventHelper$4;-><init>(Lcom/android/quickstep/utils/InterceptKeyEventHelper;ZLandroid/window/IRemoteTransitionInputCallback;Lcom/android/wm/shell/recents/d;)V

    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
