.class public Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;
.super Ljava/lang/Object;
.source "ScreenPinnedInputConsumer.java"

# interfaces
.implements Lcom/android/quickstep/InputConsumer;


# static fields
.field private static final TAG:Ljava/lang/String; = "ScreenPinnedConsumer"


# instance fields
.field private final mDisplayId:I

.field private final mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

.field private final mMotionPauseMinDisplacement:F

.field private mTouchDownY:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/GestureState;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->mDisplayId:I

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const v1, 0x7f070852

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->mMotionPauseMinDisplacement:F

    .line 22
    .line 23
    new-instance v0, Lcom/android/quickstep/util/MotionPauseDetector;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-direct {v0, p1, v1}, Lcom/android/quickstep/util/MotionPauseDetector;-><init>(Landroid/content/Context;Z)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 30
    .line 31
    new-instance v1, Lcom/android/quickstep/inputconsumers/p;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1, p2}, Lcom/android/quickstep/inputconsumers/p;-><init>(Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;Landroid/content/Context;Lcom/android/quickstep/GestureState;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/MotionPauseDetector;->setOnMotionPauseListener(Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;Landroid/content/Context;Lcom/android/quickstep/GestureState;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->lambda$new$0(Landroid/content/Context;Lcom/android/quickstep/GestureState;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$0(Landroid/content/Context;Lcom/android/quickstep/GestureState;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/android/quickstep/SystemUiProxy;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/quickstep/SystemUiProxy;->stopScreenPinning()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getRootView()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 p2, 0x0

    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p1, p2, v0}, Landroid/view/View;->performHapticFeedback(II)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public getDisplayId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->mDisplayId:I

    .line 2
    .line 3
    return p0
.end method

.method public getType()I
    .locals 0

    .line 1
    const/16 p0, 0x40

    .line 2
    .line 3
    return p0
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_3

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-eq v1, v2, :cond_2

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    if-eq v1, v3, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x3

    .line 18
    if-eq v1, p1, :cond_2

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget v1, p0, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->mTouchDownY:F

    .line 22
    .line 23
    sub-float/2addr v1, v0

    .line 24
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 25
    .line 26
    iget v3, p0, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->mMotionPauseMinDisplacement:F

    .line 27
    .line 28
    cmpg-float v1, v1, v3

    .line 29
    .line 30
    if-gez v1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v2, 0x0

    .line 34
    :goto_0
    invoke-virtual {v0, v2}, Lcom/android/quickstep/util/MotionPauseDetector;->setDisallowPause(Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/MotionPauseDetector;->addPosition(Landroid/view/MotionEvent;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    iput v0, p0, Lcom/android/quickstep/inputconsumers/ScreenPinnedInputConsumer;->mTouchDownY:F

    .line 50
    .line 51
    return-void
.end method
