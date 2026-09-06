.class Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AssistantInputConsumer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->onMotionEvent(Landroid/view/MotionEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;


# direct methods
.method constructor <init>(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;->c(Lcom/android/quickstep/inputconsumers/AssistantInputConsumer;)Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->onAssistantProgress(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
