.class Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "BaseWindowInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->createBackgroundToOverviewAnim(Lcom/android/quickstep/fallback/window/RecentsWindowManager;Lcom/android/launcher3/anim/V;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;


# direct methods
.method constructor <init>(Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$2;->this$1:Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory$2;->this$1:Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/BaseWindowInterface$DefaultAnimationFactory;->this$0:Lcom/android/quickstep/BaseWindowInterface;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/o4;->N(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
