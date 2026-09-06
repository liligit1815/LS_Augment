.class public Lcom/android/quickstep/util/InputConsumerProxy;
.super Ljava/lang/Object;
.source "InputConsumerProxy.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "InputConsumerProxy"


# instance fields
.field private mConsumerSupplier:Ljava/util/function/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Supplier<",
            "Lcom/android/quickstep/InputConsumer;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private mDestroyPending:Z

.field private mDestroyed:Z

.field private mInputConsumer:Lcom/android/quickstep/InputConsumer;

.field private final mInputConsumerController:Lcom/android/systemui/shared/system/InputConsumerController;

.field private mOnTouchDownCallback:Ljava/lang/Runnable;

.field private final mRotationSupplier:Ljava/util/function/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Supplier<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mTouchInProgress:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/function/Supplier;Lcom/android/systemui/shared/system/InputConsumerController;Ljava/lang/Runnable;Ljava/util/function/Supplier;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/android/systemui/shared/system/InputConsumerController;",
            "Ljava/lang/Runnable;",
            "Ljava/util/function/Supplier<",
            "Lcom/android/quickstep/InputConsumer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mDestroyed:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mTouchInProgress:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mDestroyPending:Z

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mRotationSupplier:Ljava/util/function/Supplier;

    .line 14
    .line 15
    iput-object p3, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mInputConsumerController:Lcom/android/systemui/shared/system/InputConsumerController;

    .line 16
    .line 17
    iput-object p4, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mOnTouchDownCallback:Ljava/lang/Runnable;

    .line 18
    .line 19
    iput-object p5, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mConsumerSupplier:Ljava/util/function/Supplier;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/InputConsumerProxy;Landroid/view/InputEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/InputConsumerProxy;->onInputConsumerEvent(Landroid/view/InputEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private initInputConsumerIfNeeded(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mInputConsumer:Lcom/android/quickstep/InputConsumer;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mOnTouchDownCallback:Ljava/lang/Runnable;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mConsumerSupplier:Ljava/util/function/Supplier;

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/android/quickstep/InputConsumer;

    .line 21
    .line 22
    iput-object p1, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mInputConsumer:Lcom/android/quickstep/InputConsumer;

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    iput-object p1, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mConsumerSupplier:Ljava/util/function/Supplier;

    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method private onInputConsumerEvent(Landroid/view/InputEvent;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Landroid/view/MotionEvent;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    check-cast p1, Landroid/view/MotionEvent;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/16 v2, 0x9

    .line 13
    .line 14
    if-eq v0, v2, :cond_1

    .line 15
    .line 16
    const/4 v2, 0x7

    .line 17
    if-eq v0, v2, :cond_1

    .line 18
    .line 19
    const/16 v2, 0xa

    .line 20
    .line 21
    if-ne v0, v2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/InputConsumerProxy;->onInputConsumerMotionEvent(Landroid/view/MotionEvent;)Z

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/InputConsumerProxy;->onInputConsumerHoverEvent(Landroid/view/MotionEvent;)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_2
    instance-of v0, p1, Landroid/view/KeyEvent;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-direct {p0, v1}, Lcom/android/quickstep/util/InputConsumerProxy;->initInputConsumerIfNeeded(Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mInputConsumer:Lcom/android/quickstep/InputConsumer;

    .line 40
    .line 41
    check-cast p1, Landroid/view/KeyEvent;

    .line 42
    .line 43
    invoke-interface {p0, p1}, Lcom/android/quickstep/InputConsumer;->onKeyEvent(Landroid/view/KeyEvent;)V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_3
    :goto_1
    return v1
.end method

.method private onInputConsumerHoverEvent(Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/InputConsumerProxy;->initInputConsumerIfNeeded(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mInputConsumer:Lcom/android/quickstep/InputConsumer;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mContext:Landroid/content/Context;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/quickstep/SimpleOrientationTouchTransformer;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mRotationSupplier:Ljava/util/function/Supplier;

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ljava/lang/Integer;

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {v0, p1, v1}, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->transform(Landroid/view/MotionEvent;I)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mInputConsumer:Lcom/android/quickstep/InputConsumer;

    .line 43
    .line 44
    invoke-interface {p0, p1}, Lcom/android/quickstep/InputConsumer;->onHoverEvent(Landroid/view/MotionEvent;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method private onInputConsumerMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mTouchInProgress:Z

    .line 6
    .line 7
    const-string v2, "InputConsumerProxy"

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance p0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string p1, "Received non-down motion before down motion: "

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return v3

    .line 35
    :cond_0
    if-eqz v1, :cond_1

    .line 36
    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    const-string p0, "Received down motion while touch was already in progress"

    .line 40
    .line 41
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return v3

    .line 45
    :cond_1
    sget-object v1, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mContext:Landroid/content/Context;

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/android/quickstep/SimpleOrientationTouchTransformer;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mRotationSupplier:Ljava/util/function/Supplier;

    .line 56
    .line 57
    invoke-interface {v2}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Ljava/lang/Integer;

    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSurfaceRotation()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    const/4 v5, 0x1

    .line 72
    if-eq v2, v4, :cond_2

    .line 73
    .line 74
    move v4, v5

    .line 75
    goto :goto_0

    .line 76
    :cond_2
    move v4, v3

    .line 77
    :goto_0
    if-nez v0, :cond_4

    .line 78
    .line 79
    iput-boolean v5, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mTouchInProgress:Z

    .line 80
    .line 81
    if-eqz v4, :cond_3

    .line 82
    .line 83
    invoke-virtual {v1, v2}, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->updateTouchingOrientation(I)V

    .line 84
    .line 85
    .line 86
    :cond_3
    invoke-direct {p0, v5}, Lcom/android/quickstep/util/InputConsumerProxy;->initInputConsumerIfNeeded(Z)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_4
    const/4 v6, 0x3

    .line 91
    if-eq v0, v6, :cond_5

    .line 92
    .line 93
    if-ne v0, v5, :cond_6

    .line 94
    .line 95
    :cond_5
    iput-boolean v3, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mTouchInProgress:Z

    .line 96
    .line 97
    invoke-virtual {v1}, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->clearTouchingOrientation()V

    .line 98
    .line 99
    .line 100
    iget-boolean v0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mDestroyPending:Z

    .line 101
    .line 102
    if-eqz v0, :cond_6

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputConsumerProxy;->destroy()V

    .line 105
    .line 106
    .line 107
    :cond_6
    :goto_1
    iget-object v0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mInputConsumer:Lcom/android/quickstep/InputConsumer;

    .line 108
    .line 109
    if-eqz v0, :cond_8

    .line 110
    .line 111
    if-eqz v4, :cond_7

    .line 112
    .line 113
    invoke-virtual {v1, p1, v2}, Lcom/android/quickstep/SimpleOrientationTouchTransformer;->transform(Landroid/view/MotionEvent;I)V

    .line 114
    .line 115
    .line 116
    :cond_7
    iget-object p0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mInputConsumer:Lcom/android/quickstep/InputConsumer;

    .line 117
    .line 118
    invoke-interface {p0, p1}, Lcom/android/quickstep/InputConsumer;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 119
    .line 120
    .line 121
    :cond_8
    return v5
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mTouchInProgress:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mDestroyPending:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mDestroyPending:Z

    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mDestroyed:Z

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mInputConsumerController:Lcom/android/systemui/shared/system/InputConsumerController;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Lcom/android/systemui/shared/system/InputConsumerController;->setInputListener(Lcom/android/systemui/shared/system/InputConsumerController$InputListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public enable()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mDestroyed:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mInputConsumerController:Lcom/android/systemui/shared/system/InputConsumerController;

    .line 7
    .line 8
    new-instance v1, Lcom/android/quickstep/util/m0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/m0;-><init>(Lcom/android/quickstep/util/InputConsumerProxy;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/systemui/shared/system/InputConsumerController;->setInputListener(Lcom/android/systemui/shared/system/InputConsumerController$InputListener;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public unregisterOnTouchDownCallback()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/util/InputConsumerProxy;->mOnTouchDownCallback:Ljava/lang/Runnable;

    .line 3
    .line 4
    return-void
.end method
