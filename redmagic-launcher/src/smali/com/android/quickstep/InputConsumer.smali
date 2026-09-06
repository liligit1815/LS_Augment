.class public interface abstract Lcom/android/quickstep/InputConsumer;
.super Ljava/lang/Object;
.source "InputConsumer.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1a
.end annotation


# static fields
.field public static final DEFAULT_NO_OP:Lcom/android/quickstep/InputConsumer;

.field public static final NAMES:[Ljava/lang/String;

.field public static final TYPE_ACCESSIBILITY:I = 0x20

.field public static final TYPE_ASSISTANT:I = 0x8

.field public static final TYPE_BUBBLE_BAR:I = 0x10000

.field public static final TYPE_CURSOR_HOVER:I = 0x4000

.field public static final TYPE_DEVICE_LOCKED:I = 0x10

.field public static final TYPE_GESTURE_COURSE:I = 0x20000

.field public static final TYPE_NAV_HANDLE_LONG_PRESS:I = 0x8000

.field public static final TYPE_NO_OP:I = 0x1

.field public static final TYPE_ONE_HANDED:I = 0x800

.field public static final TYPE_OTHER_ACTIVITY:I = 0x4

.field public static final TYPE_OVERVIEW:I = 0x2

.field public static final TYPE_OVERVIEW_WITHOUT_FOCUS:I = 0x80

.field public static final TYPE_PROGRESS_DELEGATE:I = 0x200

.field public static final TYPE_RESET_GESTURE:I = 0x100

.field public static final TYPE_SCREEN_PINNED:I = 0x40

.field public static final TYPE_STATUS_BAR:I = 0x2000

.field public static final TYPE_SYSUI_OVERLAY:I = 0x400

.field public static final TYPE_TASKBAR_STASH:I = 0x1000


# direct methods
.method static constructor <clinit>()V
    .locals 19

    .line 1
    const-string v17, "TYPE_BUBBLE_BAR"

    .line 2
    .line 3
    const-string v18, "TYPE_GESTURE_COURSE"

    .line 4
    .line 5
    const-string v1, "TYPE_NO_OP"

    .line 6
    .line 7
    const-string v2, "TYPE_OVERVIEW"

    .line 8
    .line 9
    const-string v3, "TYPE_OTHER_ACTIVITY"

    .line 10
    .line 11
    const-string v4, "TYPE_ASSISTANT"

    .line 12
    .line 13
    const-string v5, "TYPE_DEVICE_LOCKED"

    .line 14
    .line 15
    const-string v6, "TYPE_ACCESSIBILITY"

    .line 16
    .line 17
    const-string v7, "TYPE_SCREEN_PINNED"

    .line 18
    .line 19
    const-string v8, "TYPE_OVERVIEW_WITHOUT_FOCUS"

    .line 20
    .line 21
    const-string v9, "TYPE_RESET_GESTURE"

    .line 22
    .line 23
    const-string v10, "TYPE_PROGRESS_DELEGATE"

    .line 24
    .line 25
    const-string v11, "TYPE_SYSUI_OVERLAY"

    .line 26
    .line 27
    const-string v12, "TYPE_ONE_HANDED"

    .line 28
    .line 29
    const-string v13, "TYPE_TASKBAR_STASH"

    .line 30
    .line 31
    const-string v14, "TYPE_STATUS_BAR"

    .line 32
    .line 33
    const-string v15, "TYPE_CURSOR_HOVER"

    .line 34
    .line 35
    const-string v16, "TYPE_NAV_HANDLE_LONG_PRESS"

    .line 36
    .line 37
    filled-new-array/range {v1 .. v18}, [Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/android/quickstep/InputConsumer;->NAMES:[Ljava/lang/String;

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-static {v0}, Lcom/android/quickstep/InputConsumer;->createNoOpInputConsumer(I)Lcom/android/quickstep/InputConsumer;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sput-object v0, Lcom/android/quickstep/InputConsumer;->DEFAULT_NO_OP:Lcom/android/quickstep/InputConsumer;

    .line 49
    .line 50
    return-void
.end method

.method public static createNoOpInputConsumer(I)Lcom/android/quickstep/InputConsumer;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/InputConsumer$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/InputConsumer$1;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public allowInterceptByParent()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public getActiveConsumerInHierarchy()Lcom/android/quickstep/InputConsumer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public abstract getDisplayId()I
.end method

.method public getInputConsumerOfClass(Ljava/lang/Class;)Lcom/android/quickstep/InputConsumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/android/quickstep/InputConsumer;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/quickstep/InputConsumer;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    sget-object v2, Lcom/android/quickstep/InputConsumer;->NAMES:[Ljava/lang/String;

    .line 8
    .line 9
    array-length v3, v2

    .line 10
    if-ge v1, v3, :cond_2

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/android/quickstep/InputConsumer;->getType()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    const/4 v4, 0x1

    .line 17
    shl-int/2addr v4, v1

    .line 18
    and-int/2addr v3, v4

    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-lez v3, :cond_0

    .line 26
    .line 27
    const-string v3, ":"

    .line 28
    .line 29
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    :cond_0
    aget-object v2, v2, v1

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public abstract getType()I
.end method

.method public isConsumerDetachedFromGesture()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public notifyOrientationSetup()V
    .locals 0

    .line 1
    return-void
.end method

.method public onConsumerAboutToBeSwitched()V
    .locals 0

    .line 1
    return-void
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onInputEvent(Landroid/view/InputEvent;)V
    .locals 1

    .line 1
    instance-of v0, p1, Landroid/view/MotionEvent;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Landroid/view/MotionEvent;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/android/quickstep/InputConsumer;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    check-cast p1, Landroid/view/KeyEvent;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Lcom/android/quickstep/InputConsumer;->onKeyEvent(Landroid/view/KeyEvent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onKeyEvent(Landroid/view/KeyEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method
