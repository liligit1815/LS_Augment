.class public final synthetic Lcom/android/quickstep/R2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/RecentsAnimationCallbacks;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/R2;->a:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/R2;->a:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 2
    .line 3
    check-cast p1, Lcom/android/quickstep/RecentsAnimationController;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/quickstep/RecentsAnimationCallbacks;->c(Lcom/android/quickstep/RecentsAnimationCallbacks;Lcom/android/quickstep/RecentsAnimationController;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
