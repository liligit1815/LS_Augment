.class public final Lcom/android/quickstep/util/ActiveTrackpadList;
.super Lcom/android/launcher3/util/z0;
.source "ActiveTrackpadList.kt"

# interfaces
.implements Landroid/hardware/input/InputManager$InputDeviceListener;


# instance fields
.field private final inputManager:Landroid/hardware/input/InputManager;

.field private final updateCallback:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    const-string v0, "ctx"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "updateCallback"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Lcom/android/quickstep/util/ActiveTrackpadList;->updateCallback:Ljava/lang/Runnable;

    .line 15
    .line 16
    const-class p2, Landroid/hardware/input/InputManager;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    check-cast p1, Landroid/hardware/input/InputManager;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/android/quickstep/util/ActiveTrackpadList;->inputManager:Landroid/hardware/input/InputManager;

    .line 28
    .line 29
    sget-object p2, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p1, p0, p2}, Landroid/hardware/input/InputManager;->registerInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;Landroid/os/Handler;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/hardware/input/InputManager;->getInputDeviceIds()[I

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string p2, "getInputDeviceIds(...)"

    .line 43
    .line 44
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    new-instance p2, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    array-length v0, p1

    .line 53
    const/4 v1, 0x0

    .line 54
    :goto_0
    if-ge v1, v0, :cond_1

    .line 55
    .line 56
    aget v2, p1, v1

    .line 57
    .line 58
    invoke-direct {p0, v2}, Lcom/android/quickstep/util/ActiveTrackpadList;->isTrackpadDevice(I)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_0

    .line 63
    .line 64
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-interface {p2, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-eqz p2, :cond_2

    .line 83
    .line 84
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    check-cast p2, Ljava/lang/Number;

    .line 89
    .line 90
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/util/ActiveTrackpadList;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/ActiveTrackpadList;->onInputDeviceRemoved$lambda$2(Lcom/android/quickstep/util/ActiveTrackpadList;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/util/ActiveTrackpadList;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/ActiveTrackpadList;->onInputDeviceAdded$lambda$1(Lcom/android/quickstep/util/ActiveTrackpadList;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final isTrackpadDevice(I)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ActiveTrackpadList;->inputManager:Landroid/hardware/input/InputManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/hardware/input/InputManager;->getInputDevice(I)Landroid/view/InputDevice;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/InputDevice;->getSources()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const v0, 0x10200a

    .line 15
    .line 16
    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    return p1
.end method

.method private static final onInputDeviceAdded$lambda$1(Lcom/android/quickstep/util/ActiveTrackpadList;I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/z0;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 6
    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/util/ActiveTrackpadList;->update()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private static final onInputDeviceRemoved$lambda$2(Lcom/android/quickstep/util/ActiveTrackpadList;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/z0;->remove(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/util/z0;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/util/ActiveTrackpadList;->update()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private final update()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ActiveTrackpadList;->updateCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/ActiveTrackpadList;->inputManager:Landroid/hardware/input/InputManager;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/hardware/input/InputManager;->unregisterInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/util/z0;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onInputDeviceAdded(I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/ActiveTrackpadList;->isTrackpadDevice(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 8
    .line 9
    new-instance v1, Lcom/android/quickstep/util/c;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/util/c;-><init>(Lcom/android/quickstep/util/ActiveTrackpadList;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onInputDeviceChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onInputDeviceRemoved(I)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/util/b;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/util/b;-><init>(Lcom/android/quickstep/util/ActiveTrackpadList;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
