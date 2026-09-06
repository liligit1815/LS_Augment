.class public Lcom/android/systemui/shared/system/InputChannelCompat;
.super Ljava/lang/Object;
.source "InputChannelCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/system/InputChannelCompat$NubiaInputEventReceiver;,
        Lcom/android/systemui/shared/system/InputChannelCompat$InputEventListener;,
        Lcom/android/systemui/shared/system/InputChannelCompat$SysUiInputEventReceiver;,
        Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static initInputMonitor(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventListener;)Lcom/android/systemui/shared/system/InputChannelCompat$NubiaInputEventReceiver;
    .locals 1

    .line 1
    const-string v0, "input"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/hardware/input/InputManager;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p0}, Landroid/hardware/input/InputManager;->myInput(Ljava/lang/String;Landroid/content/Context;)Landroid/view/InputChannel;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Lcom/android/systemui/shared/system/InputChannelCompat$NubiaInputEventReceiver;

    .line 14
    .line 15
    invoke-direct {p1, p0, p2, p3}, Lcom/android/systemui/shared/system/InputChannelCompat$NubiaInputEventReceiver;-><init>(Landroid/view/InputChannel;Landroid/os/Looper;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventListener;)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method public static inject(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lcom/android/systemui/shared/system/InputChannelCompat;->sendEvent(II)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, v0}, Lcom/android/systemui/shared/system/InputChannelCompat;->sendEvent(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static isInFreeformModeOpen()Z
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Landroid/app/ActivityTaskManager;->getService()Landroid/app/IActivityTaskManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Landroid/app/IActivityTaskManager;->isFreeFormModeOpen()Z

    .line 6
    .line 7
    .line 8
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return v0

    .line 10
    :catch_0
    move-exception v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    return v0
.end method

.method public static mergeMotionEvent(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Landroid/view/MotionEvent;->addBatch(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static sendEvent(II)V
    .locals 3

    const/4 v0, 0x0

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-static {p0, p1, v0, v1, v2}, Lcom/android/systemui/shared/system/InputChannelCompat;->sendEvent(IIIJ)V

    return-void
.end method

.method private static sendEvent(IIIJ)V
    .locals 16

    move/from16 v0, p2

    and-int/lit16 v1, v0, 0x80

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    move v10, v1

    goto :goto_0

    :cond_0
    move v10, v2

    .line 2
    :goto_0
    new-instance v3, Landroid/view/KeyEvent;

    or-int/lit8 v14, v0, 0x48

    const/16 v15, 0x101

    const/4 v11, 0x0

    const/4 v12, -0x1

    const/4 v13, 0x0

    move-wide/from16 v6, p3

    move/from16 v9, p0

    move/from16 v8, p1

    move-wide/from16 v4, p3

    invoke-direct/range {v3 .. v15}, Landroid/view/KeyEvent;-><init>(JJIIIIIIII)V

    .line 3
    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v0

    invoke-virtual {v0, v3, v2}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    return-void
.end method
