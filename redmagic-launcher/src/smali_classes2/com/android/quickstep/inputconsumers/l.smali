.class public final synthetic Lcom/android/quickstep/inputconsumers/l;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/RecentsAnimationController;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/l;->g:Lcom/android/quickstep/RecentsAnimationController;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/l;->g:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$FinishImmediatelyHandler;->a(Lcom/android/quickstep/RecentsAnimationController;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
