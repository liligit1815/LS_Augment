.class public final Lcom/android/quickstep/inputconsumers/ResetGestureInputConsumer;
.super Ljava/lang/Object;
.source "ResetGestureInputConsumer.kt"

# interfaces
.implements Lcom/android/quickstep/InputConsumer;


# instance fields
.field private final activityContextSupplier:Ljava/util/function/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Supplier<",
            "Lcom/android/launcher3/taskbar/I1;",
            ">;"
        }
    .end annotation
.end field

.field private final displayId:I

.field private final taskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;


# direct methods
.method public constructor <init>(ILcom/android/quickstep/TaskAnimationManager;Ljava/util/function/Supplier;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/android/quickstep/TaskAnimationManager;",
            "Ljava/util/function/Supplier<",
            "Lcom/android/launcher3/taskbar/I1;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "taskAnimationManager"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "activityContextSupplier"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput p1, p0, Lcom/android/quickstep/inputconsumers/ResetGestureInputConsumer;->displayId:I

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/ResetGestureInputConsumer;->taskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 17
    .line 18
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/ResetGestureInputConsumer;->activityContextSupplier:Ljava/util/function/Supplier;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public getDisplayId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/inputconsumers/ResetGestureInputConsumer;->displayId:I

    .line 2
    .line 3
    return p0
.end method

.method public getType()I
    .locals 0

    .line 1
    const/16 p0, 0x100

    .line 2
    .line 3
    return p0
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    const-string v0, "ev"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/ResetGestureInputConsumer;->taskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/ResetGestureInputConsumer;->activityContextSupplier:Ljava/util/function/Supplier;

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/android/launcher3/taskbar/I1;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/ResetGestureInputConsumer;->taskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->U0()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p1, 0x0

    .line 41
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(Z)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method
