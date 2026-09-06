.class Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$1;
.super Ljava/lang/Object;
.source "OtherActivityInputConsumer.java"

# interfaces
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->startTouchTrackingForWindowAnimation(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;


# direct methods
.method constructor <init>(Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onRecentsAnimationCanceled(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->c(Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownAndUpEvent()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public onRecentsAnimationFinished(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->c(Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$1;->this$0:Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownAndUpEvent()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
