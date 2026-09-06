.class Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "AssistantInputConsumer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AssistantGestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;


# direct methods
.method private constructor <init>(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;->this$0:Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;Lcom/android/quickstep/inputconsumers/d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;-><init>(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)V

    return-void
.end method


# virtual methods
.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;->this$0:Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;

    .line 2
    .line 3
    neg-float p2, p4

    .line 4
    invoke-static {p1, p3, p2}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->h(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;FF)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;->this$0:Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->d(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)F

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;->this$0:Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;

    .line 17
    .line 18
    invoke-static {p2}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->e(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)F

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    cmpl-float p1, p1, p2

    .line 23
    .line 24
    if-ltz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;->this$0:Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->f(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;->this$0:Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;

    .line 35
    .line 36
    iget p2, p1, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 37
    .line 38
    const/4 v0, 0x2

    .line 39
    if-eq p2, v0, :cond_0

    .line 40
    .line 41
    const/high16 p2, 0x3f800000    # 1.0f

    .line 42
    .line 43
    invoke-static {p1, p2}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->g(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;F)V

    .line 44
    .line 45
    .line 46
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 47
    .line 48
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;->this$0:Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;

    .line 49
    .line 50
    invoke-static {p2}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->c(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lcom/android/quickstep/SystemUiProxy;

    .line 59
    .line 60
    mul-float/2addr p3, p3

    .line 61
    mul-float/2addr p4, p4

    .line 62
    add-float/2addr p3, p4

    .line 63
    float-to-double p2, p3

    .line 64
    invoke-static {p2, p3}, Ljava/lang/Math;->sqrt(D)D

    .line 65
    .line 66
    .line 67
    move-result-wide p2

    .line 68
    double-to-float p2, p2

    .line 69
    invoke-virtual {p1, p2}, Lcom/android/quickstep/SystemUiProxy;->onAssistantGestureCompletion(F)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$AssistantGestureListener;->this$0:Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;

    .line 73
    .line 74
    invoke-static {p0}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->i(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)V

    .line 75
    .line 76
    .line 77
    :cond_0
    const/4 p0, 0x1

    .line 78
    return p0
.end method
